USE [RevPro]
GO
/****** Object:  Table [rev].[Sku]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rev].[Sku](
	[SKUID] [int] NULL,
	[SkuName] [varchar](150) NULL,
	[ProductID] [int] NULL,
	[MarketID] [char](3) NULL,
	[UserCount] [int] NULL,
	[CustomerType] [int] NULL,
	[Date] [date] NULL,
	[Amount] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
