USE [RevenueProcessing]
GO

/****** Object:  Table dbo.ActiveLineItems    Script Date: 10/5/2016 11:25:49 AM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE ##ActiveLineItems(
	[IdentityKey] int identity(1,1) NOT NULL, 
	[LineItemMEA] varchar(100) NULL,
	[CurrentMEA] varchar(100) NULL,
	[MEA] varchar(100) NULL,
	--[MEA_Date] date,
	[ParentMEA] varchar(100) NULL,
	[ParentIdentity] int, 
	[ParentLineItemID] int,
	--[RevenueItemType] [varchar](15) NOT NULL,
	[LocationID] int NOT NULL,
	[ContractID] int NOT NULL,
	[ContractMinCreateDate] datetime,
	[ContractMinMEA] varchar(100) NULL, 
	[LineItemID] int NOT NULL,
	[LineItemCreatedDate] date NOT NULL,
	--[AdjustedEventDate] date NOT NULL,
	[CurrentSKU] varchar(100) NULL,
	--[SequenceNumber] int NOT NULL,
	[IsActive2016] bit NOT NULL,
	[SiteLocationID] int NULL,
	[ProductID] int NOT NULL,
	[ComboID] int NOT NULL DEFAULT(0), -- 0=NULL
	[ComboLineItemID] int NOT NULL DEFAULT(0), -- 0=NULL
	[ComboCode] int NOT NULL DEFAULT(0)-- 0=NULL, 1=not combo, 2=Combo two info products, 3=Suite, 4=CMA, 5=NETWORK single, 6=NETWORK with both Apts and Finder
 CONSTRAINT [pk_ActiveLines_LineitemID_IdentityKey] PRIMARY KEY CLUSTERED 
(
	[LineItemID] ASC
	--, [IdentityKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Index [IX_RevenueItemRaw_RevenueRunID]    Script Date: 10/5/2016 11:25:49 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActiveLines_LI_Identity_LocID_ParentMEA_ParentIdentity_ParentLineID] ON ##ActiveLineItems
(
	[LineItemID] ASC
	, [IdentityKey] ASC
	, [LocationID] ASC
	, [ParentMEA] ASC
	, [ParentIdentity] ASC
	, [ParentLineItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_ActiveLines_ComboLineItemID] ON ##ActiveLineItems
(
	[ComboLineItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_ActiveLines_LocID_SiteLocID_ComboID_LIcreated_ProductID] ON ##ActiveLineItems
(
	[LocationID] ASC
	, [SiteLocationID] ASC
	, [ComboID] ASC
	, [LineItemCreatedDate] ASC
	, [ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


--select * from ##ActiveLineItems
/*
alter table "##ActiveLineItems"
drop constraint "pk_TempActiveLines_LineitemID_IdentityKey"

drop table ##ActiveLineItems
truncate table ##ActiveLineItems
update a set ComboLineItemID = NULL from ##ActiveLineItems a 
*/

--select * from ##ActiveLineItems where LineItemID = 
--drop table #ControlTable

/*
select --top 500 
	*
INTO #ControlTable
from ##ActiveLineItems a
where 
	--LocationID = 
	--52211651 
	--41264081 
	--and 
	ComboID = 0 --is null
	and IsActive2016 = 1
	and a.ProductID in (248,252,245,250,247,251,246,249,281 --<<-- APTS.com products
						,270,268,269,267,282) --<<-- Finder products
order by a.LocationID, a.SiteLocationID, a.ComboID, a.LineItemCreatedDate, a.ProductID
*/

