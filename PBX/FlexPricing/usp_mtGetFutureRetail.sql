SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





CREATE  PROCEDURE dbo.usp_mtGetFutureRetail

/*
exec dbo.usp_mtGetFutureRetail
'<Params>
	<ItemCode>158987</ItemCode>
	<StoreNumber>300</StoreNumber>
	<WeekBeginDate>10/04/2001</WeekBeginDate>
	<UserId>PBTH</UserId>
    <GetHistory>Y</GetHistory>
</Params>'
*/

/******************************************************************************

    Created On:   3/27/2001    Peter Cheng (Publix)

    Description:

	This returns the retail price.
 
    Input Parameters:

        <Params>
			<ItemCode/>
			<StoreNumber/>
			<WeekBeginDate/>
	        	<UserId/>
	 </Params>
	
    Results are returned in the form:
	<EffectiveDate>
    	<TerminationDate>
    	<UnitCost>
    	<PriceTypeDescription>
    	<NonLocallyOptimizedPrice>
    	<RetailPrice>
    	<ApprovalStatusDescription>

    Modifications:
        - [6/12/2002] Added a new flag @cGetHistory to control the possibility of 
            ItemStorePriceHistory not being available. (VRXM)
        - [6/12/2002] Added code to handle overlapping data between ItemStorePrice and 
            ItemStorePriceHistory. (VRXM)
		- [11/11/2002] Added OPENQUERY logic to optimize performance using the Link Server
				- [4/16/2003] Added DB hint to the open query to return results from 
					ItemStorePrice_History. (PBSR, VGLJ)


******************************************************************************/


/******************************************************************************
    Parameters
******************************************************************************/
(
    @XMLDoc    varchar(7000)
)

AS
Set NoCount on
DECLARE @iDoc 		    int           -- Reference to the in-memory XML doc 
DECLARE @iUserId        varchar(8)
DECLARE @iItemCode 	    int
DECLARE @iWkBeginDate   datetime
DECLARE @iStoreNumber   varchar(10)      
DECLARE @vchCodeSection varchar(2000)      

DECLARE @chrSupType char(1)
DECLARE	@intPricetypeID int
DECLARE	@dteEffDate datetime
DECLARE	@dteTermDate datetime
DECLARE @cGetHistory char(1)
DECLARE @vcSessionName varchar(32)
DECLARE	@sQuery nvarchar(4000)	-- pmac 11/11/2002 -- added for OPENQUERY

/*
*****************************************************************************************************
 Parse the xmldoc input and set values to the declared parameters
*****************************************************************************************************
*/
SET @vchCodeSection = 'Parsing XML input parameters.'

exec sp_xml_preparedocument @idoc OUTPUT, @XmlDoc

-- Execute a SELECT statement that uses the OPENXML rowset provider.
SELECT	@iItemCode    = ItemCode,
        @iWkBeginDate = WkBeginDate,
        @iStoreNumber = StoreNumber,
        @iUserId      = UserId,
        @cGetHistory  = GetHistory


FROM OPENXML(@iDoc, '/Params', 2)

WITH (  ItemCode 	int          'ItemCode',
        WkBeginDate datetime     'WeekBeginDate',
        StoreNumber varchar(10)  'StoreNumber',
        UserId      char(8)      'UserId',
        GetHistory char(1)       'GetHistory'	
)

-- Remove the xml doc from memory
exec sp_xml_removedocument @iDoc
-- [VPXC 10-07-2002:  Add new trace messages to capture performance]

Select @vcSessionName=convert(varchar(6), @iUserId)+','+convert(varchar(6), @iItemCode)+','+COnvert(varchar(4), @iStoreNumber)+','+CONVERT(varchar(10), @iWkBeginDate, 12)+','+convert(varchar(20),getdate(), 14)

exec usp_peLogTrace @vcSessionName, 'usp_mtGetFutureRetail', 'Start'

DECLARE @tblISP TABLE (
	UnitCost varchar(20), SupplierType char(1), PricetypeID int, ApprovalStatusCode char(1),
	EffectiveDate datetime, TerminationDate datetime, RetailPrice money, SaleQuantity int,
	NonLocallyOptimizedPrice money, NLOSaleQuantity int, Processed char(1))


