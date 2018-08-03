SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[usp_mtGetPriceHistory]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [usp_mtGetPriceHistory]
GO

/*
usp_mtGetPriceHistory
'<Params>
              <UserId>VGXS</UserId>
              <ItemCode>6</ItemCode>
              <Wednesday>7/24/2002</Wednesday>
              <MarketId>9</MarketId>
              <DivisionId>3</DivisionId>
              <GetHistory>Y</GetHistory>
	      <Debug>1</Debug>
            </Params>' 

SELECT StoreNumber, MarketID
FROM	dbo.ufn_GetItemStoreSubset (67198, '10/17/01', null, 3, null, null)

SELECT fgs.SBUCode
FROM 	ItemFamilyGroup ifg INNER JOIN FamilyGroupSBU fgs
        	ON fgs.FamilyGroupCode = ifg.FamilyGroupCode
WHERE 	ifg.ItemCode = 330057 AND 
      	'10/17/01' BETWEEN ifg.EffectiveDate AND ifg.TerminationDate AND
      	'10/17/01' BETWEEN fgs.EffectiveDate AND fgs.TerminationDate AND
	ifg.Status = 'A' AND fgs.Status = 'A'

select * from market
select * from marketstrategyrule where marketid = 3 and sbucode = 11001
select * from competitor

*/

Create              PROCEDURE dbo.usp_mtGetPriceHistory
/******************************************************************************
    Created On:    10/12/2000    Jeff Winchester

    Description:
        This procedure retrieves all necessary data for the Price History page:
            - 8 weeks of competitive price history for up to 3 competitors
            - 8 weeks of Publix price history (with ad indicators)
            - 8 weeks of Publix movement info
            - 8 weeks of Publix cost info

            Results are returned in the form:
                <Root>
                  <Record>
                    <Date>
                      XXX
                    </Date>
                    <Competitor>
                      <Name>XXX</Name>
                      <Price>XXX</Price
                    </Competitor>
                    <Competitor>
                      <Name>XXX</Name>
                      <Price>XXX</Price
                    </Competitor>
                    <Competitor>
                      <Name>XXX</Name>
                      <Price>XXX</Price
                    </Competitor>
                    <Publix>
                      <Price>XXX</Price>
                      <Movement>XXX</Movement>
                      <Cost>XXX</Cost>
                    </Publix>
                  </Record>
                  ...
                  <Record>
                    <Date>
                      XXX
                    </Date>
                    <Competitor>
                      <Name>XXX</Name>
                      <Price>XXX</Price
                    </Competitor>
                    <Competitor>
                      <Name>XXX</Name>
                      <Price>XXX</Price
                    </Competitor>
                    <Competitor>
                      <Name>XXX</Name>
                      <Price>XXX</Price
                    </Competitor>
                    <Publix>
                      <Price>XXX</Price>
                      <Movement>XXX</Movement>
                      <Cost>XXX</Cost>
                    </Publix>
                  </Record>
                </Root>

    Input Parameters:
        - XMLDoc in the form
            <Params>
              <UserId>XXX</UserId>
              <ItemCode>XXX</ItemCode>
              <Wednesday>XXX</Wednesday>
              <MarketId>XXX</MarketId>*
              <DivisionId>XXX</DivisionId>*
              <SupplierId>XXX</SupplierId>
              <GetHistory>Y</GetHistory>
	      <Debug>1</Debug>
            </Params>

            "*" Indicates an optional parameter (omit the tags if the
            parameter is not passed)

    Output Parameters:

    Notes:

    Modifications:
        - [6/12/2002] Added a new flag @cGetHistory to control the possibility of 
            ItemStorePriceHistory not being available. (VRXM)
******************************************************************************/

/*******************************************
    Parameters
*******************************************/
(
    @XmlDoc    text
)

AS
/*******************************************
    User Variables
*******************************************/
DECLARE @chrWeekEndDate  char(10)
DECLARE @iDoc            int
DECLARE @iItemCode       int
DECLARE @iLoopCounter    int
DECLARE @iMarketId       int
DECLARE @iDivisionId     int
DECLARE @iStoreNumber    int
DECLARE @iSupplierId     int
DECLARE @sLoopDate       datetime
DECLARE @sUserId         varchar(8)
DECLARE @sWednesday      datetime
DECLARE @vchCodeSection  varchar(256)
DECLARE @iDebug tinyint
DECLARE @iSBUCode int
DECLARE @cGetHistory char(1)
DECLARE @sQuery		 nvarchar(4000)
Declare	@vcSessionName   varchar(32)
declare @vcArguments    varchar(4000)

DECLARE @tblStores TABLE (StoreNumber int, MarketID int)

-- temp tables to hold competitor data results 
DECLARE @tTemp_CompetitorData TABLE (
    WeekEnding        datetime       NOT NULL
  , CompanyName       varchar(32)    NOT NULL
  , SaleQuantity      int            NULL
  , RetailPrice       money          NULL
  , PriceTypeCode     char(1)        NULL
)

-- temp tables to hold results
DECLARE @tTemp_PriceHistory TABLE (
    WeekEnding        datetime       NOT NULL
  , CompanyName       varchar(32)    NOT NULL
  , SaleQuantity      int            NULL
  , RetailPrice       money          NULL
  , PriceTypeCode     char(1)        NULL
  , Cost              money          NULL
  , Movement          int            NULL
)

DECLARE @tPriceHistory TABLE (
    WeekEnding        datetime       NOT NULL
  , CompanyName       varchar(32)    NOT NULL
  , SaleQuantity      int            NULL
  , RetailPrice       money          NULL
  , PriceTypeCode     char(1)        NULL
  , Cost              money          NULL
  , Movement          int            NULL
  , OnAd              tinyint        NULL
)

Create table #ItemMovement_History
(    
    ItemMovementID bigint, 
    ItemCode int, 
    StoreNumber int, 
    WeekEndingDate datetime, 
    QuantitySold int, 
    Status char(1)
)

Create table #ItemStorePriceHistory 
(
    ItemStorePriceID bigint, 
    ItemCode int, 
    StoreNumber int, 
    ItemSupplierCostID bigint, 
    EffectiveDate datetime, 
    TerminationDate datetime, 
    PriceTypeID int, 
    Status char(1), 
    ApprovalStatusCode char(1), 
    NonLocallyOptimizedPrice money, 
    NLOSaleQuantity int
)

Create table #CompetitorPriceHistory_History
(
    CompetitorPriceHistoryID bigint, 
    ItemCode int, 
    WeekEnding datetime, 
    CompetitorRetailQuantity int, 
    CompetitorRetailPrice money, 
    CompetitorID int, 
    MarketID int, 
    CompetitorPriceTypeID int, 
    Status char (1)
)

Create table #ItemStoreAdHistory
(
    ItemCode int, 
    StoreNumber int, 
    AdEffectiveDate datetime, 
    AdTerminationDate datetime
)


