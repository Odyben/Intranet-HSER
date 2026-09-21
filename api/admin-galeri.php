<?php
// Galeri Aktiviti — admin CRUD for the hospital-activities photo gallery
// shown on the public dashboard. Mirrors admin-slideshow.php's upload
// pattern, with a title/description/event-date per photo instead of just a
// caption.
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('galeri');
$conn = getDbConnection();

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

$uploadDir = __DIR__ . '/../images/galeri/';
$uploadUrlPrefix = 'images/galeri/';

switch ($method) {
    case 'GET':
        $page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
        $limit = isset($_GET['limit']) ? max(1, (int)$_GET['limit']) : 20;
        $offset = ($page - 1) * $limit;

        $total = $conn->query("SELECT COUNT(*) as total FROM galeri")->fetch_assoc()['total'];

        $stmt = $conn->prepare("SELECT * FROM galeri ORDER BY COALESCE(tarikh, created_at) DESC, sort_order ASC, id DESC LIMIT ? OFFSET ?");
        $stmt->bind_param("ii", $limit, $offset);
        $stmt->execute();
        $result = $stmt->get_result();
        $data = [];
        while ($row = $result->fetch_assoc()) $data[] = $row;
        $stmt->close();

        echo json_encode(['data' => $data, 'total' => (int)$total, 'page' => $page, 'totalPages' => ceil($total / $limit)]);
        break;

    case 'POST':
        if (!isset($_FILES['image']) || $_FILES['image']['error'] !== UPLOAD_ERR_OK) {
            die(json_encode(["error" => "Sila pilih fail gambar"]));
        }

        $allowedExt = ['jpg', 'jpeg', 'png', 'webp'];
        $maxBytes = 8 * 1024 * 1024; // 8MB

        $origName = $_FILES['image']['name'];
        $ext = strtolower(pathinfo($origName, PATHINFO_EXTENSION));

        if (!in_array($ext, $allowedExt)) {
            die(json_encode(["error" => "Jenis fail tidak disokong. Guna JPG, PNG atau WEBP sahaja."]));
        }
        if ($_FILES['image']['size'] > $maxBytes) {
            die(json_encode(["error" => "Saiz fail melebihi 8MB"]));
        }

        $title = trim($_POST['title'] ?? '');
        if (!$title) {
            die(json_encode(["error" => "Sila masukkan tajuk gambar"]));
        }
        $description = trim($_POST['description'] ?? '');
        $tarikh = !empty($_POST['tarikh']) ? $_POST['tarikh'] : null;

        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }

        $newFilename = 'galeri_' . time() . '_' . bin2hex(random_bytes(4)) . '.' . $ext;
        $destPath = $uploadDir . $newFilename;

        if (!move_uploaded_file($_FILES['image']['tmp_name'], $destPath)) {
            die(json_encode(["error" => "Gagal memuat naik fail"]));
        }

        $imagePath = $uploadUrlPrefix . $newFilename;

        $maxOrderRow = $conn->query("SELECT MAX(sort_order) as m FROM galeri")->fetch_assoc();
        $nextOrder = ($maxOrderRow['m'] ?: 0) + 1;

        $stmt = $conn->prepare("INSERT INTO galeri (image_path, title, description, tarikh, sort_order, aktif) VALUES (?, ?, ?, ?, ?, 1)");
        $stmt->bind_param("ssssi", $imagePath, $title, $description, $tarikh, $nextOrder);

        if ($stmt->execute()) {
            logAudit($conn, 'create', 'galeri', 'Menambah gambar galeri: ' . $title);
            echo json_encode(["success" => true, "id" => $stmt->insert_id, "message" => "Gambar berjaya ditambah"]);
        } else {
            @unlink($destPath);
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
        if (isset($input['description'])) { $fields[] = "description = ?"; $types .= "s"; $values[] = $input['description']; }
        if (array_key_exists('tarikh', $input)) { $fields[] = "tarikh = ?"; $types .= "s"; $values[] = $input['tarikh'] ?: null; }
        if (isset($input['aktif'])) { $fields[] = "aktif = ?"; $types .= "i"; $values[] = (int)$input['aktif']; }
        if (isset($input['sort_order'])) { $fields[] = "sort_order = ?"; $types .= "i"; $values[] = (int)$input['sort_order']; }

        if (empty($fields)) {
            die(json_encode(["error" => "Tiada kemaskini diberikan"]));
        }

        $sql = "UPDATE galeri SET " . implode(', ', $fields) . " WHERE id = ?";
        $types .= "i";
        $values[] = $id;

        $stmt = $conn->prepare($sql);
        $stmt->bind_param($types, ...$values);

        if ($stmt->execute()) {
            $changeDesc = isset($input['aktif']) ? ((int)$input['aktif'] ? 'Memaparkan' : 'Menyembunyikan') . ' gambar galeri ID ' . $id
                : 'Mengemaskini gambar galeri ID ' . $id;
            logAudit($conn, 'update', 'galeri', $changeDesc);
            echo json_encode(["success" => true, "message" => "Gambar berjaya dikemaskini"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;

    case 'DELETE':
        $input = jsonInput();
        $id = requireInputId($input);

        $stmt = $conn->prepare("SELECT image_path, title FROM galeri WHERE id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $row = $stmt->get_result()->fetch_assoc();
        $stmt->close();

        $stmt = $conn->prepare("DELETE FROM galeri WHERE id = ?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            if ($row && strpos($row['image_path'], $uploadUrlPrefix) === 0) {
                $filePath = __DIR__ . '/../' . $row['image_path'];
                if (file_exists($filePath)) @unlink($filePath);
            }
            logAudit($conn, 'delete', 'galeri', 'Memadam gambar galeri: ' . (($row['title'] ?? '') ?: ('ID ' . $id)));
            echo json_encode(["success" => true, "message" => "Gambar berjaya dipadam"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;
}

$conn->close();
?>
