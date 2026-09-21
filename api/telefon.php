<?php
require_once 'db.php';
$conn = getDbConnection();

header('Content-Type: application/json');

$sql = "SELECT * FROM telefon_groups ORDER BY sort_order ASC";
$result = $conn->query($sql);

$data = [];
while ($groupRow = $result->fetch_assoc()) {
    $group = [
        'group' => $groupRow['group_name'],
        'color' => $groupRow['color'],
        'icon' => $groupRow['icon'],
        'items' => []
    ];
    
    $groupId = $groupRow['id'];
    $sqlItems = "SELECT name, ext FROM telefon_items WHERE group_id = $groupId ORDER BY sort_order ASC";
    $resultItems = $conn->query($sqlItems);
    
    while ($itemRow = $resultItems->fetch_assoc()) {
        $group['items'][] = [
            'name' => $itemRow['name'],
            'ext' => $itemRow['ext']
        ];
    }
    
    $data[] = $group;
}

echo json_encode($data);

$conn->close();
?>
