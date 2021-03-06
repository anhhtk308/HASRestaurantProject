USE [PRN292_HASRestaurant]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 23/7/2021 11:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 23/7/2021 11:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 23/7/2021 11:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 23/7/2021 11:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[CreateMessageDate] [datetime] NULL,
	[ResponseMessage] [nvarchar](max) NULL,
	[ResponseMessageDate] [datetime] NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 23/7/2021 11:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CustomerName] [nvarchar](max) NULL,
	[TotalPrice] [float] NULL,
	[OrderDate] [datetime] NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 23/7/2021 11:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 23/7/2021 11:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[ShortDes] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 23/7/2021 11:43:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CustomerName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[NumOfGuests] [int] NULL,
	[ReservationDate] [datetime] NULL,
	[Time] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (1, N'admin1', N'123', N'Admin', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (2, N'user1', N'123', N'User', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (3, N'user2', N'123', N'User', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (4, N'user3', N'123', N'User', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (5, N'admin2', N'123', N'Admin', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (6, N'user4', N'123', N'User', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (8, N'user5', N'123', N'User', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (9, N'user7', N'123', N'User', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (10, N'user8', N'Kimanh308', N'User', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (11, N'user9', N'anhhtk308', N'User', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (12, N'user10', N'Kimanh30082000', N'User', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (13, N'kimanh', N'Kimanh30082000', N'Admin', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (14, N'user11', N'Kimanh308', N'User', N'anhhtkhe141704@fpt.edu.vn')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (15, N'user12', N'Kimanh308', N'User', N'anhhtk3082@gmail.com')
INSERT [dbo].[Account] ([UserID], [UserName], [Password], [Role], [Email]) VALUES (16, N'user14', N'Kimanh30082000', N'User', N'kimanh3082@gmail.com')
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Cart] ([UserID], [ProductID], [Quantity]) VALUES (1, 2, 4)
INSERT [dbo].[Cart] ([UserID], [ProductID], [Quantity]) VALUES (1, 11, 1)
INSERT [dbo].[Cart] ([UserID], [ProductID], [Quantity]) VALUES (1, 20, 3)
INSERT [dbo].[Cart] ([UserID], [ProductID], [Quantity]) VALUES (2, 12, 2)
INSERT [dbo].[Cart] ([UserID], [ProductID], [Quantity]) VALUES (3, 8, 2)
INSERT [dbo].[Cart] ([UserID], [ProductID], [Quantity]) VALUES (5, 30, 1)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Dimsum')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Vegetable')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'BBQ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Noodle')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Drink')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Dessert')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (1, N'Kim anh', N'1231231234', N'HN', N'anhhtk3082@gmail.com', N'No response yet', N'Boc phot', CAST(N'2021-07-21 16:41:30.260' AS DateTime), NULL, NULL)
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (2, N'Le Thuy', N'1231231234', N'DP', N'tunguye@gmail.com', N'Responded', N'Service good', CAST(N'2021-07-21 16:41:30.260' AS DateTime), N'<p>&lt;html&gt; 12</p>
', CAST(N'2021-07-22 03:22:07.227' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (3, N'Anna', N'1241253456', N'HCM', N'ana123@gmail.com', N'No response yet', N'Food very good', CAST(N'2021-07-21 16:41:30.260' AS DateTime), N'<p>&lt;html&gt; 12</p>
', CAST(N'2021-07-22 03:22:07.227' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (4, N'Tuan Vu', N'1231231234', N'HN', N'kimanh3082@gmail.com', N'Responded', N'good service', CAST(N'2021-07-21 16:41:30.260' AS DateTime), N'<ol>
	<li><img alt="" src="https://i.pinimg.com/736x/ff/99/e8/ff99e81f59e3a9c02ff4f799f35cfc90.jpg" style="height:100px; width:100px" /></li>
	<li>ths</li>
	<li>i love you</li>
</ol>
', CAST(N'2021-07-22 03:38:36.967' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (5, N'Phuong Hang', N'1231231234', N'HCM', N'anh@gmail.com', N'No response yet', N'good', CAST(N'2021-07-21 16:41:30.260' AS DateTime), NULL, NULL)
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (6, N'Hoang Son', N'1231231234', N'Lang Son', N'kimanh@gmail.com', N'Responded', N'oki', CAST(N'2021-07-21 16:46:25.333' AS DateTime), N'<p><img alt="" src="https://i.pinimg.com/736x/ff/99/e8/ff99e81f59e3a9c02ff4f799f35cfc90.jpg" style="height:690px; width:690px" /></p>

<p>Đồ ăn rất ngon</p>

<p>K&iacute; hợp đồng kh&ocirc;ng</p>
', CAST(N'2021-07-22 16:29:41.770' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (7, N'Mai Huong', N'1231231234', N'Campuchia', N'anh123@gmail.com', N'No response yet', N'123', CAST(N'2021-07-21 16:47:58.210' AS DateTime), N'seen', CAST(N'2021-07-22 02:53:14.433' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (9, N'Pham Tuan', N'1231231234', N'DL', N'kimanh3082@gmail.com', N'Responded', N'123', CAST(N'2021-07-21 16:52:36.907' AS DateTime), N'<p><img alt="" src="https://i.pinimg.com/736x/ff/99/e8/ff99e81f59e3a9c02ff4f799f35cfc90.jpg" style="height:690px; width:690px" />r</p>

<p>Sang xịn min</p>

<p>k&iacute; hợp đồng lun</p>

<p>&nbsp;</p>
', CAST(N'2021-07-22 16:32:12.640' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (10, N'Sinh Anh', N'1231231234', N'PL', N'kimanh3082@gmail.com', N'Responded', N'123', CAST(N'2021-07-21 16:53:29.603' AS DateTime), N'<p>oki la 123</p>
', CAST(N'2021-07-22 17:17:28.307' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (11, N'Tuan Vu 123', N'1231231234', N'HN', N'tuanvu@gmail.com', N'No response yet', N'123', CAST(N'2021-07-21 16:54:48.440' AS DateTime), NULL, NULL)
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (12, N'Linh Chi', N'123-123-1234', N'Long Bien', N'kimanh3082@gmail.com', N'Responded', N'oki', CAST(N'2021-07-22 00:13:49.857' AS DateTime), N'<p><img alt="" src="https://hinhnen123.com/wp-content/uploads/2021/06/anh-meo-cute-nhat-9.jpg" style="height:500px; width:500px" /></p>

<p>good</p>
', CAST(N'2021-07-22 16:52:49.123' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (13, N'Tien Tai', N'123-123-1234', N'BG', N'kimanh3082@gmail.com', N'No response yet', N'oki', CAST(N'2021-07-22 00:16:31.377' AS DateTime), NULL, NULL)
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (14, N'Huyen Lan', N'123-123-1234', N'Truong Chinh', N'sd@gmail.com', N'Responded', N'oki', CAST(N'2021-07-22 00:19:23.370' AS DateTime), N'<p><img alt="" src="https://pdp.edu.vn/wp-content/uploads/2021/04/hinh-anh-nen-con-meo-cute.jpg" style="height:90px; width:120px" /></p>

<ul>
	<li>cute</li>
	<li>oki</li>
</ul>
', CAST(N'2021-07-22 03:33:18.233' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (15, N'Pham Trung', N'123-123-1234', N'Long Bien', N'kimanh3082@gmail.com', N'Responded', N'oki', CAST(N'2021-07-22 00:21:38.873' AS DateTime), N'<p>oki good job</p>

<p><img alt="" src="https://documen.tv/wp-content/uploads/mon_hoc/tong_hop/1_9999/ve-cho-minh-moi-ban-co-4-buc-anh-meo-de-thuong-nha-u-nha-cai-o-duoi-la-minh-cho-coi-thoi-dung-ve-997740.jpg" /></p>
', CAST(N'2021-07-22 16:47:59.667' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (16, N'Phuong Trinh', N'123-123-1234', N'Long Bien 1234', N'kimanh3082@gmail.com', N'Responded', N'oki', CAST(N'2021-07-22 00:23:20.950' AS DateTime), N'<p><img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS284qz9H6CeO08zBXfkOawN102He1shvldRQ&amp;usqp=CAU" style="height:168px; width:300px" /></p>

<p>oki k&iacute; hop dong</p>
', CAST(N'2021-07-22 16:46:13.347' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (17, N'Manh Hoang', N'123-123-1234', N'HN', N'anhhtk3082@gmail.com', N'No response yet', N'oki', CAST(N'2021-07-22 00:26:27.507' AS DateTime), NULL, NULL)
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (18, N'Huy Hoang', N'123-123-1234', N'Truong Chinh', N'anhhtk3082@gmail.com', N'No response yet', N'oki', CAST(N'2021-07-22 00:41:05.663' AS DateTime), NULL, NULL)
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (19, N'Tien Dung', N'123-123-1234', N'Long Bien', N'kimanh3082@gmail.com', N'Responded', N'oki r', CAST(N'2021-07-22 01:21:01.527' AS DateTime), N'<p><img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq1AJq6j2f5i1FM9u-hrInCxWPhNUnK-sqsA&amp;usqp=CAU" style="height:221px; width:229px" /></p>

<p>oki la</p>
', CAST(N'2021-07-22 16:39:26.680' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (20, N'Linh Chi', N'123-123-1234', N'Long Bien', N'kimanh3082@gmail.com', N'No response yet', N'oki', CAST(N'2021-07-22 16:55:15.277' AS DateTime), NULL, NULL)
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (21, N'Kim Anh Hoang ok', N'123-123-1234', N'Long Bien 1234', N'kimanh3082@gmail.com', N'No response yet', N'oki', CAST(N'2021-07-22 17:07:35.530' AS DateTime), NULL, NULL)
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (22, N'Linh Chi', N'123-123-1234', N'Long Bien', N'kimanh3082@gmail.com', N'No response yet', N'toi dong y', CAST(N'2021-07-22 17:11:48.100' AS DateTime), NULL, NULL)
INSERT [dbo].[Contact] ([ContactID], [CustomerName], [Phone], [Address], [Email], [Status], [Message], [CreateMessageDate], [ResponseMessage], [ResponseMessageDate]) VALUES (23, N'Kim Anh Hoang', N'123-123-1234', N'Long Bien', N'kimanh3082@gmail.com', N'Responded', N'oki chưa', CAST(N'2021-07-23 21:02:01.260' AS DateTime), N'<p>oki roi</p>
', CAST(N'2021-07-23 21:53:38.050' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (1, 1, N'Kim Anh', 428.4, CAST(N'2000-08-30 00:00:00.000' AS DateTime), N'0869381823', N'HN', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (2, 2, N'Đức Huy', 334.95, CAST(N'2021-06-29 00:00:00.000' AS DateTime), N'012345678', N'HN', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (3, 2, N'Kim Anh Hoang', 1073.1, CAST(N'2021-07-13 19:41:34.033' AS DateTime), N'1234-123-123', N'HN', N'sinh nhat', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (4, 2, N'Kim ', 800.09999999999991, CAST(N'2021-07-13 19:46:01.967' AS DateTime), N'1234-123-123', N'HN', N'sinh nhat', N'abc@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (5, 2, N'Kim Anh Hoang 123', 138.6, CAST(N'2021-07-13 19:48:23.423' AS DateTime), N'123', N'12345', N'', N'abc@c.vn')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (6, 1, N'trinh pham', 201.6, CAST(N'2021-07-13 19:53:39.780' AS DateTime), N'12346807956', N'HN', N'cuoi', N'abc@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (7, 2, N'Kim Anh Hoang 1234', 619.30000000000007, CAST(N'2021-07-13 21:11:55.047' AS DateTime), N'1234-123-123', N'HN', N'', N'abc@a.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (8, 1, N'Lorem ipsum', 130.2, CAST(N'2021-07-13 22:35:38.657' AS DateTime), N'123-123-1234', N'vcxcx', N'sfds', N'kimanh@b.cb')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (9, 1, N'Lorem ipsum', 375.2, CAST(N'2021-07-13 23:06:04.023' AS DateTime), N'123-123-1234', N'HN', N'dam cuoi', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (10, 1, N'Lorem ipsum', 388.5, CAST(N'2021-07-13 23:12:21.573' AS DateTime), N'1231231234', N'HN VN', N'fdgda', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (11, 1, N'TienTd', 422.1, CAST(N'2021-07-13 23:14:10.527' AS DateTime), N'123-123-1234', N'Long Bien', N'dsfdsfsa ok', N'sd@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (12, 2, N'Kim Anh', 199.5, CAST(N'2021-07-13 23:24:45.707' AS DateTime), N'123-123-1234', N'Long Bien', N'dcsc ok', N'sc@gmi.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (13, 2, N'Kim ok', 138.6, CAST(N'2021-07-13 23:28:22.277' AS DateTime), N'123-123-1234', N'Long Bien', N'dsf ok', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (14, 2, N'Kim Anh Hoang 123', 138.6, CAST(N'2021-07-19 17:31:38.557' AS DateTime), N'123-123-1234', N'Long Bien 1234', N'abc', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (15, 1, N'Lorem ipsum', 138.6, CAST(N'2021-07-19 17:42:15.553' AS DateTime), N'123-123-1234', N'HN', N'oki', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (16, 1, N'Lorem ipsum', 1045.8, CAST(N'2021-07-19 17:45:06.947' AS DateTime), N'123-123-1234', N'HN', N'oki 1', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (17, 2, N'Lorem ipsum', 138.6, CAST(N'2021-07-19 17:49:02.803' AS DateTime), N'123-123-1234', N'HN', N'oki 2', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (18, 1, N'Lorem ipsum', 136.5, CAST(N'2021-07-19 17:52:42.433' AS DateTime), N'123-123-1234', N'HN', N'abc', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (19, 1, N'Lorem ipsum', 138.6, CAST(N'2021-07-19 17:56:24.750' AS DateTime), N'123-123-1234', N'HN', N'oki nha', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (20, 1, N'Lorem ipsum', 516.6, CAST(N'2021-07-19 18:02:43.533' AS DateTime), N'123-123-1234', N'HN VN', N'ahihi', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (21, 1, N'Lorem ipsum', 505, CAST(N'2021-07-19 18:06:03.233' AS DateTime), N'123-123-1234', N'HN VN', N'good', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (22, 1, N'tienTD 123', 130.2, CAST(N'2021-07-19 18:08:50.543' AS DateTime), N'123-123-1234', N'HN VN', N'dk', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (23, 1, N'tienTD 1234', 352.8, CAST(N'2021-07-19 21:17:13.620' AS DateTime), N'123-123-1234', N'HN VN', N'ok', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (24, 1, N'Lorem ipsum', 138.6, CAST(N'2021-07-19 21:24:47.300' AS DateTime), N'123-123-1234', N'HN', N'oki nhé', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (25, 1, N'tienTD 123', 138.6, CAST(N'2021-07-19 21:26:10.980' AS DateTime), N'123-123-1234', N'HN VN', N'oki r', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (26, 1, N'Lorem ipsum', 193.2, CAST(N'2021-07-19 21:29:06.103' AS DateTime), N'123-123-1234', N'HN VN', N'oki r', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (27, 2, N'Kim Anh Hoang ok', 138.6, CAST(N'2021-07-19 21:32:23.067' AS DateTime), N'123-123-1234', N'Long Bien', N'oki nhoe', N'sd@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (28, 2, N'Kim Anh Hoang ok', 260, CAST(N'2021-07-19 21:35:25.127' AS DateTime), N'123-123-1234', N'Truong Chinh', N'jztr', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (29, 2, N'Kim Anh Hoang abc', 151.2, CAST(N'2021-07-19 21:38:15.717' AS DateTime), N'123-123-1234', N'Long Bien', N'dfdsgdfv', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (30, 1, N'toi ten la', 335.6, CAST(N'2021-07-19 21:42:14.457' AS DateTime), N'123-123-1234', N'Campuchia', N'good', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (31, 1, N'toi ten la', 260, CAST(N'2021-07-19 21:42:48.933' AS DateTime), N'1231231234', N'Campuchia', N'oki lun', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (32, 1, N'tienTD 123', 69.3, CAST(N'2021-07-19 21:44:18.680' AS DateTime), N'123-123-1234', N'HN VN', N'oki chua', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (33, 1, N'tienTD 123', 3500, CAST(N'2021-07-19 21:44:49.963' AS DateTime), N'123-123-1234', N'HN VN', N'oki', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (34, 1, N'tienTD 123', 130, CAST(N'2021-07-19 21:45:25.263' AS DateTime), N'123-123-1234', N'HN VN', N'oki', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (35, 1, N'tienTD 123', 65.1, CAST(N'2021-07-19 21:47:51.333' AS DateTime), N'123-123-1234', N'HN VN', N'ADSC', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (36, 1, N'kim anh 1234', 151.2, CAST(N'2021-07-19 21:50:42.540' AS DateTime), N'123-123-1234', N'oki', N'oki r nhá', N'anhhtkhe@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (37, 2, N'TienTd123', 436.8, CAST(N'2021-07-20 02:07:09.703' AS DateTime), N'123-123-1234', N'Long Bien', N'ship nhanh len :v', N'sc@gmi.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (38, 1, N'AnhHTK', 436.79999999999995, CAST(N'2021-07-20 02:21:08.850' AS DateTime), N'123-123-1234', N'HN', N'ship nhanh nhá', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (39, 1, N'hien tran', 65.1, CAST(N'2021-07-20 02:37:17.077' AS DateTime), N'123-123-1234', N'HN', N'oki nha', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (43, 1, N'Kim cuong', 65.1, CAST(N'2021-07-20 03:19:41.940' AS DateTime), N'123-123-1234', N'Bac Giang', N'good job', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (44, 1, N'Thu Hoai', 65.1, CAST(N'2021-07-20 03:24:42.347' AS DateTime), N'123-123-1234', N'Soc Trang', N'123', N'anh@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (46, 1, N'Hong Gam', 262.5, CAST(N'2021-07-21 13:24:49.013' AS DateTime), N'1231231234', N'     HN', N'done', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (47, 10, N'Hong Gam', 75.6, CAST(N'2021-07-21 13:30:25.293' AS DateTime), N'1231231234', N'HN', N'oki nha', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (48, 10, N'Hong Gam 123', 75.6, CAST(N'2021-07-21 13:34:58.270' AS DateTime), N'1231121234', N'Long Bien', N'oki nhe', N'anhhtk3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (51, 9, N'Tien Linh', 220.5, CAST(N'2021-07-21 14:18:41.227' AS DateTime), N'1231231234', N'Long Bien', N'oki r', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (52, 9, N'Thanh Dat', 220.5, CAST(N'2021-07-21 14:24:16.030' AS DateTime), N'1231231234', N'HN', N'123', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (53, 10, N'Pham Thang', 220.5, CAST(N'2021-07-21 14:30:48.333' AS DateTime), N'1231231234', N'HN', N'oki r', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (55, 9, N'Chó Điên Thối Tha', 518.7, CAST(N'2021-07-21 14:38:48.337' AS DateTime), N'1231231234', N'Hà Nội', N'Mua ship cho any nên shop ship anh cho nhé nhá! ths', N'anhhpha150058@fpt.edu.vn')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (58, 9, N'Kim Anh Hoang', 199.5, CAST(N'2021-07-22 17:23:53.677' AS DateTime), N'123-123-1234', N'Long Bien', N'ship nhanh nhá', N'kimanh3082@gmail.com')
INSERT [dbo].[Order] ([OrderID], [UserID], [CustomerName], [TotalPrice], [OrderDate], [Phone], [Address], [Note], [Email]) VALUES (60, 10, N'Kim Anh', 130, CAST(N'2021-07-23 21:31:16.447' AS DateTime), N'123-123-1234', N'Long Bien', NULL, N'anhhtkhe141704@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1, 1, 1, 75.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1, 8, 1, 94.5)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1, 11, 1, 258.3)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1, 26, 1, 66.5)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (2, 18, 2, 134.4)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (2, 26, 1, 66.15)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (3, 35, 2, 130.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (3, 36, 3, 207.89999999999998)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (3, 48, 3, 735)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (4, 25, 2, 604.8)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (4, 35, 3, 195.29999999999998)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (5, 36, 2, 138.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (6, 4, 2, 136.5)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (6, 35, 1, 65.1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (7, 13, 3, 497.70000000000005)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (7, 27, 2, 121.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (8, 35, 2, 130.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (9, 35, 2, 130.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (9, 48, 1, 245)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (10, 11, 1, 258.3)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (10, 35, 2, 130.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (11, 14, 2, 352.8)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (11, 36, 1, 69.3)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (12, 35, 2, 130.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (12, 36, 1, 69.3)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (13, 36, 2, 138.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (14, 36, 2, 138.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (15, 3, 2, 138.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (16, 17, 2, 1045.8)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (17, 36, 2, 138.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (18, 4, 2, 136.5)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (19, 3, 2, 138.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (20, 11, 2, 516.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (21, 48, 1, 245)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (21, 58, 2, 260)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (22, 37, 2, 130.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (23, 14, 2, 352.8)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (24, 36, 2, 138.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (25, 36, 2, 138.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (26, 21, 2, 193.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (27, 2, 2, 138.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (28, 58, 2, 260)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (29, 7, 2, 151.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (30, 1, 1, 75.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (30, 58, 2, 260)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (31, 58, 2, 260)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (32, 36, 1, 69.3)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (33, 47, 1, 3500)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (34, 58, 1, 130)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (35, 37, 1, 65.1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (36, 1, 2, 151.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (37, 6, 1, 63)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (37, 12, 2, 373.8)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (38, 19, 2, 193.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (38, 20, 2, 243.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (39, 35, 1, 65.1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (43, 37, 1, 65.1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (44, 37, 1, 65.1)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (46, 3, 1, 69.3)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (46, 19, 2, 193.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (47, 1, 1, 75.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (48, 7, 1, 75.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (51, 1, 2, 151.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (51, 2, 1, 69.3)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (52, 1, 2, 151.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (52, 2, 1, 69.3)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (53, 1, 2, 151.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (53, 2, 1, 69.3)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (55, 13, 1, 165.9)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (55, 14, 2, 352.8)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (58, 35, 2, 130.2)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (58, 36, 1, 69.3)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (60, 58, 1, 130)
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (1, N'Scallop and shrimp dumpling', 75.6, 4, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/236766cc-fe4f-4142-e4c5-191cdaf54263.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (2, N'Shrimp dumpling', 69.3, 8, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/943e1717-f5a1-486d-97ed-743206e3d68b.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (3, N'Minced pork with shrimp & mushroom dumpling', 69.3, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/b92f4e3a-1e69-40f0-08c8-4da8b8713126.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (4, N'Shanghai dumpling', 68.25, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/70f53921-16a4-4e03-3b84-ed242a5aead7.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (5, N'The shrimp cone', 65.1, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/7702c6a7-3718-4f64-223f-1581b456b9d7.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (6, N'Steamed rice roll with bbq pork', 63, 9, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/59c174e0-3244-4dd9-029b-5a84c79cb17f.jpg', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (7, N'Prawn Prawns Luc Luc', 75.6, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/c3083626-6e2e-4849-8d8c-eeb4888c-687cfcd3-201222111238.jpeg', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (8, N'Stir fried broccoli with oyster sauce', 94.5, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/a39d1607-75cd-4dd4-1c93-9877b61ca478.jpg', 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (9, N'Bunapi mushroom stir in dried shrimp sauce', 96.6, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/1a309ab3-a1e4-4c8f-b1aa-1baa87f108f8.jpg', 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (10, N'Stir-fried hong kong cabbage with garlic', 96.6, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/64b7c3d9-a044-4832-77f4-b4def949d2e5.jpg', 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (11, N'A Ma BBQ', 258.3, 8, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/48fa4370-8596-48e5-8fc4-b693b5fac750.jpg', 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (12, N'Bbq duck in hong kong style', 186.9, 8, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/b89ee80c-bca2-44f2-8338-ae6cccdd46cc.jpg', 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (13, N'Honey bbq pork', 165.9, 9, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/a5bcee32-21d9-42f7-b86f-178360c4449c.jpg', 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (14, N'Crispy Roasted Pork', 176.4, 7, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/fd7295a7-6b98-4a95-e373-f5226693d8b5.jpg', 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (15, N'Deep fried pork rib with pepper & salt', 176.4, 8, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/5791520c-7c65-4036-b890-857771452be5.jpg', 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (16, N'Deep dried pork rib with sweet & sour sauce', 176.4, 8, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/dbdee3ec-29fb-40e6-c9de-9aaf0b8b7280.jpg', 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (17, N'A ma chicken (full)', 522.9, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/f4cecf8c-0c20-431c-dd52-f7095d0bc001.jpg', 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (18, N'Wok-fried hot fun with sliced beef', 134.4, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/717e237d-ada1-4038-0e2d-b6b8cccbdfa0.jpg', 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (19, N'Dried noodle with bbq pork.', 96.6, 8, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/4b127879-7b45-4eb8-3b6a-f2447c464bb6.jpg', 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (20, N'Dried noodle with bbq crispy pork belly', 121.8, 8, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/3f10e274-70de-497b-2bee-f408762dcdf8.jpg', 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (21, N'Dried noodle with bbq roasted duck', 96.6, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/44d2d6e6-feaa-43c7-a03e-8f938b7f1740.jpg', 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (22, N'Dried noodle with bbq crispy pork belly', 96.6, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/f9879dc7-87e1-4f52-3b90-2d3742017d5d.jpg', 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (23, N'Prawn de mango', 207.9, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/4e4551a0-a6a9-419c-5faf-fc55f515976d.jpg', 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (24, N'Deep fried prawn with salted egg yolk', 207.9, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/de210746-81bf-458f-ee0f-c75357b5c7bc.jpg', 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (25, N'Deep fried prawn in singapore style', 302.4, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/5d95797b-f0de-4060-0ec1-c824446f2787.jpg', 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (26, N'1980s milk tea', 66.15, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/336496f7-9384-4bdf-9061-b9b8d8db5fdd.jpg', 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (27, N'Lychee tea', 60.8, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/eb2d68cf-cc3f-43da-cd89-61cac0b08fee.jpg', 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (28, N'Peach lemon grass tea', 60.9, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/dee2596e-da57-45a4-a6aa-eea82826cb86.jpg', 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (29, N'Ginger lime tea', 57.75, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/0543cfca-4bae-43d0-4491-72042811f8d1.jpg', 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (30, N'Fragrant lemonade with aloe vera', 63, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/eb18d3b0-4a89-499e-950b-3601af27fe93.jpg', 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (31, N'Watermelon juice', 60.9, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/12f3377e-13c3-4bab-e734-5e6141ee3090.jpg', 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (32, N'Buckwheat milk tea', 66.15, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/b1a2cb19-44a6-489d-18ef-f04cf14803b9.jpg', 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (33, N'Red chrysanthemum tea', 60.9, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/6ccb5e57-8d9c-47d4-583c-e878069cb90f.jpg', 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (34, N'Plain tea', 60.9, 10, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/eee2d7c4-b676-42b6-1c57-6e308d6c7e1b.jpg', 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (35, N'Blended black sesame', 65.1, 6, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/948b916d-d98f-469b-d130-0c4fb00ad404.jpg', 6)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (36, N'Chilled mango cream with sago & pomelo', 69.3, 9, N'Lorem ipsum dolor sit amet', N'Lorem ipsum dolor sit amet', N'https://images.foody.vn/res/g87/867237/s570x570/f1a9ae34-0b17-4765-61c5-5bdeb1509e47.jpg', 6)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (37, N'Lotus seed with logan', 65.1, 1, N'Lorem ipsum dolor sit amet', N'123', N'https://images.foody.vn/res/g87/867237/s570x570/30dc62e3-6b59-447a-4e6d-e2e4fdfc99e2.jpg', 6)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (47, N'phanh cho 1234', 3500, 6, N'shpponsd123', N'abcd', N'https://i.pinimg.com/736x/ff/99/e8/ff99e81f59e3a9c02ff4f799f35cfc90.jpg', 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (48, N'phanh cho', 245, 0, N'shpponsd123 sdfsd ok', N'<ol>
	<li>
	<h2 style="font-style:italic"><s><strong>dsgfdhgfjnhgnvb#&nbsp;</strong></s></h2>
	</li>
	<li><img alt="anh meo" src="data:image/jpeg;base64,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" style="height:50px; width:50px" /></li>
	<li>ok</li>
</ol>
', N'https://anhdep123.com/wp-content/uploads/2021/02/anh-meo-hai-huoc.jpg', 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Quantity], [ShortDes], [Description], [Image], [CategoryID]) VALUES (58, N'ac', 130, 29, N'shpponsd123 sdfsd', N'fdgfdgfvb', N'https://i.pinimg.com/736x/ff/99/e8/ff99e81f59e3a9c02ff4f799f35cfc90.jpg', 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (1, 1, N'Kim Anh', N'kimanh3082@gmail.com', N'0869381823', 2, CAST(N'2021-08-30 00:00:00.000' AS DateTime), N'Lunch', NULL)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (2, 2, N'Đức Huy', N'abc123@gmail.com', N'12345678', 4, CAST(N'2021-08-12 00:00:00.000' AS DateTime), N'Dinner', NULL)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (5, 1, N'Kim anh 123', N'kimanh308@gmail.com', N'0123456789', 2, CAST(N'2021-07-15 00:00:00.000' AS DateTime), N'Lunch', N'oki')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (6, 2, N'tienTD 123', N'anhhtkhe@gmail.com', N'1231231234', 3, CAST(N'2021-07-30 00:00:00.000' AS DateTime), N'Dinner', NULL)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (7, 2, N'Kim anh 123', N'kimanh308@gmail.com', N'0123456789', 1, CAST(N'2021-07-20 00:00:00.000' AS DateTime), N'Breakfast', NULL)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (10, 2, N'Kim anh 123', N'kimanh308@gmail.com', N'0123456789', 1, CAST(N'2021-07-30 00:00:00.000' AS DateTime), N'Breakfast', NULL)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (11, 1, N'kim anh 1234', N'anhhtkhe@gmail.com', N'1231231234', 1, CAST(N'2021-07-22 00:00:00.000' AS DateTime), N'Lunch', NULL)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (12, 1, N'Kim anh 12345', N'kimanh308@gmail.com', N'0123456789', 4, CAST(N'2021-07-29 00:00:00.000' AS DateTime), N'Lunch', NULL)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (13, 2, N'Kim anh 12345', N'kimanh308@gmail.com', N'0123456789', 3, CAST(N'2021-07-27 00:00:00.000' AS DateTime), N'Lunch', N'oki r')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (14, 1, N'Kim anh 12345', N'kimanh308@gmail.com', N'0123456789', 2, CAST(N'2021-07-26 00:00:00.000' AS DateTime), N'Dinner', N'123')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (15, 1, N'kim anh 1234', N'anhhtkhe@gmail.com', N'1231231234', 2, CAST(N'2021-07-25 00:00:00.000' AS DateTime), N'Lunch', N'oki')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (16, 1, N'linh chi', N'anh@123gmail.com', N'1231234567', 3, CAST(N'2021-07-24 00:00:00.000' AS DateTime), N'Dinner', N'oki 1233')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (17, 1, N'linh chi', N'anh@123gmail.com', N'1231234567', 4, CAST(N'2021-07-23 00:00:00.000' AS DateTime), N'Lunch', N'alo')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (18, 1, N'linh chi 12', N'anh@123gmail.com', N'1231234567', 3, CAST(N'2021-07-31 00:00:00.000' AS DateTime), N'Lunch', N'1234')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (19, 1, N'linh chi 123', N'anh@123gmail.com', N'1231234567', 2, CAST(N'2021-08-02 00:00:00.000' AS DateTime), N'Lunch', N'oki')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (20, 1, N'Kim anh 123456', N'kimanh308@gmail.com', N'0123456789', 3, CAST(N'2021-08-04 00:00:00.000' AS DateTime), N'Lunch', N'okila')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (21, 2, N'linh chi', N'anh@123gmail.com', N'1231234567', 1, CAST(N'2021-08-07 00:00:00.000' AS DateTime), N'Lunch', N'oki')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (22, 1, N'linh chi', N'anh@123gmail.com', N'1231234567', 1, CAST(N'2021-09-10 00:00:00.000' AS DateTime), N'Lunch', N'oki')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (23, 2, N'Kim anh 1234567', N'kimanh308@gmail.com', N'0123456789', 1, CAST(N'2021-09-05 00:00:00.000' AS DateTime), N'Breakfast', N'oki')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (24, 2, N'linh chi 1234', N'anh@123gmail.com', N'1231234567', 1, CAST(N'2021-09-09 00:00:00.000' AS DateTime), N'Breakfast', NULL)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (25, 10, N'linh chi 1234', N'anh@123gmail.com', N'1231234567', 1, CAST(N'2021-11-21 00:00:00.000' AS DateTime), N'Breakfast', N'oki')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (26, 10, N'phuongan', N'sd@gmail.com', N'1231231234', 1, CAST(N'2021-12-30 00:00:00.000' AS DateTime), N'Breakfast', N'oki')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (27, 10, N'phuongan', N'sd@gmail.com', N'1231231234', 1, CAST(N'2021-12-31 00:00:00.000' AS DateTime), N'Breakfast', N'oki')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (28, 10, N'linh chi 123', N'anh@123gmail.com', N'1231234567', 1, CAST(N'2021-10-01 00:00:00.000' AS DateTime), N'Breakfast', N'oki')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (29, 10, N'phuongan123', N'sd@gmail.com', N'1231231234', 3, CAST(N'2021-11-04 00:00:00.000' AS DateTime), N'Lunch', N'good')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (30, 10, N'linh chi 123', N'anh@123gmail.com', N'1231234567', 1, CAST(N'2021-12-15 00:00:00.000' AS DateTime), N'Breakfast', N'oki')
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (31, 1, N'linh chi 123', N'anh@123gmail.com', N'1231234567', 2, CAST(N'2021-12-04 00:00:00.000' AS DateTime), N'Breakfast', NULL)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (32, 10, N'linh chi 123', N'anh@123gmail.com', N'1231234567', 2, CAST(N'2022-01-02 00:00:00.000' AS DateTime), N'Lunch', NULL)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (33, 2, N'Kim Anh', N'kimanh3082@gmail.com', N'1241231234', 3, CAST(N'2021-12-10 00:00:00.000' AS DateTime), N'Lunch', NULL)
INSERT [dbo].[Reservation] ([ReservationID], [UserID], [CustomerName], [Email], [Phone], [NumOfGuests], [ReservationDate], [Time], [Message]) VALUES (34, 10, N'Kim Anh', N'kimanh3082@gmail.com', N'1231231234', 3, CAST(N'2021-07-24 00:00:00.000' AS DateTime), N'Lunch', NULL)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([UserID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([UserID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Account]
GO
