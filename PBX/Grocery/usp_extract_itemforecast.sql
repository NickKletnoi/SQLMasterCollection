/****** Object:  Stored Procedure dbo.usp_extract_itemforecast    Script Date: 10/16/02 9:24:36 AM ******/


/*===============================================================
|
| File Name:  usp_extract_itemforecast.sql
|
| Purpose:    Extracts itemforecast data from the Deli database.
|             The results are spooled to output.
|
| Version:    V 2.0 For the new "grocery" schema
|
| Requirements:
|
| Object                Database    Type   Description
| --------------------  ----------  -----  ---------------------
| 
| itemforecast          Grocery        Table  Source table
| item                  Grocery        Table  Source table
| excludedate           Grocery        Table  Source table
| excludedatecategory   Grocery        Table  Source table
| excludedateitem       Grocery        Table  Source table
| #tmp_itemforecast     Grocery        Table  Temporary table
| 
|
| Modification History
|
|    29-March-02 - Created	
|    24-April-02 - Modified (added adjustment reason codes)
|    22-May-02   - Modified (changed the mapping to the old schema, see version 1.0)
|    26-Aug-02   - Modified (changed views to use recommended order columns that
|		             are stored in units for both bread and milk)
|    12-Sep-02   - Modified (changed zero-padding of item_nk from 7 to 13)
|
|    	
|    12/11/2002 - PSKN 
|    Retail value for items need to be taken from the retail table as
|    this table maintains a history of the retail prices for all items
|    and so we get the correct retail that were in effect for the dates this
|    proc is run.
|
|    4/1/2003 - ssdj
|    Added line   sum(isnull(f.roundedorder,0)*i.tray)/count(isnull(t.itemcode,0))
|    Added line   sum(isnull(f.roundedorder,0)*i.tray)
|
\==============================================================*/

CREATE               PROCEDURE [dbo].[usp_extract_itemforecast]
@p_extract_audit_gk                         int,
@p_store_number                             varchar(6),
@p_post_start_date                          datetime,
@p_post_end_date                            datetime

AS

SET NOCOUNT ON

-- Declare param table variables
DECLARE @weeks_to_forecast                  int

-- Common variables
DECLARE @error_num                          int
DECLARE @row_count                          int

-- Other variables
DECLARE @wedate_start                       datetime
DECLARE @wedate_end                         datetime
DECLARE @day_of_week_start                  int
DECLARE @day_of_week_end                    int
DECLARE @status_desc                        varchar(100)

-- Constant variables

DECLARE @EXCLUDE_DATE_TRUE                  char(1)
DECLARE @EXCLUDE_DATE_FALSE                 char(1)
DECLARE @ERROR_MISSING_PARAMETER            int
DECLARE @ERROR_PROCEDURE_FAIL_MSG           varchar(100)

-- Initialize common variables
SET @error_num = 0
SET @row_count = 0

-- Initialize constants
SET @EXCLUDE_DATE_TRUE = 'Y'
SET @EXCLUDE_DATE_FALSE = 'N'
SET @ERROR_MISSING_PARAMETER = 51001
SET @ERROR_PROCEDURE_FAIL_MSG = 'Extract usp_extract_itemforecast failed: '

IF (@p_store_number IS NULL OR 
    @p_post_start_date IS NULL OR 
    @p_post_end_date IS NULL)
  SET @error_num = @ERROR_MISSING_PARAMETER

  -- Get the itemforast data to a temporary table

IF (@error_num = 0)
BEGIN

  -- Get the inventory adjusted rows first

