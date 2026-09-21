<?php
// Thin wrapper around PHPMailer so the rest of the app just calls sendMail()
// without touching SMTP details directly.
require_once __DIR__ . '/mail_config.php';
require_once __DIR__ . '/PHPMailer/Exception.php';
require_once __DIR__ . '/PHPMailer/PHPMailer.php';
require_once __DIR__ . '/PHPMailer/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception as PHPMailerException;

// Sends one HTML email. Returns true/false — never throws, since a failed
// notification (e.g. SMTP not configured yet, recipient typo) must never
// break the action that triggered it, like approving a booking.
function sendMail($toEmail, $toName, $subject, $htmlBody) {
    if (!SMTP_USERNAME || !SMTP_PASSWORD) {
        error_log("sendMail skipped for $toEmail — SMTP not configured yet (see api/mail_config.php)");
        return false;
    }

    $mail = new PHPMailer(true);
    try {
        $mail->isSMTP();
        $mail->Host = SMTP_HOST;
        $mail->SMTPAuth = true;
        $mail->Username = SMTP_USERNAME;
        $mail->Password = SMTP_PASSWORD;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = SMTP_PORT;
        $mail->CharSet = 'UTF-8';

        $mail->setFrom(SMTP_FROM_EMAIL ?: SMTP_USERNAME, SMTP_FROM_NAME);
        $mail->addAddress($toEmail, $toName);
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body = $htmlBody;
        $mail->AltBody = altBodyDariHtml($htmlBody);

        $mail->send();
        return true;
    } catch (PHPMailerException $e) {
        error_log("sendMail failed for $toEmail: " . $mail->ErrorInfo);
        return false;
    }
}

// Sends to many people at once via BCC, split into small batches — used for
// staff-wide broadcasts (announcements, maintenance notices). One giant BCC
// with 150+ addresses gets rejected by Gmail ("too many recipients"),
// especially on a newly-created account still in its trust warm-up period,
// so this keeps each individual send well under that ceiling. Re-uses the
// same SMTP connection across batches instead of reconnecting each time.
// Delivers one message to many people, in one of two modes depending on how
// many recipients there are:
//
//   VISIBLE (default, up to $visibleLimit people) — every recipient goes in
//   the To: header, so each person opening the mail can see exactly who else
//   received it. This is what an admin normally wants when writing to a
//   handful of named staff.
//
//   HIDDEN (above the limit) — falls back to BCC batching. Two reasons: a
//   150-address To: header exposes the whole staff mailing list to every
//   single reader, and Gmail rejects messages carrying that many visible
//   recipients outright. Batching also keeps one SMTP connection alive
//   rather than reconnecting per chunk.
//
// $options accepts:
//   'cc'           => [['email' => .., 'name' => ..], ...]  extra Cc addresses
//   'visibleLimit' => int   switch-over point (default 50)
//   'batchSize'    => int   BCC chunk size in hidden mode (default 25)
//
// Returns ['success', 'sent', 'failed', 'mode' => 'visible'|'hidden'].
function sendBroadcast($recipients, $subject, $htmlBody, $options = []) {
    if (!SMTP_USERNAME || !SMTP_PASSWORD) {
        error_log("sendBroadcast skipped — SMTP not configured yet (see api/mail_config.php)");
        return ['success' => false, 'sent' => 0, 'error' => 'SMTP belum ditetapkan'];
    }
    if (empty($recipients)) {
        return ['success' => false, 'sent' => 0, 'error' => 'Tiada penerima'];
    }

    $cc           = isset($options['cc']) && is_array($options['cc']) ? $options['cc'] : [];
    $visibleLimit = isset($options['visibleLimit']) ? (int)$options['visibleLimit'] : 50;
    $batchSize    = isset($options['batchSize']) ? (int)$options['batchSize'] : 25;
    $attachments  = isset($options['attachments']) && is_array($options['attachments']) ? $options['attachments'] : [];
    $embedded     = isset($options['embedded']) && is_array($options['embedded']) ? $options['embedded'] : [];
    $visible      = count($recipients) <= $visibleLimit;

    $mail = new PHPMailer(true);
    $sent = 0;
    $failedBatches = [];
    try {
        $mail->isSMTP();
        $mail->Host = SMTP_HOST;
        $mail->SMTPAuth = true;
        $mail->Username = SMTP_USERNAME;
        $mail->Password = SMTP_PASSWORD;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = SMTP_PORT;
        $mail->CharSet = 'UTF-8';
        $mail->SMTPKeepAlive = true; // reuse the connection across batches

        $mail->setFrom(SMTP_FROM_EMAIL ?: SMTP_USERNAME, SMTP_FROM_NAME);
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body = $htmlBody;
        $mail->AltBody = altBodyDariHtml($htmlBody);

        // Gambar yang ditampal dalam mesej dihantar sebagai imej terbenam
        // (CID) dan bukan data: URI, kerana kebanyakan klien emel termasuk
        // Gmail menyekat atau membuang data: URI dalam <img>.
        foreach ($embedded as $img) {
            $mail->addStringEmbeddedImage(
                $img['data'], $img['cid'], $img['name'] ?? 'imej',
                PHPMailer::ENCODING_BASE64, $img['type'] ?? 'image/png'
            );
        }

        // Lampiran ditambah sekali sahaja di sini — ia kekal merentasi semua
        // kumpulan penghantaran kerana hanya senarai penerima yang dikosongkan
        // dalam gelung di bawah.
        foreach ($attachments as $att) {
            if (!empty($att['path']) && is_readable($att['path'])) {
                $mail->addAttachment($att['path'], $att['name'] ?? basename($att['path']));
            }
        }

        // The system mailbox keeps a copy of every broadcast as proof of
        // delivery. Bcc rather than To/Cc so it never shows up in the
        // recipient list staff actually see.
        $archiveAddress = SMTP_FROM_EMAIL ?: SMTP_USERNAME;

        if ($visible) {
            $mail->clearAllRecipients();
            foreach ($recipients as $r) {
                $mail->addAddress($r['email'], $r['name'] ?? '');
            }
            foreach ($cc as $c) {
                $mail->addCC($c['email'], $c['name'] ?? '');
            }
            $mail->addBCC($archiveAddress, SMTP_FROM_NAME);
            try {
                $mail->send();
                $sent = count($recipients);
            } catch (PHPMailerException $sendError) {
                error_log("sendBroadcast (visible) failed: " . $mail->ErrorInfo);
                $failedBatches[] = $mail->ErrorInfo;
            }
        } else {
            $batches = array_chunk($recipients, $batchSize);
            foreach ($batches as $batch) {
                $mail->clearAllRecipients();
                $mail->addAddress($archiveAddress, SMTP_FROM_NAME); // visible "To" is just the sender
                foreach ($cc as $c) {
                    $mail->addCC($c['email'], $c['name'] ?? '');
                }
                foreach ($batch as $r) {
                    $mail->addBCC($r['email'], $r['name'] ?? '');
                }
                try {
                    $mail->send();
                    $sent += count($batch);
                } catch (PHPMailerException $batchError) {
                    error_log("sendBroadcast batch failed: " . $mail->ErrorInfo);
                    $failedBatches[] = $mail->ErrorInfo;
                }
            }
        }
        $mail->smtpClose();

        if ($sent === 0) {
            return ['success' => false, 'sent' => 0, 'mode' => $visible ? 'visible' : 'hidden',
                    'error' => $failedBatches[0] ?? 'Gagal menghantar emel'];
        }
        return ['success' => true, 'sent' => $sent, 'failed' => count($recipients) - $sent,
                'mode' => $visible ? 'visible' : 'hidden'];
    } catch (PHPMailerException $e) {
        error_log("sendBroadcast failed: " . $mail->ErrorInfo);
        return ['success' => false, 'sent' => $sent, 'error' => $mail->ErrorInfo];
    }
}

