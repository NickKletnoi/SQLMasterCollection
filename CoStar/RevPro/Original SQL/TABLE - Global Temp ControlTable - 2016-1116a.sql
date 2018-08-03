USE [RevenueProcessing]
GO

SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE ##ControlTable(
	[IdentityKey] int identity(1,1) NOT NULL, 
	[LineItemMEA] varchar(100) NULL,
	[CurrentMEA] varchar(100) NULL,
	[MEA] varchar(100) NULL,
	[ParentMEA] varchar(100) NULL,
	[ParentIdentity] int, 
	[ParentLineItemID] int,
	[LocationID] int NOT NULL,
	[ContractID] int NOT NULL,
	[ContractMinCreateDate] datetime,
	[ContractMinMEA] varchar(100) NULL, 
	[LineItemID] int NOT NULL,
	[LineItemCreatedDate] date NOT NULL,
	[CurrentSKU] varchar(100) NULL,
	[IsActive2016] bit NOT NULL,
	[SiteLocationID] int NULL,
	[ProductID] int NOT NULL,
	[ComboID] int NOT NULL DEFAULT(0), 
	[ComboLineItemID] int NOT NULL DEFAULT(0), 
	[ComboCode] int NOT NULL DEFAULT(0)-- 0=NULL, 1=not combo, 2=Combo two info products, 3=Suite, 4=CMA, 5=NETWORK single, 6=NETWORK with both Apts and Finder
 CONSTRAINT [pk_Control_LineitemID_IdentityKey] PRIMARY KEY CLUSTERED 
(
	[LineItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_Control_LocID_SiteLocID_ComboID_LIcreated_ProductID] ON ##ControlTable
(
	[LocationID] ASC
	, [SiteLocationID] ASC
	, [ComboID] ASC
	, [LineItemCreatedDate] ASC
	, [ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Control_ComboLineItemID] ON ##ControlTable
(
	[ComboLineItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Control_ProductID] ON ##ControlTable
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Control_IsActive2016] ON ##ControlTable
(
	[IsActive2016] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_Control_LI_Identity_LocID_ParentMEA_ParentIdentity_ParentLineID] ON ##ControlTable
(
	[LineItemID] ASC
	, [IdentityKey] ASC
	, [LocationID] ASC
	, [ParentMEA] ASC
	, [ParentIdentity] ASC
	, [ParentLineItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

--drop table ##ControlTable

INSERT INTO ##ControlTable
(
	[LineItemMEA], -- varchar(100) NULL,
	[CurrentMEA], -- varchar(100) NULL,
	[MEA], -- varchar(100) NULL,
	[ParentMEA], -- varchar(100) NULL,
	[ParentIdentity], -- int, 
	[ParentLineItemID], -- int,
	[LocationID], -- int NOT NULL,
	[ContractID], -- int NOT NULL,
	[ContractMinCreateDate], -- datetime,
	[ContractMinMEA], -- varchar(100) NULL, 
	[LineItemID], -- int NOT NULL,
	[LineItemCreatedDate], -- date NOT NULL,
	[CurrentSKU], -- varchar(100) NULL,
	[IsActive2016], -- bit NOT NULL,
	[SiteLocationID], -- int NULL,
	[ProductID], -- int NOT NULL,
	[ComboID], -- int NOT NULL DEFAULT(0), -- 0=NULL
	[ComboLineItemID], -- int NOT NULL DEFAULT(0), -- 0=NULL
	[ComboCode]
)
SELECT --top 10000	
	[LineItemMEA], -- varchar(100) NULL,
	[CurrentMEA], -- varchar(100) NULL,
	[MEA], -- varchar(100) NULL,
	[ParentMEA], -- varchar(100) NULL,
	[ParentIdentity], -- int, 
	[ParentLineItemID], -- int,
	[LocationID], -- int NOT NULL,
	[ContractID], -- int NOT NULL,
	[ContractMinCreateDate], -- datetime,
	[ContractMinMEA], -- varchar(100) NULL, 
	[LineItemID], -- int NOT NULL,
	[LineItemCreatedDate], -- date NOT NULL,
	[CurrentSKU], -- varchar(100) NULL,
	[IsActive2016], -- bit NOT NULL,
	[SiteLocationID], -- int NULL,
	[ProductID], -- int NOT NULL,
	[ComboID], -- int NOT NULL DEFAULT(0), -- 0=NULL
	[ComboLineItemID], -- int NOT NULL DEFAULT(0), -- 0=NULL
	[ComboCode] 
FROM ##ActiveLineItems A
WHERE ComboLineItemID = 0 
AND IsActive2016 = 1
AND A.ProductID in (248,252,245,250,247,251,246,249,281, 	--<<-- APTS.com products
					270,268,269,267,282)					--<<-- Finder products
ORDER BY A.LocationID, 
         A.SiteLocationID, 
		 A.ComboID, 
		 A.LineItemCreatedDate, 
		 A.ProductID



DECLARE @ControlLine INT, 
        @ComboLine INT, 
		@ContractID INT, 
		@SiteLoc INT, 
		@LocID INT, 
		@ProductID INT

DECLARE @DeleteLine INT,
        @FinderCNT INT, 
		@RemainingLinesCNT INT,
	    @FoundLine INT


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

	--PRINT ':: 3FoundLine=' + cast(isnull(@FoundLine,1) as varchar(50))
	SET @ControlLine = NULL
	SET @ComboLine = NULL
	
	SET @ContractID = NULL
	SET  @SiteLoc = NULL
	SET  @LocID = NULL
		
	SET  @ProductID = NULL
	SET  @FoundLine = NULL
	--PRINT ':: FoundLine=' + cast(isnull(@FoundLine,1) as varchar(50))
end


select * from ##ControlTable
--where lineitemid in (1506351, 1772332)

select --top 500 
	*
from ##ActiveLineItems a
where 
	--LocationID in 
	--( 
	--	52211651 
	--	,41264081 
	--	,476
	--)
	--and 
	ComboLineItemID <> 0 --is null
order by a.LocationID, a.SiteLocationID, a.ComboID, a.LineItemCreatedDate, a.ProductID

/*
update a
set ComboLineItemID = 0, ComboCode = 0
from ##ActiveLineItems a
*/