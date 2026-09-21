<?php
require_once 'db.php';
$conn = getDbConnection();

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        // Staff view: get rooms and bookings
        $action = isset($_GET['action']) ? $_GET['action'] : 'rooms';

        if ($action === 'rooms') {
            $result = $conn->query("SELECT * FROM bilik WHERE aktif = 1 ORDER BY id ASC");
            $data = [];
            while ($row = $result->fetch_assoc()) $data[] = $row;
            echo json_encode(['data' => $data]);

        } elseif ($action === 'schedule') {
            $bilik_id = isset($_GET['bilik_id']) ? (int)$_GET['bilik_id'] : 0;
            $month = isset($_GET['month']) ? (int)$_GET['month'] : (int)date('m');
            $year = isset($_GET['year']) ? (int)$_GET['year'] : (int)date('Y');

            // Shown here: approved bookings (any date), plus still-pending requests
            // whose date has already elapsed — those are treated as "Selesai"
            // everywhere else in the UI, so the room-usage schedule should reflect
            // them too instead of pretending the room sat empty that day. Rejected
            // requests never appear — that slot was never actually used.
            $sql = "SELECT t.*, b.nama as bilik_nama FROM tempahan t LEFT JOIN bilik b ON t.bilik_id = b.id
                    WHERE (t.status = 'approved' OR (t.status = 'pending' AND TIMESTAMP(t.tarikh, COALESCE(t.masa_tamat, ADDTIME(t.masa_mula, '01:00:00'))) < NOW()))
                    AND MONTH(t.tarikh) = ? AND YEAR(t.tarikh) = ?";
            $params = [$month, $year];
            $types = "ii";

            if ($bilik_id > 0) {
                $sql .= " AND t.bilik_id = ?";
                $params[] = $bilik_id;
                $types .= "i";
            }

            $sql .= " ORDER BY t.tarikh ASC, t.masa_mula ASC";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param($types, ...$params);
            $stmt->execute();
            $result = $stmt->get_result();
            $data = [];
            while ($row = $result->fetch_assoc()) $data[] = $row;
            $stmt->close();
            echo json_encode(['data' => $data]);

        } elseif ($action === 'my_bookings') {
            $email = isset($_GET['email']) ? $_GET['email'] : '';
            $sql = "SELECT t.*, b.nama as bilik_nama FROM tempahan t LEFT JOIN bilik b ON t.bilik_id = b.id WHERE t.email_pemohon = ? ORDER BY t.created_at DESC";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();
            $data = [];
            while ($row = $result->fetch_assoc()) $data[] = $row;
            $stmt->close();
            echo json_encode(['data' => $data]);
        }
        break;

    case 'POST':
        $input = json_decode(file_get_contents('php://input'), true);
        if (!$input) die(json_encode(["error" => "Data tidak sah"]));

        $bilik_id = (int)($input['bilik_id'] ?? 0);
        $nama_pemohon = $input['nama_pemohon'] ?? '';
        // Optional — the meeting's actual organizer/chair, when different from
        // whoever is submitting this request (e.g. a secretary booking on
        // someone else's behalf). Falls back to nama_pemohon where displayed.
        $nama_penganjur = !empty($input['nama_penganjur']) ? $input['nama_penganjur'] : null;
        $unit_pemohon = $input['unit_pemohon'] ?? '';
        $email_pemohon = $input['email_pemohon'] ?? '';
        $telefon_pemohon = $input['telefon_pemohon'] ?? '';
        $tujuan = $input['tujuan'] ?? '';
        $tarikh = $input['tarikh'] ?? '';
        $masa_mula = $input['masa_mula'] ?? '';
        $masa_tamat = !empty($input['masa_tamat']) ? $input['masa_tamat'] : null; // empty = "sehingga selesai" (open-ended)
        $bilangan_hadir = $input['bilangan_hadir'] ?? '';
        $keperluan_khas = $input['keperluan_khas'] ?? '';

        // Check for conflict — clashing with an already-approved booking for the
        // same room auto-rejects the request before it ever reaches the DB.
        // Open-ended bookings (masa_tamat NULL, "sehingga selesai") auto-end 2
        // hours after their start instead of running until end-of-day, so the
        // room frees up on its own without anyone needing to stop it manually.
        $masaTamatEffective = $masa_tamat ?? date('H:i:s', strtotime($masa_mula) + 3600);
        $stmtCheck = $conn->prepare("SELECT masa_mula, masa_tamat FROM tempahan WHERE bilik_id = ? AND tarikh = ? AND status = 'approved' AND ((masa_mula < ? AND COALESCE(masa_tamat, ADDTIME(masa_mula, '01:00:00')) > ?) OR (masa_mula < ? AND COALESCE(masa_tamat, ADDTIME(masa_mula, '01:00:00')) > ?) OR (masa_mula >= ? AND COALESCE(masa_tamat, ADDTIME(masa_mula, '01:00:00')) <= ?)) LIMIT 1");
        $stmtCheck->bind_param("isssssss",
            $bilik_id, $tarikh,
            $masaTamatEffective, $masa_mula,
            $masaTamatEffective, $masa_mula,
            $masa_mula, $masaTamatEffective
        );
        $stmtCheck->execute();
        $conflictRow = $stmtCheck->get_result()->fetch_assoc();
        $stmtCheck->close();

        if ($conflictRow) {
            $clashMula = substr($conflictRow['masa_mula'], 0, 5);
            $clashTamat = $conflictRow['masa_tamat'] ? substr($conflictRow['masa_tamat'], 0, 5) : 'Selesai';
            echo json_encode(["error" => "Tidak dapat memohon kerana bilik ini telah ditempah pada $clashMula - $clashTamat dalam tarikh yang sama. Sila pilih masa atau bilik lain."]);
            break;
        }

        $stmt = $conn->prepare("INSERT INTO tempahan (bilik_id, nama_pemohon, nama_penganjur, unit_pemohon, email_pemohon, telefon_pemohon, tujuan, tarikh, masa_mula, masa_tamat, bilangan_hadir, keperluan_khas, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'pending')");
        $stmt->bind_param("isssssssssss",
            $bilik_id, $nama_pemohon, $nama_penganjur, $unit_pemohon,
            $email_pemohon, $telefon_pemohon, $tujuan,
            $tarikh, $masa_mula, $masa_tamat,
            $bilangan_hadir, $keperluan_khas
        );

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "Permohonan tempahan berjaya dihantar! Sila tunggu kelulusan admin."]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;

    case 'PUT':
        // Lets a staff member end their own "sehingga selesai" (open-ended)
        // booking early, once their meeting actually finishes, so the room
        // frees up for others instead of staying blocked until end-of-day.
        $input = json_decode(file_get_contents('php://input'), true);
        if (!$input) die(json_encode(["error" => "Data tidak sah"]));

        $id = (int)($input['id'] ?? 0);
        $email = $input['email'] ?? '';
        $action = $input['action'] ?? '';

        if ($action !== 'end_now') {
            die(json_encode(["error" => "Tindakan tidak sah"]));
        }

        // Ownership check via email — same trust model already used by
        // action=my_bookings (this app has no server-side staff session).
        $stmtCheck = $conn->prepare("SELECT masa_mula, masa_tamat, status FROM tempahan WHERE id = ? AND email_pemohon = ?");
        $stmtCheck->bind_param("is", $id, $email);
        $stmtCheck->execute();
        $row = $stmtCheck->get_result()->fetch_assoc();
        $stmtCheck->close();

        if (!$row) {
            http_response_code(403);
            die(json_encode(["error" => "Tempahan tidak dijumpai atau anda tiada kebenaran untuk tindakan ini"]));
        }
        if ($row['status'] !== 'approved') {
            die(json_encode(["error" => "Hanya tempahan yang diluluskan boleh ditamatkan"]));
        }
        if ($row['masa_tamat'] !== null) {
            die(json_encode(["error" => "Tempahan ini sudah mempunyai masa tamat"]));
        }

        $nowTime = date('H:i:s');
        if ($nowTime <= $row['masa_mula']) {
            die(json_encode(["error" => "Tidak boleh tamatkan sebelum tempahan bermula"]));
        }

        $stmt = $conn->prepare("UPDATE tempahan SET masa_tamat = ? WHERE id = ?");
        $stmt->bind_param("si", $nowTime, $id);
        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "Tempahan ditamatkan. Bilik kini tersedia untuk ditempah semula.", "masa_tamat" => $nowTime]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;
}

$conn->close();
?>
