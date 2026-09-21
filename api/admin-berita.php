<?php
require_once 'db.php';
require_once 'auth.php';
require_once 'helpers.php';
$conn = getDbConnection();

header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];

// Reading the news list is public (berita.html uses this for every staff
// member); only creating/editing/deleting requires an admin session with
// the 'berita' module specifically granted.
if ($method !== 'GET') {
    requireModuleAccess('berita');
}

switch ($method) {
    case 'GET':
        $search = isset($_GET['search']) ? $_GET['search'] : '';
        $category = isset($_GET['category']) ? $_GET['category'] : '';
        // Public callers (berita.html, the dashboard preview) only ever see
        // published posts. Seeing drafts — including "all" — requires an
        // admin session, since that's how the auto-created booking drafts
        // stay hidden from staff until an admin reviews and publishes them.
        $statusFilter = isset($_GET['status']) ? $_GET['status'] : 'published';
        if ($statusFilter !== 'published') {
            requireAdmin();
            // Tangkap tempahan yang masuk di luar aliran biasa (cth. import pukal)
            // setiap kali admin membuka senarai berita.
            require_once 'tempahan_berita_lib.php';
            $segerak = segerakBeritaTempahan($conn, $_SESSION['user_name'] ?? 'Admin');
            if ($ringkasan = ringkasanSegerakBerita($segerak)) {
                logAudit($conn, 'update', 'berita', 'Penyegerakan automatik dengan Tempahan Bilik: ' . $ringkasan);
            }
        }
        $page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
        $limit = isset($_GET['limit']) ? max(1, (int)$_GET['limit']) : 20;
        $offset = ($page - 1) * $limit;

        $countSql = "SELECT COUNT(*) as total FROM berita WHERE 1=1";
        $dataSql = "SELECT b.*, bl.nama as bilik_nama FROM berita b LEFT JOIN bilik bl ON b.bilik_id = bl.id WHERE 1=1";
        $params = [];
        $types = "";

        if ($statusFilter !== 'all') {
            $countSql .= " AND status = ?";
            $dataSql .= " AND b.status = ?";
            $params[] = $statusFilter;
            $types .= "s";
        }
        if ($search !== '') {
            $countSql .= " AND (title LIKE ? OR excerpt LIKE ? OR author LIKE ?)";
            $dataSql .= " AND (title LIKE ? OR excerpt LIKE ? OR author LIKE ?)";
            $s = "%$search%";
            $params[] = $s; $params[] = $s; $params[] = $s;
            $types .= "sss";
        }
        if ($category !== '' && $category !== 'all') {
            $countSql .= " AND category = ?";
            $dataSql .= " AND category = ?";
            $params[] = $category;
            $types .= "s";
        }

        $stmtCount = $conn->prepare($countSql);
        if (!empty($params)) $stmtCount->bind_param($types, ...$params);
        $stmtCount->execute();
        $total = $stmtCount->get_result()->fetch_assoc()['total'];
        $stmtCount->close();

        $dataSql .= " ORDER BY pinned DESC, created_at DESC LIMIT ? OFFSET ?";
        $params[] = $limit; $params[] = $offset;
        $types .= "ii";

        $stmt = $conn->prepare($dataSql);
        $stmt->bind_param($types, ...$params);
        $stmt->execute();
        $result = $stmt->get_result();
        $data = [];
        while ($row = $result->fetch_assoc()) $data[] = $row;
        $stmt->close();

        echo json_encode([
            'data' => $data,
            'total' => (int)$total,
            'page' => $page,
            'limit' => $limit,
            'totalPages' => ceil($total / $limit)
        ]);
        break;

    case 'POST':
        $input = jsonInput();

        $pinned = (int)($input['pinned'] ?? 0);
        $category = $input['category'] ?? '';
        $tag = $input['tag'] ?? '';
        $tag_color = $input['tag_color'] ?? '';
        $title = $input['title'] ?? '';
        $excerpt = $input['excerpt'] ?? '';
        $content = $input['content'] ?? '';
        $tarikh_acara = !empty($input['tarikh_acara']) ? $input['tarikh_acara'] : null;
        $masa_acara = $input['masa_acara'] ?? '';
        $penyelaras = $input['penyelaras'] ?? '';
        $bilik_id = !empty($input['bilik_id']) ? (int)$input['bilik_id'] : null;
        $author = $input['author'] ?? '';

        $stmt = $conn->prepare("INSERT INTO berita (pinned, category, tag, tag_color, title, excerpt, content, tarikh_acara, masa_acara, penyelaras, bilik_id, author, views) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)");
        $stmt->bind_param("isssssssssis", $pinned, $category, $tag, $tag_color, $title, $excerpt, $content, $tarikh_acara, $masa_acara, $penyelaras, $bilik_id, $author);

        if ($stmt->execute()) {
            logAudit($conn, 'create', 'berita', 'Menambah berita: ' . $title);
            echo json_encode(["success" => true, "id" => $stmt->insert_id, "message" => "Berita berjaya ditambah"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;

    case 'PUT':
        $input = jsonInput();
        $id = requireInputId($input);

        // Lightweight status-only update (the "Terbitkan" quick action on a
        // draft row) — must not fall through to the full-field update below,
        // which would blank out title/content/etc. since this payload only
        // carries id + status.
        if (isset($input['status']) && !isset($input['title'])) {
            $status = $input['status'];
            $titleLookup = $conn->prepare("SELECT title FROM berita WHERE id=?");
            $titleLookup->bind_param("i", $id);
            $titleLookup->execute();
            $titleForLog = $titleLookup->get_result()->fetch_assoc()['title'] ?? ('ID ' . $id);
            $titleLookup->close();

            $stmt = $conn->prepare("UPDATE berita SET status=? WHERE id=?");
            $stmt->bind_param("si", $status, $id);
            if ($stmt->execute()) {
                logAudit($conn, 'update', 'berita', ($status === 'published' ? 'Menerbitkan berita: ' : 'Menyahterbitkan berita: ') . $titleForLog);
                echo json_encode(["success" => true, "message" => $status === 'published' ? "Berita berjaya diterbitkan" : "Berita disimpan sebagai draf"]);
            } else {
                echo json_encode(["error" => $stmt->error]);
            }
            $stmt->close();
            break;
        }

        $pinned = (int)($input['pinned'] ?? 0);
        $category = $input['category'] ?? '';
        $tag = $input['tag'] ?? '';
        $tag_color = $input['tag_color'] ?? '';
        $title = $input['title'] ?? '';
        $excerpt = $input['excerpt'] ?? '';
        $content = $input['content'] ?? '';
        $tarikh_acara = !empty($input['tarikh_acara']) ? $input['tarikh_acara'] : null;
        $masa_acara = $input['masa_acara'] ?? '';
        $penyelaras = $input['penyelaras'] ?? '';
        $bilik_id = !empty($input['bilik_id']) ? (int)$input['bilik_id'] : null;
        $author = $input['author'] ?? '';

        $stmt = $conn->prepare("UPDATE berita SET pinned=?, category=?, tag=?, tag_color=?, title=?, excerpt=?, content=?, tarikh_acara=?, masa_acara=?, penyelaras=?, bilik_id=?, author=? WHERE id=?");
        $stmt->bind_param("isssssssssisi", $pinned, $category, $tag, $tag_color, $title, $excerpt, $content, $tarikh_acara, $masa_acara, $penyelaras, $bilik_id, $author, $id);

        if ($stmt->execute()) {
            logAudit($conn, 'update', 'berita', 'Mengemaskini berita: ' . $title);
            echo json_encode(["success" => true, "message" => "Berita berjaya dikemaskini"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;

    case 'DELETE':
        $input = jsonInput();
        $id = requireInputId($input);

        $delLookup = $conn->prepare("SELECT title FROM berita WHERE id=?");
        $delLookup->bind_param("i", $id);
        $delLookup->execute();
        $deletedTitle = $delLookup->get_result()->fetch_assoc()['title'] ?? ('ID ' . $id);
        $delLookup->close();

        $stmt = $conn->prepare("DELETE FROM berita WHERE id=?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            logAudit($conn, 'delete', 'berita', 'Memadam berita: ' . $deletedTitle);
            echo json_encode(["success" => true, "message" => "Berita berjaya dipadam"]);
        } else {
            echo json_encode(["error" => $stmt->error]);
        }
        $stmt->close();
        break;
}

$conn->close();
?>
