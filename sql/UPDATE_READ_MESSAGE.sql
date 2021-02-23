USE [MESSAGE_DB]
GO

UPDATE [dbo].[Inbox_Message]
   SET [Status] = 0
 WHERE [ID_Order] = 0 AND [No_Message] =0
GO


