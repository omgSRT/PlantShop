GO
ALTER DATABASE [PlantShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PlantShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PlantShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PlantShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PlantShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PlantShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PlantShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PlantShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PlantShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PlantShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PlantShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PlantShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PlantShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PlantShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PlantShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PlantShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PlantShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PlantShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PlantShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PlantShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PlantShop] SET  MULTI_USER 
GO
ALTER DATABASE [PlantShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PlantShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PlantShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PlantShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PlantShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PlantShop] SET QUERY_STORE = OFF
GO
USE [PlantShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 3/11/2023 8:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](12) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
	[token] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[accID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/11/2023 8:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/11/2023 8:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[FID] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/11/2023 8:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrdDate] [date] NULL,
	[shipdate] [date] NULL,
	[status] [int] NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 3/11/2023 8:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [varchar](30) NULL,
	[price] [int] NULL,
	[imgPath] [varchar](50) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
	[CateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (1, N'admin@gmail.com', N'123AbC', N'admin', N'123456', 1, 1, N'ABC123')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (2, N'tung@gmail.com', N'123456', N'Tung dep trai', N'123', 0, 0, NULL)
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (3, N'van@gmail.com', N'123456', N'Van xinh gai', N'123', 0, 0, NULL)
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (4, N'test@gmail.com', N'222222', N'chipheo345', N'12345', 1, 0, N'ABC123')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (1, N'orchid')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (2, N'roses')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (3, N'others')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (1, 1, 1, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (2, 1, 2, 2)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (3, 2, 3, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (4, 3, 6, 2)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (5, 3, 7, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (19, 20, 1, 2)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (20, 20, 2, 2)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (21, 21, 2, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (22, 22, 2, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (1, CAST(N'2021-01-11' AS Date), CAST(N'2021-10-11' AS Date), 2, 4)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (2, CAST(N'2022-07-20' AS Date), NULL, 1, 4)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (3, CAST(N'2021-10-01' AS Date), NULL, 1, 4)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (10, CAST(N'2022-07-19' AS Date), NULL, 1, 4)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (20, CAST(N'2022-06-17' AS Date), NULL, 1, 4)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (21, CAST(N'2022-07-17' AS Date), NULL, 3, 4)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (22, CAST(N'2022-07-18' AS Date), NULL, 1, 4)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Plants] ON 

INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (1, N'vanda', 100, N'images/img1.jpg', N'this is a vanda', 1, 1)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (2, N'white rose', 90, N'images/img2.jpg', N'this is a rose', 1, 2)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (3, N'lan ho diep', 70, N'images/img3.jpg', N'hoa lan', 1, 1)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (4, N'lan hai', 140, N'images/img4.jpg', N'hoa lan', 1, 1)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (5, N'cay hoa hong cam', 200, N'images/img5.jpg', N'hoa hong', 1, 2)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (6, N'monstera', 80, N'images/img6.jpg', N'cay la kieng', 1, 3)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (7, N'var monstera', 400, N'images/img7.jpg', N'cay la kieng', 1, 3)
SET IDENTITY_INSERT [dbo].[Plants] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__AB6E61648E3824E4]    Script Date: 3/11/2023 8:41:57 PM ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([FID])
REFERENCES [dbo].[Plants] ([PID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([role]=(1) OR [role]=(0)))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(2) OR [status]=(3)))
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [PlantShop] SET READ_WRITE 
GO
