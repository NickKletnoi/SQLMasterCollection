SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

ALTER   PROCEDURE dbo.usp_CSGenerateCSSigns 
/***************************************************************************
  Created On:    	05/07/2002 by Prasanna Tawargeri  

  Description:		This procedure selects the MarketIDs who would recieve the C&S Sign for the given week and a PrintShop table is loaded with the details of Publix Price
                	Competitors Price and other Info 

  Input Parameters: 	@WeekEndDate

  Output Parameters: 	none

  Notes:

==============================================================================
  Changed By 		 Changed On		Details
==============================================================================
1) Prasanna Tawargeri	06/11/2002		Changed 
						1)update logic of temporary table	
						2)added code for truncating printshop 
						  table.
						3)commented code for cph.CompetitorPriceTypeID = 1
						  in Insert statement for temporary 
						  table #PrintShopData.
						4)change in Insert into CSPrintShop 
						  table for change of table structure 
						  as CSMarketID column has been 
						  renamed to ZoneID.  

2) Prasanna Tawargeri	06/12/2002		Changed the Pulldate logic to set the pulldate to 
						saturday date

3) Robert Skoglund	08/28/2002		Changed the logic to use projected price instead
						of current price.

4) Bart Ross 3/19/2003						Changed the logic to pull SignMainline and 
																	SignSecondLine to get data from s0pricxx.Item table
***************************************************************************/


@WeekEndDate Datetime

AS

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

/* AUDITING VARIABLES */
DECLARE @iTraceFlag         int -- trace flag
declare @vcSessionName varchar (32) -- used for trace processing
declare @vcModuleName varchar (32) -- used for trace processing
declare @cMsg char (100) -- used for trace processing
declare @row_count int

/* Initialize Auditing variables */
SET @iTraceFlag = 1
SELECT @vcSessionName = DATENAME(DW, getdate()) /* Could be some input variable that pinpoints the session*/
SET @vcModuleName = 'usp_CSGenerateCSSigns' /* Usually stored proc name (first 32 characters) */

/* Here is an example of code you would put in the body of the proc */
if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Begin Procedure' 
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

DECLARE @tblMarketIDS TABLE (
	CSMarketID int, 
	Pulldate datetime, 
	Status Char(1))

DECLARE @intCSMarketID 			int,		-- market Id
	@vchYearWeek 			Varchar(6),	-- yearweek of the current date
	@vchWeek 			varchar(2),	-- week no of the year	
	@sintYear 			smallint,	-- year of the current date
	@intItemCode			int,		-- item code
	@vchBaseRotationDate		varchar(40),	-- Base Rotation Date from Application config table... used to calculate Rotation Number (varchar(40))
	@tintRotationNumber 		tinyint,	-- current rotation number calculated from Base Rotation Date
	@intYearWeekID			int,		-- year week no
	@tintnextRotationNumber		tinyint,	-- to calculate pulldate the rotation number is retrieved from CSMARKETRotation table
	@dtePullDate			datetime,	-- Pulldate for the market for generating next CSSign
	@tintdiffRotationNumber		tinyint,	-- difference of rotation number for same market	
	@intdiffRotationNumber		int,
	@vchCodeSection 		varchar(128),	-- text for raising error   
	@dteWednesdaydate		datetime,	-- contains wednesday date 
	@dteISPWednesdaydate		datetime,	-- contains wednesday date 
	@dteThursdayDate		datetime, 	-- contains Thursday date for SensitiveItemsInfo query
	@btrue				bit,	
	@intMaxRotationnumber		tinyint,
	@tintMinRotationNumber		tinyint,
	@vchProcessedDate		varchar(128),	-- storing current date in String
	@dteSaturdaydate		datetime	-- contains Saturday date 

-- requires to be changed for proper text
SET @vchCodeSection =  'Initializing and checking for errors in source file.'

SET  @vchProcessedDate = 'Current Date ' + Cast(@WeekEndDate as varchar(12))

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Initializing Variables' 
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

--******************************************
--Get YearWeek number from the current date
SELECT @vchWeek = DATEPART(wk, @WeekEndDate), @sintYear =  DATEPART(yy, @WeekEndDate)

--append 0 if week number is less than 9 for standard format of YearWeek eg:'200201'
IF CAST(@vchWeek as tinyint) <= 9
BEGIN
	SET @vchWeek = '0' + @vchWeek
END

