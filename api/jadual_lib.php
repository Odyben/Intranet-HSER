<?php
// Kod bersama modul Jadual Perancangan — borang untuk Unit Pentadbiran
// menyediakan jadual tahunan CME dan Perhimpunan Bulanan, kemudian memuat
// turunnya dalam format Excel/PDF yang sama dengan jadual rasmi sedia ada.
// Pengesahan (Disediakan / Disemak / Disahkan) ditandatangan di atas kertas;
// sistem hanya menyimpan nama yang dicetak.

const JADUAL_JENIS = [
    'cme'         => 'CME',
    'perhimpunan' => 'Perhimpunan Bulanan',
];

function pastikanSkemaJadual($conn) {
    $conn->query("CREATE TABLE IF NOT EXISTS `jadual_perancangan` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `jenis` VARCHAR(30) NOT NULL,
        `tajuk` VARCHAR(255) NOT NULL,
        `tahun` SMALLINT NOT NULL,
        `masa` VARCHAR(100) NULL,
        `tempat` VARCHAR(255) NULL,
        `tanggungjawab` TEXT NULL,
        `disediakan_nama` VARCHAR(255) NULL,
        `disemak_nama` VARCHAR(255) NULL,
        `disahkan_nama` VARCHAR(255) NULL,
        `dicipta_oleh` VARCHAR(255) NULL,
        `dicipta_pada` DATETIME NOT NULL,
        `dikemaskini_oleh` VARCHAR(255) NULL,
        `dikemaskini_pada` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

    $conn->query("CREATE TABLE IF NOT EXISTS `jadual_perancangan_sesi` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `jadual_id` INT NOT NULL,
        `tarikh` DATE NOT NULL,
        `penganjur` VARCHAR(255) NULL,
        `catatan` VARCHAR(500) NULL,
        KEY `jadual_tarikh` (`jadual_id`, `tarikh`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
}

// Terima 'YYYY-MM-DD' sahaja; pulangkan null untuk nilai kosong atau rosak.
function tarikhSah($s) {
    $s = trim((string)$s);
    if ($s === '' || !preg_match('/^\d{4}-\d{2}-\d{2}$/', $s)) return null;
    [$y, $m, $d] = array_map('intval', explode('-', $s));
    return checkdate($m, $d, $y) ? $s : null;
}

// Cadangan nama unit untuk ruangan penganjur: penempatan dalam Direktori
// Kakitangan dan nama penganjur yang pernah digunakan dalam jadual.
function senaraiUnitJadual($conn) {
    $unit = [];
    $res = $conn->query("SELECT DISTINCT TRIM(penempatan) u FROM staff WHERE penempatan IS NOT NULL AND TRIM(penempatan) NOT IN ('', '-', 'Tiada Rekod')");
    while ($r = $res->fetch_assoc()) $unit[mb_strtoupper($r['u'])] = true;
    $res = $conn->query("SELECT DISTINCT TRIM(penganjur) u FROM jadual_perancangan_sesi WHERE penganjur IS NOT NULL AND TRIM(penganjur) <> ''");
    while ($r = $res->fetch_assoc()) $unit[mb_strtoupper($r['u'])] = true;
    $senarai = array_keys($unit);
    sort($senarai);
    return $senarai;
}
?>
