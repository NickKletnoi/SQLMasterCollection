USE [RevPro]
GO
/****** Object:  Table [dbo].[vwMEAPricing]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vwMEAPricing](
	[MEA] [varchar](100) NOT NULL,
	[ComponentType] [varchar](50) NULL,
	[ComponentID] [int] NULL,
	[DerivedProductID] [int] NULL,
	[ProductSubTypeID] [int] NULL,
	[ProductSubTypeText] [varchar](100) NULL,
	[SKU] [varchar](100) NULL,
	[ComponentPrice] [decimal](15, 2) NULL,
	[AttributeType] [varchar](50) NULL,
	[AttributeValue] [decimal](15, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
