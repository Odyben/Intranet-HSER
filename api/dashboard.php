<?php
require_once 'db.php';
$conn = getDbConnection();
header('Content-Type: application/json');

// Count staff
$staffCount = 0;
$r = $conn->query("SELECT COUNT(*) as cnt FROM staff");
if ($r) $staffCount = (int)$r->fetch_assoc()['cnt'];

// Count dokumen
$docCount = 0;
$r = $conn->query("SELECT COUNT(*) as cnt FROM dokumen");
if ($r) $docCount = (int)$r->fetch_assoc()['cnt'];

// Count berita (pengumuman) — published only, drafts stay hidden from staff
$beritaCount = 0;
$r = $conn->query("SELECT COUNT(*) as cnt FROM berita WHERE status = 'published'");
if ($r) $beritaCount = (int)$r->fetch_assoc()['cnt'];

// Unit & Bahagian count — a fixed reference list of Hospital Serian's official
// units/jabatan, NOT derived from staff.penempatan (that free-text field has
// dozens of inconsistent spelling/formatting variants for the same unit, which
// wildly overcounts). Update this list if the hospital's org structure changes.
$officialUnits = [
    'UNIT PENTADBIRAN', 'KEWANGAN, AKAUN & HASIL', 'PEROLEHAN, ICT, ASET & STOR',
    'REKOD PERUBATAN', 'KAWALAN PENYAKIT BERJANGKIT', 'KUALITI', 'PORTER',
    'DIETETIK & SAJIAN', 'KEJURUTERAAN', 'HAL EHWAL ISLAM',
    'PEGAWAI PERUBATAN (MO)', 'KLINIK PAKAR', 'KEJURURAWATAN PENGURUSAN DAN KLINIKAL',
    'PENOLONG PEGAWAI PERUBATAN PENGURUSAN', 'KECEMASAN DAN TRAUMA (ETD)',
    'RADIOLOGI (PENGIMEJAN DIAGNOSTIK)', 'PATOLOGI MAKMAL', 'FARMASI',
    'PSIKIATRI DAN KESIHATAN MENTAL (PSY)', 'WAD PEREMPUAN', 'WAD LELAKI',
    'WAD BERSALIN', 'WAD KANAK-KANAK', 'CARA KERJA', 'FISIOTERAPI',
    'PENDIDIKAN KESIHATAN', 'KERJA SOSIAL PERUBATAN', 'CSSD', 'DEWAN BEDAH',
    'HEMODIALISIS (HDU)', 'KESELAMATAN DAN KESIHATAN PEKERJAAN (OSH)'
];
$unitCount = count($officialUnits);

// Latest berita (top 5) — published only
$berita = [];
// Fetched extra (10, not 6) because the dashboard widget merges same-event
// multi-day announcements into one card client-side — pulling only 6 raw rows
// could collapse into fewer than 6 visible cards once merged.
$r = $conn->query("SELECT id, title, category, tag, tag_color, excerpt, pinned, tarikh_acara, penyelaras, created_at FROM berita WHERE status = 'published' ORDER BY pinned DESC, created_at DESC LIMIT 10");
if ($r) {
    while ($row = $r->fetch_assoc()) {
        $berita[] = $row;
    }
}

echo json_encode([
    'stats' => [
        'staff' => $staffCount,
        'dokumen' => $docCount,
        'berita' => $beritaCount,
        'unit' => $unitCount
    ],
    'berita' => $berita
]);

$conn->close();
?>
