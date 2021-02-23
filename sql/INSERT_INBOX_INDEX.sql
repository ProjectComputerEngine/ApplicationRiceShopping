USE [MESSAGE_DB]
GO
/*
			<ID_Message, char(10),>
           ,<Update_Lasttime, datetime,>
           ,<Num, int,>
           ,<New, int,>
           ,<ID_Shop, char(7),>
           ,<Message_Last, nvarchar(100),>
*/
INSERT INTO [dbo].[Inbox_Index]
           ([ID_Message]
           ,[Update_Lasttime]
           ,[Num]
           ,[NewShop]
		   ,[NewAdmin]
           ,[Message_Last])
     VALUES
           ('MS00000000',
		   '2020-02-23 02:01:00.000',
		   0,
		   0,
		   0,
		   N'สนใจครับ!!'),
		    ('MS00000001',
		   '2020-02-23 02:02:00.000',
		   0,
		   0,
		   0,
		   N'สนใจครับ!!')
GO


