/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (100) [No],[ID_Order],[Message],[ID_Sender]
  FROM [MESSAGE_DB].[dbo].[MS00000000] ms
  LEFT JOIN [Inbox_Message] im on ms.[No] = im.[No_Message]
  INNER JOIN [Order_Message] ord on im.[ID_Order] = ord.[No_Order]
  WHERE [StatusAdmin] = 0 AND ID_Sender IN ('S000000','A000000')
  ORDER BY [Date] 
