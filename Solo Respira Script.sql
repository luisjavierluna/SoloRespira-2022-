USE [master]
GO
/****** Object:  Database [SPDB]    Script Date: 06/03/2024 09:51:22 a. m. ******/
CREATE DATABASE [SPDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SPDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SPDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SPDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SPDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SPDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SPDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SPDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SPDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SPDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SPDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SPDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SPDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SPDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SPDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SPDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SPDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SPDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SPDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SPDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SPDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SPDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SPDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SPDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SPDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SPDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SPDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SPDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SPDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SPDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SPDB] SET  MULTI_USER 
GO
ALTER DATABASE [SPDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SPDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SPDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SPDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SPDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SPDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SPDB', N'ON'
GO
ALTER DATABASE [SPDB] SET QUERY_STORE = OFF
GO
USE [SPDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 06/03/2024 09:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 06/03/2024 09:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 06/03/2024 09:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 06/03/2024 09:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 06/03/2024 09:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 06/03/2024 09:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 06/03/2024 09:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 06/03/2024 09:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 06/03/2024 09:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 06/03/2024 09:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 06/03/2024 09:51:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Discount] [decimal](2, 1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Height] [decimal](3, 1) NOT NULL,
	[Length] [decimal](3, 1) NOT NULL,
	[Weight] [int] NOT NULL,
	[Width] [decimal](3, 1) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230123203332_initial', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230206040009_Added_H_W_L', N'6.0.10')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 

INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'd28ea97d-078f-4183-be71-bcecd6744d72', N'role', N'admin')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd28ea97d-078f-4183-be71-bcecd6744d72', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEH9PpsrUuwUvvZdQQFFqpka3BRtWHGYG9vhzt5Qz/P/hgDv9PNwesnjpjcM/uTXxjQ==', N'ORVPL3E7K5WKIHPLOKAMQTDITW7VWNT7', N'f24a1a91-44ea-4e29-ad65-3da1f05471b1', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (28, N'Mujer', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_000141.jpg', 10)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (29, N'Hombre', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_001427.jpg', 10)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (30, N'Otras Humana', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_011210.jpg', 10)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (31, N'Plantas', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_002221.jpg', 11)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (32, N'Flores', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_002908.jpg', 11)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (33, N'Mar', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_010601.jpg', 11)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (34, N'Otras Naturaleza', N'https://spapi.blob.core.windows.net/categories/IMG_20220928_234355.jpg', 11)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (35, N'Fuertes', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_004100.jpg', 12)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (36, N'Torres', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_003617.jpg', 12)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (37, N'Plataforma', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_012047.jpg', 12)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (38, N'Otras Estructuras', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_020925.jpg', 12)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (39, N'Circulares', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_015822.jpg', 13)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (40, N'Cuadrados', N'https://spapi.blob.core.windows.net/categories/IMG_20220928_233714.jpg', 13)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (41, N'Otras Geometricas', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_015640.jpg', 13)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (42, N'Hilos', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_002007.jpg', 14)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (43, N'Hogar', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_005624.jpg', 14)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (44, N'Comestible', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_020020.jpg', 14)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (45, N'Otras Objetos', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_024041.jpg', 14)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (46, N'Base Circular', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_025656.jpg', 15)
INSERT [dbo].[Categories] ([Id], [Name], [Image], [DepartmentId]) VALUES (47, N'Base Cuadrada', N'https://spapi.blob.core.windows.net/categories/IMG_20220929_010224.jpg', 15)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Name], [Description]) VALUES (10, N'Humana', N'"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Maxime consequatur deleniti impedit consectetur commodi omnis excepturi rem sunt quia consequuntur voluptatum modi voluptate earum, beatae praesentium ullam sit, aperiam sed."')
INSERT [dbo].[Departments] ([Id], [Name], [Description]) VALUES (11, N'Naturaleza', N'"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Maxime consequatur deleniti impedit consectetur commodi omnis excepturi rem sunt quia consequuntur voluptatum modi voluptate earum, beatae praesentium ullam sit, aperiam sed."')
INSERT [dbo].[Departments] ([Id], [Name], [Description]) VALUES (12, N'Estructuras', N'"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Maxime consequatur deleniti impedit consectetur commodi omnis excepturi rem sunt quia consequuntur voluptatum modi voluptate earum, beatae praesentium ullam sit, aperiam sed."')
INSERT [dbo].[Departments] ([Id], [Name], [Description]) VALUES (13, N'Geometrica', N'"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Maxime consequatur deleniti impedit consectetur commodi omnis excepturi rem sunt quia consequuntur voluptatum modi voluptate earum, beatae praesentium ullam sit, aperiam sed."')
INSERT [dbo].[Departments] ([Id], [Name], [Description]) VALUES (14, N'Objetos', N'"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Maxime consequatur deleniti impedit consectetur commodi omnis excepturi rem sunt quia consequuntur voluptatum modi voluptate earum, beatae praesentium ullam sit, aperiam sed."')
INSERT [dbo].[Departments] ([Id], [Name], [Description]) VALUES (15, N'Pilares', N'"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Maxime consequatur deleniti impedit consectetur commodi omnis excepturi rem sunt quia consequuntur voluptatum modi voluptate earum, beatae praesentium ullam sit, aperiam sed."')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (120, N'Ella', N'https://spapi.blob.core.windows.net/products/IMG_20220929_000141.jpg', CAST(162.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 28, 10, CAST(9.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 87, CAST(4.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (121, N'Ella (Modelo B)', N'https://spapi.blob.core.windows.net/products/IMG_20220929_000342.jpg', CAST(162.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 28, 10, CAST(9.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 87, CAST(4.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (122, N'Mujer con Pancita', N'https://spapi.blob.core.windows.net/products/IMG_20220929_022359.jpg', CAST(162.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 28, 10, CAST(9.0 AS Decimal(3, 1)), CAST(4.5 AS Decimal(3, 1)), 76, CAST(4.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (123, N'Mujer de Perfil', N'https://spapi.blob.core.windows.net/products/IMG_20220929_022227.jpg', CAST(137.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 28, 10, CAST(10.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 62, CAST(1.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (124, N'├ël', N'https://spapi.blob.core.windows.net/products/IMG_20220929_001427.jpg', CAST(162.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 29, 10, CAST(9.0 AS Decimal(3, 1)), CAST(4.5 AS Decimal(3, 1)), 56, CAST(3.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (125, N'├ël (Modelo B)', N'https://spapi.blob.core.windows.net/products/IMG_20220929_000637.jpg', CAST(162.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 29, 10, CAST(9.0 AS Decimal(3, 1)), CAST(4.5 AS Decimal(3, 1)), 56, CAST(3.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (126, N'Venus', N'https://spapi.blob.core.windows.net/products/IMG_20220929_011210.jpg', CAST(175.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 30, 10, CAST(11.5 AS Decimal(3, 1)), CAST(3.5 AS Decimal(3, 1)), 48, CAST(3.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (127, N'Torre Venus', N'https://spapi.blob.core.windows.net/products/IMG_20220929_020753.jpg', CAST(312.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 30, 10, CAST(16.0 AS Decimal(3, 1)), CAST(8.0 AS Decimal(3, 1)), 263, CAST(8.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (128, N'Angelito', N'https://spapi.blob.core.windows.net/products/IMG_20220929_014342.jpg', CAST(93.75 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 30, 10, CAST(7.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 35, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (129, N'Cactus Grande', N'https://spapi.blob.core.windows.net/products/IMG_20220929_002221.jpg', CAST(56.25 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 31, 11, CAST(6.5 AS Decimal(3, 1)), CAST(8.0 AS Decimal(3, 1)), 64, CAST(3.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (130, N'Cactus Chiquito', N'https://spapi.blob.core.windows.net/products/IMG_20220929_002237.jpg', CAST(56.25 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 31, 11, CAST(5.0 AS Decimal(3, 1)), CAST(7.0 AS Decimal(3, 1)), 44, CAST(3.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (131, N'Arbolito de Navidad', N'https://spapi.blob.core.windows.net/products/IMG_20220929_013857.jpg', CAST(262.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 31, 11, CAST(14.0 AS Decimal(3, 1)), CAST(7.0 AS Decimal(3, 1)), 190, CAST(6.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (132, N'Pino de Navidad', N'https://spapi.blob.core.windows.net/products/IMG_20220929_014136.jpg', CAST(212.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 31, 11, CAST(9.0 AS Decimal(3, 1)), CAST(8.0 AS Decimal(3, 1)), 105, CAST(7.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (133, N'Pera Elegante', N'https://spapi.blob.core.windows.net/products/IMG_20220929_003523.jpg', CAST(187.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 31, 11, CAST(8.0 AS Decimal(3, 1)), CAST(6.5 AS Decimal(3, 1)), 140, CAST(6.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (134, N'Tr├®bol', N'https://spapi.blob.core.windows.net/products/IMG_20220929_004427.jpg', CAST(162.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 31, 11, CAST(10.0 AS Decimal(3, 1)), CAST(4.0 AS Decimal(3, 1)), 123, CAST(4.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (135, N'Rosa Coraz├│n', N'https://spapi.blob.core.windows.net/products/IMG_20220929_002908.jpg', CAST(87.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 32, 11, CAST(3.0 AS Decimal(3, 1)), CAST(5.5 AS Decimal(3, 1)), 49, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (136, N'Flor de Loto', N'https://spapi.blob.core.windows.net/products/IMG_20220929_004236.jpg', CAST(112.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 32, 11, CAST(13.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 60, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (137, N'Flor Elegante', N'https://spapi.blob.core.windows.net/products/IMG_20220929_011643.jpg', CAST(200.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 32, 11, CAST(13.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 123, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (138, N'Set Tulipanes', N'https://spapi.blob.core.windows.net/products/IMG_20220929_020327.jpg', CAST(87.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 32, 11, CAST(9.5 AS Decimal(3, 1)), CAST(8.0 AS Decimal(3, 1)), 55, CAST(8.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (139, N'Flor Grande', N'https://spapi.blob.core.windows.net/products/IMG_20220929_021359.jpg', CAST(87.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 32, 11, CAST(4.0 AS Decimal(3, 1)), CAST(7.0 AS Decimal(3, 1)), 60, CAST(6.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (140, N'Flor Chiquita', N'https://spapi.blob.core.windows.net/products/IMG_20220929_021314.jpg', CAST(75.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 32, 11, CAST(3.0 AS Decimal(3, 1)), CAST(6.0 AS Decimal(3, 1)), 31, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (141, N'Conchita Grande', N'https://spapi.blob.core.windows.net/products/IMG_20220929_010601.jpg', CAST(200.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 33, 11, CAST(7.0 AS Decimal(3, 1)), CAST(9.0 AS Decimal(3, 1)), 144, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (142, N'Conchita Chiquita', N'https://spapi.blob.core.windows.net/products/IMG_20220929_010506.jpg', CAST(81.25 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 33, 11, CAST(4.0 AS Decimal(3, 1)), CAST(6.0 AS Decimal(3, 1)), 39, CAST(3.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (143, N'Caracol', N'https://spapi.blob.core.windows.net/products/IMG_20220929_005258.jpg', CAST(87.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 33, 11, CAST(4.0 AS Decimal(3, 1)), CAST(7.0 AS Decimal(3, 1)), 50, CAST(4.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (144, N'Le├│n', N'https://spapi.blob.core.windows.net/products/IMG_20220928_234355.jpg', CAST(112.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 34, 11, CAST(5.0 AS Decimal(3, 1)), CAST(8.0 AS Decimal(3, 1)), 50, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (145, N'Conejito', N'https://spapi.blob.core.windows.net/products/IMG_20220929_014550.jpg', CAST(112.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 34, 11, CAST(4.0 AS Decimal(3, 1)), CAST(8.0 AS Decimal(3, 1)), 89, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (146, N'Everest', N'https://spapi.blob.core.windows.net/products/IMG_20220929_020609.jpg', CAST(93.75 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 34, 11, CAST(7.0 AS Decimal(3, 1)), CAST(6.5 AS Decimal(3, 1)), 72, CAST(6.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (147, N'Cuadro Panal', N'https://spapi.blob.core.windows.net/products/IMG_20220929_020459.jpg', CAST(175.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 34, 11, CAST(5.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 102, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (148, N'Castillo', N'https://spapi.blob.core.windows.net/products/IMG_20220929_004100.jpg', CAST(187.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 35, 12, CAST(11.0 AS Decimal(3, 1)), CAST(6.0 AS Decimal(3, 1)), 137, CAST(3.8 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (149, N'Torre Pisa', N'https://spapi.blob.core.windows.net/products/IMG_20220929_022124.jpg', CAST(137.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 35, 12, CAST(9.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 52, CAST(4.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (150, N'Torre Cruz Grande', N'https://spapi.blob.core.windows.net/products/IMG_20220929_014948.jpg', CAST(262.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 35, 12, CAST(13.0 AS Decimal(3, 1)), CAST(6.0 AS Decimal(3, 1)), 313, CAST(6.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (151, N'Torre Cruz Chiquita', N'https://spapi.blob.core.windows.net/products/IMG_20220929_014846.jpg', CAST(175.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 35, 12, CAST(10.5 AS Decimal(3, 1)), CAST(4.5 AS Decimal(3, 1)), 135, CAST(4.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (152, N'Torre Angelitos', N'https://spapi.blob.core.windows.net/products/IMG_20220929_003617.jpg', CAST(187.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 36, 12, CAST(10.5 AS Decimal(3, 1)), CAST(6.0 AS Decimal(3, 1)), 107, CAST(6.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (153, N'Columna Rota', N'https://spapi.blob.core.windows.net/products/IMG_20220929_010827.jpg', CAST(200.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 36, 12, CAST(8.0 AS Decimal(3, 1)), CAST(7.0 AS Decimal(3, 1)), 144, CAST(6.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (154, N'Set Torres', N'https://spapi.blob.core.windows.net/products/IMG_20220929_021714.jpg', CAST(187.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 36, 12, CAST(20.0 AS Decimal(3, 1)), CAST(7.0 AS Decimal(3, 1)), 73, CAST(6.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (155, N'Carrusel', N'https://spapi.blob.core.windows.net/products/IMG_20220929_012047.jpg', CAST(187.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 37, 12, CAST(9.0 AS Decimal(3, 1)), CAST(7.0 AS Decimal(3, 1)), 121, CAST(7.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (156, N'Arco', N'https://spapi.blob.core.windows.net/products/IMG_20220929_020925.jpg', CAST(162.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 38, 12, CAST(5.5 AS Decimal(3, 1)), CAST(10.5 AS Decimal(3, 1)), 82, CAST(2.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (157, N'Bolita', N'https://spapi.blob.core.windows.net/products/IMG_20220929_015822.jpg', CAST(187.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 39, 13, CAST(5.5 AS Decimal(3, 1)), CAST(6.0 AS Decimal(3, 1)), 104, CAST(6.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (158, N'Esfera Elegante', N'https://spapi.blob.core.windows.net/products/IMG_20220929_005853.jpg', CAST(225.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 39, 13, CAST(7.0 AS Decimal(3, 1)), CAST(7.0 AS Decimal(3, 1)), 169, CAST(7.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (159, N'Bolitas Grande', N'https://spapi.blob.core.windows.net/products/IMG_20220928_233714.jpg', CAST(200.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 40, 13, CAST(6.0 AS Decimal(3, 1)), CAST(6.0 AS Decimal(3, 1)), 150, CAST(6.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (160, N'Bolitas Chiquita', N'https://spapi.blob.core.windows.net/products/IMG_20220928_233943.jpg', CAST(56.25 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 40, 13, CAST(4.0 AS Decimal(3, 1)), CAST(4.0 AS Decimal(3, 1)), 37, CAST(4.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (161, N'Cuadro Elegante', N'https://spapi.blob.core.windows.net/products/IMG_20220929_003228.jpg', CAST(287.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 40, 13, CAST(7.5 AS Decimal(3, 1)), CAST(8.0 AS Decimal(3, 1)), 230, CAST(8.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (162, N'Cuadro Geom├®trico', N'https://spapi.blob.core.windows.net/products/IMG_20220929_002747.jpg', CAST(187.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 40, 13, CAST(5.3 AS Decimal(3, 1)), CAST(5.3 AS Decimal(3, 1)), 120, CAST(5.3 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (163, N'Coraz├│n Gr├ífico', N'https://spapi.blob.core.windows.net/products/IMG_20220929_015640.jpg', CAST(81.25 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 41, 13, CAST(2.0 AS Decimal(3, 1)), CAST(6.0 AS Decimal(3, 1)), 38, CAST(6.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (164, N'Set Nubes', N'https://spapi.blob.core.windows.net/products/IMG_20220929_014300.jpg', CAST(81.25 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 41, 13, CAST(7.5 AS Decimal(3, 1)), CAST(19.5 AS Decimal(3, 1)), 138, CAST(13.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (165, N'Hilo', N'https://spapi.blob.core.windows.net/products/IMG_20220929_002007.jpg', CAST(112.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 42, 14, CAST(5.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 63, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (166, N'Nudo', N'https://spapi.blob.core.windows.net/products/IMG_20220929_001715.jpg', CAST(112.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 42, 14, CAST(5.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 80, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (167, N'Lamparita', N'https://spapi.blob.core.windows.net/products/IMG_20220929_005624.jpg', CAST(225.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 43, 14, CAST(9.0 AS Decimal(3, 1)), CAST(7.5 AS Decimal(3, 1)), 150, CAST(7.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (168, N'Perfumito', N'https://spapi.blob.core.windows.net/products/IMG_20220929_004734.jpg', CAST(112.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 43, 14, CAST(9.5 AS Decimal(3, 1)), CAST(4.5 AS Decimal(3, 1)), 64, CAST(4.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (169, N'Perfume Gabrielle', N'https://spapi.blob.core.windows.net/products/IMG_20220929_021750.jpg', CAST(137.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 43, 14, CAST(8.5 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 68, CAST(2.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (170, N'Botella Perfume', N'https://spapi.blob.core.windows.net/products/IMG_20220929_022018.jpg', CAST(212.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 43, 14, CAST(11.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 153, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (171, N'Gelatina', N'https://spapi.blob.core.windows.net/products/IMG_20220929_020020.jpg', CAST(112.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 44, 14, CAST(3.5 AS Decimal(3, 1)), CAST(7.0 AS Decimal(3, 1)), 89, CAST(7.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (172, N'Pastelito', N'https://spapi.blob.core.windows.net/products/IMG_20220929_020134.jpg', CAST(87.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 44, 14, CAST(3.0 AS Decimal(3, 1)), CAST(6.5 AS Decimal(3, 1)), 73, CAST(6.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (173, N'Flan', N'https://spapi.blob.core.windows.net/products/IMG_20220929_022203.jpg', CAST(87.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 44, 14, CAST(4.0 AS Decimal(3, 1)), CAST(4.5 AS Decimal(3, 1)), 42, CAST(4.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (174, N'Hamsa', N'https://spapi.blob.core.windows.net/products/IMG_20220929_024041.jpg', CAST(123.75 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 45, 14, CAST(8.5 AS Decimal(3, 1)), CAST(7.0 AS Decimal(3, 1)), 80, CAST(2.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (175, N'Calavera con Flores', N'https://spapi.blob.core.windows.net/products/IMG_20220929_015455.jpg', CAST(287.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 45, 14, CAST(8.0 AS Decimal(3, 1)), CAST(9.0 AS Decimal(3, 1)), 192, CAST(7.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (176, N'Candil', N'https://spapi.blob.core.windows.net/products/IMG_20220929_025656.jpg', CAST(87.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 46, 15, CAST(26.0 AS Decimal(3, 1)), CAST(2.0 AS Decimal(3, 1)), 57, CAST(2.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (177, N'Candelabro', N'https://spapi.blob.core.windows.net/products/IMG_20220929_025631.jpg', CAST(162.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 46, 15, CAST(26.5 AS Decimal(3, 1)), CAST(3.3 AS Decimal(3, 1)), 137, CAST(2.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (178, N'Cilindro Rayas', N'https://spapi.blob.core.windows.net/products/IMG_20220929_023044.jpg', CAST(212.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 46, 15, CAST(10.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 167, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (179, N'Cilindro Curvas', N'https://spapi.blob.core.windows.net/products/IMG_20220929_022919.jpg', CAST(212.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 46, 15, CAST(10.0 AS Decimal(3, 1)), CAST(5.0 AS Decimal(3, 1)), 167, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (180, N'Cilindro Caramelo', N'https://spapi.blob.core.windows.net/products/IMG_20220929_021129.jpg', CAST(200.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 46, 15, CAST(10.0 AS Decimal(3, 1)), CAST(4.5 AS Decimal(3, 1)), 132, CAST(4.5 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (181, N'Columna Triangular', N'https://spapi.blob.core.windows.net/products/IMG_20220929_010224.jpg', CAST(237.50 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 47, 15, CAST(20.0 AS Decimal(3, 1)), CAST(4.0 AS Decimal(3, 1)), 159, CAST(4.0 AS Decimal(3, 1)))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Discount], [Description], [CategoryId], [DepartmentId], [Height], [Length], [Weight], [Width]) VALUES (182, N'Columna Curvas', N'https://spapi.blob.core.windows.net/products/IMG_20220929_025552.jpg', CAST(175.00 AS Decimal(10, 2)), CAST(0.2 AS Decimal(2, 1)), N'Decora y aromatiza tus espacios mediante olores provenientes de esencias arom├íticas dando un toque de bienestar a tu entorno sin siquiera haber encendido la vela', 47, 15, CAST(22.5 AS Decimal(3, 1)), CAST(2.5 AS Decimal(3, 1)), 120, CAST(2.0 AS Decimal(3, 1)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 06/03/2024 09:51:22 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 06/03/2024 09:51:22 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 06/03/2024 09:51:22 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 06/03/2024 09:51:22 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 06/03/2024 09:51:22 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 06/03/2024 09:51:22 a. m. ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 06/03/2024 09:51:22 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Categories_DepartmentId]    Script Date: 06/03/2024 09:51:22 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Categories_DepartmentId] ON [dbo].[Categories]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 06/03/2024 09:51:22 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_DepartmentId]    Script Date: 06/03/2024 09:51:22 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Products_DepartmentId] ON [dbo].[Products]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0.0)) FOR [Height]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0.0)) FOR [Length]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Weight]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0.0)) FOR [Width]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Categories]  WITH NOCHECK ADD  CONSTRAINT [FK_Categories_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Departments_DepartmentId]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Departments_DepartmentId]
GO
USE [master]
GO
ALTER DATABASE [SPDB] SET  READ_WRITE 
GO
