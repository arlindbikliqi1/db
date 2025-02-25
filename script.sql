USE [master]
GO
/****** Object:  Database [PentasharpDB]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE DATABASE [PentasharpDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PentasharpDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PentasharpDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PentasharpDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PentasharpDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PentasharpDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PentasharpDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PentasharpDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PentasharpDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PentasharpDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PentasharpDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PentasharpDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PentasharpDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PentasharpDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PentasharpDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PentasharpDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PentasharpDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PentasharpDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PentasharpDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PentasharpDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PentasharpDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PentasharpDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PentasharpDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PentasharpDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PentasharpDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PentasharpDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PentasharpDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PentasharpDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PentasharpDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PentasharpDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PentasharpDB] SET  MULTI_USER 
GO
ALTER DATABASE [PentasharpDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PentasharpDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PentasharpDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PentasharpDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PentasharpDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PentasharpDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PentasharpDB', N'ON'
GO
ALTER DATABASE [PentasharpDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [PentasharpDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PentasharpDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/9/2024 1:09:48 PM ******/
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
/****** Object:  Table [dbo].[BusCompanies]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusCompanies](
	[BusCompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](max) NOT NULL,
	[ContactInfo] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BusCompanies] PRIMARY KEY CLUSTERED 
(
	[BusCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[BusId] [int] IDENTITY(1,1) NOT NULL,
	[BusNumber] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
	[BusCompanyId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Buses] PRIMARY KEY CLUSTERED 
(
	[BusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusReservations]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusReservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[ReservationDate] [datetime2](7) NOT NULL,
	[NumberOfSeats] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[ScheduleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_BusReservations] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusRouteAssignments]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusRouteAssignments](
	[AssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[BusId] [int] NOT NULL,
	[RouteId] [int] NOT NULL,
 CONSTRAINT [PK_BusRouteAssignments] PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusRoutes]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusRoutes](
	[RouteId] [int] IDENTITY(1,1) NOT NULL,
	[FromLocation] [nvarchar](100) NOT NULL,
	[ToLocation] [nvarchar](100) NOT NULL,
	[EstimatedDuration] [time](7) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_BusRoutes] PRIMARY KEY CLUSTERED 
(
	[RouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusSchedules]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusSchedules](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[DepartureTime] [datetime2](7) NOT NULL,
	[ArrivalTime] [datetime2](7) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[AvailableSeats] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[BusId] [int] NOT NULL,
	[RouteId] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_BusSchedules] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](256) NOT NULL,
	[SentAt] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
	[BookingId] [int] NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxiBookings]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxiBookings](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[PickupLocation] [nvarchar](100) NOT NULL,
	[DropoffLocation] [nvarchar](256) NOT NULL,
	[BookingTime] [datetime2](7) NOT NULL,
	[TripStartTime] [datetime2](7) NOT NULL,
	[TripEndTime] [datetime2](7) NOT NULL,
	[Fare] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
	[TaxiId] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_TaxiBookings] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxiCompanies]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxiCompanies](
	[TaxiCompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[ContactInfo] [nvarchar](256) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TaxiCompanies] PRIMARY KEY CLUSTERED 
(
	[TaxiCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxiReservations]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxiReservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[TaxiId] [int] NULL,
	[TaxiCompanyId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PickupLocation] [nvarchar](256) NOT NULL,
	[DropoffLocation] [nvarchar](256) NOT NULL,
	[ReservationTime] [datetime2](7) NOT NULL,
	[TripStartTime] [datetime2](7) NULL,
	[TripEndTime] [datetime2](7) NULL,
	[Fare] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[PassengerCount] [int] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_TaxiReservations] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Taxis]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taxis](
	[TaxiId] [int] IDENTITY(1,1) NOT NULL,
	[TaxiCompanyId] [int] NOT NULL,
	[LicensePlate] [nvarchar](20) NOT NULL,
	[DriverName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Taxis] PRIMARY KEY CLUSTERED 
(
	[TaxiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/9/2024 1:09:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Buses_BusCompanyId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_Buses_BusCompanyId] ON [dbo].[Buses]
(
	[BusCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BusReservations_ScheduleId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BusReservations_ScheduleId] ON [dbo].[BusReservations]
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BusReservations_UserId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BusReservations_UserId] ON [dbo].[BusReservations]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BusRouteAssignments_BusId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BusRouteAssignments_BusId] ON [dbo].[BusRouteAssignments]
(
	[BusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BusRouteAssignments_RouteId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BusRouteAssignments_RouteId] ON [dbo].[BusRouteAssignments]
(
	[RouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BusSchedules_BusId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BusSchedules_BusId] ON [dbo].[BusSchedules]
(
	[BusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BusSchedules_RouteId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_BusSchedules_RouteId] ON [dbo].[BusSchedules]
(
	[RouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notifications_BookingId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_Notifications_BookingId] ON [dbo].[Notifications]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notifications_UserId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_Notifications_UserId] ON [dbo].[Notifications]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaxiBookings_TaxiId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_TaxiBookings_TaxiId] ON [dbo].[TaxiBookings]
(
	[TaxiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaxiBookings_UserId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_TaxiBookings_UserId] ON [dbo].[TaxiBookings]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TaxiCompanies_CompanyName]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TaxiCompanies_CompanyName] ON [dbo].[TaxiCompanies]
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaxiReservations_TaxiCompanyId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_TaxiReservations_TaxiCompanyId] ON [dbo].[TaxiReservations]
(
	[TaxiCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaxiReservations_TaxiId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_TaxiReservations_TaxiId] ON [dbo].[TaxiReservations]
(
	[TaxiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaxiReservations_UserId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_TaxiReservations_UserId] ON [dbo].[TaxiReservations]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Taxis_LicensePlate]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Taxis_LicensePlate] ON [dbo].[Taxis]
(
	[LicensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Taxis_TaxiCompanyId]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_Taxis_TaxiCompanyId] ON [dbo].[Taxis]
(
	[TaxiCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 12/9/2024 1:09:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BusReservations] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BusRouteAssignments] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BusSchedules] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getutcdate()) FOR [SentAt]
GO
ALTER TABLE [dbo].[TaxiBookings] ADD  DEFAULT (getutcdate()) FOR [BookingTime]
GO
ALTER TABLE [dbo].[TaxiBookings] ADD  DEFAULT (getutcdate()) FOR [TripStartTime]
GO
ALTER TABLE [dbo].[TaxiBookings] ADD  DEFAULT (getutcdate()) FOR [TripEndTime]
GO
ALTER TABLE [dbo].[TaxiBookings] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TaxiBookings] ADD  DEFAULT (getutcdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[TaxiCompanies] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TaxiReservations] ADD  DEFAULT (getutcdate()) FOR [ReservationTime]
GO
ALTER TABLE [dbo].[TaxiReservations] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Taxis] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD  CONSTRAINT [FK_Buses_BusCompanies_BusCompanyId] FOREIGN KEY([BusCompanyId])
REFERENCES [dbo].[BusCompanies] ([BusCompanyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Buses] CHECK CONSTRAINT [FK_Buses_BusCompanies_BusCompanyId]
GO
ALTER TABLE [dbo].[BusReservations]  WITH CHECK ADD  CONSTRAINT [FK_BusReservations_BusSchedules_ScheduleId] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[BusSchedules] ([ScheduleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BusReservations] CHECK CONSTRAINT [FK_BusReservations_BusSchedules_ScheduleId]
GO
ALTER TABLE [dbo].[BusReservations]  WITH CHECK ADD  CONSTRAINT [FK_BusReservations_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BusReservations] CHECK CONSTRAINT [FK_BusReservations_Users_UserId]
GO
ALTER TABLE [dbo].[BusRouteAssignments]  WITH CHECK ADD  CONSTRAINT [FK_BusRouteAssignments_Buses_BusId] FOREIGN KEY([BusId])
REFERENCES [dbo].[Buses] ([BusId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BusRouteAssignments] CHECK CONSTRAINT [FK_BusRouteAssignments_Buses_BusId]
GO
ALTER TABLE [dbo].[BusRouteAssignments]  WITH CHECK ADD  CONSTRAINT [FK_BusRouteAssignments_BusRoutes_RouteId] FOREIGN KEY([RouteId])
REFERENCES [dbo].[BusRoutes] ([RouteId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BusRouteAssignments] CHECK CONSTRAINT [FK_BusRouteAssignments_BusRoutes_RouteId]
GO
ALTER TABLE [dbo].[BusSchedules]  WITH CHECK ADD  CONSTRAINT [FK_BusSchedules_Buses_BusId] FOREIGN KEY([BusId])
REFERENCES [dbo].[Buses] ([BusId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BusSchedules] CHECK CONSTRAINT [FK_BusSchedules_Buses_BusId]
GO
ALTER TABLE [dbo].[BusSchedules]  WITH CHECK ADD  CONSTRAINT [FK_BusSchedules_BusRoutes_RouteId] FOREIGN KEY([RouteId])
REFERENCES [dbo].[BusRoutes] ([RouteId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BusSchedules] CHECK CONSTRAINT [FK_BusSchedules_BusRoutes_RouteId]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_TaxiBookings_BookingId] FOREIGN KEY([BookingId])
REFERENCES [dbo].[TaxiBookings] ([BookingId])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_TaxiBookings_BookingId]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Users_UserId]
GO
ALTER TABLE [dbo].[TaxiBookings]  WITH CHECK ADD  CONSTRAINT [FK_TaxiBookings_Taxis_TaxiId] FOREIGN KEY([TaxiId])
REFERENCES [dbo].[Taxis] ([TaxiId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaxiBookings] CHECK CONSTRAINT [FK_TaxiBookings_Taxis_TaxiId]
GO
ALTER TABLE [dbo].[TaxiBookings]  WITH CHECK ADD  CONSTRAINT [FK_TaxiBookings_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaxiBookings] CHECK CONSTRAINT [FK_TaxiBookings_Users_UserId]
GO
ALTER TABLE [dbo].[TaxiReservations]  WITH CHECK ADD  CONSTRAINT [FK_TaxiReservations_TaxiCompanies_TaxiCompanyId] FOREIGN KEY([TaxiCompanyId])
REFERENCES [dbo].[TaxiCompanies] ([TaxiCompanyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaxiReservations] CHECK CONSTRAINT [FK_TaxiReservations_TaxiCompanies_TaxiCompanyId]
GO
ALTER TABLE [dbo].[TaxiReservations]  WITH CHECK ADD  CONSTRAINT [FK_TaxiReservations_Taxis_TaxiId] FOREIGN KEY([TaxiId])
REFERENCES [dbo].[Taxis] ([TaxiId])
GO
ALTER TABLE [dbo].[TaxiReservations] CHECK CONSTRAINT [FK_TaxiReservations_Taxis_TaxiId]
GO
ALTER TABLE [dbo].[TaxiReservations]  WITH CHECK ADD  CONSTRAINT [FK_TaxiReservations_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[TaxiReservations] CHECK CONSTRAINT [FK_TaxiReservations_Users_UserId]
GO
ALTER TABLE [dbo].[Taxis]  WITH CHECK ADD  CONSTRAINT [FK_Taxis_TaxiCompanies_TaxiCompanyId] FOREIGN KEY([TaxiCompanyId])
REFERENCES [dbo].[TaxiCompanies] ([TaxiCompanyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Taxis] CHECK CONSTRAINT [FK_Taxis_TaxiCompanies_TaxiCompanyId]
GO
USE [master]
GO
ALTER DATABASE [PentasharpDB] SET  READ_WRITE 
GO
