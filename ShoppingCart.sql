USE [master]
GO
/****** Object:  Database [ShoppingCart]    Script Date: 05/07/2022 13:06:44 ******/
CREATE DATABASE [ShoppingCart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingCart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShoppingCart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoppingCart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShoppingCart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShoppingCart] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingCart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingCart] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingCart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingCart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingCart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingCart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingCart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingCart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingCart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingCart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingCart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingCart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingCart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingCart] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingCart] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingCart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingCart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingCart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingCart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoppingCart] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoppingCart] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShoppingCart] SET QUERY_STORE = OFF
GO
USE [ShoppingCart]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 05/07/2022 13:06:44 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 05/07/2022 13:06:44 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 05/07/2022 13:06:44 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 05/07/2022 13:06:44 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 05/07/2022 13:06:44 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Identification] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[IdentificationTypeId] [int] NOT NULL,
	[UserAddressProvinceId] [int] NOT NULL,
	[UserAddressCityId] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[ModificationDate] [datetime2](7) NOT NULL,
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentificationTypes]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentificationTypes](
	[IdentificationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_IdentificationTypes] PRIMARY KEY CLUSTERED 
(
	[IdentificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[TotalQuantity] [bigint] NOT NULL,
	[TotalPrice] [bigint] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[ProductItemId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[TransactionId] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductItemBrands]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductItemBrands](
	[ProductItemBrandId] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[ModificationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProductItemBrands] PRIMARY KEY CLUSTERED 
(
	[ProductItemBrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductItems]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductItems](
	[ProductItemId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Price] [bigint] NOT NULL,
	[Sold] [bigint] NOT NULL,
	[Available] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductItemBrandId] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[ModificationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProductItems] PRIMARY KEY CLUSTERED 
(
	[ProductItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[ModificationDate] [datetime2](7) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[ModificationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddressCities]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddressCities](
	[UserAddressCityId] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[UserAddressProvinceId] [int] NOT NULL,
 CONSTRAINT [PK_UserAddressCities] PRIMARY KEY CLUSTERED 
(
	[UserAddressCityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddressProvinces]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddressProvinces](
	[UserAddressProvinceId] [int] IDENTITY(1,1) NOT NULL,
	[Province] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserAddressProvinces] PRIMARY KEY CLUSTERED 
(
	[UserAddressProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220701212420_001', N'6.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220701215949_002', N'6.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220702003614_003', N'6.0.6')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'31bc88b5-372d-4187-97fa-d6dff5e03d22', N'Admin', N'ADMIN', N'ec18ed67-3700-4847-b8cf-cb6d81538834')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a4000403-2c9b-46d5-a96e-5b3189110ef8', N'Client', N'CLIENT', N'2e4d8e3c-600c-4bb9-8e09-744d8bc95255')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'70d937da-2892-4dd3-a7d8-3f6b1220b7f4', N'31bc88b5-372d-4187-97fa-d6dff5e03d22')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3ae11464-cfd8-4864-8cbb-c7e831e0c380', N'a4000403-2c9b-46d5-a96e-5b3189110ef8')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Identification], [Address], [PostalCode], [IdentificationTypeId], [UserAddressProvinceId], [UserAddressCityId], [CreationDate], [ModificationDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3ae11464-cfd8-4864-8cbb-c7e831e0c380', N'María', N'Perez', N'10968956956', N'Calle 7 45-76', N'561493', 1, 2, 3, CAST(N'2022-07-01T16:56:33.7966958' AS DateTime2), CAST(N'2022-07-01T16:56:33.7967356' AS DateTime2), N'maria.perez@gmail.com', N'MARIA.PEREZ@GMAIL.COM', N'maria.perez@gmail.com', N'MARIA.PEREZ@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDXpci2Sy2KpzC/RtQG27+qXuccCzSD7y0IIg4qfTWN9J2ljzArINPB6f9GKvsGJPg==', N'LITYI7IFX2OLP3RGKU7RFERG4B4OXCLI', N'3fd293c3-badb-4b10-9407-8a62edaa3d4c', N'3024569853', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Identification], [Address], [PostalCode], [IdentificationTypeId], [UserAddressProvinceId], [UserAddressCityId], [CreationDate], [ModificationDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'70d937da-2892-4dd3-a7d8-3f6b1220b7f4', N'Smith', N'Vargas', N'10978569326', N'Calle 3 34-20', N'153629', 1, 5, 9, CAST(N'2022-07-01T16:54:12.6674670' AS DateTime2), CAST(N'2022-07-01T16:54:12.6674976' AS DateTime2), N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENVGqW+UgzCpKBHxosbrLvjNxEY7KcbEIJDwi4ObYLURlelJuILrPCNrLyh4TrxftA==', N'AD4BKTCXZNXXUC63IIUFZSBX6HLVIDM5', N'1dd24f4d-6ea9-4f6c-8465-63b077f87d6d', N'3025632547', 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[IdentificationTypes] ON 

INSERT [dbo].[IdentificationTypes] ([IdentificationTypeId], [Type]) VALUES (1, N'CC')
INSERT [dbo].[IdentificationTypes] ([IdentificationTypeId], [Type]) VALUES (2, N'Pasaporte')
SET IDENTITY_INSERT [dbo].[IdentificationTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderItemId], [TotalQuantity], [TotalPrice], [Date], [ProductItemId], [UserId], [TransactionId]) VALUES (12, 5, 11499500, CAST(N'2022-07-04T19:50:19.1866667' AS DateTime2), 16, N'3ae11464-cfd8-4864-8cbb-c7e831e0c380', N'5203EB5D-2486-4AD2-BE87-620065BA4F1F')
INSERT [dbo].[OrderItems] ([OrderItemId], [TotalQuantity], [TotalPrice], [Date], [ProductItemId], [UserId], [TransactionId]) VALUES (13, 2, 4599800, CAST(N'2022-07-04T20:01:41.5366667' AS DateTime2), 16, N'3ae11464-cfd8-4864-8cbb-c7e831e0c380', N'144E8C72-1D28-41D8-B884-229FD812D453')
INSERT [dbo].[OrderItems] ([OrderItemId], [TotalQuantity], [TotalPrice], [Date], [ProductItemId], [UserId], [TransactionId]) VALUES (14, 3, 6899700, CAST(N'2022-07-04T20:17:46.4266667' AS DateTime2), 16, N'3ae11464-cfd8-4864-8cbb-c7e831e0c380', N'20A5BD0C-55FE-41EC-B510-A8964EE4CCFC')
INSERT [dbo].[OrderItems] ([OrderItemId], [TotalQuantity], [TotalPrice], [Date], [ProductItemId], [UserId], [TransactionId]) VALUES (15, 2, 4599800, CAST(N'2022-07-04T22:51:19.7100000' AS DateTime2), 16, N'3ae11464-cfd8-4864-8cbb-c7e831e0c380', N'F3584457-43B3-4F75-9A5D-33CFA6FBEFD0')
INSERT [dbo].[OrderItems] ([OrderItemId], [TotalQuantity], [TotalPrice], [Date], [ProductItemId], [UserId], [TransactionId]) VALUES (16, 2, 4599800, CAST(N'2022-07-04T22:52:31.7800000' AS DateTime2), 16, N'3ae11464-cfd8-4864-8cbb-c7e831e0c380', N'8667D28A-E084-4E0B-AB2E-196864CC1101')
INSERT [dbo].[OrderItems] ([OrderItemId], [TotalQuantity], [TotalPrice], [Date], [ProductItemId], [UserId], [TransactionId]) VALUES (20, 2, 5599840, CAST(N'2022-07-05T09:32:16.8466667' AS DateTime2), 1, N'3ae11464-cfd8-4864-8cbb-c7e831e0c380', N'8F2CECEE-DE65-4A51-AD8E-14A7AA7AB105')
INSERT [dbo].[OrderItems] ([OrderItemId], [TotalQuantity], [TotalPrice], [Date], [ProductItemId], [UserId], [TransactionId]) VALUES (22, 10, 22290480, CAST(N'2022-07-05T12:22:45.4000000' AS DateTime2), 4, N'3ae11464-cfd8-4864-8cbb-c7e831e0c380', N'73215CF8-AF92-48AD-BCBA-6A1F461741BD')
INSERT [dbo].[OrderItems] ([OrderItemId], [TotalQuantity], [TotalPrice], [Date], [ProductItemId], [UserId], [TransactionId]) VALUES (23, 5, 19499500, CAST(N'2022-07-05T12:23:03.4566667' AS DateTime2), 13, N'3ae11464-cfd8-4864-8cbb-c7e831e0c380', N'96185997-3A1D-494F-8D14-E428046E7C46')
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductItemBrands] ON 

INSERT [dbo].[ProductItemBrands] ([ProductItemBrandId], [Brand], [Description], [CreationDate], [ModificationDate]) VALUES (1, N'LG', N'LG', CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2))
INSERT [dbo].[ProductItemBrands] ([ProductItemBrandId], [Brand], [Description], [CreationDate], [ModificationDate]) VALUES (2, N'Samsung ', N'Samsung', CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2))
INSERT [dbo].[ProductItemBrands] ([ProductItemBrandId], [Brand], [Description], [CreationDate], [ModificationDate]) VALUES (3, N'Xiaomi', N'Xiaomi', CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ProductItemBrands] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductItems] ON 

