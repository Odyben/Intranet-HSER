<?php
// Kod bersama bahagian Memo — memo / surat arahan untuk semua staf, dimuat
// naik oleh admin dan dipaparkan dalam Pusat Dokumen.
//
// Fail memo disimpan dalam api/storage/memo/ yang tidak boleh dibuka terus
// melalui pelayar (lihat api/storage/.htaccess). Staf hanya boleh membukanya
// melalui api/memo-buka.php, yang memerlukan log masuk dan merekod siapa yang
// membuka memo dalam Log Audit — rekod itu tidak boleh dielak dengan menyalin
// pautan fail.

const MEMO_DIR = __DIR__ . '/storage/memo/';
const MEMO_JENIS_FAIL = [
    'pdf'  => 'application/pdf',
    'jpg'  => 'image/jpeg',
    'jpeg' => 'image/jpeg',
    'png'  => 'image/png',
    'doc'  => 'application/msword',
    'docx' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
];
const MEMO_MAX_BYTES = 20 * 1024 * 1024;
// Cadangan awal ruangan Jenis — admin boleh menaip jenis lain
const MEMO_JENIS_LALAI = ['Memo', 'Surat Arahan', 'Surat Makluman', 'Pekeliling'];

function pastikanSkemaMemo($conn) {
    $conn->query("CREATE TABLE IF NOT EXISTS `memo` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `tajuk` VARCHAR(500) NOT NULL,
        `no_rujukan` VARCHAR(150) NULL,
        `tarikh_surat` DATE NOT NULL,
        `daripada` VARCHAR(255) NULL,
        `jenis` VARCHAR(100) NOT NULL DEFAULT 'Memo',
        `keterangan` TEXT NULL,
        `fail_simpan` VARCHAR(255) NOT NULL,
        `fail_nama` VARCHAR(255) NOT NULL,
        `fail_jenis` VARCHAR(10) NOT NULL,
        `fail_saiz` INT NOT NULL,
        `dipapar` TINYINT(1) NOT NULL DEFAULT 1,
        `dimuat_naik_oleh` VARCHAR(255) NULL,
        `dicipta_pada` DATETIME NOT NULL,
        `dikemaskini_pada` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        KEY `papar_tarikh` (`dipapar`, `tarikh_surat`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
}

function sediakanFolderMemo() {
    if (!is_dir(MEMO_DIR)) mkdir(MEMO_DIR, 0755, true);
    $htaccess = __DIR__ . '/storage/.htaccess';
    if (!file_exists($htaccess)) file_put_contents($htaccess, "Require all denied\n");
}

function saizMesra($bait) {
    if ($bait >= 1048576) return round($bait / 1048576, 1) . ' MB';
    return max(1, round($bait / 1024)) . ' KB';
}

// Setiap pembukaan direkod sebagai "Membuka memo #ID: tajuk" (modul memo,
// tindakan view). Awalan inilah yang digunakan untuk mengira siapa yang
// telah membuka sesuatu memo.
function awalanAuditMemo($id) {
    return 'Membuka memo #' . (int)$id . ':';
}
?>
