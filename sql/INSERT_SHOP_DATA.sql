USE [SHOP_DB]
GO
/*
			<ID, char(7),>
           ,<Name_Shop, nvarchar(100),>
           ,<Name_Owner, nvarchar(100),>
           ,<Tel, char(10),>
           ,<Address, nvarchar(300),>
           ,<GPS, varchar(50),>
           ,<Uername, varchar(50),>
           ,<Password, varchar(50),>
           ,<Email, varchar(50),>
           ,<Message_Box, char(10),>
*/
INSERT INTO [dbo].[Shop_Data]
           ([ID]
           ,[Name_Shop]
           ,[Name]
           ,[Tel]
           ,[Address]
		   ,[Image_URL]
           ,[GPS]
           ,[Username]
           ,[Password]
           ,[Email])
     VALUES
           ('S1',
		   N'ร้านขายข่าว',
		   N'icon user',
		   '0963256999',
		   N'xxxxxxxx หมู่ xxxxxx ต.xxxxx อ.xxxxxx จ.xxxxxx xxxxxxxx ',
		   'http://simpleicon.com/wp-content/uploads/user-5.png',
		   'xxxxxxx,xxxxxxxx',
		   'Shop2',
		   '1234',
		   'xxxxx@xxxxxx.com')
GO