SET	@vchYearWeek = CAST(@sintyear as varchar(4))  + @vchweek
SET	@intYearWeekID = CAST(@vchyearWeek as int)

SELECT 	@vchBaseRotationDate = Value 
FROM 	ApplicationConfig 
WHERE 	Name = 'CSMARKET ROTATION NUMBER'

--******************************************
-- Calculate the Current Rotation Number from the Base Rotation Date
SELECT @intMaxRotationnumber = Max(RotationNumber) FROM CSMarketRotation WHERE Status = 'A'
SET @tintRotationNumber = 
	cast( (( (datediff(d, cast(@vchBaseRotationDate as datetime), convert(varchar, getdate(), 101)) / 7) % @intMaxRotationnumber) + 1) as tinyint)

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Base Rotation Date = ' + @vchBaseRotationDate
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Calculated Rotation Number = ' + convert(varchar, @tintRotationNumber)
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

--******************************************
-- Select distinct CSMarketIds whose rotation number 
-- is same as retreived from the ApplicationConfig table 
-- and insert them in a temporary table
SELECT @cMsg = 'Error:Inserting Into temporary table :WeekEnding=' +  @vchProcessedDate

INSERT @tblMarketids
SELECT DISTINCT CSMarketID,NULL,'A'
FROM	CSMarketRotation with (nolock) 
WHERE RotationNumber = @tintRotationNumber 
AND
@WeekEndDate BETWEEN Effectivedate AND Terminationdate
AND Status = 'A'

IF @@ERROR <> 0 Goto Error_Handler

SELECT @cMsg = 'Error:Getting the Next Pull Date :WeekEnding=' +  @vchProcessedDate

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Calculate Pull Date'
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

SET @btrue = 1 	-- intialize the variable to enter the loop

WHILE @btrue = 1
BEGIN
			
	SELECT TOP 1 @intCSMarketID = CSMarketID FROM @tblMarketids WHERE Status = 'A'
	-- if any row is retrieved then only process the record otherwise exit
	IF @@ROWCOUNT > 0
	BEGIN
		
		/************************Logic to get pulldate*******************************/
		-- get next rotation number for same CSMarketID
		SELECT  @tintnextRotationNumber = MIN(RotationNumber)
						  FROM CSMarketRotation with (nolock) 
						  WHERE CSMarketId =  @intCSMarketID
						  AND  RotationNumber > @tintRotationnumber
						  AND  Status = 'A'	

					  
		--get current weekend date, if current date is not wednesday then get previous wednesday date
	
		IF (DATEPART(dw, @WeekEndDate) <> 4 )
		BEGIN
			SET @dteWednesdaydate = dbo.ufn_GetStartOfDay(dbo.ufn_GetDate('Previous', 'Wednesday',@WeekEndDate))
		END
		ELSE
		BEGIN
			SET @dteWednesdaydate = dbo.ufn_GetStartOfDay(@WeekEndDate)
		END
		set @dteISPWednesdaydate = dateadd(d, 7, @dteWednesdaydate)
		--====================================================================
	
		-- if todays date is not saturday date then add	4 to get saturday date		
		-- added on 6/12/2002
		IF (DATEPART(dw, @WeekEndDate) <> 7 )
		BEGIN
			SET @dteSaturdaydate = DATEADD(dd, 3,@dteWednesdaydate)
		END
		ELSE
		BEGIN
			SET @dteSaturdaydate = @WeekEndDate
		END
		--====================================================================
	
		-- if next rotation number doesn't exist for the the Market 
		-- then get min Rotationnumber for that Market 
		IF (@tintnextRotationNumber IS NOT NULL)
		BEGIN
		-- get diff no of weeks			
			SET @intdiffRotationNumber = ABS(convert(int, @tintRotationNumber) - convert(int, @tintnextRotationNumber))
			SET @tintdiffRotationNumber = @intdiffRotationNumber
		END
		ELSE
		BEGIN
			SELECT @tintMinRotationNumber = MIN(RotationNumber)
			FROM CSMarketRotation with (nolock) 
			WHERE CSMarketId =  @intCSMarketID
			AND  RotationNumber < @tintRotationnumber 
			AND Status = 'A'

			IF @tintMinRotationNumber IS NULL
			BEGIN
				SET @tintnextRotationNumber = @intMaxRotationnumber
			END
			ELSE	
			BEGIN
				SET @tintnextRotationNumber = @intMaxRotationnumber - @tintRotationnumber + @tintMinRotationNumber
			END
			SET @tintdiffRotationNumber = @tintnextRotationNumber
		END

		--====================================================================		
		-- Now the pull date will be set to Saturday date instead of Wednesday date 
		-- changed on 6/12/2002
		-- set the next rotation date as wednesday date	
		--SET @dtePullDate = DATEADD(wk,@tintdiffRotationNumber,@dteWednesdaydate)
		SET @dtePullDate = DATEADD(wk,@tintdiffRotationNumber,@dteSaturdaydate)
		/************************--Logic to get pulldate*******************************/

		-- Update the record which was just processed from the @tblMarketids local variable and set the status ='I'
		UPDATE  @tblMarketids 
		SET 	PullDate = @dtePullDate,
			STATUS = 'I' 	
		WHERE CSMarketID = @intCSMarketID		
	END
	ELSE
	BEGIN
		SET @btrue = 0	-- set the bit 
		CONTINUE
	END
