/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ID_Message]
      ,[Update_Lasttime]
      ,[Num]
      ,[NewShop]
	  ,[NewAdmin]
      ,[Message_Last]
	  ,[Image_URL]
	  ,[Name]
	  ,[ID]
  FROM [MESSAGE_DB].[dbo].[Inbox_Index]  inbox
  INNER JOIN ShopData on inbox.ID_Message = ShopData.Message_Box
  ORDER  BY [Update_Lasttime] DESC
