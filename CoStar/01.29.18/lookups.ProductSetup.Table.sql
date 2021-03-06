USE [RevPro]
GO
/****** Object:  Table [lookups].[ProductSetup]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [lookups].[ProductSetup](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[CoStarBrandID] [tinyint] NOT NULL,
	[IgnoreFlag] [bit] NOT NULL,
	[AllowInSalesOrderOutput] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
