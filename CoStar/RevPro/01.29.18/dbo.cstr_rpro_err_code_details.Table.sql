USE [RevPro]
GO
/****** Object:  Table [dbo].[cstr_rpro_err_code_details]    Script Date: 1/29/2018 3:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cstr_rpro_err_code_details](
	[SEQ_NO] [int] NOT NULL,
	[DW_STAGE_ID] [int] NULL,
	[RPRO_STAGE_ID] [int] NULL,
	[TRANS_TYPE] [varchar](50) NULL,
	[ERROR_CODE] [varchar](200) NULL,
	[ERROR_LEVEL] [varchar](200) NULL,
	[ERROR_COLUMN] [varchar](250) NULL,
	[ERROR_VALUE] [varchar](250) NULL,
	[CREATION_DATE] [date] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[LAST_UPDATE_BY] [varchar](50) NULL,
	[LAST_UPDATE_DATE] [date] NULL,
	[ATTRIBUTE1] [varchar](250) NULL,
	[ATTRIBUTE2] [varchar](250) NULL,
	[ATTRIBUTE3] [varchar](250) NULL,
	[ATTRIBUTE4] [varchar](250) NULL,
	[ATTRIBUTE5] [varchar](250) NULL,
	[BATCH_ID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
