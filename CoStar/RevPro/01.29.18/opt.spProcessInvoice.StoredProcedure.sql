USE [RevPro]
GO
/****** Object:  StoredProcedure [opt].[spProcessInvoice]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [opt].[spProcessInvoice]
 ( @pDebug bit = 0, @pRevenueRunID int )
AS
	
INSERT  [opt].[RevenueItemProcessed]
       (
	   [DEAL_ID]
      ,[CARVE_IN_DEF_REVENUE_SEG1]
      ,[CARVE_IN_DEF_REVENUE_SEG3]
      ,[CARVE_IN_DEF_REVENUE_SEG4]
      ,[UNBILLED_AR_SEG1]
      ,[UNBILLED_AR_SEG3]
      ,[UNBILLED_AR_SEG4]
      ,[CARVE_IN_REVENUE_SEG1]
      ,[CARVE_IN_REVENUE_SEG3]
      ,[CARVE_IN_REVENUE_SEG4]
      ,[CARVE_OUT_REVENUE_SEG1]
      ,[CARVE_OUT_REVENUE_SEG3]
      ,[CARVE_OUT_REVENUE_SEG4]
      ,[ATTRIBUTE24]
      ,[ATTRIBUTE26]
      ,[ATTRIBUTE27]
      ,[BASE_CURR_CODE]
      ,[BILL_TO_COUNTRY]
      ,[BILL_TO_CUSTOMER_NAME]
      ,[BILL_TO_CUSTOMER_NUMBER]
      ,[BUSINESS_UNIT]
      ,[CUSTOMER_ID]
      ,[CUSTOMER_NAME]
      ,[DEF_ACCTG_SEG1]
      ,[DEF_ACCTG_SEG3]
      ,[DEF_ACCTG_SEG4]
      ,[DEFERRED_REVENUE_FLAG]
	  ,[DISCOUNT_AMOUNT]
	  ,[DISCOUNT_PERCENT]
      ,[ELIGIBLE_FOR_CV]
      ,[ELIGIBLE_FOR_FV]
      ,[EX_RATE]
      ,[EXT_LIST_PRICE]
      ,[EXT_SELL_PRICE]
      ,[FLAG_97_2]
      ,[INVOICE_DATE]
      ,[INVOICE_ID]
      ,[INVOICE_LINE]
      ,[INVOICE_NUMBER]
      ,[INVOICE_TYPE]
      ,[ITEM_DESC]
      ,[ITEM_ID]
      ,[ITEM_NUMBER]
      ,[LT_DEFERRED_ACCOUNT]
      ,[NON_CONTINGENT_FLAG]
      ,[ORDER_LINE_TYPE]
      ,[ORDER_TYPE]
      ,[ORG_ID]
      ,[ORIG_INV_LINE_ID]
      ,[PCS_FLAG]
      ,[PO_NUM]
      ,[PRODUCT_CATEGORY]
      ,[PRODUCT_CLASS]
      ,[PRODUCT_FAMILY]
      ,[PRODUCT_LINE]
      ,[QUANTITY_INVOICED]
      ,[QUANTITY_ORDERED]
      ,[QUANTITY_SHIPPED]
      ,[QUOTE_NUM]
      ,[RCURR_EX_RATE]
      ,[RETURN_FLAG]
      ,[REV_ACCTG_SEG1]
      ,[REV_ACCTG_SEG3]
      ,[REV_ACCTG_SEG4]
      ,[RULE_END_DATE]
      ,[RULE_START_DATE]
      ,[SALES_ORDER]
      ,[SALES_ORDER_ID]
	  ,[SALES_ORDER_LINE_ID]
	  ,[SALESREP_NAME]
	  ,[SALES_REP_ID]
	  ,SCHEDULE_SHIP_DATE 
	  ,SHIP_DATE
      ,[SEC_ATTR_VALUE]
      ,[SO_BOOK_DATE]
      ,[STANDALONE_FLAG]
      ,[STATED_FLAG]
	  ,STUB_AMOUNT
	  ,STUB_AMOUNT_LISTPRICE
	  ,[TRAN_TYPE]
      ,[TRANS_CURR_CODE]
      ,[TRANS_DATE]
      ,[UNBILLED_ACCOUNTING_FLAG]
      ,[UNDELIVERED_FLAG]
      ,[UNIT_LIST_PRICE]
      ,[UNIT_SELL_PRICE]
      ,[FV_YEAR]
	  ,RevenueRunID
	  ,SOB_ID
	  ,ORIG_SOB_ID
	  ,DerivedSalesUnitID
	  , CoStarBrandID 
	  , AdjustedEventYear
	  , AdjustedEventMonth
	  ,IsCorrectingEntry
       )

  SELECT DISTINCT  
     ISNULL(l.[MEA],'')   as    DEAL_ID
	,r.CARVE_IN_DEF_REVENUE_SEG1               as    CARVE_IN_DEF_REVENUE_SEG1		
	,r.CARVE_IN_DEF_REVENUE_SEG3                as	CARVE_IN_DEF_REVENUE_SEG3		
	,r.CARVE_IN_DEF_REVENUE_SEG4      as 	CARVE_IN_DEF_REVENUE_SEG4		
	,r.UNBILLED_AR_SEG1               as 	UNBILLED_AR_SEG1		
	,r.UNBILLED_AR_SEG3                as 	UNBILLED_AR_SEG3		
	,r.UNBILLED_AR_SEG4      as    UNBILLED_AR_SEG4		
	,r.CARVE_IN_REVENUE_SEG1        as    CARVE_IN_REVENUE_SEG1		
	,r.CARVE_IN_REVENUE_SEG3               as 	CARVE_IN_REVENUE_SEG3		
	,r.CARVE_IN_REVENUE_SEG4      as 	CARVE_IN_REVENUE_SEG4		
	,r.CARVE_OUT_REVENUE_SEG1          as 	CARVE_OUT_REVENUE_SEG1		
	,r.CARVE_OUT_REVENUE_SEG3                as 	CARVE_OUT_REVENUE_SEG3		
	,r.CARVE_OUT_REVENUE_SEG4      as    CARVE_OUT_REVENUE_SEG4		
    ,r.ATTRIBUTE24  as  ATTRIBUTE24
	,r.ATTRIBUTE26                 as 	ATTRIBUTE26
	,r.ATTRIBUTE27       as 	ATTRIBUTE27
	,r.BASE_CURR_CODE    as BASE_CURR_CODE
	,r.BILL_TO_COUNTRY       as BILL_TO_COUNTRY
	,r.BILL_TO_CUSTOMER_NAME as BILL_TO_CUSTOMER_NAME
	,r.BILL_TO_CUSTOMER_NUMBER as BILL_TO_CUSTOMER_NUMBER
	,r.BUSINESS_UNIT       as  BUSINESS_UNIT--CASE WHEN l.CurrentSku like '%NET%' THEN 'APTS' ELSE b.costarBrandName  END   as BUSINESS_UNIT
	,r.CUSTOMER_ID    as CUSTOMER_ID
	,r.CUSTOMER_NAME    as  CUSTOMER_NAME
	,r.DEF_ACCTG_SEG1                as  DEF_ACCTG_SEG1
   ,r.DEF_ACCTG_SEG3                  as  DEF_ACCTG_SEG3
    ,r.DEF_ACCTG_SEG4      as  DEF_ACCTG_SEG4
    ,r.DEFERRED_REVENUE_FLAG                   as  DEFERRED_REVENUE_FLAG
	,r.DISCOUNT_AMOUNT
	, r.DISCOUNT_PERCENT
	,CASE WHEN CAST(m.MEAStartDate as Date) <'01/01/2016' THEN 'N' ELSE 'Y' END  ELIGIBLE_FOR_CV
    ,CASE WHEN CAST(m.MEAStartDate as Date) <'01/01/2016' THEN 'N' ELSE 'Y' END  ELIGIBLE_FOR_FV
	,1                             as EX_RATE
	
	,r.UNIT_LIST_PRICE					as [EXT_LIST_PRICE]
	,l.NAVAmount								as EXT_SELL_PRICE
	,r.FLAG_97_2                           as FLAG_97_2
    ,l.NAVInvoiceDate                            as INVOICE_DATE
    ,l.RevenueItemGroupedID                            as INVOICE_ID
    ,l.NAVLineNo                           as INVOICE_LINE
	,l.NAVDocumentNo                           as [INVOICE_NUMBER]
    ,''                             as INVOICE_TYPE
    ,r.ITEM_DESC       as ITEM_DESC
	,r.ITEM_ID         as ITEM_ID
	,r.ITEM_NUMBER                  as ITEM_NUMBER
	,r.LT_DEFERRED_ACCOUNT                        as LT_DEFERRED_ACCOUNT
	,r.NON_CONTINGENT_FLAG                           as NON_CONTINGENT_FLAG
	,''                            as ORDER_LINE_TYPE
	,''                            as ORDER_TYPE
    ,r.ORG_ID             as ORG_ID	
    ,''                            as [ORIG_INV_LINE_ID]           
	,r.[PCS_FLAG]                           as [PCS_FLAG]
    ,''                            as [PO_NUM]
	,r.PRODUCT_CATEGORY           as PRODUCT_CATEGORY
	,r.PRODUCT_CLASS             as PRODUCT_CLASS
	,r.PRODUCT_FAMILY       as PRODUCT_FAMILY
    ,r.PRODUCT_LINE      as PRODUCT_LINE
	,1                            as QUANTITY_INVOICED
    --,CASE WHEN  CAST( DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0, co.RenewalDate)+1,0)) as DATE)=co.RenewalDate AND DAY(l.AdjustedBillingStartDate)=1 THEN Datediff(mm,l.AdjustedBillingStartDate,DATEADD(dd,1,co.RenewalDate)) 
	--          ELSE Datediff(mm,l.AdjustedBillingStartDate,co.RenewalDate) END  QUANTITY_ORDERED  --CASE WHEN Day(l.BillingStartDate)=1 THEN l.ContractTermMonths ELSE l.[RenewalTermMonths] END   as QUANTITY_ORDERED
	--,CASE WHEN  CAST( DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0, co.RenewalDate)+1,0)) as DATE)=co.RenewalDate AND DAY(l.AdjustedBillingStartDate)=1 THEN Datediff(mm,l.AdjustedBillingStartDate,DATEADD(dd,1,co.RenewalDate)) 
	--          ELSE Datediff(mm,l.AdjustedBillingStartDate,co.RenewalDate) END QUANTITY_SHIPPED --CASE WHEN Day(l.BillingStartDate)=1 THEN l.ContractTermMonths ELSE l.[RenewalTermMonths] END   as QUANTITY_SHIPPED
	, l.QUANTITY_ORDERED  as 	QUANTITY_ORDERED
	, l.QUANTITY_ORDERED as QUANTITY_SHIPPED
    ,''                            as QUOTE_NUM
    ,1                             as RCURR_EX_RATE
	,'N'                           as RETURN_FLAG
    ,r.REV_ACCTG_SEG1  as REV_ACCTG_SEG1
    ,r.REV_ACCTG_SEG3                          as REV_ACCTG_SEG3
    ,r.REV_ACCTG_SEG4  as REV_ACCTG_SEG4
	,l.NAVBillingEndDate RuleEndDate
    ,l.NAVBillingStartDate as RULE_START_DATE
    ,r.SALES_ORDER                 as SALES_ORDER
    ,r.SALES_ORDER_ID               as SALES_ORDER_ID
	,r.SALES_ORDER_LINE_ID               as SALES_ORDER_LINE_ID
	,r.[SALESREP_NAME] [SALESREP_NAME]
	  ,r.[SALES_REP_ID]  [SALES_REP_ID]
	  ,r.SCHEDULE_SHIP_DATE 
	  ,r.SHIP_DATE
	,r.SEC_ATTR_VALUE                                    as SEC_ATTR_VALUE
    ,cast(l.LineItemCreatedDate as Date)              as SO_BOOK_DATE
	,'N'                                       as STANDALONE_FLAG
    ,'N'                                       as STATED_FLAG
	, 0 --l.STUB_AMOUNT								as STUB_AMOUNT
	, 0 -- l.STUB_AMOUNT_LISTPRICE					as STUB_AMOUNT_LISTPRICE
    ,'INV'                                      as TRAN_TYPE
	,r.TRANS_CURR_CODE                        as TRANS_CURR_CODE
	,cast(l.LineItemCreatedDate as Date)              as TRANS_DATE
	,'Y'                                       as UNBILLED_ACCOUNTING_FLAG
	,'N'                                       as UNDELIVERED_FLAG
	,r.UNIT_LIST_PRICE   as UNIT_LIST_PRICE
	 ,r.UNIT_SELL_PRICE                             as UNIT_SELL_PRICE
	,YEAR(m.MEAStartDate)			   as FV_YEAR
	, @pRevenueRunID
	,SOB_ID = l.SOB_ID
	, r.SOB_ID as ORIG_SOB_ID
	, DerivedSalesUnitID = l.DerivedSalesUnitID
	, l.CoStarBrandID 
	, l.AdjustedEventYear
	  , l.AdjustedEventMonth
	  , 0 IsCorrectingEntry
  FROM stg.RevenueItemGrouped l
	 inner join opt.RevenueItemProcessed r on r.DEAL_ID = l.mea and l.SOB_ID = r.SOB_ID 
	 inner join opt.mea m on m.mea = l.MEA 
	where  l.RevenueRunID = @pRevenueRunID 
		and l.RevenueItemType = 'Invoice' and r.TRAN_TYPE = 'SO' and r.IsCorrectingEntry = 0
	

	-- clear gouping table 

    --if @pdebug = 0 delete from stg.RevenueItemGrouped where  RevenueRunID = @pRevenueRunID


 --Setting Billing start date to the minimum in the contract

IF (OBJECT_ID('Tempdb..#BillingDate')>0)
   DROP TABLE #BillingDate

SELECT MEA,ContractID,SiteLocationID,Max(BillingStartDate)BillingStartDate
INTO #BillingDate
FROM [stg].RevenueItemRaw
	where RevenueRunID = @pRevenueRunID
GROUP BY ContractID,SiteLocationID,MEA

--UPDATE d
--SET SCHEDULE_SHIP_DATE=b.BillingStartDate,
--    SHIP_DATE         =b.BillingStartDate   
--FROM [opt].[RevenueItemProcessed] d
--INNER JOIN #BillingDate b ON b.ContractID=d.SALES_ORDER AND d.CUSTOMER_ID=b.SiteLocationID AND d.DEAL_ID=b.MEA
-- where RevenueRunID = @pRevenueRunID  and tran_type = 'INV'

 UPDATE h
 SET 
	 RULE_END_DATE    =REPLACE(CONVERT(varchar(11),CAST(RULE_END_DATE as DATE),106), ' ', '-'),
	 RULE_START_DATE  =REPLACE(CONVERT(varchar(11),CAST(RULE_START_DATE as DATE),106), ' ', '-'),
	 SCHEDULE_SHIP_DATE=REPLACE(CONVERT(varchar(11),CAST(SCHEDULE_SHIP_DATE as Date),106), ' ', '-'),
	 SHIP_DATE         =REPLACE(CONVERT(varchar(11),CAST(SHIP_DATE as DATE),106), ' ', '-'), 
     SO_BOOK_DATE      =REPLACE(CONVERT(varchar(11),CAST(SO_BOOK_DATE as DATE),106), ' ', '-'),
	 TRANS_DATE        =REPLACE(CONVERT(varchar(11),CAST(TRANS_DATE as DATE),106), ' ', '-') 
	 --DISCOUNT_AMOUNT   =([UNIT_LIST_PRICE]- [UNIT_SELL_PRICE]),
	-- DISCOUNT_PERCENT  =([UNIT_LIST_PRICE]- [UNIT_SELL_PRICE])/[UNIT_LIST_PRICE] 
 FROM [opt].[RevenueItemProcessed] h
 WHERE [UNIT_LIST_PRICE] >0  and tran_type = 'INV'




 UPDATE [opt].[RevenueItemProcessed]  SET BUSINESS_UNIT='APTS' WHERE ORG_ID=210
	and RevenueRunID = @pRevenueRunID  and tran_type = 'INV'

 Update h
set CONVERSION_DATA=CASE WHEN FV_YEAR <2016 THEN 'CONVERSION' ELSE '' END,
INVOICE_TYPE = 'Invoice'
FROM [opt].[RevenueItemProcessed] h  where tran_type = 'INV' and RevenueRunID = @pRevenueRunID

  
--update s
--set  EXt_list_Price=EXt_list_Price+ISNULL([STUB_AMOUNT_LISTPRICE],0),
--	 Ext_Sell_Price=Ext_Sell_Price+ISNULL(STUB_AMOUNT,0)
--FROM [opt].[RevenueItemProcessed]  s
--	where  RevenueRunID = @pRevenueRunID

  --UPDATE d
  --SET  SALES_REP_ID =l.[AEContactID]   ,
  --     SALESREP_NAME=l.[AEContactName]
  --FROM  [opt].[RevenueItemProcessed] d
  --INNER JOIN (
  --     select ContractID,[AEContactID],[AEContactName] ,Row_number() over(partition by ContractID order by AEContactID ) as rn 
  --     From stg.RevenueItemRaw
  --     Where AEContactID is not null) l on l.ContractID=d.SALES_ORDER
  --Where l.rn=1 and RevenueRunID = @pRevenueRunID  and tran_type = 'INV'
 

 --Setting Carv values
 UPDATE d
 SET CARVE_IN_DEF_REVENUE_SEG2= ISNULL(left(su.SalesUnitCD, 4),0),
     UNBILLED_AR_SEG2          =ISNULL(left(su.SalesUnitCD, 4),0),
	 CARVE_IN_REVENUE_SEG2     =ISNULL(left(su.SalesUnitCD, 4),0) ,
     CARVE_OUT_REVENUE_SEG2	   =ISNULL(left(su.SalesUnitCD, 4),0),
     ATTRIBUTE25               =ISNULL(left(su.SalesUnitCD, 4),0),
     DEF_ACCTG_SEG2            =ISNULL(left(su.SalesUnitCD, 4),0),
     REV_ACCTG_SEG2            =ISNULL(left(su.SalesUnitCD, 4),0) ,
     LT_DEFERRED_ACCOUNT_SEG5 ='0'
 FROM [opt].[RevenueItemProcessed] d
 LEFT JOIN [Enterprise].dbo.SalesUnit su on d.DerivedSalesUnitID=su.SalesUnitID 
 WHERE su.ProductID in ( 1,2,5)  and tran_type = 'INV' and d.RevenueRunID = @pRevenueRunID 



  UPDATE d
 SET CARVE_IN_DEF_REVENUE_SEG2= 'USA',-- ISNULL(su.SalesUnitCD,0),
     UNBILLED_AR_SEG2          ='USA',-- ISNULL(su.SalesUnitCD,0)
	 CARVE_IN_REVENUE_SEG2     ='USA',-- ISNULL(su.SalesUnitCD,0),
     CARVE_OUT_REVENUE_SEG2	   ='USA',-- ISNULL(su.SalesUnitCD,0),
     ATTRIBUTE25               ='USA',-- ISNULL(su.SalesUnitCD,0),
     DEF_ACCTG_SEG2            ='USA',-- ISNULL(su.SalesUnitCD,0),
     REV_ACCTG_SEG2            ='USA'-- ISNULL(su.SalesUnitCD,0),
     
 FROM [opt].[RevenueItemProcessed] d
 LEFT JOIN EnterpriseSub.dbo.SalesUnit su on d.DerivedSalesUnitID = su.SalesUnitID
 WHERE d.CoStarBrandID IN (210,2,10) and revenuerunid = @pRevenueRunID   and tran_type = 'INV'


 -- where there is a stub period, the ext_sell and unit sell price are unequal
 -- then pro rate the ext_list_price accordingly so that it is a stub
 	
		update stubInv set stubInv.EXT_LIST_PRICE = so.STUB_AMOUNT_LISTPRICE 
		 
		FROM [opt].[RevenueItemProcessed] stubInv 
			inner join opt.mea m on m.mea = stubInv.deal_id
			 inner join opt.RevenueItemProcessed so on so.DEAL_ID = stubInv.DEAL_ID and stubInv.SOB_ID = so.SOB_ID  
				and so.TRAN_TYPE = 'SO'
		where stubInv.tran_type = 'INV' and stubInv.RevenueRunID = @pRevenueRunID 
		and m.MEAType = 'Contract Creation' and cast(stubInv.RULE_START_DATE as date) = m.MEABillingStartDate
			and day(m.MEABillingStartDate) > 1

RETURN 0

GO
