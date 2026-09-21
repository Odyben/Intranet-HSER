<?php
require_once 'db.php';
$conn = getDbConnection();

header('Content-Type: application/json');

$result = $conn->query("SELECT id, image_path, caption FROM slideshow WHERE aktif = 1 ORDER BY sort_order ASC, id ASC");
$data = [];
while ($row = $result->fetch_assoc()) $data[] = $row;

echo json_encode(['data' => $data]);
$conn->close();
?>
