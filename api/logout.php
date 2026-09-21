<?php
require_once 'auth.php';

header('Content-Type: application/json');
startSession();

$_SESSION = [];
session_destroy();

echo json_encode(['success' => true]);
?>
