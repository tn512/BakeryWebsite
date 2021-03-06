USE [master]
GO
/****** Object:  Database [BakeryWebsite]    Script Date: 4/22/2020 10:45:23 AM ******/
CREATE DATABASE [BakeryWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BakeryWebsite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BakeryWebsite.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BakeryWebsite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BakeryWebsite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BakeryWebsite] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BakeryWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BakeryWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BakeryWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BakeryWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BakeryWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BakeryWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [BakeryWebsite] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BakeryWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BakeryWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BakeryWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BakeryWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BakeryWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BakeryWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BakeryWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BakeryWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BakeryWebsite] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BakeryWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BakeryWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BakeryWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BakeryWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BakeryWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BakeryWebsite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BakeryWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BakeryWebsite] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BakeryWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [BakeryWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BakeryWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BakeryWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BakeryWebsite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BakeryWebsite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BakeryWebsite] SET QUERY_STORE = OFF
GO
USE [BakeryWebsite]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/22/2020 10:45:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 4/22/2020 10:45:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[coupon_id] [int] IDENTITY(1,1) NOT NULL,
	[coupon_code] [varchar](255) NOT NULL,
	[coupon_type] [bit] NOT NULL,
	[discount] [int] NOT NULL,
	[date_from] [date] NOT NULL,
	[date_To] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/22/2020 10:45:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[coupon_id] [int] NULL,
	[order_status] [bit] NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NULL,
	[payment_id] [int] NOT NULL,
	[shipping_address] [varchar](255) NOT NULL,
	[contact_phone] [varchar](20) NOT NULL,
	[contact_email] [varchar](50) NOT NULL,
	[contact_name] [varchar](50) NOT NULL,
	[total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_item]    Script Date: 4/22/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_item](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 4/22/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] NOT NULL,
	[payment_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/22/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[category_id] [int] NOT NULL,
	[price] [money] NOT NULL,
	[quantity] [smallint] NOT NULL,
	[description] [varchar](255) NOT NULL,
	[image] [image] NULL,
	[image_alt] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 4/22/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[reservation_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[date_time] [datetime] NOT NULL,
	[attendance] [smallint] NOT NULL,
	[note] [ntext] NULL,
	[time] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/22/2020 10:45:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[birthdate] [date] NULL,
	[phone] [varchar](25) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[address] [varchar](255) NULL,
	[password] [varchar](25) NOT NULL,
	[status] [bit] NOT NULL,
	[role] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([coupon_id])
REFERENCES [dbo].[Coupon] ([coupon_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [BakeryWebsite] SET  READ_WRITE 
GO
