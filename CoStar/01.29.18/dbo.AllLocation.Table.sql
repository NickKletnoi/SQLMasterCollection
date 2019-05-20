USE [RevPro]
GO
/****** Object:  Table [dbo].[AllLocation]    Script Date: 1/29/2018 3:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllLocation](
	[LocationID] [int] NULL,
	[LocationName] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [int] NULL,
	[CurrentAEContactID] [int] NULL
) ON [PRIMARY]

GO
