USE [RevenueProcessing]
GO

SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

--**************************************************************************************************

IF OBJECT_ID('tempdb..##ActiveLineItems') IS NOT NULL BEGIN DROP TABLE ##ActiveLineItems END
IF OBJECT_ID('tempdb..##ControlTable') IS NOT NULL BEGIN DROP TABLE ##ControlTable END
IF OBJECT_ID('tempdb..##MEA_History') IS NOT NULL BEGIN DROP TABLE ##MEA_History END
IF OBJECT_ID('tempdb..##SKUpricing') IS NOT NULL BEGIN DROP TABLE ##SKUpricing END
IF OBJECT_ID('tempdb..##RevenueItemRaw') IS NOT NULL BEGIN DROP TABLE ##RevenueItemRaw END

--**************************************************************************************************

CREATE TABLE ##ActiveLineItems
   (
	IdentityKey				INT IDENTITY(1,1) NOT NULL, 
	LineItemMEA				VARCHAR(100) NULL,
	CurrentMEA				VARCHAR(100) NULL,
	MEA						VARCHAR(100) NULL,
	ParentMEA				VARCHAR(100) NULL,
	ParentIdentity			INT, 
	ParentLineItemID		INT,
	LocationID				INT NOT NULL,
	ContractID				INT NOT NULL,
	ContractMinCreateDate	DATETIME,
	ContractMinMEA			VARCHAR(100) NULL, 
	LineItemID				INT NOT NULL,
	LineItemCreatedDate		DATE NOT NULL,
	CurrentSKU				VARCHAR(100) NULL,
	IsActive2016			BIT NOT NULL,
	SiteLocationID			INT NULL,
	ProductID				INT NOT NULL,
	ComboID					INT NOT NULL DEFAULT(0), 
	ComboLineItemID			INT NOT NULL DEFAULT(0), 
	ComboCode				INT NOT NULL DEFAULT(0)-- 0 = NULL, 1=not combo, 2=Combo two info products, 3=Suite, 4=CMA, 5=NETWORK single, 6=NETWORK with both Apts and Finder
 CONSTRAINT [pk_ActiveLines_LineitemID_IdentityKey] PRIMARY KEY CLUSTERED 
(
	[LineItemID] ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_ActiveLines_LI_Identity_LocID_ParentMEA_ParentIdentity_ParentLineID] ON ##ActiveLineItems
(
	LineItemID			ASC,
	IdentityKey		    ASC,
	LocationID			ASC,
	ParentMEA			ASC,
	ParentIdentity		ASC,
	ParentLineItemID	ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_ActiveLines_ComboLineItemID] ON ##ActiveLineItems
(
	[ComboLineItemID] ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_ActiveLines_LocID_SiteLocID_ComboID_LIcreated_ProductID] ON ##ActiveLineItems
(
	LocationID			ASC,
	SiteLocationID		ASC,
	ComboID				ASC,
	LineItemCreatedDate ASC,
	ProductID			ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

--**************************************************************************************************************************************************************************

CREATE TABLE ##ControlTable
   (
	IdentityKey				INT IDENTITY(1,1) NOT NULL, 
	LineItemMEA				VARCHAR(100) NULL,
	CurrentMEA				VARCHAR(100) NULL,
	MEA						VARCHAR(100) NULL,
	ParentMEA				VARCHAR(100) NULL,
	ParentIdentity			INT, 
	ParentLineItemID		INT,
	LocationID				INT NOT NULL,
	ContractID				INT NOT NULL,
	ContractMinCreateDate	DATETIME,
	ContractMinMEA			VARCHAR(100) NULL, 
	LineItemID				INT NOT NULL,
	LineItemCreatedDate		DATE NOT NULL,
	CurrentSKU				VARCHAR(100) NULL,
	IsActive2016			BIT NOT NULL,
	SiteLocationID			INT NULL,
	ProductID				INT NOT NULL,
	ComboID					INT NOT NULL DEFAULT(0), 
	ComboLineItemID			INT NOT NULL DEFAULT(0), 
	ComboCode				INT NOT NULL DEFAULT(0) -- 0 = NULL, 1=not combo, 2=Combo two info products, 3=Suite, 4=CMA, 5=NETWORK single, 6=NETWORK with both Apts and Finder
 CONSTRAINT [pk_Control_LineitemID_IdentityKey] PRIMARY KEY CLUSTERED 
(
	[LineItemID] ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_Control_LocID_SiteLocID_ComboID_LIcreated_ProductID] ON ##ControlTable
(
	LocationID			ASC,
	SiteLocationID		ASC,
	ComboID				ASC,
	LineItemCreatedDate ASC,
	ProductID			ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Control_ComboLineItemID] ON ##ControlTable
(
	[ComboLineItemID] ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Control_ProductID] ON ##ControlTable
(
	[ProductID] ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Control_IsActive2016] ON ##ControlTable
(
 [IsActive2016] ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Control_LI_Identity_LocID_ParentMEA_ParentIdentity_ParentLineID] ON ##ControlTable
(
	LineItemMEA			ASC,
	IdentityKey			ASC,
	LocationID			ASC,
	ParentMEA			ASC,
	ParentIdentity		ASC,
	ParentLineItemID	ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


INSERT INTO ##ControlTable
(
	[LineItemMEA],
	[CurrentMEA], 
	[MEA], 
	[ParentMEA], 
	[ParentIdentity], 
	[ParentLineItemID],
	[LocationID], 
	[ContractID], 
	[ContractMinCreateDate], 
	[ContractMinMEA],
	[LineItemID],
	[LineItemCreatedDate], 
	[CurrentSKU], 
	[IsActive2016],
	[SiteLocationID], 
	[ProductID], 
	[ComboID], 
	[ComboLineItemID],
	[ComboCode]
)
SELECT --TOP 10000	
	[LineItemMEA], 
	[CurrentMEA],
	[MEA], 
	[ParentMEA], 
	[ParentIdentity],
	[ParentLineItemID],
	[LocationID],
	[ContractID], 
	[ContractMinCreateDate], 
	[ContractMinMEA],
	[LineItemID], 
	[LineItemCreatedDate], 
	[CurrentSKU],
	[IsActive2016],
	[SiteLocationID], 
	[ProductID], 
	[ComboID], 
	[ComboLineItemID], 
	[ComboCode] 
FROM ##ActiveLineItems A
WHERE ComboLineItemID = 0 
AND IsActive2016 = 1
AND A.ProductID IN (248,252,245,250,247,251,246,249,281, 	--<<-- APTS.com products
					270,268,269,267,282)					--<<-- Finder products
ORDER BY A.LocationID, 
         A.SiteLocationID, 
		 A.ComboID, 
		 A.LineItemCreatedDate, 
		 A.ProductID



DECLARE @ControlLine	INT, 
        @ComboLine		INT, 
		@ContractID		INT, 
		@SiteLoc		INT, 
		@LocID			INT, 
		@ProductID		INT

DECLARE @DeleteLine			INT,
        @FinderCNT			INT, 
		@RemainingLinesCNT	INT,
	    @FoundLine			INT


WHILE EXISTS (SELECT TOP 1 1 FROM ##ControlTable)
BEGIN

	--LOCATE PAIR FOR APTS.com ITEM
    SELECT TOP 1 @ControlLine	= LineItemID, 
	             @ComboLine		= ComboLineItemID,
		         @ContractID	= ContractID, 
				 @SiteLoc		= SiteLocationID, 
				 @LocID			= LocationID,
		         @ProductID		= ProductID
    FROM ##ControlTable A
	WHERE A.ProductID IN (248,252,245,250,247,251,246,249,281) --<<-- APTS.com products
	AND IsActive2016 = 1
	AND A.ComboLineItemID = 0
    ORDER BY A.LocationID, A.SiteLocationID, A.ComboID, A.LineItemCreatedDate, A.ProductID


	--PRINT 'ControlLine=' + cast(@ControlLine as varchar(50))
	--PRINT ':: ComboLine=' + cast(@ComboLine as varchar(50)) 
	--PRINT  ':: ConID=' + cast(@ContractID as varchar(50)) 
	--PRINT  ':: SiteLoc=' + cast(@SiteLoc as varchar(50)) 
	--PRINT  ':: LocID=' + cast(@LocID as varchar(50)) 
	--PRINT  ':: ProdID=' + cast(@ProductID as varchar(50)) + char(13)


	SELECT TOP 1 @FoundLine = LineItemID 
	FROM ##ControlTable C
	WHERE @ControlLine <> C.LineItemID 
	AND @SiteLoc = C.SiteLocationID 
	AND @LocID = C.LocationID
	AND C.ProductID IN (270,268,269,267,282) --<<-- Finder products
	AND C.ComboLineItemID  = 0 
	ORDER BY C.LocationID, C.SiteLocationID, C.ComboID, C.LineItemCreatedDate, C.ProductID, LineItemID


	PRINT ':: FoundLine=' + cast(@FoundLine as varchar(50))

	IF @ComboLine = 0 
	BEGIN
		UPDATE A
		SET A.ComboLineItemID	= @ControlLine, 
		    A.ComboCode			= 6
		FROM 
			( 
				SELECT TOP 1 LineItemID 
				FROM ##ControlTable C
				WHERE @ControlLine <> c.LineItemID 
				AND @SiteLoc = C.SiteLocationID 
				AND @LocID = C.LocationID
				AND C.ProductID IN (270,268,269,267,282) --<<-- Finder products
				AND C.ComboLineItemID = 0 
				ORDER BY C.LocationID, C.SiteLocationID, C.ComboID, C.LineItemCreatedDate, C.ProductID, LineItemID
			) CT
		JOIN ##ActiveLineItems A 
			ON CT.LineItemID = A.LineItemID
		
		--RAISERROR (N'%s',10,1, @ControlLine) With nowait;

		UPDATE a
		SET A.ComboLineItemID = @ControlLine, 
		    A.ComboCode = 6
		FROM ##ActiveLineItems A
		JOIN ##ActiveLineItems A2 
			ON A.LineItemID = @ControlLine 
			AND A.LineItemID = A2.ComboLineItemID

		UPDATE A
		SET A.ComboLineItemID = @ControlLine, 
		    A.ComboCode = 5
		FROM ##ActiveLineItems A
		WHERE A.LineItemID = @ControlLine 
		AND A.ComboLineItemID = 0 

		--PRINT ':: FoundLine=' + cast(@FoundLine as varchar(50))
	END

    DELETE ##ControlTable
    WHERE LineItemID IN (
	                     SELECT A.LineItemID
			             FROM ##ActiveLineItems A
						 WHERE A.ComboLineItemID = @ControlLine
			            )


	IF @ControlLine IS NULL
	BEGIN
		UPDATE A
		SET A.ComboLineItemID	= A.LineItemID, 
		    A.ComboCode			= 5
		FROM ##ActiveLineItems A
		JOIN ##ControlTable CTRL 
			ON A.LineItemID = CTRL.LineItemID 
			AND A.ComboLineItemID = 0 


		TRUNCATE TABLE ##ControlTable
	END

	SET @ControlLine	= NULL
	SET @ComboLine		= NULL
	
	SET @ContractID		= NULL
	SET @SiteLoc		= NULL
	SET @LocID			= NULL
		
	SET @ProductID		= NULL
	SET @FoundLine		= NULL
END

--**************************************************************************************************************************************************************************

CREATE TABLE ##MEA_History(
	MEA_HistoryID	INT IDENTITY(1,1) NOT NULL, 
	ContractID		INT NOT NULL,
	MEA				VARCHAR(100) NULL,
	MEA_Date		DATETIME NULL,
	StartDate		DATE,
	EndDate			DATE,
	IsActive		BIT NOT NULL
 CONSTRAINT [pk_MEA_HistoryID_ContractID] PRIMARY KEY CLUSTERED 
(
	[ContractID]	ASC,
	[MEA_HistoryID] ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE NONCLUSTERED INDEX [IX_MEA_History_ContractID_MEA] ON ##MEA_History
(
	[ContractID]	ASC,
	[MEA]			ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

--**************************************************************************************************************************************************************************

CREATE TABLE ##SKUpricing
   (
	IdentityKey			INT IDENTITY(1,1) NOT NULL, 
	ProductID			INT NOT NULL,
	ProductName			VARCHAR(50) NOT NULL,
	ProductCategory		VARCHAR(25) NULL,
	CoStarBrandID		INT NOT NULL,
	CoStarBrandCode		VARCHAR(10) NOT NULL,
	CoStarBrandName		VARCHAR(50) NOT NULL,
	NavisionProductCD	VARCHAR(10) NULL,

	/***START: APARTMENT ONLY FIELDS***/
	TermLength			INT NULL, 
	UnitCount			INT NOT NULL DEFAULT(80), 
	MinusPlusFlag		BIT NULL,						-- 0 = (M)inus; 1 = (P)lus
	MinusPlus			VARCHAR(1) NULL,				-- SKU Component - <80 Units is (M)inus; >=80 Units is (P)lus
	AverageRent			MONEY NOT NULL DEFAULT(1.00),	-- <$1 per SQft is (V)alue; >=$1 per SQft is (S)tandard 
	StandardValueFlag	BIT NULL,						-- 0 = (V)alue; 1 = (S)tandard
	StandardValue		CHAR(1) NULL,					-- SKU Component - <$1 per SQft is (V)alue; >=$1 per SQft is (S)tandard
	
	ProductLevel 
		AS 
		UPPER(CASE WHEN LEN(ProductName) < 10 THEN NULL
		WHEN ProductName LIKE '%Finder%' THEN LEFT(RIGHT(ProductName, LEN(ProductName) - 11), 4)
		WHEN ProductName LIKE '%.com%' THEN LEFT(RIGHT(ProductName, LEN(ProductName) - 9), 4)
		ELSE NULL END),
	/***END: APARTMENT ONLY FIELDS***/

	/***START: INFO ONLY FIELDS***/
	ProductMarketTypeID		TINYINT NULL,
	UserCount				INT NULL,
	/***END: INFO ONLY FIELDS***/

	ListPrice				MONEY NOT NULL,
	IsActive				BIT NOT NULL,
	PriceCalcVersionMajor	INT NOT NULL DEFAULT(YEAR(GETDATE())),	--Calculator Version Year
	PriceCalcVersionMinor	INT NOT NULL,							--Incremented Calculator Version Change within a year
	CreatedDate				SMALLDATETIME NOT NULL DEFAULT(GETDATE()),
	UpdatedDate				SMALLDATETIME NOT NULL DEFAULT(GETDATE()),

	SingleSKU				VARCHAR(100) NULL,	--<-- Make this field non-editable, use a trigger, current logic supports only APTs
	ComboSKU				VARCHAR(100) NULL,	--<-- Make this field non-editable, use a trigger, current logic supports only APTs

	IsComboComponent		BIT NOT NULL DEFAULT(0),
 CONSTRAINT [pk_SKUpricing_LineitemID_IdentityKey] PRIMARY KEY CLUSTERED 
(
	[IdentityKey]	ASC,
	[ProductID]		ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE ##SKUpricing
ADD
CONSTRAINT fk_SKUpricing_ProductID FOREIGN KEY (ProductID) References Product (ProductID)


CREATE NONCLUSTERED INDEX IX_SKUpricing_Identity_ProductID ON ##SKUpricing
(
	ProductID ASC,
	UnitCount ASC,
	AverageRent ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

INSERT INTO ##SKUpricing 
	(
	 ProductID, 
	 ProductName,
	 NavisionProductCD, 
	 IsActive, 
	 ProductCategory,
	 CoStarBrandID, 
	 CoStarBrandCode, 
	 CoStarBrandName,
	 TermLength, 
	 MinusPlusFlag, 
	 MinusPlus,
	 StandardValueFlag, 
	 StandardValue, 
	 ListPrice ,
	 PriceCalcVersionMajor, 
	 PriceCalcVersionMinor, 
	 IsComboComponent
	)
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

--**************************************************************************************************************************************************************************

CREATE TABLE ##RevenueItemRaw
   (
	IdentityKey										INT IDENTITY(1,1) NOT NULL, 
	MEA												VARCHAR(100) NULL,
	RevenueItemType									VARCHAR(15) NOT NULL,
	LineItemID										INT NOT NULL,
	AdjustedEventDate								DATE NOT NULL,
	CurrentSKU										VARCHAR(100) NULL,
	SequenceNumber									INT NOT NULL,
	ActionType										VARCHAR(100) NULL,
	SOB_ID											INT NULL,
	MonthSequence									INT NULL,
	CurrentContractTerm								INT NULL,
	DaysInStubMonth									INT NULL,
	StubDays										INT NULL,
	StubDailyRate									DECIMAL(38, 20) NULL,
	HasInvalidStubData								BIT NULL,
	StubDailyListRate								DECIMAL(38, 20) NULL,
	StubPeriodMonthlyDiscountedRate					DECIMAL(38, 20) NULL,
	MEAFirstPricingDetailID							INT NULL,
	MEAFirstPricingDetailDiscountedMonthlyPrice		DECIMAL(38, 20) NULL,
	EventDate										DATE NOT NULL,
	RevenueEventType								VARCHAR(20) NULL,
	ProductID										INT NOT NULL,
	DerivedProductID								INT NULL,
	DerivedProductName								VARCHAR(80) NULL,
	DerivedSalesUnitID								INT NULL,
	AdjustedEventYear								INT NULL,
	AdjustedEventMonth								INT NULL,
	MEAFirstInvoiceDetailID							INT NULL,
	MEAInvoiceFirstDateOfPeriod						DATETIME NULL,
	MEAInvoiceBillingStartDate						DATETIME NULL,
	MEAInvoiceBillingStartDateDay					INT NULL,
	MEAInvoiceBillingFirstPeriodGross				DECIMAL(38, 20) NULL,
	MEAInvoiceBillingFirstPeriodDiscounted			DECIMAL(38, 20) NULL,
	MEAInvoiceBillingFirstPeriodStubAmount 			DECIMAL(38, 20) NULL,
	LineItemTypeID									INT NOT NULL,
	BillingStartDate								DATE NULL,
	CurrentTermStartDate							DATE NULL,
	BillingMonth									VARCHAR(6) NULL,
	LineItemEndDate									DATE NULL,
	AptBundleID										INT NULL,
	RenewalDate										SMALLDATETIME NULL,
	TermEndDate										DATE NULL,
	ContractApprovedDate							DATE NULL,
	ProductName										VARCHAR(80) NULL,
	NumberOfUsers									INT NULL,
	ContractID										INT NOT NULL,
	SalesUnitID										INT NULL,
	SalesUnitDesc									VARCHAR(100) NULL,
	CoStarBrandID									TINYINT NULL,
	BundleID										INT NULL,
	ProductCount									TINYINT NULL,
	CoStarSubsidiaryID								TINYINT NOT NULL,
	SiteLocationID									INT NOT NULL,
	MonetaryUnitID									TINYINT NOT NULL,
	BillingLocationID								INT NULL,
	SiteLocationName								VARCHAR(50) NULL,
	LineType										VARCHAR(15) NULL CONSTRAINT DF__tmp_ms_xx__LineT__5872D418  DEFAULT (''),
	NAVDocumentNo									VARCHAR(20) NULL,
	NAVLineNo										INT NULL,
	NAVQuantity										INT NULL,
	NAVUnitPrice									MONEY NULL,
	NAVAmount										MONEY NULL,
	NAVBillingStartDate								DATE NULL,
	NAVBillingEndDate								DATE NULL,
	NAVInvoiceDate									DATE NULL,
	CRMInvoiceDate									DATE NULL,
	NAVDescription3									VARCHAR(100) NULL,
	CRMInvoiceDetailID								INT NULL,
	IsMappedToNAV									BIT NULL,
	AEContactID										INT NULL,
	LineItemStatusID								TINYINT NOT NULL,
	IsCreditCard									BIT NOT NULL CONSTRAINT DF__tmp_ms_xx__IsCre__5966F851  DEFAULT ((0)),
	DiscountedMonthlyPrice							DECIMAL(38, 20) NOT NULL CONSTRAINT DF__tmp_ms_xx__Disco__5A5B1C8A  DEFAULT ((0)),
	PriorDiscountedMonthlyPrice						DECIMAL(38, 20) NOT NULL CONSTRAINT DF__tmp_ms_xx__Prior__5B4F40C3  DEFAULT ((0)),
	DiscountedMonthlyPriceDifference				DECIMAL(38, 20) NOT NULL CONSTRAINT DF__tmp_ms_xx__Disco__5C4364FC  DEFAULT ((0)),
	EventSource										VARCHAR(20) NULL,
	CanBePriced										BIT NULL CONSTRAINT DF__tmp_ms_xx__CanBe__5D378935  DEFAULT ((0)),
	PricingType										VARCHAR(100) NULL,
	ProductMarketTypeID								TINYINT NULL,
	CheckOutOk										INT NULL,
	MonthsOfFullDiscount							INT NULL CONSTRAINT DF__tmp_ms_xx__Month__5E2BAD6E  DEFAULT ((0)),
	IsInternContract								BIT NULL CONSTRAINT DF__tmp_ms_xx__IsInt__5F1FD1A7  DEFAULT ((0)),
	PropertyID										INT NULL,
	HasApartments									BIT NULL,
	ProductMarketTypeDesc							VARCHAR(100) NULL,
	UserCount										INT NULL,
	MarketCount										INT NULL,
	LineitemCreadedDate								DATE NULL,
	PreviousSKU										VARCHAR(100) NULL,
	StateCD											VARCHAR(5) NULL,
	PipelineID										INT NULL,
	LineItemPricingDetailTypeID						TINYINT NULL,
	LineItemPricingDetailSubTypeID					TINYINT NULL,
	ListPrice										DECIMAL(38, 20) NULL,
	MonthlyPrice									DECIMAL(38, 20) NULL,
	InfoSites										INT NULL CONSTRAINT DF__tmp_ms_xx__InfoS__6013F5E0  DEFAULT ((0)),
	InfoProducts									INT NULL CONSTRAINT DF__tmp_ms_xx__InfoP__61081A19  DEFAULT ((0)),
	SuiteProducts									INT NULL CONSTRAINT DF__tmp_ms_xx__Suite__61FC3E52  DEFAULT ((0)),
	OtherProducts									INT NULL CONSTRAINT DF__tmp_ms_xx__Other__62F0628B  DEFAULT ((0)),
	SalesUnits										INT NULL CONSTRAINT DF__tmp_ms_xx__Sales__63E486C4  DEFAULT ((0)),
	QUANTITY_ORDERED								INT NULL,
	STUB_AMOUNT										MONEY NULL,
	AdjustedBillingStartDate						DATE NULL,
	STUB_AMOUNT_LISTPRICE							MONEY NULL,
	EXT_AMOUNT										MONEY NULL,
	EXT_AMOUNT_LISTPRICE							MONEY NULL,
	BillingLocationName								VARCHAR(150) NULL,
	CountryCode										VARCHAR(5) NULL,
	AEContactName									VARCHAR(150) NULL,
	ProductMarketTypeCounts							INT NULL,
	HasInfo											BIT NULL,
	Bundles											BIT NULL,
	NonBundleInfoProducts							BIT NULL,
	HasCMA											BIT NULL,
	IsMajor											BIT NULL,
	UseContractUserLimit							BIT NULL,
	CurrentTermMonths								INT NULL,
	CurrentTermID									INT NULL,
	LocationID										INT NULL,
	LineItemCreatedDate								DATE NULL,
	CreatedDate										SMALLDATETIME NOT NULL CONSTRAINT DF__tmp_ms_xx__Creat__64D8AAFD  DEFAULT (GETDATE()),
	UpdatedDate										SMALLDATETIME NOT NULL CONSTRAINT DF__tmp_ms_xx__Updat__65CCCF36  DEFAULT (GETDATE()),
	RevenueRunID									INT NOT NULL,
	IgnoreFlag										BIT NOT NULL CONSTRAINT DF__tmp_ms_xx__Ignor__66C0F36F  DEFAULT ((0)),
	IsContractCreatedThisMonth						BIT NULL CONSTRAINT DF__tmp_ms_xx__IsCon__67B517A8  DEFAULT ((0)),
	IsLineItemCreatedThisMonth						BIT NULL CONSTRAINT DF__tmp_ms_xx__IsLin__68A93BE1  DEFAULT ((0)),
	IsContractInActiveAtEndOfMonth					BIT NULL CONSTRAINT DF__tmp_ms_xx__IsCon__699D601A  DEFAULT ((0)),
	IsLIneItemInActiveAtEndOfMonth					BIT NULL CONSTRAINT DF__tmp_ms_xx__IsLIn__6A918453  DEFAULT ((0)),
	IsRenewal										BIT NULL CONSTRAINT DF__RevenueIt__IsRen__6B85A88C  DEFAULT ((0)),
 CONSTRAINT pk_TempRevItemRaw_LineitemID_IdentityKeyTEMP PRIMARY KEY CLUSTERED 
(
	[LineItemID] ASC,
	[IdentityKey] ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

CREATE NONCLUSTERED INDEX [IX_TempRevItemRaw_ContractID_SiteLocationID2] ON ##RevenueItemRaw
(
	[ContractID] ASC,
	[SiteLocationID] ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_TempRevItemRaw_RevenueRunID2] ON ##RevenueItemRaw
(
 [RevenueRunID] ASC
)
 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

--**************************************************************************************************************************************************************************