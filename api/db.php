<?php
// PHP's date()/time() default to UTC when php.ini has no date.timezone set,
// which drifts hours away from real Malaysia time — every date()-based "now"
// comparison in the API (e.g. booking end-time checks) needs this to be correct.
date_default_timezone_set('Asia/Kuala_Lumpur');

// Konfigurasi Database
$host = 'localhost';
$user = 'root'; // Username XAMPP default
$pass = '';     // Password XAMPP default (kosong)
$dbname = 'intranet_hser';

// Connect to MySQL server first (without database name) to allow database creation
$conn = new mysqli($host, $user, $pass);

if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}

// Ensure database uses UTF-8
$conn->set_charset("utf8mb4");

// Function to connect to the specific database
function getDbConnection() {
    global $host, $user, $pass, $dbname;
    $db_conn = new mysqli($host, $user, $pass, $dbname);
    if ($db_conn->connect_error) {
        die(json_encode(["error" => "Database connection failed: " . $db_conn->connect_error]));
    }
    $db_conn->set_charset("utf8mb4");
    return $db_conn;
}
?>
