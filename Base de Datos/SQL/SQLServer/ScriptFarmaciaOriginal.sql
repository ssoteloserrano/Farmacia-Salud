USE [master]
GO
/****** Object:  Database [Farmacia]    Script Date: 12/07/2019 04:09:50 p.m. ******/
CREATE DATABASE [Farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Farmacia.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Farmacia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Farmacia_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Farmacia] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmacia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farmacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmacia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmacia] SET RECOVERY FULL 
GO
ALTER DATABASE [Farmacia] SET  MULTI_USER 
GO
ALTER DATABASE [Farmacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmacia] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Farmacia] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Farmacia', N'ON'
GO
USE [Farmacia]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IDcompra] [int] NULL,
	[IDdetallecompra] [int] NULL,
	[IDempleado] [int] NULL,
	[IDproveedor] [int] NULL,
	[Fecha_compra] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompra](
	[IDdetallecompra] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Costo] [money] NOT NULL,
	[CostoUnitario] [money] NOT NULL,
 CONSTRAINT [PK_DetalleCompra] PRIMARY KEY CLUSTERED 
(
	[IDdetallecompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IDfactura] [int] NOT NULL,
	[IDproducto] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[PrecioUnitario] [money] NULL,
	[Cantidad] [int] NULL,
	[Descuento] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDfactura] ASC,
	[IDproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[IDempleado] [int] NOT NULL,
	[Nombre] [char](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enfermedad]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enfermedad](
	[IDenfermedad] [int] NOT NULL,
	[Descripcion] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDenfermedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IDfactura] [int] NOT NULL,
	[IDempleado] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDfactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Indicacion]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Indicacion](
	[IDindicacion] [int] NOT NULL,
	[Descripcion] [char](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDindicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndicacionProducto]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndicacionProducto](
	[IDproducto] [int] NOT NULL,
	[IDindicacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDproducto] ASC,
	[IDindicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lote]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lote](
	[IDlote] [int] NOT NULL,
	[FechaVenc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDlote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IDproducto] [int] NOT NULL,
	[Idcompra] [int] NOT NULL,
	[Nombre] [char](30) NOT NULL,
	[Forma_farmaceutica] [char](20) NOT NULL,
	[Restriccion] [bit] NOT NULL,
	[PrecioVenta] [money] NOT NULL,
	[PrecioUnitario] [money] NOT NULL,
	[Unidad_medida] [char](20) NOT NULL,
	[Descontinuado] [bit] NOT NULL,
	[Generico] [bit] NOT NULL,
	[Estado] [char](20) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IDproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IDproveedor] [int] NOT NULL,
	[Tipo_proveedor] [char](20) NOT NULL,
	[Nombre_proveedor] [char](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDproveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockProducto]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockProducto](
	[IDproducto] [int] NOT NULL,
	[IDlote] [int] NOT NULL,
	[StockBodega] [int] NOT NULL,
	[StockEstante] [int] NOT NULL,
	[StockTotal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDproducto] ASC,
	[IDlote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UtilidadProducto]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtilidadProducto](
	[IDproducto] [int] NOT NULL,
	[IDenfermedad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDproducto] ASC,
	[IDenfermedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Buen_estado]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Buen_estado] As
