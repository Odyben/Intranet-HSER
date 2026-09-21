<?php
// Penghantaran Individu — notifikasi emel kepada lebih ramai staf daripada
// NOTIF_HAD_SEKALI_GUS. Setiap staf menerima emel sendiri, satu demi satu,
// dan pelayar memanggil endpoint ini berulang kali (satu emel setiap
// permintaan) supaya tiada permintaan yang menghampiri had masa PHP.
//
//   GET  ?senarai            sejarah penghantaran
//   GET  ?id=N               butiran + status setiap penerima
//   GET  ?id=N&belum_terima  emel penerima yang belum terima (untuk hantar semula)
//   POST action=cipta        (multipart) sediakan penghantaran, BELUM hantar apa-apa
//   POST action=pratonton    hantar satu salinan kepada admin sendiri
//   POST action=hantar       hantar kepada SATU penerima seterusnya
//   POST action=semak_bounce baca notis bounce dari peti emel sistem
//   POST action=jeda         jeda penghantaran
//   POST action=buka_semula  benarkan penerima yang disekat dicuba semula
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
require_once 'mailer.php';
require_once 'email_content.php';
require_once 'notifikasi_kempen_lib.php';
require_once 'imap_bounce.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('notifikasi');
// Pelayar memanggil endpoint ini berpuluh kali semasa menghantar. Kunci fail
// sesi PHP dilepaskan supaya halaman admin lain tidak tersekat menunggu;
// $_SESSION masih boleh dibaca selepas ini (untuk audit log).
session_write_close();

$conn = getDbConnection();
pastikanSkemaNotifikasi($conn);
header('Content-Type: application/json');