// Versi teks biasa emel (untuk klien yang tidak papar HTML). Entiti seperti
// &nbsp; dinyahkod dan ruang dirapatkan — sebelum ini ia keluar sebagai teks
// "&nbsp;&nbsp;" dalam pratonton Gmail.
function altBodyDariHtml($htmlBody) {
    $teks = str_replace(['<br>', '<br/>', '<br />', '</p>', '</div>', '</td>', '</li>'], "\n", $htmlBody);
    $teks = html_entity_decode(strip_tags($teks), ENT_QUOTES | ENT_HTML5, 'UTF-8');
    $teks = preg_replace("/[ \t\x{00A0}]+/u", ' ', $teks);
    $teks = preg_replace("/\s*\n\s*/", "\n", $teks);
    return trim($teks);
}

// Menghantar SATU emel kepada SATU staf — digunakan oleh penghantaran
// individu (admin-notifikasi-kempen.php). Setiap staf menerima emel dengan
// nama mereka sendiri di To:, tanpa senarai BCC pukal, dan Message-ID yang
// dipulangkan membolehkan notis bounce dipadankan semula kepada penerima.
//
// $embedded: [['path', 'cid', 'name', 'type'], ...] gambar yang disimpan
// dalam storan kempen.
//
// Pulangkan ['success', 'message_id', 'error', 'alamat_tidak_sah'].
function hantarEmelIndividu($toEmail, $toName, $subject, $htmlBody, $embedded = []) {
    if (!SMTP_USERNAME || !SMTP_PASSWORD) {
        return ['success' => false, 'error' => 'SMTP belum ditetapkan', 'alamat_tidak_sah' => false];
    }

    $mail = new PHPMailer(true);
    try {
        $mail->isSMTP();
        $mail->Host = SMTP_HOST;
        $mail->SMTPAuth = true;
        $mail->Username = SMTP_USERNAME;
        $mail->Password = SMTP_PASSWORD;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = SMTP_PORT;
        $mail->CharSet = 'UTF-8';
        // Pelayan yang tidak menjawab mesti gagal dengan kemas sebelum had
        // masa PHP, bukan membunuh skrip di tengah jalan seperti 11 Sept.
        $mail->Timeout = 30;

        $mail->setFrom(SMTP_FROM_EMAIL ?: SMTP_USERNAME, SMTP_FROM_NAME);
        try {
            $mail->addAddress($toEmail, $toName);
        } catch (PHPMailerException $e) {
            return ['success' => false, 'error' => $mail->ErrorInfo, 'alamat_tidak_sah' => true];
        }
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body = $htmlBody;
        $mail->AltBody = altBodyDariHtml($htmlBody);

        foreach ($embedded as $img) {
            if (!empty($img['path']) && is_readable($img['path'])) {
                $mail->addEmbeddedImage($img['path'], $img['cid'], $img['name'] ?? 'imej',
                    PHPMailer::ENCODING_BASE64, $img['type'] ?? 'image/jpeg');
            }
        }

        $mail->send();
        return ['success' => true, 'message_id' => $mail->getLastMessageID(), 'alamat_tidak_sah' => false];
    } catch (PHPMailerException $e) {
        error_log("hantarEmelIndividu failed for $toEmail: " . $mail->ErrorInfo);
        return ['success' => false, 'error' => $mail->ErrorInfo, 'alamat_tidak_sah' => false];
    }
}