/*******************************************
    Transact-SQL
*******************************************/
SET NOCOUNT ON

SET @vchCodeSection = 'Parsing XMLDoc'

-- prepare the XML doc
EXEC sp_xml_preparedocument @iDoc OUTPUT, @XmlDoc

SELECT @sUserID      = UserId
     , @iItemCode    = ItemCode
     , @sWednesday   = Wednesday
     , @iMarketId    = MarketId
     , @iDivisionId  = DivisionId
     , @iStoreNumber = StoreNumber
     , @iSupplierId  = SupplierId
     , @iDebug	     = Debug
     , @cGetHistory  = GetHistory
FROM OPENXML(@iDoc, '/Params', 2)

WITH (UserId      varchar(8) 'UserId'
    , ItemCode    int        'ItemCode'
    , Wednesday   datetime   'Wednesday'
    , MarketId    int        'MarketId'
    , DivisionId  int        'DivisionId'
    , StoreNumber int        'StoreNumber'
    , SupplierId  int        'SupplierId'
    , Debug	  int 	     'Debug'
    , GetHistory char(1) 'GetHistory')

-- destroy the XML doc
EXEC sp_xml_removedocument @iDoc

IF 0 <> @@ERROR GOTO Error_Handler


Select @vcSessionName=convert(varchar(6), @sUserId)+','+convert(varchar(6), @iItemCode)+','+CONVERT(varchar(10), @sWednesday, 12)+','+convert(varchar(20),getdate(), 14)

exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory', 'Start'

set @vcArguments= 'Arg-' + convert(varchar(1000), @XmlDoc)
exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory',  @vcArguments    


IF @iDebug IS NULL
	SET @iDebug = 0

-- and here's the real meat and potatoes...

-------------------------------------------------------------------------------
-- STEP 1: Populate the temp table
-------------------------------------------------------------------------------
-- We will populate the table with all the Competitors for the given Item,
-- Market, and Division.  Then in STEP 3, we can update this table and assign
-- the RetailPrice for each Week-Competitor.  This strategy will ensure that we
-- return all competitors (and show zeros for price) even if we do not have any 
-- competitor price history.  The exception to all of this is when no market is
-- specified (i.e., Market is NULL), in which case we do not retrieve
-- competitive information (there is no single competitor anywhere outside of a
-- market, as this is done by market/SBU).
-------------------------------------------------------------------------------

SET @vchCodeSection = 'Step 1 - Getting list of stores to be processed'

exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory', @vchCodeSection 

IF @iDebug > 0
	print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

INSERT @tblStores
SELECT StoreNumber, MarketID
FROM	dbo.ufn_GetItemStoreSubset (@iItemCode, @sWednesday, @iDivisionId, @iMarketId, @iSupplierId, @iStoreNumber)



SELECT @iSBUCode = fgs.SBUCode
FROM 	ItemFamilyGroup ifg INNER JOIN FamilyGroupSBU fgs
        	ON fgs.FamilyGroupCode = ifg.FamilyGroupCode
WHERE 	ifg.ItemCode = @iItemCode AND 
      	@sWednesday BETWEEN ifg.EffectiveDate AND ifg.TerminationDate AND
      	@sWednesday BETWEEN fgs.EffectiveDate AND fgs.TerminationDate AND
	ifg.Status = 'A' AND fgs.Status = 'A'

SET @vchCodeSection = 'Step 2 - Populating competitor information'

exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory', @vchCodeSection 

IF @iDebug > 0
	print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 


