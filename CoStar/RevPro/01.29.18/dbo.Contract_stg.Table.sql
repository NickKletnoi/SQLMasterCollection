USE [RevPro]
GO
/****** Object:  Table [dbo].[Contract_stg]    Script Date: 1/29/2018 3:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contract_stg](
	[ContractID] [int] NOT NULL,
	[BillingTermID] [int] NOT NULL,
	[BillingContactID] [int] NOT NULL,
	[ContractContactID] [int] NOT NULL,
	[PayMethodID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[BillingLocationID] [int] NOT NULL,
	[ContractSignedDate] [smalldatetime] NOT NULL,
	[ContractReceiptDate] [smalldatetime] NOT NULL,
	[AcctApprovedByContactID] [int] NULL,
	[AcctApprovedDate] [smalldatetime] NULL,
	[SpecialClause] [varchar](2000) NULL,
	[DefaultRenewalTermMonths] [int] NULL,
	[DefaultTermMonths] [int] NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[NavisionContractID] [varchar](20) NULL,
	[CreatedByContactID] [int] NOT NULL,
	[UpdatedDate] [smalldatetime] NOT NULL,
	[UpdatedByContactID] [int] NOT NULL,
	[QuarterlyCycleOne] [tinyint] NULL,
	[QuarterlyCycleTwo] [tinyint] NULL,
	[QuarterlyCycleThree] [tinyint] NULL,
	[QuarterlyCycleFour] [tinyint] NULL,
	[SemiAnnualCycleOne] [tinyint] NULL,
	[SemiAnnualCycleTwo] [tinyint] NULL,
	[AnnualCycle] [tinyint] NULL,
	[UseContractUserLimit] [bit] NULL,
	[NumberOfUsers] [int] NULL,
	[CorporateBillingFlag] [bit] NULL,
	[PubDateMin] [datetime] NULL,
	[RCSOrderID] [varchar](100) NULL,
	[AdHocDiscountPct] [numeric](7, 4) NULL,
	[AccelerationDays] [smallint] NULL,
	[ContractVersionID] [smallint] NULL,
	[ApprovedPricing] [bit] NULL,
	[ContractVersion] [varchar](50) NULL,
	[IncreaseFeesByLetter] [bit] NULL,
	[DaysNotice] [smallint] NULL,
	[InvoiceHeader] [varchar](30) NULL,
	[CPIMandatoryEscFlag] [bit] NOT NULL,
	[CPIOptionalEscFlag] [bit] NOT NULL,
	[CreditCardUserID] [int] NULL,
	[Recommendation] [varchar](50) NULL,
	[BusinessRegistrationCountryCode] [char](3) NULL,
	[BusinessRegistrationNumber] [varchar](25) NULL,
	[CoStarSubsidiaryID] [tinyint] NOT NULL,
	[MonetaryUnitID] [tinyint] NOT NULL,
	[CPIMonth] [tinyint] NULL,
	[IsGovernmentContractFlag] [bit] NULL,
	[HasFTCLoopNetClauseFlag] [bit] NOT NULL,
	[PricingDetailInheritsDiscountFlag] [bit] NOT NULL,
	[UseContractUnitQuantityLimit] [bit] NULL,
	[UnitQuantity] [int] NULL,
	[ContractInvoiceConfigurationID] [int] NOT NULL,
	[CoStarBrandID] [tinyint] NULL,
	[BillingStartDate] [datetime] NULL,
	[CustomerAccountID] [int] NULL,
	[SignatureTypeID] [tinyint] NULL,
	[SignatureTypeReasonID] [tinyint] NULL,
	[ContractTypeID] [tinyint] NULL,
	[AcctReviewedByContactID] [int] NULL,
	[AcctReviewedDate] [smalldatetime] NULL,
	[CheckSum_Contract] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
