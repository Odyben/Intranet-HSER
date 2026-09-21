<?php
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
require_once 'notifikasi_kempen_lib.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('staff');
$conn = getDbConnection();
pastikanSkemaNotifikasi($conn); // lajur emel_status dipaparkan dalam senarai staf

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        $search = isset($_GET['search']) ? $_GET['search'] : '';
        $page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
        $limit = isset($_GET['limit']) ? max(1, (int)$_GET['limit']) : 20;
        $offset = ($page - 1) * $limit;

        // Count total
        $countSql = "SELECT COUNT(*) as total FROM staff";
        $dataSql = "SELECT * FROM staff";
        $params = [];
        $types = "";

        if ($search !== '') {
            $where = " WHERE nama_penuh LIKE ? OR jawatan_sspa LIKE ? OR gred_sspa LIKE ? OR penempatan LIKE ? OR no_kp LIKE ?";
            $countSql .= $where;
            $dataSql .= $where;
            $searchTerm = "%$search%";
            $params = [$searchTerm, $searchTerm, $searchTerm, $searchTerm, $searchTerm];
            $types = "sssss";
        }

        $dataSql .= " ORDER BY bil ASC LIMIT ? OFFSET ?";
        $params[] = $limit;
        $params[] = $offset;
        $types .= "ii";

        // Get count
        $stmtCount = $conn->prepare($countSql);
        if ($search !== '') {
            $countParams = array_slice($params, 0, 5);
            $stmtCount->bind_param("sssss", ...$countParams);
        }
        $stmtCount->execute();
        $total = $stmtCount->get_result()->fetch_assoc()['total'];
        $stmtCount->close();

        // Get data
        $stmt = $conn->prepare($dataSql);
        $stmt->bind_param($types, ...$params);
        $stmt->execute();
        $result = $stmt->get_result();
        $data = [];
        while ($row = $result->fetch_assoc()) $data[] = $row;
        $stmt->close();

        echo json_encode([
            'data' => $data,
            'total' => (int)$total,
            'page' => $page,
            'limit' => $limit,
            'totalPages' => ceil($total / $limit)
        ]);
        break;

    case 'POST':
        $input = jsonInput();

        // "Bil" is just a display sequence number, not something an admin
        // should have to type/guess correctly — auto-assign the next one.
        $maxBilRow = $conn->query("SELECT MAX(bil) as m FROM staff")->fetch_assoc();
        $bil = ($maxBilRow['m'] ?? 0) + 1;
        $gelaran = $input['gelaran'] ?? '';
        $jantina = $input['jantina'] ?? '';
        $nama_penuh = $input['nama_penuh'] ?? '';
        // no_kp has a UNIQUE constraint — an empty string still "collides"
        // with any other blank one, so store NULL instead when it's not
        // provided (multiple staff can have an unrecorded IC number; only
        // real, non-blank numbers need to be unique).
        $no_kp = !empty($input['no_kp']) ? $input['no_kp'] : null;
        $bangsa = $input['bangsa'] ?? '';
        $etnik = $input['etnik'] ?? '';
        $agama = $input['agama'] ?? '';
        $jawatan_sspa = $input['jawatan_sspa'] ?? '';
        $gred_sspa = $input['gred_sspa'] ?? '';
        $jawatan_ssm = $input['jawatan_ssm'] ?? '';
        $no_telefon = $input['no_telefon'] ?? '';
        $emel_rasmi = $input['emel_rasmi'] ?? '';
        $emel_peribadi = $input['emel_peribadi'] ?? '';
        $catatan = $input['catatan'] ?? '';
        $penempatan = $input['penempatan'] ?? '';

        $stmt = $conn->prepare("INSERT INTO staff (bil, gelaran, jantina, nama_penuh, no_kp, bangsa, etnik, agama, jawatan_sspa, gred_sspa, jawatan_ssm, no_telefon, emel_rasmi, emel_peribadi, catatan, penempatan) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("isssssssssssssss", $bil, $gelaran, $jantina, $nama_penuh, $no_kp, $bangsa, $etnik, $agama, $jawatan_sspa, $gred_sspa, $jawatan_ssm, $no_telefon, $emel_rasmi, $emel_peribadi, $catatan, $penempatan);

        if ($stmt->execute()) {
            logAudit($conn, 'create', 'staff', 'Menambah staf: ' . $nama_penuh);
            echo json_encode(["success" => true, "id" => $stmt->insert_id, "message" => "Staff berjaya ditambah"]);
        } else {
            echo json_encode(["error" => "Gagal menambah staff: " . $stmt->error]);
        }
        $stmt->close();
        break;

    case 'PUT':
        $input = jsonInput();
        $id = requireInputId($input);

        $gelaran = $input['gelaran'] ?? '';
        $jantina = $input['jantina'] ?? '';
        $nama_penuh = $input['nama_penuh'] ?? '';
        $no_kp = !empty($input['no_kp']) ? $input['no_kp'] : null; // see POST — avoids UNIQUE collisions between blank IC numbers
        $bangsa = $input['bangsa'] ?? '';
        $etnik = $input['etnik'] ?? '';
        $agama = $input['agama'] ?? '';
        $jawatan_sspa = $input['jawatan_sspa'] ?? '';
        $gred_sspa = $input['gred_sspa'] ?? '';
        $jawatan_ssm = $input['jawatan_ssm'] ?? '';
        $no_telefon = $input['no_telefon'] ?? '';
        $emel_rasmi = $input['emel_rasmi'] ?? '';
        $emel_peribadi = $input['emel_peribadi'] ?? '';
        $catatan = $input['catatan'] ?? '';
        $penempatan = $input['penempatan'] ?? '';

        $oldEmailLookup = $conn->prepare("SELECT emel_rasmi FROM staff WHERE id=?");
        $oldEmailLookup->bind_param("i", $id);
        $oldEmailLookup->execute();
        $oldEmail = $oldEmailLookup->get_result()->fetch_assoc()['emel_rasmi'] ?? '';
        $oldEmailLookup->close();

        // "bil" (display sequence number) is intentionally left untouched
        // here — it's auto-assigned once at creation, editing other fields
        // shouldn't renumber it.
        $stmt = $conn->prepare("UPDATE staff SET gelaran=?, jantina=?, nama_penuh=?, no_kp=?, bangsa=?, etnik=?, agama=?, jawatan_sspa=?, gred_sspa=?, jawatan_ssm=?, no_telefon=?, emel_rasmi=?, emel_peribadi=?, catatan=?, penempatan=? WHERE id=?");
        $stmt->bind_param("sssssssssssssssi", $gelaran, $jantina, $nama_penuh, $no_kp, $bangsa, $etnik, $agama, $jawatan_sspa, $gred_sspa, $jawatan_ssm, $no_telefon, $emel_rasmi, $emel_peribadi, $catatan, $penempatan, $id);

        if ($stmt->execute()) {
            // Emel baharu belum pernah dibuktikan tidak wujud — benarkan ia
            // menerima notifikasi semula.
            if (strcasecmp(trim($oldEmail), trim($emel_rasmi)) !== 0) {
                $resetStatus = $conn->prepare("UPDATE staff SET emel_status=NULL, emel_status_nota=NULL WHERE id=?");
                $resetStatus->bind_param("i", $id);
                $resetStatus->execute();
                $resetStatus->close();
            }
            logAudit($conn, 'update', 'staff', 'Mengemaskini staf: ' . $nama_penuh);
            echo json_encode(["success" => true, "message" => "Staff berjaya dikemaskini"]);
        } else {
            echo json_encode(["error" => "Gagal mengemaskini: " . $stmt->error]);
        }
        $stmt->close();
        break;

    case 'DELETE':
        $input = jsonInput();
        $id = requireInputId($input);

        $nameLookup = $conn->prepare("SELECT nama_penuh FROM staff WHERE id=?");
        $nameLookup->bind_param("i", $id);
        $nameLookup->execute();
        $deletedName = $nameLookup->get_result()->fetch_assoc()['nama_penuh'] ?? ('ID ' . $id);
        $nameLookup->close();

        $stmt = $conn->prepare("DELETE FROM staff WHERE id=?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            logAudit($conn, 'delete', 'staff', 'Memadam staf: ' . $deletedName);
            echo json_encode(["success" => true, "message" => "Staff berjaya dipadam"]);
        } else {
            echo json_encode(["error" => "Gagal memadam: " . $stmt->error]);
        }
        $stmt->close();
        break;
}

$conn->close();
?>
