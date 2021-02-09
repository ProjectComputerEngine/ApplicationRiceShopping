USE [Login_DB]
GO
/*
			<ID_Admin, char(7),>
           ,<IP, varchar(50),>
           ,<Name_Device, nvarchar(100),>
           ,<DateLogin, datetime,>
*/
INSERT INTO [dbo].[Login_Shop]
           ([ID_Admin]
           ,[IP]
           ,[Name_Device]
           ,[DateLogin])
     VALUES
           ('S000000',
		   '192.168.159.143',
		   'Computer',
		   '2021-02-06 20:22:00.000')
GO


