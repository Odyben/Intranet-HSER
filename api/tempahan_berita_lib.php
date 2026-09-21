<?php
// Penyegerakan Berita & Hebahan dengan Tempahan Bilik.
//
// Setiap tempahan yang diluluskan mesti ada satu berita draf (supaya admin
// boleh menyemak dan menerbitkannya), dan berita untuk tempahan yang telah
// dipadam atau ditolak tidak patut kekal. Sebelum ini berita hanya dicipta
// bila admin menekan "Lulus" dalam sistem — tempahan yang dimasukkan melalui
// import pukal tiada berita langsung.
//
// Hanya penciptaan dan pembuangan diselaraskan. Tajuk/masa/penyelaras berita
// sedia ada TIDAK ditimpa, kerana admin mungkin telah menyuntingnya.
require_once __DIR__ . '/helpers.php';

function draftBeritaDariTempahan($conn, $booking, $author) {
    // Nama aktiviti ialah tajuk (cth. "Klinik Katarak"); bilik sudah dipaparkan
    // dalam baris maklumat mesyuarat, jadi ringkasan dibiarkan kosong.
    $title = !empty($booking['tujuan']) ? $booking['tujuan'] : ('Tempahan Bilik: ' . ($booking['bilik_nama'] ?? ''));
    $excerpt = '';
    $content = '<p>' . htmlspecialchars($booking['tujuan'] ?? '') . '</p>';
    $masaAcara = to12HourFormat($booking['masa_mula']) . ' - ' . ($booking['masa_tamat'] ? to12HourFormat($booking['masa_tamat']) : 'Selesai');
    // Penganjur sebenar diutamakan berbanding orang yang menghantar permohonan
    $penyelarasNama = !empty($booking['nama_penganjur']) ? $booking['nama_penganjur'] : $booking['nama_pemohon'];
    $unit = trim((string)$booking['unit_pemohon']);
    // Unit tidak diulang bila sama dengan nama penganjur (cth. "WAD LELAKI")
    $tambahUnit = $unit !== '' && $unit !== '-' && strcasecmp($unit, trim((string)$penyelarasNama)) !== 0;
    $penyelaras = $penyelarasNama . ($tambahUnit ? ' (' . $unit . ')' : '');
    $category = 'memo';
    $tag = 'Memo';
    $tagColor = '#9C27B0';
    $bilikId = (int)$booking['bilik_id'];
    $tempahanId = (int)$booking['id'];

    $stmt = $conn->prepare("INSERT INTO berita (pinned, category, tag, tag_color, title, excerpt, content, status, tarikh_acara, masa_acara, penyelaras, bilik_id, tempahan_id, author, views)
        VALUES (0, ?, ?, ?, ?, ?, ?, 'draft', ?, ?, ?, ?, ?, ?, 0)");
    $stmt->bind_param("sssssssssiis", $category, $tag, $tagColor, $title, $excerpt, $content,
        $booking['tarikh'], $masaAcara, $penyelaras, $bilikId, $tempahanId, $author);
    $stmt->execute();
    $id = (int)$stmt->insert_id;
    $stmt->close();
    return $id;
}

/**
 * @return array ['dicipta' => int, 'dibuang' => int, 'dinyahpaut' => int]
 */
function segerakBeritaTempahan($conn, $author = 'Admin') {
    $hasil = ['dicipta' => 0, 'dibuang' => 0, 'dinyahpaut' => 0];

    // 1. Tempahan diluluskan yang belum ada berita
    $res = $conn->query("SELECT t.*, bl.nama AS bilik_nama FROM tempahan t
        LEFT JOIN berita b ON b.tempahan_id = t.id
        LEFT JOIN bilik bl ON bl.id = t.bilik_id
        WHERE t.status = 'approved' AND b.id IS NULL
        ORDER BY t.tarikh, t.masa_mula");
    while ($booking = $res->fetch_assoc()) {
        draftBeritaDariTempahan($conn, $booking, $author);
        $hasil['dicipta']++;
    }

    // 2. Berita untuk tempahan yang sudah dipadam atau tidak lagi diluluskan.
    //    Draf dibuang terus. Berita yang SUDAH DITERBITKAN tidak dipadam secara
    //    senyap — pautannya ditanggalkan dan keputusan diserahkan kepada admin.
    $res = $conn->query("SELECT b.id, b.status FROM berita b
        LEFT JOIN tempahan t ON t.id = b.tempahan_id
        WHERE b.tempahan_id IS NOT NULL AND (t.id IS NULL OR t.status <> 'approved')");
    $buang = [];
    $nyahpaut = [];
    while ($row = $res->fetch_assoc()) {
        if ($row['status'] === 'draft') $buang[] = (int)$row['id'];
        else $nyahpaut[] = (int)$row['id'];
    }
    if ($buang) {
        $conn->query("DELETE FROM berita WHERE id IN (" . implode(',', $buang) . ")");
        $hasil['dibuang'] = count($buang);
    }
    if ($nyahpaut) {
        $conn->query("UPDATE berita SET tempahan_id = NULL WHERE id IN (" . implode(',', $nyahpaut) . ")");
        $hasil['dinyahpaut'] = count($nyahpaut);
    }
    return $hasil;
}

function ringkasanSegerakBerita($hasil) {
    $bahagian = [];
    if ($hasil['dicipta']) $bahagian[] = $hasil['dicipta'] . ' berita draf dicipta';
    if ($hasil['dibuang']) $bahagian[] = $hasil['dibuang'] . ' berita draf dibuang (tempahan dipadam/ditolak)';
    if ($hasil['dinyahpaut']) $bahagian[] = $hasil['dinyahpaut'] . ' berita terbit dinyahpaut dari tempahan yang dipadam/ditolak';
    return implode(', ', $bahagian);
}
?>
