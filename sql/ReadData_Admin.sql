/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1 
	   [ID_Admin]
      ,[IP]
      ,[Name_Device]
      ,[DateLogin]
	  ,[Name]
	  ,[Tel]
	  ,[Position]
	  ,[Image_URL]
  FROM [Login_DB].[dbo].[Login_Admin] loglogin
INNER JOIN AdminData  ON AdminData.[ID] = loglogin.[ID_Admin]
ORDER BY [DateLogin] DESC