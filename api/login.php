<?php
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';

header('Content-Type: application/json');
startSession();

$conn = getDbConnection();

// Create users table if not exists (for convenience)
$conn->query("CREATE TABLE IF NOT EXISTS `users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `name` VARCHAR(255) NOT NULL,
    `role` ENUM('staff', 'ketua_unit', 'admin', 'super_admin') DEFAULT 'staff',
    `modules` TEXT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    $email = trim($data['email'] ?? '');
    $name = trim($data['name'] ?? '');

    if (!$email) {
        die(json_encode(['error' => 'Email diperlukan']));
    }

    // Server-side domain check (the JS check on the login page can be bypassed)
    if (!preg_match('/@moh\.gov\.my$/i', $email)) {
        http_response_code(403);
        die(json_encode(['error' => 'Hanya email @moh.gov.my dibenarkan']));
    }

    $stmt = $conn->prepare("SELECT * FROM `users` WHERE `email` = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $userRecord = $stmt->get_result()->fetch_assoc();
    $stmt->close();

    if ($userRecord) {
        $role = $userRecord['role'];
        $modules = $userRecord['modules'] ? json_decode($userRecord['modules'], true) : [];
        // A super admin may have pre-assigned this person a role/modules
        // before their very first login (see api/admin-access.php) — in that
        // case the row already exists with the right role, so nothing else
        // to do here besides keeping their display name in sync.
        if ($userRecord['name'] !== $name && $name !== '') {
            $upd = $conn->prepare("UPDATE `users` SET `name` = ? WHERE `email` = ?");
            $upd->bind_param("ss", $name, $email);
            $upd->execute();
            $upd->close();
        }
    } else {
        // Nobody logs in as anything but 'staff' by default — admin-tier
        // access is only ever granted explicitly via Pengurusan Akses.
        $role = 'staff';
        $modules = [];

        $insert = $conn->prepare("INSERT INTO `users` (`email`, `name`, `role`) VALUES (?, ?, ?)");
        $insert->bind_param("sss", $email, $name, $role);
        $insert->execute();
        $insert->close();
    }

    // Establish the real server-side session used to gate the admin API
    $_SESSION['user_email'] = $email;
    $_SESSION['user_name'] = $name;
    $_SESSION['role'] = $role;
    $_SESSION['modules'] = $modules;

    logAudit($conn, 'login', 'auth', 'Log masuk ke sistem');

    echo json_encode(['success' => true, 'role' => $role, 'modules' => $modules]);
}

$conn->close();
?>
