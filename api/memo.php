<?php
// Senarai memo untuk staf (dipaparkan dalam Pusat Dokumen). Fail dibuka
// melalui memo-buka.php supaya pembukaan direkod dalam Log Audit.
require_once 'db.php';
require_once 'auth.php';
require_once 'memo_lib.php';
startSession();
header('Content-Type: application/json');

if (empty($_SESSION['user_email'])) {
    http_response_code(401);
    die(json_encode(["error" => "Sila log masuk semula"]));
}
session_write_close();

$conn = getDbConnection();
pastikanSkemaMemo($conn);

$res = $conn->query("SELECT id, tajuk, no_rujukan, tarikh_surat, daripada, jenis, keterangan, fail_jenis, fail_saiz, dicipta_pada
    FROM memo WHERE dipapar = 1 ORDER BY tarikh_surat DESC, id DESC");
$data = [];
while ($row = $res->fetch_assoc()) {
    $row['saiz'] = saizMesra((int)$row['fail_saiz']);
    unset($row['fail_saiz']);
    $data[] = $row;
}
echo json_encode(['data' => $data]);
$conn->close();
?>
