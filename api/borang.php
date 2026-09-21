<?php
require_once 'db.php';
$conn = getDbConnection();

header('Content-Type: application/json');

$search = isset($_GET['search']) ? $_GET['search'] : '';
$category = isset($_GET['category']) ? $_GET['category'] : '';

// uploaded_at (created_at) is what "Terbaru" sorts by — doc_date is the
// form's own version date and is free text ("2023", "20 Sep 2023").
$sql = "SELECT id, name, category, cat_label as catLabel, version, doc_date as date, size, type, uploader, description as `desc`, file_path as file, created_at as uploaded_at FROM borang WHERE 1=1";
$params = [];
$types = "";

if ($search !== '') {
    $sql .= " AND (name LIKE ? OR description LIKE ?)";
    $searchTerm = "%$search%";
    $params[] = $searchTerm;
    $params[] = $searchTerm;
    $types .= "ss";
}

if ($category !== '' && $category !== 'semua') {
    $sql .= " AND category = ?";
    $params[] = $category;
    $types .= "s";
}

$sql .= " ORDER BY created_at DESC, id DESC";

$stmt = $conn->prepare($sql);
if (!empty($params)) {
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
