<?php
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('borang');
$conn = getDbConnection();

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

$uploadDir = __DIR__ . '/../Dokumen/uploads/borang/';
$uploadUrlPrefix = 'Dokumen/uploads/borang/';
$allowedExt = ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx'];
$maxBytes = 15 * 1024 * 1024; // 15MB

function formatFileSize($bytes) {
    return $bytes > 1048576 ? round($bytes / 1048576, 1) . ' MB' : round($bytes / 1024) . ' KB';
}

switch ($method) {
    case 'GET':
        $search = isset($_GET['search']) ? $_GET['search'] : '';
        $category = isset($_GET['category']) ? $_GET['category'] : '';
        $page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
        $limit = isset($_GET['limit']) ? max(1, (int)$_GET['limit']) : 20;
        $offset = ($page - 1) * $limit;

        $countSql = "SELECT COUNT(*) as total FROM borang WHERE 1=1";
        $dataSql = "SELECT * FROM borang WHERE 1=1";
        $params = [];
        $types = "";

        if ($search !== '') {
            $countSql .= " AND (name LIKE ? OR description LIKE ?)";
            $dataSql .= " AND (name LIKE ? OR description LIKE ?)";
            $s = "%$search%";
            $params[] = $s; $params[] = $s;
            $types .= "ss";
        }
        if ($category !== '' && $category !== 'semua') {
            $countSql .= " AND category = ?";
            $dataSql .= " AND category = ?";
            $params[] = $category;
            $types .= "s";
        }

        // Count
        $stmtCount = $conn->prepare($countSql);
        if (!empty($params)) {
            $countParams = $params;
            $countTypes = $types;
            $stmtCount->bind_param($countTypes, ...$countParams);
        }
        $stmtCount->execute();
        $total = $stmtCount->get_result()->fetch_assoc()['total'];
        $stmtCount->close();

        // Data with pagination
        $dataSql .= " ORDER BY name ASC LIMIT ? OFFSET ?";
        $params[] = $limit; $params[] = $offset;
        $types .= "ii";

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
        // Multipart form: creates a new form, or updates an existing one when
        // "id" is present. A new file is optional on update — if omitted, the
        // existing file_path/type/size are kept as-is.
        $id = isset($_POST['id']) && $_POST['id'] !== '' ? (int)$_POST['id'] : null;

        $name = $_POST['name'] ?? '';
        $category = $_POST['category'] ?? '';
        $cat_label = $_POST['cat_label'] ?? '';
        $version = $_POST['version'] ?? '';
        $doc_date = $_POST['doc_date'] ?? '';
        $uploader = $_POST['uploader'] ?? '';
        $description = $_POST['description'] ?? '';

        $file_path = null;
        $type = null;
        $size = null;

        $hasNewFile = isset($_FILES['file']) && $_FILES['file']['error'] === UPLOAD_ERR_OK;

        if ($hasNewFile) {
            $origName = $_FILES['file']['name'];
            $ext = strtolower(pathinfo($origName, PATHINFO_EXTENSION));

            if (!in_array($ext, $allowedExt)) {
                die(json_encode(["error" => "Jenis fail tidak disokong. Guna PDF, DOC, DOCX, XLS, XLSX, PPT atau PPTX sahaja."]));
            }
            if ($_FILES['file']['size'] > $maxBytes) {
                die(json_encode(["error" => "Saiz fail melebihi 15MB"]));
            }

            if (!is_dir($uploadDir)) {
                mkdir($uploadDir, 0755, true);
            }

            $newFilename = 'borang_' . time() . '_' . bin2hex(random_bytes(4)) . '.' . $ext;
            $destPath = $uploadDir . $newFilename;

            if (!move_uploaded_file($_FILES['file']['tmp_name'], $destPath)) {
                die(json_encode(["error" => "Gagal memuat naik fail"]));
            }

            $file_path = $uploadUrlPrefix . $newFilename;
            $type = $ext;
            $size = formatFileSize($_FILES['file']['size']);
        } elseif (!$id) {
            die(json_encode(["error" => "Sila pilih fail untuk dimuat naik"]));
        }

        if ($id) {
            // Fetch the existing row first — needed to keep file/type/size when
            // no new file was uploaded, and to know what old file to clean up
            // when one was.
            $existing = $conn->prepare("SELECT file_path, type, size FROM borang WHERE id = ?");
            $existing->bind_param("i", $id);
            $existing->execute();
            $oldRow = $existing->get_result()->fetch_assoc();
            $existing->close();

            if ($file_path === null && $oldRow) {
                $file_path = $oldRow['file_path'];
                $type = $oldRow['type'];
                $size = $oldRow['size'];
            }

            $stmt = $conn->prepare("UPDATE borang SET name=?, category=?, cat_label=?, version=?, doc_date=?, size=?, type=?, uploader=?, description=?, file_path=? WHERE id=?");
            $stmt->bind_param("ssssssssssi", $name, $category, $cat_label, $version, $doc_date, $size, $type, $uploader, $description, $file_path, $id);

            if ($stmt->execute()) {
                // A replacement file was uploaded — remove the old one, but only
                // if it lived in our own managed uploads folder (never touch
                // manually-placed files elsewhere in Dokumen/).
                if ($hasNewFile && $oldRow && $oldRow['file_path'] !== $file_path
                    && strpos($oldRow['file_path'], $uploadUrlPrefix) === 0) {
                    $oldFilePath = __DIR__ . '/../' . $oldRow['file_path'];
                    if (file_exists($oldFilePath)) @unlink($oldFilePath);
                }
                logAudit($conn, 'update', 'borang', 'Mengemaskini borang: ' . $name);
                echo json_encode(["success" => true, "message" => "Borang berjaya dikemaskini"]);
            } else {
                if ($hasNewFile) @unlink($destPath);
                echo json_encode(["error" => $stmt->error]);
            }
            $stmt->close();
        } else {
            $stmt = $conn->prepare("INSERT INTO borang (name, category, cat_label, version, doc_date, size, type, uploader, description, file_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("ssssssssss", $name, $category, $cat_label, $version, $doc_date, $size, $type, $uploader, $description, $file_path);

            if ($stmt->execute()) {
                logAudit($conn, 'create', 'borang', 'Menambah borang: ' . $name);
                echo json_encode(["success" => true, "id" => $stmt->insert_id, "message" => "Borang berjaya ditambah"]);
            } else {
                @unlink($destPath);
                echo json_encode(["error" => $stmt->error]);
            }
            $stmt->close();
        }
        break;

    case 'DELETE':
        $input = jsonInput();
        $id = requireInputId($input);

        $stmt = $conn->prepare("SELECT name, file_path FROM borang WHERE id = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $row = $stmt->get_result()->fetch_assoc();
        $stmt->close();

        $stmt = $conn->prepare("DELETE FROM borang WHERE id=?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            // Only remove files that were uploaded through this admin screen
            // (kept in Dokumen/uploads/borang/) — never touch the original
            // manually-placed files elsewhere in Dokumen/.
            if ($row && strpos($row['file_path'], $uploadUrlPrefix) === 0) {
                $filePath = __DIR__ . '/../' . $row['file_path'];
                if (file_exists($filePath)) @unlink($filePath);
            }
            logAudit($conn, 'delete', 'borang', 'Memadam borang: ' . ($row['name'] ?? ('ID ' . $id)));
            echo json_encode(["success" => true, "message" => "Borang berjaya dipadam"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;
}

$conn->close();
?>
