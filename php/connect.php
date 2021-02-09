<?php
$server = '25.86.3.193';
$dbName = 'Login_DB';
$uid = 'sa';
$pwd = 'No.1team';

$database = "Login_DB";

try {

  $conn = new PDO("sqlsrv:server=$server; database = $dbName", $uid, $pwd);
  $conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );

} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?>