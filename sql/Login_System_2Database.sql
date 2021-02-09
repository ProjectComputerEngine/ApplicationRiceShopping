SELECT ShopData.[ID],ShopData.[Name_Shop],ShopData.[Message_Box] FROM ShopData
WHERE ShopData.[Username] = 'Dev1' AND ShopData.[Password] = '1234'
UNION ALL
SELECT AdminData.[ID],AdminData.[Name],AdminData.[Position] FROM AdminData
WHERE AdminData.[Username]='Dev1' AND AdminData.[Password] = '1234'
