SELECT COUNT(Status)
[New]
FROM [Inbox_Message] inbox
INNER JOIN Order_Message om on inbox.[ID_Order] = om.[No_Order]
INNER JOIN  MS00000000 ms on inbox.[No_Message] = ms.[No]
WHERE [Status] = 0 AND om.[ID_Sender] ='S000000'


SELECT TOP(1000) *FROM [MESSAGE_DB].[dbo].MS00000000