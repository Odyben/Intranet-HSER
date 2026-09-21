<?php
require_once 'db.php';
require_once 'auth.php';
requireAdmin();
$conn = getDbConnection();

header('Content-Type: application/json');

// Handle POST request
$data = json_decode(file_get_contents('php://input'), true);

if (!$data) {
    die(json_encode(["error" => "No data received. Please send JSON payload."]));
}

$response = ["log" => []];

// 1. Seed Staff Data
if (isset($data['staff']) && is_array($data['staff'])) {
    $conn->query("TRUNCATE TABLE staff");
    $stmt = $conn->prepare("INSERT INTO staff (bil, nama, jawatan, gred, penempatan) VALUES (?, ?, ?, ?, ?)");
    $count = 0;
    foreach ($data['staff'] as $s) {
        $stmt->bind_param("issss", $s['bil'], $s['nama'], $s['jawatan'], $s['gred'], $s['penempatan']);
        $stmt->execute();
        $count++;
    }
    $stmt->close();
    $response["log"][] = "Seeded $count staff records.";
}

// 2. Seed Telefon Data
if (isset($data['telefon']) && is_array($data['telefon'])) {
    $conn->query("SET FOREIGN_KEY_CHECKS = 0");
    $conn->query("TRUNCATE TABLE telefon_items");
    $conn->query("TRUNCATE TABLE telefon_groups");
    $conn->query("SET FOREIGN_KEY_CHECKS = 1");
    
    $stmtGroup = $conn->prepare("INSERT INTO telefon_groups (group_name, color, icon, sort_order) VALUES (?, ?, ?, ?)");
    $stmtItem = $conn->prepare("INSERT INTO telefon_items (group_id, name, ext, sort_order) VALUES (?, ?, ?, ?)");
    
    $groupCount = 0;
    $itemCount = 0;
    foreach ($data['telefon'] as $index => $g) {
        $sortOrder = $index + 1;
        $stmtGroup->bind_param("sssi", $g['group'], $g['color'], $g['icon'], $sortOrder);
        $stmtGroup->execute();
        $groupId = $stmtGroup->insert_id;
        $groupCount++;
        
        if (isset($g['items']) && is_array($g['items'])) {
            foreach ($g['items'] as $itemIndex => $item) {
                $itemSort = $itemIndex + 1;
                $stmtItem->bind_param("issi", $groupId, $item['name'], $item['ext'], $itemSort);
                $stmtItem->execute();
                $itemCount++;
            }
        }
    }
    $stmtGroup->close();
    $stmtItem->close();
    $response["log"][] = "Seeded $groupCount telephone groups with $itemCount items.";
}

// 3. Seed Dokumen Data
if (isset($data['dokumen']) && is_array($data['dokumen'])) {
    $conn->query("TRUNCATE TABLE dokumen");
    $stmt = $conn->prepare("INSERT INTO dokumen (name, category, cat_label, version, doc_date, size, type, uploader, description, file_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $count = 0;
    foreach ($data['dokumen'] as $d) {
        $stmt->bind_param("ssssssssss", 
            $d['name'], $d['category'], $d['catLabel'], 
            $d['version'], $d['date'], $d['size'], 
            $d['type'], $d['uploader'], $d['desc'], $d['file']
        );
        $stmt->execute();
        $count++;
    }
    $stmt->close();
    $response["log"][] = "Seeded $count document records.";
}

$response["success"] = true;
$response["message"] = "Data seeding completed successfully!";
echo json_encode($response, JSON_PRETTY_PRINT);
$conn->close();
?>
