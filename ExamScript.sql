USE [master]
GO
/****** Object:  Database [ExamDataBase]    Script Date: 24.06.2024 18:34:27 ******/
CREATE DATABASE [ExamDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExamDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ExamDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExamDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ExamDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ExamDataBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExamDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExamDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExamDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExamDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExamDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExamDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExamDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExamDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExamDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExamDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExamDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExamDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExamDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExamDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExamDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExamDataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExamDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExamDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExamDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExamDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExamDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExamDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExamDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExamDataBase] SET RECOVERY FULL 
GO
ALTER DATABASE [ExamDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [ExamDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExamDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExamDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExamDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExamDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExamDataBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExamDataBase', N'ON'
GO
ALTER DATABASE [ExamDataBase] SET QUERY_STORE = OFF
GO
USE [ExamDataBase]
GO
/****** Object:  Table [dbo].[ExamCompound]    Script Date: 24.06.2024 18:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamCompound](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[Article] [nchar](6) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_ExamCompound] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC,
	[Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamDileveryPoint]    Script Date: 24.06.2024 18:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamDileveryPoint](
	[IdDeliveryPoint] [int] IDENTITY(1,1) NOT NULL,
	[Postcode] [nchar](6) NOT NULL,
	[City] [nvarchar](30) NOT NULL,
	[Street] [nvarchar](30) NOT NULL,
	[House] [int] NOT NULL,
 CONSTRAINT [PK_ExamPickUpPoint_1] PRIMARY KEY CLUSTERED 
(
	[IdDeliveryPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamManufacturer]    Script Date: 24.06.2024 18:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamManufacturer](
	[IdManufacturer] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ExamManufacturer] PRIMARY KEY CLUSTERED 
(
	[IdManufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamOrder]    Script Date: 24.06.2024 18:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamOrder](
	[IdOrder] [int] NOT NULL,
	[DateOrder] [datetime] NOT NULL,
	[DateDelivery] [datetime] NOT NULL,
	[IdDeliveryPoint] [int] NOT NULL,
	[IdUser] [int] NULL,
	[PickUpPoint] [int] NOT NULL,
	[IdStatusOrder] [int] NOT NULL,
 CONSTRAINT [PK_ExamOrder] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamProduct]    Script Date: 24.06.2024 18:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamProduct](
	[Article] [nchar](6) NOT NULL,
	[NameProduct] [nvarchar](30) NOT NULL,
	[FirstPrice] [decimal](8, 2) NOT NULL,
	[IdManufacturer] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[NowDiscount] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](150) NULL,
	[LastPrice] [decimal](8, 2) NULL,
 CONSTRAINT [PK_ExamProduct] PRIMARY KEY CLUSTERED 
(
	[Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamRole]    Script Date: 24.06.2024 18:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamRole](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ExamRole] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamStatusOrder]    Script Date: 24.06.2024 18:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamStatusOrder](
	[IdStatusOrder] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ExamStatusOrder] PRIMARY KEY CLUSTERED 
(
	[IdStatusOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamUser]    Script Date: 24.06.2024 18:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamUser](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Patronymic] [nvarchar](30) NULL,
	[Login] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_ExamUser] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ExamCompound] ON 

INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (1, N'A485H6', 2)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (1, N'B835H6', 2)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (2, N'B845B6', 1)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (2, N'C453B6', 2)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (3, N'C635R4', 2)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (3, N'D493Y7', 1)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (4, N'D936R6', 2)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (4, N'F047G5', 1)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (5, N'F735H6', 3)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (5, N'G836H6', 2)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (6, N'G843Y6', 3)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (6, N'H845N5', 33)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (7, N'HRU666', 6)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (7, N'K943G6', 5)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (8, N'L486B6', 5)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (8, N'L596G5', 4)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (9, N'N385N6', 3)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (9, N'N764H5', 3)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (10, N'P033N7', 1)
INSERT [dbo].[ExamCompound] ([IdOrder], [Article], [Amount]) VALUES (10, N'S530N6', 4)
SET IDENTITY_INSERT [dbo].[ExamCompound] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamDileveryPoint] ON 

INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (1, N'125061', N'г.Ангарск', N'ул.Подгорная', 8)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (2, N'125703', N'г.Ангарск', N'ул.Партизанская', 49)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (3, N'125837', N'г.Ангарск', N'ул.Шоссейная', 40)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (4, N'190949', N'г.Ангарск', N'ул.Мичурина', 26)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (5, N'344288', N'г.Ангарск', N'ул.Чехова', 1)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (6, N'394060', N'г.Ангарск', N'ул.Фрунзе', 43)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (7, N'394242', N'г.Ангарск', N'ул.Коммунистическая', 43)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (8, N'394782', N'г.Ангарск', N'ул.Чехова', 3)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (9, N'400562', N'г.Ангарск', N'ул.Зеленая', 32)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (10, N'410172', N'г.Ангарск', N'ул.Северная', 13)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (11, N'410542', N'г.Ангарск', N'ул.Светлая', 46)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (12, N'410661', N'г.Ангарск', N'ул.Школьная', 50)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (13, N'420151', N'г.Ангарск', N'ул.Вишневая', 32)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (14, N'426030', N'г.Ангарск', N'ул.Маяковского', 44)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (15, N'443890', N'г.Ангарск', N'ул.Коммунистическая', 1)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (16, N'450375', N'г.Ангарск', N'ул.Клубная', 44)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (17, N'450558', N'г.Ангарск', N'ул.Набережная', 30)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (18, N'450983', N'г.Ангарск', N'ул.Комсомольская', 26)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (19, N'454311', N'г.Ангарск', N'ул.Новая', 19)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (20, N'603002', N'г.Ангарск', N'ул.Дзержинского', 28)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (21, N'603036', N'г.Ангарск', N'ул.Садовая', 4)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (22, N'603379', N'г.Ангарск', N'ул.Спортивная', 46)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (23, N'603721', N'г.Ангарск', N'ул.Гоголя', 41)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (24, N'614164', N'г.Ангарск', N'ул.Степная', 30)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (25, N'614510', N'г.Ангарск', N'ул.Маяковского', 47)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (26, N'614611', N'г.Ангарск', N'ул.Молодежная', 50)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (27, N'614753', N'г.Ангарск', N'ул.Полевая', 35)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (28, N'620839', N'г.Ангарск', N'ул.Цветочная', 8)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (29, N'625283', N'г.Ангарск', N'ул.Победы', 46)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (30, N'625560', N'г.Ангарск', N'ул.Некрасова', 12)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (31, N'625590', N'г.Ангарск', N'ул.Коммунистическая', 20)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (32, N'625683', N'г.Ангарск', N'ул.Марта', 8)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (33, N'630201', N'г.Ангарск', N'ул.Комсомольская', 17)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (34, N'630370', N'г.Ангарск', N'ул.Шоссейная', 24)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (35, N'660007', N'г.Ангарск', N'ул.Октябрьская', 19)
INSERT [dbo].[ExamDileveryPoint] ([IdDeliveryPoint], [Postcode], [City], [Street], [House]) VALUES (36, N'660540', N'г.Ангарск', N'ул.Солнечная', 25)
SET IDENTITY_INSERT [dbo].[ExamDileveryPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamManufacturer] ON 

INSERT [dbo].[ExamManufacturer] ([IdManufacturer], [ManufacturerName]) VALUES (1, N'Chanel')
INSERT [dbo].[ExamManufacturer] ([IdManufacturer], [ManufacturerName]) VALUES (2, N'Dior')
SET IDENTITY_INSERT [dbo].[ExamManufacturer] OFF
GO
INSERT [dbo].[ExamOrder] ([IdOrder], [DateOrder], [DateDelivery], [IdDeliveryPoint], [IdUser], [PickUpPoint], [IdStatusOrder]) VALUES (1, CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 24, 1, 201, 1)
INSERT [dbo].[ExamOrder] ([IdOrder], [DateOrder], [DateDelivery], [IdDeliveryPoint], [IdUser], [PickUpPoint], [IdStatusOrder]) VALUES (2, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 25, NULL, 202, 1)
INSERT [dbo].[ExamOrder] ([IdOrder], [DateOrder], [DateDelivery], [IdDeliveryPoint], [IdUser], [PickUpPoint], [IdStatusOrder]) VALUES (3, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 26, 2, 203, 1)
INSERT [dbo].[ExamOrder] ([IdOrder], [DateOrder], [DateDelivery], [IdDeliveryPoint], [IdUser], [PickUpPoint], [IdStatusOrder]) VALUES (4, CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 27, NULL, 204, 1)
INSERT [dbo].[ExamOrder] ([IdOrder], [DateOrder], [DateDelivery], [IdDeliveryPoint], [IdUser], [PickUpPoint], [IdStatusOrder]) VALUES (5, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 28, 3, 205, 1)
INSERT [dbo].[ExamOrder] ([IdOrder], [DateOrder], [DateDelivery], [IdDeliveryPoint], [IdUser], [PickUpPoint], [IdStatusOrder]) VALUES (6, CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), 29, NULL, 206, 1)
INSERT [dbo].[ExamOrder] ([IdOrder], [DateOrder], [DateDelivery], [IdDeliveryPoint], [IdUser], [PickUpPoint], [IdStatusOrder]) VALUES (7, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 30, NULL, 207, 1)
INSERT [dbo].[ExamOrder] ([IdOrder], [DateOrder], [DateDelivery], [IdDeliveryPoint], [IdUser], [PickUpPoint], [IdStatusOrder]) VALUES (8, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 31, NULL, 208, 1)
INSERT [dbo].[ExamOrder] ([IdOrder], [DateOrder], [DateDelivery], [IdDeliveryPoint], [IdUser], [PickUpPoint], [IdStatusOrder]) VALUES (9, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 32, 4, 209, 1)
INSERT [dbo].[ExamOrder] ([IdOrder], [DateOrder], [DateDelivery], [IdDeliveryPoint], [IdUser], [PickUpPoint], [IdStatusOrder]) VALUES (10, CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 33, NULL, 210, 2)
GO
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'A485H6', N'Кольцо', CAST(1110.00 AS Decimal(8, 2)), 1, 6, 4, 11, N'Кольцо из серебра с позолотой', CAST(1065.60 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'AAA001', N'Кольцо', CAST(8000.00 AS Decimal(8, 2)), 2, 6, 45, 5, N'Кольцо из золота', CAST(4400.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'AAA002', N'Кольцо', CAST(1000.00 AS Decimal(8, 2)), 2, 6, 30, 5, N'Кольцо из золота', CAST(700.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'AAA003', N'Ожерелье', CAST(6666.00 AS Decimal(8, 2)), 2, 3, 50, 5, N'Ожерелье из золота', CAST(3333.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'B835H6', N'Колье', CAST(2600.00 AS Decimal(8, 2)), 2, 7, 4, 5, N'Ювелирное колье из серебра 925 пробы с фианитами', CAST(2496.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'B845B6', N'Серьги', CAST(5200.00 AS Decimal(8, 2)), 2, 1, 3, 6, N'Серьги с фианитами и гематитами из серебра с позолотой', CAST(5044.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'B846B6', N'Браслет', CAST(5900.00 AS Decimal(8, 2)), 2, 4, 3, 6, N'Браслет из золота "Бесконечность" яхонт', CAST(5723.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'B936H6', N'Колье', CAST(17500.00 AS Decimal(8, 2)), 2, 7, 3, 9, N'Колье Эстет Золотое колье', CAST(16975.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'B964G6', N'Подвеска', CAST(5350.00 AS Decimal(8, 2)), 2, 2, 2, 6, N'Подвеска с 1 бриллиантом из красного золота', CAST(5243.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'C453B6', N'Подвеска', CAST(5300.00 AS Decimal(8, 2)), 2, 2, 2, 16, N'Подвеска из красного золота', CAST(5194.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'C635R4', N'Ожерелье', CAST(590000.00 AS Decimal(8, 2)), 1, 3, 30, 5, N'Ожерелье Lace (муассанит, круг, BS Regular, 6,5мм, 2 муассанит Кр-57 6мм)', CAST(413000.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'D493Y7', N'Ожерелье', CAST(79000.00 AS Decimal(8, 2)), 2, 3, 0, 2, N'Ожерелье Cordelia (муассанит, 11шт, 3,5мм, круг, BS Regular, 40см)', CAST(79000.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'D936R6', N'Серьги', CAST(890.00 AS Decimal(8, 2)), 1, 1, 6, 6, N'Серьги со стразами Swarovski 2129919/96П Ювелир Карат', CAST(836.60 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'F047G5', N'Брошь', CAST(7100.00 AS Decimal(8, 2)), 2, 5, 3, 2, N'Брошь PLATINA jewelry из серебра 925 пробы с эмалью', CAST(6887.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'F735H6', N'Серьги', CAST(12000.00 AS Decimal(8, 2)), 2, 1, 25, 5, N'Серьги из золота с эмалью', CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'G836H6', N'Подвеска', CAST(140.00 AS Decimal(8, 2)), 2, 2, 0, 0, N'Подвеска серебряная в позолоте с фианитами 2139189/9п Ювелир Карат', CAST(140.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'G843Y6', N'Подвеска', CAST(240.00 AS Decimal(8, 2)), 2, 2, 5, 0, N'Подвеска серебряная с фианитами 2138729/9 Ювелир Карат', CAST(228.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'gfg   ', N'Кольцо', CAST(7800.00 AS Decimal(8, 2)), 2, 6, 30, 5, N'Кольцо из золота', CAST(5460.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'H845N5', N'Серьги', CAST(2400.00 AS Decimal(8, 2)), 1, 1, 4, 5, N'Серьги из серебра с позолотой', CAST(2304.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'HRU666', N'Серьги', CAST(590.00 AS Decimal(8, 2)), 1, 1, 0, 6, N'Серьги серебряные в позолоте продёвки на цепочке "Звезда"', CAST(590.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'K943G6', N'Серьги', CAST(11545.00 AS Decimal(8, 2)), 2, 1, 3, 2, N'Серьги из золота с эмалью', CAST(11198.65 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'L486B6', N'Серьги', CAST(7000.00 AS Decimal(8, 2)), 2, 1, 2, 16, N'Серьги из красного золота', CAST(6860.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'L596G5', N'Серьги', CAST(11000.00 AS Decimal(8, 2)), 1, 1, 3, 6, N'Серьги из красного золота', CAST(10670.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'N385N6', N'Серьги', CAST(6200.00 AS Decimal(8, 2)), 2, 1, 4, 5, N'Серьги-продевки из золота с фианитами', CAST(5952.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'N764H5', N'Серьги', CAST(10600.00 AS Decimal(8, 2)), 1, 1, 4, 3, N'Платина Серьги из красного золота без камней', CAST(10176.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'P033N7', N'Подвеска', CAST(4300.00 AS Decimal(8, 2)), 1, 2, 3, 2, N'Подвеска из красного золота', CAST(4171.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'P846H6', N'Подвеска', CAST(5195.00 AS Decimal(8, 2)), 2, 2, 30, 6, N'Подвеска из красного золота П142-4547', CAST(3636.50 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'S395J7', N'Серьги', CAST(7000.00 AS Decimal(8, 2)), 2, 1, 15, 6, N'Серьги из золота 029038', CAST(5950.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'S530N6', N'Серьги', CAST(2900.00 AS Decimal(8, 2)), 1, 1, 15, 16, N'Серебряные серьги c ювелирной керамикой', CAST(2465.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'S538J7', N'Серьги', CAST(2300.00 AS Decimal(8, 2)), 2, 1, 10, 2, N'Серьги с 4 фианитами из серебра с позолотой', CAST(2070.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'S648N6', N'Серьги', CAST(990.00 AS Decimal(8, 2)), 1, 1, 0, 5, N'Серьги "Бабочки" в позолоте', CAST(990.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'S844B6', N'Подвеска', CAST(2100.00 AS Decimal(8, 2)), 1, 2, 3, 6, N'Подвеска из серебра с позолотой', CAST(2037.00 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'V494H6', N'Подвеска', CAST(480.00 AS Decimal(8, 2)), 2, 2, 2, 12, N'Подвеска серебряная с фианитами', CAST(470.40 AS Decimal(8, 2)))
INSERT [dbo].[ExamProduct] ([Article], [NameProduct], [FirstPrice], [IdManufacturer], [Category], [NowDiscount], [Quantity], [Description], [LastPrice]) VALUES (N'V835G5', N'Подвеска', CAST(695.00 AS Decimal(8, 2)), 1, 2, 5, 6, N'Подвеска из золочёного серебра с фианитами', CAST(660.25 AS Decimal(8, 2)))
GO
SET IDENTITY_INSERT [dbo].[ExamRole] ON 

INSERT [dbo].[ExamRole] ([IdRole], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[ExamRole] ([IdRole], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[ExamRole] ([IdRole], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[ExamRole] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamStatusOrder] ON 

INSERT [dbo].[ExamStatusOrder] ([IdStatusOrder], [Status]) VALUES (1, N'Новый ')
INSERT [dbo].[ExamStatusOrder] ([IdStatusOrder], [Status]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[ExamStatusOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamUser] ON 

INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (1, N'Константинова ', N'Вероника', N'Агафоновна', N'loginDEsgg2018', N'qhgYnW', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (2, N'Меркушев ', N'Мартын', N'Федотович', N'loginDEdcd2018', N'LxR6YI', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (3, N'Казаков ', N'Федот', N'Кондратович', N'loginDEisg2018', N'Cp8ddU', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (4, N'Карпов ', N'Глеб', N'Леонидович', N'loginDEcph2018', N'7YpE0p', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (5, N'Королёв ', N'Матвей', N'Вадимович', N'loginDEgco2018', N'nMr|ss', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (6, N'Юдин ', N'Герман', N'Кондратович', N'loginDEwjg2018', N'9UfqWQ', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (7, N'Беляева ', N'Анна', N'Вячеславовна', N'loginDEjbz2018', N'xIAWNI', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (8, N'Беляев ', N'Валентин', N'Артёмович', N'loginDEmgu2018', N'0gC3bk', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (9, N'Семёнов ', N'Герман', N'Дмитрьевич', N'loginDErdg2018', N'ni0ue0', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (10, N'Шестаков ', N'Илья', N'Антонинович', N'loginDEjtv2018', N'f2ZaN6', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (11, N'Власов ', N'Вадим', N'Васильевич', N'loginDEtfj2018', N'{{ksPn', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (12, N'Савельев ', N'Арсений', N'Авксентьевич', N'loginDEpnb2018', N'{ADBdc', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (13, N'Ефимов ', N'Руслан', N'Якунович', N'loginDEzer2018', N'5&R+zs', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (14, N'Бурова ', N'Марфа', N'Федотовна', N'loginDEiin2018', N'y9l*b}', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (15, N'Селезнёв ', N'Александр', N'Никитевич', N'loginDEqda2018', N'|h+r}I', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (16, N'Кулакова ', N'Виктория', N'Георгьевна', N'loginDEbnj2018', N'#ИМЯ?', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (17, N'Дорофеева ', N'Кира', N'Демьяновна', N'loginDEqte2018', N'dC8bDI', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (18, N'Сафонова ', N'Нинель', N'Якововна', N'loginDEfeo2018', N'8cI7vq', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (19, N'Ситникова ', N'София', N'Лукьевна', N'loginDEvni2018', N'e4pVIv', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (20, N'Медведев ', N'Ириней', N'Геннадьевич', N'loginDEjis2018', N'A9K++2', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (21, N'Суханова ', N'Евгения', N'Улебовна', N'loginDExvv2018', N'R1zh}|', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (22, N'Игнатьев ', N'Владлен', N'Дамирович', N'loginDEadl2018', N'F&IWf4', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (23, N'Ефремов ', N'Христофор', N'Владиславович', N'loginDEyzn2018', N'P1v24R', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (24, N'Кошелев ', N'Ростислав', N'Куприянович', N'loginDEphn2018', N'F}jGsJ', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (25, N'Галкина ', N'Тамара', N'Авксентьевна', N'loginDEdvk2018', N'NKNkup', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (26, N'Журавлёва ', N'Вера', N'Арсеньевна', N'loginDEtld2018', N'c+CECK', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (27, N'Савина ', N'Таисия', N'Глебовна', N'loginDEima2018', N'XK3sOA', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (28, N'Иванов ', N'Яков', N'Мэлорович', N'loginDEyfe2018', N'4Bbzpa', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (29, N'Лыткин ', N'Ким', N'Алексеевич', N'loginDEwqc2018', N'vRtAP*', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (30, N'Логинов ', N'Федот', N'Святославович', N'loginDEgtt2018', N'7YD|BR', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (31, N'Русакова ', N'Марина', N'Юлиановна', N'loginDEiwl2018', N'LhlmIl', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (32, N'Константинов ', N'Пётр', N'Кондратович', N'loginDEyvi2018', N'22beR}', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (33, N'Поляков ', N'Анатолий', N'Игоревич', N'loginDEtfz2018', N'uQY0ZQ', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (34, N'Панфилова ', N'Василиса', N'Григорьевна', N'loginDEikb2018', N'*QkUxc', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (35, N'Воробьёв ', N'Герман', N'Романович', N'loginDEdmi2018', N'HOGFbU', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (36, N'Андреев ', N'Ростислав', N'Федосеевич', N'loginDEtlo2018', N'58Jxrg', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (37, N'Бобров ', N'Агафон', N'Владимирович', N'loginDEsnd2018', N'lLHqZf', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (38, N'Лапин ', N'Алексей', N'Витальевич', N'loginDEgno2018', N'4fqLiO', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (39, N'Шестаков ', N'Авдей', N'Иванович', N'loginDEgnl2018', N'wdio{u', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (40, N'Гаврилова ', N'Алина', N'Эдуардовна', N'loginDEzna2018', N'yz1iMB', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (41, N'Жуков ', N'Юлиан', N'Валерьянович', N'loginDEsyh2018', N'&4jYGs', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (42, N'Пономарёв ', N'Максим', N'Альвианович', N'loginDExex2018', N'rnh36{', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (43, N'Зиновьева ', N'Мария', N'Лаврентьевна', N'loginDEdjm2018', N'KjI1JR', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (44, N'Осипов ', N'Артём', N'Мэлорович', N'loginDEgup2018', N'36|KhF', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (45, N'Лапин ', N'Вячеслав', N'Геласьевич', N'loginDEdat2018', N'ussd8Q', 3)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (46, N'Зуев ', N'Ириней', N'Вадимович', N'loginDEffj2018', N'cJP+HC', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (47, N'Коновалова ', N'Агафья', N'Митрофановна', N'loginDEisp2018', N'dfz5Ii', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (48, N'Исаев ', N'Дмитрий', N'Аристархович', N'loginDEfrp2018', N'6dcR|9', 2)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (49, N'Белозёрова ', N'Алевтина', N'Лаврентьевна', N'loginDEaee2018', N'5&qONH', 1)
INSERT [dbo].[ExamUser] ([IdUser], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (50, N'Самсонов ', N'Агафон', N'Максимович', N'loginDEthu2018', N'|0xWzV', 1)
SET IDENTITY_INSERT [dbo].[ExamUser] OFF
GO
ALTER TABLE [dbo].[ExamOrder] ADD  CONSTRAINT [DF_ExamOrder_DateOrder]  DEFAULT (getdate()) FOR [DateOrder]
GO
ALTER TABLE [dbo].[ExamOrder] ADD  CONSTRAINT [DF_ExamOrder_DateDelivery]  DEFAULT (getdate()) FOR [DateDelivery]
GO
ALTER TABLE [dbo].[ExamCompound]  WITH CHECK ADD  CONSTRAINT [FK_ExamCompound_ExamOrder] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[ExamOrder] ([IdOrder])
GO
ALTER TABLE [dbo].[ExamCompound] CHECK CONSTRAINT [FK_ExamCompound_ExamOrder]
GO
ALTER TABLE [dbo].[ExamCompound]  WITH CHECK ADD  CONSTRAINT [FK_ExamCompound_ExamProduct] FOREIGN KEY([Article])
REFERENCES [dbo].[ExamProduct] ([Article])
GO
ALTER TABLE [dbo].[ExamCompound] CHECK CONSTRAINT [FK_ExamCompound_ExamProduct]
GO
ALTER TABLE [dbo].[ExamOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamDileveryPoint] FOREIGN KEY([IdDeliveryPoint])
REFERENCES [dbo].[ExamDileveryPoint] ([IdDeliveryPoint])
GO
ALTER TABLE [dbo].[ExamOrder] CHECK CONSTRAINT [FK_ExamOrder_ExamDileveryPoint]
GO
ALTER TABLE [dbo].[ExamOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamStatusOrder] FOREIGN KEY([IdStatusOrder])
REFERENCES [dbo].[ExamStatusOrder] ([IdStatusOrder])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ExamOrder] CHECK CONSTRAINT [FK_ExamOrder_ExamStatusOrder]
GO
ALTER TABLE [dbo].[ExamOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[ExamUser] ([IdUser])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ExamOrder] CHECK CONSTRAINT [FK_ExamOrder_ExamUser]
GO
ALTER TABLE [dbo].[ExamProduct]  WITH CHECK ADD  CONSTRAINT [FK_ExamProduct_ExamManufacturer] FOREIGN KEY([IdManufacturer])
REFERENCES [dbo].[ExamManufacturer] ([IdManufacturer])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ExamProduct] CHECK CONSTRAINT [FK_ExamProduct_ExamManufacturer]
GO
ALTER TABLE [dbo].[ExamUser]  WITH CHECK ADD  CONSTRAINT [FK_ExamUser_ExamRole] FOREIGN KEY([IdRole])
REFERENCES [dbo].[ExamRole] ([IdRole])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ExamUser] CHECK CONSTRAINT [FK_ExamUser_ExamRole]
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 24.06.2024 18:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct]
@article nchar(6),

@name nvarchar(30),

@price decimal(8,2),
@manufacturerId int,
@categoty int,
@discount int, 
@quantity int,
@description nvarchar(150)

AS

BEGIN

INSERT INTO dbo.ExamProduct(Article, NameProduct, FirstPrice, IdManufacturer, Category, NowDiscount, Quantity, Description) VALUES (@article, @name, @price, @manufacturerId, @categoty, @discount, @quantity, @description)

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 24.06.2024 18:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct]
@article nchar(6)

AS

BEGIN

DELETE FROM ExamProduct WHERE @article = Article

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 24.06.2024 18:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProduct]

@article nchar(6),
@name nvarchar(30),
@price decimal(8,2),
@manufacturerId int,
@categoty int,
@discount int, 
@quantity int,
@description nvarchar(150)

AS

BEGIN

UPDATE dbo.ExamProduct
SET
	NameProduct = @name,
	FirstPrice = @price,
	IdManufacturer = @manufacturerId,
	Category = @categoty,
	NowDiscount = @discount,
	Quantity = @quantity,
	Description  = @description

WHERE Article = @article

END
GO
USE [master]
GO
ALTER DATABASE [ExamDataBase] SET  READ_WRITE 
GO
