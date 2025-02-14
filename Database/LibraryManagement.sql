USE [LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[UpdateReturnDate]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP PROCEDURE [dbo].[UpdateReturnDate]
GO
/****** Object:  StoredProcedure [dbo].[RegisterNewClient]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP PROCEDURE [dbo].[RegisterNewClient]
GO
/****** Object:  StoredProcedure [dbo].[RegisterLoan]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP PROCEDURE [dbo].[RegisterLoan]
GO
/****** Object:  StoredProcedure [dbo].[GetMaterialByISBN]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP PROCEDURE [dbo].[GetMaterialByISBN]
GO
/****** Object:  StoredProcedure [dbo].[DeleteClient]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP PROCEDURE [dbo].[DeleteClient]
GO
/****** Object:  StoredProcedure [dbo].[CalculateLateFee]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP PROCEDURE [dbo].[CalculateLateFee]
GO
ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [FK_Payments_Clients]
GO
ALTER TABLE [dbo].[Loans] DROP CONSTRAINT [FK_Loans_Bibliographic_Materials]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/31/2025 2:34:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  View [dbo].[vSelectClientsPayment]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP VIEW [dbo].[vSelectClientsPayment]
GO
/****** Object:  View [dbo].[vSelectOverdue_Payments]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP VIEW [dbo].[vSelectOverdue_Payments]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 1/31/2025 2:34:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payments]') AND type in (N'U'))
DROP TABLE [dbo].[Payments]
GO
/****** Object:  View [dbo].[vSelectActiveLoans]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP VIEW [dbo].[vSelectActiveLoans]
GO
/****** Object:  View [dbo].[vSelectMaterialCountByType]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP VIEW [dbo].[vSelectMaterialCountByType]
GO
/****** Object:  Table [dbo].[Bibliographic_Materials]    Script Date: 1/31/2025 2:34:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bibliographic_Materials]') AND type in (N'U'))
DROP TABLE [dbo].[Bibliographic_Materials]
GO
/****** Object:  View [dbo].[vSelectActiveClients]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP VIEW [dbo].[vSelectActiveClients]
GO
/****** Object:  View [dbo].[vSelectOverdueLoans]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP VIEW [dbo].[vSelectOverdueLoans]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 1/31/2025 2:34:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Loans]') AND type in (N'U'))
DROP TABLE [dbo].[Loans]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 1/31/2025 2:34:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clients]') AND type in (N'U'))
DROP TABLE [dbo].[Clients]
GO
/****** Object:  UserDefinedFunction [dbo].[GetTotalMaterials]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP FUNCTION [dbo].[GetTotalMaterials]
GO
/****** Object:  UserDefinedFunction [dbo].[GetTotalLoansByClient]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP FUNCTION [dbo].[GetTotalLoansByClient]
GO
/****** Object:  UserDefinedFunction [dbo].[GetClientBalance]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP FUNCTION [dbo].[GetClientBalance]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAverageLoansPerClient]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP FUNCTION [dbo].[GetAverageLoansPerClient]
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateTotalLateFees]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP FUNCTION [dbo].[CalculateTotalLateFees]
GO
/****** Object:  UserDefinedFunction [dbo].[CalculatePenaltyFee]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP FUNCTION [dbo].[CalculatePenaltyFee]
GO
USE [master]
GO
/****** Object:  Database [LibraryManagement]    Script Date: 1/31/2025 2:34:28 PM ******/
DROP DATABASE [LibraryManagement]
GO
/****** Object:  Database [LibraryManagement]    Script Date: 1/31/2025 2:34:28 PM ******/
CREATE DATABASE [LibraryManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\LibraryManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\LibraryManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LibraryManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryManagement', N'ON'
GO
ALTER DATABASE [LibraryManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [LibraryManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LibraryManagement]
GO
/****** Object:  UserDefinedFunction [dbo].[CalculatePenaltyFee]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CalculatePenaltyFee] (@Loan_ID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Return_Date DATE, @Actual_Return_Date DATE, @Penalty DECIMAL(10,2);

    SELECT @Return_Date = Return_Date, @Actual_Return_Date = Actual_Return_Date
    FROM Loans
    WHERE Loan_ID = @Loan_ID;

    SET @Penalty = CASE 
                     WHEN @Actual_Return_Date > @Return_Date 
                     THEN DATEDIFF(DAY, @Return_Date, @Actual_Return_Date) * 1.50
                     ELSE 0 
                   END;

    RETURN @Penalty;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateTotalLateFees]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CalculateTotalLateFees]()
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @TotalPenalty DECIMAL(10,2);

    SELECT @TotalPenalty = SUM(DATEDIFF(DAY, Return_Date, Actual_Return_Date) * 1.50)
    FROM Loans
    WHERE Actual_Return_Date IS NOT NULL 
          AND Return_Date < Actual_Return_Date;

    RETURN ISNULL(@TotalPenalty, 0);
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetAverageLoansPerClient]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetAverageLoansPerClient]()
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @AverageLoans DECIMAL(10,2);

    -- Llogarit mesataren e huazimeve për klient
    SELECT @AverageLoans = CAST(COUNT(Loan_ID) AS DECIMAL(10,2)) / 
                           NULLIF(COUNT(DISTINCT Client_ID), 0)
    FROM Loans;

    RETURN ISNULL(@AverageLoans, 0);
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetClientBalance]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetClientBalance](@Client_ID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @TotalPayments DECIMAL(10,2), @TotalPenalties DECIMAL(10,2), @Balance DECIMAL(10,2);

    SELECT @TotalPayments = ISNULL(SUM(Amount), 0)
    FROM Payments
    WHERE Client_ID = @Client_ID;

    SELECT @TotalPenalties = ISNULL(SUM(Penalty_Fee), 0)
    FROM Loans
    WHERE Client_ID = @Client_ID;

    SET @Balance = @TotalPayments - @TotalPenalties;

    RETURN @Balance;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetTotalLoansByClient]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTotalLoansByClient](@Client_ID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalLoans INT;

    -- Numëron sa herë klienti ka bërë huazime
    SELECT @TotalLoans = COUNT(*)
    FROM Loans
    WHERE Client_ID = @Client_ID;

    RETURN ISNULL(@TotalLoans, 0);
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetTotalMaterials]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTotalMaterials]()
RETURNS INT
AS
BEGIN
    DECLARE @TotalMaterials INT;

    SELECT @TotalMaterials = COUNT(*)
    FROM Bibliographic_Materials;

    RETURN ISNULL(@TotalMaterials, 0);
END;
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Client_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Last_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Date_of_Birth] [date] NOT NULL,
	[Email] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Phone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Address] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Membership_Active] [bit] NOT NULL,
	[Date_Registered] [date] NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Client_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[Loan_ID] [int] IDENTITY(1,1) NOT NULL,
	[Client_ID] [int] NOT NULL,
	[Material_ID] [int] NOT NULL,
	[Loan_Date] [date] NOT NULL,
	[Return_Date] [date] NOT NULL,
	[Actual_Return_Date] [date] NOT NULL,
	[Penalty_Fee] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Loans] PRIMARY KEY CLUSTERED 
(
	[Loan_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vSelectOverdueLoans]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vSelectOverdueLoans] AS
SELECT 
    L.Client_ID,
    C.First_Name,
    C.Last_Name,
    L.Material_ID,
    L.Loan_ID,
    L.Loan_Date,
    L.Return_Date,
    L.Actual_Return_Date,
    DATEDIFF(DAY, L.Return_Date, L.Actual_Return_Date) AS Days_Overdue, -- Shtohet për të treguar sa ditë është vonuar
    L.Penalty_Fee
FROM Loans L
JOIN Clients C ON L.Client_ID = C.Client_ID
WHERE L.Actual_Return_Date > L.Return_Date;
GO
/****** Object:  View [dbo].[vSelectActiveClients]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vSelectActiveClients] AS
SELECT 
    Client_ID,
    First_Name,
    Last_Name,
    Email,
    Address,
    Membership_Active,
    YEAR(Date_Registered) AS Registration_Year
FROM Clients
WHERE Membership_Active = 1;
GO
/****** Object:  Table [dbo].[Bibliographic_Materials]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bibliographic_Materials](
	[Material_ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Author] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Co_Authors] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Publisher] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Publication_Date] [date] NOT NULL,
	[ISBN] [int] NOT NULL,
	[DOI] [int] NOT NULL,
	[Material_Type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Abstract] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Available_Copies] [int] NOT NULL,
	[Date_Added] [date] NOT NULL,
 CONSTRAINT [PK_Bibliographic_Materials] PRIMARY KEY CLUSTERED 
(
	[Material_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vSelectMaterialCountByType]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vSelectMaterialCountByType] AS
SELECT 
    Material_Type,
    COUNT(Material_ID) AS Total_Materials
FROM Bibliographic_Materials
GROUP BY Material_Type;
GO
/****** Object:  View [dbo].[vSelectActiveLoans]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vSelectActiveLoans] AS
SELECT 
    L.Loan_ID,
    C.Client_ID,
    C.First_Name,
    C.Last_Name,
    L.Material_ID,
    L.Loan_Date,
    L.Return_Date,
    L.Actual_Return_Date
FROM Loans L
JOIN Clients C ON L.Client_ID = C.Client_ID
WHERE L.Actual_Return_Date IS NULL;
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Payment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Client_ID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Payment_Date] [date] NOT NULL,
	[Payment_Type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vSelectOverdue_Payments]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vSelectOverdue_Payments] AS
SELECT 
    C.Client_ID,
    C.First_Name,
    C.Last_Name,
    L.Loan_ID,
    L.Material_ID,
    L.Return_Date,
    L.Actual_Return_Date,
    L.Penalty_Fee,
    P.Amount AS Payment_Amount,
    P.Payment_Date
FROM Loans L
JOIN Clients C ON L.Client_ID = C.Client_ID
LEFT JOIN Payments P ON C.Client_ID = P.Client_ID
WHERE L.Actual_Return_Date > L.Return_Date OR L.Actual_Return_Date IS NULL;
GO
/****** Object:  View [dbo].[vSelectClientsPayment]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vSelectClientsPayment] AS
SELECT 
    C.Client_ID,
    C.First_Name,
    C.Last_Name,
    SUM(P.Amount) AS Total_Payments,
    COUNT(P.Payment_ID) AS Total_Transactions,
    (
        SELECT STRING_AGG(P2.Payment_Type, ', ') 
        FROM (SELECT DISTINCT P.Payment_Type, P.Client_ID FROM Payments P) P2
        WHERE P2.Client_ID = C.Client_ID
    ) AS Payment_Types
FROM Payments P
JOIN Clients C ON P.Client_ID = C.Client_ID
GROUP BY C.Client_ID, C.First_Name, C.Last_Name;
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Role] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bibliographic_Materials] ON 

INSERT [dbo].[Bibliographic_Materials] ([Material_ID], [Title], [Author], [Co_Authors], [Publisher], [Publication_Date], [ISBN], [DOI], [Material_Type], [Abstract], [Available_Copies], [Date_Added]) VALUES (5, N'Database Management Systems', N'Raghu Ramakrishnan', NULL, N'McGraw-Hill', CAST(N'2014-01-01' AS Date), 978, 123, N'Libër', N'A comprehensive guide on database systems.', 3, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[Bibliographic_Materials] ([Material_ID], [Title], [Author], [Co_Authors], [Publisher], [Publication_Date], [ISBN], [DOI], [Material_Type], [Abstract], [Available_Copies], [Date_Added]) VALUES (6, N'Introduction to Algorithms', N'Thomas H. Cormen', N'Charles E. Leiserson', N'MIT Press', CAST(N'2009-07-31' AS Date), 974, 124, N'Libër', N'A detailed book on algorithm design and analysis.', 0, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[Bibliographic_Materials] ([Material_ID], [Title], [Author], [Co_Authors], [Publisher], [Publication_Date], [ISBN], [DOI], [Material_Type], [Abstract], [Available_Copies], [Date_Added]) VALUES (7, N'Artificial Intelligence: A Modern Approach', N'Stuart Russell', N'Peter Norvig', N'Pearson', CAST(N'2020-04-28' AS Date), 993, 125, N'Libër', N'A fundamental book on AI concepts.', 5, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[Bibliographic_Materials] ([Material_ID], [Title], [Author], [Co_Authors], [Publisher], [Publication_Date], [ISBN], [DOI], [Material_Type], [Abstract], [Available_Copies], [Date_Added]) VALUES (8, N'Deep Learning', N'Ian Goodfellow', N'Yoshua Bengio', N'MIT Press', CAST(N'2016-11-18' AS Date), 613, 126, N'Libër', N'A foundational text on deep learning.', 2, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[Bibliographic_Materials] ([Material_ID], [Title], [Author], [Co_Authors], [Publisher], [Publication_Date], [ISBN], [DOI], [Material_Type], [Abstract], [Available_Copies], [Date_Added]) VALUES (9, N'The Art of Computer Programming', N'Donald Knuth', NULL, N'Addison-Wesley', CAST(N'1997-01-10' AS Date), 831, 127, N'Libër', N'A classic series on algorithms and programming techniques.', -1, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[Bibliographic_Materials] ([Material_ID], [Title], [Author], [Co_Authors], [Publisher], [Publication_Date], [ISBN], [DOI], [Material_Type], [Abstract], [Available_Copies], [Date_Added]) VALUES (10, N'Quantum Computing for the Very Curious', N'Andy Matuschak', NULL, N'Self-Published', CAST(N'2022-03-15' AS Date), 321, 128, N'Kapitull libri', N'An introduction to quantum computing in an interactive format.', -1, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[Bibliographic_Materials] ([Material_ID], [Title], [Author], [Co_Authors], [Publisher], [Publication_Date], [ISBN], [DOI], [Material_Type], [Abstract], [Available_Copies], [Date_Added]) VALUES (11, N'Efficient Data Structures', N'Robert Tarjan', N'John Hopcroft', N'ACM Transactions', CAST(N'1984-06-01' AS Date), 455, 129, N'Artikull', N'A research paper on efficient algorithms and data structures.', 0, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[Bibliographic_Materials] ([Material_ID], [Title], [Author], [Co_Authors], [Publisher], [Publication_Date], [ISBN], [DOI], [Material_Type], [Abstract], [Available_Copies], [Date_Added]) VALUES (12, N'Neural Networks for Pattern Recognition', N'Christopher M. Bishop', NULL, N'Oxford University Press', CAST(N'1995-08-22' AS Date), 646, 130, N'Kapitull libri', N'An introduction to the mathematical foundations of neural networks.', 1, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[Bibliographic_Materials] ([Material_ID], [Title], [Author], [Co_Authors], [Publisher], [Publication_Date], [ISBN], [DOI], [Material_Type], [Abstract], [Available_Copies], [Date_Added]) VALUES (13, N'Advancements in AI Ethics', N'Kate Crawford', N'Timnit Gebru', N'Nature AI', CAST(N'2021-12-10' AS Date), 899, 131, N'Artikull', N'A critical discussion on the ethical implications of AI systems.', 0, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[Bibliographic_Materials] ([Material_ID], [Title], [Author], [Co_Authors], [Publisher], [Publication_Date], [ISBN], [DOI], [Material_Type], [Abstract], [Available_Copies], [Date_Added]) VALUES (14, N'Blockchain and Its Applications', N'Vitalik Buterin', NULL, N'IEEE Journals', CAST(N'2020-05-30' AS Date), 900, 132, N'Artikull', N'A research article on the fundamentals and applications of blockchain.', 1, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[Bibliographic_Materials] ([Material_ID], [Title], [Author], [Co_Authors], [Publisher], [Publication_Date], [ISBN], [DOI], [Material_Type], [Abstract], [Available_Copies], [Date_Added]) VALUES (15, N'lulet e veres', N'naim frasheri', N'sami frasheri', N'dukagjini', CAST(N'2025-01-28' AS Date), 12, 12, N'Libër', N'lulet e veres eshte lektyr me poezi', 55, CAST(N'2025-01-28' AS Date))
SET IDENTITY_INSERT [dbo].[Bibliographic_Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (11, N'Arben', N'Hoxha', CAST(N'1990-05-12' AS Date), N'arben.hoxha@gmail.com', N'+38344123456', N'Rruga B, Prishtinë, Kosovë', 0, CAST(N'2024-10-10' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (12, N'Elira', N'Berisha', CAST(N'1995-11-23' AS Date), N'elira.berisha@gmail.com', N'+38349123456', N'Rruga e Dardanëve, Ferizaj, Kosovë', 1, CAST(N'2024-05-05' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (13, N'Besart', N'Krasniqi', CAST(N'1988-07-19' AS Date), N'besart.krasniqi@hotmail.com', N'+38345123456', N'Rruga 28 Nëntori, Gjakovë, Kosovë', 1, CAST(N'2022-05-05' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (14, N'Leart', N'Shala', CAST(N'2000-02-29' AS Date), N'leart.shala@gmail.com', N'+38346123456', N'Rruga Ilir Konushevci, Mitrovicë, Kosovë', 1, CAST(N'2023-09-01' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (15, N'Dafina', N'Selmani', CAST(N'1993-09-14' AS Date), N'dafina.selmani@gmail.com', N'+38347123456', N'Rruga Luan Haradinaj, Prizren, Kosovë', 1, CAST(N'2023-09-01' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (16, N'Ardian', N'Gashi', CAST(N'1985-12-02' AS Date), N'ardian.gashi@outlook.com', N'+38348123456', N'Rruga Adem Jashari, Pejë, Kosovë', 1, CAST(N'2023-07-01' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (17, N'Lindita', N'Mehmeti', CAST(N'1997-03-05' AS Date), N'lindita.mehmeti@gmail.com', N'+38349124567', N'Rruga Xhemail Mustafa, Gjilan, Kosovë', 1, CAST(N'2023-08-01' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (18, N'Alban', N'Dervishi', CAST(N'1991-08-17' AS Date), N'alban.dervishi@gmail.com', N'+38349876543', N'Rruga Marin Barleti, Vushtrri, Kosovë', 1, CAST(N'2024-08-01' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (19, N'Blerina', N'Thaqi', CAST(N'1982-06-30' AS Date), N'blerina.thaqi@yahoo.com', N'+38349234567', N'Rruga Fehmi Agani, Klinë, Kosovë', 1, CAST(N'2024-10-05' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (20, N'Valon', N'Pllana', CAST(N'1999-01-21' AS Date), N'valon.pllana@gmail.com', N'+38349321234', N'Rruga Isa Boletini, Skënderaj, Kosovë', 1, CAST(N'2022-10-05' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (21, N'Florian', N'Shabani', CAST(N'1992-08-14' AS Date), N'florian.shabani@gmail.com', N'+38349123456', N'Rruga Lidhja e Prizrenit, Prishtinë, Kosovë', 1, CAST(N'2023-10-05' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (22, N'Liridona', N'Hajdari', CAST(N'1987-04-23' AS Date), N'liridona.hajdari@gmail.com', N'+38344876543', N'Rruga Agim Ramadani, Pejë, Kosovë', 0, CAST(N'2022-07-28' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (23, N'Ardian', N'Berisha', CAST(N'1995-11-10' AS Date), N'ardian.berisha@hotmail.com', N'+38349112233', N'Rruga Dëshmorët, Gjakovë, Kosovë', 0, CAST(N'2023-05-14' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (24, N'Vjollca', N'Rexhepi', CAST(N'1990-01-19' AS Date), N'vjollca.rexhepi@gmail.com', N'+38344789632', N'Rruga Edit Durham, Mitrovicë, Kosovë', 1, CAST(N'2024-04-25' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (25, N'Genc', N'Demiri', CAST(N'1985-06-30' AS Date), N'genc.demiri@outlook.com', N'+38349234567', N'Rruga Skënderbeu, Gjilan, Kosovë', 1, CAST(N'2023-08-19' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (26, N'Egzon', N'Mustafa', CAST(N'1998-12-25' AS Date), N'egzon.mustafa@yahoo.com', N'+38349543210', N'Rruga Ali Hadri, Prishtinë, Kosovë', 1, CAST(N'2022-02-17' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (27, N'Arlinda', N'Gashi', CAST(N'1993-09-12' AS Date), N'arlinda.gashi@gmail.com', N'+38349156789', N'Rruga Qemal Stafa, Pejë, Kosovë', 1, CAST(N'2025-01-30' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (28, N'Blendi', N'Krasniqi', CAST(N'1989-07-07' AS Date), N'blendi.krasniqi@gmail.com', N'+38349123478', N'Rruga UÇK, Vushtrri, Kosovë', 1, CAST(N'2025-01-30' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (29, N'Doruntina', N'Kelmendi', CAST(N'1994-05-02' AS Date), N'doruntina.kelmendi@gmail.com', N'+38344876543', N'Rruga Isa Kastrati, Prizren, Kosovë', 1, CAST(N'2025-01-30' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (30, N'Besnik', N'Thaçi', CAST(N'1996-10-21' AS Date), N'besnik.thaci@gmail.com', N'+38349876521', N'Rruga Ibrahim Rugova, Ferizaj, Kosovë', 1, CAST(N'2025-01-30' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (31, N'Luan', N'Dervishi', CAST(N'1995-06-15' AS Date), N'luan.dervishi@gmail.com', N'+38349123456', N'Rruga Ilir Konushevci, Mitrovicë, Kosovë', 1, CAST(N'2025-01-30' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (1021, N'Sara', N'Hajrizi', CAST(N'2003-10-28' AS Date), N'sara.hajrizi@umib.net', N'049393296', N'Jeton Terrstena, Vushtrri', 1, CAST(N'2025-01-30' AS Date))
INSERT [dbo].[Clients] ([Client_ID], [First_Name], [Last_Name], [Date_of_Birth], [Email], [Phone], [Address], [Membership_Active], [Date_Registered]) VALUES (1022, N'Leonita', N'Kajtazi', CAST(N'2025-01-28' AS Date), N'leonita.kajtazi@umib.net', N'049896356', N'Kurtan Kajtazi, Oshlan', 1, CAST(N'2025-01-30' AS Date))
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Loans] ON 

INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (2, 11, 5, CAST(N'2025-01-05' AS Date), CAST(N'2025-01-15' AS Date), CAST(N'2025-01-14' AS Date), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (3, 12, 6, CAST(N'2025-01-07' AS Date), CAST(N'2025-01-17' AS Date), CAST(N'2025-01-23' AS Date), CAST(9.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (4, 13, 7, CAST(N'2025-01-10' AS Date), CAST(N'2025-01-20' AS Date), CAST(N'2025-01-22' AS Date), CAST(2.50 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (5, 14, 8, CAST(N'2025-01-12' AS Date), CAST(N'2025-01-22' AS Date), CAST(N'2025-01-24' AS Date), CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (6, 15, 9, CAST(N'2025-01-15' AS Date), CAST(N'2025-01-25' AS Date), CAST(N'2025-01-22' AS Date), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (7, 16, 10, CAST(N'2025-01-18' AS Date), CAST(N'2025-01-28' AS Date), CAST(N'2025-02-01' AS Date), CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (8, 17, 11, CAST(N'2025-01-20' AS Date), CAST(N'2025-01-30' AS Date), CAST(N'2025-01-03' AS Date), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (9, 18, 12, CAST(N'2025-01-22' AS Date), CAST(N'2025-02-01' AS Date), CAST(N'2025-02-03' AS Date), CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (10, 19, 13, CAST(N'2025-01-25' AS Date), CAST(N'2025-02-04' AS Date), CAST(N'2025-02-06' AS Date), CAST(3.50 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (11, 20, 14, CAST(N'2025-01-28' AS Date), CAST(N'2025-02-07' AS Date), CAST(N'2025-01-05' AS Date), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (12, 21, 5, CAST(N'2025-01-10' AS Date), CAST(N'2025-01-20' AS Date), CAST(N'2025-01-25' AS Date), CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (13, 22, 6, CAST(N'2025-01-12' AS Date), CAST(N'2025-01-22' AS Date), CAST(N'2025-01-28' AS Date), CAST(6.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (14, 23, 7, CAST(N'2025-01-15' AS Date), CAST(N'2025-01-25' AS Date), CAST(N'2025-02-01' AS Date), CAST(7.50 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (15, 24, 8, CAST(N'2025-01-17' AS Date), CAST(N'2025-01-27' AS Date), CAST(N'2025-02-03' AS Date), CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (16, 25, 9, CAST(N'2025-01-20' AS Date), CAST(N'2025-01-30' AS Date), CAST(N'2025-02-02' AS Date), CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (17, 26, 10, CAST(N'2025-01-22' AS Date), CAST(N'2025-02-01' AS Date), CAST(N'2025-02-05' AS Date), CAST(5.50 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (18, 27, 11, CAST(N'2025-01-25' AS Date), CAST(N'2025-02-04' AS Date), CAST(N'2025-02-08' AS Date), CAST(6.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (19, 28, 12, CAST(N'2025-01-28' AS Date), CAST(N'2025-02-07' AS Date), CAST(N'2025-02-10' AS Date), CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (20, 29, 13, CAST(N'2025-02-01' AS Date), CAST(N'2025-02-11' AS Date), CAST(N'2025-02-14' AS Date), CAST(4.50 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (21, 30, 14, CAST(N'2025-02-05' AS Date), CAST(N'2025-02-15' AS Date), CAST(N'2025-02-18' AS Date), CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (22, 11, 5, CAST(N'2024-11-15' AS Date), CAST(N'2024-12-15' AS Date), CAST(N'2025-01-10' AS Date), CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (23, 12, 6, CAST(N'2024-11-20' AS Date), CAST(N'2024-12-20' AS Date), CAST(N'2025-01-12' AS Date), CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (24, 13, 7, CAST(N'2024-11-25' AS Date), CAST(N'2024-12-25' AS Date), CAST(N'2025-01-15' AS Date), CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (25, 14, 8, CAST(N'2024-11-10' AS Date), CAST(N'2024-12-10' AS Date), CAST(N'2025-01-08' AS Date), CAST(12.50 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (26, 15, 9, CAST(N'2024-11-18' AS Date), CAST(N'2024-12-18' AS Date), CAST(N'2025-01-14' AS Date), CAST(14.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (27, 16, 10, CAST(N'2024-11-22' AS Date), CAST(N'2024-12-22' AS Date), CAST(N'2025-01-18' AS Date), CAST(9.50 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (28, 17, 11, CAST(N'2024-11-05' AS Date), CAST(N'2024-12-05' AS Date), CAST(N'2025-01-07' AS Date), CAST(11.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (29, 18, 12, CAST(N'2024-11-12' AS Date), CAST(N'2024-12-12' AS Date), CAST(N'2025-01-09' AS Date), CAST(7.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (30, 19, 13, CAST(N'2024-11-08' AS Date), CAST(N'2024-12-08' AS Date), CAST(N'2025-01-05' AS Date), CAST(6.50 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (31, 20, 14, CAST(N'2024-11-30' AS Date), CAST(N'2024-12-30' AS Date), CAST(N'2025-01-20' AS Date), CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (1012, 18, 9, CAST(N'2024-12-04' AS Date), CAST(N'2024-12-15' AS Date), CAST(N'2024-12-19' AS Date), CAST(9.00 AS Decimal(10, 2)))
INSERT [dbo].[Loans] ([Loan_ID], [Client_ID], [Material_ID], [Loan_Date], [Return_Date], [Actual_Return_Date], [Penalty_Fee]) VALUES (1013, 12, 6, CAST(N'2025-01-09' AS Date), CAST(N'2025-01-14' AS Date), CAST(N'2025-01-13' AS Date), CAST(0.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Loans] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (1, 11, CAST(15.00 AS Decimal(10, 2)), CAST(N'2025-01-05' AS Date), N'Pagesë mujore')
INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (2, 12, CAST(20.00 AS Decimal(10, 2)), CAST(N'2025-01-07' AS Date), N'Dënim për vonesë')
INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (3, 13, CAST(15.00 AS Decimal(10, 2)), CAST(N'2025-01-10' AS Date), N'Pagesë mujore')
INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (4, 14, CAST(25.50 AS Decimal(10, 2)), CAST(N'2025-01-12' AS Date), N'Pagesë vjetore')
INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (5, 15, CAST(30.00 AS Decimal(10, 2)), CAST(N'2025-01-15' AS Date), N'Dënim për vonesë')
INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (6, 16, CAST(10.00 AS Decimal(10, 2)), CAST(N'2025-01-18' AS Date), N'Pagesë mujore')
INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (7, 17, CAST(15.00 AS Decimal(10, 2)), CAST(N'2025-01-20' AS Date), N'Pagesë mujore')
INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (8, 18, CAST(18.00 AS Decimal(10, 2)), CAST(N'2025-01-22' AS Date), N'Pagesë mujore')
INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (9, 19, CAST(22.00 AS Decimal(10, 2)), CAST(N'2025-01-25' AS Date), N'Dënim për vonesë')
INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (10, 20, CAST(50.00 AS Decimal(10, 2)), CAST(N'2025-01-28' AS Date), N'Dënim për vonesë')
INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (11, 16, CAST(15.00 AS Decimal(10, 2)), CAST(N'2025-01-07' AS Date), N'Pagesë vjetore')
INSERT [dbo].[Payments] ([Payment_ID], [Client_ID], [Amount], [Payment_Date], [Payment_Type]) VALUES (12, 12, CAST(50.00 AS Decimal(10, 2)), CAST(N'2025-01-18' AS Date), N'Dënim për vonesë')
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [Username], [Password], [Role]) VALUES (11, N'sarahajrizi', N'sara1234', N'administrator')
INSERT [dbo].[User] ([User_ID], [Username], [Password], [Role]) VALUES (12, N'leonitakajtazi', N'leonita1234', N'administrator')
INSERT [dbo].[User] ([User_ID], [Username], [Password], [Role]) VALUES (13, N'agnesajashari', N'agnesa1234', N'biblotekar')
INSERT [dbo].[User] ([User_ID], [Username], [Password], [Role]) VALUES (14, N'fatonshala', N'fatonshala', N'biblotekar')
INSERT [dbo].[User] ([User_ID], [Username], [Password], [Role]) VALUES (1011, N'agnesabaliu', N'agnesa12', N'Bibliotekar')
INSERT [dbo].[User] ([User_ID], [Username], [Password], [Role]) VALUES (1012, N'erzapeci', N'erza12', N'Bibliotekar')
INSERT [dbo].[User] ([User_ID], [Username], [Password], [Role]) VALUES (1013, N'erza', N'erza', N'Administrator')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Loans_Bibliographic_Materials] FOREIGN KEY([Material_ID])
REFERENCES [dbo].[Bibliographic_Materials] ([Material_ID])
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Loans_Bibliographic_Materials]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Clients] FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Clients] ([Client_ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Clients]
GO
/****** Object:  StoredProcedure [dbo].[CalculateLateFee]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateLateFee]
    @Loan_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DaysOverdue INT;
    DECLARE @LateFeePerDay DECIMAL(10,2) = 1.50; 

    SELECT @DaysOverdue = DATEDIFF(DAY, Return_Date, Actual_Return_Date)
    FROM Loans
    WHERE Loan_ID = @Loan_ID AND Actual_Return_Date > Return_Date;

    IF @DaysOverdue IS NULL OR @DaysOverdue <= 0
    BEGIN
        PRINT 'Nuk ka vonesë për këtë huazim.';
        RETURN;
    END

    UPDATE Loans
    SET Penalty_Fee = @DaysOverdue * @LateFeePerDay
    WHERE Loan_ID = @Loan_ID;

    PRINT 'Pagesa për vonesën u përditësua me sukses!';
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteClient]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteClient]
    @Client_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Loans WHERE Client_ID = @Client_ID AND Actual_Return_Date IS NULL)
    BEGIN
        PRINT 'Klienti nuk mund të fshihet sepse ka huazime aktive!';
        RETURN;
    END

    DELETE FROM Clients WHERE Client_ID = @Client_ID;

    PRINT 'Klienti u fshi me sukses!';
END;
GO
/****** Object:  StoredProcedure [dbo].[GetMaterialByISBN]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMaterialByISBN]
    @ISBN NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Material_ID, Title, Author, Co_Authors, Publisher, 
           Publication_Date, ISBN, DOI, Material_Type, Abstract, 
           Available_Copies, Date_Added
    FROM Bibliographic_Material
    WHERE ISBN = @ISBN;

    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'Nuk u gjet asnjë material me këtë ISBN.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[RegisterLoan]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegisterLoan]
    @Client_ID INT,
    @Material_ID INT,
    @Loan_Duration INT = 14 
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @AvailableCopies INT;

    SELECT @AvailableCopies = Available_Copies
    FROM Bibliographic_Material
    WHERE Material_ID = @Material_ID;

    IF @AvailableCopies IS NULL OR @AvailableCopies <= 0
    BEGIN
        PRINT 'Nuk ka kopje të disponueshme për këtë material!';
        RETURN;
    END

    DECLARE @ReturnDate DATE = DATEADD(DAY, @Loan_Duration, GETDATE());

    INSERT INTO Loans (Client_ID, Material_ID, Loan_Date, Return_Date)
    VALUES (@Client_ID, @Material_ID, GETDATE(), @ReturnDate);

    UPDATE Bibliographic_Material
    SET Available_Copies = Available_Copies - 1
    WHERE Material_ID = @Material_ID;

    PRINT 'Huazimi u regjistrua me sukses!';
END;
GO
/****** Object:  StoredProcedure [dbo].[RegisterNewClient]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegisterNewClient]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @DateOfBirth DATE,
    @Email NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Address NVARCHAR(255),
    @MembershipActive BIT = 1 
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Clients WHERE Email = @Email)
    BEGIN
        PRINT 'Ky email ekziston tashmë!';
        RETURN; -- Nuk e regjistrojmë klientin nëse emaili është i përdorur
    END

    INSERT INTO Clients (First_Name, Last_Name, Date_of_Birth, Email, Phone, Address, Membership_Active, Date_Registered)
    VALUES (@FirstName, @LastName, @DateOfBirth, @Email, @Phone, @Address, @MembershipActive, GETDATE());

    PRINT 'Klienti u regjistrua me sukses!';
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateReturnDate]    Script Date: 1/31/2025 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReturnDate]
    @Loan_ID INT,
    @New_Return_Date DATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Loans
    SET Return_Date = @New_Return_Date
    WHERE Loan_ID = @Loan_ID;

    PRINT 'Data e kthimit u përditësua me sukses!';
END;
GO
USE [master]
GO
ALTER DATABASE [LibraryManagement] SET  READ_WRITE 
GO
