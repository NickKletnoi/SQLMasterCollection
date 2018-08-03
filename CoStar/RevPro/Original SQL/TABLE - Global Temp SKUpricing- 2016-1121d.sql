USE [RevenueProcessing]
GO

/****** Object:  Table dbo.SKUpricing    Script Date: 10/5/2016 11:25:49 AM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE ##SKUpricing(
	[IdentityKey] int identity(1,1) NOT NULL, 
	[ProductID] int NOT NULL,
	[ProductName] varchar(50) NOT NULL,
	[ProductCategory] varchar(25) NULL,
	[CoStarBrandID] int NOT NULL,
	[CoStarBrandCode] varchar(10) NOT NULL,
	[CoStarBrandName] varchar(50) NOT NULL,
	[NavisionProductCD] varchar(10) NULL,

	/***START: APARTMENT ONLY FIELDS***/
	[TermLength] int NULL, --0 = all term lengths
	[UnitCount] int NOT NULL DEFAULT(80), -- <80 Units is (M)inus; >=80 Units is (P)lus --<--Add default value to separate table, make this field non-editable, and insert with trigger
	[MinusPlusFlag] bit NULL, -- 0 = (M)inus; 1 = (P)lus
	[MinusPlus] char(1) NULL, -- SKU Component - <80 Units is (M)inus; >=80 Units is (P)lus
	[AverageRent] money NOT NULL DEFAULT(1.00), -- <$1 per SQft is (V)alue; >=$1 per SQft is (S)tandard --<--Add default value to separate table, make this field non-editable, and insert with trigger
	[StandardValueFlag] bit NULL, -- 0 = (V)alue; 1 = (S)tandard
	[StandardValue] char(1) NULL, -- SKU Component - <$1 per SQft is (V)alue; >=$1 per SQft is (S)tandard
	[ProductLevel] --varchar(4) NULL
		AS 
		UPPER(CASE WHEN LEN(ProductName) < 10 THEN NULL
		WHEN [ProductName] like '%Finder%' THEN LEFT(RIGHT([ProductName], LEN([ProductName]) - 11), 4)
		WHEN [ProductName] like '%.com%' THEN LEFT(RIGHT([ProductName], LEN([ProductName]) - 9), 4)
		ELSE NULL END),
	/***END: APARTMENT ONLY FIELDS***/

	/***START: INFO ONLY FIELDS***/
	[ProductMarketTypeID] [tinyint] NULL,
	[UserCount] [int] NULL,
	/***END: INFO ONLY FIELDS***/

	[ListPrice] [money] NOT NULL,
	[IsActive] bit NOT NULL,
	[PriceCalcVersionMajor] int NOT NULL DEFAULT(YEAR(GETDATE())), --Calculator Version Year
	[PriceCalcVersionMinor] int NOT NULL, --Incremented Calculator Version Change within a year
	[CreatedDate] [smalldatetime] NOT NULL DEFAULT(GETDATE()),
	[UpdatedDate] [smalldatetime] NOT NULL DEFAULT(GETDATE()),
	[SingleSKU] varchar(100) NULL, --<-- Make this field non-editable, use a trigger, current logic supports only APTs
		--AS
		--'A' + [ProductLevel] + [MinusPlus] + [StandardValue] + 
		--RIGHT('00' + CAST([TermLength] as varchar(2)), 2),
	[ComboSKU] varchar(100) NULL, --<-- Make this field non-editable, use a trigger, current logic supports only APTs
		--AS
		--'A' + [ProductLevel] + [MinusPlus] + [StandardValue] + 
		--RIGHT('00' + CAST([TermLength] as varchar(2)), 2) + 'NET',
	[IsComboComponent] bit NOT NULL DEFAULT(0),
	----CONSTRAINT [fk_SKUpricing_ProductID] 
	--FOREIGN KEY ([ProductID]),
	----CONSTRAINT [fk_SKUpricing_UnitCount] 
	--FOREIGN KEY ([UnitCount]),
	----CONSTRAINT [fk_SKUpricing_AverageRent] 
	--FOREIGN KEY ([AverageRent]),
 CONSTRAINT [pk_SKUpricing_LineitemID_IdentityKey] PRIMARY KEY CLUSTERED 
