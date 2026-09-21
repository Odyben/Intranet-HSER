<?php
// Membaca notis bounce ("Mail Delivery Subsystem") dari peti emel sistem
// melalui IMAP, supaya penghantaran individu tahu alamat mana yang tidak
// wujud dan bila Gmail mula menyekat.
//
// BACA SAHAJA: peti dibuka dengan EXAMINE dan kandungan diambil dengan
// BODY.PEEK — tiada emel ditanda dibaca, dipindah atau dipadam.
//
// Tiada sambungan PHP imap dalam XAMPP ini, jadi protokol IMAP dituturkan
// terus melalui soket TLS (cukup untuk LOGIN/LIST/EXAMINE/SEARCH/FETCH).
require_once __DIR__ . '/mail_config.php';

class ImapBaca {
    private $fp;
    private $tag = 0;

    public function __construct($host, $user, $pass) {
        $this->fp = @stream_socket_client('ssl://' . $host . ':993', $errno, $errstr, 20);
        if (!$this->fp) throw new Exception("Gagal sambung ke $host: $errstr");
        stream_set_timeout($this->fp, 30);
        fgets($this->fp); // salam pelayan
        $this->arahan('LOGIN ' . $this->petik($user) . ' ' . $this->petik($pass));
    }

    public function petik($s) {
        return '"' . addcslashes($s, '"\\') . '"';
    }

    // Menghantar satu arahan dan memulangkan keseluruhan respons, termasuk
    // literal {n} (kandungan header/badan emel datang dalam bentuk ini).
    public function arahan($arahan) {
        $tag = 'A' . (++$this->tag);
        fwrite($this->fp, "$tag $arahan\r\n");
        $resp = '';
        while (true) {
            $baris = fgets($this->fp);
            if ($baris === false) throw new Exception('Sambungan IMAP terputus');
            $resp .= $baris;
            while (preg_match('/\{(\d+)\}\r\n$/', $baris, $m)) {
                $panjang = (int)$m[1];
                $data = '';
                while (strlen($data) < $panjang) {
                    $cebisan = fread($this->fp, $panjang - strlen($data));
                    if ($cebisan === false || $cebisan === '') throw new Exception('Gagal membaca data IMAP');
                    $data .= $cebisan;
                }
                $resp .= $data;
                $baris = fgets($this->fp);
                $resp .= $baris;
            }
            if (strpos($baris, "$tag ") === 0) {
                if (!preg_match("/^$tag OK/", $baris)) {
                    throw new Exception('IMAP: ' . trim(substr($baris, strlen($tag) + 1)));
                }
                return $resp;
            }
        }
    }

    // UID FETCH untuk banyak mesej dalam satu permintaan. Setiap satu
    // dipulangkan sebagai ['uid' => int, 'item' => ['BODY[...]' => data]].
    // Respons dibaca secara berurutan mengikut panjang literal, jadi teks
    // dalam kandungan emel tidak boleh disalah anggap sebagai respons baharu.
    public function ambilBanyak($uids, $item) {
        $tag = 'A' . (++$this->tag);
        fwrite($this->fp, "$tag UID FETCH " . implode(',', $uids) . " ($item)\r\n");
        $mesej = [];
        $semasa = null;
        while (true) {
            $baris = fgets($this->fp);
            if ($baris === false) throw new Exception('Sambungan IMAP terputus');
            if (strpos($baris, "$tag ") === 0) {
                if ($semasa) $mesej[] = $semasa;
                if (!preg_match("/^$tag OK/", $baris)) {
                    throw new Exception('IMAP: ' . trim(substr($baris, strlen($tag) + 1)));
                }
                return array_map(function ($m) {
                    return ['uid' => preg_match('/\bUID (\d+)/', $m['meta'], $u) ? (int)$u[1] : 0, 'item' => $m['item']];
                }, $mesej);
            }
            if (preg_match('/^\* \d+ FETCH /', $baris)) {
                if ($semasa) $mesej[] = $semasa;
                $semasa = ['meta' => '', 'item' => []];
            }
            if ($semasa === null) continue; // respons lain seperti "* OK"
            while (preg_match('/^(.*?)(BODY\[[^\]]*\](?:<\d+>)?)\s*\{(\d+)\}\r\n$/s', $baris, $m)) {
                $semasa['meta'] .= $m[1];
                $panjang = (int)$m[3];
                $data = '';
                while (strlen($data) < $panjang) {
                    $cebisan = fread($this->fp, $panjang - strlen($data));
                    if ($cebisan === false || $cebisan === '') throw new Exception('Gagal membaca data IMAP');
                    $data .= $cebisan;
                }
                $semasa['item'][strtoupper($m[2])] = $data;
                $baris = fgets($this->fp);
                if ($baris === false) throw new Exception('Sambungan IMAP terputus');
            }
            $semasa['meta'] .= $baris;
        }
    }

    public static function literal($resp) {
        if (!preg_match('/\{(\d+)\}\r\n/', $resp, $m, PREG_OFFSET_CAPTURE)) return '';
        return substr($resp, $m[0][1] + strlen($m[0][0]), (int)$m[1][0]);
    }

    public function tutup() {
        try { $this->arahan('LOGOUT'); } catch (Exception $e) { /* sudah terputus */ }
        fclose($this->fp);
    }
}

