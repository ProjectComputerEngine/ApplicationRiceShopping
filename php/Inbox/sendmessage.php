<?php 
include '../connection.php';

$idInbox = $_GET['idinbox'];
$message = $_GET['message'];
$time = $_GET['time'];
$id_Sender = $_GET['id'];

$numOrder = readNumOrderMessage($connM);
$num = readNumMessage($idInbox,$connM);
$new = readNewMessage($connM,$id_Sender,$idInbox);

if($num != null && $numOrder != null && $new != null){
    SendMessage($message,$num,$connM,$idInbox);
    SendOrderMessage($id_Sender,$numOrder,$time,$connM);
    SendMessageInbox($numOrder,$connM,$num,$id_Sender);
    updateInbox($id_Sender,$idInbox,$num,$new+1,$time,$message,$connM);
}else{
    echo 'Error';
}
function SendMessageInbox($idOrder,$connM,$idMessage,$idsender){
    try{
    if($idsender[0] == 'S' || $idsender[0] == 'A'){
        $queryMessage = "INSERT INTO [dbo].[Inbox_Message]
        ([ID_Order]
        ,[No_Message]
        ,[StatusShop]
        ,[StatusAdmin])
  VALUES
        ($idOrder,
        $idMessage,
        0,
        0)
        ";
        $stmt = $connM->query( $queryMessage ); 
    }
    else {
        echo "error !";
    }
       
    }catch(Exception $e){
        echo $e->getMessage();
    }
}
function SendMessage($message,$idMessage,$connM,$idInbox){
    try{
        $queryMessage = "INSERT INTO [dbo].[$idInbox]
        ([No]
        ,[Message])
  VALUES
        ($idMessage,N'$message')
        ";
    $stmt = $connM->query( $queryMessage ); 

    }catch(Exception $e){
        echo $e->getMessage();
    }
}
function SendOrderMessage($idsender,$id,$time,$connM){
    try{
        $sendOrderMessage = "INSERT INTO [dbo].[Order_Message]
        ([No_Order]
        ,[ID_Sender]
        ,[Date])
  VALUES
        ($id,
        '$idsender',
        '$time')";
      $stmt = $connM->query( $sendOrderMessage ); 
    }
    catch(PDOException $e) {
        echo $e->getMessage();
      }
}
function readNumMessage($idInbox,$connM){
    try{
        $queryMessage = "SELECT COUNT(No)
        [num]
          FROM [MESSAGE_DB].[dbo].[$idInbox]
        ";
    $stmt = $connM->query( $queryMessage ); 
    $row = $stmt->fetch( PDO::FETCH_ASSOC );

    return $row['num'];
    }catch(Exception $e){
        echo $e->getMessage();
    }
}
function readNumOrderMessage($connM){
    try{
        $queryMessage = "SELECT COUNT(No_Order)
	num
    FROM [MESSAGE_DB].[dbo].[Order_Message]
        ";
    $stmt = $connM->query( $queryMessage ); 
    $row = $stmt->fetch( PDO::FETCH_ASSOC );

    return $row['num'];
    }catch(Exception $e){
        echo $e->getMessage();
    }
}
function readNewMessage($connM,$idsender,$idInbox){
    // echo $idsender;
    try{
        if($idsender[0] == 'A' || $idsender[0] =='S'){
            if($idsender[0] == 'A'){
                $queryMessage = "SELECT COUNT(StatusAdmin)
                    [New]
                    FROM [Inbox_Message] inbox
                    INNER JOIN Order_Message om on inbox.[ID_Order] = om.[No_Order]
                    INNER JOIN  $idInbox ms on inbox.[No_Message] = ms.[No]
                    WHERE [StatusAdmin] = 0 AND om.[ID_Sender] ='$idsender'  
                    ";
            }else{
                $queryMessage = "SELECT COUNT(StatusShop)
                    [New]
                    FROM [Inbox_Message] inbox
                    INNER JOIN Order_Message om on inbox.[ID_Order] = om.[No_Order]
                    INNER JOIN  $idInbox ms on inbox.[No_Message] = ms.[No]
                    WHERE [StatusShop] = 0 AND om.[ID_Sender] ='$idsender'  
                    ";
            }
            $stmt = $connM->query( $queryMessage ); 
            $row = $stmt->fetch( PDO::FETCH_ASSOC );

            return $row['New'];
        }
        else{
            echo "Error readNewMessage !";
        }
            
    }catch(Exception $e){
        echo $e->getMessage();
    }
}
function updateInbox($id_Sender,$idInbox,$num,$new,$time,$message,$connM){
    try{
        if($id_Sender[0] == 'A'){
            $queryupdateInbox = "UPDATE [dbo].[Inbox_Index]
        SET [Update_Lasttime] = '$time'
           ,[Num] = $num
           ,[NewAdmin] = $new
           ,[Message_Last] = N'$message'
      WHERE [ID_Message] = '$idInbox'";

        }else if ($id_Sender[0] == 'S'){
            $queryupdateInbox = "UPDATE [dbo].[Inbox_Index]
        SET [Update_Lasttime] = '$time'
           ,[Num] = $num
           ,[NewShop] = $new
           ,[Message_Last] = N'$message'
      WHERE [ID_Message] = '$idInbox'";
        }
        else{
            $queryupdateInbox ="";
        }
        
      $stmt = $connM->query( $queryupdateInbox ); 

    }
    
    catch(PDOException $e) {
    echo $e->getMessage();
  }
   

}   

?>