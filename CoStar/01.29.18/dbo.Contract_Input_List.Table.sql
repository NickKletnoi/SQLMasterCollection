USE [RevPro]
GO
/****** Object:  Table [dbo].[Contract_Input_List]    Script Date: 1/29/2018 3:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contract_Input_List](
	[ContractID] [int] NULL,
	[BundleFlg] [char](1) NULL,
	[StatusFlg] [char](1) NULL,
	[AuditDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
