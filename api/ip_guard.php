<?php
// Restricts the whole site to Hospital Serian's network — this is what keeps
// the intranet "hospital-only" even when hosted on public commercial hosting
// (no true network-level isolation like an on-premises server would have).
//
// Two kinds of "allowed" are checked:
//   1. Exact IPs      — the hospital's public internet IP (for when this is
//                        deployed on Jimat Hosting), plus localhost for
//                        ongoing local development on XAMPP.
//   2. CIDR ranges     — the hospital's internal LAN/WiFi subnet, so testing
//                        this site from another device WITHIN the hospital
//                        network (e.g. a staff PC reaching this laptop's
//                        local XAMPP server directly) isn't blocked. Traffic
//                        that stays inside the LAN never shows up as the
//                        public IP above, so this is needed separately.
//
// ADMIN NOTE: to find the current public IP, open https://whatismyip.com from
// a device connected to the hospital's own WiFi/LAN, then update $allowedIps.
//
// ADMIN NOTE 2: a blocked visitor is shown their own IP on the 403 page. If a
// staff member reports being denied, ask for that number — if it sits outside
// every range below, add its /24 here (e.g. 10.191.145.0/24) and they're in.
// Blocked attempts are also appended to logs/blocked_ips.log for review.

$allowedIps = [
    '124.13.253.169', // Sambungan internet rasmi Hospital Serian (TM)
    '127.0.0.1',       // Local development only (XAMPP) — harmless to keep on
    '::1',             // production since a public host never sees these as a
];                     // real visitor's address.

$allowedRanges = [
    '10.168.88.0/22',   // Rangkaian dalaman (LAN/WiFi) Hospital Serian
    '10.191.144.0/24',  // Subnet PC server (10.191.144.8, mask 255.255.255.0) —
];                      // peranti yang sekelas dgn server perlu dibenarkan juga.

function ipInRange($ip, $cidr) {
    if (strpos($ip, ':') !== false) return false; // IPv4-only check
    list($subnet, $bits) = array_pad(explode('/', $cidr), 2, 32);
    $ipLong = ip2long($ip);
    $subnetLong = ip2long($subnet);
    if ($ipLong === false || $subnetLong === false) return false;
    $mask = -1 << (32 - (int)$bits);
    return ($ipLong & $mask) === ($subnetLong & $mask);
}

$visitorIp = $_SERVER['REMOTE_ADDR'] ?? '';
$isAllowed = in_array($visitorIp, $allowedIps, true);

if (!$isAllowed) {
    foreach ($allowedRanges as $range) {
        if (ipInRange($visitorIp, $range)) { $isAllowed = true; break; }
    }
}

if (!$isAllowed) {
    // Record the attempt so the admin can see which subnets staff are actually
    // on — much faster than guessing when someone reports being locked out.
    $logDir = __DIR__ . '/../logs';
    if (!is_dir($logDir)) @mkdir($logDir, 0755, true);
    @file_put_contents(
        $logDir . '/blocked_ips.log',
        date('Y-m-d H:i:s') . "\t" . $visitorIp . "\t" . ($_SERVER['REQUEST_URI'] ?? '') . "\n",
        FILE_APPEND | LOCK_EX
    );

    $safeIp = htmlspecialchars($visitorIp, ENT_QUOTES, 'UTF-8');
    http_response_code(403);
    header('Content-Type: text/html; charset=utf-8');
    echo '<!DOCTYPE html><html lang="ms"><head><meta charset="UTF-8">'
       . '<meta name="viewport" content="width=device-width, initial-scale=1">'
       . '<title>Akses Ditolak</title>'
       . '<style>body{font-family:Arial,sans-serif;background:#0f172a;color:#fff;display:flex;'
       . 'align-items:center;justify-content:center;min-height:100vh;margin:0;text-align:center;'
       . 'padding:16px;box-sizing:border-box;}'
       . '.box{max-width:420px;padding:2rem;}h1{font-size:1.4rem;color:#f87171;}'
       . 'p{color:#cbd5e1;font-size:0.9rem;line-height:1.6;}'
       . '.ip{margin-top:1.25rem;padding:0.75rem 1rem;background:#1e293b;border-radius:8px;}'
       . '.ip small{display:block;color:#94a3b8;font-size:0.72rem;margin-bottom:0.25rem;}'
       . '.ip b{font-size:1.05rem;color:#fbbf24;letter-spacing:0.5px;}'
       . '.code{font-size:0.72rem;color:#64748b;margin-top:1rem;}</style></head><body>'
       . '<div class="box"><h1>&#128683; Akses Ditolak</h1>'
       . '<p>Sistem Intranet Hospital Serian ini hanya boleh diakses melalui rangkaian dalaman '
       . '(WiFi/LAN) Hospital Serian sahaja.</p>'
       . '<div class="ip"><small>Sekiranya anda berada di dalam hospital, sila berikan nombor '
       . 'ini kepada Unit IT:</small><b>' . $safeIp . '</b></div>'
       . '<div class="code">Kod: IP-RESTRICTED</div></div></body></html>';
    exit;
}
?>
