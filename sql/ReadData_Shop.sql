/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1 
	   [ID_Admin]
      ,[IP]
      ,[Name_Device]
      ,[DateLogin]
	  ,[Tel]
	  ,[Image_URL]
	  ,[Name_Shop]
	  ,[Name_Owner]
	  ,[Email]
	  ,[GPS]
	  ,[Message_Box]
  FROM [Login_DB].[dbo].[Login_Shop] loglogin
INNER JOIN ShopData  ON ShopData.[ID] = loglogin.[ID_Admin]
WHERE ID_Admin = 'S000000'
ORDER BY [DateLogin] DESC