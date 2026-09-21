<?php
// Notifikasi Emel — lets an admin compose a one-off broadcast (important
// announcement, system maintenance notice, etc.) and send it by email to
// every staff member who has a real @moh.gov.my address on file, without
// needing to publish a Berita post first.
//
// This endpoint only sends to up to NOTIF_HAD_SEKALI_GUS people in a single
// message (everyone visible in To:). Anything larger goes through
// admin-notifikasi-kempen.php, which sends one email per staff member with
// per-recipient tracking — see notifikasi_kempen_lib.php for why.
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
require_once 'mailer.php';
require_once 'email_content.php';
require_once 'notifikasi_kempen_lib.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('notifikasi');
$conn = getDbConnection();
pastikanSkemaNotifikasi($conn);

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        // Full picker list (name + email) so the admin can choose specific
        // recipients instead of always broadcasting to everyone.
        $recipients = [];
        foreach (senaraiPenerimaSah($conn) as $email => $name) {
            $recipients[] = ['name' => $name, 'email' => $email];
        }
        // Staf yang emelnya dilaporkan tidak wujud tidak boleh dipilih, tetapi
        // disenaraikan supaya admin tahu siapa yang tertinggal dan kenapa.
        $result = $conn->query("SELECT nama_penuh, emel_rasmi, emel_status_nota FROM staff WHERE emel_rasmi LIKE '%@moh.gov.my' AND emel_status = 'tidak_wujud' ORDER BY nama_penuh ASC");
        $excluded = [];
        while ($row = $result->fetch_assoc()) {
            $excluded[] = ['name' => $row['nama_penuh'], 'email' => $row['emel_rasmi'], 'nota' => $row['emel_status_nota']];
        }
        echo json_encode(['recipientCount' => count($recipients), 'recipients' => $recipients,
                          'excluded' => $excluded, 'visibleLimit' => NOTIF_HAD_SEKALI_GUS]);
        break;

    case 'POST':
        // A broadcast this size can take a while over SMTP — the default 30s
        // PHP limit is comfortably enough for one BCC transaction, but this
        // gives it headroom rather than risking a false "failed" on a slow link.
        set_time_limit(120);

        // Bila muatan melebihi post_max_size, PHP membuang $_POST dan $_FILES
        // tanpa sebarang amaran. Tanpa semakan ini ia muncul sebagai "Sila isi
        // tajuk dan mesej" walaupun borang sebenarnya penuh diisi.
        if (empty($_POST) && (int)($_SERVER['CONTENT_LENGTH'] ?? 0) > 0) {
            die(json_encode(["error" => "Emel terlalu besar untuk dihantar (had pelayan: " . ini_get('post_max_size') . "). Kurangkan saiz lampiran atau gambar."]));
        }

        // Borang ini dihantar sebagai multipart (bukan JSON) kerana ia boleh
        // membawa fail lampiran. Medan tatasusunan dihantar sebagai
        // recipients[] / cc[].
        $subject = trim($_POST['subject'] ?? '');
        $messageHtml = trim($_POST['message'] ?? '');
        $requestedEmails = isset($_POST['recipients']) && is_array($_POST['recipients']) ? $_POST['recipients'] : null;
        $requestedCc = isset($_POST['cc']) && is_array($_POST['cc']) ? $_POST['cc'] : [];

        // Mesej datang dari ruangan rich-text, jadi ia mungkin mengandungi
        // markup kosong seperti "<br>" atau "<div></div>" sahaja. Periksa
        // kandungan teks/imej sebenar, bukan panjang HTML mentah.
        $adaTeks = trim(strip_tags(str_replace(['<br>', '<br/>', '<br />'], ' ', $messageHtml))) !== '';
        $adaImej = stripos($messageHtml, '<img') !== false;
        if (!$subject || (!$adaTeks && !$adaImej)) {
            die(json_encode(["error" => "Sila isi tajuk dan mesej"]));
        }

        // email => name, source of truth so a tampered request can't smuggle
        // in an outside address (or one already known not to exist)
        $validRecipients = senaraiPenerimaSah($conn);

        if ($requestedEmails !== null) {
            $recipients = [];
            foreach ($requestedEmails as $email) {
                if (isset($validRecipients[$email])) {
                    $recipients[] = ['email' => $email, 'name' => $validRecipients[$email]];
                }
            }
        } else {
            $recipients = [];
            foreach ($validRecipients as $email => $name) {
                $recipients[] = ['email' => $email, 'name' => $name];
            }
        }

        if (empty($recipients)) {
            die(json_encode(["error" => "Tiada penerima sah dipilih"]));
        }
        // Siaran BCC pukal kepada 153 staf pada 11 Sept disekat Gmail selepas
        // batch ke-2, tanpa rekod siapa yang terima. Penerima yang ramai mesti
        // melalui penghantaran individu.
        if (count($recipients) > NOTIF_HAD_SEKALI_GUS) {
            die(json_encode(["error" => "Lebih " . NOTIF_HAD_SEKALI_GUS . " penerima mesti dihantar melalui Penghantaran Individu. Muat semula halaman dan cuba lagi."]));
        }

        // Cc is checked against the same staff list as the main recipients, so
        // the hospital mailbox can't be used to reach an outside address by
        // tampering with the request. An unknown address is reported by name
        // rather than silently dropped, so the admin knows why it went missing.
        $recipientEmails = array_flip(array_column($recipients, 'email'));
        $cc = [];
        $ccSeen = [];
        foreach ($requestedCc as $email) {
            $email = trim($email);
            if ($email === '') continue;
            if (!isset($validRecipients[$email])) {
                die(json_encode(["error" => "Alamat Cc tidak sah atau tiada dalam Direktori Kakitangan: " . $email]));
            }
            if (isset($recipientEmails[$email])) continue; // sudah jadi penerima utama
            if (isset($ccSeen[$email])) continue;          // pendua dalam senarai Cc
            $ccSeen[$email] = true;
            $cc[] = ['email' => $email, 'name' => $validRecipients[$email]];
        }

        // Tapis HTML dan tukar gambar yang ditampal (data: URI) kepada imej
        // terbenam CID — Gmail menyekat <img src="data:">, jadi poster yang
        // ditampal takkan kelihatan kalau dihantar begitu sahaja.
        $bersih = sanitizeEmailHtml($messageHtml, $embedded);
        if ($bersih['error']) {
            die(json_encode(["error" => $bersih['error']]));
        }
        $bodyHtml = $bersih['html'];
        if (trim(strip_tags($bodyHtml, '<img>')) === '' && stripos($bodyHtml, '<img') === false) {
            die(json_encode(["error" => "Mesej kosong selepas ditapis. Sila taip mesej atau tampal gambar semula."]));
        }

        $lampiran = collectEmailAttachments('attachments', $bersih['bytes']);
        if ($lampiran['error']) {
            die(json_encode(["error" => $lampiran['error']]));
        }

        $sendResult = sendBroadcast($recipients, $subject, wrapEmailTemplate($subject, $bodyHtml), [
            'visibleLimit' => NOTIF_HAD_SEKALI_GUS,
            'cc'          => $cc,
            'embedded'    => $embedded,
            'attachments' => $lampiran['files'],
        ]);

        if ($sendResult['success']) {
            $ccNote = $cc ? ', Cc: ' . count($cc) : '';
            $lampNote = $lampiran['files'] ? ', ' . count($lampiran['files']) . ' lampiran' : '';
            $imejNote = $embedded ? ', ' . count($embedded) . ' imej' : '';
            logAudit($conn, 'create', 'notifikasi', 'Menghantar notifikasi emel "' . $subject . '" kepada ' . $sendResult['sent'] . ' staf' . $ccNote . $lampNote . $imejNote . (!empty($sendResult['failed']) ? ' (' . $sendResult['failed'] . ' gagal)' : ''));
            $msg = "Emel berjaya dihantar kepada " . $sendResult['sent'] . " staf";
            if ($cc) $msg .= " (+" . count($cc) . " Cc)";
            if ($lampiran['files']) $msg .= ", " . count($lampiran['files']) . " lampiran";
            if (!empty($sendResult['failed'])) $msg .= ", " . $sendResult['failed'] . " gagal (semak log ralat)";
            echo json_encode([
                "success" => true,
                "message" => $msg,
                "sent"    => $sendResult['sent'],
                "mode"    => $sendResult['mode'] ?? 'visible'
            ]);
        } else {
            echo json_encode(["error" => $sendResult['error'] ?? "Gagal menghantar emel"]);
        }
        break;
}

$conn->close();
?>
