/****** Script for SelectTopNRows command from SSMS  ******/
--Muestre los productos en buen estado
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
  FROM [Farmacia].[dbo].[Buen_estado]