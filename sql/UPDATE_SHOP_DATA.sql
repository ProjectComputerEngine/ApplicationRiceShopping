USE [SHOP_DB]
GO

UPDATE [dbo].[Shop_Data]
   SET 
      [Name_Shop] = N'ร้านขายไก่'
      ,[Name_Owner] = 'Sukiro Kinogin'
      ,[Message_Box] = 'MS00000001'
	  ,[Tel]         = '0652389561'
 WHERE [ID] = 'S000001'
GO

