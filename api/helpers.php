<?php
// Shared request-body helpers for the API endpoints (removes repeated
// json_decode/validate boilerplate that used to live in every file).

function jsonInput() {
    $data = json_decode(file_get_contents('php://input'), true);
    if (!$data) {
        die(json_encode(["error" => "Data tidak sah"]));
    }
    return $data;
}

function requireInputId($input) {
    if (!isset($input['id'])) {
        die(json_encode(["error" => "ID diperlukan"]));
    }
    return $input['id'];
}

// Records one row in audit_log — who (from the session, so it can't be
// spoofed by the client), did what, to which module, when, from which IP.
// Only Super Admin can ever read this back (see api/admin-audit.php).
function logAudit($conn, $action, $module, $description = '') {
    $email = $_SESSION['user_email'] ?? 'unknown';
    $name = $_SESSION['user_name'] ?? 'unknown';
    $role = $_SESSION['role'] ?? 'unknown';
    $ip = $_SERVER['REMOTE_ADDR'] ?? '';
    $stmt = $conn->prepare("INSERT INTO audit_log (user_email, user_name, role, action, module, description, ip_address) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssss", $email, $name, $role, $action, $module, $description, $ip);
    $stmt->execute();
    $stmt->close();
}

// Formats a "HH:MM:SS" or "HH:MM" DB time value as 12-hour "hh:mm AM/PM".
function to12HourFormat($timeStr) {
    $parts = explode(':', $timeStr ?? '00:00');
    $h = (int)($parts[0] ?? 0);
    $m = $parts[1] ?? '00';
    $ampm = $h >= 12 ? 'PM' : 'AM';
    $h12 = $h % 12;
    if ($h12 === 0) $h12 = 12;
    return str_pad($h12, 2, '0', STR_PAD_LEFT) . ':' . $m . ' ' . $ampm;
}
?>
