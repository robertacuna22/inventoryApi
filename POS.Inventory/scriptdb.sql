USE [ISMgmtDB]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 26/02/2023 10:37:11 pm ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IIS APPPOOL\inventoryapi]    Script Date: 26/02/2023 10:37:11 pm ******/
CREATE USER [IIS APPPOOL\inventoryapi] FOR LOGIN [IIS APPPOOL\inventoryapi] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\inventoryapi]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [IIS APPPOOL\inventoryapi]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [IIS APPPOOL\inventoryapi]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [IIS APPPOOL\inventoryapi]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [IIS APPPOOL\inventoryapi]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\inventoryapi]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\inventoryapi]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [IIS APPPOOL\inventoryapi]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [IIS APPPOOL\inventoryapi]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [uniqueidentifier] NOT NULL,
	[BrandName] [nvarchar](200) NULL,
	[Description] [nvarchar](200) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [uniqueidentifier] NOT NULL,
	[Category] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CloverId] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measures]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measures](
	[Id] [uniqueidentifier] NOT NULL,
	[UnitOfMeasure] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Measures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Quantity] [int] NOT NULL,
	[SKU] [nvarchar](50) NOT NULL,
	[Brand] [uniqueidentifier] NOT NULL,
	[Category] [uniqueidentifier] NOT NULL,
	[UnitOfMeasure] [uniqueidentifier] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[EmailAddress] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Token] [uniqueidentifier] NULL,
	[InstallationId] [uniqueidentifier] NULL,
	[Gender] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdateOn] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Brands] ([Id], [BrandName], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'38695877-921d-44b5-a0e9-189753cbc385', N'IPhone Apple', N'Mobile phone Mc Apple Devices', CAST(N'2022-09-15T15:22:54.430' AS DateTime), CAST(N'2022-09-15T15:22:54.430' AS DateTime))
