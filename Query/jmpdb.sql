USE [master]
GO
/****** Object:  Database [jmpdb]    Script Date: 10/29/2024 7:12:18 AM ******/
CREATE DATABASE [jmpdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jmpdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\jmpdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'jmpdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\jmpdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [jmpdb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jmpdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jmpdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jmpdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jmpdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jmpdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jmpdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [jmpdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jmpdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jmpdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jmpdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jmpdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jmpdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jmpdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jmpdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jmpdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jmpdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [jmpdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jmpdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jmpdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jmpdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jmpdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jmpdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jmpdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jmpdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [jmpdb] SET  MULTI_USER 
GO
ALTER DATABASE [jmpdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jmpdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [jmpdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [jmpdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [jmpdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [jmpdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [jmpdb] SET QUERY_STORE = ON
GO
ALTER DATABASE [jmpdb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [jmpdb]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/29/2024 7:12:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/29/2024 7:12:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 10/29/2024 7:12:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[PurchaseID] [int] IDENTITY(1,1) NOT NULL,
	[No] [varchar](25) NOT NULL,
	[Date] [datetime] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetail]    Script Date: 10/29/2024 7:12:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDetail](
	[PurchaseDetailID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseID] [int] NOT NULL,
	[ProductID] [varchar](25) NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_PurchaseDetail] PRIMARY KEY CLUSTERED 
(
	[PurchaseDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 10/29/2024 7:12:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SalesID] [int] IDENTITY(1,1) NOT NULL,
	[No] [varchar](25) NOT NULL,
	[Date] [datetime] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesDetail]    Script Date: 10/29/2024 7:12:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDetail](
	[SalesDetailID] [int] IDENTITY(1,1) NOT NULL,
	[SalesID] [int] NOT NULL,
	[ProductID] [varchar](25) NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_SalesDetail] PRIMARY KEY CLUSTERED 
(
	[SalesDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 10/29/2024 7:12:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (1, N'Dayat')
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (2, N'Asep')
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (3, N'Anwar')
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (4, N'Okky')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Name]) VALUES (1, N'Gelang')
INSERT [dbo].[Product] ([ProductID], [Name]) VALUES (2, N'Kalung')
INSERT [dbo].[Product] ([ProductID], [Name]) VALUES (3, N'Cincin')
INSERT [dbo].[Product] ([ProductID], [Name]) VALUES (4, N'Anting')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([PurchaseID], [No], [Date], [SupplierID]) VALUES (1, N'S240001', CAST(N'2024-07-01T09:00:00.000' AS DateTime), 1)
INSERT [dbo].[Purchase] ([PurchaseID], [No], [Date], [SupplierID]) VALUES (2, N'S240002', CAST(N'2024-07-02T09:00:00.000' AS DateTime), 2)
INSERT [dbo].[Purchase] ([PurchaseID], [No], [Date], [SupplierID]) VALUES (3, N'S240003', CAST(N'2024-07-03T09:00:00.000' AS DateTime), 3)
INSERT [dbo].[Purchase] ([PurchaseID], [No], [Date], [SupplierID]) VALUES (4, N'P240004', CAST(N'2024-07-04T09:00:00.000' AS DateTime), 1)
INSERT [dbo].[Purchase] ([PurchaseID], [No], [Date], [SupplierID]) VALUES (5, N'P240005', CAST(N'2024-07-05T09:00:00.000' AS DateTime), 2)
INSERT [dbo].[Purchase] ([PurchaseID], [No], [Date], [SupplierID]) VALUES (6, N'P240006', CAST(N'2024-07-06T09:00:00.000' AS DateTime), 3)
INSERT [dbo].[Purchase] ([PurchaseID], [No], [Date], [SupplierID]) VALUES (7, N'P240007', CAST(N'2024-07-14T09:00:00.000' AS DateTime), 3)
INSERT [dbo].[Purchase] ([PurchaseID], [No], [Date], [SupplierID]) VALUES (8, N'P240008', CAST(N'2024-07-15T09:00:00.000' AS DateTime), 2)
INSERT [dbo].[Purchase] ([PurchaseID], [No], [Date], [SupplierID]) VALUES (9, N'P240009', CAST(N'2024-07-16T09:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Purchase] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseDetail] ON 

INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (1, 1, N'1', 400)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (2, 1, N'3', 220)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (3, 1, N'5', 310)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (4, 2, N'2', 830)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (5, 2, N'3', 420)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (6, 2, N'4', 340)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (7, 3, N'4', 190)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (8, 3, N'3', 690)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (9, 3, N'5', 720)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (10, 4, N'1', 485)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (11, 4, N'2', 275)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (12, 4, N'5', 380)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (13, 5, N'1', 530)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (14, 5, N'3', 710)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (15, 5, N'4', 410)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (16, 6, N'1', 300)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (17, 6, N'2', 520)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (18, 6, N'3', 200)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (19, 7, N'1', 485)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (20, 7, N'2', 275)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (21, 7, N'4', 380)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (22, 8, N'1', 530)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (23, 8, N'5', 710)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (24, 8, N'4', 510)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (25, 9, N'4', 300)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (26, 9, N'2', 520)
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [PurchaseID], [ProductID], [Quantity]) VALUES (27, 9, N'3', 400)
SET IDENTITY_INSERT [dbo].[PurchaseDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([SalesID], [No], [Date], [CustomerID]) VALUES (1, N'S240001', CAST(N'2024-07-01T11:00:00.000' AS DateTime), 1)
INSERT [dbo].[Sales] ([SalesID], [No], [Date], [CustomerID]) VALUES (2, N'S240002', CAST(N'2024-07-02T11:00:00.000' AS DateTime), 2)
INSERT [dbo].[Sales] ([SalesID], [No], [Date], [CustomerID]) VALUES (3, N'S240003', CAST(N'2024-07-03T11:00:00.000' AS DateTime), 3)
INSERT [dbo].[Sales] ([SalesID], [No], [Date], [CustomerID]) VALUES (4, N'S240004', CAST(N'2024-07-04T11:00:00.000' AS DateTime), 1)
INSERT [dbo].[Sales] ([SalesID], [No], [Date], [CustomerID]) VALUES (5, N'S240005', CAST(N'2024-07-05T11:00:00.000' AS DateTime), 2)
INSERT [dbo].[Sales] ([SalesID], [No], [Date], [CustomerID]) VALUES (6, N'S240006', CAST(N'2024-07-06T11:00:00.000' AS DateTime), 3)
INSERT [dbo].[Sales] ([SalesID], [No], [Date], [CustomerID]) VALUES (7, N'S240007', CAST(N'2024-07-14T11:00:00.000' AS DateTime), 3)
INSERT [dbo].[Sales] ([SalesID], [No], [Date], [CustomerID]) VALUES (8, N'S240008', CAST(N'2024-07-15T11:00:00.000' AS DateTime), 2)
INSERT [dbo].[Sales] ([SalesID], [No], [Date], [CustomerID]) VALUES (9, N'S240009', CAST(N'2024-07-16T11:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Sales] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesDetail] ON 

INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (1, 1, N'1', 300)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (2, 1, N'3', 120)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (3, 1, N'5', 210)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (4, 2, N'2', 730)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (5, 2, N'3', 320)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (6, 2, N'4', 240)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (7, 3, N'4', 90)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (8, 3, N'3', 590)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (9, 3, N'5', 620)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (10, 4, N'1', 385)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (11, 4, N'2', 175)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (12, 4, N'5', 280)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (13, 5, N'1', 430)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (14, 5, N'3', 610)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (15, 5, N'4', 310)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (16, 6, N'1', 200)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (17, 6, N'2', 420)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (18, 6, N'3', 300)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (19, 7, N'1', 385)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (20, 7, N'2', 175)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (21, 7, N'4', 280)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (22, 8, N'1', 430)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (23, 8, N'5', 610)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (24, 8, N'4', 310)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (25, 9, N'4', 200)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (26, 9, N'2', 420)
INSERT [dbo].[SalesDetail] ([SalesDetailID], [SalesID], [ProductID], [Quantity]) VALUES (27, 9, N'3', 300)
SET IDENTITY_INSERT [dbo].[SalesDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierID], [Name]) VALUES (1, N'PT.UBS')
INSERT [dbo].[Supplier] ([SupplierID], [Name]) VALUES (2, N'PT.ANTAM')
INSERT [dbo].[Supplier] ([SupplierID], [Name]) VALUES (3, N'Galeri24')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
/****** Object:  StoredProcedure [dbo].[GetCustomers]    Script Date: 10/29/2024 7:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nurul Hidayat
-- Create date: 28 Oktober 2024
-- Description:	Mengambil data Customer
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomers]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Customer;
END
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 10/29/2024 7:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProducts]
AS
BEGIN
    SELECT ProductID AS Id,Name
    FROM 
        product
    ORDER BY 
        Name;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionData]    Script Date: 10/29/2024 7:12:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTransactionData]
    @TanggalAwal DATETIME,
    @TanggalAkhir DATETIME,
    @ProductID VARCHAR(25) = NULL  -- Optional parameter
AS
BEGIN
      SET NOCOUNT ON;

    -- Union of Sales and Purchases with initial QtyKeluar and QtyMasuk
    ;WITH Transactions AS (
        SELECT 
            S.Date AS Tanggal,
            S.No AS NoTrx,
            C.Name AS Keterangan,
            SUM(SD.Quantity) AS QtyKeluar,
            0 AS QtyMasuk,
            SUM(SD.Quantity) AS SaldoQty
        FROM 
            Sales S
        JOIN 
            SalesDetail SD ON S.SalesID = SD.SalesID
        JOIN 
            Customer C ON S.CustomerID = C.CustomerID
        WHERE 
            S.Date BETWEEN @TanggalAwal AND @TanggalAkhir
            AND (SD.ProductID = @ProductID OR @ProductID IS NULL)
        GROUP BY 
            S.Date, S.No, C.Name

        UNION ALL

        SELECT 
            P.Date AS Tanggal,
            P.No AS NoTrx,
            SU.Name AS Keterangan,
            0 AS QtyKeluar,
            SUM(PD.Quantity) AS QtyMasuk,
            SUM(PD.Quantity) AS SaldoQty
        FROM 
            Purchase P
        JOIN 
            PurchaseDetail PD ON P.PurchaseID = PD.PurchaseID
        JOIN 
            Supplier SU ON P.SupplierID = SU.SupplierID
        WHERE 
            P.Date BETWEEN @TanggalAwal AND @TanggalAkhir
            AND (PD.ProductID = @ProductID OR @ProductID IS NULL)
        GROUP BY 
            P.Date, P.No, SU.Name
    )

    -- Calculate Running Balance
    SELECT 
        Tanggal,
        NoTrx,
        Keterangan,
        QtyKeluar,
        QtyMasuk,
        SUM(QtyMasuk - QtyKeluar) OVER (ORDER BY Tanggal, NoTrx ROWS UNBOUNDED PRECEDING) AS SaldoQty
    FROM 
        Transactions
    ORDER BY 
        Tanggal, NoTrx;
END
GO
USE [master]
GO
ALTER DATABASE [jmpdb] SET  READ_WRITE 
GO
