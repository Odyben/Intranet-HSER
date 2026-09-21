<?php
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('bilik');
$conn = getDbConnection();

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        $sql = "SELECT * FROM bilik ORDER BY id ASC";
        $result = $conn->query($sql);
        $data = [];
        while ($row = $result->fetch_assoc()) $data[] = $row;
        echo json_encode(['data' => $data]);
        break;

    case 'POST':
        $input = jsonInput();

        $nama = $input['nama'] ?? '';
        $lokasi = $input['lokasi'] ?? '';
        $kapasiti = (int)($input['kapasiti'] ?? 0);
        $kemudahan = $input['kemudahan'] ?? '';
        $gambar = $input['gambar'] ?? '';
        $aktif = isset($input['aktif']) ? (int)$input['aktif'] : 1;

        $stmt = $conn->prepare("INSERT INTO bilik (nama, lokasi, kapasiti, kemudahan, gambar, aktif) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssissi", $nama, $lokasi, $kapasiti, $kemudahan, $gambar, $aktif);

        if ($stmt->execute()) {
            logAudit($conn, 'create', 'bilik', 'Menambah bilik: ' . $nama);
            echo json_encode(["success" => true, "id" => $stmt->insert_id, "message" => "Bilik berjaya ditambah"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;

    case 'PUT':
        $input = jsonInput();
        $id = requireInputId($input);

        $nama = $input['nama'] ?? '';
        $lokasi = $input['lokasi'] ?? '';
        $kapasiti = (int)($input['kapasiti'] ?? 0);
        $kemudahan = $input['kemudahan'] ?? '';
        $gambar = $input['gambar'] ?? '';
        $aktif = isset($input['aktif']) ? (int)$input['aktif'] : 1;

        $stmt = $conn->prepare("UPDATE bilik SET nama=?, lokasi=?, kapasiti=?, kemudahan=?, gambar=?, aktif=? WHERE id=?");
        $stmt->bind_param("ssissii", $nama, $lokasi, $kapasiti, $kemudahan, $gambar, $aktif, $id);

        if ($stmt->execute()) {
            logAudit($conn, 'update', 'bilik', 'Mengemaskini bilik: ' . $nama);
            echo json_encode(["success" => true, "message" => "Bilik berjaya dikemaskini"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;

    case 'DELETE':
        $input = jsonInput();
        $id = requireInputId($input);

        $lookup = $conn->prepare("SELECT nama FROM bilik WHERE id=?");
        $lookup->bind_param("i", $id);
        $lookup->execute();
        $deletedNama = $lookup->get_result()->fetch_assoc()['nama'] ?? ('ID ' . $id);
        $lookup->close();

        $stmt = $conn->prepare("DELETE FROM bilik WHERE id=?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            logAudit($conn, 'delete', 'bilik', 'Memadam bilik: ' . $deletedNama);
            echo json_encode(["success" => true, "message" => "Bilik berjaya dipadam"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;
}

$conn->close();
?>