END

IF @@ERROR <> 0 Goto Error_Handler

-- for each itemcode and CSMarketId,CompetitorId  
-- Check for the Each itemcode whether the 
-- PublixPrice is in the margin compared to CompetitorPrice by passing the 
-- Publix Price,CompetitorPrice, minamountdifference, minpercent, maxpercent to
-- ufn_ISEligibleForPrintShop function which returns 'Y' or 'N' and 
-- Only if the return value is 'Y' the record is included in the PrintShop table
      

-- for each itemcode and CSMarketId,CompetitorId  
-- Check for the Each itemcode whether the 
-- PublixPrice is in the margin compared to CompetitorPrice by passing the 
-- Publix Price,CompetitorPrice, minamountdifference, minpercent, maxpercent to
-- ufn_ISEligibleForPrintShop function which returns 'Y' or 'N' and 
-- Only if the return value is 'Y' the record is included in the PrintShop table

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Create #PrintShopData table'
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

CREATE TABLE #PrintShopData
( Divisionid int 
, ZoneID int 		-- Changed the column name from CSMarketId to ZoneID on 06/11/2002 by Prasanna
, CSMarketID int
, Storenumber int 
, RetailSubSection smallint 
, Itemcode int 
, PublixPrice smallmoney 
, PublixQty smallint 
, UnitCompPrice smallmoney 
, CompQty smallint 
, CompPrice smallmoney 
, DiffPrice smallmoney 
, DateCollected datetime 
, Main varchar(220) 
, SecondLine varchar(220) 
, UnderLine varchar(500) 
, CmpName varchar(32)
, Address varchar(100) 
, City varchar(32) 
, State char(2) 
, PullDate datetime 
, MinAmountDifference smallmoney 
, MinPercent decimal(9,2) 
, MaxPercent decimal(9,2) 
, GenerateSign char(1) 
)

SELECT @cMsg = 'Error:Inserting Into Temporary table :WeekEnding=' +  @vchProcessedDate
if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Populate #PrintShopData table'
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

INSERT #PrintShopData
(Divisionid , ZoneID , CSMarketID , Storenumber , RetailSubSection , Itemcode 
, PublixPrice , PublixQty , UnitCompPrice 
, CompQty , CompPrice , DiffPrice 
, DateCollected , Main , SecondLine , UnderLine , CmpName 
, Address , City , State, PullDate , MinAmountDifference 
, MinPercent , MaxPercent , GenerateSign)
SELECT sto.DivisionID, cs.ZoneID, cs.CSMarketID, sto.StoreNumber, itm.RetailSubSection, cph.ItemCode
, null, null, (cph.CompetitorRetailPrice/cph.CompetitorRetailQuantity)
, cph.CompetitorRetailQuantity, cph.CompetitorRetailPrice, null
-- pbsr 3/19/03, cph.DateCollected, ids.SignMainLine, ids.SignSecondLine, ids.SignUnderLine, com.CompetitorName
, cph.DateCollected, itm.LongDescription, Cast(dbo.ufn_RemoveZero(itm.RetailPackSize) AS varchar(25))+ ' ' + CAST(itm.RetailPackUOM AS varchar(12))
, null, com.CompetitorName
, cca.Address, cca.City, cca.State, tmi.PullDate, cmc.MinAmountDifference
, cmc.MinPercent, cmc.MaxPercent, 'N'
FROM CSCompetitorPriceHistory cph 
	inner join CSMarket cs on cph.CSMarketID = cs.CSMarketID
	inner join @tblMarketIDs tmi on cph.CSMarketID = tmi.CSMarketID
	inner join CSStoreMarket csm on cph.CSMarketID = csm.CSMarketID
	inner join Store sto WITH (NOLOCK) on csm.StoreNumber = sto.StoreNumber
	inner join Item itm WITH (NOLOCK) on cph.ItemCode = itm.ItemCode
	inner join Competitor com WITH (NOLOCK) on cph.CompetitorID = com.CompetitorID
	LEFT OUTER JOIN CSCompetitorAddress cca on cph.CompetitorID = cca.CompetitorID
		and cph.CSMarketID = cca.CSMarketID 
		and cph.CompetitorStoreNumber = cca.CompetitorStoreNumber
		And @dteWednesdaydate BETWEEN cca.EffectiveDate AND cca.TerminationDate
		And cca.Status = 'A'
	inner join CSMarketCompetitor cmc on cph.CSMarketId = cmc.CSMarketID
		and cph.CompetitorID = cmc.CompetitorID
