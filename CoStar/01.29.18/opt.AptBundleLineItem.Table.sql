USE [RevPro]
GO
/****** Object:  Table [opt].[AptBundleLineItem]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [opt].[AptBundleLineItem](
	[AptBundleLineItemID] [int] NOT NULL,
	[AptBundleID] [int] NOT NULL,
	[LineItemID] [int] NOT NULL
) ON [PRIMARY]

GO
