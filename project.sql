USE [master]
GO
/****** Object:  Database [FPTUDeviceManagement]    Script Date: 3/16/2020 10:59:48 PM ******/
CREATE DATABASE [FPTUDeviceManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTUDeviceManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FPTUDeviceManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FPTUDeviceManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FPTUDeviceManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FPTUDeviceManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPTUDeviceManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPTUDeviceManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPTUDeviceManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPTUDeviceManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FPTUDeviceManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPTUDeviceManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [FPTUDeviceManagement] SET  MULTI_USER 
GO
ALTER DATABASE [FPTUDeviceManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPTUDeviceManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPTUDeviceManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPTUDeviceManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FPTUDeviceManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FPTUDeviceManagement', N'ON'
GO
USE [FPTUDeviceManagement]
GO
/****** Object:  Table [dbo].[Device]    Script Date: 3/16/2020 10:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Device](
	[DeviceID] [varchar](10) NOT NULL,
	[DeviceName] [varchar](30) NULL,
	[DeviceDescription] [varchar](50) NULL,
	[DeviceType] [varchar](20) NULL,
	[DevicePositionID] [varchar](100) NULL,
	[DeviceImage] [nvarchar](max) NULL,
	[DateOfPurchase] [varchar](15) NULL,
	[WarrantyPeriod] [varchar](15) NULL,
	[NumberOfCorrections] [int] NULL,
	[DeviceStatus] [varchar](50) NULL,
 CONSTRAINT [PK_Device] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DevicePositionHistory]    Script Date: 3/16/2020 10:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DevicePositionHistory](
	[DevicePositionID] [varchar](100) NOT NULL,
	[DeviceID] [varchar](10) NULL,
	[RoomNo] [varchar](10) NULL,
	[From] [datetime] NULL,
	[To] [datetime] NULL,
	[UserMove] [varchar](20) NULL,
	[ReasonMove] [varchar](100) NULL,
 CONSTRAINT [PK_DevicePositionHistory] PRIMARY KEY CLUSTERED 
(
	[DevicePositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/16/2020 10:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [varchar](50) NOT NULL,
	[DeviceID] [varchar](10) NULL,
	[Sender] [varchar](30) NULL,
	[RequiredContent] [varchar](100) NULL,
	[Time] [datetime] NULL,
	[Repairer] [varchar](30) NULL,
	[RepairContent] [varchar](100) NULL,
	[RepairFrom] [datetime] NULL,
	[RepairTo] [datetime] NULL,
	[Result] [varchar](20) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 3/16/2020 10:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notifications](
	[Notification] [varchar](max) NULL,
	[Time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 3/16/2020 10:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registration](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](50) NULL,
	[Fullname] [varchar](30) NULL,
	[Role] [varchar](10) NULL,
	[WorkingRoom] [varchar](10) NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 3/16/2020 10:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomNo] [varchar](10) NOT NULL,
	[Floor] [varchar](5) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemNotification]    Script Date: 3/16/2020 10:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemNotification](
	[Content] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserNotification]    Script Date: 3/16/2020 10:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserNotification](
	[UserID] [varchar](20) NULL,
	[Content] [varchar](max) NULL,
	[Time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Device] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Device] ([DeviceID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Device]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Room] FOREIGN KEY([WorkingRoom])
REFERENCES [dbo].[Room] ([RoomNo])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Room]
GO
USE [master]
GO
ALTER DATABASE [FPTUDeviceManagement] SET  READ_WRITE 
GO