-- 	LEFT outer join (--PBSR
-- 										SELECT ais.ItemCode, abv.DivisionID
--                         , ais.SignMainLine, ais.SignSecondLine, ais.SignUnderLine
--                         FROM dbo.ATS_AdItemSign ais WITH (NOLOCK)
--                             inner join dbo.ATS_AdBaseVersion abv WITH (NOLOCK) on ais.VersionID = abv.BaseVersionID
--                         WHERE abv.Status = 'A'
--                      ) ids on cph.ItemCode = ids.ItemCode and sto.DivisionID = ids.DivisionID
WHERE cph.Status = 'A'
And cph.RecordType = 'O'
--And cph.CompetitorPriceTypeID = 1 /* Perm Prices */    -- Commented By Prasanna on 11th June 2002 as per requirement
And cph.WeekEnding = @dteWednesdaydate
And @dteWednesdaydate BETWEEN csm.EffectiveDate AND csm.TerminationDate
And csm.Status = 'A'
And sto.Status = 'A'
And sto.IsModeled = 'Y'
And @dteWednesdaydate BETWEEN itm.EffectiveDate AND itm.TerminationDate
And itm.IsModeled = 'Y'
And com.Status = 'A'
And @dteWednesdaydate BETWEEN cmc.EffectiveDate AND cmc.TerminationDate
And cmc.Status = 'A'
And @dteWednesdaydate BETWEEN cs.EffectiveDate AND cs.TerminationDate
And cs.Status = 'A'
And cmc.GenerateCSSign = 'Y'

IF @@ERROR <> 0 Goto Error_Handler

SELECT @cMsg = 'Error:Creating Index On Temporary table :WeekEnding=' +  @vchProcessedDate

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Creating Index On Temporary table :WeekEnding=' +  @vchProcessedDate
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

CREATE INDEX ndx_tmp_PSD_10001 ON #PrintShopData(Itemcode, StoreNumber)

IF @@ERROR <> 0 Goto Error_Handler

SELECT @cMsg = 'Error: Deleting FamilyGroups :WeekEnding=' +  @vchProcessedDate

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Deleting FamilyGroups : WeekEnding=' +  @vchProcessedDate
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

/* Deleting all records for which Print-Shop signs should not be generated */
DELETE psd
    FROM #PrintshopData psd
        inner join ItemFamilyGroup ifg with (nolock) on psd.ItemCode = ifg.ItemCode
        inner join CSMarketFamilyGroupNoPSSign csns with (nolock) on psd.CSMarketId = csns.CSMarketId
                                                    and ifg.FamilyGroupCode = csns.FamilyGroupCode
    WHERE @WeekEndDate BETWEEN ifg.EffectiveDate and ifg.TerminationDate
        AND ifg.Status = 'A'
        AND @WeekEndDate BETWEEN csns.EffectiveDate and csns.TerminationDate
        AND csns.Status = 'A'


SELECT @cMsg = 'Error: Updating Temporary table :WeekEnding=' +  @vchProcessedDate

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Updating #PrintShopData Table for Perms'
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

SET @dteThursdayDate = @dteWednesdaydate + 1