/*
DECLARE @ControlLine INT, @ComboLine INT, @ContractID INT, @SiteLoc INT, @LocID INT, @ProductID INT
DECLARE @DeleteLine INT
DECLARE @FinderCNT INT, @RemainingLinesCNT INT
DECLARE @FoundLine INT
--SET @COUNTER = 1
--SELECT @MAXID = COUNT(*) FROM #TempTable

while exists (select 1 from ##ControlTable)
begin

	--LOCATE PAIR FOR APTS.com ITEM
    select top 1 @ControlLine = LineItemID, @ComboLine = ComboLineItemID
		, @ContractID = ContractID, @SiteLoc = SiteLocationID, @LocID = LocationID
		, @ProductID = ProductID
    from #ControlTable a
	WHERE a.ProductID in (248,252,245,250,247,251,246,249,281) --<<-- APTS.com products
    order by a.LocationID, a.SiteLocationID, a.ComboID, a.LineItemCreatedDate, a.ProductID

	--PRINT 'ControlLine=' + cast(@ControlLine as varchar(50))
	----PRINT ':: ComboLine=' + cast(@ComboLine as varchar(50)) 
	--PRINT  ':: ConID=' + cast(@ContractID as varchar(50)) 
	--PRINT  ':: SiteLoc=' + cast(@SiteLoc as varchar(50)) 
	--PRINT  ':: LocID=' + cast(@LocID as varchar(50)) 
	--PRINT  ':: ProdID=' + cast(@ProductID as varchar(50)) + char(13)

	SELECT top 1 @FoundLine = LineItemID 
				FROM ##ControlTable c
				WHERE @ControlLine <> c.LineItemID --and @ComboLine = ComboLineItemID and @ContractID = ContractID 
					and @SiteLoc = c.SiteLocationID and @LocID = c.LocationID
					and c.ProductID in (270,268,269,267,282) --<<-- Finder products
					and c.ComboID = 0 --is null
					and c.ComboLineItemID  = 0 --is null
				order by c.LocationID, c.SiteLocationID, c.ComboID, c.LineItemCreatedDate, c.ProductID, LineItemID

	IF @ComboLine = 0 --IS NULL
	BEGIN
		UPDATE a
		SET a.ComboLineItemID = @ControlLine, a.ComboCode = 6
		FROM 
			( 
				SELECT top 1 LineItemID 
				FROM ##ControlTable c
				WHERE @ControlLine <> c.LineItemID --and @ComboLine = ComboLineItemID and @ContractID = ContractID 
					and @SiteLoc = c.SiteLocationID and @LocID = c.LocationID
					and c.ProductID in (270,268,269,267,282) --<<-- Finder products
					--and c.ComboID is null
					and c.ComboLineItemID = 0 --is null
				order by c.LocationID, c.SiteLocationID, c.ComboID, c.LineItemCreatedDate, c.ProductID, LineItemID
			) ct
		JOIN ##ActiveLineItems a on ct.LineItemID = a.LineItemID
		
		--RAISERROR (N'%s',10,1, @ControlLine) With nowait;

		UPDATE a
		SET a.ComboLineItemID = @ControlLine, a.ComboCode = 6
		FROM ##ActiveLineItems a
		JOIN ##ActiveLineItems a2 ON a.LineItemID = @ControlLine and a.LineItemID = a2.ComboLineItemID

		UPDATE a
		SET a.ComboLineItemID = @ControlLine, a.ComboCode = 5
		FROM ##ActiveLineItems a
		WHERE a.LineItemID = @ControlLine and a.ComboLineItemID = 0 --is NULL

		--PRINT ':: FoundLine=' + cast(@FoundLine as varchar(50))
	END

    delete ##ControlTable
    where 
		LineItemID = @ControlLine 
		--or 
		--ComboLineItemID is not null
		--or LineItemID = (
		--		SELECT top 1 LineItemID 
		--		FROM #ControlTable c
		--		WHERE @ControlLine <> c.LineItemID --and @ComboLine = ComboLineItemID and @ContractID = ContractID 
		--			and @SiteLoc = c.SiteLocationID and @LocID = c.LocationID
		--			and c.ProductID in (270,268,269,267,282) --<<-- Finder products
		--			and c.ComboID is null
		--		order by c.LocationID, c.SiteLocationID, c.ComboID, c.LineItemCreatedDate, c.ProductID, LineItemID
		--		)

	SET @RemainingLinesCNT = (Select count(*) from ##ControlTable)
	SET @FinderCNT = (Select count(*) from ##ControlTable WHERE ProductID in (270,268,269,267,282))
		
		--PRINT ':: 2FoundLine=' + cast(@FoundLine as varchar(50))

	IF @FinderCNT = @RemainingLinesCNT
	BEGIN
		UPDATE a
		SET a.ComboLineItemID = a.LineItemID, a.ComboCode = 5
		FROM ##ActiveLineItems a
		JOIN ##ControlTable ctrl on a.LineItemID = ctrl.LineItemID and a.ComboLineItemID = 0 --is null
		--WHERE a.LineItemID = @ControlLine and a.ComboLineItemID is NULL

		TRUNCATE ##ControlTable
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
where lineitemid in (1506351, 1772332)

select top 500 *
from ##ActiveLineItems a
where LocationID = 
	--52211651 
	41264081 
	and ComboID = 0 --is null
order by a.LocationID, a.SiteLocationID, a.ComboID, a.LineItemCreatedDate, a.ProductID

/*
UPDATE a2
SET ComboLineItemID = ali.LineItemID
from ##ActiveLineItems ali
join (
		select 
			SiteLocationID
			, LineItemID
			, LocationID 
			, ContractID
			, ContractMinCreateDate
			, ContractMinMEA
			--, ROW_NUMBER() OVER(partition by ali2.LocationID, ali2.ContractMinMEA ORDER BY ali2.contractid) as CreateOrder
			, ComboLineItemID
		from ##ActiveLineItems a
		where a.ComboLineItemID is null
			--ali.SiteLocationID = a2.SiteLocationID and ali.LineItemID <> a2.LineItemID and a2.ComboLineItemID is null
	) a2 on ali.SiteLocationID = a2.SiteLocationID and ali.LineItemID <> a2.LineItemID and a2.ComboLineItemID is null
		--parent on ali.locationid = parent.locationid and CreateOrder = 1
		--and ali.ContractMinMEA = parent.ContractMinMEA
WHERE ali.LocationID = 41264081 and ComboID is null
--ORDER BY a.LocationID, a.SiteLocationID, a.LineItemCreatedDate, a.ProductID
*/
select count (*)
from ##ActiveLineItems a
where  IsActive2016 = 1
	and a.ProductID in (248,252,245,250,247,251,246,249,281 --<<-- APTS.com products
						,270,268,269,267,282) 

*/