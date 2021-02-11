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
           ,[Name_Owner]
           ,[Tel]
           ,[Address]
           ,[GPS]
           ,[Username]
           ,[Password]
           ,[Email]
           ,[Message_Box])
     VALUES
           ('S000001',
		   N'ร้านขายไก่',
		   N'Hirio Kubayyai',
		   '0963256999',
		   N'xxxxxxxx หมู่ xxxxxx ต.xxxxx อ.xxxxxx จ.xxxxxx xxxxxxxx ',
		   'xxxxxxx,xxxxxxxx',
		   'Shop1',
		   '1234',
		   'xxxxx@xxxxxx.com',
		   'MS00000001')
GO


