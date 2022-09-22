USE [master]
GO
/****** Object:  Database [Baymurzin_Tours]    Script Date: 22.09.2022 21:48:33 ******/
CREATE DATABASE [Baymurzin_Tours]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Baymurzin_Tours', FILENAME = N'D:\Aducation\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\Baymurzin_Tours.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Baymurzin_Tours_log', FILENAME = N'D:\Aducation\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\Baymurzin_Tours_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Baymurzin_Tours] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Baymurzin_Tours].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Baymurzin_Tours] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET ARITHABORT OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Baymurzin_Tours] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Baymurzin_Tours] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Baymurzin_Tours] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Baymurzin_Tours] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Baymurzin_Tours] SET  MULTI_USER 
GO
ALTER DATABASE [Baymurzin_Tours] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Baymurzin_Tours] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Baymurzin_Tours] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Baymurzin_Tours] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Baymurzin_Tours] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Baymurzin_Tours] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Baymurzin_Tours] SET QUERY_STORE = OFF
GO
USE [Baymurzin_Tours]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 22.09.2022 21:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 22.09.2022 21:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[CountryCode] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotelcomment]    Script Date: 22.09.2022 21:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotelcomment](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Hotelcomment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotelimages]    Script Date: 22.09.2022 21:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotelimages](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Hotelimages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 22.09.2022 21:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[TourId] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 22.09.2022 21:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagesPreview] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[isActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 22.09.2022 21:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 22.09.2022 21:48:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[TourId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AB        ', N'Абхазия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AL        ', N'Англия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BG        ', N'Болгария')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'DE        ', N'Германия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'EG        ', N'Египет')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GE        ', N'Грузия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IL        ', N'Израиль')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'RU        ', N'Россия')
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (1, N'Тип 1', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (2, N'Тип 2', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (3, N'Тип 3', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (4, N'Тип 4', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (5, N'Тип 5', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[Hotelcomment]  WITH CHECK ADD  CONSTRAINT [FK_Hotelcomment_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[Hotelcomment] CHECK CONSTRAINT [FK_Hotelcomment_Hotel]
GO
ALTER TABLE [dbo].[Hotelimages]  WITH CHECK ADD  CONSTRAINT [FK_Hotelimages_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[Hotelimages] CHECK CONSTRAINT [FK_Hotelimages_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [Baymurzin_Tours] SET  READ_WRITE 
GO
