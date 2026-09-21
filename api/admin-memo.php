<?php
// Memo — pengurusan oleh admin (modul 'memo').
//
//   GET  (tiada id)        senarai semua memo + bilangan staf yang telah membuka
//   GET  ?id=N&pembuka=1   senarai staf yang membuka memo N (dari Log Audit)
//   POST multipart         tambah / kemas kini memo (id, tajuk, no_rujukan,
//                          tarikh_surat, daripada, jenis, keterangan, fail)
//   POST JSON              {action: 'papar', id, dipapar} | {action: 'padam', id}
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
require_once 'memo_lib.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('memo');
$conn = getDbConnection();
pastikanSkemaMemo($conn);

header('Content-Type: application/json');

function ambilMemo($conn, $id) {
    $stmt = $conn->prepare("SELECT * FROM memo WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $row = $stmt->get_result()->fetch_assoc();
    $stmt->close();
    return $row;
}

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET['id'])) {
            $m = ambilMemo($conn, (int)$_GET['id']);
            if (!$m) die(json_encode(["error" => "Memo tidak dijumpai"]));
            $awalan = awalanAuditMemo($m['id']) . '%';
            $stmt = $conn->prepare("SELECT user_email, MAX(user_name) AS user_name, COUNT(*) AS kali, MIN(created_at) AS pertama, MAX(created_at) AS terakhir
                FROM audit_log WHERE module = 'memo' AND action = 'view' AND description LIKE ?
                GROUP BY user_email ORDER BY terakhir DESC");
            $stmt->bind_param("s", $awalan);
            $stmt->execute();
            $pembuka = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
            echo json_encode(['memo' => ['id' => $m['id'], 'tajuk' => $m['tajuk']], 'pembuka' => $pembuka]);
            break;
        }

        $res = $conn->query("SELECT m.*,
                (SELECT COUNT(DISTINCT a.user_email) FROM audit_log a
                 WHERE a.module = 'memo' AND a.action = 'view' AND a.description LIKE CONCAT('Membuka memo #', m.id, ':%')) AS bil_dibuka
            FROM memo m ORDER BY m.tarikh_surat DESC, m.id DESC");
        $data = [];
        while ($row = $res->fetch_assoc()) {
            unset($row['fail_simpan']); // nama fail dalam storan tidak perlu keluar dari pelayan
            $row['saiz'] = saizMesra((int)$row['fail_saiz']);
            $data[] = $row;
        }
        $jenis = MEMO_JENIS_LALAI;
        $daripada = [];
        foreach ($data as $m) {
            if ($m['jenis'] !== '' && !in_array($m['jenis'], $jenis, true)) $jenis[] = $m['jenis'];
            if ($m['daripada'] && !in_array($m['daripada'], $daripada, true)) $daripada[] = $m['daripada'];
        }
        echo json_encode(['data' => $data, 'jenis' => $jenis, 'daripada' => $daripada]);
        break;

    case 'POST':
        // Tambah / kemas kini dihantar sebagai multipart kerana membawa fail
        if (!empty($_POST)) {
            $id = (int)($_POST['id'] ?? 0);
            $tajuk = trim($_POST['tajuk'] ?? '');
            $noRujukan = trim($_POST['no_rujukan'] ?? '');
            $tarikh = trim($_POST['tarikh_surat'] ?? '');
            $daripada = trim($_POST['daripada'] ?? '');
            $jenis = trim($_POST['jenis'] ?? '') ?: 'Memo';
            $keterangan = trim($_POST['keterangan'] ?? '');

            if ($tajuk === '') die(json_encode(["error" => "Sila isi perkara memo"]));
            if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $tarikh) || !checkdate((int)substr($tarikh, 5, 2), (int)substr($tarikh, 8, 2), (int)substr($tarikh, 0, 4))) {
                die(json_encode(["error" => "Sila pilih tarikh surat yang sah"]));
            }

            $lama = $id ? ambilMemo($conn, $id) : null;
            if ($id && !$lama) die(json_encode(["error" => "Memo tidak dijumpai"]));

            $failBaru = null;
            $adaFail = !empty($_FILES['fail']) && $_FILES['fail']['error'] !== UPLOAD_ERR_NO_FILE;
            if ($adaFail) {
                if ($_FILES['fail']['error'] !== UPLOAD_ERR_OK) die(json_encode(["error" => "Gagal memuat naik fail"]));
                $ext = strtolower(pathinfo($_FILES['fail']['name'], PATHINFO_EXTENSION));
                if (!isset(MEMO_JENIS_FAIL[$ext])) die(json_encode(["error" => "Jenis fail tidak dibenarkan. Guna PDF, JPG, PNG, DOC atau DOCX."]));
                if ($_FILES['fail']['size'] > MEMO_MAX_BYTES) die(json_encode(["error" => "Fail melebihi " . round(MEMO_MAX_BYTES / 1048576) . "MB"]));
                sediakanFolderMemo();
                $simpan = 'memo_' . time() . '_' . bin2hex(random_bytes(6)) . '.' . $ext;
                if (!move_uploaded_file($_FILES['fail']['tmp_name'], MEMO_DIR . $simpan)) die(json_encode(["error" => "Gagal menyimpan fail"]));
                $failBaru = [
                    'simpan' => $simpan,
                    'nama'   => mb_substr(basename(str_replace('\\', '/', $_FILES['fail']['name'])), 0, 255),
                    'jenis'  => $ext,
                    'saiz'   => (int)$_FILES['fail']['size'],
                ];
            } elseif (!$id) {
                die(json_encode(["error" => "Sila pilih fail memo"]));
            }

            if ($id) {
                $f = $failBaru ?: ['simpan' => $lama['fail_simpan'], 'nama' => $lama['fail_nama'], 'jenis' => $lama['fail_jenis'], 'saiz' => (int)$lama['fail_saiz']];
                $stmt = $conn->prepare("UPDATE memo SET tajuk=?, no_rujukan=?, tarikh_surat=?, daripada=?, jenis=?, keterangan=?, fail_simpan=?, fail_nama=?, fail_jenis=?, fail_saiz=? WHERE id=?");
                $stmt->bind_param("sssssssssii", $tajuk, $noRujukan, $tarikh, $daripada, $jenis, $keterangan, $f['simpan'], $f['nama'], $f['jenis'], $f['saiz'], $id);
                $stmt->execute();
                $stmt->close();
                if ($failBaru) @unlink(MEMO_DIR . basename($lama['fail_simpan']));
                logAudit($conn, 'update', 'memo', 'Mengemaskini memo #' . $id . ': ' . $tajuk . ($failBaru ? ' (fail diganti)' : ''));
                echo json_encode(["success" => true, "id" => $id, "message" => "Memo dikemas kini"]);
            } else {
                $oleh = $_SESSION['user_email'] ?? null;
                $kini = date('Y-m-d H:i:s');
                $stmt = $conn->prepare("INSERT INTO memo (tajuk, no_rujukan, tarikh_surat, daripada, jenis, keterangan, fail_simpan, fail_nama, fail_jenis, fail_saiz, dimuat_naik_oleh, dicipta_pada)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                $stmt->bind_param("sssssssssiss", $tajuk, $noRujukan, $tarikh, $daripada, $jenis, $keterangan, $failBaru['simpan'], $failBaru['nama'], $failBaru['jenis'], $failBaru['saiz'], $oleh, $kini);
                $stmt->execute();
                $id = (int)$stmt->insert_id;
                $stmt->close();
                logAudit($conn, 'create', 'memo', 'Menambah memo #' . $id . ': ' . $tajuk);
                echo json_encode(["success" => true, "id" => $id, "message" => "Memo ditambah dan dipaparkan kepada staf"]);
            }
            break;
        }

        if (stripos($_SERVER['CONTENT_TYPE'] ?? '', 'multipart') !== false) {
            // Muatan melebihi post_max_size — PHP membuang $_POST tanpa amaran
            die(json_encode(["error" => "Fail terlalu besar untuk dimuat naik (had pelayan: " . ini_get('post_max_size') . ")"]));
        }
        $input = jsonInput();
        $action = $input['action'] ?? '';
        $m = ambilMemo($conn, (int)($input['id'] ?? 0));
        if (!$m) die(json_encode(["error" => "Memo tidak dijumpai"]));

        if ($action === 'papar') {
            $dipapar = !empty($input['dipapar']) ? 1 : 0;
            $stmt = $conn->prepare("UPDATE memo SET dipapar = ? WHERE id = ?");
            $stmt->bind_param("ii", $dipapar, $m['id']);
            $stmt->execute();
            $stmt->close();
            logAudit($conn, 'update', 'memo', ($dipapar ? 'Memaparkan' : 'Menyembunyikan') . ' memo #' . $m['id'] . ': ' . $m['tajuk']);
            echo json_encode(["success" => true, "message" => $dipapar ? "Memo dipaparkan kepada staf" : "Memo disembunyikan dari staf"]);
            break;
        }

        if ($action === 'padam') {
            $stmt = $conn->prepare("DELETE FROM memo WHERE id = ?");
            $stmt->bind_param("i", $m['id']);
            $stmt->execute();
            $stmt->close();
            @unlink(MEMO_DIR . basename($m['fail_simpan']));
            logAudit($conn, 'delete', 'memo', 'Memadam memo #' . $m['id'] . ': ' . $m['tajuk']);
            echo json_encode(["success" => true, "message" => "Memo dipadam"]);
            break;
        }

        die(json_encode(["error" => "Tindakan tidak dikenali"]));
}

$conn->close();
?>
