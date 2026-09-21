<?php
// Session-based auth guards for the admin API endpoints.

function startSession() {
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
}

// Any logged-in admin-tier role (super_admin / admin / ketua_unit) — used for
// read-only endpoints and shared dashboard widgets, which every admin-tier
// role is allowed to see regardless of which specific modules they were
// granted. Actual editing is gated separately by requireModuleAccess().
function requireAdmin() {
    startSession();
    $role = $_SESSION['role'] ?? '';
    if (!in_array($role, ['super_admin', 'admin', 'ketua_unit'], true)) {
        http_response_code(401);
        header('Content-Type: application/json');
        die(json_encode(["error" => "Log masuk sebagai admin diperlukan"]));
    }
}

// Strict per-module gate for anything that creates/edits/deletes data.
// super_admin always passes; admin/ketua_unit must have the module key in
// their assigned modules list (set at login from users.modules).
function requireModuleAccess($moduleKey) {
    startSession();
    $role = $_SESSION['role'] ?? '';
    if ($role === 'super_admin') return;
    if (($role === 'admin' || $role === 'ketua_unit')) {
        $modules = $_SESSION['modules'] ?? [];
        if (in_array($moduleKey, $modules, true)) return;
    }
    http_response_code(403);
    header('Content-Type: application/json');
    die(json_encode(["error" => "Anda tiada akses ke bahagian ini"]));
}

// Reserved for the access-management module itself — only the top tier may
// grant/revoke other people's admin access.
function requireSuperAdmin() {
    startSession();
    if (($_SESSION['role'] ?? '') !== 'super_admin') {
        http_response_code(403);
        header('Content-Type: application/json');
        die(json_encode(["error" => "Hanya Super Admin dibenarkan"]));
    }
}
?>
