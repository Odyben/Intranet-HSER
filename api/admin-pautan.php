<?php
// Pautan & Perkhidmatan — admin CRUD for the three admin-managed link/service
// blocks (Perkhidmatan Utama carousel with an image, Pautan Utama sidebar
// and Pautan Luaran footer with just a title+URL). One shared table, kept in
// one admin module per the requested "3 in 1" management screen.
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('pautan');
$conn = getDbConnection();

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

$uploadDir = __DIR__ . '/../images/pautan/';
$uploadUrlPrefix = 'images/pautan/';
$validTypes = ['perkhidmatan', 'pautan_utama', 'pautan_luaran'];

switch ($method) {
    case 'GET':
        $type = $_GET['type'] ?? null;
        if ($type && !in_array($type, $validTypes)) {
            die(json_encode(["error" => "type tidak sah"]));
        }
        if ($type) {
            $stmt = $conn->prepare("SELECT * FROM pautan WHERE type = ? ORDER BY sort_order ASC, id ASC");
            $stmt->bind_param("s", $type);
            $stmt->execute();
            $result = $stmt->get_result();
        } else {
            $result = $conn->query("SELECT * FROM pautan ORDER BY type ASC, sort_order ASC, id ASC");
        }
        $data = [];
        while ($row = $result->fetch_assoc()) $data[] = $row;
        if ($type) $stmt->close();
        echo json_encode(['data' => $data]);
        break;

    case 'POST':
        $type = $_POST['type'] ?? '';
        $title = trim($_POST['title'] ?? '');
        $url = trim($_POST['url'] ?? '');

        if (!in_array($type, $validTypes)) {
            die(json_encode(["error" => "Jenis pautan tidak sah"]));
        }
        if (!$title) die(json_encode(["error" => "Sila masukkan tajuk"]));
        if (!$url) die(json_encode(["error" => "Sila masukkan link/URL"]));

        $imagePath = null;
        if ($type === 'perkhidmatan') {
            if (!isset($_FILES['image']) || $_FILES['image']['error'] !== UPLOAD_ERR_OK) {
                die(json_encode(["error" => "Sila pilih gambar untuk Perkhidmatan Utama"]));
            }
            $allowedExt = ['jpg', 'jpeg', 'png', 'webp'];
            $maxBytes = 8 * 1024 * 1024;
            $ext = strtolower(pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION));
            if (!in_array($ext, $allowedExt)) {
                die(json_encode(["error" => "Jenis fail tidak disokong. Guna JPG, PNG atau WEBP sahaja."]));
            }
            if ($_FILES['image']['size'] > $maxBytes) {
                die(json_encode(["error" => "Saiz fail melebihi 8MB"]));
            }
            if (!is_dir($uploadDir)) mkdir($uploadDir, 0755, true);
            $newFilename = 'pautan_' . time() . '_' . bin2hex(random_bytes(4)) . '.' . $ext;
            $destPath = $uploadDir . $newFilename;
            if (!move_uploaded_file($_FILES['image']['tmp_name'], $destPath)) {
                die(json_encode(["error" => "Gagal memuat naik gambar"]));
            }
            $imagePath = $uploadUrlPrefix . $newFilename;
        }

        $maxOrderRow = $conn->query("SELECT MAX(sort_order) as m FROM pautan WHERE type = '" . $conn->real_escape_string($type) . "'")->fetch_assoc();
        $nextOrder = ($maxOrderRow['m'] ?: 0) + 1;

        $stmt = $conn->prepare("INSERT INTO pautan (type, title, url, image_path, sort_order, aktif) VALUES (?, ?, ?, ?, ?, 1)");
        $stmt->bind_param("ssssi", $type, $title, $url, $imagePath, $nextOrder);

        if ($stmt->execute()) {
            logAudit($conn, 'create', 'pautan', 'Menambah pautan (' . $type . '): ' . $title);
            echo json_encode(["success" => true, "id" => $stmt->insert_id, "message" => "Pautan berjaya ditambah"]);
        } else {
            if ($imagePath) @unlink($uploadDir . basename($imagePath));
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;

    case 'PUT':
        $input = jsonInput();
        $id = requireInputId($input);

        $fields = [];
        $types = "";
        $values = [];

        if (isset($input['title'])) { $fields[] = "title = ?"; $types .= "s"; $values[] = $input['title']; }
        if (isset($input['url'])) { $fields[] = "url = ?"; $types .= "s"; $values[] = $input['url']; }
        if (isset($input['aktif'])) { $fields[] = "aktif = ?"; $types .= "i"; $values[] = (int)$input['aktif']; }
        if (isset($input['sort_order'])) { $fields[] = "sort_order = ?"; $types .= "i"; $values[] = (int)$input['sort_order']; }

        if (empty($fields)) {
            die(json_encode(["error" => "Tiada kemaskini diberikan"]));
        }

        $sql = "UPDATE pautan SET " . implode(', ', $fields) . " WHERE id = ?";
        $types .= "i";
        $values[] = $id;

        $stmt = $conn->prepare($sql);
        $stmt->bind_param($types, ...$values);

        if ($stmt->execute()) {
            $changeDesc = isset($input['aktif']) ? ((int)$input['aktif'] ? 'Memaparkan' : 'Menyembunyikan') . ' pautan ID ' . $id
                : 'Mengemaskini pautan ID ' . $id;
            logAudit($conn, 'update', 'pautan', $changeDesc);
            echo json_encode(["success" => true, "message" => "Pautan berjaya dikemaskini"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;

    case 'DELETE':
        $input = jsonInput();
        $id = requireInputId($input);

        $stmt = $conn->prepare("SELECT image_path, title FROM pautan WHERE id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $row = $stmt->get_result()->fetch_assoc();
        $stmt->close();

        $stmt = $conn->prepare("DELETE FROM pautan WHERE id = ?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            if ($row && $row['image_path'] && strpos($row['image_path'], $uploadUrlPrefix) === 0) {
                $filePath = __DIR__ . '/../' . $row['image_path'];
                if (file_exists($filePath)) @unlink($filePath);
            }
            logAudit($conn, 'delete', 'pautan', 'Memadam pautan: ' . (($row['title'] ?? '') ?: ('ID ' . $id)));
            echo json_encode(["success" => true, "message" => "Pautan berjaya dipadam"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;
}

$conn->close();
?>