// Wraps plain content HTML in a branded card so every notification email
// looks consistent, instead of hand-styling each one individually. Built as
// nested tables with inline styles throughout (not <style> blocks or flex/
// grid) — that's the layout Outlook desktop and older webmail clients can
// actually render correctly; a div/flex version looks fine in Gmail but
// silently collapses in Outlook.
//
// Returns a FULL html>head>body document (not a fragment) — the <meta
// color-scheme> tags in <head> are what stop the Gmail app's automatic dark
// mode from "helpfully" re-darkening our white header text against the navy
// background (it can't tell a CSS gradient is already dark, so without this
// hint it sometimes dims the text on top of it into near-illegibility).
// bgcolor attributes are a second, older-client-safe way of saying the same
// thing, since some dark-mode engines only look at bgcolor, not gradients.
function wrapEmailTemplate($title, $bodyHtml) {
    return '<!DOCTYPE html><html><head><meta charset="UTF-8">'
        . '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
        . '<meta name="color-scheme" content="light dark">'
        . '<meta name="supported-color-schemes" content="light dark">'
        . '</head><body style="margin:0; padding:0; background:#eef2f7;">'
        . '<table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:#eef2f7; padding:32px 16px; font-family:Arial,Helvetica,sans-serif;">'
        . '<tr><td align="center">'
        . '<table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="max-width:560px; background:#ffffff; border-radius:10px; overflow:hidden; border:1px solid #dde4ec; box-shadow:0 4px 16px rgba(15,45,80,0.08);">'

        // Header — soft muted gold, not the navy used elsewhere in the
        // system. bgcolor gives dark-mode detectors a solid color to key
        // off; the gradient layers on top of it for capable clients.
        . '<tr><td bgcolor="#c9a45c" style="background:#c9a45c linear-gradient(135deg,#c9a45c,#dcbb78 60%,#e6c98a); padding:26px 28px 22px;">'
        . '<div style="color:#1a1a1a !important; font-size:11px; font-weight:700; letter-spacing:0.14em; text-transform:uppercase; margin-bottom:6px;">Sistem Intranet</div>'
        . '<div style="color:#000000 !important; font-size:19px; font-weight:800; letter-spacing:0.02em;">Hospital Serian</div>'
        . '</td></tr>'
        // Divider — a touch darker than the header so the edge still reads
        // even though header and accent are now close in tone.
        . '<tr><td bgcolor="#a9803c" style="height:3px; line-height:3px; font-size:0; background:#a9803c;">&nbsp;</td></tr>'

        // Body
        . '<tr><td bgcolor="#ffffff" style="background:#ffffff; padding:30px 28px 12px;">'
        . '<table role="presentation" cellpadding="0" cellspacing="0" style="margin-bottom:18px;"><tr>'
        . '<td bgcolor="#c9a04a" style="width:4px; background:#c9a04a; border-radius:2px;">&nbsp;</td>'
        . '<td style="padding-left:12px; color:#0a2647 !important; font-size:19px; font-weight:800; line-height:1.35;">' . htmlspecialchars($title) . '</td>'
        . '</tr></table>'
        . '<div style="font-size:14px; color:#3a4a5c !important; line-height:1.7;">' . $bodyHtml . '</div>'
        . '</td></tr>'

        // Footer
        . '<tr><td bgcolor="#ffffff" style="background:#ffffff; padding:20px 28px 24px;">'
        . '<div style="border-top:1px solid #e7ecf1; padding-top:16px; font-size:11px; color:#94a3b8 !important; line-height:1.7;">'
        . 'This is an automated email from the Hospital Serian Intranet System. Please do not reply to this email.<br>'
        . 'Hospital Serian, Bandar Serian, 94700 Serian, Sarawak, Ministry of Health Malaysia'
        . '</div>'
        . '</td></tr>'

        . '</table>'
        . '</td></tr>'
        . '</table>'
        . '</body></html>';
}
?>
