USE [RevPro]
GO
/****** Object:  StoredProcedure [dbo].[usp_Invoice_Feed]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_Invoice_Feed] 
AS

/*
==========================================================================
DESCRIPTION

	Proc Name:  usp_Invoice_Feed
	Purpose:    

	NOTES

	MODIFICATIONS

	Date	    Author		Purpose
	------------------------------------------------

	2017-06-05  Vitaly Romm	Initial version

	EXEC Revpro..usp_Invoice_Feed

==========================================================================
*/  

/* Archive the results */
INSERT INTO RevPro..Invoice_Archive
SELECT * FROM Staging..Invoice_Feed


IF OBJECT_ID('Staging..Invoice_Feed') IS NOT NULL
    TRUNCATE TABLE Staging..Invoice_Feed

-------------------------------------

IF OBJECT_ID('tempdb..#Unique_SO') IS NOT NULL
    DROP TABLE #Unique_SO

SELECT DISTINCT Sales_Order, RowID = IDENTITY (INT, 1,1)
INTO #Unique_SO
FROM RevPro..Invoice_Raw

CREATE CLUSTERED INDEX CLX_Sales_Order
  ON #Unique_SO (Sales_Order)

-------------------------------------

DECLARE @MAX_Count		INT = (SELECT COUNT(DISTINCT Sales_Order) FROM RevPro..Invoice_Raw),
        @Begin_Count	INT = 1,
		@End_Count		INT = 1000,
		@Increment		INT = 1000

--------------------------------------
 
WHILE @Begin_Count <= @MAX_Count
	BEGIN


