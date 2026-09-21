<?php
require_once 'db.php';
$conn = getDbConnection();

header('Content-Type: application/json');

$search = isset($_GET['search']) ? $_GET['search'] : '';

$sql = "SELECT * FROM staff";
$params = [];
$types = "";

if ($search !== '') {
    $sql .= " WHERE nama_penuh LIKE ? OR jawatan_sspa LIKE ? OR gred_sspa LIKE ? OR penempatan LIKE ?";
    $searchTerm = "%$search%";
    $params = [$searchTerm, $searchTerm, $searchTerm, $searchTerm];
    $types = "ssss";
}

$sql .= " ORDER BY bil ASC";

$stmt = $conn->prepare($sql);
if ($search !== '') {
    $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$result = $stmt->get_result();

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);

$stmt->close();
$conn->close();
?>