-- gather all current and future retail price records
INSERT @tblISP
SELECT 	dbo.ufn_FormatPrice(isc.NetCostPerDistPack / isc.DistUnitsInPack / isc.SizeFactor,1),
	sup.SupplierType, isp.PricetypeID, isp.ApprovalStatusCode, isp.EffectiveDate, isp.TerminationDate, 
	isp.RetailPrice, isp.SaleQuantity, isp.NonLocallyOptimizedPrice, isp.NLOSaleQuantity, 'N'
FROM	ItemStorePrice isp (nolock)
	    INNER JOIN ItemSupplierCost isc WITH (NOLOCK)
	       ON isp.ItemSupplierCostId = isc.ItemSupplierCostId
	    INNER JOIN ItemSupplier isup WITH (NOLOCK)
	       ON isc.ItemSupplierID = isup.ItemSupplierID
	    INNER JOIN Supplier sup
	       ON isup.SupplierID = sup.SupplierID
WHERE 
	isp.ApprovalStatusCode = 'A' and
	isp.ItemCode = @iItemCode and
	isp.StoreNumber = @iStoreNumber and
	isp.TerminationDate>=@iWkBeginDate and
	isp.status='A' 

IF @cGetHistory = 'Y'
    BEGIN

	CREATE TABLE #tblISP_temp(
		PricetypeID int, ApprovalStatusCode char(1),
		EffectiveDate datetime, TerminationDate datetime, RetailPrice money, SaleQuantity int,
		NonLocallyOptimizedPrice money, NLOSaleQuantity int, ItemSupplierCostID bigint, ItemStorePriceID bigint)



		--- pmac 11/11/2002  -- OPENQUERY added to optimize performance with Link Server
        Set @sQuery=N'SELECT PricetypeID, ApprovalStatusCode,
		EffectiveDate, TerminationDate, RetailPrice, SaleQuantity,
		NonLocallyOptimizedPrice, NLOSaleQuantity, ItemSupplierCostID, ItemStorePriceID
	    FROM OPENQUERY(FPDM, ''SELECT PricetypeID, ApprovalStatusCode,
		EffectiveDate, TerminationDate, RetailPrice, SaleQuantity,
		NonLocallyOptimizedPrice, NLOSaleQuantity, ItemSupplierCostID, ItemStorePriceID
	    FROM Flex_History.dbo.ItemStorePrice_Current (NOLOCK)
	    Where ApprovalStatusCode = ''''A'''' AND
	    StoreNumber = ' + CAST(@iStoreNumber as varchar(10)) + ' AND
	    ItemCode = ' + CAST(@iItemCode as varchar(10)) + ' 
	    AND TerminationDate > ''''' + convert(varchar(10),@iWkBeginDate,101) + ''''' 
	    UNION ALL 
	    SELECT PricetypeID, ApprovalStatusCode,
		EffectiveDate, TerminationDate, RetailPrice, SaleQuantity,
		NonLocallyOptimizedPrice, NLOSaleQuantity, ItemSupplierCostID, ItemStorePriceID
	    FROM Flex_History.dbo.ItemStorePrice_History (index(idxItemStorePrice_History_IE),NOLOCK)
	    Where ApprovalStatusCode = ''''A'''' AND
	    StoreNumber = ' + CAST(@iStoreNumber as varchar(10)) + ' AND
	    ItemCode = ' + CAST(@iItemCode as varchar(10)) + ' 
	    AND TerminationDate > ''''' + convert(varchar(10),@iWkBeginDate,101) + ''''''')'

        Insert INTO #tblISP_temp
        exec sp_executesql @sQuery


        INSERT @tblISP
        SELECT 	dbo.ufn_FormatPrice(isc.NetCostPerDistPack / isc.DistUnitsInPack / isc.SizeFactor,1),
        	sup.SupplierType, isp.PricetypeID, isp.ApprovalStatusCode, isp.EffectiveDate, isp.TerminationDate, 
        	isp.RetailPrice, isp.SaleQuantity, isp.NonLocallyOptimizedPrice, isp.NLOSaleQuantity, 'N'
        FROM	#tblISP_temp isp (NOLOCK)
        	    INNER JOIN ItemSupplierCost isc WITH (NOLOCK)
        	       ON isp.ItemSupplierCostId = isc.ItemSupplierCostId
        	    INNER JOIN ItemSupplier isup WITH (NOLOCK)
        	       ON isc.ItemSupplierID = isup.ItemSupplierID
        	    INNER JOIN Supplier sup
        	       ON isup.SupplierID = sup.SupplierID
        WHERE 
        	isp.ApprovalStatusCode = 'A' and
        	isp.TerminationDate>=@iWkBeginDate and
        	--isp.status='A' and
            NOT EXISTS (SELECT 1 FROM ItemStorePrice isp_c
                            WHERE isp_c.ItemStorePriceID = isp.ItemStorePriceID)

    END


-- mark all DSD records as being processed 
UPDATE @tblISP SET Processed = 'Y' WHERE SupplierType = 'D'

exec usp_peLogTrace @vcSessionName, 'usp_mtGetFutureRetail', 'Step 2 - Completed DSD'

-- for the WHSE records, we need to eliminate the "dummy" PERM records from the resultset
WHILE EXISTS (SELECT TOP 1 SupplierType FROM @tblISP WHERE ISNULL(Processed,'N') = 'N')
BEGIN
	SELECT TOP 1 @chrSupType = SupplierType,
		     @intPricetypeID = PriceTypeID,
		     @dteEffDate = EffectiveDate,
		     @dteTermDate = TerminationDate
	FROM @tblISP WHERE ISNULL(Processed,'N') = 'N'

	-- if this is a WHSE TPR then delete any overlapping WHSE PERMS from the resultset
	IF @chrSupType = 'W' AND @intPricetypeID = 2
		DELETE @tblISP 
		WHERE  SupplierType = @chrSupType AND
		       PriceTypeID = 1 AND
		       @dteEffDate >= EffectiveDate AND
		       @dteEffDate < TerminationDate

	UPDATE 	@tblISP 
	SET 	Processed = 'Y' 
	WHERE 	SupplierType = @chrSupType AND
		PriceTypeID = @intPriceTypeID AND
		EffectiveDate = @dteEffDate AND
		TerminationDate = @dteTermDate
END


-- Now, return the remaining retail price records
    SET @vchCodeSection = 'Selecting Retail Price data.'

    SELECT 1 			AS TAG
    ,    NULL 				AS PARENT
    ,    convert(varchar(10),isp.EffectiveDate, 101)
					AS [Retail!1!EffectiveDate]
    ,    convert(varchar(10),isp.TerminationDate, 101)
					AS [Retail!1!TerminationDate]
    ,    isp.UnitCost	AS [Retail!1!UnitCost]
    ,    pt.PriceTypeCode 		AS [Retail!1!PriceTypeCode]
    ,    dbo.ufn_FormatPrice(isp.NonLocallyOptimizedPrice, isp.NLOSaleQuantity)
					AS [Retail!1!NonLocallyOptimizedPrice]
    ,    dbo.ufn_FormatPrice(isp.RetailPrice, isp.SaleQuantity)
					AS [Retail!1!RetailPrice]
    ,    app.ApprovalStatusDescription	AS [Retail!1!ApprovalStatusDescription]
    -- 10/09/2001 - PBTH - Added Margin to results
    ,    CAST(CAST(dbo.ufn_CalculateMargin(CAST(isp.UnitCost AS money), isp.RetailPrice / isp.SaleQuantity) * 100 AS decimal(9,2)) AS varchar(12)) + '%'
                                        AS [Retail!1!Margin]

    FROM @tblISP isp
	    INNER JOIN PriceType pt
	       ON isp.PriceTypeId = pt.PriceTypeId
	    INNER JOIN ApprovalStatus app
	       ON isp.ApprovalStatusCode = app.ApprovalStatusCode
    order by 
	isp.EffectiveDate,
	pt.PriceTypeDescription
    FOR XML Explicit

 
    IF @@ERROR <> 0 GOTO Error_Handler

    exec usp_peLogTrace @vcSessionName, 'usp_mtGetFutureRetail', 'End'
RETURN (0)

Error_Handler:

    -- Convert Date variable to string to pass to raiserror function
    DECLARE @sWkBeginDate  varchar(10)    
    SET  @sWkBeginDate = CONVERT(varchar(10), @iWkBeginDate, 101)

	RAISERROR(50153,18,1,'Flexible Pricing System','usp_mtGetFutureRetail'
              ,@iItemCode
	      ,@iStoreNumber
              ,@sWkBeginDate
              ,@vchCodeSection)

	RETURN (99)









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