(
	[IdentityKey] ASC
	, [ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE ##SKUpricing
ADD
CONSTRAINT [fk_SKUpricing_ProductID] FOREIGN KEY ([ProductID]) References Product (ProductID)
--,
--CONSTRAINT [fk_SKUpricing_UnitCount] FOREIGN KEY ([UnitCount]),
--CONSTRAINT [fk_SKUpricing_AverageRent] FOREIGN KEY ([AverageRent])


CREATE NONCLUSTERED INDEX [IX_SKUpricing_Identity_ProductID] ON ##SKUpricing
(
	[ProductID] ASC
	, [UnitCount] ASC
	, [AverageRent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/*********START: NEED TO DO - 2016-1121 ***********
CREATE TRIGGER ##TRIG_SKUpricing --[dbo].[TRIG_MyTable]
ON ##SKUpricing --[dbo].[MyTable]
AFTER INSERT, UPDATE

AS 
UPDATE ##SKUpricing
SET [ProductLevel] = UPPER(CASE WHEN LEN(ProductName) < 10 THEN NULL
		WHEN [ProductName] like '%Finder%' THEN LEFT(RIGHT([ProductName], LEN([ProductName]) - 11), 4)
		WHEN [ProductName] like '%.com%' THEN LEFT(RIGHT([ProductName], LEN([ProductName]) - 9), 4)
		ELSE NULL END)
WHERE [IdentityKey] in (select [IdentityKey] from Inserted)
--*********END: NEED TO DO - 2016-1121 ***********/

--drop table ##SKUpricing
--select * from ##SKUpricing
--truncate table ##SKUpricing
/***START: APARTMENT ONLY FIELDS***/
INSERT INTO ##SKUpricing 
	(ProductID , ProductName
	, NavisionProductCD, IsActive, ProductCategory
	, CoStarBrandID, CoStarBrandCode, CoStarBrandName
	, [TermLength], [MinusPlusFlag], [MinusPlus]
	, [StandardValueFlag], [StandardValue], [ListPrice] 
	, [PriceCalcVersionMajor], [PriceCalcVersionMinor], [IsComboComponent])
VALUES (249, 'Apts.com Silver Adv','APTSSILVER', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 0, 'V', 129.00/2.0, 2015, 0, 1),
	(249, 'Apts.com Silver Adv','APTSSILVER', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 0, 'V', 149.00/2.0, 2015, 0, 1),
	(249, 'Apts.com Silver Adv','APTSSILVER', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 1, 'S', 129.00/2.0, 2015, 0, 1),
	(249, 'Apts.com Silver Adv','APTSSILVER', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 1, 'S', 299.00/2.0, 2015, 0, 1),

	(245, 'Apts.com Gold' ,'APTSGOLD', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 0, 'V', 249.00/2.0, 2015, 0, 1),
	(245, 'Apts.com Gold' ,'APTSGOLD', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 0, 'V', 349.00/2.0, 2015, 0, 1),
	(245, 'Apts.com Gold' ,'APTSGOLD', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 0, 'S', 295.00/2.0, 2015, 0, 1),
	(245, 'Apts.com Gold' ,'APTSGOLD', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 0, 'S', 599.00/2.0, 2015, 0, 1), 

	(246 ,'Apts.com Silver' ,'APTSSILVER', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 0, 'V', 129.00/2.0, 2015, 0, 1),
	(246 ,'Apts.com Silver' ,'APTSSILVER', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 0, 'V', 149.00/2.0, 2015, 0, 1),
	(246 ,'Apts.com Silver' ,'APTSSILVER', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 1, 'S', 129.00/2.0, 2015, 0, 1),
	(246 ,'Apts.com Silver' ,'APTSSILVER', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 1, 'S', 299.00/2.0, 2015, 0, 1),
	
	(247 ,'Apts.com Platinum' ,'APTSPLATIN', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 0, 'V', 595.00/2.0, 2015, 0, 1),
	(247 ,'Apts.com Platinum' ,'APTSPLATIN', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 0, 'V', 719.00/2.0, 2015, 0, 1),
	(247 ,'Apts.com Platinum' ,'APTSPLATIN', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 1, 'S', 695.00/2.0, 2015, 0, 1),
	(247 ,'Apts.com Platinum' ,'APTSPLATIN', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 1, 'S', 899.00/2.0, 2015, 0, 1),

	(250 ,'Apts.com Gold Adv' ,'APTSGOLD', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 0, 'V', 249.00/2.0, 2015, 0, 1),
	(250 ,'Apts.com Gold Adv' ,'APTSGOLD', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 0, 'V', 349.00/2.0, 2015, 0, 1),
	(250 ,'Apts.com Gold Adv' ,'APTSGOLD', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 0, 'S', 295.00/2.0, 2015, 0, 1),
	(250 ,'Apts.com Gold Adv' ,'APTSGOLD', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 0, 'S', 599.00/2.0, 2015, 0, 1), 

	(251 ,'Apts.com Platinum Adv' ,'APTSPLATIN', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 0, 'V', 595.00/2.0, 2015, 0, 1),
	(251 ,'Apts.com Platinum Adv' ,'APTSPLATIN', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 0, 'V', 719.00/2.0, 2015, 0, 1),
	(251 ,'Apts.com Platinum Adv' ,'APTSPLATIN', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 1, 'S', 695.00/2.0, 2015, 0, 1),
	(251 ,'Apts.com Platinum Adv' ,'APTSPLATIN', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 1, 'S', 899.00/2.0, 2015, 0, 1),

	(252 ,'Apts.com Diamond Adv' ,'APTSDIAMON', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 0, 'V', 1099.00/2.0, 2015, 0, 1),
	(252 ,'Apts.com Diamond Adv' ,'APTSDIAMON', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 0, 'V', 1295.00/2.0, 2015, 0, 1),
	(252 ,'Apts.com Diamond Adv' ,'APTSDIAMON', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 1, 'S', 1199.00/2.0, 2015, 0, 1),
	(252 ,'Apts.com Diamond Adv' ,'APTSDIAMON', 0 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 1, 'S', 1499.00/2.0, 2015, 0, 1),

	(267 ,'Apt Finder Silver' ,'AFPAK', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 0, 'M', 0, 'V', 129.00/2.0, 2015, 0, 1),
	(267 ,'Apt Finder Silver' ,'AFPAK', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 1, 'P', 0, 'V', 149.00/2.0, 2015, 0, 1),
	(267 ,'Apt Finder Silver' ,'AFPAK', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 0, 'M', 1, 'S', 129.00/2.0, 2015, 0, 1),
	(267 ,'Apt Finder Silver' ,'AFPAK', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 1, 'P', 1, 'S', 299.00/2.0, 2015, 0, 1),

	(268 ,'Apt Finder Gold' ,'AFPLUS', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 0, 'M', 0, 'V', 249.00/2.0, 2015, 0, 1),
	(268 ,'Apt Finder Gold' ,'AFPLUS', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 1, 'P', 0, 'V', 349.00/2.0, 2015, 0, 1),
	(268 ,'Apt Finder Gold' ,'AFPLUS', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 0, 'M', 0, 'S', 295.00/2.0, 2015, 0, 1),
	(268 ,'Apt Finder Gold' ,'AFPLUS', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 1, 'P', 0, 'S', 599.00/2.0, 2015, 0, 1), 

	(269 ,'Apt Finder Platinum' ,'AFPRO', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 0, 'M', 0, 'V', 595.00/2.0, 2015, 0, 1), 
	(269 ,'Apt Finder Platinum' ,'AFPRO', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 1, 'P', 0, 'V', 719.00/2.0, 2015, 0, 1),
	(269 ,'Apt Finder Platinum' ,'AFPRO', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 0, 'M', 1, 'S', 695.00/2.0, 2015, 0, 1),
	(269 ,'Apt Finder Platinum' ,'AFPRO', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 1, 'P', 1, 'S', 899.00/2.0, 2015, 0, 1),

	(270 ,'Apt Finder Diamond' ,'AFPROODD', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 0, 'M', 0, 'V', 1099.00/2.0, 2015, 0, 1),
	(270 ,'Apt Finder Diamond' ,'AFPROODD', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 1, 'P', 0, 'V', 1295.00/2.0, 2015, 0, 1),
	(270 ,'Apt Finder Diamond' ,'AFPROODD', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 0, 'M', 1, 'S', 1199.00/2.0, 2015, 0, 1),
	(270 ,'Apt Finder Diamond' ,'AFPROODD', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 1, 'P', 1, 'S', 1499.00/2.0, 2015, 0, 1),

	(281 ,'Apts.com Silver PROMO' ,'APTSSLVPRM', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 0, 'V', 129.00/2.0, 2015, 0, 1), 
	(281 ,'Apts.com Silver PROMO' ,'APTSSLVPRM', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 0, 'V', 149.00/2.0, 2015, 0, 1),
	(281 ,'Apts.com Silver PROMO' ,'APTSSLVPRM', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 1, 'S', 129.00/2.0, 2015, 0, 1),
	(281 ,'Apts.com Silver PROMO' ,'APTSSLVPRM', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 1, 'S', 299.00/2.0, 2015, 0, 1),

	(248 ,'Apts.com Diamond' ,'APTSDIAMON', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 0, 'V', 1099.00/2.0, 2015, 0, 1),
	(248 ,'Apts.com Diamond' ,'APTSDIAMON', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 0, 'V', 1295.00/2.0, 2015, 0, 1),
	(248 ,'Apts.com Diamond' ,'APTSDIAMON', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 0, 'M', 1, 'S', 1199.00/2.0, 2015, 0, 1),
	(248 ,'Apts.com Diamond' ,'APTSDIAMON', 1 ,'Apartments.com', 2 ,'APTS' ,'Apartments.com', 0, 1, 'P', 1, 'S', 1499.00/2.0, 2015, 0, 1),
	 
	(282 ,'Apt Finder Silver PROMO' ,'AFSLVPRM', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 0, 'M', 0, 'V', 129.00/2.0, 2015, 0, 1),  
	(282 ,'Apt Finder Silver PROMO' ,'AFSLVPRM', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 1, 'P', 0, 'V', 149.00/2.0, 2015, 0, 1),
	(282 ,'Apt Finder Silver PROMO' ,'AFSLVPRM', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 0, 'M', 1, 'S', 129.00/2.0, 2015, 0, 1),
	(282 ,'Apt Finder Silver PROMO' ,'AFSLVPRM', 1 ,'Apt Finder', 10 ,'APTS' ,'Apartment Finder', 0, 1, 'P', 1, 'S', 299.00/2.0, 2015, 0, 1)
/***END: APARTMENT ONLY FIELDS***/