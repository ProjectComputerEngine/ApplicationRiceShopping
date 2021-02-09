USE [ADMIN_DB]
GO
/*
			<ID, char(7),>
           ,<Name, nvarchar(100),>
           ,<Tel, char(10),>
           ,<Position, nvarchar(100),>
           ,<Username, varchar(50),>
           ,<Passowrd, varchar(50),>
*/
INSERT INTO [dbo].[Admin_Data]
           ([ID]
           ,[Name]
           ,[Tel]
		   ,[Image_URL]
           ,[Position]
           ,[Username]
           ,[Password])
     VALUES
           ('A000000',
		   'Samart Ketrahong',
		   '0904569093',
		   N'http://192.168.1.2/img/Admin/cellcenter.png',
		   'Developer',
		   'Dev1',
		   '1234'),

		   ('A000001',
		   'Yuuttana Supap',
		   '0904569093',
		   N'http://192.168.1.2/img/Admin/cellcenter.png',
		   'Developer',
		   'Dev2',
		   '1234')
GO


