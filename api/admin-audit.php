<?php
// Log Audit — read-only trail of who logged in and what admin actions they
// took (create/update/delete across every module, plus access grants). Super
// Admin only; nobody else's login even establishes a session that could see
// this, since requireSuperAdmin() checks the real server-side session role.
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
requireSuperAdmin();
$conn = getDbConnection();

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

if ($method !== 'GET') {
    http_response_code(405);
    die(json_encode(["error" => "Kaedah tidak dibenarkan"]));
}

$page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
$limit = isset($_GET['limit']) ? max(1, (int)$_GET['limit']) : 30;
$offset = ($page - 1) * $limit;

$user = isset($_GET['user']) ? trim($_GET['user']) : '';
$module = isset($_GET['module']) ? trim($_GET['module']) : '';
$action = isset($_GET['action_type']) ? trim($_GET['action_type']) : '';
$search = isset($_GET['search']) ? trim($_GET['search']) : '';

$where = " WHERE 1=1";
$params = [];
$types = "";

if ($user !== '') {
    $where .= " AND user_email = ?";
    $params[] = $user;
    $types .= "s";
}
if ($module !== '' && $module !== 'semua') {
    $where .= " AND module = ?";
    $params[] = $module;
    $types .= "s";
}
if ($action !== '' && $action !== 'semua') {
    $where .= " AND action = ?";
    $params[] = $action;
    $types .= "s";
}
if ($search !== '') {
    $where .= " AND (description LIKE ? OR user_name LIKE ?)";
    $s = "%$search%";
    $params[] = $s;
    $params[] = $s;
    $types .= "ss";
}

$countSql = "SELECT COUNT(*) as total FROM audit_log" . $where;
$stmtCount = $conn->prepare($countSql);
if (!empty($params)) $stmtCount->bind_param($types, ...$params);
$stmtCount->execute();
$total = $stmtCount->get_result()->fetch_assoc()['total'];
$stmtCount->close();

$dataSql = "SELECT * FROM audit_log" . $where . " ORDER BY created_at DESC LIMIT ? OFFSET ?";
$dataParams = $params;
$dataParams[] = $limit;
$dataParams[] = $offset;
$dataTypes = $types . "ii";

$stmt = $conn->prepare($dataSql);
$stmt->bind_param($dataTypes, ...$dataParams);
$stmt->execute();
$result = $stmt->get_result();
$data = [];
while ($row = $result->fetch_assoc()) $data[] = $row;
$stmt->close();

// Distinct users list — powers the "Staf" filter dropdown without a
// separate round-trip.
$usersResult = $conn->query("SELECT DISTINCT user_email, user_name FROM audit_log ORDER BY user_name ASC");
$users = [];
while ($row = $usersResult->fetch_assoc()) $users[] = $row;

echo json_encode([
    'data' => $data,
    'total' => (int)$total,
    'page' => $page,
    'limit' => $limit,
    'totalPages' => ceil($total / $limit),
    'users' => $users
]);

$conn->close();
?>