SELECT  cast(@p_store_number as int) as store_nk, 
	f.itemcode as item_nk,
	f.salesdate as calendar_nk,
        f.upc  as upc,
	t.reasoncode as reasoncode,
	'                                                                      ' as reasondescription,
	Sum(isnull(f.salesqty,0))/count(isnull(t.itemcode,0)) as sales_qty, 
	Sum(isnull(f.salesamount,0))/count(isnull(t.itemcode,0)) as sales_amount,
	Sum(isnull(f.staled,0))/count(isnull(t.itemcode,0)) as stales_qty, 
	Sum(isnull(f.forecastsales,0))/count(isnull(t.itemcode,0)) as forecastsales_qty,
        sum(isnull(f.forecastprod,0))/count(isnull(t.itemcode,0)) as forecastorder_qty,
        case when sum(isnull(f.adjustedorder,0)) = 0  then sum(isnull(f.actualorder,0))/count(isnull(t.itemcode,0))
	 else sum(isnull(f.adjustedorder,0))/count(isnull(t.itemcode,0)) end  as order_qty,
	sum(isnull(f.adjustedorder,0))/count(isnull(t.itemcode,0)) as adjustedorder_qty,
        sum(isnull(f.originalforecastsales,0))/count(isnull(t.itemcode,0)) as originalforecastsales_qty,
	Sum(isnull(f.receipts,0))/count(isnull(t.itemcode,0)) as received_qty, 
	Sum(isnull(f.onhand,0))/count(isnull(t.itemcode,0)) as inventory_qty, 
	sum(isnull(t.newonhand,0)) - sum(isnull(t.oldonhand,0)) as inventoryadjustement_qty, 
	count(isnull(t.itemcode,0)) as inventoryadjustmentcount_qty,
	--later on change this line to use the rounded order for both milk and bread
	--for the recommendedorder_qty column
	--get the units for both milk and bread products by multipling the cases and palets by trays
	--sum(isnull(f.roundedorder,0)*i.tray)/count(isnull(t.itemcode,0)) as recommendedorder_qty,
	case when avg(cast(f.category as int)) = 1104 then 
		sum(isnull(f.roundedorder,0))/count(isnull(t.itemcode,0))
	else
	--BEGIN 4/1/2003 -- ssdj
		--sum(isnull(f.recommendedorder,0))/count(isnull(t.itemcode,0))
		sum(isnull(f.roundedorder,0)*i.tray)/count(isnull(t.itemcode,0))
	--END 4/1/2003 -- ssdj
	end as recommendedorder_qty,

	--*************************************************************************************
	--Begin 12/11/2002 -- PSKN --	Retail needs to be taken from retail table so that we get the 
				   --	retail value that was in effect for the salesdate
	--sum(isnull(i.retail,0)) as retail,
	sum(isnull(r.retail,0)) as retail,
	-- End 12/11/2002 -- PSKN 
	--*************************************************************************************

	@EXCLUDE_DATE_FALSE AS exclude_date_flg,
	avg(cast(f.category as int)) as category
  INTO
    [#tmp_itemforecast]
  FROM  itemforecast as f inner join  item as i
	on i.itemcode = f.itemcode and i.upc = f.upc
	inner join invtransactionlog as t on f.itemcode = t.itemcode and f.upc = t.upc and 
	--*************************************************************************************
	--Begin 1/10/2003 -- PCXS --	only reason codes 2 and 3 
        f.salesdate = t.txdate and t.txtype = 3 and t.reasoncode in (2,3)
        --END 01/10/2003 -- PCXS

	--*************************************************************************************
	--Begin 12/11/2002 -- PSKN --	Retail needs to be taken from retail table so that we get the 
				   --	retail value that was in effect for the salesdate
	inner join retail_tbl as r on f.itemcode = r.itemcode and f.salesdate >= r.effective_date and
	f.salesdate <= r.termination_date
	--End 12/11/2002 -- PSKN
	--*************************************************************************************

  WHERE
	f.salesdate >= @p_post_start_date AND
    	f.salesdate < @p_post_end_date
  GROUP BY f.itemcode,f.salesdate,f.upc,t.reasoncode
  ORDER BY f.itemcode, f.salesdate DESC

  SELECT @error_num = @@ERROR

END

IF (@error_num = 0)
	BEGIN
	Alter table [#tmp_itemforecast] Alter column reasoncode smallint NULL
        SELECT @error_num = @@ERROR	

END


--get the rest of the rows from itemforecast table
IF (@error_num = 0)
BEGIN

INSERT INTO
    	[#tmp_itemforecast]

SELECT  cast(@p_store_number as int) as store_nk, 
	f.itemcode as item_nk,
	f.salesdate as calendar_nk,
        f.upc  as upc,
	NULL as reasoncode,
	'' as reasondescription,
	Sum(isnull(f.salesqty,0)) as sales_qty, 
	Sum(isnull(f.salesamount,0)) as sales_amount,
	Sum(isnull(f.staled,0)) as stales_qty, 
	Sum(isnull(f.forecastsales,0)) as forecastsales_qty,
        sum(isnull(f.forecastprod,0)) as forecastorder_qty,
        case when sum(isnull(f.adjustedorder,0)) = 0  then sum(isnull(f.actualorder,0))
	 else sum(isnull(f.adjustedorder,0)) end  as order_qty,
	sum(isnull(f.adjustedorder,0)) as adjustedorder_qty,
        sum(isnull(f.originalforecastsales,0)) as originalforecastsales_qty,
	Sum(isnull(f.receipts,0)) as received_qty, 
	Sum(isnull(f.onhand,0)) as inventory_qty, 
	0 as inventoryadjustement_qty, 
	0 as inventoryadjustmentcount_qty,
	--later on change this line to use the rounded order for both milk and bread
	--for the recommendedorder_qty column
	--get the units for both milk and bread products by multipling the cases and palets by trays
	--sum(isnull(f.roundedorder,0)*i.tray) as recommendedorder_qty,
	case when avg(cast(f.category as int)) = 1104 then 
		sum(isnull(f.roundedorder,0))
	else
	--BEGIN 4/1/2003 -- ssdj
		--sumsum(isnull(f.recommendedorder,0))
		sum(isnull(f.roundedorder,0)*i.tray)
	--END 4/1/2003 -- ssdj
	end  as recommendedorder_qty,

	--*************************************************************************************
	--Begin 12/11/2002 -- PSKN --	Retail needs to be taken from retail table so that we get the 
				   --	retail value that was in effect for the salesdate
	--sum(isnull(i.retail,0)) as retail,
	sum(isnull(r.retail,0)) as retail,
	-- End 12/11/2002 -- PSKN 
	--*************************************************************************************

	@EXCLUDE_DATE_FALSE AS exclude_date_flg,
	avg(cast(f.category as int)) as category
  FROM  itemforecast as f inner join  item as i
	on i.itemcode = f.itemcode and i.upc = f.upc

	--*************************************************************************************
	--Begin 12/11/2002 -- PSKN --	Retail needs to be taken from retail table so that we get the 
				   --	retail value that was in effect for the salesdate
	inner join retail_tbl as r on f.itemcode = r.itemcode and f.salesdate >= r.effective_date and
	f.salesdate <= r.termination_date
	--End 12/11/2002 -- PSKN
	--*************************************************************************************

  WHERE
	f.salesdate >= @p_post_start_date AND
    	f.salesdate < @p_post_end_date
	AND NOT Exists (Select 1 from  [#tmp_itemforecast] as t1 where f.itemcode = t1.item_nk and f.upc = t1.upc and 
	f.salesdate = t1.calendar_nk)
  GROUP BY f.itemcode,f.salesdate,f.upc
  ORDER BY f.itemcode, f.salesdate DESC

  SELECT @error_num = @@ERROR	

END



--get reason code descriptions
IF (@error_num = 0)
BEGIN
  UPDATE t SET
    t.reasondescription = a.reasondescription
  FROM
    [#tmp_itemforecast] t,
    [dbo].[adjustmentreason] a 
  WHERE
    t.reasoncode = a.reasoncode
   
  SELECT @error_num = @@ERROR

END



IF (@error_num = 0)
BEGIN

  -- Determine exclude date flag

  UPDATE [#tmp_itemforecast] SET
    exclude_date_flg = @EXCLUDE_DATE_TRUE
  FROM
    [#tmp_itemforecast] t,
    [dbo].[excludedate] e
  WHERE
    t.calendar_nk = e.salesdate

  SELECT @error_num = @@ERROR

  IF (@error_num = 0)
  BEGIN

    UPDATE [#tmp_itemforecast] SET
      exclude_date_flg = @EXCLUDE_DATE_TRUE
    FROM
      [#tmp_itemforecast] t,
      [dbo].[excludedatecategory] e
    WHERE
      t.calendar_nk = e.salesdate AND
      t.category = cast(e.category as int)

    SELECT @error_num = @@ERROR

  END

  IF (@error_num = 0)
  BEGIN

    UPDATE [#tmp_itemforecast] SET
      exclude_date_flg = @EXCLUDE_DATE_TRUE
    FROM
      [#tmp_itemforecast] t,
      [dbo].[excludedateitem] e
    WHERE
      t.calendar_nk = e.salesdate AND
      t.item_nk = e.itemcode

    SELECT @error_num = @@ERROR

  END


  IF (@error_num = 0)
  BEGIN
   -- Fix the item numbers, fill the leading blanks with 0

    UPDATE [#tmp_itemforecast] SET
      item_nk = REPLICATE('0',13 - LEN(LTRIM(RTRIM(item_nk)))) + LTRIM(RTRIM(item_nk))
    SELECT @error_num = @@ERROR
  END
 


END





IF (@error_num = 0)
BEGIN

  -- Spool results to textfile
/*
INSERT INTO [GPPS_DM].[dbo].[SG_FC_GPPS]
([store_nk], 
[item_nk], 
[calendar_nk], 
[upc], 
[reasoncode], 
[reasondescription], 
[sales_qty], 
[sales_amount], 
[stales_qty], 
[forecastsales_qty], 
[forecastorder_qty], 
[order_qty], 
[adjustedorder_qty], 
[received_qty], 
[inventory_qty], 
[inventoryadjustment_qty], 
[inventoryadjustmentcount_qty], 
[recommendedorder_qty], 
[retail], 
[exclude_date_flg])
*/
  Select store_nk, 
	 item_nk,
	 CONVERT (varchar(10), calendar_nk, 120) as calendar_nk,
	 upc,
	 reasoncode,
	 reasondescription,
	 sales_qty, 
	 sales_amount,
	 stales_qty, 
	 forecastsales_qty,
         forecastorder_qty,
         order_qty,
	 adjustedorder_qty,
	 originalforecastsales_qty,
	 received_qty, 
	 inventory_qty, 
	 inventoryadjustement_qty, 
	 inventoryadjustmentcount_qty,
	 recommendedorder_qty,
	 retail,
	 exclude_date_flg
	 
  From [#tmp_itemforecast]
  Order by calendar_nk
	

  SELECT @error_num = @@ERROR

END

TRUNCATE TABLE [#tmp_itemforecast]


IF (@error_num <> 0)
BEGIN

  SET @status_desc = @ERROR_PROCEDURE_FAIL_MSG + CONVERT (varchar, @error_num)

  EXEC [dbo].[usp_error_audit]
    @p_extract_audit_gk = @p_extract_audit_gk,
    @p_status_desc = @status_desc

END




















