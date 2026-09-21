<?php
// Public read-only feed for the site's admin-managed link/service blocks —
// Perkhidmatan Utama (homepage carousel), Pautan Utama (dashboard sidebar),
// and Pautan Luaran (footer, every page). Active rows only, ?type= filters
// to one of the three; omitted returns all three types together.
require_once 'db.php';
$conn = getDbConnection();

header('Content-Type: application/json');

$type = $_GET['type'] ?? null;
$validTypes = ['perkhidmatan', 'pautan_utama', 'pautan_luaran'];

if ($type !== null && !in_array($type, $validTypes)) {
    http_response_code(400);
    echo json_encode(['error' => 'type tidak sah']);
    exit;
}

if ($type) {
    $stmt = $conn->prepare("SELECT id, type, title, url, image_path FROM pautan WHERE aktif = 1 AND type = ? ORDER BY sort_order ASC, id ASC");
    $stmt->bind_param("s", $type);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = [];
    while ($row = $result->fetch_assoc()) $data[] = $row;
    $stmt->close();
    echo json_encode(['data' => $data]);
} else {
    $result = $conn->query("SELECT id, type, title, url, image_path FROM pautan WHERE aktif = 1 ORDER BY type ASC, sort_order ASC, id ASC");
    $grouped = ['perkhidmatan' => [], 'pautan_utama' => [], 'pautan_luaran' => []];
    while ($row = $result->fetch_assoc()) {
        $grouped[$row['type']][] = $row;
    }
    echo json_encode(['data' => $grouped]);
}

$conn->close();
?>
