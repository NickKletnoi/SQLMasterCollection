USE [RevenueProcessing]
GO

/****** Object:  Table dbo.MEA_History    Script Date: 10/5/2016 11:25:49 AM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE ##MEA_History(
	[MEA_HistoryID] int identity(1,1) NOT NULL, 
	[ContractID] int NOT NULL,
	[MEA] varchar(100) NULL,
	[MEA_Date] datetime NULL,
	[StartDate] date,
	[EndDate] date,
	[IsActive] bit NOT NULL
 CONSTRAINT [pk_MEA_HistoryID_ContractID] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
	, [MEA_HistoryID] ASC
	--[AdjustedEventDate] ASC,
	--[EventDate] ASC,
	--[RevenueItemType] ASC,
	--[SequenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Index [IX_RevenueItemRaw_RevenueRunID]    Script Date: 10/5/2016 11:25:49 AM ******/
CREATE NONCLUSTERED INDEX [IX_MEA_History_ContractID_MEA] ON ##MEA_History
(
	[ContractID] ASC
	, [MEA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
--select * from ##MEA_History
/*
alter table "##MEA_History"
drop constraint "pk_TempActiveLines_LineitemID_IdentityKey"

drop table ##MEA_History
*/

--select * from ##MEA_History where LineItemID = 