/****** Script for SelectTopNRows command from SSMS  ******/
--Listar nombre y cantidad total en stock de los productos
SELECT TOP 1000 [Nombre]
      ,[StockTotal]
  FROM [Farmacia].[dbo].[Nom_Stock]