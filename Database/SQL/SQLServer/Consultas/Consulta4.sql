/****** Script for SelectTopNRows command from SSMS  ******/
--Mostrar todos los productos que tengan un precio de venta mayor a 20 y menor que 100
SELECT TOP 1000 [IDproducto]
      ,[Idcompra]
      ,[Nombre]
      ,[Forma_farmaceutica]
      ,[Restriccion]
      ,[PrecioVenta]
      ,[PrecioUnitario]
      ,[Unidad_medida]
      ,[Descontinuado]
      ,[Generico]
      ,[Estado]
  FROM [Farmacia].[dbo].[Venta]