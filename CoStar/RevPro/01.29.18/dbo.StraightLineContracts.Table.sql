USE [RevPro]
GO
/****** Object:  Table [dbo].[StraightLineContracts]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StraightLineContracts](
	[ContractID] [int] NULL,
	[Waterfall_Amt] [money] NULL,
	[Waterfall_Stub_Amt] [money] NULL,
	[Contract_Final_Amt] [money] NULL,
	[StraightLine_Flg] [bit] NULL,
	[Cnt] [int] NULL
) ON [PRIMARY]

GO
