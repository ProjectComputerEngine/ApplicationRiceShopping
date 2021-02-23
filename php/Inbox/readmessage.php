<?php
    include '../connection.php';

    $idinbox = $_GET['idinbox'];
    $idrecipient = $_GET['idrecipient'];
    $idsender = $_GET['idsender'];
    MainInbox($connM,$idrecipient,$idinbox,$idsender);

    function MainInbox($connM,$idrecipient,$idInbox,$idsender){
        $data = array();
        try{
        $queryInbox = "SELECT TOP (100) [No],[ID_Order],[Message],[ID_Sender]
        FROM [MESSAGE_DB].[dbo].[$idInbox] ms
        LEFT JOIN [Inbox_Message] im on ms.[No] = im.[No_Message]
        INNER JOIN [Order_Message] ord on im.[ID_Order] = ord.[No_Order]
        WHERE [Status] = 1 AND ID_Sender IN ('$idrecipient','$idsender')
        ORDER BY [Date] 
        ";
    
        $stmt = $connM->query( $queryInbox ); 
    
    while($row = $stmt->fetch( PDO::FETCH_ASSOC ))
    {
        updateInbox($idrecipient,$row['ID_Sender'],$row['ID_Order'],$row['No'],$connM);
        $data[] = $row;
    }
   print(json_encode($data,JSON_UNESCAPED_UNICODE));
    }
    catch(PDOException $e) {
    
    }
    
    }
    function updateInbox($id_Sender,$id_SenderinMessage,$idOrder,$idNo_Message,$connM){
        try{
           // echo $idOrder.$idNo_Message.$id_Sender.$id_SenderinMessage." ";
            if($id_Sender[0] == 'S' && $id_SenderinMessage[0] == 'S'){
                $queryupdateInbox = "UPDATE [dbo].[Inbox_Message]
                SET [Status] = 0
              WHERE [ID_Order] = $idOrder AND [No_Message] =$idNo_Message";
                $stmt = $connM->query( $queryupdateInbox ); 
    
            }else if ($id_Sender[0] == 'A' && $id_SenderinMessage[0] == 'A'){
                $queryupdateInbox = "UPDATE [dbo].[Inbox_Message]
                SET [Status] = 0
              WHERE [ID_Order] = $idOrder AND [No_Message] =$idNo_Message";
                $stmt = $connM->query( $queryupdateInbox ); 
            }
            else{
               
            }
                
        }
        
        catch(PDOException $e) {
        echo $e->getMessage() ."<br />";
      }
       
    }
?>
