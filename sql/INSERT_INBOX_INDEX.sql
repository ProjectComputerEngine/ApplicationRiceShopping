USE [MESSAGE_DB]
GO
/*
			<ID_Message, char(10),>
           ,<Update_Lasttime, datetime,>
           ,<Num, int,>
           ,<New, int,>
           ,<ID_Shop, char(7),>
*/
INSERT INTO [dbo].[Inbox_Index]
           ([ID_Message]
           ,[Update_Lasttime]
           ,[Num]
           ,[New]
           ,[ID_Shop])
     VALUES
           ('MS00000000','',23,23,'S000000'),
		    ('MS00000001','',23,23,'S000001')
GO


