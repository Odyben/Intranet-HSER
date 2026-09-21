<?php
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('slideshow');
$conn = getDbConnection();

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

$uploadDir = __DIR__ . '/../images/slideshow/';
$uploadUrlPrefix = 'images/slideshow/';

switch ($method) {
    case 'GET':
        $result = $conn->query("SELECT * FROM slideshow ORDER BY sort_order ASC, id ASC");
        $data = [];
        while ($row = $result->fetch_assoc()) $data[] = $row;
        echo json_encode(['data' => $data]);
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

        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }

        $newFilename = 'slide_' . time() . '_' . bin2hex(random_bytes(4)) . '.' . $ext;
        $destPath = $uploadDir . $newFilename;

        if (!move_uploaded_file($_FILES['image']['tmp_name'], $destPath)) {
            die(json_encode(["error" => "Gagal memuat naik fail"]));
        }

        $imagePath = $uploadUrlPrefix . $newFilename;
        $caption = $_POST['caption'] ?? '';

        $maxOrderRow = $conn->query("SELECT MAX(sort_order) as m FROM slideshow")->fetch_assoc();
        $nextOrder = ($maxOrderRow['m'] ?: 0) + 1;

        $stmt = $conn->prepare("INSERT INTO slideshow (image_path, caption, sort_order, aktif) VALUES (?, ?, ?, 1)");
        $stmt->bind_param("ssi", $imagePath, $caption, $nextOrder);

        if ($stmt->execute()) {
            logAudit($conn, 'create', 'slideshow', 'Menambah slaid: ' . ($caption ?: $imagePath));
            echo json_encode(["success" => true, "id" => $stmt->insert_id, "image_path" => $imagePath, "message" => "Slaid berjaya ditambah"]);
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

        if (isset($input['caption'])) {
            $fields[] = "caption = ?";
            $types .= "s";
            $values[] = $input['caption'];
        }
        if (isset($input['aktif'])) {
            $fields[] = "aktif = ?";
            $types .= "i";
            $values[] = (int)$input['aktif'];
        }
        if (isset($input['sort_order'])) {
            $fields[] = "sort_order = ?";
            $types .= "i";
            $values[] = (int)$input['sort_order'];
        }

        if (empty($fields)) {
            die(json_encode(["error" => "Tiada kemaskini diberikan"]));
        }

        $sql = "UPDATE slideshow SET " . implode(', ', $fields) . " WHERE id = ?";
        $types .= "i";
        $values[] = $id;

        $stmt = $conn->prepare($sql);
        $stmt->bind_param($types, ...$values);

        if ($stmt->execute()) {
            $changeDesc = isset($input['aktif']) ? ((int)$input['aktif'] ? 'Mengaktifkan' : 'Menyahaktifkan') . ' slaid ID ' . $id
                : (isset($input['sort_order']) ? 'Menyusun semula slaid ID ' . $id : 'Mengemaskini kapsyen slaid ID ' . $id);
            logAudit($conn, 'update', 'slideshow', $changeDesc);
            echo json_encode(["success" => true, "message" => "Slaid berjaya dikemaskini"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;

    case 'DELETE':
        $input = jsonInput();
        $id = requireInputId($input);

        $stmt = $conn->prepare("SELECT image_path, caption FROM slideshow WHERE id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $row = $stmt->get_result()->fetch_assoc();
        $stmt->close();

        $stmt = $conn->prepare("DELETE FROM slideshow WHERE id = ?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            // Only remove the actual file for slides uploaded through this
            // admin screen (kept in images/slideshow/) — never touch the
            // original hardcoded images/ files from before this feature existed.
            if ($row && strpos($row['image_path'], $uploadUrlPrefix) === 0) {
                $filePath = __DIR__ . '/../' . $row['image_path'];
                if (file_exists($filePath)) @unlink($filePath);
            }
            logAudit($conn, 'delete', 'slideshow', 'Memadam slaid: ' . (($row['caption'] ?? '') ?: ('ID ' . $id)));
            echo json_encode(["success" => true, "message" => "Slaid berjaya dipadam"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;
}

$conn->close();
?>
