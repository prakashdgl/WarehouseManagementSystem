USE [master]
GO
/****** Object:  Database [DensDB]    Script Date: 08/12/2013 1:47:59 PM ******/
CREATE DATABASE [DensDB]
GO
ALTER DATABASE [DensDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DensDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DensDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DensDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DensDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DensDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DensDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DensDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DensDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DensDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DensDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DensDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DensDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DensDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DensDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DensDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DensDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DensDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DensDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DensDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DensDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DensDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DensDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DensDB] SET RECOVERY FULL 
GO
ALTER DATABASE [DensDB] SET  MULTI_USER 
GO
ALTER DATABASE [DensDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DensDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DensDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DensDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DensDB', N'ON'
GO
USE [DensDB]
GO
/****** Object:  Table [dbo].[tblBin]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBin](
	[BinId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblBin] PRIMARY KEY CLUSTERED 
(
	[BinId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [varchar](50) NOT NULL,
	[Lastname] [varchar](50) NOT NULL,
	[Title] [varchar](50) NULL,
	[Address] [varchar](200) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[PostalCode] [varchar](6) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Fax] [varchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](50) NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[SINNo] [varchar](20) NOT NULL,
	[PayPerHour] [float] NOT NULL,
	[RollId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNewsLetter]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNewsLetter](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[NewsDate] [date] NOT NULL,
	[Message] [text] NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblNewsLetter] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ProductDescription] [text] NULL,
	[Deleted] [bit] NOT NULL,
	[BinId] [int] NOT NULL,
	[StandardCost] [money] NOT NULL,
	[SafetyStockLevel] [int] NOT NULL,
	[ReorderPoint] [int] NOT NULL,
	[ImagePath] [text] NULL,
	[Quantity] [int] NOT NULL,
	[SellingCost] [money] NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProductVendorLink]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductVendorLink](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_tblProductVendorLink] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPurchaseOrder]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPurchaseOrder](
	[POId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[TotalValue] [decimal](18, 2) NOT NULL,
	[ExpectedDeliveryDate] [date] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblPurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[POId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPurchaseOrderDetails]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPurchaseOrderDetails](
	[PODetailId] [int] IDENTITY(1,1) NOT NULL,
	[POId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_tblPurchaseOrderDetails] PRIMARY KEY CLUSTERED 
(
	[PODetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](20) NOT NULL,
	[Stock] [bit] NOT NULL,
	[Sales] [bit] NOT NULL,
	[Purchase] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
	[Payroll] [bit] NOT NULL,
	[SalesTarget] [bit] NOT NULL,
	[Reports] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSalary]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSalary](
	[SalaryId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[TotalHours] [float] NOT NULL,
	[TotalSalary] [decimal](18, 2) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSalary] PRIMARY KEY CLUSTERED 
(
	[SalaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSaleInvoice]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSaleInvoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](50) NULL,
	[InvoiceDate] [date] NULL,
	[CustomerId] [int] NOT NULL,
	[TotalSale] [decimal](18, 2) NOT NULL,
	[Tax] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[NetSale] [decimal](18, 2) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSaleInvoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSaleInvoiceDetail]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSaleInvoiceDetail](
	[InvoiceDetailId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSaleInvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[InvoiceDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSalesTarget]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSalesTarget](
	[SalesTargetId] [int] IDENTITY(1,1) NOT NULL,
	[MonthName] [varchar](50) NOT NULL,
	[TargetAmount] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSalesTarget] PRIMARY KEY CLUSTERED 
(
	[SalesTargetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblVendor]    Script Date: 08/12/2013 1:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblVendor](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](100) NOT NULL,
	[VendorAddress] [varchar](150) NOT NULL,
	[VendorEmail] [varchar](50) NOT NULL,
	[VendorPhone] [varchar](50) NOT NULL,
	[VendorDescription] [varchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblVendor] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblBin] ON 

INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (1, N'A1 - A1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (2, N'A1 - A2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (3, N'A1 - A3', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (4, N'A1 - A4', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (5, N'A1 - A5', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (6, N'B1 - A1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (7, N'B1 - A2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (8, N'B3 - A1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (9, N'B3 - A2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (10, N'B3 - C1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (11, N'B3 - C2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (12, N'B3 - A4', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (13, N'B3 - A4', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (14, N'B3 - A4', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (18, N'C1 - A1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (19, N'C1 - A2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (20, N'C1 - A3', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (21, N'D4 - A1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (22, N'D4 - A2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (23, N'D4 - A4', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (24, N'F1 - A1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (25, N'F1 - A2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (26, N'F1 - A3', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (27, N'F1 - A4', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (28, N'F1 - A5', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (29, N'B8 - A1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (30, N'B8 - A2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (31, N'B8 - A3', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (32, N'B8 - A4', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (33, N'B8 - B1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (34, N'B8 - B2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (35, N'B2 - I3', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (36, N'B2 - I2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (37, N'B2 - I1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (38, N'B2 - H1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (39, N'B2 - H2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (40, N'B2 - H3', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (41, N'B4 - G1', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (42, N'B4 - G2', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (43, N'B4 - G3', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (44, N'B4 - G4', 0)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (56, N'', 1)
INSERT [dbo].[tblBin] ([BinId], [Name], [Deleted]) VALUES (57, N'', 1)
SET IDENTITY_INSERT [dbo].[tblBin] OFF
SET IDENTITY_INSERT [dbo].[tblCustomer] ON 

INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (1, N'Dr. Herbert', N'Veisman', N'', N'jhggh787', N'Toronto', N'Ontario', N'm1e2r3', N'maya21166@gmail.com', N'1234567890', N'87687686', 0)
INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (2, N'Toronto Dental Clinic', N'H', N'', N'dfasfd', N'Toronto', N'Ontario', N'm1e2r3', N'torontodental@gmail.com', N'8765674567', N'76', 0)
INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (3, N'Adelaide Dental', N'J', N'', N'20 Adelaide St E #100', N'Toronto', N'Ontario', N'm1e2r3', N'thornhill@gmail.com', N'8764562345', N'78', 0)
INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (4, N'Bay Bloor Dental', N'J', N'', N'151 Bloor St W #860', N'Toronto', N'Ontario', N'm1e2r3', N'thornhill@gmail.com', N'8764562345', N'78', 0)
INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (5, N'Studio B Dental', N'J', N'', N'700 University Ave Toronto', N'Toronto', N'Ontario', N'm1e2r3', N'thornhill@gmail.com', N'8764562345', N'78', 0)
INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (6, N'Sheppard Village Dental', N'J', N'', N'651 Sheppard Ave E', N'Scarborough', N'Ontario', N'm1e2r3', N'thornhill@gmail.com', N'8764562345', N'78', 0)
INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (7, N'Bal Dental Centre', N'J', N'', N'940 Eglinton av east', N'Scarborough', N'Ontario', N'm1e2r3', N'thornhill@gmail.com', N'8764562345', N'78', 0)
INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (8, N'ThornHill Family Dental', N'J', N'', N'700 University Ave Toronto', N'Toronto', N'Ontario', N'm1e2r3', N'thornhill@gmail.com', N'8764562345', N'78', 0)
INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (9, N'Sterling Dentistry', N'J', N'', N'98 Queen St W', N'Brampton', N'Ontario', N'm1e2r3', N'thornhill@gmail.com', N'8764562345', N'78', 0)
INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (10, N'Dr. Julia', N'Sagath', N'', N'18 Kensington Rd #40', N'Brampton', N'Ontario', N'm1e2r3', N'thornhill@gmail.com', N'8764562345', N'78', 0)
INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (11, N'Dr. Michael', N'Marijan', N'', N'229 Main St S', N'Brampton', N'Ontario', N'm1e2r3', N'thornhill@gmail.com', N'8764562345', N'78', 0)
INSERT [dbo].[tblCustomer] ([CustomerId], [Firstname], [Lastname], [Title], [Address], [City], [State], [PostalCode], [Email], [Phone], [Fax], [Deleted]) VALUES (12, N'Parkplace Dental Centre', N'J', N'', N'110 Queen E', N'Brampton', N'Ontario', N'm1e2r3', N'thornhill@gmail.com', N'8764562345', N'78', 0)
SET IDENTITY_INSERT [dbo].[tblCustomer] OFF
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([EmployeeId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [MobileNo], [Address], [SINNo], [PayPerHour], [RollId], [Deleted], [Password]) VALUES (1, N'Snehkumar', N'J', N'Mehta', N'sneh@gmail.com', N'', N'6474475640', N'#203, Ellington Avenue', N'123456789', 22, 1, 0, N'sneh')
INSERT [dbo].[tblEmployee] ([EmployeeId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [MobileNo], [Address], [SINNo], [PayPerHour], [RollId], [Deleted], [Password]) VALUES (2, N'Anil', N'H', N'Vasani', N'anil@gmail.com', N'', N'6474475645', N'4000, Lawrence Avenue', N'123456789', 15, 2, 0, N'anil')
INSERT [dbo].[tblEmployee] ([EmployeeId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [MobileNo], [Address], [SINNo], [PayPerHour], [RollId], [Deleted], [Password]) VALUES (3, N'Tanmaykumar', N'J', N'Desai', N'tanmay@gmail.com', N'', N'6475673456', N'801, Tuxedo Court', N'123456789', 13.5, 3, 0, N'tanmay')
INSERT [dbo].[tblEmployee] ([EmployeeId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [MobileNo], [Address], [SINNo], [PayPerHour], [RollId], [Deleted], [Password]) VALUES (4, N'Tirthkumar', N'K', N'Patel', N'tirth@gmail.com', N'', N'6544475050', N'101, Tuxedo Court', N'123456789', 17, 4, 0, N'tirth')
INSERT [dbo].[tblEmployee] ([EmployeeId], [FirstName], [MiddleName], [LastName], [Email], [PhoneNo], [MobileNo], [Address], [SINNo], [PayPerHour], [RollId], [Deleted], [Password]) VALUES (5, N'Shivam', N'G', N'Vyas', N'shivam@gmail.com', N'', N'7653352435', N'807, 555 Avenue, Markham Road', N'123456789', 18, 5, 0, N'shivam')
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
SET IDENTITY_INSERT [dbo].[tblNewsLetter] ON 

INSERT [dbo].[tblNewsLetter] ([NewsId], [NewsDate], [Message], [Deleted]) VALUES (1, CAST(0xD3370B00 AS Date), N'djkashdkashkfdja', 0)
SET IDENTITY_INSERT [dbo].[tblNewsLetter] OFF
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (1, N'Surgical Aspirator - White', N'hj', 0, 2, 5.9900, 10, 5, N'dasd', 98, 9.9900)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (2, N'Civicide 2.5 Gallon Bottle', N'dfsaf', 0, 2, 87.0000, 15, 10, N'dasd', 101, 112.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (3, N'Lidocain Red 2% 1:100:100000', N'', 0, 4, 36.0000, 30, 20, N'dasd', 90, 50.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (4, N'Astracaine 2%', N'', 0, 5, 80.0000, 35, 20, N'dasd', 47, 100.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (5, N'Look Sutures', N'', 0, 1, 12.0000, 15, 10, N'dasd', 111, 15.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (6, N'Septanest 3% Plain', N'', 0, 9, 50.0000, 20, 15, N'dasd', 0, 65.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (7, N'Citanest 4%', N'', 0, 11, 35.0000, 15, 10, N'dasd', 0, 40.9900)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (8, N'Disperalloy 1Spill Fast Set', N'', 0, 13, 107.0000, 150, 100, N'dasd', 0, 135.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (9, N'Permite', N'', 0, 18, 85.0000, 300, 200, N'dasd', 0, 101.9900)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (10, N'Cavit Grey', N'', 0, 25, 12.0000, 75, 50, N'dasd', 0, 15.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (11, N'Intro Package', N'', 0, 25, 55.0000, 30, 20, N'dasd', 0, 64.9500)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (12, N'Rely X Luting Plus', N'', 0, 27, 165.0000, 35, 20, N'dasd', 0, 199.9900)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (13, N'D2 Curved Tip Synringe', N'', 0, 21, 40.0000, 40, 30, N'dasd', 0, 49.9500)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (14, N'D2 Mixing Tips [Yellow]', N'', 0, 21, 20.0000, 50, 30, N'dasd', 0, 29.9900)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (15, N'Stabilok Pins [Green]', N'', 0, 33, 35.0000, 30, 25, N'dasd', 0, 42.9500)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (16, N'Kodak DF-42', N'', 0, 41, 40.0000, 75, 50, N'dasd', 0, 59.9500)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (17, N'Kodak DF-58', N'', 0, 44, 55.0000, 75, 50, N'dasd', 0, 65.9900)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (18, N'Kodak 9080', N'', 0, 37, 40.0000, 75, 50, N'dasd', 0, 45.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (19, N'D2 Bite Wind Tabs', N'', 0, 37, 42.0000, 35, 30, N'dasd', 0, 50.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (20, N'D2 Universal Film Mount', N'', 0, 1, 22.0000, 40, 30, N'dasd', 0, 28.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (21, N'Highlight Curing Light', N'', 0, 1, 300.0000, 15, 10, N'dasd', 0, 349.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (22, N'Lotus 302 PQ', N'', 0, 14, 150.0000, 15, 10, N'dasd', 0, 189.0000)
INSERT [dbo].[tblProduct] ([ProductId], [ProductName], [ProductDescription], [Deleted], [BinId], [StandardCost], [SafetyStockLevel], [ReorderPoint], [ImagePath], [Quantity], [SellingCost]) VALUES (23, N'D2 Nitrile Latex Power Free', N'', 0, 35, 10.0000, 400, 300, N'dasd', 0, 13.5000)
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
SET IDENTITY_INSERT [dbo].[tblProductVendorLink] ON 

INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (5, 9, 1)
INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (6, 9, 2)
INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (7, 9, 3)
INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (8, 9, 4)
INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (9, 9, 5)
INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (10, 3, 3)
INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (11, 3, 4)
INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (12, 3, 5)
INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (13, 3, 6)
INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (14, 3, 10)
INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (15, 3, 11)
INSERT [dbo].[tblProductVendorLink] ([Id], [VendorId], [ProductId]) VALUES (16, 3, 12)
SET IDENTITY_INSERT [dbo].[tblProductVendorLink] OFF
SET IDENTITY_INSERT [dbo].[tblPurchaseOrder] ON 

INSERT [dbo].[tblPurchaseOrder] ([POId], [VendorId], [OrderDate], [TotalValue], [ExpectedDeliveryDate], [Deleted]) VALUES (4, 9, CAST(0xE5370B00 AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(0x00000000 AS Date), 1)
INSERT [dbo].[tblPurchaseOrder] ([POId], [VendorId], [OrderDate], [TotalValue], [ExpectedDeliveryDate], [Deleted]) VALUES (5, 9, CAST(0xE5370B00 AS Date), CAST(2.00 AS Decimal(18, 2)), CAST(0x00000000 AS Date), 1)
INSERT [dbo].[tblPurchaseOrder] ([POId], [VendorId], [OrderDate], [TotalValue], [ExpectedDeliveryDate], [Deleted]) VALUES (6, 9, CAST(0xE5370B00 AS Date), CAST(2.00 AS Decimal(18, 2)), CAST(0x00000000 AS Date), 1)
INSERT [dbo].[tblPurchaseOrder] ([POId], [VendorId], [OrderDate], [TotalValue], [ExpectedDeliveryDate], [Deleted]) VALUES (7, 9, CAST(0xE6370B00 AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(0x00000000 AS Date), 1)
INSERT [dbo].[tblPurchaseOrder] ([POId], [VendorId], [OrderDate], [TotalValue], [ExpectedDeliveryDate], [Deleted]) VALUES (8, 9, CAST(0xE6370B00 AS Date), CAST(5200.00 AS Decimal(18, 2)), CAST(0x00000000 AS Date), 1)
INSERT [dbo].[tblPurchaseOrder] ([POId], [VendorId], [OrderDate], [TotalValue], [ExpectedDeliveryDate], [Deleted]) VALUES (9, 9, CAST(0xE6370B00 AS Date), CAST(3600.00 AS Decimal(18, 2)), CAST(0x00000000 AS Date), 1)
INSERT [dbo].[tblPurchaseOrder] ([POId], [VendorId], [OrderDate], [TotalValue], [ExpectedDeliveryDate], [Deleted]) VALUES (10, 9, CAST(0xE6370B00 AS Date), CAST(880.00 AS Decimal(18, 2)), CAST(0x00000000 AS Date), 1)
INSERT [dbo].[tblPurchaseOrder] ([POId], [VendorId], [OrderDate], [TotalValue], [ExpectedDeliveryDate], [Deleted]) VALUES (11, 9, CAST(0xE6370B00 AS Date), CAST(480.00 AS Decimal(18, 2)), CAST(0x00000000 AS Date), 1)
INSERT [dbo].[tblPurchaseOrder] ([POId], [VendorId], [OrderDate], [TotalValue], [ExpectedDeliveryDate], [Deleted]) VALUES (12, 3, CAST(0xE6370B00 AS Date), CAST(6120.00 AS Decimal(18, 2)), CAST(0x00000000 AS Date), 0)
INSERT [dbo].[tblPurchaseOrder] ([POId], [VendorId], [OrderDate], [TotalValue], [ExpectedDeliveryDate], [Deleted]) VALUES (13, 3, CAST(0xE6370B00 AS Date), CAST(980.00 AS Decimal(18, 2)), CAST(0x00000000 AS Date), 1)
INSERT [dbo].[tblPurchaseOrder] ([POId], [VendorId], [OrderDate], [TotalValue], [ExpectedDeliveryDate], [Deleted]) VALUES (14, 9, CAST(0xE7370B00 AS Date), CAST(-17.97 AS Decimal(18, 2)), CAST(0x00000000 AS Date), 0)
SET IDENTITY_INSERT [dbo].[tblPurchaseOrder] OFF
SET IDENTITY_INSERT [dbo].[tblPurchaseOrderDetails] ON 

INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (7, 5, 1, 0, 40)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (8, 5, 2, 0, 60)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (9, 6, 1, 0, 10)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (10, 6, 2, 0, 12)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (11, 7, 1, 0, 12)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (12, 7, 2, 0, 10)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (13, 6, 4, 0, 50)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (14, 6, 5, 0, 100)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (15, 6, 3, 0, 100)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (16, 9, 4, 0, 11)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (17, 4, 4, 0, 6)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (20, 13, 4, 0, 10)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (21, 13, 5, 0, 15)
INSERT [dbo].[tblPurchaseOrderDetails] ([PODetailId], [POId], [ProductId], [Deleted], [Quantity]) VALUES (22, 14, 1, 0, -3)
SET IDENTITY_INSERT [dbo].[tblPurchaseOrderDetails] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([RoleId], [RoleName], [Stock], [Sales], [Purchase], [Admin], [Payroll], [SalesTarget], [Reports], [Deleted]) VALUES (1, N'Admin', 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[tblRole] ([RoleId], [RoleName], [Stock], [Sales], [Purchase], [Admin], [Payroll], [SalesTarget], [Reports], [Deleted]) VALUES (2, N'Sales', 1, 1, 0, 0, 0, 1, 0, 0)
INSERT [dbo].[tblRole] ([RoleId], [RoleName], [Stock], [Sales], [Purchase], [Admin], [Payroll], [SalesTarget], [Reports], [Deleted]) VALUES (3, N'Purchase', 1, 0, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[tblRole] ([RoleId], [RoleName], [Stock], [Sales], [Purchase], [Admin], [Payroll], [SalesTarget], [Reports], [Deleted]) VALUES (4, N'Marketing', 1, 1, 1, 0, 0, 1, 1, 0)
INSERT [dbo].[tblRole] ([RoleId], [RoleName], [Stock], [Sales], [Purchase], [Admin], [Payroll], [SalesTarget], [Reports], [Deleted]) VALUES (5, N'Accountant', 0, 0, 0, 0, 1, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[tblRole] OFF
SET IDENTITY_INSERT [dbo].[tblSalary] ON 

INSERT [dbo].[tblSalary] ([SalaryId], [EmployeeId], [StartDate], [EndDate], [TotalHours], [TotalSalary], [Deleted]) VALUES (2, 2, CAST(0x0000A28A00000000 AS DateTime), CAST(0x0000A29A00000000 AS DateTime), 176, CAST(2640.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[tblSalary] OFF
SET IDENTITY_INSERT [dbo].[tblSaleInvoice] ON 

INSERT [dbo].[tblSaleInvoice] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId], [TotalSale], [Tax], [Discount], [NetSale], [Deleted]) VALUES (3, N'1', CAST(0xE5370B00 AS Date), 1, CAST(1939.74 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2191.91 AS Decimal(18, 2)), 1)
INSERT [dbo].[tblSaleInvoice] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId], [TotalSale], [Tax], [Discount], [NetSale], [Deleted]) VALUES (4, N'4', CAST(0xE5370B00 AS Date), 2, CAST(243.98 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(275.70 AS Decimal(18, 2)), 0)
INSERT [dbo].[tblSaleInvoice] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId], [TotalSale], [Tax], [Discount], [NetSale], [Deleted]) VALUES (5, N'5', CAST(0xE5370B00 AS Date), 3, CAST(99.90 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(112.89 AS Decimal(18, 2)), 0)
INSERT [dbo].[tblSaleInvoice] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId], [TotalSale], [Tax], [Discount], [NetSale], [Deleted]) VALUES (6, N'6', CAST(0xE6370B00 AS Date), 10, CAST(1000.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1130.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[tblSaleInvoice] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId], [TotalSale], [Tax], [Discount], [NetSale], [Deleted]) VALUES (7, N'7', CAST(0xE6370B00 AS Date), 4, CAST(2500.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2825.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[tblSaleInvoice] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId], [TotalSale], [Tax], [Discount], [NetSale], [Deleted]) VALUES (8, N'8', CAST(0xE6370B00 AS Date), 4, CAST(60.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(67.80 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[tblSaleInvoice] OFF
SET IDENTITY_INSERT [dbo].[tblSaleInvoiceDetail] ON 

INSERT [dbo].[tblSaleInvoiceDetail] ([InvoiceDetailId], [InvoiceId], [ProductId], [Quantity], [Deleted]) VALUES (8, 4, 1, 2, 0)
INSERT [dbo].[tblSaleInvoiceDetail] ([InvoiceDetailId], [InvoiceId], [ProductId], [Quantity], [Deleted]) VALUES (9, 4, 2, 2, 0)
INSERT [dbo].[tblSaleInvoiceDetail] ([InvoiceDetailId], [InvoiceId], [ProductId], [Quantity], [Deleted]) VALUES (10, 5, 1, 10, 0)
INSERT [dbo].[tblSaleInvoiceDetail] ([InvoiceDetailId], [InvoiceId], [ProductId], [Quantity], [Deleted]) VALUES (14, 7, 4, 25, 0)
INSERT [dbo].[tblSaleInvoiceDetail] ([InvoiceDetailId], [InvoiceId], [ProductId], [Quantity], [Deleted]) VALUES (15, 6, 3, 10, 0)
INSERT [dbo].[tblSaleInvoiceDetail] ([InvoiceDetailId], [InvoiceId], [ProductId], [Quantity], [Deleted]) VALUES (16, 6, 4, 5, 0)
INSERT [dbo].[tblSaleInvoiceDetail] ([InvoiceDetailId], [InvoiceId], [ProductId], [Quantity], [Deleted]) VALUES (19, 8, 5, 4, 0)
SET IDENTITY_INSERT [dbo].[tblSaleInvoiceDetail] OFF
SET IDENTITY_INSERT [dbo].[tblSalesTarget] ON 

INSERT [dbo].[tblSalesTarget] ([SalesTargetId], [MonthName], [TargetAmount], [Deleted]) VALUES (1, N'November 2013', 550000, 0)
INSERT [dbo].[tblSalesTarget] ([SalesTargetId], [MonthName], [TargetAmount], [Deleted]) VALUES (2, N'December 2013', 60000, 0)
SET IDENTITY_INSERT [dbo].[tblSalesTarget] OFF
SET IDENTITY_INSERT [dbo].[tblVendor] ON 

INSERT [dbo].[tblVendor] ([VendorId], [VendorName], [VendorAddress], [VendorEmail], [VendorPhone], [VendorDescription], [Deleted]) VALUES (1, N'Peterson Inc.', N'40, Tuxedo Court, Markham Road', N'peterson@gmail.com', N'6475657565', N'', 0)
INSERT [dbo].[tblVendor] ([VendorId], [VendorName], [VendorAddress], [VendorEmail], [VendorPhone], [VendorDescription], [Deleted]) VALUES (2, N'Regional Dental Inc.', N'55, River Front Road, Toronto', N'regional_dental@gmail.com', N'7024562749', N'', 0)
INSERT [dbo].[tblVendor] ([VendorId], [VendorName], [VendorAddress], [VendorEmail], [VendorPhone], [VendorDescription], [Deleted]) VALUES (3, N'Blackwood H Dr', N'147 Holland Ave', N'regional_dental@gmail.com', N'7024562749', N'', 0)
INSERT [dbo].[tblVendor] ([VendorId], [VendorName], [VendorAddress], [VendorEmail], [VendorPhone], [VendorDescription], [Deleted]) VALUES (4, N'Seller Daniel Dr', N'107-1400 St. Laurent Blvd', N'regional_dental@gmail.com', N'7024562749', N'', 0)
INSERT [dbo].[tblVendor] ([VendorId], [VendorName], [VendorAddress], [VendorEmail], [VendorPhone], [VendorDescription], [Deleted]) VALUES (5, N'Apple''s Elmvale Dental', N'1910 St. Laurent Blvd', N'regional_dental@gmail.com', N'7024562749', N'', 0)
INSERT [dbo].[tblVendor] ([VendorId], [VendorName], [VendorAddress], [VendorEmail], [VendorPhone], [VendorDescription], [Deleted]) VALUES (6, N'Dr Pettigrew Family Dentist Westboro', N'55, River Front Road, Toronto', N'regional_dental@gmail.com', N'7024562749', N'', 0)
INSERT [dbo].[tblVendor] ([VendorId], [VendorName], [VendorAddress], [VendorEmail], [VendorPhone], [VendorDescription], [Deleted]) VALUES (7, N'Downtown Ottawa Dentist Warehouse', N'381 Kent St', N'regional_dental@gmail.com', N'7024562749', N'', 0)
INSERT [dbo].[tblVendor] ([VendorId], [VendorName], [VendorAddress], [VendorEmail], [VendorPhone], [VendorDescription], [Deleted]) VALUES (8, N'Louis Ong, Warehouse', N'1160 Adelaide St N', N'regional_dental@gmail.com', N'7024562749', N'', 0)
INSERT [dbo].[tblVendor] ([VendorId], [VendorName], [VendorAddress], [VendorEmail], [VendorPhone], [VendorDescription], [Deleted]) VALUES (9, N'Bathrust Dental Depot', N'101 Bathrust, ON', N'regional_dental@gmail.com', N'7024562749', N'', 0)
INSERT [dbo].[tblVendor] ([VendorId], [VendorName], [VendorAddress], [VendorEmail], [VendorPhone], [VendorDescription], [Deleted]) VALUES (10, N'', N'', N'anil@gmail.com', N'1234567890', N'', 1)
SET IDENTITY_INSERT [dbo].[tblVendor] OFF
ALTER TABLE [dbo].[tblBin] ADD  CONSTRAINT [DF_tblBin_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblCustomer] ADD  CONSTRAINT [DF_tblCustomer_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblEmployee] ADD  CONSTRAINT [DF_tblEmployee_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblNewsLetter] ADD  CONSTRAINT [DF_tblNewsLetter_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblProduct] ADD  CONSTRAINT [DF_tblProduct_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblPurchaseOrder] ADD  CONSTRAINT [DF_tblPurchaseOrder_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblPurchaseOrderDetails] ADD  CONSTRAINT [DF_tblPurchaseOrderDetails_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Sales]  DEFAULT ((0)) FOR [Sales]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Purchase]  DEFAULT ((0)) FOR [Purchase]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Admin]  DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Payroll]  DEFAULT ((0)) FOR [Payroll]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_SalesTarget]  DEFAULT ((0)) FOR [SalesTarget]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Reports]  DEFAULT ((0)) FOR [Reports]
GO
ALTER TABLE [dbo].[tblRole] ADD  CONSTRAINT [DF_tblRole_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblSalary] ADD  CONSTRAINT [DF_tblSalary_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblSaleInvoice] ADD  CONSTRAINT [DF_tblSaleInvoice_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblSaleInvoiceDetail] ADD  CONSTRAINT [DF_tblSaleInvoiceDetail_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblSalesTarget] ADD  CONSTRAINT [DF_tblSalesTarget_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblVendor] ADD  CONSTRAINT [DF_tblVendor_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee_tblRole] FOREIGN KEY([RollId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblEmployee] CHECK CONSTRAINT [FK_tblEmployee_tblRole]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblBin] FOREIGN KEY([BinId])
REFERENCES [dbo].[tblBin] ([BinId])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblBin]
GO
ALTER TABLE [dbo].[tblProductVendorLink]  WITH CHECK ADD  CONSTRAINT [FK_tblProductVendorLink_tblProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProduct] ([ProductId])
GO
ALTER TABLE [dbo].[tblProductVendorLink] CHECK CONSTRAINT [FK_tblProductVendorLink_tblProduct]
GO
ALTER TABLE [dbo].[tblProductVendorLink]  WITH CHECK ADD  CONSTRAINT [FK_tblProductVendorLink_tblVendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[tblVendor] ([VendorId])
GO
ALTER TABLE [dbo].[tblProductVendorLink] CHECK CONSTRAINT [FK_tblProductVendorLink_tblVendor]
GO
ALTER TABLE [dbo].[tblPurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchaseOrder_tblVendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[tblVendor] ([VendorId])
GO
ALTER TABLE [dbo].[tblPurchaseOrder] CHECK CONSTRAINT [FK_tblPurchaseOrder_tblVendor]
GO
ALTER TABLE [dbo].[tblPurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchaseOrderDetails_tblProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProduct] ([ProductId])
GO
ALTER TABLE [dbo].[tblPurchaseOrderDetails] CHECK CONSTRAINT [FK_tblPurchaseOrderDetails_tblProduct]
GO
ALTER TABLE [dbo].[tblPurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchaseOrderDetails_tblPurchaseOrder] FOREIGN KEY([POId])
REFERENCES [dbo].[tblPurchaseOrder] ([POId])
GO
ALTER TABLE [dbo].[tblPurchaseOrderDetails] CHECK CONSTRAINT [FK_tblPurchaseOrderDetails_tblPurchaseOrder]
GO
ALTER TABLE [dbo].[tblSalary]  WITH CHECK ADD  CONSTRAINT [FK_tblSalary_tblEmployee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployee] ([EmployeeId])
GO
ALTER TABLE [dbo].[tblSalary] CHECK CONSTRAINT [FK_tblSalary_tblEmployee]
GO
ALTER TABLE [dbo].[tblSaleInvoice]  WITH CHECK ADD  CONSTRAINT [FK_tblSaleInvoice_tblCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tblCustomer] ([CustomerId])
GO
ALTER TABLE [dbo].[tblSaleInvoice] CHECK CONSTRAINT [FK_tblSaleInvoice_tblCustomer]
GO
ALTER TABLE [dbo].[tblSaleInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblSaleInvoiceDetail_tblProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProduct] ([ProductId])
GO
ALTER TABLE [dbo].[tblSaleInvoiceDetail] CHECK CONSTRAINT [FK_tblSaleInvoiceDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblSaleInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblSaleInvoiceDetail_tblSaleInvoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[tblSaleInvoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[tblSaleInvoiceDetail] CHECK CONSTRAINT [FK_tblSaleInvoiceDetail_tblSaleInvoice]
GO
USE [master]
GO
ALTER DATABASE [DensDB] SET  READ_WRITE 
GO
