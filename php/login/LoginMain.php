<?php

include '../connection.php';

$user = $_GET['username'];
$pass = $_GET['password'];
$device = $_GET['device'];
$datetime = $_GET['time'];

try{

   // Login 2 Database
   $queryLogin = "SELECT ShopData.[ID] FROM ShopData
   WHERE ShopData.[Username] = '".$user."' AND ShopData.[Password] = '".$pass."'
   UNION ALL
   SELECT AdminData.[ID] FROM AdminData
   WHERE AdminData.[Username]='".$user."' AND AdminData.[Password] = '".$pass."'";  

   $stmt = $conn->query( $queryLogin );  
   $IDLOGIN = $stmt->fetch( PDO::FETCH_ASSOC );
   $userOnline = $IDLOGIN['ID'] ;
   if($IDLOGIN != NULL)
   {
      if ($userOnline[0] == 'S'){

         $DatabaseLog = "Login_Shop";

         
          // Insert Login Log 
   $queryLoginLog = "INSERT INTO [dbo].[".$DatabaseLog."]
   ([ID_Admin]
   ,[IP]
   ,[Name_Device]
   ,[DateLogin])
   VALUES
   ('".$userOnline."',
   '192.168.159.143',
   '".$device."',
   '".$datetime."')";

   $stmt = $conn->query( $queryLoginLog );
   echo "Conplate Login";

      }

   else if($userOnline[0] == 'A'){
      $DatabaseLog = "Login_Admin";

   $queryData = "SELECT TOP 1 
         [ID_Admin]
         ,[IP]
         ,[Name_Device]
         ,[DateLogin]
        ,[Name]
        ,[Tel]
        ,[Position]
        ,[Image_URL]
   FROM [Login_DB].[dbo].[Login_Admin] loglogin
   INNER JOIN AdminData  ON AdminData.[ID] = loglogin.[ID_Admin]
   ORDER BY [DateLogin] DESC";
    $stmt = $conn->query( $queryData );
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

       echo $result['ID_Admin']."<br />";
       echo $result['IP']."<br />";
       echo $result['Name_Device']."<br />";
       echo $result['DateLogin']."<br />";
       echo $result['Tel']."<br />";
       echo $result['Position']."<br />";
       echo $result['Image_URL'];
    
        // Insert Login Log 
   $queryLoginLog = "INSERT INTO [dbo].[".$DatabaseLog."]
   ([ID_Admin]
   ,[IP]
   ,[Name_Device]
   ,[DateLogin])
   VALUES
   ('".$userOnline."',
   '192.168.159.143',
   '".$device."',
   '".$datetime."')";

   $stmt = $conn->query( $queryLoginLog );

      }

   else{
      echo "Not Data";
   }

   }

 
   

}
catch(PDOException $e) {
   echo $sql . "<br>" . $e->getMessage();
 }

  


?>
