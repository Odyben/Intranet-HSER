<?php
require_once 'db.php';
require_once 'auth.php';
requireAdmin();

header('Content-Type: application/json');

$response = ["log" => []];

// 1. Create Database
$sql_create_db = "CREATE DATABASE IF NOT EXISTS $dbname CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";
if ($conn->query($sql_create_db) === TRUE) {
    $response["log"][] = "Database '$dbname' created or already exists.";
} else {
    $response["error"] = "Error creating database: " . $conn->error;
    die(json_encode($response));
}

// 2. Select Database
$conn->select_db($dbname);

// 3. Create Tables
$tables = [
    "staff" => "CREATE TABLE IF NOT EXISTS staff (
        id INT AUTO_INCREMENT PRIMARY KEY,
        bil INT NOT NULL,
        nama VARCHAR(255) NOT NULL,
        jawatan VARCHAR(255) NOT NULL,
        gred VARCHAR(50) NOT NULL,
        penempatan VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    )",
    
    "telefon_groups" => "CREATE TABLE IF NOT EXISTS telefon_groups (
        id INT AUTO_INCREMENT PRIMARY KEY,
        group_name VARCHAR(255) NOT NULL,
        color VARCHAR(20) NOT NULL,
        icon TEXT NOT NULL,
        sort_order INT DEFAULT 0
    )",
    
    "telefon_items" => "CREATE TABLE IF NOT EXISTS telefon_items (
        id INT AUTO_INCREMENT PRIMARY KEY,
        group_id INT NOT NULL,
        name VARCHAR(255) NOT NULL,
        ext VARCHAR(100) NOT NULL,
        sort_order INT DEFAULT 0,
        FOREIGN KEY (group_id) REFERENCES telefon_groups(id) ON DELETE CASCADE
    )",
    
    "dokumen" => "CREATE TABLE IF NOT EXISTS dokumen (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(500) NOT NULL,
        category VARCHAR(100) NOT NULL,
        cat_label VARCHAR(100) NOT NULL,
        version VARCHAR(50) DEFAULT '—',
        doc_date VARCHAR(50),
        size VARCHAR(20),
        type VARCHAR(10) NOT NULL,
        uploader VARCHAR(100),
        description TEXT,
        file_path VARCHAR(500) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    )"
];

foreach ($tables as $tableName => $sql) {
    if ($conn->query($sql) === TRUE) {
        $response["log"][] = "Table '$tableName' created or already exists.";
    } else {
        $response["error"] = "Error creating table '$tableName': " . $conn->error;
        die(json_encode($response));
    }
}

$response["success"] = true;
$response["message"] = "Setup complete! Database and tables are ready.";

echo json_encode($response, JSON_PRETTY_PRINT);
$conn->close();
?>
