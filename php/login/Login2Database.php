<?php

include '../connection.php';

$user = $_GET['username'];
$pass = $_GET['password'];
$device = $_GET['device'];
$datetime = $_GET['time'];
$ip = $_GET['ip'];

try{
    $idUser = LoginJson($user,$pass,$conn);
    // echo $idUser;

    if($idUser[0] == 'A'){
        TimeStamp($idUser,$ip,$device,$datetime,"Login_Admin",$conn);
        ReadDataAdmin($idUser,$conn);
    }
    else if($idUser[0] =='S'){
        TimeStamp($idUser,$ip,$device,$datetime,"Login_Shop",$conn);
        ReadDataShop($idUser,$conn);
    }
    else{
      echo '{"ID_Admin":"N00000000"}';
    }

}
catch(PDOException $e) {
  echo $e->getMessage();
}

function LoginJson(String $username,String $password,$conn){
  $queryLogin = "SELECT TOP (1) ShopData.[ID] FROM ShopData
   WHERE ShopData.[Username] = '$username' AND ShopData.[Password] = '$password'
   UNION ALL
   SELECT TOP (1) AdminData.[ID] FROM AdminData
   WHERE AdminData.[Username]='$username' AND AdminData.[Password] = '$password'";  

   $stmt = $conn->query( $queryLogin );  
   $IDLOGIN = $stmt->fetch( PDO::FETCH_ASSOC );

   if($IDLOGIN['ID'] != NULL){
    return $IDLOGIN['ID'];
    }
    else{
      return 'N';
    }


}



function Login(String $username ,String $password,$conn){
  $queryLogin = "SELECT ShopData.[ID] FROM ShopData
   WHERE ShopData.[Username] = '$username' AND ShopData.[Password] = '$password'
   UNION ALL
   SELECT AdminData.[ID] FROM AdminData
   WHERE AdminData.[Username]='$username' AND AdminData.[Password] = '$password'";  

   $stmt = $conn->query( $queryLogin );  
   $IDLOGIN = $stmt->fetch( PDO::FETCH_ASSOC );

   if($IDLOGIN['ID'] != NULL){
      return $IDLOGIN['ID'];
   }
}
function TimeStamp(String $ID,String $IP,String $NameDevice,String $DateLogin,String $Database,$conn){
  $queryLoginLog = "INSERT INTO [dbo].[$Database]
  ([ID_Admin]
  ,[IP]
  ,[Name_Device]
  ,[DateLogin])
  VALUES
  ('$ID',
  '$IP',
  '$NameDevice',
  '$DateLogin')";

  $stmt = $conn->query( $queryLoginLog );

}
function ReadDataAdmin(String $ID,$conn){
    $AdminData = array();
    $queryReadAdmin = "SELECT TOP 1 
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
    WHERE ID_Admin = '$ID'
    ORDER BY [DateLogin] DESC
    ";

    $stmt = $conn->query( $queryReadAdmin );
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    print(json_encode($result,JSON_UNESCAPED_UNICODE));
    
      // echo $result['ID_Admin']."<br />";
      // echo $result['IP']."<br />";
      // echo $result['Name_Device']."<br />";
      // echo $result['DateLogin']."<br />";
      // echo $result['Name']."<br />";
      // echo $result['Tel']."<br />";
      // echo $result['Position']."<br />";
      // echo $result['Image_URL'];
}
function ReadDataShop(String $ID,$conn){
  $queryReadAdmin = "SELECT TOP 1 
    [ID_Admin]
   ,[IP]
   ,[Name_Device]
   ,[DateLogin]
  ,[Tel]
  ,[Address]
  ,[Image_URL]
  ,[Name_Shop]
  ,[Name]
  ,[Email]
  ,[GPS]
  ,[Message_Box]
  FROM [Login_DB].[dbo].[Login_Shop] loglogin
  INNER JOIN ShopData  ON ShopData.[ID] = loglogin.[ID_Admin]
  WHERE ID_Admin = '$ID'
  ORDER BY [DateLogin] DESC";
  $stmt = $conn->query( $queryReadAdmin );
  $result = $stmt->fetch(PDO::FETCH_ASSOC);
  print(json_encode($result,JSON_UNESCAPED_UNICODE));

    // echo $result['ID_Admin']."<br />";
    // echo $result['IP']."<br />";
    // echo $result['Name_Device']."<br />";
    // echo $result['DateLogin']."<br />";
    // echo $result['Name_Shop']."<br />";
    // echo $result['Name_Owner']."<br />";
    // echo $result['Tel']."<br />";
    // echo $result['Address']."<br />";
    // echo $result['Image_URL']."<br />";
    // echo $result['GPS']."<br />";
    // echo $result['Email']."<br />";
    // echo $result['Message_Box']."<br />";
    
}
?>