INSERT INTO Staging..Invoice_Feed
SELECT DISTINCT 
       Client_ID, 
       MIN(Deal_ID_CurrentTermStartDate) AS Deal_ID_CurrentTermStartDate,
	   MAX(Deal_ID_CreatedDate)   		 AS Deal_ID_CreateDate,
	   MAX(Deal_ID_LocationID)			 AS Deal_ID_LocationID,

	   CARVE_IN_DEF_REVENUE_SEG1,
	   MAX(CARVE_IN_DEF_REVENUE_SEG2)	 AS CARVE_IN_DEF_REVENUE_SEG2,
	   CARVE_IN_DEF_REVENUE_SEG3,
	   CARVE_IN_DEF_REVENUE_SEG4,

	   UNBILLED_AR_SEG1,
	   MAX(UNBILLED_AR_SEG2)			 AS UNBILLED_AR_SEG2,	
	   UNBILLED_AR_SEG3,
	   UNBILLED_AR_SEG4,

	   CARVE_IN_REVENUE_SEG1,
	   MAX(CARVE_IN_REVENUE_SEG2)		 AS CARVE_IN_REVENUE_SEG2,	
	   CARVE_IN_REVENUE_SEG3,
	   CARVE_IN_REVENUE_SEG4,
		
       CARVE_OUT_REVENUE_SEG1,
	   MAX(CARVE_OUT_REVENUE_SEG2)		 AS CARVE_OUT_REVENUE_SEG2,	
	   CARVE_OUT_REVENUE_SEG3,
	   CARVE_OUT_REVENUE_SEG4,

	   0		     					 AS ATTRIBUTE24,
	   MAX(ATTRIBUTE25)					 AS ATTRIBUTE25,	 
	   ATTRIBUTE26,
	   ATTRIBUTE27,

	   MAX(BASE_CURR_CODE)				 AS BASE_CURR_CODE,
	   MAX(BILL_TO_COUNTRY)				 AS BILL_TO_COUNTRY,
	   MAX(BILL_TO_CUSTOMER_NAME)		 AS BILL_TO_CUSTOMER_NAME,
	   MAX(BILL_TO_CUSTOMER_NUMBER)		 AS BILL_TO_CUSTOMER_NUMBER,

	   MAX(BUSINESS_UNIT)				 AS BUSINESS_UNIT,
	   MAX(CUSTOMER_ID)					 AS CUSTOMER_ID,
	   MAX(CUSTOMER_NAME)				 AS CUSTOMER_NAME,

	   DEF_ACCTG_SEG1,
	   MAX(DEF_ACCTG_SEG2)				 AS DEF_ACCTG_SEG2,	
	   DEF_ACCTG_SEG3,
	   DEF_ACCTG_SEG4,

	   MAX(DEFERRED_REVENUE_FLAG)		 AS DEFERRED_REVENUE_FLAG,
	   MAX(DISCOUNT_AMOUNT)				 AS DISCOUNT_AMOUNT,
	   MAX(DISCOUNT_PERCENT)			 AS DISCOUNT_PERCENT,	

	   MAX(ELIGIBLE_FOR_CV_CreateDated)  AS ELIGIBLE_FOR_CV_CreateDated,
	   MAX(ELIGIBLE_FOR_FV_CreateDated)  AS ELIGIBLE_FOR_FV_CreateDated,

       MAX(EX_RATE)						  AS EX_RATE,
       SUM(EXT_LIST_PRICE)				  AS EXT_LIST_PRICE,
       SUM(EXT_SELL_PRICE)				  AS EXT_SELL_PRICE,
       MAX(FLAG_97_2)					  AS FLAG_97_2,

	   MIN(INVOICE_DATE)				  AS INVOICE_DATE,
	   MAX(INVOICE_ID)					  AS INVOICE_ID,
	   MAX(INVOICE_LINE)				  AS INVOICE_LINE,
	   MAX(INVOICE_LINE_ID)				  AS INVOICE_LINE_ID,
	   MAX(INVOICE_NUMBER)				  AS INVOICE_NUMBER,
	   MAX(INVOICE_TYPE)				  AS INVOICE_TYPE,

	   MAX(ITEM_DESC)					  AS ITEM_DESC,
	   MAX(ITEM_ID)                       AS ITEM_ID,

       ITEM_NUMBER,	

       MAX(LT_DEFERRED_ACCOUNT)		AS LT_DEFERRED_ACCOUNT,
       MAX(NON_CONTINGENT_FLAG)		AS NON_CONTINGENT_FLAG,

       MAX(ORDER_LINE_TYPE)			AS ORDER_LINE_TYPE,
       MAX(ORDER_TYPE)				AS ORDER_TYPE,
       MAX(ORG_ID)					AS ORG_ID,
       MAX(ORIG_INV_LINE_ID)		AS ORIG_INV_LINE_ID,

	   MAX(PCS_FLAG)				AS PCS_FLAG,
       MAX(PO_NUM)					AS PO_NUM,
       MAX(PRODUCT_CATEGORY)		AS PRODUCT_CATEGORY,
       MAX(PRODUCT_CLASS)           AS PRODUCT_CLASS,
	   MAX(PRODUCT_FAMILY)          AS PRODUCT_FAMILY,
	   MAX(PRODUCT_LINE)            AS PRODUCT_LINE,

	   QUANTITY_INVOICED,
       MAX(QUANTITY_ORDERED_SHIPPED_BillingStartDate)	AS   QUANTITY_ORDERED_SHIPPED_BillingStartDate,	--CurrentTermStartDate
	   MAX(QUANTITY_ORDERED_SHIPPED_RenewalDate)		AS   QUANTITY_ORDERED_SHIPPED_RenewalDate,

	   MAX(QUOTE_NUM)				AS QUOTE_NUM,
       MAX(RCURR_EX_RATE)			AS RCURR_EX_RATE,
       MAX(RETURN_FLAG)				AS RETURN_FLAG,

	   REV_ACCTG_SEG1,
	   MAX(REV_ACCTG_SEG2)			AS REV_ACCTG_SEG2,	
	   REV_ACCTG_SEG3,
	   REV_ACCTG_SEG4,

	   RULE_END_DATE,
	   RULE_START_DATE,
	   --MAX(RULE_END_DATE)			AS RULE_END_DATE,	
	   --MIN(RULE_START_DATE)			AS RULE_START_DATE,

       INV.SALES_ORDER, 
	   SALES_ORDER_ID,
	   MAX(SALES_ORDER_LINE)		AS SALES_ORDER_LINE,
	   SALES_ORDER_LINE_ID,

	   MAX(SALES_REP_ID)		AS SALES_REP_ID,
       MAX(SALESREP_NAME)		AS SALESREP_NAME,
       MIN(SCHEDULE_SHIP_DATE)  AS SCHEDULE_SHIP_DATE,
       MAX(SEC_ATTR_VALUE)		AS SEC_ATTR_VALUE,
       MIN(SHIP_DATE)           AS SHIP_DATE,
       MIN(SO_BOOK_DATE)        AS SO_BOOK_DATE,

	   MIN(SOB_ID)			    AS SOB_ID,
       MAX(STANDALONE_FLAG)		AS STANDALONE_FLAG,
       MAX(STATED_FLAG)			AS STATED_FLAG,
       MAX(TRAN_TYPE)			AS TRAN_TYPE,
       MAX(TRANS_CURR_CODE)		AS TRANS_CURR_CODE,
       MIN(TRANS_DATE)			AS TRANS_DATE,	

       MAX(UNBILLED_ACCOUNTING_FLAG)	AS UNBILLED_ACCOUNTING_FLAG,
       MAX(UNDELIVERED_FLAG)			AS UNDELIVERED_FLAG,
		
	   SUM(UNIT_LIST_PRICE)		AS UNIT_LIST_PRICE, 
	   SUM(UNIT_SELL_PRICE)		AS UNIT_SELL_PRICE,
       MAX(FV_Year)				AS FV_Year,
	   MAX(Stub_Amount)			AS Stub_Amount,

	   MAX(CONVERSION_DATA_CreatedDate)		AS CONVERSION_DATA_CreatedDate,
       MAX(CANCELLED_FLAG_LineItemStatusID)	AS CANCELLED_FLAG_LineItemStatusID,

       CARVE_IN_DEF_REVENUE_SEG5, UNBILLED_AR_SEG5, CARVE_IN_REVENUE_SEG5, CARVE_OUT_REVENUE_SEG5, DEF_ACCTG_SEG5, REV_ACCTG_SEG5, LT_DEFERRED_ACCOUNT_SEG5,

       ATTRIBUTE28, NUMBER5, 

	   '' AS Attribute1, '' AS Attribute2, '' AS Attribute3, '' AS Attribute4, '' AS Attribute5, 
	   '' AS Attribute6, '' AS Attribute7, '' AS Attribute8, '' AS Attribute9, '' AS Attribute10,

	   MAX(BundleID)	AS BundleID,
	   0				AS Batch_ID,
	   
	   DW_Fl, RPro_Fl, Created_By, MAX(Create_Dt) AS Create_Dt, Last_Updated_By, MAX(Last_Update_Dt) AS Last_Update_Dt
	   	
