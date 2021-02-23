USE [MESSAGE_DB]
GO

UPDATE [dbo].[Inbox_Index]
   SET [Update_Lasttime] = '2020-02-22 18:55:00.000'
      ,[Num] = 2
      ,[New] = 2
      ,[Message_Last] = N'สนใจ...!!'
 WHERE [ID_Message] = 'MS00000001'
GO


