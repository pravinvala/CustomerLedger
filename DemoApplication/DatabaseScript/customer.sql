USE [master]
GO
/****** Object:  Database [test]    Script Date: 07/20/20 2:14:00 PM ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [test] SET QUERY_STORE = OFF
GO
USE [test]
GO
/****** Object:  Table [dbo].[TBL_City]    Script Date: 07/20/20 2:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_TBL_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Customer]    Script Date: 07/20/20 2:14:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Turnover] [bigint] NULL,
	[DOB] [date] NULL,
	[CityID] [int] NULL,
 CONSTRAINT [PK_TBL_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_City] ON 

INSERT [dbo].[TBL_City] ([ID], [Name], [Description]) VALUES (1, N'Surat', N'')
INSERT [dbo].[TBL_City] ([ID], [Name], [Description]) VALUES (2, N'Baroda', N'')
INSERT [dbo].[TBL_City] ([ID], [Name], [Description]) VALUES (3, N'Rajkot', N'')
INSERT [dbo].[TBL_City] ([ID], [Name], [Description]) VALUES (4, N'Ahmedabad', N'')
INSERT [dbo].[TBL_City] ([ID], [Name], [Description]) VALUES (5, N'Bhavnagar', N'')
INSERT [dbo].[TBL_City] ([ID], [Name], [Description]) VALUES (6, N'Navsari', N'')
SET IDENTITY_INSERT [dbo].[TBL_City] OFF
SET IDENTITY_INSERT [dbo].[TBL_Customer] ON 

INSERT [dbo].[TBL_Customer] ([ID], [FirstName], [LastName], [Address], [Contact], [Turnover], [DOB], [CityID]) VALUES (1, N'Alan', N'Due', N'test', N'9874563021', 50000, CAST(N'1994-05-05' AS Date), 1)
INSERT [dbo].[TBL_Customer] ([ID], [FirstName], [LastName], [Address], [Contact], [Turnover], [DOB], [CityID]) VALUES (2, N'Anna', N'Due', N'test', N'9870456321', 50000, CAST(N'1994-05-05' AS Date), 2)
INSERT [dbo].[TBL_Customer] ([ID], [FirstName], [LastName], [Address], [Contact], [Turnover], [DOB], [CityID]) VALUES (3, N'John', N'Due', N'test', N'7687456321', 50000, CAST(N'1995-05-12' AS Date), 3)
INSERT [dbo].[TBL_Customer] ([ID], [FirstName], [LastName], [Address], [Contact], [Turnover], [DOB], [CityID]) VALUES (4, N'Alice', N'Carter', N'test', N'8855456321', 50000, CAST(N'1990-12-05' AS Date), 4)
INSERT [dbo].[TBL_Customer] ([ID], [FirstName], [LastName], [Address], [Contact], [Turnover], [DOB], [CityID]) VALUES (5, N'Bob', N'Carter', N'test', N'987456321', 50000, CAST(N'1994-05-05' AS Date), 5)
INSERT [dbo].[TBL_Customer] ([ID], [FirstName], [LastName], [Address], [Contact], [Turnover], [DOB], [CityID]) VALUES (6, N'Lily', N'Cleark', N'test', N'987456321', 50000, CAST(N'1994-05-05' AS Date), 6)
SET IDENTITY_INSERT [dbo].[TBL_Customer] OFF
ALTER TABLE [dbo].[TBL_Customer]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Customer_TBL_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[TBL_City] ([ID])
GO
ALTER TABLE [dbo].[TBL_Customer] CHECK CONSTRAINT [FK_TBL_Customer_TBL_City]
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