FROM RevPro..Invoice_Raw INV
	JOIN #Unique_SO SO
		ON INV.Sales_Order = SO.Sales_Order			

WHERE RowID BETWEEN @Begin_Count AND @End_Count

GROUP BY Client_ID,
         CARVE_IN_DEF_REVENUE_SEG1, CARVE_IN_DEF_REVENUE_SEG3, CARVE_IN_DEF_REVENUE_SEG4, 
		 UNBILLED_AR_SEG1, UNBILLED_AR_SEG3, UNBILLED_AR_SEG4, 
		 CARVE_IN_REVENUE_SEG1, CARVE_IN_REVENUE_SEG3, CARVE_IN_REVENUE_SEG4,
		 CARVE_OUT_REVENUE_SEG1, CARVE_OUT_REVENUE_SEG3, CARVE_OUT_REVENUE_SEG4, 
		 ATTRIBUTE26, ATTRIBUTE27,
         DEF_ACCTG_SEG1, DEF_ACCTG_SEG3, DEF_ACCTG_SEG4,
		 ITEM_NUMBER,	
		 QUANTITY_INVOICED,
         REV_ACCTG_SEG1, REV_ACCTG_SEG3, REV_ACCTG_SEG4,
		 RULE_END_DATE,RULE_START_DATE,
		 INV.Sales_Order, SALES_ORDER_ID, SALES_ORDER_LINE_ID,
         CARVE_IN_DEF_REVENUE_SEG5, UNBILLED_AR_SEG5, CARVE_IN_REVENUE_SEG5, CARVE_OUT_REVENUE_SEG5, DEF_ACCTG_SEG5, REV_ACCTG_SEG5, LT_DEFERRED_ACCOUNT_SEG5,
         ATTRIBUTE28, NUMBER5,
	     DW_Fl, RPro_Fl, Created_By, Last_Updated_By
--

SET @Begin_Count = @Begin_Count + @Increment
SET @End_Count = @End_Count + @Increment


END
GO
