USE [master]
GO
/****** Object:  Database [ScientificAndProductionEnterpriseParfanova]    Script Date: 15.05.2024 15:19:22 ******/
CREATE DATABASE [ScientificAndProductionEnterpriseParfanova]
GO
USE [ScientificAndProductionEnterpriseParfanova]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 15.05.2024 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractsId] [int] IDENTITY(1,1) NOT NULL,
	[NameOfTheOrganization] [nvarchar](100) NOT NULL,
	[DateOfConclusionOfTheContract] [date] NOT NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ContractsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 15.05.2024 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizations](
	[OrganizationsId] [int] IDENTITY(1,1) NOT NULL,
	[ContractsId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Telephone] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[WebsiteAddress] [nvarchar](100) NULL,
 CONSTRAINT [PK_Organizations] PRIMARY KEY CLUSTERED 
(
	[OrganizationsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 15.05.2024 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[FullNameOfTheEmployee] [nvarchar](100) NOT NULL,
	[Post] [nvarchar](100) NOT NULL,
	[Salary] [money] NOT NULL,
	[Prize] [money] NOT NULL,
	[Month] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplies]    Script Date: 15.05.2024 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplies](
	[SuppliesId] [int] IDENTITY(1,1) NOT NULL,
	[ContractsId] [int] NOT NULL,
	[TypeOfEquipment] [nvarchar](100) NOT NULL,
	[ACommentToTheUserAboutTheOperationOfTheSoftware] [nvarchar](100) NULL,
	[StaffId] [int] NOT NULL,
 CONSTRAINT [PK_Supplies] PRIMARY KEY CLUSTERED 
(
	[SuppliesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([ContractsId], [NameOfTheOrganization], [DateOfConclusionOfTheContract]) VALUES (1, N'123', CAST(N'2024-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Organizations] ON 

INSERT [dbo].[Organizations] ([OrganizationsId], [ContractsId], [CountryId], [City], [Address], [Telephone], [Email], [WebsiteAddress]) VALUES (1, 1, 213, N'123', N'123', N'213', N'123', N'123')
SET IDENTITY_INSERT [dbo].[Organizations] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([StaffId], [DepartmentId], [FullNameOfTheEmployee], [Post], [Salary], [Prize], [Month]) VALUES (1, 123, N'213', N'213', 123.0000, 123.0000, N'213')
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplies] ON 

INSERT [dbo].[Supplies] ([SuppliesId], [ContractsId], [TypeOfEquipment], [ACommentToTheUserAboutTheOperationOfTheSoftware], [StaffId]) VALUES (1, 1, N'213', N'123', 1)
SET IDENTITY_INSERT [dbo].[Supplies] OFF
GO
ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_Contracts] FOREIGN KEY([ContractsId])
REFERENCES [dbo].[Contracts] ([ContractsId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_Contracts]
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD  CONSTRAINT [FK_Supplies_Contracts] FOREIGN KEY([ContractsId])
REFERENCES [dbo].[Contracts] ([ContractsId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Supplies] CHECK CONSTRAINT [FK_Supplies_Contracts]
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD  CONSTRAINT [FK_Supplies_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Supplies] CHECK CONSTRAINT [FK_Supplies_Staff]
GO
USE [master]
GO
ALTER DATABASE [ScientificAndProductionEnterpriseParfanova] SET  READ_WRITE 
GO