SELECT * FROM Producto
WHERE Estado LIKE 'Buen estado'
GO
/****** Object:  View [dbo].[Empleados]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Empleados] As
SELECT	E.Nombre FROM Factura F, Empleado E
Group by E.Nombre, F.IDempleado
Having count(F.IDempleado) > 2
GO
/****** Object:  View [dbo].[Fechaordenada]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Fechaordenada] As
--Muestre todos los nombres de los productos ordenados por la fecha mas próxima a vencerse a la fecha mas lejana
SELECT Nombre, FechaVenc FROM Producto P, Lote L, StockProducto S
WHERE L.IDlote = S.IDlote AND P.IDproducto = S.IDproducto
ORDER BY FechaVenc OFFSET 0 ROWS
GO
/****** Object:  View [dbo].[Genericos]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Genericos] As
--Mostrar los productos genéricos
SELECT * FROM Producto
WHERE Generico = 'True'
GO
/****** Object:  View [dbo].[Gripe]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Gripe] As
--Mostrar nombre de productos utililes para la gripe
SELECT Nombre, Descripcion FROM Producto P, Enfermedad E, UtilidadProducto U
WHERE (U.IDenfermedad = E.IDenfermedad AND P.IDproducto = U.IDproducto) AND E.Descripcion LIKE 'Gripe'
GO
/****** Object:  View [dbo].[Nom_Stock]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Nom_Stock] As
--Listar nombre y cantidad total en stock de los productos
SELECT Nombre, StockTotal FROM Producto P, StockProducto S
WHERE P.IDproducto = S.IDproducto
GO
/****** Object:  View [dbo].[Precio+caro]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Precio+caro] As
--Muestre el nombre y el precio de el producto más caro
SELECT Nombre, PrecioUnitario FROM Producto
WHERE PrecioUnitario = (Select Max(PrecioUnitario) From Producto) 
GO
/****** Object:  View [dbo].[Restringido]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Restringido] As
--Mostrar los productos de venta restringida
SELECT * FROM Producto 
WHERE Restriccion = 'True'
GO
/****** Object:  View [dbo].[Utilidad>1]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Utilidad>1] As
--Mostrar los productos de venta restringida
SELECT Nombre FROM Producto P, UtilidadProducto UP
WHERE P.IDproducto = UP.IDproducto 
Group by UP.IDproducto, Nombre
Having count(UP.IDproducto) > 1
GO
/****** Object:  View [dbo].[Venta]    Script Date: 12/07/2019 04:09:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Venta] As
--Mostrar todos los productos que tengan un precio de venta mayor a 20 y menor que 100
SELECT * FROM Producto 
WHERE PrecioVenta BETWEEN 20 AND 100
GO
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2001, 7001, 1, 1003, CAST(N'2019-02-21' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2002, 7002, 1, 1004, CAST(N'2018-12-19' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2003, 7003, 3, 1010, CAST(N'2019-01-10' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2004, 7004, 2, 1024, CAST(N'2018-06-06' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2005, 7005, 2, 1027, CAST(N'2018-12-20' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2006, 7006, 1, 1004, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2007, 7007, 4, 1017, CAST(N'2018-11-13' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2008, 7008, 4, 1035, CAST(N'2018-12-20' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2009, 7009, 4, 1035, CAST(N'2018-12-20' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2010, 7010, 1, 1018, CAST(N'2019-01-25' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2011, 7011, 2, 1009, CAST(N'2018-09-07' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2012, 7012, 3, 1026, CAST(N'2017-09-13' AS Date))
INSERT [dbo].[Compra] ([IDcompra], [IDdetallecompra], [IDempleado], [IDproveedor], [Fecha_compra]) VALUES (2013, 7013, 1, 1035, CAST(N'2018-02-26' AS Date))
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7001, 25, 433.0000, 17.3200)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7002, 100, 222.0000, 222.0000)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7003, 10, 762.7000, 76.2700)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7004, 10, 424.2000, 42.4200)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7005, 200, 636.0000, 318.0000)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7006, 300, 240.0000, 80.0000)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7007, 5, 198.0000, 66.0000)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7008, 100, 44.0000, 44.0000)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7009, 3, 57.0000, 19.0000)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7010, 3, 234.0000, 78.0000)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7011, 5, 380.0000, 76.0000)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7012, 6, 192.0000, 32.0000)
INSERT [dbo].[DetalleCompra] ([IDdetallecompra], [Cantidad], [Costo], [CostoUnitario]) VALUES (7013, 200, 960.0000, 480.0000)
INSERT [dbo].[DetalleFactura] ([IDfactura], [IDproducto], [Total], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (4001, 5001, 30.0000, 30.0000, 1, 0)
INSERT [dbo].[DetalleFactura] ([IDfactura], [IDproducto], [Total], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (4002, 5006, 20.0000, 4.0000, 5, 0)
INSERT [dbo].[DetalleFactura] ([IDfactura], [IDproducto], [Total], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (4003, 5007, 100.0000, 100.0000, 1, 0)
INSERT [dbo].[DetalleFactura] ([IDfactura], [IDproducto], [Total], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (4004, 5013, 21.0000, 7.0000, 3, 0)
INSERT [dbo].[DetalleFactura] ([IDfactura], [IDproducto], [Total], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (4005, 5008, 5.0000, 1.0000, 5, 0)
INSERT [dbo].[DetalleFactura] ([IDfactura], [IDproducto], [Total], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (4006, 5011, 190.0000, 100.0000, 2, 0.05)
INSERT [dbo].[DetalleFactura] ([IDfactura], [IDproducto], [Total], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (4007, 5002, 24.0000, 4.0000, 6, 0)
INSERT [dbo].[DetalleFactura] ([IDfactura], [IDproducto], [Total], [PrecioUnitario], [Cantidad], [Descuento]) VALUES (4008, 5012, 60.0000, 60.0000, 1, 0)
INSERT [dbo].[Empleado] ([IDempleado], [Nombre]) VALUES (1, N'Francisco Silva               ')
INSERT [dbo].[Empleado] ([IDempleado], [Nombre]) VALUES (2, N'Gabriela Castillo             ')
INSERT [dbo].[Empleado] ([IDempleado], [Nombre]) VALUES (3, N'Isis Amador                   ')
INSERT [dbo].[Empleado] ([IDempleado], [Nombre]) VALUES (4, N'Alejandra Silva               ')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3001, N'Fiebre    ')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3002, N'Herpes    ')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3003, N'Varicela  ')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3004, N'Gripe     ')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3005, N'Congestion')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3006, N'Dolor musc')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3007, N'Diarrea   ')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3008, N'Dlor estom')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3009, N'Ansiedad  ')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3010, N'Infeccion ')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3011, N'Bronquitis')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3012, N'Neumonia  ')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3013, N'Rinitis   ')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3014, N'Mucolitico')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3015, N'Deshidrata')
INSERT [dbo].[Enfermedad] ([IDenfermedad], [Descripcion]) VALUES (3016, N'Relajar   ')
INSERT [dbo].[Factura] ([IDfactura], [IDempleado], [Fecha]) VALUES (4001, 2, CAST(N'2019-03-31 00:00:00.000' AS DateTime))
INSERT [dbo].[Factura] ([IDfactura], [IDempleado], [Fecha]) VALUES (4002, 1, CAST(N'2019-03-20 00:00:00.000' AS DateTime))
INSERT [dbo].[Factura] ([IDfactura], [IDempleado], [Fecha]) VALUES (4003, 2, CAST(N'2019-04-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Factura] ([IDfactura], [IDempleado], [Fecha]) VALUES (4004, 3, CAST(N'2019-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Factura] ([IDfactura], [IDempleado], [Fecha]) VALUES (4005, 4, CAST(N'2019-03-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Factura] ([IDfactura], [IDempleado], [Fecha]) VALUES (4006, 2, CAST(N'2019-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Factura] ([IDfactura], [IDempleado], [Fecha]) VALUES (4007, 2, CAST(N'2019-03-20 00:00:00.000' AS DateTime))
INSERT [dbo].[Factura] ([IDfactura], [IDempleado], [Fecha]) VALUES (4008, 1, CAST(N'2019-04-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Indicacion] ([IDindicacion], [Descripcion]) VALUES (9001, N'Mayores de 12 años  ')
INSERT [dbo].[Indicacion] ([IDindicacion], [Descripcion]) VALUES (9002, N'0-18 años           ')
INSERT [dbo].[Indicacion] ([IDindicacion], [Descripcion]) VALUES (9003, N'Mayores de 3 años   ')
INSERT [dbo].[Indicacion] ([IDindicacion], [Descripcion]) VALUES (9004, N'Mayores de 18       ')
INSERT [dbo].[Indicacion] ([IDindicacion], [Descripcion]) VALUES (9005, N'Mayores de 5 años   ')
INSERT [dbo].[Indicacion] ([IDindicacion], [Descripcion]) VALUES (9006, N'TE                  ')
INSERT [dbo].[Indicacion] ([IDindicacion], [Descripcion]) VALUES (9007, N'2-5 años            ')
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5001, 9001)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5002, 9001)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5003, 9002)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5004, 9003)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5005, 9001)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5006, 9001)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5007, 9005)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5008, 9001)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5009, 9007)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5010, 9005)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5011, 9006)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5012, 9001)
INSERT [dbo].[IndicacionProducto] ([IDproducto], [IDindicacion]) VALUES (5013, 9004)
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (1812, CAST(N'2020-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (6812, CAST(N'2021-07-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (7281, CAST(N'2019-12-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (8371, CAST(N'2020-01-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (28391, CAST(N'2019-12-12 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (31874, CAST(N'2019-04-28 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (31979, CAST(N'2019-12-26 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (32341, CAST(N'2019-01-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (49413, CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (72321, CAST(N'2020-10-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (231451, CAST(N'2019-07-31 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (522345, CAST(N'2021-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (721489, CAST(N'2019-08-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (823134, CAST(N'2019-07-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (837328, CAST(N'2021-08-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (2033145, CAST(N'2019-09-20 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (7231343, CAST(N'2019-05-11 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (9142181, CAST(N'2019-05-21 00:00:00.000' AS DateTime))
INSERT [dbo].[Lote] ([IDlote], [FechaVenc]) VALUES (30134221, CAST(N'2020-04-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5001, 2001, N'Acetaminofen                  ', N'Gotas               ', 0, 20.8000, 30.0000, N'30 ml               ', 0, 1, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5002, 2002, N'Aciclovir                     ', N'Tabletas            ', 0, 288.6000, 4.0000, N'400 mg              ', 0, 1, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5003, 2003, N'Mucolex                       ', N'Jarabe              ', 0, 99.1500, 110.0000, N'90 ml               ', 0, 0, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5004, 2004, N'Zepol Deportista              ', N'Crema               ', 0, 55.1400, 60.0000, N'30 gr               ', 0, 0, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5005, 2005, N'Alka-D                        ', N'Tabletas            ', 0, 413.0000, 8.0000, N'-                   ', 1, 0, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5006, 2006, N'Amoxicilina                   ', N'Tabletas            ', 0, 110.5000, 4.0000, N'500 mg              ', 0, 0, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5007, 2007, N'Ambroxol                      ', N'Jarabe              ', 0, 85.8000, 100.0000, N'100 ml              ', 0, 0, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5008, 2008, N'Ketotifeno                    ', N'Tabletas            ', 0, 57.2000, 1.0000, N'1 mg                ', 0, 0, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5009, 2009, N'Bromexina                     ', N'Jarabe              ', 0, 24.7000, 40.0000, N'120 ml              ', 0, 0, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5010, 2010, N'Broncodil                     ', N'Gotas               ', 0, 101.4000, 115.0000, N'30 ml               ', 0, 1, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5011, 2011, N'Electrolit                    ', N'Suero               ', 0, 98.8000, 100.0000, N'625 ml              ', 0, 0, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5012, 2012, N'Kalizzer                      ', N'Suspension          ', 0, 41.6000, 60.0000, N'180 ml              ', 0, 0, N'Buen estado         ')
INSERT [dbo].[Producto] ([IDproducto], [Idcompra], [Nombre], [Forma_farmaceutica], [Restriccion], [PrecioVenta], [PrecioUnitario], [Unidad_medida], [Descontinuado], [Generico], [Estado]) VALUES (5013, 2013, N'Lorazepam                     ', N'Tableta             ', 1, 624.0000, 7.0000, N'2 mg                ', 0, 1, N'Buen estado         ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1001, N'Laboratorio         ', N'Unipharm                      ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1002, N'Laboratorio         ', N'Pharmalat                     ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1003, N'Laboratorio         ', N'Ramos                         ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1004, N'Laboratorio         ', N'Caplin Point                  ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1005, N'Laboratorio         ', N'Procaps                       ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1006, N'Laboratorio         ', N'Chia Fong                     ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1007, N'Laboratorio         ', N'Ceguel                        ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1008, N'Laboratorio         ', N'Rarpe                         ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1009, N'Laboratorio         ', N'Pisa                          ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1010, N'Laboratorio         ', N'Panzyma                       ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1011, N'Laboratorio         ', N'Infasa                        ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1012, N'Laboratorio         ', N'PFizer                        ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1013, N'Laboratorio         ', N'La Santé                      ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1014, N'Laboratorio         ', N'Bengoechea                    ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1015, N'Distribuidor        ', N'Rocha                         ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1016, N'Distribuidor        ', N'J.Ruiz                        ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1017, N'Distribuidor        ', N'Jazmin                        ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1018, N'Distribuidor        ', N'Refanic                       ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1019, N'Distribuidor        ', N'Los Paisanos                  ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1020, N'Distribuidor        ', N'Krisan                        ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1021, N'Laboratorio         ', N'Solka                         ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1022, N'Laboratorio         ', N'Calox                         ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1023, N'Laboratorio         ', N'Unimark                       ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1024, N'Laboratorio         ', N'Zepol                         ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1025, N'Laboratorio         ', N'Altasa                        ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1026, N'Laboratorio         ', N'Winzzer                       ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1027, N'Laboratorio         ', N'Bayer                         ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1028, N'Laboratorio         ', N'Discarsa                      ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1029, N'Laboratorio         ', N'Euros                         ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1030, N'Distribuidor        ', N'Refanic                       ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1031, N'Distribuidor        ', N'Dicegsa                       ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1032, N'Distribuidor        ', N'Farcosa                       ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1033, N'Distribuidor        ', N'Disprofar                     ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1034, N'Distribuidor        ', N'Pushendorf                    ')
INSERT [dbo].[Proveedor] ([IDproveedor], [Tipo_proveedor], [Nombre_proveedor]) VALUES (1035, N'Distribuidor        ', N'Generifar                     ')
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5001, 7281, 10, 5, 15)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5002, 9142181, 90, 30, 120)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5003, 30134221, 10, 10, 20)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5004, 1812, 8, 8, 16)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5005, 231451, 110, 20, 130)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5006, 7231343, 150, 70, 220)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5007, 837328, 5, 5, 10)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5008, 31874, 50, 60, 110)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5009, 32341, 7, 6, 13)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5010, 49413, 7, 6, 13)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5011, 522345, 4, 6, 10)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5012, 823134, 8, 6, 14)
INSERT [dbo].[StockProducto] ([IDproducto], [IDlote], [StockBodega], [StockEstante], [StockTotal]) VALUES (5013, 72321, 140, 80, 220)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5001, 3001)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5001, 3004)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5002, 3002)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5002, 3003)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5003, 3004)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5003, 3005)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5004, 3006)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5005, 3007)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5006, 3010)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5007, 3011)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5007, 3012)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5007, 3013)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5008, 3011)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5008, 3013)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5009, 3011)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5009, 3014)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5010, 3014)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5011, 3015)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5012, 3008)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5013, 3009)
INSERT [dbo].[UtilidadProducto] ([IDproducto], [IDenfermedad]) VALUES (5013, 3016)
USE [master]
GO
ALTER DATABASE [Farmacia] SET  READ_WRITE 
GO
