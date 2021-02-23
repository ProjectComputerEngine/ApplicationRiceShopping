<?php
$server = '192.168.1.2';
$dbName = 'Login_DB';
$uid = 'sa';
$pwd = 'No.1team';

$database_login = "Login_DB";
$database_message="Message_DB";

try {
  
  $conn = new PDO("sqlsrv:server=$server; database = $database_login", $uid, $pwd);
  $conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );  
  
  $connM = new PDO("sqlsrv:server=$server; database = $database_message", $uid, $pwd);
  $connM->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );  
  
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}

?>