INSERT [dbo].[ProductItems] ([ProductItemId], [Name], [Description], [Price], [Sold], [Available], [ProductId], [ProductItemBrandId], [CreationDate], [ModificationDate]) VALUES (1, N'Nevera LG No Frost 395L VT40WGPX.APZCCLM', N'Nevera LG No Frost 395L VT40WGPX.APZCCLM', 2799920, 42, 8, 1, 1, CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2))
INSERT [dbo].[ProductItems] ([ProductItemId], [Name], [Description], [Price], [Sold], [Available], [ProductId], [ProductItemBrandId], [CreationDate], [ModificationDate]) VALUES (3, N'Lavadora LG carga superior 18 kg WT18DSBP.ASFECOL', N'Lavadora LG carga superior 18 kg WT18DSBP.ASFECOL', 2040423, 5, 20, 2, 1, CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2))
INSERT [dbo].[ProductItems] ([ProductItemId], [Name], [Description], [Price], [Sold], [Available], [ProductId], [ProductItemBrandId], [CreationDate], [ModificationDate]) VALUES (4, N'Lavadora SAMSUNG Carga Superior 19 kg', N'Lavadora SAMSUNG Carga Superior 19 kg', 2229048, 30, 20, 2, 2, CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2))
INSERT [dbo].[ProductItems] ([ProductItemId], [Name], [Description], [Price], [Sold], [Available], [ProductId], [ProductItemBrandId], [CreationDate], [ModificationDate]) VALUES (13, N'Celular SAMSUNG Galaxy S21 256 GB', N'Celular SAMSUNG Galaxy S21 256 GB', 3899900, 25, 15, 3, 2, CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2))
INSERT [dbo].[ProductItems] ([ProductItemId], [Name], [Description], [Price], [Sold], [Available], [ProductId], [ProductItemBrandId], [CreationDate], [ModificationDate]) VALUES (14, N'Celular Xiaomi 11T Pro 256Gb 8Gb Ram Gris', N'Celular Xiaomi 11T Pro 256Gb 8Gb Ram Gris', 2178900, 25, 10, 3, 3, CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2))
INSERT [dbo].[ProductItems] ([ProductItemId], [Name], [Description], [Price], [Sold], [Available], [ProductId], [ProductItemBrandId], [CreationDate], [ModificationDate]) VALUES (15, N'Televisor LG 55 Pulgadas Uhd4K Smart Tv', N'Televisor LG 55 Pulgadas Uhd4K Smart Tv', 4299900, 20, 25, 4, 1, CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2))
INSERT [dbo].[ProductItems] ([ProductItemId], [Name], [Description], [Price], [Sold], [Available], [ProductId], [ProductItemBrandId], [CreationDate], [ModificationDate]) VALUES (16, N'Televisor SAMSUNG 60 Pulgadas Uhd4K', N'Televisor SAMSUNG 60 Pulgadas Uhd4K', 2299900, 49, 26, 4, 2, CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2))
INSERT [dbo].[ProductItems] ([ProductItemId], [Name], [Description], [Price], [Sold], [Available], [ProductId], [ProductItemBrandId], [CreationDate], [ModificationDate]) VALUES (18, N'Nevera SAMSUNG No Frost Congelador Inferior 458 Li', N'Nevera SAMSUNG No Frost Congelador Inferior 458 Li', 4099990, 0, 40, 1, 2, CAST(N'2022-07-05T09:36:49.5000000' AS DateTime2), CAST(N'2022-07-05T09:36:49.5000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ProductItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Description], [CreationDate], [ModificationDate], [ProductTypeId]) VALUES (1, N'Neveras', N'Neveras', CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [CreationDate], [ModificationDate], [ProductTypeId]) VALUES (2, N'Lavadoras', N'Lavadoras', CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [CreationDate], [ModificationDate], [ProductTypeId]) VALUES (3, N'Celulares', N'Celulares', CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), 2)
INSERT [dbo].[Products] ([ProductId], [Name], [Description], [CreationDate], [ModificationDate], [ProductTypeId]) VALUES (4, N'Televisores', N'Televisores', CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ProductTypeId], [Type], [CreationDate], [ModificationDate]) VALUES (1, N'Electrodomésticos', CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2), CAST(N'2022-06-26T15:47:48.2566667' AS DateTime2))
INSERT [dbo].[ProductTypes] ([ProductTypeId], [Type], [CreationDate], [ModificationDate]) VALUES (2, N'Tecnología', CAST(N'2022-06-26T15:48:16.1600000' AS DateTime2), CAST(N'2022-06-26T15:48:16.1600000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAddressCities] ON 

INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (1, N'Soacha', 1)
INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (2, N'Medina', 1)
INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (3, N'Medellín', 2)
INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (4, N'Bello', 2)
INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (5, N'Cali', 3)
INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (6, N'Buga', 3)
INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (7, N'Barranquilla', 4)
INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (8, N'Sabanalarga', 4)
INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (9, N'Bucaramanga', 5)
INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (10, N'Barrancabermeja', 5)
INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (11, N'Cúcuta', 6)
INSERT [dbo].[UserAddressCities] ([UserAddressCityId], [City], [UserAddressProvinceId]) VALUES (12, N'Pamplona', 6)
SET IDENTITY_INSERT [dbo].[UserAddressCities] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAddressProvinces] ON 

INSERT [dbo].[UserAddressProvinces] ([UserAddressProvinceId], [Province]) VALUES (1, N'Cundinamarca')
INSERT [dbo].[UserAddressProvinces] ([UserAddressProvinceId], [Province]) VALUES (2, N'Antioquia')
INSERT [dbo].[UserAddressProvinces] ([UserAddressProvinceId], [Province]) VALUES (3, N'Valle del Cauca')
INSERT [dbo].[UserAddressProvinces] ([UserAddressProvinceId], [Province]) VALUES (4, N'Atlántico')
INSERT [dbo].[UserAddressProvinces] ([UserAddressProvinceId], [Province]) VALUES (5, N'Santander')
INSERT [dbo].[UserAddressProvinces] ([UserAddressProvinceId], [Province]) VALUES (6, N'Norte de Santander')
SET IDENTITY_INSERT [dbo].[UserAddressProvinces] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 05/07/2022 13:06:44 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_IdentificationTypeId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_IdentificationTypeId] ON [dbo].[AspNetUsers]
(
	[IdentificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_UserAddressCityId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_UserAddressCityId] ON [dbo].[AspNetUsers]
(
	[UserAddressCityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_UserAddressProvinceId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_UserAddressProvinceId] ON [dbo].[AspNetUsers]
(
	[UserAddressProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 05/07/2022 13:06:44 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_ProductItemId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_ProductItemId] ON [dbo].[OrderItems]
(
	[ProductItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrderItems_UserId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_UserId] ON [dbo].[OrderItems]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductItems_ProductId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_ProductItems_ProductId] ON [dbo].[ProductItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductItems_ProductItemBrandId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_ProductItems_ProductItemBrandId] ON [dbo].[ProductItems]
(
	[ProductItemBrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ProductTypeId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductTypeId] ON [dbo].[Products]
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserAddressCities_UserAddressProvinceId]    Script Date: 05/07/2022 13:06:44 ******/
CREATE NONCLUSTERED INDEX [IX_UserAddressCities_UserAddressProvinceId] ON [dbo].[UserAddressCities]
(
	[UserAddressProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT (N'') FOR [TransactionId]
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
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_IdentificationTypes_IdentificationTypeId] FOREIGN KEY([IdentificationTypeId])
REFERENCES [dbo].[IdentificationTypes] ([IdentificationTypeId])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_IdentificationTypes_IdentificationTypeId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_UserAddressCities_UserAddressCityId] FOREIGN KEY([UserAddressCityId])
REFERENCES [dbo].[UserAddressCities] ([UserAddressCityId])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_UserAddressCities_UserAddressCityId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_UserAddressProvinces_UserAddressProvinceId] FOREIGN KEY([UserAddressProvinceId])
REFERENCES [dbo].[UserAddressProvinces] ([UserAddressProvinceId])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_UserAddressProvinces_UserAddressProvinceId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_ProductItems_ProductItemId] FOREIGN KEY([ProductItemId])
REFERENCES [dbo].[ProductItems] ([ProductItemId])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_ProductItems_ProductItemId]
GO
ALTER TABLE [dbo].[ProductItems]  WITH CHECK ADD  CONSTRAINT [FK_ProductItems_ProductItemBrands_ProductItemBrandId] FOREIGN KEY([ProductItemBrandId])
REFERENCES [dbo].[ProductItemBrands] ([ProductItemBrandId])
GO
ALTER TABLE [dbo].[ProductItems] CHECK CONSTRAINT [FK_ProductItems_ProductItemBrands_ProductItemBrandId]
GO
ALTER TABLE [dbo].[ProductItems]  WITH CHECK ADD  CONSTRAINT [FK_ProductItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProductItems] CHECK CONSTRAINT [FK_ProductItems_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([ProductTypeId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes_ProductTypeId]
GO
ALTER TABLE [dbo].[UserAddressCities]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressCities_UserAddressProvinces_UserAddressProvinceId] FOREIGN KEY([UserAddressProvinceId])
REFERENCES [dbo].[UserAddressProvinces] ([UserAddressProvinceId])
GO
ALTER TABLE [dbo].[UserAddressCities] CHECK CONSTRAINT [FK_UserAddressCities_UserAddressProvinces_UserAddressProvinceId]
GO
/****** Object:  StoredProcedure [dbo].[DeleteProductItems]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteProductItems]
				(@ProductItemId as int)
AS
BEGIN
			delete from OrderItems
			where ProductItemId = @ProductItemId

	        delete from ProductItems
			 where ProductItemId = @ProductItemId

			
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrderItems]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertOrderItems]
				(@UserId as nvarchar(450),
				 @ProductItemId as int,
				 @TotalQuantity as bigint,
				 @TransactionId as nvarchar(MAX))
AS
BEGIN
	
	declare @Price as bigint
	select @Price = Price From ProductItems where ProductItemId = @ProductItemId

	insert into OrderItems
			select @TotalQuantity,
				   @Price * @TotalQuantity,
				   getdate(),
				   @ProductItemId,
				   @UserId,
				   @TransactionId

		update ProductItems set Available = Available - @TotalQuantity, 
								Sold = Sold + @TotalQuantity
							where ProductItemId = @ProductItemId

	
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProductItems]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[InsertProductItems]
				(@Name as nvarchar(50),
				 @Description as nvarchar(50),
				 @Price as bigint,
				 @Sold as bigint,
				 @Available as bigint,
				 @ProductId as int,
				 @ProductItemBrandId as int)
AS
BEGIN
	
	   insert into ProductItems
			select @Name,
				   @Description,
				   @Price,
				   @Sold,
				   @Available,
				   @ProductId,
				   @ProductItemBrandId,
				   getdate(),
				   getdate()
END
GO
/****** Object:  StoredProcedure [dbo].[SelectOrderItems]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectOrderItems]
AS
BEGIN
	      select OI.OrderItemId,
		         OI.TotalQuantity,
				 OI.TotalPrice,
				 OI.Date,
				 OI.UserId,
				 OI.TransactionId,
				 PT.Type,
				 P.Name as ProductName,
				 OI.ProductItemId,
				 PIT.Name as ProductItemName,
				 PIB.Brand
		    from OrderItems as OI
			     inner join ProductItems as PIT
				    on OI.ProductItemId = PIT.ProductItemId
			     inner join ProductItemBrands as PIB
				    on PIT.ProductItemBrandId = PIB.ProductItemBrandId
			     inner join Products as P
				    on PIT.ProductId = P.ProductId
			     inner join ProductTypes as PT
				    on P.ProductTypeId = PT.ProductTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[SelectProductItemBrands]    Script Date: 05/07/2022 13:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SelectProductItemBrands]
AS
BEGIN
	      select * from ProductItemBrands
END
GO
/****** Object:  StoredProcedure [dbo].[SelectProductItems]    Script Date: 05/07/2022 13:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectProductItems]
AS
BEGIN
	      select PIT.ProductItemId,
		         PIT.Name,
				 PIT.Description,
				 PIT.Price,
				 PIT.Sold,
				 PIT.Available,
				 PIT.CreationDate,
				 PIT.ModificationDate,
				 P.ProductTypeId,
				 PT.Type,
				 PIT.ProductId,
				 P.Name as ProductName,
				 PIB.ProductItemBrandId,
				 PIB.Brand
		    from ProductItems as PIT
			     inner join ProductItemBrands as PIB
				    on PIT.ProductItemBrandId = PIB.ProductItemBrandId
			     inner join Products as P
				    on PIT.ProductId = P.ProductId
				 inner join ProductTypes as PT
				    on PT.ProductTypeId = P.ProductTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[SelectProducts]    Script Date: 05/07/2022 13:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SelectProducts]
AS
BEGIN
	      select * from Products
END
GO
/****** Object:  StoredProcedure [dbo].[SelectProductTypes]    Script Date: 05/07/2022 13:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectProductTypes]
AS
BEGIN
	      select * from ProductTypes
END
GO
/****** Object:  StoredProcedure [dbo].[SelectUsers]    Script Date: 05/07/2022 13:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectUsers]
AS
BEGIN
			select ANU.Id,
				   ANU.IdentificationTypeId,
				   IT.Type as IdentificationType,
				   ANU.Identification,
			       ANU.FirstName,
				   ANU.LastName,
				   ANU.PhoneNumber,
				   ANU.Email,
				   ANU.UserAddressProvinceId,
				   UAP.Province,
				   ANU.UserAddressCityId,
				   UAD.City,
				   ANU.Address,
				   ANU.PostalCode,
				   ANR.Name as RolName,
				   ANU.CreationDate,
				   ANU.ModificationDate
			  from AspNetUsers as ANU
			       inner join AspNetUserRoles as ANUR
						 on ANU.Id = ANUR.UserId
				   inner join AspNetRoles as ANR
				         on ANUR.RoleId = ANR.Id
				   inner join IdentificationTypes as IT
				         on IT.IdentificationTypeId = ANU.IdentificationTypeId
				   inner join UserAddressProvinces as UAP
				         on UAP.UserAddressProvinceId = ANU.UserAddressProvinceId
				   inner join UserAddressCities as UAD
						 on UAD.UserAddressCityId = ANU.UserAddressCityId
				        and UAP.UserAddressProvinceId = UAD.UserAddressProvinceId


			
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductItems]    Script Date: 05/07/2022 13:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[UpdateProductItems]
				(@ProductItemId as int,
				 @Name as nvarchar(50),
				 @Description as nvarchar(50),
				 @Price as bigint,
				 @Sold as bigint,
				 @Available as bigint,
				 @ProductId as int,
				 @ProductItemBrandId as int,
				 @CreationDate as datetime2(7))
AS
BEGIN
	
	        update ProductItems
			   set Name = @Name,
				   Description = @Description,
				   Price = @Price,
				   Sold = @Sold,
				   Available = @Available,
				   ProductId = @ProductId,
				   ProductItemBrandId = @ProductItemBrandId,
				   CreationDate = @CreationDate,
				   ModificationDate = getdate()
			 where ProductItemId = @ProductItemId
END
GO
USE [master]
GO
ALTER DATABASE [ShoppingCart] SET  READ_WRITE 
GO
