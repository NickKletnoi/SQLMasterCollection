USE [RevPro]
GO
/****** Object:  Table [dbo].[Active_SOFile]    Script Date: 1/29/2018 3:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Active_SOFile](
	[ContractID] [int] NULL,
	[LineItemID] [int] NULL,
	[StatusFlg] [char](1) NULL,
	[AuditDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [clxActive_SOFileContract]    Script Date: 1/29/2018 3:17:39 PM ******/
CREATE CLUSTERED INDEX [clxActive_SOFileContract] ON [dbo].[Active_SOFile]
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
