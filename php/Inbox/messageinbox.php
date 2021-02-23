<?php 
include '../connection.php';


MainInbox($connM);

function MainInbox($connM){
    $data = array();
    $queryInbox = "SELECT [ID_Message]
    ,[Update_Lasttime]
    ,[Num]
    ,[NewShop]
    ,[NewAdmin]
    ,[Message_Last]
  ,[Image_URL]
  ,[Name]
  ,[ID]
FROM [MESSAGE_DB].[dbo].[Inbox_Index]  inbox
INNER JOIN ShopData on inbox.ID_Message = ShopData.Message_Box
ORDER  BY [Update_Lasttime] DESC

    ";

$stmt = $connM->query( $queryInbox ); 

while($row = $stmt->fetch( PDO::FETCH_ASSOC ))
{
  $data[] = $row;
}
print(json_encode($data,JSON_UNESCAPED_UNICODE));

}


?>