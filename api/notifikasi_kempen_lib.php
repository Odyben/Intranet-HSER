<?php
// Kod bersama untuk Notifikasi Emel: skema jadual penghantaran individu,
// had penghantaran, dan pengelasan notis bounce.
//
// Latar belakang (11 Sept 2026): hebahan kepada 153 staf dihantar sebagai
// 7 batch BCC berturut-turut dari akaun Gmail. Hanya 39 staf menerimanya —
// 11 alamat dalam direktori tidak wujud, dan selepas batch ke-2 Gmail
// menolak semua batch seterusnya (5.7.1 Message rejected). Tiada rekod siapa
// yang terima, dan skrip mati (had 120s) sebelum sempat menulis audit log.
// Sebab itu penghantaran kepada ramai penerima kini dibuat satu emel bagi
// setiap staf, perlahan-lahan, dengan status setiap penerima direkod dan
// bounce dibaca semula dari peti emel sistem.

// Sehingga had ini, emel dihantar sekali gus dengan semua penerima di To:.
// Melebihi had ini mesti melalui penghantaran individu (admin-notifikasi-kempen.php).
const NOTIF_HAD_SEKALI_GUS = 50;

// Jarak minimum antara dua emel dalam satu penghantaran. Pelayar menunggu
// lebih lama (lihat KEMPEN_JARAK_MS dalam admin.html); ini cuma benteng di
// pelayan kalau permintaan dihantar terlalu rapat.
const KEMPEN_JARAK_MIN_SAAT = 5;

// Gambar besar yang sama dihantar berpuluh kali ialah antara isyarat spam
// yang menyebabkan Gmail menyekat penghantaran 11 Sept (2.2MB setiap emel).
// Pelayar memampatkan gambar sebelum sampai ke sini; had ini benteng terakhir.
const KEMPEN_MAX_IMEJ_BYTES   = 1024 * 1024;
const KEMPEN_MAX_JUMLAH_BYTES = 2 * 1024 * 1024;

const KEMPEN_STATUS_LABEL = [
    'draf'       => 'Draf',
    'menghantar' => 'Sedang dihantar',
    'dijeda'     => 'Dijeda',
    'selesai'    => 'Selesai',
    'dihentikan' => 'Dihentikan',
    'diimport'   => 'Rekod lama',
];

function pastikanSkemaNotifikasi($conn) {
    $conn->query("CREATE TABLE IF NOT EXISTS `notifikasi_kempen` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `tajuk` VARCHAR(255) NOT NULL,
        `kandungan_html` MEDIUMTEXT NULL,
        `imej_json` TEXT NULL,
        `status` VARCHAR(20) NOT NULL DEFAULT 'draf',
        `sebab_henti` VARCHAR(1000) NULL,
        `sumber_kempen_id` INT NULL,
        `dicipta_oleh` VARCHAR(255) NULL,
        `dicipta_pada` DATETIME NOT NULL,
        `mula_hantar` DATETIME NULL,
        `selesai_pada` DATETIME NULL,
        `aktiviti_terakhir` DATETIME NULL,
        `semakan_bounce` DATETIME NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

    // status penerima: belum | menghantar | dihantar | tidak_wujud | disekat | gagal
    $conn->query("CREATE TABLE IF NOT EXISTS `notifikasi_penerima` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `kempen_id` INT NOT NULL,
        `emel` VARCHAR(255) NOT NULL,
        `nama` VARCHAR(255) NULL,
        `status` VARCHAR(20) NOT NULL DEFAULT 'belum',
        `message_id` VARCHAR(255) NULL,
        `dihantar_pada` DATETIME NULL,
        `ralat` VARCHAR(1000) NULL,
        `dikemaskini_pada` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        UNIQUE KEY `kempen_emel` (`kempen_id`, `emel`),
        KEY `kempen_status` (`kempen_id`, `status`),
        KEY `message_id` (`message_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

    // Alamat yang dilaporkan tidak wujud oleh pelayan emel MOH ditanda terus
    // pada rekod staf, supaya ia tidak dihantar lagi (bounce berulang merosakkan
    // reputasi akaun penghantar) sehingga admin membetulkan emel tersebut.
    $ada = $conn->query("SHOW COLUMNS FROM `staff` LIKE 'emel_status'");
    if ($ada && $ada->num_rows === 0) {
        $conn->query("ALTER TABLE `staff`
            ADD COLUMN `emel_status` VARCHAR(20) NULL DEFAULT NULL AFTER `emel_rasmi`,
            ADD COLUMN `emel_status_nota` VARCHAR(255) NULL DEFAULT NULL AFTER `emel_status`");
    }
}

// Semua staf yang boleh menerima notifikasi: emel rasmi @moh.gov.my yang
// belum dilaporkan tidak wujud. Dipulangkan sebagai emel => nama.
function senaraiPenerimaSah($conn) {
    $result = $conn->query("SELECT DISTINCT nama_penuh, emel_rasmi FROM staff
        WHERE emel_rasmi LIKE '%@moh.gov.my' AND (emel_status IS NULL OR emel_status <> 'tidak_wujud')
        ORDER BY nama_penuh ASC");
    $senarai = [];
    while ($row = $result->fetch_assoc()) {
        $senarai[$row['emel_rasmi']] = $row['nama_penuh'];
    }
    return $senarai;
}

function kiraanPenerimaKempen($conn, $kempenId) {
    $stmt = $conn->prepare("SELECT status, COUNT(*) AS bil FROM notifikasi_penerima WHERE kempen_id = ? GROUP BY status");
    $stmt->bind_param("i", $kempenId);
    $stmt->execute();
    $res = $stmt->get_result();
    $kiraan = ['jumlah' => 0, 'belum' => 0, 'menghantar' => 0, 'dihantar' => 0, 'tidak_wujud' => 0, 'disekat' => 0, 'gagal' => 0];
    while ($row = $res->fetch_assoc()) {
        $kiraan[$row['status']] = (int)$row['bil'];
        $kiraan['jumlah'] += (int)$row['bil'];
    }
    $stmt->close();
    return $kiraan;
}

// Mengelaskan satu notis bounce kepada status penerima.
//   tidak_wujud — alamat tiada dalam pelayan emel MOH (5.1.x / NoSuchUser)
//   disekat     — mesej ditolak kerana dasar/spam/had (5.7.x, 4.7.x, 5.4.5)
//   gagal       — sebab lain
function kelaskanBounce($status, $diagnostik) {
    $teks = $status . ' ' . $diagnostik;
    if (preg_match('/\b5\.1\.\d\b|NoSuchUser|does not exist|address not found|user unknown/i', $teks)) {
        return 'tidak_wujud';
    }
    if (preg_match('/\b[45]\.7\.\d+\b|\b5\.4\.5\b|\brejected\b|\bblocked\b|\bspam\b|\bunsolicited\b|\blimit\b/i', $teks)) {
        return 'disekat';
    }
    return 'gagal';
}

function folderImejKempen($kempenId) {
    return __DIR__ . '/storage/notifikasi/' . (int)$kempenId;
}

// Folder storan tidak boleh dibuka terus melalui pelayar — gambar hanya
// dibaca oleh PHP semasa menghantar emel.
function sediakanFolderStorage() {
    $akar = __DIR__ . '/storage';
    if (!is_dir($akar . '/notifikasi')) {
        mkdir($akar . '/notifikasi', 0755, true);
    }
    if (!file_exists($akar . '/.htaccess')) {
        file_put_contents($akar . '/.htaccess', "Require all denied\n");
    }
}
?>
