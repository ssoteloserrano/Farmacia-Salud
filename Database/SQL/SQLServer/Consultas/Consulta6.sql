/****** Script for SelectTopNRows command from SSMS  ******/
--Listar el nombre de los productos que tienen más de una utilidad
SELECT TOP 1000 [Nombre]
  FROM [Farmacia].[dbo].[Utilidad>1]