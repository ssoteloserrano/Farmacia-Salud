/****** Script for SelectTopNRows command from SSMS  ******/
--Muestre los productos que se utilizan para la gripe
SELECT TOP 1000 [Nombre]
      ,[Descripcion]
  FROM [Farmacia].[dbo].[Gripe]