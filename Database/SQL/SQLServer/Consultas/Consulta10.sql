/****** Script for SelectTopNRows command from SSMS  ******/
--Muestre el nombre y el precio de el producto más caro
SELECT TOP 1000 [Nombre]
      ,[PrecioUnitario]
  FROM [Farmacia].[dbo].[Precio+caro]