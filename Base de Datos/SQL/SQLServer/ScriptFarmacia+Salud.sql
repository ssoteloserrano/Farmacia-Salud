USE [master]
GO
/****** Object:  Database [FarmaciaMSalud]    Script Date: 13/07/2019 08:16:49 p.m. ******/
CREATE DATABASE [FarmaciaMSalud]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FarmaciaMSalud', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FarmaciaMSalud.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FarmaciaMSalud_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FarmaciaMSalud_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FarmaciaMSalud] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FarmaciaMSalud].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FarmaciaMSalud] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET ARITHABORT OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FarmaciaMSalud] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FarmaciaMSalud] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FarmaciaMSalud] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FarmaciaMSalud] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET RECOVERY FULL 
GO
ALTER DATABASE [FarmaciaMSalud] SET  MULTI_USER 
GO
ALTER DATABASE [FarmaciaMSalud] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FarmaciaMSalud] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FarmaciaMSalud] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FarmaciaMSalud] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FarmaciaMSalud] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FarmaciaMSalud', N'ON'
GO
USE [FarmaciaMSalud]
GO
/****** Object:  Table [dbo].[CompraProducto]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompraProducto](
	[IDcompra] [int] NOT NULL,
	[IDpedido] [int] NOT NULL,
	[IDproveedor] [int] NOT NULL,
	[IDproducto] [int] NOT NULL,
	[Fecha_compra] [datetime] NULL,
	[Num_factura] [int] NULL,
	[Monto] [money] NULL,
	[Cantidad] [int] NULL,
	[Descuento] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDcompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleCompra](
	[IDdetallecompra] [char](1) NOT NULL,
	[IDcompra] [int] NOT NULL,
	[IDproducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Costo] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDdetallecompra] ASC,
	[IDcompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IDfactura] [int] NOT NULL,
	[IDproducto] [int] NOT NULL,
	[PrecioUnitario] [money] NULL,
	[Cantidad] [int] NULL,
	[Total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDfactura] ASC,
	[IDproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetallePedido]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallePedido](
	[IDproveedor] [int] NOT NULL,
	[IDpedido] [int] NOT NULL,
	[Cantidad] [int] NULL,
	[Monto] [money] NULL,
	[IDproducto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDproveedor] ASC,
	[IDpedido] ASC,
	[IDproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleProducto]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleProducto](
	[IDproducto] [int] NOT NULL,
	[IDLote] [int] NOT NULL,
	[FechaVenc] [datetime] NULL,
	[PrecioVenta] [money] NULL,
	[PrecioUnitario] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[IDempleado] [int] NOT NULL,
	[Nombre] [char](30) NULL,
	[Salario] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enfermedad]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enfermedad](
	[IDenfermedad] [int] NOT NULL,
	[Descripcion] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDenfermedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IDfactura] [int] NOT NULL,
	[IDempleado] [int] NOT NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDfactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Indicacion]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Indicacion](
	[IDindicacion] [int] NOT NULL,
	[Descripcion] [char](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDindicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndicacionProducto]    Script Date: 13/07/2019 08:16:49 p.m. ******/
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
/****** Object:  Table [dbo].[Lote]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lote](
	[IDLote] [int] NOT NULL,
	[Fecha_venc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDLote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PagoServicios]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PagoServicios](
	[IDPagoServicios] [int] NOT NULL,
	[IDempleado] [int] NOT NULL,
	[TipodePagoServicios] [char](40) NULL,
	[PagoServicio] [money] NULL,
	[FechaPago] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPagoServicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[IDempleado] [int] NOT NULL,
	[IDpedido] [int] NOT NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDpedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IDproducto] [int] NOT NULL,
	[Nombre] [char](30) NULL,
	[Forma_farmaceutica] [char](20) NULL,
	[Restriccion] [bit] NULL,
	[Unidad_medida] [char](10) NULL,
	[Descontinuado] [bit] NULL,
	[Generico] [bit] NULL,
	[StockBodega] [int] NULL,
	[StockEstante] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 13/07/2019 08:16:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IDproveedor] [int] NOT NULL,
	[Tipo_proveedor] [char](20) NULL,
	[Nombre_proveedor] [char](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDproveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UtilidadProducto]    Script Date: 13/07/2019 08:16:49 p.m. ******/
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
USE [master]
GO
ALTER DATABASE [FarmaciaMSalud] SET  READ_WRITE 
GO
