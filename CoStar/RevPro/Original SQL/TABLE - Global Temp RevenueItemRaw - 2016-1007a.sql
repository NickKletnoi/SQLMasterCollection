USE [RevenueProcessing]
GO

/****** Object:  Table [stg].[RevenueItemRaw]    Script Date: 10/5/2016 11:25:49 AM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE ##RevenueItemRaw(
	[IdentityKey] int identity(1,1) NOT NULL, 
	[MEA] [varchar](100) NULL,
	[RevenueItemType] [varchar](15) NOT NULL,
	[LineItemID] [int] NOT NULL,
	[AdjustedEventDate] [date] NOT NULL,
	[CurrentSKU] [varchar](100) NULL,
	[SequenceNumber] [int] NOT NULL,
	[ActionType] [varchar](100) NULL,
	[SOB_ID] [int] NULL,
	[MonthSequence] [int] NULL,
	[CurrentContractTerm] [int] NULL,
	[DaysInStubMonth] [int] NULL,
	[StubDays] [int] NULL,
	[StubDailyRate] [decimal](38, 20) NULL,
	[HasInvalidStubData] [bit] NULL,
	[StubDailyListRate] [decimal](38, 20) NULL,
	[StubPeriodMonthlyDiscountedRate] [decimal](38, 20) NULL,
	[MEAFirstPricingDetailID] [int] NULL,
	[MEAFirstPricingDetailDiscountedMonthlyPrice] [decimal](38, 20) NULL,
	[EventDate] [date] NOT NULL,
	[RevenueEventType] [varchar](20) NULL,
	[ProductID] [int] NOT NULL,
	[DerivedProductID] [int] NULL,
	[DerivedProductName] [varchar](80) NULL,
	[DerivedSalesUnitID] [int] NULL,
	[AdjustedEventYear] [int] NULL,
	[AdjustedEventMonth] [int] NULL,
	[MEAFirstInvoiceDetailID] [int] NULL,
	[MEAInvoiceFirstDateOfPeriod] [datetime] NULL,
	[MEAInvoiceBillingStartDate] [datetime] NULL,
	[MEAInvoiceBillingStartDateDay] [int] NULL,
	[MEAInvoiceBillingFirstPeriodGross] [decimal](38, 20) NULL,
	[MEAInvoiceBillingFirstPeriodDiscounted] [decimal](38, 20) NULL,
	[MEAInvoiceBillingFirstPeriodStubAmount] [decimal](38, 20) NULL,
	[LineItemTypeID] [int] NOT NULL,
	[BillingStartDate] [date] NULL,
	[CurrentTermStartDate] [date] NULL,
	[BillingMonth] [char](6) NULL,
	[LineItemEndDate] [date] NULL,
	[AptBundleID] [int] NULL,
	[RenewalDate] [smalldatetime] NULL,
	[TermEndDate] [date] NULL,
	[ContractApprovedDate] [date] NULL,
	[ProductName] [varchar](80) NULL,
	[NumberOfUsers] [int] NULL,
	[ContractID] [int] NOT NULL,
	[SalesUnitID] [int] NULL,
	[SalesUnitDesc] [varchar](100) NULL,
	[CoStarBrandID] [tinyint] NULL,
	[BundleID] [int] NULL,
	[ProductCount] [tinyint] NULL,
	[CoStarSubsidiaryID] [tinyint] NOT NULL,
	[SiteLocationID] [int] NOT NULL,
	[MonetaryUnitID] [tinyint] NOT NULL,
	[BillingLocationID] [int] NULL,
	[SiteLocationName] [varchar](50) NULL,
	[LineType] [varchar](15) NULL CONSTRAINT [DF__tmp_ms_xx__LineT__5872D418]  DEFAULT (''),
	[NAVDocumentNo] [varchar](20) NULL,
	[NAVLineNo] [int] NULL,
	[NAVQuantity] [int] NULL,
	[NAVUnitPrice] [money] NULL,
	[NAVAmount] [money] NULL,
	[NAVBillingStartDate] [date] NULL,
	[NAVBillingEndDate] [date] NULL,
	[NAVInvoiceDate] [date] NULL,
	[CRMInvoiceDate] [date] NULL,
	[NAVDescription3] [varchar](100) NULL,
	[CRMInvoiceDetailID] [int] NULL,
	[IsMappedToNAV] [bit] NULL,
	[AEContactID] [int] NULL,
	[LineItemStatusID] [tinyint] NOT NULL,
	[IsCreditCard] [bit] NOT NULL CONSTRAINT [DF__tmp_ms_xx__IsCre__5966F851]  DEFAULT ((0)),
	[DiscountedMonthlyPrice] [decimal](38, 20) NOT NULL CONSTRAINT [DF__tmp_ms_xx__Disco__5A5B1C8A]  DEFAULT ((0)),
	[PriorDiscountedMonthlyPrice] [decimal](38, 20) NOT NULL CONSTRAINT [DF__tmp_ms_xx__Prior__5B4F40C3]  DEFAULT ((0)),
	[DiscountedMonthlyPriceDifference] [decimal](38, 20) NOT NULL CONSTRAINT [DF__tmp_ms_xx__Disco__5C4364FC]  DEFAULT ((0)),
	[EventSource] [varchar](20) NULL,
	[CanBePriced] [bit] NULL CONSTRAINT [DF__tmp_ms_xx__CanBe__5D378935]  DEFAULT ((0)),
	[PricingType] [varchar](100) NULL,
	[ProductMarketTypeID] [tinyint] NULL,
	[CheckOutOk] [int] NULL,
	[MonthsOfFullDiscount] [int] NULL CONSTRAINT [DF__tmp_ms_xx__Month__5E2BAD6E]  DEFAULT ((0)),
	[IsInternContract] [bit] NULL CONSTRAINT [DF__tmp_ms_xx__IsInt__5F1FD1A7]  DEFAULT ((0)),
	[PropertyID] [int] NULL,
	[HasApartments] [bit] NULL,
	[ProductMarketTypeDesc] [varchar](100) NULL,
	[UserCount] [int] NULL,
	[MarketCount] [int] NULL,
	[LineitemCreadedDate] [date] NULL,
	[PreviousSKU] [varchar](100) NULL,
	[StateCD] [varchar](5) NULL,
	[PipelineID] [int] NULL,
	[LineItemPricingDetailTypeID] [tinyint] NULL,
	[LineItemPricingDetailSubTypeID] [tinyint] NULL,
	[ListPrice] [decimal](38, 20) NULL,
	[MonthlyPrice] [decimal](38, 20) NULL,
	[InfoSites] [int] NULL CONSTRAINT [DF__tmp_ms_xx__InfoS__6013F5E0]  DEFAULT ((0)),
	[InfoProducts] [int] NULL CONSTRAINT [DF__tmp_ms_xx__InfoP__61081A19]  DEFAULT ((0)),
	[SuiteProducts] [int] NULL CONSTRAINT [DF__tmp_ms_xx__Suite__61FC3E52]  DEFAULT ((0)),
	[OtherProducts] [int] NULL CONSTRAINT [DF__tmp_ms_xx__Other__62F0628B]  DEFAULT ((0)),
	[SalesUnits] [int] NULL CONSTRAINT [DF__tmp_ms_xx__Sales__63E486C4]  DEFAULT ((0)),
	[QUANTITY_ORDERED] [int] NULL,
	[STUB_AMOUNT] [money] NULL,
	[AdjustedBillingStartDate] [date] NULL,
	[STUB_AMOUNT_LISTPRICE] [money] NULL,
	[EXT_AMOUNT] [money] NULL,
	[EXT_AMOUNT_LISTPRICE] [money] NULL,
	[BillingLocationName] [varchar](150) NULL,
	[CountryCode] [varchar](5) NULL,
	[AEContactName] [varchar](150) NULL,
	[ProductMarketTypeCounts] [int] NULL,
	[HasInfo] [bit] NULL,
	[Bundles] [bit] NULL,
	[NonBundleInfoProducts] [bit] NULL,
	[HasCMA] [bit] NULL,
	[IsMajor] [bit] NULL,
	[UseContractUserLimit] [bit] NULL,
	[CurrentTermMonths] [int] NULL,
	[CurrentTermID] [int] NULL,
	[LocationID] [int] NULL,
	[LineItemCreatedDate] [date] NULL,
	[CreatedDate] [smalldatetime] NOT NULL CONSTRAINT [DF__tmp_ms_xx__Creat__64D8AAFD]  DEFAULT (getdate()),
	[UpdatedDate] [smalldatetime] NOT NULL CONSTRAINT [DF__tmp_ms_xx__Updat__65CCCF36]  DEFAULT (getdate()),
	[RevenueRunID] [int] NOT NULL,
	--[RevenueItemRawID] [int] IDENTITY(1,1) NOT NULL,
	[IgnoreFlag] [bit] NOT NULL CONSTRAINT [DF__tmp_ms_xx__Ignor__66C0F36F]  DEFAULT ((0)),
	[IsContractCreatedThisMonth] [bit] NULL CONSTRAINT [DF__tmp_ms_xx__IsCon__67B517A8]  DEFAULT ((0)),
	[IsLineItemCreatedThisMonth] [bit] NULL CONSTRAINT [DF__tmp_ms_xx__IsLin__68A93BE1]  DEFAULT ((0)),
	[IsContractInActiveAtEndOfMonth] [bit] NULL CONSTRAINT [DF__tmp_ms_xx__IsCon__699D601A]  DEFAULT ((0)),
	[IsLIneItemInActiveAtEndOfMonth] [bit] NULL CONSTRAINT [DF__tmp_ms_xx__IsLIn__6A918453]  DEFAULT ((0)),
	[IsRenewal] [bit] NULL CONSTRAINT [DF__RevenueIt__IsRen__6B85A88C]  DEFAULT ((0)),
 CONSTRAINT [pk_TempRevItemRaw_LineitemID_IdentityKeyTEMP] PRIMARY KEY CLUSTERED 
(
	[LineItemID] ASC
	, [IdentityKey] ASC
	--[AdjustedEventDate] ASC,
	--[EventDate] ASC,
	--[RevenueItemType] ASC,
	--[SequenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Index [IX_RevenueItemRaw_ContractID_SiteLocationID]    Script Date: 10/5/2016 11:25:49 AM ******/
CREATE NONCLUSTERED INDEX [IX_TempRevItemRaw_ContractID_SiteLocationID2] ON ##RevenueItemRaw
(
	[ContractID] ASC,
	[SiteLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_RevenueItemRaw_RevenueRunID]    Script Date: 10/5/2016 11:25:49 AM ******/
CREATE NONCLUSTERED INDEX [IX_TempRevItemRaw_RevenueRunID2] ON ##RevenueItemRaw
(
	[RevenueRunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/*
--alter table "##RevenueItemRaw"
--drop constraint "pk_TempRevItemRaw_LineitemID_IdentityKey"

alter table "RevenueItemRaw"
drop constraint "[IX_TempRevItemRaw_RevenueRunIDTEMP]"

drop table ##RevenueItemRaw
*/

--select * from ##RevenueItemRaw
--select * from ##ActiveLineItems
