SELECT TOP 2 ms.[No],im.No_Message,ID_Order,No_Order,[message],[Date] 
FROM [S1] ms
INNER JOIN [Inbox_Message] im on ms.No = im.[No_Message] 
INNER JOIN [Order_Message] om on im.[ID_Order] = om.[No_Order]

--WHERE im.StatusAdmin = 0  
--WHERE im.StatusShop = 0 
--ORDER BY om.[Date] DESC 
SELECT TOP(1000) *FROM [MESSAGE_DB].[dbo].S0