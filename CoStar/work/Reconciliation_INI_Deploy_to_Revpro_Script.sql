CREATE SCHEMA [rcl]
GO
/****** Object:  Table [rcl].[Reconciliation_Archive]    Script Date: 12/18/2017 5:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [rcl].[Reconciliation_Archive](
	[ReconciliationRunID] [varchar](max) NULL,
	[ReconciliationPeriod] [varchar](500) NULL,
	[ReconciliationAreaName] [varchar](500) NULL,
	[SourceTableName] [varchar](100) NULL,
	[SourceDollarValueColumnName] [varchar](100) NULL,
	[SourceCountValueColumnName] [varchar](100) NULL,
	[SourceDateFromColumnName] [varchar](100) NULL,
	[SourceDateToColumnName] [varchar](100) NULL,
	[SourceServer] [varchar](100) NULL,
	[SourceDatabase] [varchar](100) NULL,
	[SourceDollarAmt] [money] NULL,
	[SourceRowCount] [int] NULL,
	[TargetTableName] [varchar](100) NULL,
	[TargetDollarValueColumnName] [varchar](100) NULL,
	[TargetCountValueColumnName] [varchar](100) NULL,
	[TargetDateFromColumnName] [varchar](100) NULL,
	[TargetDateToColumnName] [varchar](100) NULL,
	[TargetServer] [varchar](100) NULL,
	[TargetDatabase] [varchar](100) NULL,
	[TargetDollarAmt] [money] NULL,
	[TargetRowCount] [int] NULL,
	[LastRunDate] [datetime] NULL,
	[ActiveFlg] [char](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rcl].[Reconciliation_Master]    Script Date: 12/18/2017 5:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rcl].[Reconciliation_Master](
	[ReconciliationPeriod] [varchar](500) NULL,
	[ReconciliationAreaName] [varchar](500) NULL,
	[SourceTableName] [varchar](100) NULL,
	[SourceDollarValueColumnName] [varchar](100) NULL,
	[SourceCountValueColumnName] [varchar](100) NULL,
	[SourceDateFromColumnName] [varchar](100) NULL,
	[SourceDateToColumnName] [varchar](100) NULL,
	[SourceServer] [varchar](100) NULL,
	[SourceDatabase] [varchar](100) NULL,
	[SourceDollarAmt] [money] NULL,
	[SourceRowCount] [int] NULL,
	[TargetTableName] [varchar](100) NULL,
	[TargetDollarValueColumnName] [varchar](100) NULL,
	[TargetCountValueColumnName] [varchar](100) NULL,
	[TargetDateFromColumnName] [varchar](100) NULL,
	[TargetDateToColumnName] [varchar](100) NULL,
	[TargetServer] [varchar](100) NULL,
	[TargetDatabase] [varchar](100) NULL,
	[TargetDollarAmt] [money] NULL,
	[TargetRowCount] [int] NULL,
	[LastRunDate] [datetime] NULL,
	[ActiveFlg] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rcl].[Reconciliation_Period]    Script Date: 12/18/2017 5:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [rcl].[Reconciliation_Period](
	[ReconciliationPeriod] [varchar](500) NULL,
	[ReconciliationPeriodName] [varchar](500) NULL,
	[AccountingStartDate] [varchar](100) NULL,
	[AccountingEndDate] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [rcl].[vw_Reconciliation]    Script Date: 12/18/2017 5:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [rcl].[vw_Reconciliation]
AS
SELECT [ReconciliationRunID]
      ,[ReconciliationPeriod]
      ,[ReconciliationAreaName]
      ,[SourceTableName]
      ,[SourceDollarValueColumnName]
      ,[SourceCountValueColumnName]
      ,[SourceDateFromColumnName]
      ,[SourceDateToColumnName]
      ,[SourceServer]
      ,[SourceDatabase]
      ,[SourceDollarAmt]
      ,[SourceRowCount]
      ,[TargetTableName]
      ,[TargetDollarValueColumnName]
      ,[TargetCountValueColumnName]
      ,[TargetDateFromColumnName]
      ,[TargetDateToColumnName]
      ,[TargetServer]
      ,[TargetDatabase]
      ,[TargetDollarAmt]
      ,[TargetRowCount]
      ,[LastRunDate]
      ,[ActiveFlg]
  FROM [rcl].[Reconciliation_Archive]



GO
INSERT [rcl].[Reconciliation_Archive] ([ReconciliationRunID], [ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'2017.08.30.13:49:19-1', N'201708', N'Sales Order (SO)', N'dbo.LineItem', N'DiscountedMonthlyPrice', N'ContractID', N'[CurrentTermStartDate]', N'[TermEndDate]', N'CS01SQLWDEV435\VSOE', N'Staging', 52345879.0000, 36056, N'dbo.Sales_Order_Feed', N'DISCOUNT_AMOUNT', N'SALES_ORDER_ID', N'RULE_START_DATE', N'RULE_END_DATE', N'DCSQLPRD104', N'Enterprise', 37348869.0000, 27737, CAST(N'2017-08-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Archive] ([ReconciliationRunID], [ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'2017.08.30.13:49:19-1', N'201708', N'Invoice (INV)', N'dbo.[RIG$Sales Invoice Line]', N'Amount', N'[Document No_]', N'[Posting Date]', N'[Posting Date]', N'CS01SQLWDEV435\VSOE', N'Staging', 43345879.0000, 48834, N'dbo.Invoice_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 32370879.0000, 29622, CAST(N'2017-08-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Archive] ([ReconciliationRunID], [ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'2017.08.30.13:49:19-1', N'201708', N'Credit Memo (CM)', N'dbo.[RIG$Sales Cr_Memo Line]', N'Amount', N'[Document No_]', N'[Posting Date]', N'[Posting Date]', N'CS01SQLWDEV435\VSOE', N'Staging', 7890098.0000, 1234, N'dbo.Credit_Memo_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 5687998.0000, 1234, CAST(N'2017-08-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Archive] ([ReconciliationRunID], [ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'2017.09.30.09:40:21-2', N'201709', N'Sales Order (SO)', N'dbo.LineItem', N'DiscountedMonthlyPrice', N'ContractID', N'[CurrentTermStartDate]', N'[TermEndDate]', N'CS01SQLWDEV435\VSOE', N'Staging', 53445479.0000, 37156, N'dbo.Sales_Order_Feed', N'DISCOUNT_AMOUNT', N'SALES_ORDER_ID', N'RULE_START_DATE', N'RULE_END_DATE', N'DCSQLPRD104', N'Enterprise', 38342869.0000, 28825, CAST(N'2017-09-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Archive] ([ReconciliationRunID], [ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'2017.09.30.09:40:21-2', N'201709', N'Invoice (INV)', N'dbo.[RIG$Sales Invoice Line]', N'Amount', N'[Document No_]', N'[Posting Date]', N'[Posting Date]', N'CS01SQLWDEV435\VSOE', N'Staging', 43345879.0000, 49567, N'dbo.Invoice_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 33370879.0000, 32193, CAST(N'2017-09-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Archive] ([ReconciliationRunID], [ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'2017.09.30.09:40:21-2', N'201709', N'Credit Memo (CM)', N'dbo.[RIG$Sales Cr_Memo Line]', N'Amount', N'[Document No_]', N'[Posting Date]', N'[Posting Date]', N'CS01SQLWDEV435\VSOE', N'Staging', 7890098.0000, 1567, N'dbo.Credit_Memo_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 5786798.0000, 876, CAST(N'2017-09-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Archive] ([ReconciliationRunID], [ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'2017.10.30.15:42:22-1', N'201710', N'Sales Order (SO)', N'dbo.LineItem', N'DiscountedMonthlyPrice', N'ContractID', N'[CurrentTermStartDate]', N'[TermEndDate]', N'CS01SQLWDEV435\VSOE', N'Staging', 52345879.0000, 38123, N'dbo.Sales_Order_Feed', N'DISCOUNT_AMOUNT', N'SALES_ORDER_ID', N'RULE_START_DATE', N'RULE_END_DATE', N'DCSQLPRD104', N'Enterprise', 39348869.0000, 29812, CAST(N'2017-11-01 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Archive] ([ReconciliationRunID], [ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'2017.10.30.15:42:22-1', N'201710', N'Invoice (INV)', N'dbo.[RIG$Sales Invoice Line]', N'Amount', N'[Document No_]', N'[Posting Date]', N'[Posting Date]', N'CS01SQLWDEV435\VSOE', N'Staging', 43345879.0000, 51254, N'dbo.Invoice_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 32370879.0000, 33768, CAST(N'2017-11-01 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Archive] ([ReconciliationRunID], [ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'2017.10.30.15:42:22-1', N'201710', N'Credit Memo (CM)', N'dbo.[RIG$Sales Cr_Memo Line]', N'Amount', N'[Document No_]', N'[Posting Date]', N'[Posting Date]', N'CS01SQLWDEV435\VSOE', N'Staging', 7890098.0000, 1686, N'dbo.Credit_Memo_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 6387848.0000, 1124, CAST(N'2017-11-01 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Master] ([ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'201708', N'Sales Order (SO)', N'dbo.LineItem', N'DiscountedMonthlyPrice', N'ContractID', N'[CurrentTermStartDate]', N'[TermEndDate]', N'[DCSQLDEV135\ACCT]', N'Staging', NULL, NULL, N'dbo.Sales_Order_Feed', N'DISCOUNT_AMOUNT', N'SALES_ORDER_ID', N'RULE_START_DATE', N'RULE_END_DATE', N'DCSQLPRD104', N'Enterprise', NULL, NULL, CAST(N'2017-08-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Master] ([ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'201708', N'Invoice (INV)', N'dbo.[RIG$Sales Invoice Line]', N'Amount', N'[Document No_]', N'[Posting Date] ', N'[Posting Date] ', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', NULL, NULL, N'dbo.Invoice_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', NULL, NULL, CAST(N'2017-08-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Master] ([ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'201708', N'Credit Memo (CM)', N'dbo.[RIG$Sales Cr_Memo Line]', N'Amount', N'[Document No_]', N'[Posting Date] ', N'[Posting Date] ', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', NULL, NULL, N'dbo.Credit_Memo_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', NULL, NULL, CAST(N'2017-08-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Master] ([ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'201709', N'Sales Order (SO)', N'dbo.LineItem', N'DiscountedMonthlyPrice', N'ContractID', N'[CurrentTermStartDate]', N'[TermEndDate]', N'[DCSQLDEV135\ACCT]', N'Staging', 53445479.0000, 37156, N'dbo.Sales_Order_Feed', N'DISCOUNT_AMOUNT', N'SALES_ORDER_ID', N'RULE_START_DATE', N'RULE_END_DATE', N'DCSQLPRD104', N'Enterprise', 38342869.0000, 28825, CAST(N'2017-09-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Master] ([ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'201709', N'Invoice (INV)', N'dbo.[RIG$Sales Invoice Line]', N'Amount', N'[Document No_]', N'[Posting Date] ', N'[Posting Date] ', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 43345879.0000, 49567, N'dbo.Invoice_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 33370879.0000, 32193, CAST(N'2017-09-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Master] ([ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'201709', N'Credit Memo (CM)', N'dbo.[RIG$Sales Cr_Memo Line]', N'Amount', N'[Document No_]', N'[Posting Date] ', N'[Posting Date] ', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 7890098.0000, 1567, N'dbo.Credit_Memo_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 5786798.0000, 876, CAST(N'2017-09-30 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Master] ([ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'201710', N'Sales Order (SO)', N'dbo.LineItem', N'DiscountedMonthlyPrice', N'ContractID', N'[CurrentTermStartDate]', N'[TermEndDate]', N'[DCSQLDEV135\ACCT]', N'Staging', 52345879.0000, 38123, N'dbo.Sales_Order_Feed', N'DISCOUNT_AMOUNT', N'SALES_ORDER_ID', N'RULE_START_DATE', N'RULE_END_DATE', N'DCSQLPRD104', N'Enterprise', 39348869.0000, 29812, CAST(N'2017-11-01 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Master] ([ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'201710', N'Invoice (INV)', N'dbo.[RIG$Sales Invoice Line]', N'Amount', N'[Document No_]', N'[Posting Date] ', N'[Posting Date] ', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 43345879.0000, 51254, N'dbo.Invoice_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 32370879.0000, 33768, CAST(N'2017-11-01 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Master] ([ReconciliationPeriod], [ReconciliationAreaName], [SourceTableName], [SourceDollarValueColumnName], [SourceCountValueColumnName], [SourceDateFromColumnName], [SourceDateToColumnName], [SourceServer], [SourceDatabase], [SourceDollarAmt], [SourceRowCount], [TargetTableName], [TargetDollarValueColumnName], [TargetCountValueColumnName], [TargetDateFromColumnName], [TargetDateToColumnName], [TargetServer], [TargetDatabase], [TargetDollarAmt], [TargetRowCount], [LastRunDate], [ActiveFlg]) VALUES (N'201710', N'Credit Memo (CM)', N'dbo.[RIG$Sales Cr_Memo Line]', N'Amount', N'[Document No_]', N'[Posting Date] ', N'[Posting Date] ', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 7890098.0000, 1686, N'dbo.Credit_Memo_Feed', N'EXT_SELL_PRICE', N'INVOICE_ID', N'INVOICE_DATE', N'INVOICE_DATE', N'[DCSQLDEV135\ACCT]', N'[NAVISIONDB260_PRD]', 6387848.0000, 1124, CAST(N'2017-11-01 00:00:00.000' AS DateTime), N'Y')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201701', N'Jan 2017', N'2017-01-01', N'2017-01-31')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201702', N'Feb 2017', N'2017-02-01', N'2017-02-28')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201703', N'Mar 2017', N'2017-03-01', N'2017-03-31')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201704', N'April 2017', N'2017-04-01', N'2017-04-30')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201705', N'May 2017', N'2017-05-01', N'2017-05-31')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201706', N'June 2017', N'2017-06-01', N'2017-06-30')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201707', N'July 2017', N'2017-07-01', N'2017-07-31')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201708', N'Aug 2017', N'2017-08-01', N'2017-08-31')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201709', N'Sept 2017', N'2017-09-01', N'2017-09-30')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201710', N'Oct 2017', N'2017-10-01', N'2017-10-31')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201711', N'Nov 2017', N'2017-11-01', N'2017-11-30')
GO
INSERT [rcl].[Reconciliation_Period] ([ReconciliationPeriod], [ReconciliationPeriodName], [AccountingStartDate], [AccountingEndDate]) VALUES (N'201712', N'Dec 2017', N'2017-12-01', N'2017-12-31')
GO
/****** Object:  StoredProcedure [rcl].[usp_ReconciliationRpt]    Script Date: 12/18/2017 5:46:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC [dbo].[ReconciliationRpt] 'SOURCE_TO_DW'

CREATE PROCEDURE [rcl].[usp_ReconciliationRpt]
@RP VARCHAR(50)
AS

 DECLARE @update_sql_head VARCHAR(MAX)='UPDATE RM SET RM.[LastRunDate]=GETDATE(), RM.[SourceRowCount]='
 DECLARE @update_sql_final VARCHAR(MAX)=''

  DECLARE @CURRENT_ReconciliationAreaName VARCHAR(150)

 DECLARE @CURRENT_SourceTableName VARCHAR(150)
 DECLARE @CURRENT_SourceServer VARCHAR(150)
 DECLARE @CURRENT_SourceDatabase VARCHAR(150)

 DECLARE @CURRENT_TargetTableName VARCHAR(150)
 DECLARE @CURRENT_TargetServer VARCHAR(150)
 DECLARE @CURRENT_TargetDatabase VARCHAR(150)
 
 DECLARE @CURRENT_SourceDollarValueColumnName VARCHAR(150)
 DECLARE @CURRENT_TargetDollarValueColumnName VARCHAR(150)

 DECLARE @CURRENT_SRC VARCHAR(1000)=''
 DECLARE @CURRENT_TGT VARCHAR(1000)=''


UPDATE RM
SET 
RM.[SourceRowCount]=NULL,
RM.[TargetRowCount]=NULL,
RM.[SourceDollarAmt]=NULL,
RM.[TargetDollarAmt]=NULL
FROM [rcl].[Reconciliation_Master] RM WHERE RM.[ReconciliationPeriod]=@RP AND [ActiveFlg]='Y';


DECLARE C CURSOR FOR
 
SELECT 
[ReconciliationAreaName],
[SourceServer],
[SourceDatabase],
[SourceTableName],
[SourceDollarValueColumnName],
[TargetServer],
[TargetDatabase],
[TargetTableName],
[TargetDollarValueColumnName]
FROM [rcl].[Reconciliation_Master] WHERE [ReconciliationPeriod]=@RP AND [ActiveFlg]='Y'
 
  
 OPEN C
 FETCH C into 
 @CURRENT_ReconciliationAreaName,
 @CURRENT_SourceServer,
 @CURRENT_SourceDatabase,
 @CURRENT_SourceTableName,
 @CURRENT_SourceDollarValueColumnName,
 @CURRENT_TargetServer,
 @CURRENT_TargetDatabase,
 @CURRENT_TargetTableName,
 @CURRENT_TargetDollarValueColumnName

 WHILE @@FETCH_STATUS = 0
 BEGIN
   
   SET @CURRENT_SRC = @CURRENT_SourceServer + '.'+ @CURRENT_SourceDatabase + '.' + @CURRENT_SourceTableName
   SET @CURRENT_TGT = @CURRENT_TargetServer + '.'+ @CURRENT_TargetDatabase + '.' + @CURRENT_TargetTableName
   SET @update_sql_final = @update_sql_head + 
   '(SELECT COUNT(*) FROM ' + @CURRENT_SRC + '), RM.[TargetRowCount]='+ 
   '(SELECT COUNT(*) FROM ' + @CURRENT_TGT + '), RM.[SourceDollarAmt]='+ 
   '(SELECT ISNULL(SUM(' + @CURRENT_SourceDollarValueColumnName +'),0) FROM ' + @CURRENT_SRC +'), RM.[TargetDollarAmt]=' +
   '(SELECT ISNULL(SUM(' + @CURRENT_TargetDollarValueColumnName +'),0) FROM ' + @CURRENT_TGT +') ' +
   'FROM  [rcl].[Reconciliation_Master] RM  WHERE RM.[ReconciliationPeriod]=''' +  @RP + ''' AND RM.[ReconciliationAreaName]='''+@CURRENT_ReconciliationAreaName+'''' 
   		  		      
   PRINT @update_sql_final
   --EXEC (@update_sql_final)

FETCH C into 
 @CURRENT_ReconciliationAreaName,
 @CURRENT_SourceServer,
 @CURRENT_SourceDatabase,
 @CURRENT_SourceTableName,
 @CURRENT_SourceDollarValueColumnName,
 @CURRENT_TargetServer,
 @CURRENT_TargetDatabase,
 @CURRENT_TargetTableName,
 @CURRENT_TargetDollarValueColumnName
 END

 CLOSE C
 DEALLOCATE C


GO
