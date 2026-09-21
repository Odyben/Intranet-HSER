<?php
// Pengurusan Akses — lets a Super Admin grant/revoke admin-tier access to
// staff members and choose exactly which admin panel modules each Admin /
// Ketua Unit may use. Super Admin itself always has full access and is not
// module-restricted.
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
requireSuperAdmin();
$conn = getDbConnection();

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        $action = isset($_GET['action']) ? $_GET['action'] : 'list';

        if ($action === 'moh_emails') {
            // Source list for the staff picker — real MOH emails already on
            // file in the staff directory, deduplicated, so the super admin
            // never has to hand-type an address.
            $result = $conn->query("SELECT DISTINCT nama_penuh, emel_rasmi, penempatan FROM staff WHERE emel_rasmi LIKE '%@moh.gov.my' ORDER BY nama_penuh ASC");
            $data = [];
            while ($row = $result->fetch_assoc()) $data[] = $row;
            echo json_encode(['data' => $data]);
            break;
        }

        // Default: everyone currently holding admin-tier access.
        $result = $conn->query("SELECT id, email, name, role, modules, created_at FROM users WHERE role != 'staff' ORDER BY FIELD(role, 'super_admin', 'admin', 'ketua_unit'), name ASC");
        $data = [];
        while ($row = $result->fetch_assoc()) {
            $row['modules'] = $row['modules'] ? json_decode($row['modules'], true) : [];
            $data[] = $row;
        }
        echo json_encode(['data' => $data]);
        break;

    case 'POST':
        $input = jsonInput();
        $email = trim($input['email'] ?? '');
        $name = trim($input['name'] ?? '');
        $role = $input['role'] ?? '';
        $modules = isset($input['modules']) && is_array($input['modules']) ? $input['modules'] : [];

        if (!$email || !preg_match('/@moh\.gov\.my$/i', $email)) {
            die(json_encode(["error" => "Emel MOH yang sah diperlukan"]));
        }
        if (!in_array($role, ['ketua_unit', 'admin', 'super_admin'], true)) {
            die(json_encode(["error" => "Peringkat akses tidak sah"]));
        }

        // Super admin doesn't need a module list — they already see everything.
        $modulesJson = $role === 'super_admin' ? null : json_encode(array_values($modules));

        $existing = $conn->prepare("SELECT id FROM users WHERE email = ?");
        $existing->bind_param("s", $email);
        $existing->execute();
        $existingRow = $existing->get_result()->fetch_assoc();
        $existing->close();

        if ($existingRow) {
            $stmt = $conn->prepare("UPDATE users SET name = IF(? != '', ?, name), role = ?, modules = ? WHERE email = ?");
            $stmt->bind_param("sssss", $name, $name, $role, $modulesJson, $email);
        } else {
            if (!$name) $name = $email; // placeholder until they log in and their real Google name syncs
            $stmt = $conn->prepare("INSERT INTO users (email, name, role, modules) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("ssss", $email, $name, $role, $modulesJson);
        }

        if ($stmt->execute()) {
            $roleLabels = ['super_admin' => 'Super Admin', 'admin' => 'Admin', 'ketua_unit' => 'Ketua Unit'];
            logAudit($conn, 'update', 'akses', 'Memberi akses ' . ($roleLabels[$role] ?? $role) . ' kepada: ' . $email . ($modulesJson ? ' (modul: ' . implode(', ', $modules) . ')' : ''));
            echo json_encode(["success" => true, "message" => "Akses berjaya disimpan"]);
        } else {
            echo json_encode(["error" => "Gagal menyimpan: " . $stmt->error]);
        }
        $stmt->close();
        break;

    case 'DELETE':
        $input = jsonInput();
        $email = trim($input['email'] ?? '');
        if (!$email) die(json_encode(["error" => "Emel diperlukan"]));

        if (($_SESSION['user_email'] ?? '') === $email) {
            die(json_encode(["error" => "Tidak boleh menarik balik akses akaun sendiri"]));
        }

        $stmt = $conn->prepare("UPDATE users SET role = 'staff', modules = NULL WHERE email = ?");
        $stmt->bind_param("s", $email);

        if ($stmt->execute()) {
            logAudit($conn, 'delete', 'akses', 'Menarik balik akses admin: ' . $email);
            echo json_encode(["success" => true, "message" => "Akses berjaya ditarik balik"]);
        } else {
            echo json_encode(["error" => "Gagal menarik balik akses: " . $stmt->error]);
        }
        $stmt->close();
        break;
}

$conn->close();
?>
