USE [RevPro]
GO
/****** Object:  Table [lookups].[DerivedProduct]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [lookups].[DerivedProduct](
	[DerivedProductID] [int] NOT NULL,
	[ProductGroup] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
