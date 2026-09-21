<?php
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
require_once 'mailer.php';
require_once 'tempahan_berita_lib.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('tempahan');
$conn = getDbConnection();

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        $status = isset($_GET['status']) ? $_GET['status'] : '';
        $bilik_id = isset($_GET['bilik_id']) ? (int)$_GET['bilik_id'] : 0;
        $search = isset($_GET['search']) ? trim($_GET['search']) : '';
        $tahun = isset($_GET['tahun']) ? (int)$_GET['tahun'] : 0;
        $bulan = isset($_GET['bulan']) ? (int)$_GET['bulan'] : 0;
        $page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
        $limit = isset($_GET['limit']) ? max(1, (int)$_GET['limit']) : 20;
        $offset = ($page - 1) * $limit;

        $countSql = "SELECT COUNT(*) as total FROM tempahan t WHERE 1=1";
        $dataSql = "SELECT t.*, b.nama as bilik_nama, bt.id as berita_id FROM tempahan t LEFT JOIN bilik b ON t.bilik_id = b.id LEFT JOIN berita bt ON bt.tempahan_id = t.id WHERE 1=1";
        $params = [];
        $types = "";

        if ($status !== '' && $status !== 'all') {
            $countSql .= " AND status = ?";
            $dataSql .= " AND t.status = ?";
            $params[] = $status;
            $types .= "s";
        }
        if ($bilik_id > 0) {
            $countSql .= " AND bilik_id = ?";
            $dataSql .= " AND t.bilik_id = ?";
            $params[] = $bilik_id;
            $types .= "i";
        }
        if ($tahun > 0) {
            $countSql .= " AND YEAR(tarikh) = ?";
            $dataSql .= " AND YEAR(t.tarikh) = ?";
            $params[] = $tahun;
            $types .= "i";
        }
        if ($bulan >= 1 && $bulan <= 12) {
            $countSql .= " AND MONTH(tarikh) = ?";
            $dataSql .= " AND MONTH(t.tarikh) = ?";
            $params[] = $bulan;
            $types .= "i";
        }
        if ($search !== '') {
            $searchClause = " AND (t.tujuan LIKE ? OR t.nama_pemohon LIKE ? OR t.nama_penganjur LIKE ? OR t.unit_pemohon LIKE ?)";
            $countSql .= $searchClause;
            $dataSql .= $searchClause;
            $s = "%$search%";
            $params[] = $s; $params[] = $s; $params[] = $s; $params[] = $s;
            $types .= "ssss";
        }

        $stmtCount = $conn->prepare($countSql);
        if (!empty($params)) $stmtCount->bind_param($types, ...$params);
        $stmtCount->execute();
        $total = $stmtCount->get_result()->fetch_assoc()['total'];
        $stmtCount->close();

        // Still-relevant bookings first (pending/approved that haven't ended
        // yet), then finished ones (past their effective end time, or
        // rejected) pushed to the back — each group sorted chronologically.
        // "Effective end" mirrors the JS-side rule: masa_tamat if set, else
        // 1 hour after masa_mula for open-ended ("sehingga selesai") bookings.
        $dataSql .= " ORDER BY
                (CASE WHEN t.status = 'rejected' THEN 1
                      WHEN t.status IN ('pending','approved')
                           AND TIMESTAMP(t.tarikh, COALESCE(t.masa_tamat, ADDTIME(t.masa_mula, '01:00:00'))) < NOW() THEN 1
                      ELSE 0 END) ASC,
                t.tarikh ASC, t.masa_mula ASC
            LIMIT ? OFFSET ?";
        $params[] = $limit; $params[] = $offset;
        $types .= "ii";

        $stmt = $conn->prepare($dataSql);
        $stmt->bind_param($types, ...$params);
        $stmt->execute();
        $result = $stmt->get_result();
        $data = [];
        while ($row = $result->fetch_assoc()) $data[] = $row;
        $stmt->close();

        // Count by status
        $pendingCount = $conn->query("SELECT COUNT(*) as c FROM tempahan WHERE status='pending'")->fetch_assoc()['c'];
        $approvedCount = $conn->query("SELECT COUNT(*) as c FROM tempahan WHERE status='approved'")->fetch_assoc()['c'];
        $rejectedCount = $conn->query("SELECT COUNT(*) as c FROM tempahan WHERE status='rejected'")->fetch_assoc()['c'];

        // Tahun yang benar-benar ada rekod — mengisi penapis tahun di admin panel
        $tahunAda = [];
        $res = $conn->query("SELECT DISTINCT YEAR(tarikh) AS t FROM tempahan ORDER BY t DESC");
        while ($row = $res->fetch_assoc()) $tahunAda[] = (int)$row['t'];

        echo json_encode([
            'data' => $data,
            'tahun_tersedia' => $tahunAda,
            'total' => (int)$total,
            'page' => $page,
            'limit' => $limit,
            'totalPages' => ceil($total / $limit),
            'counts' => [
                'pending' => (int)$pendingCount,
                'approved' => (int)$approvedCount,
                'rejected' => (int)$rejectedCount
            ]
        ]);
        break;

    case 'PUT':
        $input = jsonInput();
        $id = requireInputId($input);

        $status = $input['status'] ?? '';
        $catatan = $input['catatan_admin'] ?? '';

        // Fetched once up front — reused for the audit log entry, the
        // auto-drafted Berita post, and the notification email below.
        $bookingStmt = $conn->prepare("SELECT t.*, b.nama as bilik_nama FROM tempahan t LEFT JOIN bilik b ON t.bilik_id = b.id WHERE t.id = ?");
        $bookingStmt->bind_param("i", $id);
        $bookingStmt->execute();
        $booking = $bookingStmt->get_result()->fetch_assoc();
        $bookingStmt->close();
        $logTujuan = $booking['tujuan'] ?? ('ID ' . $id);

        $stmt = $conn->prepare("UPDATE tempahan SET status=?, catatan_admin=? WHERE id=?");
        $stmt->bind_param("ssi", $status, $catatan, $id);

        if ($stmt->execute()) {
            // Approving a booking auto-creates a matching Berita draft (so staff
            // managing announcements don't have to retype the same booking info);
            // rejecting one removes its draft. Guarded by tempahan_id, so
            // re-saving an already-approved booking won't create a second draft.
            segerakBeritaTempahan($conn, $_SESSION['user_name'] ?? 'Admin');

            // Notify the person who submitted the request by email — approving
            // or rejecting a booking is exactly the kind of update someone
            // shouldn't have to keep checking the intranet for.
            if ($booking && !empty($booking['email_pemohon'])) {
                $tarikhLabel = date('d/m/Y', strtotime($booking['tarikh']));
                $masaLabel = to12HourFormat($booking['masa_mula']) . ' - ' . ($booking['masa_tamat'] ? to12HourFormat($booking['masa_tamat']) : 'Selesai');
                if ($status === 'approved') {
                    $body = '<p>Salam sejahtera, <strong>' . htmlspecialchars($booking['nama_pemohon']) . '</strong>.</p>'
                        . '<p>Permohonan tempahan bilik anda telah <strong style="color:#16a34a;">diluluskan</strong>.</p>'
                        . '<table style="width:100%; border-collapse:collapse; margin-top:12px;">'
                        . '<tr><td style="padding:4px 0; color:#64748b;">Bilik</td><td style="padding:4px 0;"><strong>' . htmlspecialchars($booking['bilik_nama'] ?? '-') . '</strong></td></tr>'
                        . '<tr><td style="padding:4px 0; color:#64748b;">Tarikh</td><td style="padding:4px 0;"><strong>' . $tarikhLabel . '</strong></td></tr>'
                        . '<tr><td style="padding:4px 0; color:#64748b;">Masa</td><td style="padding:4px 0;"><strong>' . $masaLabel . '</strong></td></tr>'
                        . '<tr><td style="padding:4px 0; color:#64748b;">Tujuan</td><td style="padding:4px 0;"><strong>' . htmlspecialchars($booking['tujuan']) . '</strong></td></tr>'
                        . '</table>';
                    if ($catatan) $body .= '<p style="margin-top:12px; padding:10px; background:#f1f5f9; border-radius:6px; font-size:13px;"><strong>Nota Admin:</strong> ' . htmlspecialchars($catatan) . '</p>';
                    sendMail($booking['email_pemohon'], $booking['nama_pemohon'], 'Tempahan Bilik Diluluskan — ' . ($booking['bilik_nama'] ?? ''), wrapEmailTemplate('Tempahan Bilik Diluluskan', $body));
                } elseif ($status === 'rejected') {
                    $body = '<p>Salam sejahtera, <strong>' . htmlspecialchars($booking['nama_pemohon']) . '</strong>.</p>'
                        . '<p>Permohonan tempahan bilik anda pada <strong>' . $tarikhLabel . '</strong> (' . $masaLabel . ') untuk <strong>' . htmlspecialchars($booking['bilik_nama'] ?? '-') . '</strong> <strong style="color:#dc2626;">tidak dapat diluluskan</strong>.</p>';
                    if ($catatan) $body .= '<p style="margin-top:12px; padding:10px; background:#fef2f2; border-radius:6px; font-size:13px;"><strong>Sebab:</strong> ' . htmlspecialchars($catatan) . '</p>';
                    sendMail($booking['email_pemohon'], $booking['nama_pemohon'], 'Tempahan Bilik Ditolak — ' . ($booking['bilik_nama'] ?? ''), wrapEmailTemplate('Tempahan Bilik Tidak Diluluskan', $body));
                }
            }

            $statusLabel = $status === 'approved' ? 'diluluskan' : 'ditolak';
            logAudit($conn, 'update', 'tempahan', "Tempahan $statusLabel: " . $logTujuan);
            echo json_encode(["success" => true, "message" => "Tempahan berjaya $statusLabel"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;

    case 'DELETE':
        $input = jsonInput();
        $id = requireInputId($input);

        $delLookup = $conn->prepare("SELECT tujuan FROM tempahan WHERE id=?");
        $delLookup->bind_param("i", $id);
        $delLookup->execute();
        $deletedTujuan = $delLookup->get_result()->fetch_assoc()['tujuan'] ?? ('ID ' . $id);
        $delLookup->close();

        $stmt = $conn->prepare("DELETE FROM tempahan WHERE id=?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            // Berita draf untuk tempahan ini tidak lagi relevan
            segerakBeritaTempahan($conn, $_SESSION['user_name'] ?? 'Admin');
            logAudit($conn, 'delete', 'tempahan', 'Memadam tempahan: ' . $deletedTujuan);
            echo json_encode(["success" => true, "message" => "Tempahan berjaya dipadam"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;
}

$conn->close();
?>
