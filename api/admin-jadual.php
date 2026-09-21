<?php
// Jadual Perancangan (modul 'jadual') — simpan dan buka borang jadual CME /
// Perhimpunan Bulanan. Fail Excel dan PDF dijana di pelayar dari data ini.
//
//   GET  (tiada id)  senarai jadual + cadangan nama unit
//   GET  ?id=N       jadual beserta semua sesi
//   POST {action: 'simpan', id?, jenis, tajuk, tahun, masa, tempat, tanggungjawab,
//         disediakan_nama, disemak_nama, disahkan_nama, sesi: [{tarikh, penganjur, catatan}]}
//   POST {action: 'padam', id}
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
require_once 'jadual_lib.php';
requireAdmin();
if ($_SERVER['REQUEST_METHOD'] !== 'GET') requireModuleAccess('jadual');
$conn = getDbConnection();
pastikanSkemaJadual($conn);

header('Content-Type: application/json');

function ambilJadual($conn, $id) {
    $stmt = $conn->prepare("SELECT * FROM jadual_perancangan WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $row = $stmt->get_result()->fetch_assoc();
    $stmt->close();
    return $row;
}

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (!isset($_GET['id'])) {
            $res = $conn->query("SELECT j.id, j.jenis, j.tajuk, j.tahun, j.dikemaskini_oleh, j.dikemaskini_pada,
                    (SELECT COUNT(*) FROM jadual_perancangan_sesi s WHERE s.jadual_id = j.id) AS bil_sesi
                FROM jadual_perancangan j ORDER BY j.tahun DESC, j.jenis, j.id DESC");
            echo json_encode(['data' => $res->fetch_all(MYSQLI_ASSOC), 'jenis' => JADUAL_JENIS, 'units' => senaraiUnitJadual($conn)]);
            break;
        }

        $j = ambilJadual($conn, (int)$_GET['id']);
        if (!$j) die(json_encode(["error" => "Jadual tidak dijumpai"]));
        $stmt = $conn->prepare("SELECT tarikh, penganjur, catatan FROM jadual_perancangan_sesi WHERE jadual_id = ? ORDER BY tarikh, id");
        $stmt->bind_param("i", $j['id']);
        $stmt->execute();
        $j['sesi'] = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
        $stmt->close();
        echo json_encode($j);
        break;

    case 'POST':
        $input = jsonInput();
        $action = $input['action'] ?? '';

        if ($action === 'simpan') {
            $id = (int)($input['id'] ?? 0);
            $jenis = $input['jenis'] ?? '';
            if (!isset(JADUAL_JENIS[$jenis])) die(json_encode(["error" => "Jenis jadual tidak sah"]));
            $f = [];
            foreach (['tajuk', 'masa', 'tempat', 'tanggungjawab', 'disediakan_nama', 'disemak_nama', 'disahkan_nama'] as $k) {
                $f[$k] = trim((string)($input[$k] ?? ''));
            }
            $tahun = (int)($input['tahun'] ?? 0);
            if ($f['tajuk'] === '') die(json_encode(["error" => "Sila isi tajuk jadual"]));
            if ($tahun < 2000 || $tahun > 2100) die(json_encode(["error" => "Tahun tidak sah"]));

            $sesi = [];
            foreach ((array)($input['sesi'] ?? []) as $i => $s) {
                $tarikh = tarikhSah($s['tarikh'] ?? '');
                if (!$tarikh) die(json_encode(["error" => "Tarikh sesi ke-" . ($i + 1) . " tidak sah atau kosong"]));
                $sesi[] = [$tarikh, mb_substr(trim((string)($s['penganjur'] ?? '')), 0, 255), mb_substr(trim((string)($s['catatan'] ?? '')), 0, 500)];
            }
            usort($sesi, function ($a, $b) { return strcmp($a[0], $b[0]); });

            $oleh = $_SESSION['user_email'] ?? null;
            $conn->begin_transaction();
            if ($id) {
                if (!ambilJadual($conn, $id)) { $conn->rollback(); die(json_encode(["error" => "Jadual tidak dijumpai"])); }
                $stmt = $conn->prepare("UPDATE jadual_perancangan SET jenis=?, tajuk=?, tahun=?, masa=?, tempat=?, tanggungjawab=?, disediakan_nama=?, disemak_nama=?, disahkan_nama=?, dikemaskini_oleh=? WHERE id=?");
                $stmt->bind_param("ssisssssssi", $jenis, $f['tajuk'], $tahun, $f['masa'], $f['tempat'], $f['tanggungjawab'], $f['disediakan_nama'], $f['disemak_nama'], $f['disahkan_nama'], $oleh, $id);
                $stmt->execute();
                $stmt->close();
                $stmt = $conn->prepare("DELETE FROM jadual_perancangan_sesi WHERE jadual_id = ?");
                $stmt->bind_param("i", $id);
                $stmt->execute();
                $stmt->close();
            } else {
                $kini = date('Y-m-d H:i:s');
                $stmt = $conn->prepare("INSERT INTO jadual_perancangan (jenis, tajuk, tahun, masa, tempat, tanggungjawab, disediakan_nama, disemak_nama, disahkan_nama, dicipta_oleh, dicipta_pada, dikemaskini_oleh)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                $stmt->bind_param("ssisssssssss", $jenis, $f['tajuk'], $tahun, $f['masa'], $f['tempat'], $f['tanggungjawab'], $f['disediakan_nama'], $f['disemak_nama'], $f['disahkan_nama'], $oleh, $kini, $oleh);
                $stmt->execute();
                $id = (int)$stmt->insert_id;
                $stmt->close();
            }

            $stmt = $conn->prepare("INSERT INTO jadual_perancangan_sesi (jadual_id, tarikh, penganjur, catatan) VALUES (?, ?, ?, ?)");
            foreach ($sesi as [$tarikh, $penganjur, $catatan]) {
                $stmt->bind_param("isss", $id, $tarikh, $penganjur, $catatan);
                $stmt->execute();
            }
            $stmt->close();
            $conn->commit();

            logAudit($conn, (int)($input['id'] ?? 0) ? 'update' : 'create', 'jadual', 'Menyimpan jadual perancangan: ' . $f['tajuk'] . ' (' . count($sesi) . ' sesi)');
            echo json_encode(["success" => true, "id" => $id, "message" => "Jadual disimpan"]);
            break;
        }

        if ($action === 'padam') {
            $j = ambilJadual($conn, (int)($input['id'] ?? 0));
            if (!$j) die(json_encode(["error" => "Jadual tidak dijumpai"]));
            $stmt = $conn->prepare("DELETE FROM jadual_perancangan_sesi WHERE jadual_id = ?");
            $stmt->bind_param("i", $j['id']);
            $stmt->execute();
            $stmt->close();
            $stmt = $conn->prepare("DELETE FROM jadual_perancangan WHERE id = ?");
            $stmt->bind_param("i", $j['id']);
            $stmt->execute();
            $stmt->close();
            logAudit($conn, 'delete', 'jadual', 'Memadam jadual perancangan: ' . $j['tajuk']);
            echo json_encode(["success" => true, "message" => "Jadual dipadam"]);
            break;
        }

        die(json_encode(["error" => "Tindakan tidak dikenali"]));
}

$conn->close();
?>
