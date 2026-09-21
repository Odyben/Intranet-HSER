<?php
// Public read-only feed for the "Galeri Aktiviti" section on the dashboard —
// only active photos, newest activity date first.
require_once 'db.php';
$conn = getDbConnection();

header('Content-Type: application/json');

$limit = isset($_GET['limit']) ? max(1, (int)$_GET['limit']) : 12;

$stmt = $conn->prepare("SELECT id, image_path, title, description, tarikh FROM galeri WHERE aktif = 1 ORDER BY COALESCE(tarikh, created_at) DESC, sort_order ASC, id DESC LIMIT ?");
$stmt->bind_param("i", $limit);
$stmt->execute();
$result = $stmt->get_result();
$data = [];
while ($row = $result->fetch_assoc()) $data[] = $row;
$stmt->close();

echo json_encode(['data' => $data]);
$conn->close();
?>