function ambilKempen($conn, $id) {
    $stmt = $conn->prepare("SELECT * FROM notifikasi_kempen WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $kempen = $stmt->get_result()->fetch_assoc();
    $stmt->close();
    return $kempen;
}

function ringkasanKempen($conn, $k) {
    return [
        'id'               => (int)$k['id'],
        'tajuk'            => $k['tajuk'],
        'status'           => $k['status'],
        'status_label'     => KEMPEN_STATUS_LABEL[$k['status']] ?? $k['status'],
        'sebab_henti'      => $k['sebab_henti'],
        'sumber_kempen_id' => $k['sumber_kempen_id'] !== null ? (int)$k['sumber_kempen_id'] : null,
        'dicipta_oleh'     => $k['dicipta_oleh'],
        'dicipta_pada'     => $k['dicipta_pada'],
        'mula_hantar'      => $k['mula_hantar'],
        'selesai_pada'     => $k['selesai_pada'],
        'semakan_bounce'   => $k['semakan_bounce'],
        // Rekod lama (diimport) tiada kandungan tersimpan, jadi tidak boleh dihantar
        'boleh_hantar'     => $k['kandungan_html'] !== null,
        'kiraan'           => kiraanPenerimaKempen($conn, (int)$k['id']),
    ];
}

function imejKempen($k) {
    $senarai = [];
    foreach (json_decode($k['imej_json'] ?? '[]', true) ?: [] as $img) {
        $senarai[] = [
            'path' => folderImejKempen($k['id']) . '/' . basename($img['fail']),
            'cid'  => $img['cid'],
            'name' => $img['name'],
            'type' => $img['type'],
        ];
    }
    return $senarai;
}

function kemaskiniStatusKempen($conn, $id, $status, $sebab = null) {
    $stmt = $conn->prepare("UPDATE notifikasi_kempen SET status = ?, sebab_henti = ? WHERE id = ?");
    $stmt->bind_param("ssi", $status, $sebab, $id);
    $stmt->execute();
    $stmt->close();
}

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (!isset($_GET['id'])) {
            $result = $conn->query("SELECT * FROM notifikasi_kempen ORDER BY id DESC LIMIT 30");
            $senarai = [];
            while ($k = $result->fetch_assoc()) $senarai[] = ringkasanKempen($conn, $k);
            echo json_encode(['kempen' => $senarai]);
            break;
        }

        $k = ambilKempen($conn, (int)$_GET['id']);
        if (!$k) die(json_encode(["error" => "Penghantaran tidak dijumpai"]));

        if (isset($_GET['belum_terima'])) {
            // Hanya staf yang emelnya masih sah dalam direktori — alamat yang
            // sudah ditanda tidak wujud perlu dibetulkan dahulu di Kakitangan.
            $stmt = $conn->prepare("SELECT DISTINCT p.emel FROM notifikasi_penerima p
                JOIN staff s ON s.emel_rasmi = p.emel
                WHERE p.kempen_id = ? AND p.status IN ('belum', 'disekat', 'gagal')
                  AND (s.emel_status IS NULL OR s.emel_status <> 'tidak_wujud')
                ORDER BY p.id");
            $stmt->bind_param("i", $k['id']);
            $stmt->execute();
            $res = $stmt->get_result();
            $emel = [];
            while ($row = $res->fetch_assoc()) $emel[] = $row['emel'];
            $stmt->close();
            echo json_encode(['emel' => $emel]);
            break;
        }

        $data = ringkasanKempen($conn, $k);
        $stmt = $conn->prepare("SELECT emel, nama, status, dihantar_pada, ralat FROM notifikasi_penerima WHERE kempen_id = ? ORDER BY id");
        $stmt->bind_param("i", $k['id']);
        $stmt->execute();
        $res = $stmt->get_result();
        $data['penerima'] = [];
        while ($row = $res->fetch_assoc()) $data['penerima'][] = $row;
        $stmt->close();
        echo json_encode($data);
        break;

    case 'POST':
        // "cipta" dihantar sebagai multipart kerana mesej boleh membawa gambar
        // yang besar; tindakan lain ringkas dan dihantar sebagai JSON.
        if (isset($_POST['action'])) {
            $input = $_POST;
        } else {
            if (empty($_POST) && (int)($_SERVER['CONTENT_LENGTH'] ?? 0) > 0 && stripos($_SERVER['CONTENT_TYPE'] ?? '', 'multipart') !== false) {
                die(json_encode(["error" => "Mesej terlalu besar untuk dihantar (had pelayan: " . ini_get('post_max_size') . ")."]));
            }
            $input = jsonInput();
        }
        $action = $input['action'] ?? '';
        $id = (int)($input['id'] ?? 0);

        // ---------------------------------------------------------------
        if ($action === 'cipta') {
            set_time_limit(60);
            $subject = trim($input['subject'] ?? '');
            $messageHtml = trim($input['message'] ?? '');
            $requestedEmails = isset($input['recipients']) && is_array($input['recipients']) ? $input['recipients'] : [];
            $sumberId = !empty($input['sumber_kempen_id']) ? (int)$input['sumber_kempen_id'] : null;

            // Lampiran yang sama dihantar kepada setiap staf satu per satu
            // menjadikan setiap emel besar — itulah antara punca Gmail
            // menyekat penghantaran 11 Sept. Dokumen patut dikongsi sebagai pautan.
            if (!empty($_FILES['attachments']['name']) && array_filter((array)$_FILES['attachments']['name'])) {
                die(json_encode(["error" => "Lampiran tidak dibenarkan untuk penghantaran kepada lebih " . NOTIF_HAD_SEKALI_GUS . " staf. Letak dokumen dalam intranet dan kongsi pautannya dalam mesej."]));
            }
            if (!empty($input['cc']) && array_filter((array)$input['cc'])) {
                die(json_encode(["error" => "Cc tidak digunakan dalam penghantaran individu — setiap Cc akan menerima satu salinan bagi setiap staf. Masukkan mereka sebagai penerima biasa."]));
            }

            $adaTeks = trim(strip_tags(str_replace(['<br>', '<br/>', '<br />'], ' ', $messageHtml))) !== '';
            $adaImej = stripos($messageHtml, '<img') !== false;
            if (!$subject || (!$adaTeks && !$adaImej)) {
                die(json_encode(["error" => "Sila isi tajuk dan mesej"]));
            }

            $sah = senaraiPenerimaSah($conn);
            $recipients = [];
            foreach ($requestedEmails as $email) {
                if (isset($sah[$email]) && !isset($recipients[$email])) $recipients[$email] = $sah[$email];
            }
            if (empty($recipients)) {
                die(json_encode(["error" => "Tiada penerima sah dipilih"]));
            }

            $bersih = sanitizeEmailHtml($messageHtml, $embedded);
            if ($bersih['error']) die(json_encode(["error" => $bersih['error']]));
            if (trim(strip_tags($bersih['html'], '<img>')) === '' && stripos($bersih['html'], '<img') === false) {
                die(json_encode(["error" => "Mesej kosong selepas ditapis. Sila taip mesej atau tampal gambar semula."]));
            }
            foreach ($embedded as $img) {
                if (strlen($img['data']) > KEMPEN_MAX_IMEJ_BYTES) {
                    die(json_encode(["error" => "Satu gambar bersaiz " . round(strlen($img['data']) / 1024) . " KB — terlalu besar untuk dihantar kepada ramai staf (had " . round(KEMPEN_MAX_IMEJ_BYTES / 1024) . " KB). Buang gambar itu dan sisip semula supaya ia dimampatkan secara automatik."]));
                }
            }
            if ($bersih['bytes'] > KEMPEN_MAX_JUMLAH_BYTES) {
                die(json_encode(["error" => "Jumlah saiz gambar " . round($bersih['bytes'] / 1024) . " KB melebihi had " . round(KEMPEN_MAX_JUMLAH_BYTES / 1024) . " KB untuk penghantaran individu. Kurangkan bilangan gambar."]));
            }

            $kini = date('Y-m-d H:i:s');
            $oleh = $_SESSION['user_email'] ?? null;
            $kandungan = wrapEmailTemplate($subject, $bersih['html']);

            $conn->begin_transaction();
            $stmt = $conn->prepare("INSERT INTO notifikasi_kempen (tajuk, kandungan_html, status, sumber_kempen_id, dicipta_oleh, dicipta_pada) VALUES (?, ?, 'draf', ?, ?, ?)");
            $stmt->bind_param("ssiss", $subject, $kandungan, $sumberId, $oleh, $kini);
            $stmt->execute();
            $kempenId = (int)$stmt->insert_id;
            $stmt->close();

            $imejMeta = [];
            if ($embedded) {
                sediakanFolderStorage();
                $folder = folderImejKempen($kempenId);
                if (!is_dir($folder)) mkdir($folder, 0755, true);
                foreach ($embedded as $img) {
                    $fail = basename($img['name']);
                    if (file_put_contents($folder . '/' . $fail, $img['data']) === false) {
                        $conn->rollback();
                        die(json_encode(["error" => "Gagal menyimpan gambar mesej di pelayan"]));
                    }
                    $imejMeta[] = ['fail' => $fail, 'cid' => $img['cid'], 'name' => $img['name'], 'type' => $img['type']];
                }
                $imejJson = json_encode($imejMeta);
                $stmt = $conn->prepare("UPDATE notifikasi_kempen SET imej_json = ? WHERE id = ?");
                $stmt->bind_param("si", $imejJson, $kempenId);
                $stmt->execute();
                $stmt->close();
            }

            $stmt = $conn->prepare("INSERT INTO notifikasi_penerima (kempen_id, emel, nama) VALUES (?, ?, ?)");
            foreach ($recipients as $email => $name) {
                $stmt->bind_param("iss", $kempenId, $email, $name);
                $stmt->execute();
            }
            $stmt->close();
            $conn->commit();

            logAudit($conn, 'create', 'notifikasi', 'Menyediakan penghantaran individu #' . $kempenId . ' "' . $subject . '" kepada ' . count($recipients) . ' staf' . ($sumberId ? ' (hantar semula dari #' . $sumberId . ')' : '') . ($embedded ? ', ' . count($embedded) . ' imej ' . round($bersih['bytes'] / 1024) . ' KB' : ''));
            echo json_encode(["success" => true, "id" => $kempenId, "bil_penerima" => count($recipients)]);
            break;
        }

        // Semua tindakan lain berkenaan satu penghantaran sedia ada
        $k = $id ? ambilKempen($conn, $id) : null;
        if (!$k) die(json_encode(["error" => "Penghantaran tidak dijumpai"]));

        // ---------------------------------------------------------------
        if ($action === 'pratonton') {
            set_time_limit(60);
            if ($k['kandungan_html'] === null) die(json_encode(["error" => "Rekod lama ini tiada kandungan tersimpan"]));
            $emelSaya = $_SESSION['user_email'] ?? '';
            $hasil = hantarEmelIndividu($emelSaya, $_SESSION['user_name'] ?? '', '[PRATONTON] ' . $k['tajuk'], $k['kandungan_html'], imejKempen($k));
            if (!$hasil['success']) die(json_encode(["error" => "Gagal menghantar pratonton: " . $hasil['error']]));
            logAudit($conn, 'create', 'notifikasi', 'Menghantar pratonton penghantaran individu #' . $k['id'] . ' kepada ' . $emelSaya);
            echo json_encode(["success" => true, "message" => "Pratonton dihantar ke " . $emelSaya]);
            break;
        }

        // ---------------------------------------------------------------
        if ($action === 'hantar') {
            set_time_limit(90);
            if ($k['kandungan_html'] === null) die(json_encode(["error" => "Rekod lama ini tidak boleh dihantar. Guna \"Pilih yang belum terima\" untuk sediakan penghantaran baharu.", "berhenti" => true]));
            if (!in_array($k['status'], ['draf', 'menghantar', 'dijeda'], true)) {
                die(json_encode(["error" => "Penghantaran ini berstatus " . (KEMPEN_STATUS_LABEL[$k['status']] ?? $k['status']) . ".", "berhenti" => true]));
            }

            // Kunci per penghantaran: dua tab yang menekan "Teruskan" serentak
            // tidak boleh menghantar kepada staf yang sama dua kali.
            $kunci = 'notif_kempen_' . (int)$k['id'];
            $dapat = $conn->query("SELECT GET_LOCK('$kunci', 0) AS ok")->fetch_assoc();
            if ((int)$dapat['ok'] !== 1) {
                die(json_encode(["sibuk" => true, "error" => "Penghantaran ini sedang dijalankan dari tetingkap atau komputer lain.", "berhenti" => true]));
            }

            // Kita memegang kunci, jadi baris "menghantar" yang ada ialah sisa
            // permintaan yang mati di tengah penghantaran. Emel itu mungkin
            // sudah sampai — jangan hantar semula secara automatik.
            $stmt = $conn->prepare("UPDATE notifikasi_penerima SET status = 'gagal', ralat = 'Terputus semasa dihantar — tidak pasti sama ada emel sampai.' WHERE kempen_id = ? AND status = 'menghantar'");
            $stmt->bind_param("i", $k['id']);
            $stmt->execute();
            $stmt->close();

            $stmt = $conn->prepare("SELECT MAX(dihantar_pada) AS akhir FROM notifikasi_penerima WHERE kempen_id = ?");
            $stmt->bind_param("i", $k['id']);
            $stmt->execute();
            $akhir = $stmt->get_result()->fetch_assoc()['akhir'];
            $stmt->close();
            if ($akhir && time() - strtotime($akhir) < KEMPEN_JARAK_MIN_SAAT) {
                $conn->query("SELECT RELEASE_LOCK('$kunci')");
                die(json_encode(["tunggu" => KEMPEN_JARAK_MIN_SAAT - (time() - strtotime($akhir))]));
            }

            $stmt = $conn->prepare("SELECT p.id, p.emel, p.nama, s.emel_status FROM notifikasi_penerima p
                LEFT JOIN staff s ON s.emel_rasmi = p.emel
                WHERE p.kempen_id = ? AND p.status = 'belum' ORDER BY p.id LIMIT 1");
            $stmt->bind_param("i", $k['id']);
            $stmt->execute();
            $p = $stmt->get_result()->fetch_assoc();
            $stmt->close();

            if (!$p) {
                $conn->query("SELECT RELEASE_LOCK('$kunci')");
                die(json_encode(["habis" => true, "kiraan" => kiraanPenerimaKempen($conn, (int)$k['id'])]));
            }

            // Alamat mungkin ditanda tidak wujud selepas penghantaran ini
            // disediakan (contohnya dari bounce penghantaran lain).
            if ($p['emel_status'] === 'tidak_wujud') {
                $stmt = $conn->prepare("UPDATE notifikasi_penerima SET status = 'tidak_wujud', ralat = 'Dilangkau — emel sudah ditanda tidak wujud dalam Direktori Kakitangan' WHERE id = ?");
                $stmt->bind_param("i", $p['id']);
                $stmt->execute();
                $stmt->close();
                $conn->query("SELECT RELEASE_LOCK('$kunci')");
                die(json_encode(["success" => true, "dilangkau" => true,
                    "penerima" => ['emel' => $p['emel'], 'nama' => $p['nama'], 'status' => 'tidak_wujud'],
                    "kiraan" => kiraanPenerimaKempen($conn, (int)$k['id'])]));
            }

            $kini = date('Y-m-d H:i:s');
            $stmt = $conn->prepare("UPDATE notifikasi_penerima SET status = 'menghantar' WHERE id = ?");
            $stmt->bind_param("i", $p['id']);
            $stmt->execute();
            $stmt->close();
            if ($k['mula_hantar'] === null) {
                $kiraan = kiraanPenerimaKempen($conn, (int)$k['id']);
                logAudit($conn, 'create', 'notifikasi', 'Mula menghantar penghantaran individu #' . $k['id'] . ' "' . $k['tajuk'] . '" kepada ' . $kiraan['jumlah'] . ' staf');
            }
            $stmt = $conn->prepare("UPDATE notifikasi_kempen SET status = 'menghantar', sebab_henti = NULL, mula_hantar = IFNULL(mula_hantar, ?), aktiviti_terakhir = ? WHERE id = ?");
            $stmt->bind_param("ssi", $kini, $kini, $k['id']);
            $stmt->execute();
            $stmt->close();

            $hasil = hantarEmelIndividu($p['emel'], $p['nama'], $k['tajuk'], $k['kandungan_html'], imejKempen($k));

            $berhenti = false;
            $sebab = null;
            $kini = date('Y-m-d H:i:s');
            if ($hasil['success']) {
                $status = 'dihantar';
                $stmt = $conn->prepare("UPDATE notifikasi_penerima SET status = 'dihantar', message_id = ?, dihantar_pada = ?, ralat = NULL WHERE id = ?");
                $stmt->bind_param("ssi", $hasil['message_id'], $kini, $p['id']);
            } elseif ($hasil['alamat_tidak_sah']) {
                $status = 'gagal';
                $ralat = substr('Format alamat tidak sah: ' . $hasil['error'], 0, 1000);
                $stmt = $conn->prepare("UPDATE notifikasi_penerima SET status = 'gagal', ralat = ? WHERE id = ?");
                $stmt->bind_param("si", $ralat, $p['id']);
            } else {
                // Gmail tidak menerima emel ini langsung (sambungan, had harian,
                // atau sekatan). Penerima dikembalikan ke "belum" dan penghantaran
                // dijeda — meneruskan hanya akan menambah kegagalan.
                $status = 'belum';
                $berhenti = true;
                $sebab = substr('Pelayan emel menolak penghantaran: ' . $hasil['error'], 0, 1000);
                $stmt = $conn->prepare("UPDATE notifikasi_penerima SET status = 'belum', ralat = ? WHERE id = ?");
                $stmt->bind_param("si", $sebab, $p['id']);
            }
            $stmt->execute();
            $stmt->close();

            if ($berhenti) {
                kemaskiniStatusKempen($conn, (int)$k['id'], 'dijeda', $sebab);
                logAudit($conn, 'update', 'notifikasi', 'Penghantaran individu #' . $k['id'] . ' dijeda secara automatik: ' . $sebab);
            }
            $stmt = $conn->prepare("UPDATE notifikasi_kempen SET aktiviti_terakhir = ? WHERE id = ?");
            $stmt->bind_param("si", $kini, $k['id']);
            $stmt->execute();
            $stmt->close();
            $conn->query("SELECT RELEASE_LOCK('$kunci')");

            echo json_encode([
                "success"  => !$berhenti,
                "penerima" => ['emel' => $p['emel'], 'nama' => $p['nama'], 'status' => $status],
                "berhenti" => $berhenti,
                "sebab"    => $sebab,
                "kiraan"   => kiraanPenerimaKempen($conn, (int)$k['id']),
            ]);
            break;
        }

        // ---------------------------------------------------------------
        if ($action === 'semak_bounce') {
            set_time_limit(120);
            if ($k['mula_hantar'] === null) {
                echo json_encode(["success" => true, "baru" => [], "berhenti" => false, "kiraan" => kiraanPenerimaKempen($conn, (int)$k['id'])]);
                break;
            }

            $imap = imapBounceSejak(substr($k['mula_hantar'], 0, 10));
            if ($imap['error']) {
                // Tanpa semakan bounce, sekatan Gmail tidak dapat dikesan
                // (11 Sept: Gmail terima semua batch, kemudian bounce).
                // Lebih selamat berhenti daripada terus menghantar tanpa tahu.
                $sebab = 'Semakan bounce gagal: ' . $imap['error'];
                if (in_array($k['status'], ['draf', 'menghantar'], true)) {
                    kemaskiniStatusKempen($conn, (int)$k['id'], 'dijeda', $sebab);
                }
                die(json_encode(["error" => $sebab, "berhenti" => true, "kiraan" => kiraanPenerimaKempen($conn, (int)$k['id'])]));
            }

            $stmt = $conn->prepare("SELECT id, emel, nama, status, message_id FROM notifikasi_penerima WHERE kempen_id = ? AND message_id IS NOT NULL");
            $stmt->bind_param("i", $k['id']);
            $stmt->execute();
            $res = $stmt->get_result();
            // Dikunci ikut Message-ID DAN emel: setiap emel individu ada ID
            // sendiri, tetapi rekod lama (batch BCC) berkongsi satu ID untuk
            // ramai penerima.
            $ikutMid = [];
            while ($row = $res->fetch_assoc()) $ikutMid[$row['message_id']][strtolower($row['emel'])] = $row;
            $stmt->close();

            $baru = [];
            $sekatan = null;
            $notaStaf = 'Tidak wujud menurut pelayan emel MOH (bounce ' . date('j/n/Y') . ', penghantaran #' . $k['id'] . ')';
            foreach ($imap['bounces'] as $b) {
                $row = null;
                foreach ($b['rujukan'] as $mid) {
                    if (isset($ikutMid[$mid][$b['emel']])) { $row = $ikutMid[$mid][$b['emel']]; break; }
                }
                // Bounce untuk emel lain, atau sudah diproses dalam semakan lepas
                if (!$row || $row['status'] !== 'dihantar') continue;

                $jenis = kelaskanBounce($b['status'], $b['diagnostik']);
                $ralat = substr(trim($b['status'] . ' ' . $b['diagnostik']), 0, 1000);
                $stmt = $conn->prepare("UPDATE notifikasi_penerima SET status = ?, ralat = ? WHERE id = ?");
                $stmt->bind_param("ssi", $jenis, $ralat, $row['id']);
                $stmt->execute();
                $stmt->close();
                $ikutMid[$row['message_id']][strtolower($row['emel'])]['status'] = $jenis;
                $baru[] = ['emel' => $row['emel'], 'nama' => $row['nama'], 'status' => $jenis, 'ralat' => $ralat];

                if ($jenis === 'tidak_wujud') {
                    $stmt = $conn->prepare("UPDATE staff SET emel_status = 'tidak_wujud', emel_status_nota = ? WHERE emel_rasmi = ?");
                    $stmt->bind_param("ss", $notaStaf, $row['emel']);
                    $stmt->execute();
                    $stmt->close();
                } elseif ($jenis === 'disekat') {
                    $sekatan = $ralat;
                }
            }

            $kini = date('Y-m-d H:i:s');
            $stmt = $conn->prepare("UPDATE notifikasi_kempen SET semakan_bounce = ? WHERE id = ?");
            $stmt->bind_param("si", $kini, $k['id']);
            $stmt->execute();
            $stmt->close();

            $berhenti = false;
            $sebab = null;
            $statusKini = $k['status'];
            if ($sekatan && in_array($k['status'], ['draf', 'menghantar', 'dijeda'], true)) {
                $berhenti = true;
                $sebab = 'Gmail menyekat emel (' . $sekatan . '). Penghantaran dihentikan secara automatik supaya akaun tidak disekat lebih teruk. Tunggu sekurang-kurangnya 24 jam sebelum cuba semula.';
                $statusKini = 'dihentikan';
                kemaskiniStatusKempen($conn, (int)$k['id'], 'dihentikan', $sebab);
                logAudit($conn, 'update', 'notifikasi', 'Penghantaran individu #' . $k['id'] . ' dihentikan secara automatik: Gmail menyekat emel');
            }

            $kiraan = kiraanPenerimaKempen($conn, (int)$k['id']);
            if (!empty($input['akhir']) && !$berhenti && $kiraan['belum'] === 0 && $kiraan['menghantar'] === 0
                && in_array($k['status'], ['menghantar', 'dijeda'], true)) {
                $statusKini = 'selesai';
                $stmt = $conn->prepare("UPDATE notifikasi_kempen SET status = 'selesai', selesai_pada = ?, sebab_henti = NULL WHERE id = ?");
                $stmt->bind_param("si", $kini, $k['id']);
                $stmt->execute();
                $stmt->close();
                logAudit($conn, 'create', 'notifikasi', 'Penghantaran individu #' . $k['id'] . ' "' . $k['tajuk'] . '" selesai: ' . $kiraan['dihantar'] . ' dihantar, ' . $kiraan['tidak_wujud'] . ' emel tidak wujud, ' . $kiraan['disekat'] . ' disekat, ' . $kiraan['gagal'] . ' gagal');
            }

            echo json_encode(["success" => true, "baru" => $baru, "berhenti" => $berhenti, "sebab" => $sebab, "status" => $statusKini, "kiraan" => $kiraan]);
            break;
        }

        // ---------------------------------------------------------------
        if ($action === 'jeda') {
            if (in_array($k['status'], ['draf', 'menghantar'], true)) {
                kemaskiniStatusKempen($conn, (int)$k['id'], 'dijeda', $input['sebab'] ?? null);
            }
            echo json_encode(["success" => true]);
            break;
        }

        // ---------------------------------------------------------------
        if ($action === 'buka_semula') {
            if ($k['status'] !== 'dihentikan' || $k['kandungan_html'] === null) {
                die(json_encode(["error" => "Hanya penghantaran yang dihentikan boleh dibuka semula"]));
            }
            $stmt = $conn->prepare("UPDATE notifikasi_penerima SET status = 'belum', ralat = NULL WHERE kempen_id = ? AND status = 'disekat'");
            $stmt->bind_param("i", $k['id']);
            $stmt->execute();
            $bil = $stmt->affected_rows;
            $stmt->close();
            kemaskiniStatusKempen($conn, (int)$k['id'], 'dijeda', null);
            logAudit($conn, 'update', 'notifikasi', 'Membuka semula penghantaran individu #' . $k['id'] . ' (' . $bil . ' penerima yang disekat akan dicuba semula)');
            echo json_encode(["success" => true, "message" => $bil . " penerima akan dicuba semula"]);
            break;
        }

        die(json_encode(["error" => "Tindakan tidak dikenali"]));
}

$conn->close();
?>