IF @cGetHistory = 'Y'
    BEGIN

        -----------------------------------------------------
        -- Retrieve Flex_History data into temp tables
        -----------------------------------------------------
        Set @sQuery=N'SELECT CompetitorPriceHistoryID, ItemCode, WeekEnding, CompetitorRetailQuantity, CompetitorRetailPrice, CompetitorID, MarketID, CompetitorPriceTypeID, Status
    FROM OPENQUERY(FLEX_HISTORY, ''SELECT CompetitorPriceHistoryID, ItemCode, WeekEnding, CompetitorRetailQuantity, CompetitorRetailPrice, CompetitorID, MarketID, CompetitorPriceTypeID, Status FROM Flex_History.dbo.CompetitorPriceHistory
    Where ItemCode = ' + CAST(@iItemcode as varchar(10)) + ' 
    AND WeekEnding between ''''' + convert(varchar(10),DATEADD(dd, -56, @sWednesday),101) + 
     ''''' and '''''+convert(varchar(10),DATEADD(dd, -7, @sWednesday),101) +''''''')'

         Insert into #CompetitorPriceHistory_History
         exec sp_executesql @sQuery
--      select count(*) from #CompetitorPriceHistory_History
--         SELECT CompetitorPriceHistoryID, ItemCode, WeekEnding, CompetitorRetailQuantity, CompetitorRetailPrice, CompetitorID, MarketID, CompetitorPriceTypeID, Status 
--         FROM Flex_History.Flex_History.dbo.CompetitorPriceHistory
--         Where ItemCode = @iItemcode and WeekEnding between DATEADD(dd, -56, @sWednesday)
--             and DATEADD(dd, -7, @sWednesday)

    SET @vchCodeSection = 'Step 3 - Getting list of competitor pricing history'

    exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory', @vchCodeSection 

    IF @iDebug > 0
	    print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

        Set @sQuery=N'SELECT ItemMovementID, ItemCode, StoreNumber, WeekEndingDate, QuantitySold, Status
    FROM OPENQUERY(FLEX_HISTORY, ''SELECT ItemMovementID, ItemCode, StoreNumber, WeekEndingDate, QuantitySold, Status 
    FROM Flex_History.dbo.ItemMovement_Current  (index=ndx_ItemMovementCurr_ItmWk,nolock)
    Where ItemCode = ' + CAST(@iItemcode as varchar(10)) + ' 
    AND WeekEndingDate between ''''' + convert(varchar(10),DATEADD(dd, -56, @sWednesday),101) + 
     ''''' and '''''+convert(varchar(10),DATEADD(dd, -7, @sWednesday),101) +'''''
    UNION ALL 
    SELECT ItemMovementID, ItemCode, StoreNumber, WeekEndingDate, QuantitySold, Status 
    FROM Flex_History.dbo.ItemMovement_History  (index=ndx_ItemMovementHist_ISWkEnd,nolock)
    Where ItemCode = ' + CAST(@iItemcode as varchar(10)) + ' 
    AND WeekEndingDate between ''''' + convert(varchar(10),DATEADD(dd, -56, @sWednesday),101) + 
     ''''' and '''''+convert(varchar(10),DATEADD(dd, -7, @sWednesday),101) +''''''')'
        Insert INTO #ItemMovement_History
        exec sp_executesql @sQuery
--     select count(*) from #ItemMovement_History

--         SELECT ItemMovementID, ItemCode, StoreNumber, WeekEndingDate, QuantitySold, Status 
--         FROM Flex_History.Flex_History.dbo.ItemMovement_Current
--         Where ItemCode = @iItemcode 
--             AND WeekEndingDate between DATEADD(dd, -56, @sWednesday)
--             and DATEADD(dd, -7, @sWednesday)
--         UNION ALL
--         SELECT ItemMovementID, ItemCode, StoreNumber, WeekEndingDate, QuantitySold, Status 
--         FROM Flex_History.Flex_History.dbo.ItemMovement_History
--         Where ItemCode = @iItemcode 
--             AND WeekEndingDate between DATEADD(dd, -56, @sWednesday)
--             and DATEADD(dd, -7, @sWednesday)

        SET @vchCodeSection = 'Step 4 - Getting list of movement history'

    	exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory', @vchCodeSection 
        IF @iDebug > 0
	    print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

          Set @sQuery=N'SELECT ItemStorePriceID, ItemCode, StoreNumber, ItemSupplierCostID, EffectiveDate, TerminationDate, 
                PriceTypeID, Status, ApprovalStatusCode, NonLocallyOptimizedPrice, NLOSaleQuantity
    FROM OPENQUERY(FLEX_HISTORY, ''SELECT ItemStorePriceID, ItemCode, StoreNumber, ItemSupplierCostID, EffectiveDate, TerminationDate, 
                PriceTypeID, ''''A'''' as ''''Status'''', ApprovalStatusCode, NonLocallyOptimizedPrice, NLOSaleQuantity 
    FROM Flex_History.dbo.ItemStorePrice_Current (index=idxItemStorePrice_Current_IE,nolock)

    Where ItemCode = ' + CAST(@iItemcode as varchar(10)) + ' 
    AND EffectiveDate between ''''' + convert(varchar(10),DATEADD(dd, -56, @sWednesday),101) + 
     ''''' and '''''+convert(varchar(10),DATEADD(dd, -7, @sWednesday),101) +'''''
    UNION ALL
    SELECT ItemStorePriceID, ItemCode, StoreNumber, ItemSupplierCostID, EffectiveDate, TerminationDate, 
                PriceTypeID, ''''A'''' as ''''Status'''', ApprovalStatusCode, NonLocallyOptimizedPrice, NLOSaleQuantity 
    FROM Flex_History.dbo.ItemStorePrice_History 
    Where ItemCode = ' + CAST(@iItemcode as varchar(10)) + ' 
    AND EffectiveDate between ''''' + convert(varchar(10),DATEADD(dd, -56, @sWednesday),101) + 
     ''''' and '''''+convert(varchar(10),DATEADD(dd, -7, @sWednesday),101) +''''''')'

       Insert INTO #ItemStorePriceHistory
        exec sp_executesql @sQuery
--    select count(*) from #ItemStorePriceHistory
--        SELECT ItemStorePriceID, ItemCode, StoreNumber, ItemSupplierCostID, EffectiveDate, TerminationDate, 
--                  PriceTypeID, 'A' as Status, ApprovalStatusCode, NonLocallyOptimizedPrice, NLOSaleQuantity 
--        FROM Flex_History.Flex_History.dbo.ItemStorePrice_Current
--        Where ItemCode = @iItemcode
--        AND EffectiveDate between DATEADD(dd, -56, @sWednesday) and DATEADD(dd, -7, @sWednesday)
--        UNION ALL
--        SELECT ItemStorePriceID, ItemCode, StoreNumber, ItemSupplierCostID, EffectiveDate, TerminationDate, 
--                  PriceTypeID, 'A' as Status, ApprovalStatusCode, NonLocallyOptimizedPrice, NLOSaleQuantity 
--        FROM Flex_History.Flex_History.dbo.ItemStorePrice_History
--        Where ItemCode = @iItemcode
--        AND EffectiveDate between DATEADD(dd, -56, @sWednesday) and DATEADD(dd, -7, @sWednesday)

        SET @vchCodeSection = 'Step 5 - Getting list of item store history'

	    exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory', @vchCodeSection 
        IF @iDebug > 0
	    print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

          Set @sQuery=N'SELECT ItemCode, StoreNumber, AdEffectiveDate, AdTerminationDate
    FROM OPENQUERY(FLEX_HISTORY, ''SELECT ItemCode, StoreNumber, AdEffectiveDate, AdTerminationDate 
    FROM Flex_History.dbo.ItemStoreAd
    Where ItemCode = ' + CAST(@iItemcode as varchar(10)) + ' 
    AND AdEffectiveDate between ''''' + convert(varchar(10),DATEADD(dd, -56, @sWednesday),101) + 
     ''''' and '''''+convert(varchar(10),DATEADD(dd, -7, @sWednesday),101) +''''''')'

--         Insert INTO #ItemStoreAdHistory
--         (ItemCode, StoreNumber, AdEffectiveDate, AdTerminationDate)
--         SELECT ItemCode, StoreNumber, AdEffectiveDate, AdTerminationDate 
--         FROM Flex_History.Flex_History.dbo.ItemStoreAd
--         Where ItemCode = @iItemcode 
--         AND AdEffectiveDate between DATEADD(dd, -56, @sWednesday) and DATEADD(dd, -7, @sWednesday)
    Insert INTO #ItemStoreAdHistory
    exec sp_executesql @sQuery
--  select count(*) from #ItemStoreAdHistory

        SET @vchCodeSection = 'Step 6 - Getting list of store ad history'

	exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory',@vchCodeSection 
        IF @iDebug > 0
	    print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

        -----------------------------------------------------
        -- Create indexes on the frequently used temp tables
        -----------------------------------------------------

        CREATE INDEX IX_ItemCode on #ItemStoreAdHistory(ItemCode, StoreNumber)
        CREATE INDEX IX_ItemCode on #ItemStorePriceHistory(ItemCode, StoreNumber)

END

-- load the table with one record for each week ending date
DECLARE @tblWeekEndings TABLE (WeekEnding datetime)
SET @iLoopCounter = -7
WHILE @iLoopCounter >= -56
BEGIN
	INSERT INTO @tblWeekEndings values (DATEADD(dd, @iLoopCounter, @sWednesday))	
	SET @iLoopCounter = @iLoopCounter - 7
END 

-- if market was provided, get competitive information
IF @iMarketId IS NOT NULL
BEGIN

	SET @vchCodeSection = 'Gathering competitors for the given markets'



	-- Now, load another temp table with the list of competitors
----------------------------------------------------------------------------
--	Using dynamic SQL statements to handle wildcards in Market, Division and Store
-- 	Need to use Temp table instead of memory variable due to the use of the EXEC
--  	statement in populating it
------------------------------------------------------------------------------------

	declare @tblCompetitors table (CompetitorID int, CompanyName varchar(32), MarketID int)
	
 SET @vchCodeSection = 'Step 7 -Populating temp table with list of competitors'

	exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory',@vchCodeSection 
	IF @iDebug > 0
		print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

	-- populate temp table with list of competitors
    INSERT @tblCompetitors
	SELECT DISTINCT c.CompetitorID, c.CompetitorName, ms.MarketID
	FROM 	MarketStrategyRule ms INNER JOIN Competitor c
	        	ON ms.CompetitorID = c.CompetitorID
	WHERE 	c.Status = 'A' AND 
		ms.SBUCode = @iSBUCode AND
		ms.Status = 'A' AND
		@sWednesday BETWEEN ms.EffectiveDate AND ms.TerminationDate AND
		ms.MarketID IN (SELECT DISTINCT MarketID FROM @tblStores)
	IF 0 <> @@ERROR GOTO Error_Handler

	-- now cross join the above 2 temp tables to get list of competitors by week
        INSERT @tPriceHistory (
            WeekEnding
          , CompanyName
        )
	SELECT	WeekEnding, CompanyName
	FROM	@tblWeekEndings CROSS JOIN @tblCompetitors

	IF 0 <> @@ERROR GOTO Error_Handler
    
    ---------------------------------------------------------------------------
    -- STEP 3: Assign retail price for each Week-Competitor
    ---------------------------------------------------------------------------
    -- Get retail price from competitor price history data
    ---------------------------------------------------------------------------

    SET @vchCodeSection = 'Step 8 - Assigning retail prices for each week/competitor (temp table)'

	exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory',@vchCodeSection 
	IF @iDebug > 0
		print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

    INSERT @tTemp_CompetitorData(
        WeekEnding
      , CompanyName
      , SaleQuantity
      , RetailPrice
      , PriceTypeCode
    )
    SELECT cph.WeekEnding
         , c.CompanyName
         , cph.CompetitorRetailQuantity
         , cph.CompetitorRetailPrice
         , pt.PriceTypeCode
    FROM @tblCompetitors c 
        INNER JOIN CompetitorPriceHistory cph WITH (NOLOCK)
            ON cph.CompetitorID = c.CompetitorID AND cph.MarketID = c.MarketID
        INNER JOIN PriceType pt WITH (NOLOCK)
            ON pt.PriceTypeID = cph.CompetitorPriceTypeID
    WHERE cph.ItemCode = @iItemCode
      AND cph.WeekEnding Between DATEADD(dd, -56, @sWednesday) and DATEADD(dd, -7, @sWednesday)
      AND cph.Status = 'A'

    SET @vchCodeSection = 'Step 9 - Assigning retail prices for each week/competitor (Step 1)'

	exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory', @vchCodeSection 
	IF @iDebug > 0
		print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

IF @cGetHistory = 'Y'
    BEGIN

        INSERT @tTemp_CompetitorData(
            WeekEnding
          , CompanyName
          , SaleQuantity
          , RetailPrice
          , PriceTypeCode
        )
        SELECT cph.WeekEnding
             , c.CompanyName
             , cph.CompetitorRetailQuantity
             , cph.CompetitorRetailPrice
             , pt.PriceTypeCode
        FROM @tblCompetitors c 
            INNER JOIN #CompetitorPriceHistory_History cph 
                ON cph.CompetitorID = c.CompetitorID AND cph.MarketID = c.MarketID
            INNER JOIN PriceType pt WITH (NOLOCK)
                ON pt.PriceTypeID = cph.CompetitorPriceTypeID
        WHERE cph.ItemCode = @iItemCode
          AND cph.WeekEnding Between DATEADD(dd, -56, @sWednesday) and DATEADD(dd, -7, @sWednesday)
          AND cph.Status = 'A'
          AND NOT EXISTS (SELECT 1 FROM CompetitorPriceHistory cph_c
                            WHERE cph_c.CompetitorPriceHistoryID = cph.CompetitorPriceHistoryID
                         )
    END



    SET @vchCodeSection = 'Step 10 -Assigning retail prices for each week/competitor (History Step 1)'

	exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory',@vchCodeSection 
	IF @iDebug > 0
		print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

    INSERT @tTemp_PriceHistory (
        WeekEnding
      , CompanyName
      , SaleQuantity
      , RetailPrice
      , PriceTypeCode
    )
    SELECT WeekEnding
          , CompanyName
          , AVG(SaleQuantity)
          , CAST(AVG(RetailPrice) AS money)
          , MAX(PriceTypeCode)
        FROM @tTemp_CompetitorData
        GROUP BY WeekEnding, CompanyName
    IF 0 <> @@ERROR GOTO Error_Handler
    
    SET @vchCodeSection = 'Step 11 -ssigning retail prices for each week/competitor (final update)'

	exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory', @vchCodeSection 
	IF @iDebug > 0
		print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

    -- assign comp price data to each competitor
    UPDATE @tPriceHistory
    SET	SaleQuantity = b.SaleQuantity
      , RetailPrice = CAST(b.RetailPrice AS money)
      , PriceTypeCode = b.PriceTypeCode
    FROM @tPriceHistory a
        INNER JOIN @tTemp_PriceHistory b
            ON dbo.ufn_GetDate('Prev', 'Wednesday',a.WeekEnding) = b.WeekEnding
           AND a.CompanyName = b.CompanyName

    IF 0 <> @@ERROR GOTO Error_Handler

END --END IF for market provided

IF 0 <> @@ERROR GOTO Error_Handler

---------------------------------------------------------------------------
-- STEP 4: Get Publix Cost, Retail Price, and Price Type info
---------------------------------------------------------------------------
-- Call a UDF to obtain this data for all 8 weeks
---------------------------------------------------------------------------

----------------------------------------
-- Get the Publix price/cost info.
--
-- Note that:
--     * The retail price shown here is
--       weighted by movement.
--     * Because the retail price is
--       weighted, the quanitity is
--       always 1.
--     * The cost shown here is weighted
--       by movement.  Because the cost is weighted,
--       the quanitity is always 1.
----------------------------------------

SET @vchCodeSection = 'Step 12 - Getting Publix price/cost information'

exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory',@vchCodeSection 
IF @iDebug > 0
		print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

/*************************************************************************
Start: Inline Code FROM ufn_Compute8WeeksWeightedCostRetailPriceType
*************************************************************************/



            DECLARE @tStoreList TABLE (
            	StoreNumber 	int
            )
        
            /***************************************
                Transact-SQL
            ***************************************/
        
            ---------------------------------------------------------------------------
            -- STEP 2: Get List of stores to be processed
            ---------------------------------------------------------------------------
            --  If no SupplierID is provided then we only need to consider Market and Division to build this list.
            --  Otherwise, we need to consider which stores are authorized for the given supplier for each of the 8 Week Ending dates
            ---------------------------------------------------------------------------
        
        INSERT INTO @tStoreList
        -- note that the @i* versions of the integer variables are used here
        -- because if NULL was passed in, we want NULL to go to the ufn
        SELECT DISTINCT ufn.StoreNumber
        FROM dbo.ufn_GetListOfStoresForLast8Weeks (@iItemCode
                                      , @sWednesday
                                      , @iDivisionID
                                      , @iMarketID
                                      , @iSupplierID
                                      , @iStoreNumber) ufn
        
        
        
            ---------------------------------------------------------------------------
            -- STEP 3: Get list of all price records for given ItemCode and list of stores for each of the 8 WeekEnding dates
            ---------------------------------------------------------------------------
        
        Declare @nTemp1 TABLE (	ispid 			int identity(1, 1), 
				WeekEnding 		datetime, 
				ItemStorePriceID 	bigint, 
                               	ItemStoreID 		int, 
				PriceTypeCode 		char(1),
                                RetailPrice    		money,		--added by PTXP 
                                SaleQuantity 		int		--added by PTXP 
				) 
        
        Declare @nTemp2 TABLE (ItemStoreID int, ispid int, WeekEnding datetime, ItemStorePriceID bigint) 
        
        ---- 02/08/2001 - PJWW
        --Declare @nTemp4 TABLE (WeekEnding datetime, ItemStorePriceID bigint) 
        Declare @nTemp4 TABLE (	WeekEnding 		datetime, 
				ItemStorePriceID 	bigint, 
				OnAd 			tinyint,
                                RetailPrice    		money,		--added by PTXP 
                                SaleQuantity 		int		--added by PTXP 
			      )
        
        Declare @nTemp5 Table (	WeekEnding       	datetime,
				RetailPrice      	money,
				SaleQuantity		int,		--added by PTXP 
				Cost             	money,
				Movement         	int,
				PriceTypeCode    	char(1),
				OnAd             	tinyint
        )
        
        -- Get all price records for given week by ItemStore order by PriceType DESC, EffDate DESC
        INSERT     @nTemp1 (WeekEnding, ItemStorePriceID, ItemStoreID, PriceTypeCode,
				RetailPrice, SaleQuantity)				--added by ptxp
        SELECT     t.WeekEnding, isp_c.ItemStorePriceID, ist_c.ItemStoreID, pt_c.PriceTypeCode, 
                   isp_c.NonLocallyOptimizedPrice, isp_c.NLOSaleQuantity		--added by ptxp
        FROM       ItemStorePrice  isp_c  WITH (NOLOCK)
                    INNER JOIN @tblWeekEndings t
                        ON isp_c.EffectiveDate <= WeekEnding and isp_c.TerminationDate > WeekEnding
                    INNER JOIN ItemSupplierCost isc_c
                        ON isc_c.ItemSupplierCostID = isp_c.ItemSupplierCostID
                    INNER JOIN ItemStore ist_c  WITH (NOLOCK)
                        ON isp_c.ItemCode = ist_c.ItemCode and isp_c.StoreNumber = ist_c.StoreNumber
                    INNER JOIN @tStoreList sl_c
                        ON ist_c.StoreNumber = sl_c.StoreNumber
                    INNER JOIN PriceType pt_c  WITH (NOLOCK)
                        ON pt_c.PriceTypeID = isp_c.PriceTypeID
        WHERE 
        		  isp_c.ItemCode = @iItemCode
                  AND ist_c.ItemCode = @iItemCode
        	      AND isp_c.ApprovalStatusCode = 'A'
                  AND isp_c.Status = 'A'
        ORDER BY    ist_c.ItemStoreID, pt_c.PriceTypeCode DESC, -- To get the TPR price first if exists
        		    isp_c.EffectiveDate DESC -- To get the latest Effective Date first

	    exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory','Step 13 -Populate Price Data '
    	IF @iDebug > 0        
            print convert(char(32),getdate(),109) + ': Populate Price Data'
        
        IF @cGetHistory = 'Y'
            BEGIN	
                --Get data from history data
                INSERT     @nTemp1 (WeekEnding, ItemStorePriceID, ItemStoreID, PriceTypeCode,
                                	RetailPrice, SaleQuantity)				--added by ptxp
                SELECT     t.WeekEnding, isp_c.ItemStorePriceID, ist_c.ItemStoreID, pt_c.PriceTypeCode,
                           isp_c.NonLocallyOptimizedPrice, isp_c.NLOSaleQuantity		--added by ptxp

                FROM       #ItemStorePriceHistory isp_c  
                            INNER JOIN @tblWeekEndings t
                                ON isp_c.EffectiveDate <= WeekEnding and isp_c.TerminationDate > WeekEnding
                            INNER JOIN ItemSupplierCost isc_c
                                ON isc_c.ItemSupplierCostID = isp_c.ItemSupplierCostID
                            INNER JOIN ItemStore ist_c  WITH (NOLOCK)
                                ON isp_c.ItemCode = ist_c.ItemCode and isp_c.StoreNumber = ist_c.StoreNumber
                            INNER JOIN @tStoreList sl_c
                                ON ist_c.StoreNumber = sl_c.StoreNumber
                            INNER JOIN PriceType pt_c  WITH (NOLOCK)
                                ON pt_c.PriceTypeID = isp_c.PriceTypeID
                WHERE 
                		  isp_c.ItemCode = @iItemCode
                          AND ist_c.ItemCode = @iItemCode
                	      AND isp_c.ApprovalStatusCode = 'A'
                          --AND isp_c.Status = 'A'
                          AND NOT EXISTS (SELECT 1 FROM ItemStorePrice  isp 
                                            WHERE isp.ItemStorePriceID = isp_c.ItemStorePriceID)
                ORDER BY    ist_c.ItemStoreID, pt_c.PriceTypeCode DESC, -- To get the TPR price first if exists
                		    isp_c.EffectiveDate DESC -- To get the latest Effective Date first
            
		exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory','Step 14 -Populate Historical Price Data ' 
        	IF @iDebug > 0        
                print convert(char(32),getdate(),109) + ': Populate Historical Price Data'
            END        
        
        -- Get a list of the topmost record for each ItemStoreID for this week, so that TPR wins over Permanent and we get the latest effective date
        Insert 	@nTemp2 (WeekEnding, ItemStoreID, ispid)
        Select 	t2.WeekEnding, t1.ItemStoreID, Min(t1.ispid)
        From 	@nTemp1 t1 INNER JOIN @tblWeekEndings t2
        	  ON (t1.WeekEnding = t2.WeekEnding)
        Group By t2.WeekEnding, t1.ItemStoreID
        
        -- extract list of price record ids for each weekending date into a separate temp table
        insert	@nTemp4 
		(WeekEnding,ItemStorePriceID,OnAd,RetailPrice,SaleQuantity)			--added by PTXP 
	        Select	a.WeekEnding, b.ItemStorePriceID, 0,
			RetailPrice,SaleQuantity						--added by PTXP 
	        from	@nTemp2 a 
			INNER JOIN @nTemp1 b
	        	  ON (a.ispid = b.ispid)
        
        ---- 02/08/2001 - PJWW
        -- set the OnAd flags
        UPDATE @nTemp4
        SET OnAd = 1
        FROM @nTemp4 nt4
            INNER JOIN ItemStorePrice  isp WITH (NOLOCK)
                ON isp.ItemStorePriceID = nt4.ItemStorePriceID
            INNER JOIN ItemStore its  WITH (NOLOCK)
                ON its.ItemCode = isp.ItemCode
               AND its.StoreNumber = isp.StoreNumber
            INNER JOIN ItemStoreAd isa  WITH (NOLOCK)
                ON isa.ItemStoreID = its.ItemStoreID
        WHERE  isp.ItemCode = @iItemCode
          AND its.ItemCode = @iItemCode
          AND nt4.WeekEnding BETWEEN isa.AdEffectiveDate AND isa.AdTerminationDate
          AND nt4.WeekEnding BETWEEN isp.EffectiveDate AND isp.TerminationDate
          AND isa.Status = 'A'
        
	exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory','Step 15 - Get Current OnAd flag' 
    	IF @iDebug > 0        
            print convert(char(32),getdate(),109) + ': Get Current OnAd flag'
        
        /* Consider Archived Ads if they meet the criteria [VRXM] */
        IF @cGetHistory = 'Y'
            BEGIN
                UPDATE @nTemp4
                SET OnAd = 1
                FROM @nTemp4 nt4
                    INNER JOIN ItemStorePrice  isp WITH (NOLOCK)
                        ON isp.ItemStorePriceID = nt4.ItemStorePriceID
                    INNER JOIN ItemStore its  WITH (NOLOCK)
                        ON its.ItemCode = isp.ItemCode
                       AND its.StoreNumber = isp.StoreNumber
                    INNER JOIN #ItemStoreAdHistory isa  WITH (NOLOCK)
                        ON isa.ItemCode = its.ItemCode
                        AND isa.StoreNumber = its.StoreNumber
                WHERE  isp.ItemCode = @iItemCode
                  AND its.ItemCode = @iItemCode
                  AND isa.ITemCode = @iItemCode
                  AND nt4.WeekEnding BETWEEN isa.AdEffectiveDate AND isa.AdTerminationDate
                  AND nt4.WeekEnding BETWEEN isp.EffectiveDate AND isp.TerminationDate
        --          AND isa.Status = 'A'
        
            END
        
        IF @cGetHistory = 'Y'
            BEGIN
                UPDATE @nTemp4
                SET OnAd = 1
                FROM @nTemp4 nt4
                    INNER JOIN #ItemStorePriceHistory isp
                        ON isp.ItemStorePriceID = nt4.ItemStorePriceID
                    INNER JOIN ItemStore its  WITH (NOLOCK)
                        ON its.ItemCode = isp.ItemCode
                       AND its.StoreNumber = isp.StoreNumber
                    INNER JOIN ItemStoreAd isa  WITH (NOLOCK)
                        ON isa.ItemStoreID = its.ItemStoreID
                WHERE  isp.ItemCode = @iItemCode
                  AND its.ItemCode = @iItemCode
                  AND nt4.WeekEnding BETWEEN isa.AdEffectiveDate AND isa.AdTerminationDate
                  AND nt4.WeekEnding BETWEEN isp.EffectiveDate AND isp.TerminationDate
                  AND isa.Status = 'A'
        
                /* Consider Archived Ads if they meet the criteria [VRXM] */
                UPDATE @nTemp4
                SET OnAd = 1
                FROM @nTemp4 nt4
                    INNER JOIN #ItemStorePriceHistory isp 
                        ON isp.ItemStorePriceID = nt4.ItemStorePriceID
                    INNER JOIN ItemStore its  WITH (NOLOCK)
                        ON its.ItemCode = isp.ItemCode
                       AND its.StoreNumber = isp.StoreNumber
                    INNER JOIN #ItemStoreAdHistory isa  WITH (NOLOCK)
                        ON isa.ItemCode = its.ItemCode
                       AND isa.StoreNumber = its.StoreNumber
                WHERE  isp.ItemCode = @iItemCode
                  AND its.ItemCode = @iItemCode
                  AND isa.ItemCode = @iItemCode
                  AND nt4.WeekEnding BETWEEN isa.AdEffectiveDate AND isa.AdTerminationDate
                  AND nt4.WeekEnding BETWEEN isp.EffectiveDate AND isp.TerminationDate
        --          AND isa.Status = 'A'

		exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory','Step 16 - Get Historical OnAd flag'
        	IF @iDebug > 0        
                print convert(char(32),getdate(),109) + ': Get Historical OnAd flag'
        
            END


/******************************************************************************************
	Start - Show Sale  Quantity for Publix Price if there is one price point only --
			[PTXP, 09/12/2002]
*******************************************************************************************/
	Declare @dtWeekEnding	datetime
	Declare @iCount		int

	Declare @nTemp6 TABLE (RetailPrice money,SaleQuantity smallint,WeekEnding datetime)
	Insert Into @nTemp6
		Select 	distinct RetailPrice, SaleQuantity, WeekEnding
		from 	@nTemp4
		Order by WeekEnding Desc

 	Declare @tblPricePoints TABLE (PricePointCount int, RetailPrice money, SaleQuantity smallint, WeekEnding datetime)
	Insert into @tblPricePoints
		Select count(*), Sum(RetailPrice), Max(SaleQuantity), WeekEnding
		From @nTemp6 nt6
		Group By WeekEnding

	INSERT	@nTemp5 (WeekEnding, RetailPrice, SaleQuantity, movement, Cost, PriceTypeCode, OnAd)
	SELECT	nt4.WeekEnding,
		CASE WHEN Max(tpp.PricePointCount) = '1' 		--Only One price point, show actual retail price
		     Then 
-- 			SUM(tpp.RetailPrice)
			SUM(isp.NonLocallyOptimizedPrice * ist.AverageWeeklyMovement)
		     ELSE						-- Various Price Points, Show Unit retail Price
			SUM(isp.NonLocallyOptimizedPrice / isp.NLOSaleQuantity * ist.AverageWeeklyMovement)
		     END,
		CASE WHEN Max(tpp.PricePointCount) = '1' 		--Only One price point, show actual Sale Quantity
	  		THEN Max(tpp.SaleQuantity)
		     ELSE 
			1						-- Various Price Points, Show Unit (1) Sale Qty
		     END,
		SUM(ist.AverageWeeklyMovement),
		SUM((isc.NetCostPerDistPack / isc.DistUnitsInPack) * ist.AverageWeeklyMovement),
		MAX(pt.PriceTypeCode),
		MAX(nt4.OnAd)
	FROM    @nTemp4 nt4
		INNER JOIN ItemStorePrice  isp WITH (NOLOCK)
	          ON (nt4.ItemStorePriceID = isp.ItemStorePriceID)
	        INNER JOIN ItemStore ist WITH (NOLOCK)
	            ON isp.ItemCode = ist.ItemCode and isp.StoreNumber = ist.StoreNumber
	        INNER JOIN ItemSupplierCost isc WITH (NOLOCK)
	            ON (isp.ItemSupplierCostID = isc.ItemSupplierCostID)
	        INNER JOIN PriceType pt WITH (NOLOCK)
	            ON (isp.PriceTypeID = pt.PriceTypeID)
	        INNER JOIN @tblPricePoints tpp
	            ON (tpp.WeekEnding = nt4.WeekEnding)
	WHERE	isp.ItemCode = @iItemCode
	  	AND ist.ItemCode = @iItemCode
	GROUP BY
		nt4.WeekEnding, nt4.OnAd

	exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory','Step 17 - Gather Price fields ' 
	IF @iDebug > 0        
		print convert(char(32),getdate(),109) + ': Gather Price fields'
	
	if @cGetHistory = 'Y'
	  begin
		INSERT	@nTemp5 (WeekEnding, RetailPrice, SaleQuantity, movement, Cost, PriceTypeCode, OnAd)
			SELECT	nt4.WeekEnding,
				CASE WHEN Max(tpp.PricePointCount) = '1' 		--Only One price point, show actual retail price
				     Then 
-- 					SUM(tpp.RetailPrice)
					SUM(isp.NonLocallyOptimizedPrice * ist.AverageWeeklyMovement)
				     ELSE						-- Various Price Points, Show Unit retail Price		
					SUM(isp.NonLocallyOptimizedPrice / isp.NLOSaleQuantity * ist.AverageWeeklyMovement)
				     END,
				CASE WHEN Max(tpp.PricePointCount) = '1' 		--Only One price point, show actual Sale Quantity
			  		THEN Max(tpp.SaleQuantity)
				     ELSE 
					1						-- Various Price Points, Show Unit (1) Sale Qty
				     END,
				SUM(ist.AverageWeeklyMovement),
				SUM((isc.NetCostPerDistPack / isc.DistUnitsInPack) * ist.AverageWeeklyMovement),
				MAX(pt.PriceTypeCode),
				MAX(nt4.OnAd)
			FROM    @nTemp4 nt4
				INNER JOIN #ItemStorePriceHistory isp 
		                  ON (nt4.ItemStorePriceID = isp.ItemStorePriceID)
		                INNER JOIN ItemStore ist WITH (NOLOCK)
		                    ON isp.ItemCode = ist.ItemCode and isp.StoreNumber = ist.StoreNumber
		                INNER JOIN ItemSupplierCost isc WITH (NOLOCK)
		                    ON (isp.ItemSupplierCostID = isc.ItemSupplierCostID)
		                INNER JOIN PriceType pt WITH (NOLOCK)
		                    ON (isp.PriceTypeID = pt.PriceTypeID)
			        INNER JOIN @tblPricePoints tpp
			            ON (tpp.WeekEnding = nt4.WeekEnding)
		        WHERE	isp.ItemCode = @iItemCode
				AND ist.ItemCode = @iItemCode
				AND NOT EXISTS (SELECT 1 FROM ItemStorePrice  isp_c
		                            	WHERE isp_c.ItemStorePriceID = isp.ItemStorePriceID)
		        GROUP BY
				nt4.WeekEnding, nt4.OnAd
		
			exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory','Step 18 - Gather Historical Price fields' 
			IF @iDebug > 0        
		        print convert(char(32),getdate(),109) + ': Gather Historical Price fields'
	end

-- /******************************************By PTXP****************/
-- 
--             ---------------------------------------------------------------------------
--             -- STEP 4: Get Price, Cost info using ItemStorePriceID from the temp tables above
--             ---------------------------------------------------------------------------
-- 
--         --------------------------------------------------------------------------------------
--         --PBTH Changed the function to use NonLocallyOptimizedPrice (NLOP) and NLOSaleQuantity
--         -------------------------------------------------------------------------------------- 
--         INSERT	@nTemp5 (WeekEnding, RetailPrice, SaleQuantity, movement, Cost, PriceTypeCode, OnAd)
--         SELECT  a.WeekEnding
--  	      , SUM(isp.NonLocallyOptimizedPrice * ist.AverageWeeklyMovement)					--by PTXP
-- 	      , SUM(isp.SaleQuantity)
-- -- 	      , SUM(isp.NonLocallyOptimizedPrice / isp.NLOSaleQuantity * ist.AverageWeeklyMovement)		by PTXP
--               , SUM(ist.AverageWeeklyMovement)
--               , SUM((isc.NetCostPerDistPack / isc.DistUnitsInPack) * ist.AverageWeeklyMovement)
--               , MAX(pt.PriceTypeCode)
--               , MAX(a.OnAd)
--         FROM    @nTemp4 a 
-- 		INNER JOIN ItemStorePrice  isp WITH (NOLOCK)
--                   ON (a.ItemStorePriceID = isp.ItemStorePriceID)
--                 INNER JOIN ItemStore ist WITH (NOLOCK)
--                     ON isp.ItemCode = ist.ItemCode and isp.StoreNumber = ist.StoreNumber
--                 INNER JOIN ItemSupplierCost isc WITH (NOLOCK)
--                     ON (isp.ItemSupplierCostID = isc.ItemSupplierCostID)
--                 INNER JOIN PriceType pt WITH (NOLOCK)
--                     ON (isp.PriceTypeID = pt.PriceTypeID)
--         WHERE	isp.ItemCode = @iItemCode
--           	AND ist.ItemCode = @iItemCode
--         GROUP BY
--         	a.WeekEnding
--         ---- 02/08/2001 - PJWW
--           , a.OnAd
-- 
--     	IF @iDebug > 0        
--             print convert(char(32),getdate(),109) + ': Gather Price fields'
--         --------------------------------------------------------------------------------------
--         --PBTH Changed the function to use NonLocallyOptimizedPrice (NLOP) and NLOSaleQuantity
--         -------------------------------------------------------------------------------------- 
--         IF @cGetHistory = 'Y'
--             BEGIN
--                 INSERT	@nTemp5 (WeekEnding, RetailPrice, movement, Cost, PriceTypeCode, OnAd)
--                 SELECT  a.WeekEnding
--                       , SUM(isp.NonLocallyOptimizedPrice / isp.NLOSaleQuantity * ist.AverageWeeklyMovement)
--                       , SUM(ist.AverageWeeklyMovement)
--                       , SUM((isc.NetCostPerDistPack / isc.DistUnitsInPack) * ist.AverageWeeklyMovement)
--                       , MAX(pt.PriceTypeCode)
--                       , MAX(a.OnAd)
--                 FROM    @nTemp4 a 
-- 			INNER JOIN #ItemStorePriceHistory isp 
--                           ON (a.ItemStorePriceID = isp.ItemStorePriceID)
--                         INNER JOIN ItemStore ist WITH (NOLOCK)
--                             ON isp.ItemCode = ist.ItemCode and isp.StoreNumber = ist.StoreNumber
--                         INNER JOIN ItemSupplierCost isc WITH (NOLOCK)
--                             ON (isp.ItemSupplierCostID = isc.ItemSupplierCostID)
--                         INNER JOIN PriceType pt WITH (NOLOCK)
--                             ON (isp.PriceTypeID = pt.PriceTypeID)
--                 WHERE	isp.ItemCode = @iItemCode
-- 			AND ist.ItemCode = @iItemCode
-- 			AND NOT EXISTS (SELECT 1 FROM ItemStorePrice  isp_c
--                                     	WHERE isp_c.ItemStorePriceID = isp.ItemStorePriceID)
--                 GROUP BY
--                 	a.WeekEnding
--                 ---- 02/08/2001 - PJWW
--                   , a.OnAd
--         
--         	IF @iDebug > 0        
--                 print convert(char(32),getdate(),109) + ': Gather Historical Price fields'
--         
--             END

/******************************************************************************************
	END - Show Sale  Quantity for Publix Price if there is one price point only --
			[PTXP, 09/12/2002]
*******************************************************************************************/

            INSERT @tPriceHistory(
                WeekEnding
              , CompanyName
              , SaleQuantity
              , RetailPrice
              , Cost
              , PriceTypeCode
              , OnAd
            )
            SELECT  nt5.WeekEnding
                  , 'Publix'
--                , 1
		  , MAX(SaleQuantity) 
                  , Cast(SUM(RetailPrice)/ SUM(Movement) AS money)
                  , CAST(SUM(Cost) / SUM(Movement) AS money)
                  , MAX(PriceTypeCode) 
                  , MAX(OnAd)
            FROM    @nTemp5 nt5
            GROUP BY
            	WeekEnding
            ---- 02/08/2001 - PJWW
              , OnAd

/*************************************************************************
Start: Inline Code FROM ufn_Compute8WeeksWeightedCostRetailPriceType
*************************************************************************/

--Select * from @tPriceHistory

IF 0 <> @@ERROR GOTO Error_Handler

---------------------------------------------------------------------------
-- STEP 5: Get Publix Movement data
---------------------------------------------------------------------------
-- Get data from ItemMovement for each of the 8 weeks for this ItemCode, Market, and Division
---------------------------------------------------------------------------

SET @vchCodeSection = 'Step 19 - Getting Publix movement'

exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory', @vchCodeSection 
IF @iDebug > 0
	print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 


declare @tMovement table (WeekEnding datetime, Movement int)
declare @tAllMovement table (WeekEnding datetime, Movement int)


INSERT @tAllMovement
SELECT im.WeekEndingDate
     , im.QuantitySold 
FROM ItemMovement im WITH (NOLOCK)
  WHERE im.WeekEndingDate Between DATEADD(dd, -56, @sWednesday) and DATEADD(dd, -7, @sWednesday)
  AND im.ItemCode = @iItemCode
  AND im.Status = 'A'
  AND im.StoreNumber IN (SELECT StoreNumber FROM @tblStores)

IF @cGetHistory = 'Y'
    BEGIN
        INSERT @tAllMovement
        SELECT im.WeekEndingDate
             , im.QuantitySold 
        FROM #ItemMovement_History im 
          WHERE im.WeekEndingDate Between DATEADD(dd, -56, @sWednesday) and DATEADD(dd, -7, @sWednesday)
          AND im.ItemCode = @iItemCode
          AND im.Status = 'A'
          AND im.StoreNumber IN (SELECT StoreNumber FROM @tblStores)
          AND NOT EXISTS (SELECT 1 FROM ItemMovement im_c
                            WHERE im_c.ItemMovementId = im.ItemMovementID
                         )
    END

INSERT @tMovement
SELECT WeekEnding
     , SUM(Movement) 
    FROM @tAllMovement
    GROUP BY WeekEnding

IF 0 <> @@ERROR GOTO Error_Handler

SET @vchCodeSection = 'Step 20 - Updating @tPriceHistory with movement'

exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory', @vchCodeSection 
IF @iDebug > 0
	print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 


-- update the @tPriceHistory table with the movement
UPDATE @tPriceHistory
SET Movement = b.Movement
FROM @tPriceHistory a
    INNER JOIN @tMovement b
        ON (dbo.ufn_GetDate('Prev', 'Wednesday',a.WeekEnding) =  b.WeekEnding)
WHERE a.CompanyName = 'Publix'

IF 0 <> @@ERROR GOTO Error_Handler

-------------------------------------------------------------------------------
-- STEP 6: Return the contents of the #tPriceHistory table
-------------------------------------------------------------------------------
-- Retrieve all records from the #tPriceHistory table in the required XMLDoc
-- format
-------------------------------------------------------------------------------

SET @vchCodeSection = 'Step 21 - Returning results'

exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory',@vchCodeSection 
IF @iDebug > 0
	print convert(char(32),getdate(),109) + ': ' + @vchCodeSection 

SELECT CompanyName 
     , dbo.ufn_FormatPrice(Cost, 1) AS Cost
     , Movement 
     , PriceTypeCode 
     --, CAST(RetailPrice AS money) RetailPrice
     --, SaleQuantity
     , CAST(dbo.ufn_FormatPrice(RetailPrice, SaleQuantity) AS varchar(25))
     + CASE
           WHEN PriceTypeCode = 'T'
               THEN ' ' + PriceTypeCode
           ELSE ''
       END
     + CASE
           WHEN OnAd = 1
               THEN ' *'
           ELSE ''
       END AS RetailPrice
     , CONVERT(char(10), WeekEnding, 101) AS WeekEnding
FROM @tPriceHistory
ORDER BY CompanyName DESC
       , WeekEnding DESC
FOR XML RAW

IF 0 <> @@ERROR GOTO Error_Handler

exec usp_peLogTrace @vcSessionName, 'usp_mtGetPriceHistory', 'End'

RETURN 0

Error_Handler:
    RAISERROR(50208
            , 18
            , 1
            , 'Flexible Pricing System'
            , 'usp_mtGetPriceHistory'
            , @vchCodeSection
            , @iItemCode
            , @chrWeekEndDate
            , @iMarketId
            , @iDivisionId
            , @iStoreNumber
            , @iSupplierId)
Return 99

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
GRANT  EXECUTE  ON [dbo].[usp_mtGetPriceHistory]  TO [FullAccess]
GO
GRANT  EXECUTE  ON [dbo].[usp_mtGetPriceHistory]  TO [FlexFullAccess]
GO
