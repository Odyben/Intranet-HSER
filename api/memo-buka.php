<?php
// Membuka / memuat turun fail memo. Satu-satunya laluan ke fail memo (folder
// storan disekat dari akses terus), jadi setiap pembukaan oleh staf direkod
// dalam Log Audit.
//
//   ?id=N               papar dalam pelayar (PDF / gambar)
//   &muat_turun=1       muat turun sebagai fail
//   &pratonton=1        pratonton oleh admin dari Panel Pentadbir — tidak direkod
//                       sebagai staf membuka memo
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
require_once 'memo_lib.php';
startSession();

function gagal($kod, $mesej) {
    http_response_code($kod);
    header('Content-Type: text/html; charset=utf-8');
    die('<!DOCTYPE html><html lang="ms"><head><meta charset="utf-8"><title>Memo</title></head>'
        . '<body style="font-family:Arial,sans-serif; display:flex; align-items:center; justify-content:center; min-height:90vh; color:#334155;">'
        . '<p style="font-size:15px;">' . htmlspecialchars($mesej) . '</p></body></html>');
}

if (empty($_SESSION['user_email'])) gagal(401, 'Sila log masuk ke Intranet semula untuk membuka memo ini.');

$conn = getDbConnection();
pastikanSkemaMemo($conn);

$stmt = $conn->prepare("SELECT * FROM memo WHERE id = ?");
$id = (int)($_GET['id'] ?? 0);
$stmt->bind_param("i", $id);
$stmt->execute();
$m = $stmt->get_result()->fetch_assoc();
$stmt->close();

$role = $_SESSION['role'] ?? '';
$adminMemo = $role === 'super_admin' || (in_array($role, ['admin', 'ketua_unit'], true) && in_array('memo', $_SESSION['modules'] ?? [], true));
$pratontonAdmin = !empty($_GET['pratonton']) && $adminMemo;

if (!$m || (!$m['dipapar'] && !$pratontonAdmin)) gagal(404, 'Memo tidak dijumpai atau telah ditarik balik.');
$laluan = MEMO_DIR . basename($m['fail_simpan']);
if (!is_file($laluan)) gagal(404, 'Fail memo tiada di pelayan. Sila maklumkan kepada admin.');

$muatTurun = !empty($_GET['muat_turun']);

// HEAD digunakan oleh pratonton untuk menyemak fail wujud — bukan pembukaan sebenar
if ($_SERVER['REQUEST_METHOD'] !== 'HEAD' && !$pratontonAdmin) {
    // Pratonton dan muat turun berturut-turut oleh staf yang sama dalam 10
    // minit dikira satu pembukaan, supaya log tidak dipenuhi rekod berulang.
    $awalan = awalanAuditMemo($m['id']);
    $emel = $_SESSION['user_email'];
    $stmt = $conn->prepare("SELECT id FROM audit_log WHERE module = 'memo' AND action = 'view' AND user_email = ? AND description LIKE ? AND created_at >= NOW() - INTERVAL 10 MINUTE LIMIT 1");
    $cari = $awalan . '%';
    $stmt->bind_param("ss", $emel, $cari);
    $stmt->execute();
    $baruDibuka = !$stmt->get_result()->fetch_assoc();
    $stmt->close();
    if ($baruDibuka) {
        logAudit($conn, 'view', 'memo', $awalan . ' ' . $m['tajuk'] . ($muatTurun ? ' (muat turun)' : ''));
    }
}
$conn->close();
session_write_close();

$namaFail = $m['fail_nama'];
header('Content-Type: ' . (MEMO_JENIS_FAIL[$m['fail_jenis']] ?? 'application/octet-stream'));
header('Content-Length: ' . filesize($laluan));
header('X-Content-Type-Options: nosniff');
header('Cache-Control: private, no-store');
header('Content-Disposition: ' . ($muatTurun ? 'attachment' : 'inline')
    . '; filename="' . preg_replace('/[^\x20-\x7E]|"/', '_', $namaFail) . '"; filename*=UTF-8\'\'' . rawurlencode($namaFail));
if ($_SERVER['REQUEST_METHOD'] !== 'HEAD') readfile($laluan);
?>