INSERT [dbo].[Brands] ([Id], [BrandName], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'ab1fd3fd-13f4-42a1-8ad8-ca010e3a8f2c', N'Oppo', N'Mobile Devices', CAST(N'2022-09-15T15:25:50.260' AS DateTime), CAST(N'2022-09-15T15:25:50.260' AS DateTime))
INSERT [dbo].[Brands] ([Id], [BrandName], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'0a30fef2-71e5-4498-adcc-8ca9b2ad1340', N'realMe', N'Mobile Devices', CAST(N'2022-09-15T15:27:02.903' AS DateTime), CAST(N'2022-09-15T15:27:02.903' AS DateTime))
INSERT [dbo].[Brands] ([Id], [BrandName], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'5fd9b5ae-0aae-4283-8b7c-18f11b1b947e', N'Vivo', N'Mobile phone Vivo Devices', CAST(N'2022-09-14T18:06:30.507' AS DateTime), CAST(N'2022-09-14T18:06:30.507' AS DateTime))
INSERT [dbo].[Brands] ([Id], [BrandName], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'3a4043c1-aea5-4241-bfbd-a8a363bd9f2c', N'Cherry Mobile', N'The Filipino Pride Mobile Device isang bagsak sira agad', CAST(N'2022-09-14T20:02:17.477' AS DateTime), CAST(N'2022-09-14T20:02:17.477' AS DateTime))
INSERT [dbo].[Brands] ([Id], [BrandName], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'eb24ff19-90e2-4639-a428-83c545da404b', N'Huawei', N'The mobile phone device', CAST(N'2022-09-21T13:04:30.710' AS DateTime), CAST(N'2022-09-21T13:04:30.710' AS DateTime))
INSERT [dbo].[Brands] ([Id], [BrandName], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'b16e03ba-dada-4c15-99af-1f1e5977974a', N'Samsung', N'The Samsung is a mobile device.', CAST(N'2022-09-15T01:26:04.393' AS DateTime), CAST(N'2022-09-15T01:26:04.393' AS DateTime))
GO
INSERT [dbo].[Categories] ([Id], [Category], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'Mobile Device', N'All mobile device', CAST(N'2022-09-21T15:42:17.310' AS DateTime), CAST(N'2022-09-21T15:42:17.310' AS DateTime))
INSERT [dbo].[Categories] ([Id], [Category], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'8c26a620-f0cb-408b-8a66-90f8cc2366f2', N'Computer Peripherals', N'All computer peripheral', CAST(N'2022-09-21T15:44:58.713' AS DateTime), CAST(N'2022-09-23T17:43:53.837' AS DateTime))
INSERT [dbo].[Categories] ([Id], [Category], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'a5d9c747-154e-4ad9-9537-c23e9c59a5b4', N'Beverages', N'All beverages', CAST(N'2022-09-21T15:48:52.550' AS DateTime), CAST(N'2022-09-21T15:48:52.550' AS DateTime))
INSERT [dbo].[Categories] ([Id], [Category], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'Hardware', N'Any hard materials', CAST(N'2022-09-23T17:44:42.070' AS DateTime), CAST(N'2022-09-23T17:44:42.070' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([Id], [CloverId], [Description], [DateCreated]) VALUES (1, N'sampleId', N'yeah', CAST(N'2022-10-31T17:10:26.373' AS DateTime))
INSERT [dbo].[Logs] ([Id], [CloverId], [Description], [DateCreated]) VALUES (2, N'KPXC2HW332CGM', N'{"appId":"JWD37JD9CA38C","merchants":{"Y964D51FQZAF1":[{"objectId":"I:KPXC2HW332CGM","type":"UPDATE","ts":1667207596427}]}}', CAST(N'2022-10-31T17:13:17.543' AS DateTime))
INSERT [dbo].[Logs] ([Id], [CloverId], [Description], [DateCreated]) VALUES (3, N'KPXC2HW332CGM', N'{"appId":"JWD37JD9CA38C","merchants":{"Y964D51FQZAF1":[{"objectId":"I:KPXC2HW332CGM","type":"UPDATE","ts":1667207596622}]}}', CAST(N'2022-10-31T17:13:17.543' AS DateTime))
INSERT [dbo].[Logs] ([Id], [CloverId], [Description], [DateCreated]) VALUES (4, N'KPXC2HW332CGM', N'{"appId":"JWD37JD9CA38C","merchants":{"Y964D51FQZAF1":[{"objectId":"I:KPXC2HW332CGM","type":"UPDATE","ts":1667213072678}]}}', CAST(N'2022-10-31T18:44:33.477' AS DateTime))
INSERT [dbo].[Logs] ([Id], [CloverId], [Description], [DateCreated]) VALUES (5, N'KPXC2HW332CGM', N'{"appId":"JWD37JD9CA38C","merchants":{"Y964D51FQZAF1":[{"objectId":"I:KPXC2HW332CGM","type":"UPDATE","ts":1667213072877}]}}', CAST(N'2022-10-31T18:44:34.217' AS DateTime))
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
INSERT [dbo].[Measures] ([Id], [UnitOfMeasure], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'567495aa-b889-48c9-a3d7-1f5e3f133d0d', N'KG', N'A weight of product by kilo grams', CAST(N'2022-09-23T16:42:29.077' AS DateTime), CAST(N'2022-09-23T16:43:04.593' AS DateTime))
INSERT [dbo].[Measures] ([Id], [UnitOfMeasure], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'10d648bd-8427-4bc9-985f-cbebb26ed3b2', N'PKG', N'A set of products', CAST(N'2022-09-23T15:50:33.177' AS DateTime), CAST(N'2022-09-23T18:17:03.560' AS DateTime))
INSERT [dbo].[Measures] ([Id], [UnitOfMeasure], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'4cc22c3d-0a1c-48df-b002-e5979fceadda', N'PC', N'A piece of products', CAST(N'2022-09-23T15:47:35.920' AS DateTime), CAST(N'2022-09-23T18:17:09.630' AS DateTime))
INSERT [dbo].[Measures] ([Id], [UnitOfMeasure], [Description], [CreatedOn], [UpdatedOn]) VALUES (N'72e954b8-bc21-4af2-9163-f0add4159637', N'PND', N'a weight of product by pounds', CAST(N'2022-09-23T16:33:15.017' AS DateTime), CAST(N'2022-09-23T18:17:22.300' AS DateTime))
GO
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'14ed8dd5-17b7-4dae-92a7-07b7b5560cbc', N'', N'', 0, N'', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000', CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-12-14T12:52:52.283' AS DateTime), CAST(N'2022-12-14T12:52:52.283' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'23130f12-e914-463b-a942-11b323ebd335', N'Brand New Phone', N'high quality standard', 2, N'55444-4444', N'eb24ff19-90e2-4639-a428-83c545da404b', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'10d648bd-8427-4bc9-985f-cbebb26ed3b2', CAST(7000.00 AS Decimal(18, 2)), CAST(N'2022-12-14T12:11:35.163' AS DateTime), CAST(N'2023-02-15T13:34:36.807' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'79ec5b26-af3e-489e-9445-16d44f46516e', N'MyProduct', N'MyProductDescription', 0, N'TT0994-OOT', N'ab1fd3fd-13f4-42a1-8ad8-ca010e3a8f2c', N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(400.00 AS Decimal(18, 2)), CAST(N'2023-02-13T23:08:24.813' AS DateTime), CAST(N'2023-02-13T23:08:24.813' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'c14bc56c-6f40-4a0d-9122-30ea24eb921c', N'SamsungMouse300RT', N'Samsung Mouse from main thailand', 0, N'TTTR0-00914', N'b16e03ba-dada-4c15-99af-1f1e5977974a', N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(350.00 AS Decimal(18, 2)), CAST(N'2023-02-13T16:22:18.527' AS DateTime), CAST(N'2023-02-13T16:22:18.527' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'd1dcc120-0bca-4566-88a8-314027898263', N'Dell 094413-T3', N'for filipino only', 0, N'343', N'0a30fef2-71e5-4498-adcc-8ca9b2ad1340', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(500.00 AS Decimal(18, 2)), CAST(N'2023-02-12T23:14:03.053' AS DateTime), CAST(N'2023-02-12T23:14:03.053' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'b0a0b238-d157-4de9-a182-341bb2ee30d4', N'Electric Fan Standard 2091', N'Electric Fan From USA', 1, N'KKTR-0934', N'b16e03ba-dada-4c15-99af-1f1e5977974a', N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(230.00 AS Decimal(18, 2)), CAST(N'2023-02-13T16:15:30.670' AS DateTime), CAST(N'2023-02-15T10:31:44.130' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'449f1f9c-7224-4d87-8718-431dd4479e44', N'Samsung Galaxy Practice', N'Test Phone Product', 1, N'TEST-0091', N'ab1fd3fd-13f4-42a1-8ad8-ca010e3a8f2c', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(400.00 AS Decimal(18, 2)), CAST(N'2023-02-12T23:31:36.977' AS DateTime), CAST(N'2023-02-15T18:04:09.480' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'757ac673-9ca0-4d66-92f9-51ece9d831d3', N'SportMotor 105', N'Yahamah Sports Motor', 1, N'00944-TORU', N'eb24ff19-90e2-4639-a428-83c545da404b', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'00000000-0000-0000-0000-000000000000', CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-02-11T16:14:13.143' AS DateTime), CAST(N'2023-02-11T16:14:13.143' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'705ca937-992c-43e2-ab6a-54980b8b6366', N'OPPO Reno8 Z 5G', N'Smart Phone', 2, N'41117-TEER', N'ab1fd3fd-13f4-42a1-8ad8-ca010e3a8f2c', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(20000.00 AS Decimal(18, 2)), CAST(N'2022-09-29T01:40:19.447' AS DateTime), CAST(N'2023-02-15T18:04:39.620' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'ef65a32b-c378-420f-9faa-5e8e7098e7c4', N'sample product description', N'89 Vivo SmartPhone', 0, N'48-4ADDT-TR', N'20f7e646-fa6f-4f53-8cd9-abd2d8676b37', N'd14e8545-9f93-473e-a5c1-4b4bed0304e1', N'fd9f2416-66f3-41b4-a34e-71390f937b4b', CAST(15000.00 AS Decimal(18, 2)), CAST(N'2022-09-28T13:30:48.313' AS DateTime), CAST(N'2022-09-28T13:30:48.313' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'4796bc7c-652a-4ffd-98b6-6f7faa5e4bf5', N'Acer Laptop 101', N'Acer Laptop from indiana', 1, N'TTR-00339', N'b16e03ba-dada-4c15-99af-1f1e5977974a', N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(251.00 AS Decimal(18, 2)), CAST(N'2023-02-13T10:50:02.187' AS DateTime), CAST(N'2023-02-15T18:02:15.970' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'2cd74c92-0110-4a37-8715-706878f23cb6', N'TestingProduct 101', N'Testing description', 1, N'QWERTY-0091', N'ab1fd3fd-13f4-42a1-8ad8-ca010e3a8f2c', N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(200.00 AS Decimal(18, 2)), CAST(N'2023-02-13T14:14:21.650' AS DateTime), CAST(N'2023-02-15T18:01:55.253' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'8c2dbe0b-8eca-4ef5-b6ad-71e268976472', N'Samsung Galaxy 1.0v', N'Samsung Mobile Phone From Thailand', 3, N'500941-OTR', N'b16e03ba-dada-4c15-99af-1f1e5977974a', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(7001.00 AS Decimal(18, 2)), CAST(N'2023-02-12T23:22:58.527' AS DateTime), CAST(N'2023-02-15T18:04:29.333' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'38a0a91d-71d3-40ba-b87f-879c37acf97b', N'sample product description', N'A94 Oppo SmartPhone', 0, N'48-4ADDT-RR', N'20f7e646-fa6f-4f53-8cd9-abd2d8676b77', N'd14e8545-9f93-473e-a5c1-4b4bed0306e1', N'fd9f2416-66f3-41b4-a34e-71391f937b4b', CAST(15000.00 AS Decimal(18, 2)), CAST(N'2022-09-28T13:26:10.410' AS DateTime), CAST(N'2022-09-28T13:26:10.410' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'670e0ca9-fc8e-4ce3-8e6a-93f839c4fbb8', N'OPPO Find X5 Pro 5G', N'Oppo mobile device', 0, N'09EET-144R', N'ab1fd3fd-13f4-42a1-8ad8-ca010e3a8f2c', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(20100.00 AS Decimal(18, 2)), CAST(N'2022-09-29T14:17:05.120' AS DateTime), CAST(N'2022-09-29T14:17:05.120' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'5d017b0b-9087-45b5-94b4-95e8cf8fcf74', N'Oppo 98 Mobile', N'Oppo The Mobile Phone Device', 2, N'5993-TPUI', N'ab1fd3fd-13f4-42a1-8ad8-ca010e3a8f2c', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(3050.00 AS Decimal(18, 2)), CAST(N'2023-02-12T23:30:09.053' AS DateTime), CAST(N'2023-02-17T09:59:52.100' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'2c8af1fc-4ee7-413f-b83b-9d64d9b7cdcb', N'TestProduct101', N'TestProduct Description', 2, N'5549001', N'0a30fef2-71e5-4498-adcc-8ca9b2ad1340', N'8c26a620-f0cb-408b-8a66-90f8cc2366f2', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(230.00 AS Decimal(18, 2)), CAST(N'2023-02-13T23:10:40.960' AS DateTime), CAST(N'2023-02-15T14:05:01.140' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'4b18586a-a280-444c-91a0-a1dc5341c9bd', N'OPPO A75', N'Oppo mobile device', 2, N'09EET-100R', N'ab1fd3fd-13f4-42a1-8ad8-ca010e3a8f2c', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(20100.00 AS Decimal(18, 2)), CAST(N'2022-09-29T01:56:01.440' AS DateTime), CAST(N'2023-02-24T18:28:06.280' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'd918e2b7-c154-4997-887f-acab0a45a86d', N'Test', N'Description test', 2, N'4453344-002', N'3a4043c1-aea5-4241-bfbd-a8a363bd9f2c', N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(200.00 AS Decimal(18, 2)), CAST(N'2023-02-13T14:15:52.857' AS DateTime), CAST(N'2023-02-15T14:18:09.880' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'c30d294f-d49d-465f-a8a5-ae91035c0656', N'SportMotor', N'Dell 094413-T2', 2, N'00944-TORU', N'eb24ff19-90e2-4639-a428-83c545da404b', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'10d648bd-8427-4bc9-985f-cbebb26ed3b2', CAST(203.00 AS Decimal(18, 2)), CAST(N'2023-02-13T23:37:41.077' AS DateTime), CAST(N'2023-02-15T16:12:22.680' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'b37e9145-89c1-46c2-a583-b1ba4aa84e58', N'Sample Product', N'Product sample test', 2, N'TTO-4454', N'5fd9b5ae-0aae-4283-8b7c-18f11b1b947e', N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(300.00 AS Decimal(18, 2)), CAST(N'2023-02-13T10:45:01.500' AS DateTime), CAST(N'2023-02-15T18:02:23.293' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'd9aa0dca-3922-4728-9d4d-b2ccdac34619', N'Yeah', N'Yeah Description', 1, N'21991-OOI1', N'b16e03ba-dada-4c15-99af-1f1e5977974a', N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(300.00 AS Decimal(18, 2)), CAST(N'2023-02-13T14:16:58.927' AS DateTime), CAST(N'2023-02-15T18:01:49.743' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'de962111-533b-4dc7-a3ac-b70501ede414', N'Yamaha Motorcycle89', N'Yamaha saudi Parts', 2, N'233544-009', N'eb24ff19-90e2-4639-a428-83c545da404b', N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(250.00 AS Decimal(18, 2)), CAST(N'2023-02-15T17:56:16.567' AS DateTime), CAST(N'2023-02-15T17:56:25.010' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'c66ce2b9-c2fe-4639-8a9b-bdd96651765e', N'Samsung Adapter 12v', N'Adapter of samsung laptop model 112', 5, N'TTR-005', N'b16e03ba-dada-4c15-99af-1f1e5977974a', N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(200.00 AS Decimal(18, 2)), CAST(N'2023-02-13T09:56:36.227' AS DateTime), CAST(N'2023-02-15T18:01:41.410' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'0da5089b-3158-4a44-be9d-bf91e6fd17e3', N'Dell i7 Laptop 101', N'Dell laptop from singapore', 2, N'644921-1', N'3a4043c1-aea5-4241-bfbd-a8a363bd9f2c', N'6ad16dc7-a56b-45ba-8ae8-f4ab2e3d8a1a', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(200.00 AS Decimal(18, 2)), CAST(N'2023-02-13T10:42:58.210' AS DateTime), CAST(N'2023-02-15T18:03:57.073' AS DateTime), 0)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'9579f8b6-13dc-41ee-baa0-c213c98b0152', N'TheProduct991', N'TheProductDescription', 0, N'3504', N'0a30fef2-71e5-4498-adcc-8ca9b2ad1340', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(250.00 AS Decimal(18, 2)), CAST(N'2023-02-13T23:12:31.207' AS DateTime), CAST(N'2023-02-15T00:22:11.040' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [ProductName], [Description], [Quantity], [SKU], [Brand], [Category], [UnitOfMeasure], [UnitPrice], [CreatedOn], [UpdatedOn], [IsDeleted]) VALUES (N'5d450955-f951-4e3e-8ad1-d84cbae6509d', N'GALAXY A23 5G', N'Samsung Mobile Phone Device', 0, N'44553-1147', N'b16e03ba-dada-4c15-99af-1f1e5977974a', N'3d942f6f-2fd1-4435-af7d-45bfa629a6b5', N'4cc22c3d-0a1c-48df-b002-e5979fceadda', CAST(17000.00 AS Decimal(18, 2)), CAST(N'2022-09-28T22:14:03.820' AS DateTime), CAST(N'2022-09-28T22:14:03.820' AS DateTime), 0)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [EmailAddress], [Phone], [Status], [Password], [Token], [InstallationId], [Gender], [CreatedOn], [UpdateOn], [IsDeleted]) VALUES (N'fc7ebaa6-3520-498f-b995-6e380f4789e7', N'Robert', N'Acuna', N'rbrtacuna24@gmail.com', N'1144-112', 2, N'!123456', N'dd5c7711-c083-474a-8c8e-50ae95248957', N'12ddfca1-4e15-403c-b2a1-b49a9616abab', N'Male', CAST(N'2022-08-16T00:00:00.000' AS DateTime), CAST(N'2022-08-16T00:00:00.000' AS DateTime), NULL)
GO
/****** Object:  StoredProcedure [dbo].[Brands_Delete]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Brands_Delete]
	@Id as uniqueidentifier
as 

begin 

	delete from Brands where id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[Brands_GetAll]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Brands_GetAll]

as 

begin 

SELECT * FROM [dbo].[Brands] ORDER BY CreatedOn DESC

end 
GO
/****** Object:  StoredProcedure [dbo].[Brands_Save]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Brands_Save]
	@Id as uniqueidentifier,
	@BrandName as nvarchar(200),
	@Description as nvarchar(max)	
as 

begin 

 if (select COUNT(*) from Brands where Id = @Id) = 0 
    begin 
		insert into Brands(Id,BrandName,Description,CreatedOn,UpdatedOn) values
		(@Id,@BrandName,@Description, GETDATE(), GETDATE())
	end 
 else 
   begin
		update Brands set BrandName = @BrandName, Description = @Description,
		CreatedOn = GETDATE(),
		UpdatedOn = GETDATE()
		where Id = @Id 
   end


end 
GO
/****** Object:  StoredProcedure [dbo].[Categories_Delete]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Categories_Delete]
	@Id as uniqueidentifier
as 

begin 
	delete from Categories where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[Categories_GetAll]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Categories_GetAll]

as 

begin
	select * from Categories
end
GO
/****** Object:  StoredProcedure [dbo].[Categories_Save]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Categories_Save]
 @Id as uniqueidentifier,
 @Category as nvarchar(200),
 @Description as nvarchar(max)
as

begin 

 if (select count(*) from Categories where Id = @Id ) = 0 
    begin
	  insert into Categories(Id,Category,Description,CreatedOn,UpdatedOn) values
	  (@Id, @Category, @Description, GETDATE(), GETDATE())
	end
 else
   begin
     update Categories set Category = @Category, Description = @Description, UpdatedOn = getdate()  where Id = @Id
   end

end
GO
/****** Object:  StoredProcedure [dbo].[Logs_Create]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Logs_Create]
	@CloverId as nvarchar(max),
	@Description as nvarchar(max)
 as 

 begin

  INSERT INTO dbo.Logs (CloverId
      ,Description
      ,DateCreated) VALUES (@CloverId,@Description, GETDATE())

end
GO
/****** Object:  StoredProcedure [dbo].[Measures_Delete]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Measures_Delete]
	@Id as uniqueidentifier

as 

begin 
	delete from Measures where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[Measures_GetAll]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Measures_GetAll]
as 

begin 
	select * from Measures
end
GO
/****** Object:  StoredProcedure [dbo].[Measures_Save]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Measures_Save]
	@Id as uniqueidentifier,
	@UnitOfMeasure as nvarchar(200),
	@Description as nvarchar(max)

as 

begin 
	
	if (select count(*) from Measures where Id = @Id) = 0 
		begin
		  insert into Measures(Id, UnitOfMeasure, Description, CreatedOn, UpdatedOn)  values
		  (@Id, @UnitOfMeasure, @Description, getdate(), getdate())
		end
	else 
		begin
		  update Measures set UnitOfMeasure = @UnitOfMeasure, Description = @Description, UpdatedOn = GETDATE()  where Id = @Id
		end
end
GO
/****** Object:  StoredProcedure [dbo].[Products_Delete]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[Products_Delete]
	@Id as uniqueidentifier

  as 
  begin 
     update Products set IsDeleted = 1 where Id = @Id
  end
GO
/****** Object:  StoredProcedure [dbo].[Products_GetAll]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[Products_GetAll]

  as 

  begin 
	
   select a.Id, a.ProductName, a.Description, a.Quantity, a.SKU, b.BrandName as Brand, c.Category, 
   d.UnitOfMeasure, a.UnitPrice, a.CreatedOn, a.UpdatedOn, a.IsDeleted, a.Category as CategoryId, a.Brand as BrandId, a.UnitOfMeasure as UOMId from [dbo].[Products] a 
   inner join [dbo].[Brands] b on (a.Brand = b.Id)
   inner join [dbo].[Categories] c on (a.Category = c.Id)
   inner join [dbo].[Measures] d on (a.UnitOfMeasure = d.Id) 
   WHERE a.IsDeleted = 0 OR a.IsDeleted = null Order BY a.UpdatedOn DESC

  end 
GO
/****** Object:  StoredProcedure [dbo].[Products_GetById]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create procedure [dbo].[Products_GetById]
   @Id as uniqueidentifier

   as 

   begin 

   select a.Id, a.ProductName, a.Description, a.Quantity, a.SKU, b.BrandName as Brand, c.Category, d.UnitOfMeasure, a.UnitPrice, a.CreatedOn, a.UpdatedOn, a.IsDeleted from [dbo].[Products] a 
   inner join [dbo].[Brands] b on (a.Brand = b.Id)
   inner join [dbo].[Categories] c on (a.Category = c.Id)
   inner join [dbo].[Measures] d on (a.UnitOfMeasure = d.Id) 
   WHERE a.Id = @Id

   end
GO
/****** Object:  StoredProcedure [dbo].[Products_Save]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[Products_Save]
    @Id as uniqueidentifier
	,@ProductName as nvarchar(200)
	,@Description as nvarchar(max)
	,@Quantity as int
	,@SKU as nvarchar(200)
	,@Brand as uniqueidentifier
	,@Category as uniqueidentifier
	,@UnitOfMeasure as uniqueidentifier
	,@UnitPrice as decimal(18,2)
  as 

  begin 
	if (select count(*) from Products where Id = @Id ) = 0
	   begin
			insert into Products
			(Id
			,ProductName
			,Description
			,Quantity
			,SKU
			,Brand
			,Category
			,UnitOfMeasure
			,UnitPrice
			,CreatedOn
			,UpdatedOn
			,IsDeleted) values 
			(@Id
			,@ProductName
			,@Description
			,@Quantity
			,@SKU
			,@Brand
			,@Category
			,@UnitOfMeasure
			,@UnitPrice
			,getdate()
			,getdate()
			,0)
	   end
	else 
	  begin
	     update
		   Products
		 set
		    ProductName = @ProductName
			,Description = @Description
			,Quantity = @Quantity
			,SKU = @SKU
			,Brand = @Brand
			,Category = @Category
			,UnitOfMeasure = @UnitOfMeasure
			,UnitPrice = @UnitPrice
			,UpdatedOn = getdate()
		 where Id = @Id
	  end
  end 
GO
/****** Object:  StoredProcedure [dbo].[Products_SearchPagination]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  -- Products_SearchPagination 'sportMotor', 1, 10
  CREATE PROCEDURE [dbo].[Products_SearchPagination]
	@Keyword as nvarchar(max),
	@PageNo int,	
	@PageSize int

  AS 

  BEGIN 

	declare @StartRow as int = ((@PageNo -1)*@PageSize) + 1;
	declare @EndRow as int =  @PageNo * @PageSize;

	with cte_results as (

	select a.Id, a.ProductName, a.Description, a.Quantity, a.SKU, b.BrandName as Brand, c.Category, d.UnitOfMeasure, a.UnitPrice, a.CreatedOn, a.UpdatedOn, a.IsDeleted,
	a.Category as CategoryId, a.Brand as BrandId, a.UnitOfMeasure as UOMId from [dbo].[Products] a 
	inner join [dbo].[Brands] b on (a.Brand = b.Id)
	inner join [dbo].[Categories] c on (a.Category = c.Id)
	inner join [dbo].[Measures] d on (a.UnitOfMeasure = d.Id) 
	WHERE
	a.Id like '%' + @Keyword + '%'
	OR 
	a.ProductName like '%' + @Keyword + '%'
	OR 
	a.Quantity like '%' + @Keyword + '%'
	OR 
	a.Description like '%' + @Keyword + '%'
	OR
	b.BrandName like '%' + @Keyword + '%'
	
   ),
   productPaginationCTEResult as (
	
	  SELECT DISTINCT ROW_NUMBER() over(order by Id) as SrNo, * FROM cte_results WHERE IsDeleted = 0 OR IsDeleted = null
   )

  SELECT *, @PageNo as PageNumber,
		(select  top 1 (Count(*) OVER() + @PageSize - 1)/@PageSize from cte_results) as TotalPages FROM productPaginationCTEResult 
  WHERE SrNo between @StartRow and @EndRow
	
  END 
GO
/****** Object:  StoredProcedure [dbo].[Users_Delete]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_Delete]
@InstallationId as UNIQUEIDENTIFIER,
@UserId as UNIQUEIDENTIFIER

as 

BEGIN

--EXECUTE AS USER = CONVERT(nvarchar(50), @InstallationId);

UPDATE [dbo].[Users] SET IsDeleted = 1 WHERE InstallationId = @InstallationId
 AND UserId = @UserId

-- Revert;
 
END 
GO
/****** Object:  StoredProcedure [dbo].[Users_Get]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_Get]
@InstallationId as UNIQUEIDENTIFIER

as 

BEGIN

--EXECUTE AS USER = CONVERT(nvarchar(50), @InstallationId);

 SELECT * FROM [dbo].[Users] WHERE InstallationId = @InstallationId

-- Revert;
 
END 
GO
/****** Object:  StoredProcedure [dbo].[Users_GetById]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_GetById]
@InstallationId as UNIQUEIDENTIFIER,
@UserId as UNIQUEIDENTIFIER

as 

BEGIN

--EXECUTE AS USER = CONVERT(nvarchar(50), @InstallationId);

 SELECT * FROM [dbo].[Users] WHERE InstallationId = @InstallationId
 AND UserId = @UserId

-- Revert;
 
END 
GO
/****** Object:  StoredProcedure [dbo].[Users_Save]    Script Date: 26/02/2023 10:37:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_Save]
@UserId as uniqueidentifier
,@FirstName as nvarchar(200) = ''
,@LastName  as nvarchar(200) = ''
,@EmailAddress as nvarchar(200) = ''
,@Phone as nvarchar(200) = ''
,@Status as nvarchar(50) = ''
,@Password as nvarchar(200) = ''
,@Token as uniqueidentifier
,@InstallationId as uniqueidentifier
,@Gender as nvarchar(50) = ''
,@CreatedOn as datetime
,@UpdateOn as datetime

as 

BEGIN

--EXECUTE AS USER = CONVERT(nvarchar(50), @InstallationId);

if (select count(*) from Users where UserId = @UserId) = 0
   begin
      insert into Users(UserId
      ,FirstName
      ,LastName
      ,EmailAddress
      ,Phone
      ,Status
      ,Password
      ,Token
      ,InstallationId
      ,Gender
      ,CreatedOn
      ,UpdateOn) values (@UserId
      ,@FirstName
      ,@LastName
      ,@EmailAddress
      ,@Phone
      ,@Status
      ,@Password
      ,@Token
      ,@InstallationId
      ,@Gender
      ,@CreatedOn
      ,@UpdateOn)
   end
else 
  begin 
	update Users set	       
	   FirstName = @FirstName
      ,LastName = @LastName
      ,EmailAddress = @EmailAddress
      ,Phone = @Phone
      ,Status = @Status
      ,Gender = @Gender
      ,CreatedOn = @CreatedOn
      ,UpdateOn = @UpdateOn
	where UserId = @UserId and InstallationId = @InstallationId
   end


-- Revert;
 
END 
GO
