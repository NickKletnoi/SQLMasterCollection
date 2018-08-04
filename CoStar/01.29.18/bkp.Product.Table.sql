USE [RevPro]
GO
/****** Object:  Table [bkp].[Product]    Script Date: 1/29/2018 3:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [bkp].[Product](
	[ProductID] [int] NULL,
	[ProductDesc] [varchar](150) NULL,
	[SkuPart] [varchar](50) NULL,
	[SKUID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