UPDATE #PrintShopData
	SET PublixPrice = isp.PublixPrice
	, PublixQty = isp.PublixQuantity
	, DiffPrice = ABS((isp.PublixPrice/isp.PublixQuantity) - (psd.UnitCompPrice))
	, GenerateSign = CASE WHEN ((psd.UnitCompPrice) - (isp.PublixPrice/isp.PublixQuantity) >= psd.MinAmountDifference)
					AND ((isp.PublixPrice/isp.PublixQuantity) 
						BETWEEN (psd.UnitCompPrice * (1.00 - (MaxPercent/100.00)))
						   AND (psd.UnitCompPrice * (1.00 - (MinPercent/100.00)))
				   	    )
				THEN 'Y'
				ELSE GenerateSign
			END
	FROM #PrintShopData psd 
		inner join sensitiveitemsinfo isp WITH (NOLOCK) on psd.ItemCode = isp.ItemCode
			and psd.StoreNumber = isp.StoreNumber
	WHERE isp.ThursdayDate = @dteThursdayDate
		And isp.Pricetype = 'P' /* Perm Prices */

/* Get the curent TPR prices in effect where exists */
IF @@ERROR <> 0 Goto Error_Handler

SELECT @cMsg = 'Error:Inserting into CSPrintShop Table for : WeekEnding=' +  @vchProcessedDate

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Updating #PrintShopData Table for TPRs'
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

IF @@ERROR <> 0 Goto Error_Handler

UPDATE #PrintShopData
	SET PublixPrice = isp.PublixPrice
	, PublixQty = isp.PublixQuantity
	, DiffPrice = ABS((isp.PublixPrice/isp.PublixQuantity) - (psd.UnitCompPrice))
	, GenerateSign = CASE WHEN ((psd.UnitCompPrice) - (isp.PublixPrice/isp.PublixQuantity) >= psd.MinAmountDifference)
					AND ((isp.PublixPrice/isp.PublixQuantity) 
						BETWEEN (psd.UnitCompPrice * (1.00 - (MaxPercent/100.00)))
						   AND (psd.UnitCompPrice * (1.00 - (MinPercent/100.00)))
				   	    )
				THEN 'Y'
				ELSE GenerateSign
			END
	FROM #PrintShopData psd 
		inner join sensitiveitemsinfo isp WITH (NOLOCK) on psd.ItemCode = isp.ItemCode
			and psd.StoreNumber = isp.StoreNumber
	WHERE isp.ThursdayDate = @dteThursdayDate
		And isp.Pricetype = 'T' /* TPR Prices */


/* Remove not-needed records from the table to speed up the next step. */
SELECT @cMsg = 'Error:Deleting temporary Table : WeekEnding=' +  @vchProcessedDate

DELETE #PrintShopData
	WHERE GenerateSign = 'N'



IF @@ERROR <> 0 Goto Error_Handler

SELECT @cMsg = 'Error:Truncating CSPrintShop Table for : WeekEnding=' +  @vchProcessedDate

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Clear (DELETE) CSPrintShop Table'
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

--truncate the CSPRINTSHOP table before loading into CSPRINTSHOP 
DELETE CSPRINTSHOP

IF @@ERROR <> 0 Goto Error_Handler

SELECT @cMsg = 'Error:Inserting into CSPrintShop Table for : WeekEnding=' +  @vchProcessedDate

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'Start: Insert data into CSPrintShop Table'
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

INSERT INTO CSPRINTSHOP
(
CurrentDate, YearWeekId, Divisionid, ZoneID, 
Storenumber, RetailSubSection, Itemcode, 
PublixPrice, PublixQty, CompQty, CompPrice, DiffPrice,
DateCollected,Main, SecondLine, UnderLine, CmpName, Address, 
City, State, PullDate
)   
SELECT GetDate(), @intYearWeekID, (Divisionid - 1) , ZoneId 
, Storenumber , RetailSubSection , Itemcode 
, PublixPrice , PublixQty , CompQty , CompPrice , DiffPrice 
, DateCollected , Main , SecondLine , UnderLine , CmpName 
, Address , City , State, PullDate 
FROM #PrintShopData
WHERE GenerateSign = 'Y'

IF @@ERROR <> 0 Goto Error_Handler

if @iTraceFlag = 1 BEGIN
	select @cMsg = 'End Procedure'
	exec usp_peLogTrace @vcSessionName, @vcModuleName, @cMsg
END

-- on success
RETURN 0

-- on error, write error, rollback transaction and return 
Error_Handler:
	RAISERROR(50077, 18, 1, 'Flexible Pricing Datamart', 'usp_CSGenerateCSSigns', @vchProcessedDate, @cMsg)
	IF @@TRANCOUNT > 0 
		ROLLBACK TRANSACTION
	RETURN 99




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

