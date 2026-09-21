<?php
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('telefon');
$conn = getDbConnection();

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        // Get all groups with their items
        $sql = "SELECT * FROM telefon_groups ORDER BY sort_order ASC";
        $result = $conn->query($sql);
        $data = [];
        while ($row = $result->fetch_assoc()) {
            $groupId = $row['id'];
            $sqlItems = "SELECT * FROM telefon_items WHERE group_id = $groupId ORDER BY sort_order ASC";
            $resultItems = $conn->query($sqlItems);
            $items = [];
            while ($item = $resultItems->fetch_assoc()) $items[] = $item;
            $row['items'] = $items;
            $data[] = $row;
        }
        echo json_encode(['data' => $data]);
        break;

    case 'POST':
        $input = jsonInput();

        $action = $input['action'] ?? 'add_group';

        if ($action === 'add_group') {
            $group_name = $input['group_name'] ?? '';
            $color = $input['color'] ?? '';
            $icon = $input['icon'] ?? '';

            // Get next sort order
            $maxOrder = $conn->query("SELECT MAX(sort_order) as m FROM telefon_groups")->fetch_assoc()['m'];
            $nextOrder = ($maxOrder ?: 0) + 1;

            $stmt = $conn->prepare("INSERT INTO telefon_groups (group_name, color, icon, sort_order) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("sssi", $group_name, $color, $icon, $nextOrder);
            if ($stmt->execute()) {
                logAudit($conn, 'create', 'telefon', 'Menambah kumpulan telefon: ' . $group_name);
                echo json_encode(["success" => true, "id" => $stmt->insert_id, "message" => "Kumpulan berjaya ditambah"]);
            } else {
                echo json_encode(["error" => $stmt->error]);
            }
            $stmt->close();
        } elseif ($action === 'add_item') {
            $group_id = (int)($input['group_id'] ?? 0);
            $name = $input['name'] ?? '';
            $ext = $input['ext'] ?? '';

            $maxOrderStmt = $conn->prepare("SELECT MAX(sort_order) as m FROM telefon_items WHERE group_id = ?");
            $maxOrderStmt->bind_param("i", $group_id);
            $maxOrderStmt->execute();
            $maxOrder = $maxOrderStmt->get_result()->fetch_assoc()['m'];
            $maxOrderStmt->close();
            $nextOrder = ($maxOrder ?: 0) + 1;

            $stmt = $conn->prepare("INSERT INTO telefon_items (group_id, name, ext, sort_order) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("issi", $group_id, $name, $ext, $nextOrder);
            if ($stmt->execute()) {
                logAudit($conn, 'create', 'telefon', 'Menambah nombor telefon: ' . $name . ' (' . $ext . ')');
                echo json_encode(["success" => true, "id" => $stmt->insert_id, "message" => "Item berjaya ditambah"]);
            } else {
                echo json_encode(["error" => $stmt->error]);
            }
            $stmt->close();
        }
        break;

    case 'PUT':
        $input = jsonInput();

        $action = $input['action'] ?? 'update_group';
        $id = requireInputId($input);

        if ($action === 'update_group') {
            $group_name = $input['group_name'] ?? '';
            $color = $input['color'] ?? '';
            $icon = $input['icon'] ?? '';

            $stmt = $conn->prepare("UPDATE telefon_groups SET group_name=?, color=?, icon=? WHERE id=?");
            $stmt->bind_param("sssi", $group_name, $color, $icon, $id);
            if ($stmt->execute()) {
                logAudit($conn, 'update', 'telefon', 'Mengemaskini kumpulan telefon: ' . $group_name);
                echo json_encode(["success" => true, "message" => "Kumpulan berjaya dikemaskini"]);
            } else {
                echo json_encode(["error" => $stmt->error]);
            }
            $stmt->close();
        } elseif ($action === 'update_item') {
            $name = $input['name'] ?? '';
            $ext = $input['ext'] ?? '';

            $stmt = $conn->prepare("UPDATE telefon_items SET name=?, ext=? WHERE id=?");
            $stmt->bind_param("ssi", $name, $ext, $id);
            if ($stmt->execute()) {
                logAudit($conn, 'update', 'telefon', 'Mengemaskini nombor telefon: ' . $name . ' (' . $ext . ')');
                echo json_encode(["success" => true, "message" => "Item berjaya dikemaskini"]);
            } else {
                echo json_encode(["error" => $stmt->error]);
            }
            $stmt->close();
        }
        break;

    case 'DELETE':
        $input = jsonInput();
        $id = requireInputId($input);

        $action = $input['action'] ?? 'delete_group';

        if ($action === 'delete_group') {
            $lookup = $conn->prepare("SELECT group_name FROM telefon_groups WHERE id=?");
            $lookup->bind_param("i", $id);
            $lookup->execute();
            $deletedName = $lookup->get_result()->fetch_assoc()['group_name'] ?? ('ID ' . $id);
            $lookup->close();

            $stmt = $conn->prepare("DELETE FROM telefon_groups WHERE id=?");
            $stmt->bind_param("i", $id);
        } else {
            $lookup = $conn->prepare("SELECT name FROM telefon_items WHERE id=?");
            $lookup->bind_param("i", $id);
            $lookup->execute();
            $deletedName = $lookup->get_result()->fetch_assoc()['name'] ?? ('ID ' . $id);
            $lookup->close();

            $stmt = $conn->prepare("DELETE FROM telefon_items WHERE id=?");
            $stmt->bind_param("i", $id);
        }

        if ($stmt->execute()) {
            logAudit($conn, 'delete', 'telefon', ($action === 'delete_group' ? 'Memadam kumpulan telefon: ' : 'Memadam nombor telefon: ') . $deletedName);
            echo json_encode(["success" => true, "message" => "Berjaya dipadam"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;
}

$conn->close();
?>
