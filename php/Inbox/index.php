<?php

include '../connection.php';
$messageBoxID = $_GET['messageID'];
try{
      MessageBox($connM,$messageBoxID);
  }
  catch(PDOException $e) {
  echo $e->getMessage();
  }



function MessageBox($connM,$messageBoxID)
{
  $data = array();
 
    $queryMessageBox = "SELECT [No]
    ,[Message]
     FROM [MESSAGE_DB].[dbo].[$messageBoxID]";
     $stmt = $connM->query($queryMessageBox);  
     while($row = $stmt->fetch( PDO::FETCH_ASSOC ))
     {
       $data[] = $row;
     }
     print(json_encode($data,JSON_UNESCAPED_UNICODE));
 
}

?>