function imapNilaiHeader($headers, $nama) {
    $headers = preg_replace("/\r?\n[ \t]+/", ' ', $headers);
    if (!preg_match('/^' . preg_quote($nama, '/') . ':\s*(.*?)\r?$/mi', $headers, $m)) return '';
    return trim($m[1]);
}

/**
 * Semua notis bounce yang diterima sejak tarikh tertentu.
 *
 * @param  string $sejak  tarikh 'Y-m-d'
 * @return array  ['error' => string|null, 'bounces' => [[
 *                   'rujukan'    => [Message-ID emel asal, ...],
 *                   'emel'       => alamat yang gagal,
 *                   'status'     => cth "5.7.1",
 *                   'diagnostik' => respons pelayan,
 *               ], ...]]
 */
function imapBounceSejak($sejak) {
    if (!SMTP_USERNAME || !SMTP_PASSWORD) {
        return ['error' => 'Akaun emel sistem belum ditetapkan', 'bounces' => []];
    }
    $bounces = [];
    try {
        $imap = new ImapBaca('imap.gmail.com', SMTP_USERNAME, SMTP_PASSWORD);

        // "All Mail" dicari melalui bendera \All kerana namanya berubah
        // mengikut bahasa akaun Gmail; bounce yang sudah diarkib masih ada di situ.
        $list = $imap->arahan('LIST "" "*"');
        $peti = preg_match('/^\* LIST \([^)]*\\\\All[^)]*\) "[^"]*" (.+?)\r?$/mi', $list, $m) ? trim($m[1]) : 'INBOX';
        $imap->arahan('EXAMINE ' . $peti);

        // SINCE hanya ikut tarikh (tanpa masa) — mundur sehari supaya perbezaan
        // zon masa pelayan Gmail tidak tertinggal bounce awal pagi.
        $tarikh = date('d-M-Y', strtotime($sejak . ' -1 day'));
        $cari = $imap->arahan('UID SEARCH SINCE ' . $tarikh . ' FROM "mailer-daemon"');
        $uids = preg_match('/^\* SEARCH([\d ]*)\r?$/m', $cari, $m)
            ? array_filter(array_map('intval', explode(' ', trim($m[1]))))
            : [];

        // Notis bounce Gmail ialah multipart/report: bahagian 2 ialah
        // message/delivery-status (±600 bait) yang mengandungi alamat, kod
        // status dan respons sebenar pelayan penerima. Hanya bahagian itu dan
        // header rujukan diambil, 50 mesej setiap permintaan — mengambil badan
        // penuh satu demi satu mengambil ~100 saat untuk 119 bounce.
        $senarai = [];
        foreach (array_chunk($uids, 50) as $kumpulan) {
            $senarai = array_merge($senarai, $imap->ambilBanyak($kumpulan,
                'UID BODY.PEEK[HEADER.FIELDS (IN-REPLY-TO REFERENCES X-FAILED-RECIPIENTS)] BODY.PEEK[2]'));
        }

        foreach ($senarai as $msg) {
            $h = '';
            $badan = '';
            foreach ($msg['item'] as $nama => $data) {
                if (strpos($nama, 'BODY[HEADER') === 0) $h = $data;
                elseif (strpos($nama, 'BODY[2]') === 0) $badan = $data;
            }
            $badan = preg_replace("/\r?\n[ \t]+/", ' ', str_replace("\r", '', $badan));

            preg_match_all('/<[^<>\s]+>/', imapNilaiHeader($h, 'In-Reply-To') . ' ' . imapNilaiHeader($h, 'References')
                . (preg_match('/^X-Original-Message-ID:\s*(.+)$/mi', $badan, $om) ? ' ' . $om[1] : ''), $mm);
            $rujukan = array_values(array_unique($mm[0]));

            $jumpa = false;
            foreach (preg_split("/\n\s*\n/", $badan) as $blok) {
                if (!preg_match('/^Final-Recipient:\s*(?:rfc822;)?\s*(\S+)/mi', $blok, $fr)) continue;
                preg_match('/^Action:\s*(\S+)/mi', $blok, $ac);
                if (isset($ac[1]) && strtolower($ac[1]) !== 'failed') continue; // "delayed" belum muktamad
                preg_match('/^Status:\s*(\S+)/mi', $blok, $st);
                preg_match('/^Diagnostic-Code:\s*(.+)$/mi', $blok, $dc);
                $bounces[] = [
                    'rujukan'    => $rujukan,
                    'emel'       => strtolower(trim($fr[1], '<>')),
                    'status'     => $st[1] ?? '',
                    'diagnostik' => trim($dc[1] ?? ''),
                ];
                $jumpa = true;
            }
            // Tiada bahagian delivery-status langsung — guna header. (Kalau ada
            // tetapi semuanya "delayed", jangan anggap gagal.)
            if (!$jumpa && !preg_match('/^Final-Recipient:/mi', $badan) && ($gagal = imapNilaiHeader($h, 'X-Failed-Recipients')) !== '') {
                foreach (explode(',', $gagal) as $emel) {
                    $bounces[] = ['rujukan' => $rujukan, 'emel' => strtolower(trim($emel)), 'status' => '', 'diagnostik' => ''];
                }
            }
        }
        $imap->tutup();
    } catch (Exception $e) {
        return ['error' => $e->getMessage(), 'bounces' => $bounces];
    }
    return ['error' => null, 'bounces' => $bounces];
}
?>
