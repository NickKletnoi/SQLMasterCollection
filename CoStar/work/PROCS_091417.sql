USE [CoStar]
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateMarketSkuNational]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspUpdateMarketSkuNational]
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateMarketSku]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspUpdateMarketSku]
GO
/****** Object:  StoredProcedure [dbo].[uspUPDATE_SkuName_MarketNameLong]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspUPDATE_SkuName_MarketNameLong]
GO
/****** Object:  StoredProcedure [dbo].[uspSKUbold]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspSKUbold]
GO
/****** Object:  StoredProcedure [dbo].[uspSKUb1]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspSKUb1]
GO
/****** Object:  StoredProcedure [dbo].[uspSKUb]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspSKUb]
GO
/****** Object:  StoredProcedure [dbo].[uspSKU_AVG_PRICE]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspSKU_AVG_PRICE]
GO
/****** Object:  StoredProcedure [dbo].[uspSKU]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspSKU]
GO
/****** Object:  StoredProcedure [dbo].[uspRULE_updates]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspRULE_updates]
GO
/****** Object:  StoredProcedure [dbo].[uspProcessContracts]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspProcessContracts]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_Vendor]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspLOAD_Vendor]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_PO]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspLOAD_PO]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_LineItemAppts2]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspLOAD_LineItemAppts2]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_LineItemAppts]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspLOAD_LineItemAppts]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_LineItem]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspLOAD_LineItem]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_InvoiceDetail]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspLOAD_InvoiceDetail]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_F_Navision]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspLOAD_F_Navision]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_F_Enterprise]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspLOAD_F_Enterprise]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_D_Market]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspLOAD_D_Market]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_ContractMarket]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspLOAD_ContractMarket]
GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_TempBundleID]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspCREATE_TempBundleID]
GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_StubAmountAdj]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspCREATE_StubAmountAdj]
GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_SkuName1]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspCREATE_SkuName1]
GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_SkuName]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspCREATE_SkuName]
GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_Reps]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspCREATE_Reps]
GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_PERIOD]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspCREATE_PERIOD]
GO
/****** Object:  StoredProcedure [dbo].[uspCreate_NAVMarket]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspCreate_NAVMarket]
GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_FACT_PERIODS_ENT]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspCREATE_FACT_PERIODS_ENT]
GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_CreditMemoAmount]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[uspCREATE_CreditMemoAmount]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_byMRKT]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[usp_CreateReportForLegal_byMRKT]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_byHQ3]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[usp_CreateReportForLegal_byHQ3]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_byHQ2]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[usp_CreateReportForLegal_byHQ2]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_byHQ_V01]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[usp_CreateReportForLegal_byHQ_V01]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_byHQ]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[usp_CreateReportForLegal_byHQ]
GO
/****** Object:  StoredProcedure [dbo].[usp_CREATE_RuleBridge]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[usp_CREATE_RuleBridge]
GO
/****** Object:  StoredProcedure [dbo].[Load_Mapping_Table_for_HQ]    Script Date: 9/14/2017 9:43:21 AM ******/
DROP PROCEDURE [dbo].[Load_Mapping_Table_for_HQ]
GO
/****** Object:  StoredProcedure [dbo].[Load_Mapping_Table_for_HQ]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_Mapping_Table_for_HQ]
AS
 --- variable declaration section----------------
 DECLARE @insert_sql_head VARCHAR (max)='INSERT [dbo].[NewHQMatchName2] ([BillingLocID],[NewHQID],[HQName]) SELECT ' 
 DECLARE @select_sql_stmt VARCHAR(max) =''
 DECLARE @insert_sql_final VARCHAR(max)
 DECLARE @hq_name_long VARCHAR(max)
 DECLARE @hq_name_short VARCHAR(max)
 DECLARE @hq_cust_num VARCHAR(max)
 

 DECLARE @CURRENT_CONTRACTID INT
 DECLARE @CURRENT_CLN VARCHAR(150)
 DECLARE @CURRENT_CSN VARCHAR(150)
 DECLARE @CURRENT_CN VARCHAR(150)

 DECLARE C CURSOR FOR
 select  [HQCustomerNameLong],[HQCustomerNameShort],[HQCustomerNumber] from [dbo].[NewHQMatchName3]
 
  
 OPEN C
 FETCH c into @CURRENT_CLN,@CURRENT_CSN,@CURRENT_CN
 WHILE @@FETCH_STATUS = 0
 BEGIN
   SET @select_sql_stmt = @insert_sql_head + ' CustomerParentID, ' + @CURRENT_CN + ', ''' + @CURRENT_CLN + ''' FROM [dbo].[TempApts1] WHERE CustomerHQ like ''%' + @CURRENT_CSN +'%'';'
   --PRINT @select_sql_stmt
   EXEC (@select_sql_stmt)
FETCH c into @CURRENT_CLN,@CURRENT_CSN,@CURRENT_CN
 END

 CLOSE C
 DEALLOCATE C

GO
/****** Object:  StoredProcedure [dbo].[usp_CREATE_RuleBridge]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CREATE_RuleBridge]
AS
SELECT  DISTINCT

     [Document No_] as InvoiceNumber,   

        CAST(
              CASE WHEN ISDATE(SUBSTRING(SIL.[Description 3],1,10)) = 1 THEN SUBSTRING(SIL.[Description 3],1,10) 
                     WHEN ISDATE(SUBSTRING(SIL.[Description 3],1,8)) = 1 THEN SUBSTRING(SIL.[Description 3],1,8) 
              ELSE CAST(MONTH(SIL.[Posting Date]) AS VARCHAR(2)) + '/01/' + CAST(YEAR(SIL.[Posting Date]) AS VARCHAR(4)) 
              END AS DATETIME
         )          AS RULE_START_DATE,


 CAST(
              CASE WHEN ISDATE(SUBSTRING(SIL.[Description 3],15,10)) = 1 THEN SUBSTRING(SIL.[Description 3],15,10) 
              WHEN ISDATE(SUBSTRING(SIL.[Description 3],13,8)) = 1 THEN SUBSTRING(SIL.[Description 3],13,8) 
              ELSE CONVERT(VARCHAR(12),DATEADD(DAY,-DAY(DATEADD(MONTH,1,SIL.[Posting Date])), DATEADD(MONTH,1,SIL.[Posting Date])), 101) 
              END AS DATETIME
               --)        
         )          AS RULE_END_DATE,
CAST(SIL.Quantity AS INT) as TermInMonths
INTO dbo.RuleBridge		  
from  [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] SIL
WHERE [Description 3]<>'' and [Document No_] IN (select [InvoiceNumber] from [dbo].[InvoiceBridge])
----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
alter table [dbo].[RuleBridge] add RuleYearMonth char(6) null;
------------

update RB
  set RB.[RuleYearMonth]=
  CAST(YEAR(RB.RULE_START_DATE) as char(4))+
CASE CAST(MONTH(RB.RULE_START_DATE) as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
				   WHEN '3' THEN '03'
				   WHEN '4' THEN '04'
				   WHEN '5' THEN '05'
				   WHEN '6' THEN '06'
				   WHEN '7' THEN '07'
				   WHEN '8' THEN '08'
				   WHEN '9' THEN '09'
ELSE CAST(MONTH(RB.RULE_START_DATE) as char(2)) END
FROM [dbo].[RuleBridge] RB where RB.TermInMonths=1


GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_byHQ]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC [dbo].[usp_CreateReportForLegal_byHQ]


CREATE proc [dbo].[usp_CreateReportForLegal_byHQ]
AS

IF OBJECT_ID('tempdb..TempApts1', 'U') IS NOT NULL DROP TABLE tempdb..TempApts1;
IF OBJECT_ID('tempdb..TempApts2', 'U') IS NOT NULL DROP TABLE tempdb..TempApts2;
IF OBJECT_ID('dbo.RevenuRptLegal2', 'U') IS NOT NULL DROP TABLE dbo.RevenuRptLegal2;

SELECT 
CustomerName as CustomerHQ ,  
CustomerID as CustomerNumber,
ParentCompanyLocID as CustomerParentID,
ParentCompanyName as CustomerParentName,
[201601] as '2016-JAN', 
[201602] as '2016-FEB', 
[201603] as '2016-MAR',
[201604] as '2016-APR',
[201605] AS '2016-MAY',
[201606] as '2016-JUN', 
[201607] as '2016-JUL', 
[201608] as '2016-AUG',
[201609] as '2016-SEPT',
[201610] AS '2016-OCT', 
[201611] as '2016-NOV',
[201612] AS '2016-DEC' 
INTO #TempApts1
FROM   
(SELECT
CONVERT(money,IL.[Amount]) as InvoicedAmount,
CAST(YEAR(IL.[Posting Date]) as char(4))+
CASE CAST(MONTH(IL.[Posting Date]) as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
                                WHEN '3' THEN '03'
                                WHEN '4' THEN '04'
                                WHEN '5' THEN '05'
                                WHEN '6' THEN '06'
                                WHEN '7' THEN '07'
                                WHEN '8' THEN '08'
                                WHEN '9' THEN '09'
ELSE CAST(MONTH(IL.[Posting Date]) as char(2)) END AS YearMonth , 
CASE WHEN (IL.CustomerAccountName='') THEN (IH.[Bill-to Name]) ELSE (IL.CustomerAccountName) END AS CustomerName,
CASE WHEN (IL.CustomerAccountCode='') THEN (IL.[Bill-to Customer No_]) ELSE (IL.CustomerAccountCode) END AS CustomerID,
--COALESCE(IL.CustomerAccountName,IH.[Bill-to Name]) as CustomerName,
--COALESCE(IL.CustomerAccountCode,IL.[Bill-to Customer No_]) as CustomerID,
IL.[Bill-to Customer No_] as [ParentCompanyLocID],
IH.[Bill-to Name] as [ParentCompanyName]
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] IL INNER JOIN 
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Header] IH ON 
IL.[Document No_] = IH.No_
  WHERE [Business Unit Code] IN

(
'AFPLUS',
'APTSDIAMON',
'APTSGOLDA',
'AFPRO',
'APTSDIAMDA',
'APTSMYMED',
'APTSPLATIN',
'APTSPLATNA',
'AFPAK',
'APTSGOLD',
'APTSSILVER',
'APTSSILVRA',
'AFPROODD',
'APTSPHTRTK'
)

--  ('AFPAK','AFPLUS','AFPRO','AFPROODD','APN','APT','APT001','APT002','APT003', 
--'APT004','APT005','APTSDIAMDA','APTSDIAMON','APTSGOLD','APTSGOLDA','APTSMYMEA','APTSMYMED',
--'APTSPHTRTK','APTSPLATIN','APTSPLATNA','APTSSILVER','APTSSILVRA','APTSVDRSHT')

) p  
PIVOT  
(  
SUM(InvoicedAmount)  
FOR YearMonth IN 
( 
  [201601],[201602],[201603],
  [201604],[201605],[201606],
  [201607],[201608],[201609],
  [201610],[201611], [201612] 
 
  )  
) AS pvt  
ORDER BY pvt.CustomerName;  
-----------------------------------------------------------------

update T 
SET T.CustomerHQ=N.HQName
--, 
--T.CustomerNumber=N.NewHQID
from #TempApts1 T JOIN [dbo].[NewHQMatchName] N 
ON CAST(T.CustomerParentID AS VARCHAR(25))=CAST(N.BillingLocID AS VARCHAR(25))

-----------------------------------------------------------------

SELECT 
CustomerHQ,
SUM([2016-JAN]) AS JAN_2016,
SUM([2016-FEB]) AS FEB_2016,
SUM([2016-MAR]) AS MAR_2016,
SUM([2016-APR]) AS APR_2016,
SUM([2016-MAY]) AS MAY_2016,
SUM([2016-JUN]) AS JUN_2016,
SUM([2016-JUL]) AS JUL_2016,
SUM([2016-AUG]) AS AUG_2016,
SUM([2016-SEPT]) AS SEPT_2016,
SUM([2016-OCT]) AS OCT_2016,
SUM([2016-NOV]) AS NOV_2016,
SUM([2016-DEC]) AS DEC_2016,
ISNULL(SUM([2016-JAN]),0)+ ISNULL(SUM([2016-FEB]),0)+ISNULL(SUM([2016-MAR]),0)+ISNULL(SUM([2016-APR]),0)+ISNULL(SUM([2016-MAY]),0)+ISNULL(SUM([2016-JUN]),0)+ISNULL(SUM([2016-JUL]),0)+ISNULL(SUM([2016-AUG]),0)+ISNULL(SUM([2016-SEPT]),0)+ISNULL(SUM([2016-OCT]),0)+ISNULL(SUM([2016-NOV]),0)+ISNULL(SUM([2016-DEC]),0) AS TOTAL
INTO #TempApts2
FROM #TempApts1 
GROUP by CustomerHQ;
--------------------------------------------------------

SELECT 
CustomerHQ,
[JAN_2016],
[FEB_2016],
[MAR_2016],
[APR_2016],
[MAY_2016],
[JUN_2016],
[JUL_2016],
[AUG_2016],
[SEPT_2016],
[OCT_2016],
[NOV_2016],
[DEC_2016],
TOTAL
INTO RevenuRptLegal2
FROM #TempApts2 
WHERE TOTAL>0
ORDER BY TOTAL;




GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_byHQ_V01]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC [dbo].[usp_CreateReportForLegal_byHQ_V01]


CREATE proc [dbo].[usp_CreateReportForLegal_byHQ_V01]
AS

IF OBJECT_ID('dbo.TempApts1', 'U') IS NOT NULL DROP TABLE dbo.TempApts1;
IF OBJECT_ID('dbo.TempApts2', 'U') IS NOT NULL DROP TABLE dbo.TempApts2;
IF OBJECT_ID('dbo.RevenuRptLegal2', 'U') IS NOT NULL DROP TABLE dbo.RevenuRptLegal2;

SELECT 
CustomerName as CustomerHQ ,  
CustomerID as CustomerNumber,
ParentCompanyLocID as CustomerParentID,
ParentCompanyName as CustomerParentName,
[201601] as '2016-JAN', 
[201602] as '2016-FEB', 
[201603] as '2016-MAR',
[201604] as '2016-APR',
[201605] AS '2016-MAY',
[201606] as '2016-JUN', 
[201607] as '2016-JUL', 
[201608] as '2016-AUG',
[201609] as '2016-SEPT',
[201610] AS '2016-OCT', 
[201611] as '2016-NOV',
[201612] AS '2016-DEC' 
INTO dbo.TempApts1
FROM   
(SELECT
CONVERT(money,IL.[Amount]) as InvoicedAmount,
CAST(YEAR(IL.[Posting Date]) as char(4))+
CASE CAST(MONTH(IL.[Posting Date]) as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
                                WHEN '3' THEN '03'
                                WHEN '4' THEN '04'
                                WHEN '5' THEN '05'
                                WHEN '6' THEN '06'
                                WHEN '7' THEN '07'
                                WHEN '8' THEN '08'
                                WHEN '9' THEN '09'
ELSE CAST(MONTH(IL.[Posting Date]) as char(2)) END AS YearMonth , 
CASE WHEN (IL.CustomerAccountName='') THEN (IH.[Bill-to Name]) ELSE (IL.CustomerAccountName) END AS CustomerName,
CASE WHEN (IL.CustomerAccountCode='') THEN (IL.[Bill-to Customer No_]) ELSE (IL.CustomerAccountCode) END AS CustomerID,
--COALESCE(IL.CustomerAccountName,IH.[Bill-to Name]) as CustomerName,
--COALESCE(IL.CustomerAccountCode,IL.[Bill-to Customer No_]) as CustomerID,
IL.[Bill-to Customer No_] as [ParentCompanyLocID],
IH.[Bill-to Name] as [ParentCompanyName]
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] IL INNER JOIN 
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Header] IH ON 
IL.[Document No_] = IH.No_
  WHERE [Business Unit Code] IN

(
'AFPLUS',
'APTSDIAMON',
'APTSGOLDA',
'AFPRO',
'APTSDIAMDA',
'APTSMYMED',
'APTSPLATIN',
'APTSPLATNA',
'AFPAK',
'APTSGOLD',
'APTSSILVER',
'APTSSILVRA',
'AFPROODD',
'APTSPHTRTK'
)

--  ('AFPAK','AFPLUS','AFPRO','AFPROODD','APN','APT','APT001','APT002','APT003', 
--'APT004','APT005','APTSDIAMDA','APTSDIAMON','APTSGOLD','APTSGOLDA','APTSMYMEA','APTSMYMED',
--'APTSPHTRTK','APTSPLATIN','APTSPLATNA','APTSSILVER','APTSSILVRA','APTSVDRSHT')

) p  
PIVOT  
(  
SUM(InvoicedAmount)  
FOR YearMonth IN 
( 
  [201601],[201602],[201603],
  [201604],[201605],[201606],
  [201607],[201608],[201609],
  [201610],[201611], [201612] 
 
  )  
) AS pvt  
ORDER BY pvt.CustomerName;  
------------------------------------------------------------------------------
update T 
SET T.CustomerHQ=N.HQName
from dbo.TempApts1 T JOIN [dbo].[NewHQMatchName] N 
ON CAST(T.CustomerParentID AS VARCHAR(25))=CAST(N.BillingLocID AS VARCHAR(25))
-----------------------------------------------------------------------------

SELECT 
CustomerHQ,
SUM([2016-JAN]) AS JAN_2016,
SUM([2016-FEB]) AS FEB_2016,
SUM([2016-MAR]) AS MAR_2016,
SUM([2016-APR]) AS APR_2016,
SUM([2016-MAY]) AS MAY_2016,
SUM([2016-JUN]) AS JUN_2016,
SUM([2016-JUL]) AS JUL_2016,
SUM([2016-AUG]) AS AUG_2016,
SUM([2016-SEPT]) AS SEPT_2016,
SUM([2016-OCT]) AS OCT_2016,
SUM([2016-NOV]) AS NOV_2016,
SUM([2016-DEC]) AS DEC_2016,
ISNULL(SUM([2016-JAN]),0)+ ISNULL(SUM([2016-FEB]),0)+ISNULL(SUM([2016-MAR]),0)+ISNULL(SUM([2016-APR]),0)+ISNULL(SUM([2016-MAY]),0)+ISNULL(SUM([2016-JUN]),0)+ISNULL(SUM([2016-JUL]),0)+ISNULL(SUM([2016-AUG]),0)+ISNULL(SUM([2016-SEPT]),0)+ISNULL(SUM([2016-OCT]),0)+ISNULL(SUM([2016-NOV]),0)+ISNULL(SUM([2016-DEC]),0) AS TOTAL
INTO dbo.TempApts2
FROM dbo.TempApts1 
GROUP by CustomerHQ;
--------------------------------------------------------

SELECT 
CustomerHQ,
[JAN_2016],
[FEB_2016],
[MAR_2016],
[APR_2016],
[MAY_2016],
[JUN_2016],
[JUL_2016],
[AUG_2016],
[SEPT_2016],
[OCT_2016],
[NOV_2016],
[DEC_2016],
TOTAL
INTO RevenuRptLegal2
FROM dbo.TempApts2 
WHERE TOTAL>0
ORDER BY TOTAL;




GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_byHQ2]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC [dbo].[usp_CreateReportForLegal_byHQ2]


CREATE proc [dbo].[usp_CreateReportForLegal_byHQ2]
AS

IF OBJECT_ID('tempdb..TempApts1', 'U') IS NOT NULL DROP TABLE tempdb..TempApts1;
IF OBJECT_ID('tempdb..TempApts2', 'U') IS NOT NULL DROP TABLE tempdb..TempApts2;
IF OBJECT_ID('dbo.RevenuRptLegal2', 'U') IS NOT NULL DROP TABLE dbo.RevenuRptLegal2;

SELECT 
CustomerName as CustomerHQ ,  
CustomerID as CustomerNumber,
ParentCompanyLocID as CustomerParentID,
ParentCompanyName as CustomerParentName,
[201601] as '2016-JAN', 
[201602] as '2016-FEB', 
[201603] as '2016-MAR',
[201604] as '2016-APR',
[201605] AS '2016-MAY',
[201606] as '2016-JUN', 
[201607] as '2016-JUL', 
[201608] as '2016-AUG',
[201609] as '2016-SEPT',
[201610] AS '2016-OCT', 
[201611] as '2016-NOV',
[201612] AS '2016-DEC' 
INTO #TempApts1
FROM   
(SELECT
CONVERT(money,IL.[Amount]) as InvoicedAmount,
CAST(YEAR(IL.[Posting Date]) as char(4))+
CASE CAST(MONTH(IL.[Posting Date]) as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
                                WHEN '3' THEN '03'
                                WHEN '4' THEN '04'
                                WHEN '5' THEN '05'
                                WHEN '6' THEN '06'
                                WHEN '7' THEN '07'
                                WHEN '8' THEN '08'
                                WHEN '9' THEN '09'
ELSE CAST(MONTH(IL.[Posting Date]) as char(2)) END AS YearMonth , 
CASE WHEN (IL.CustomerAccountName='') THEN (COALESCE(HQM.[HQName],IH.[Bill-to Name])) ELSE (COALESCE(HQM.[HQName],IL.CustomerAccountName)) END AS CustomerName,
CASE WHEN (IL.CustomerAccountCode='') THEN (COALESCE(
CAST(HQM.[NewHQID] AS VARCHAR(25))
,
CAST(IL.[Bill-to Customer No_] AS VARCHAR(25))

)) ELSE (COALESCE(

CAST(HQM.[NewHQID] AS VARCHAR(25))

,
CAST(IL.CustomerAccountCode AS VARCHAR(25))

)) END AS CustomerID,
--COALESCE(IL.CustomerAccountName,IH.[Bill-to Name]) as CustomerName,
--COALESCE(IL.CustomerAccountCode,IL.[Bill-to Customer No_]) as CustomerID,
IL.[Bill-to Customer No_] as [ParentCompanyLocID],
IH.[Bill-to Name] as [ParentCompanyName]
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] IL INNER JOIN 
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Header] IH ON 
IL.[Document No_] = IH.No_ LEFT JOIN [dbo].[NewHQMatchName] HQM ON
IL.[Bill-to Customer No_]=HQM.[BillingLocID]

  WHERE [Business Unit Code] IN

(
'AFPLUS',
'APTSDIAMON',
'APTSGOLDA',
'AFPRO',
'APTSDIAMDA',
'APTSMYMED',
'APTSPLATIN',
'APTSPLATNA',
'AFPAK',
'APTSGOLD',
'APTSSILVER',
'APTSSILVRA',
'AFPROODD',
'APTSPHTRTK'
)
AND HQM.[HQName] IS NOT NULL
--  ('AFPAK','AFPLUS','AFPRO','AFPROODD','APN','APT','APT001','APT002','APT003', 
--'APT004','APT005','APTSDIAMDA','APTSDIAMON','APTSGOLD','APTSGOLDA','APTSMYMEA','APTSMYMED',
--'APTSPHTRTK','APTSPLATIN','APTSPLATNA','APTSSILVER','APTSSILVRA','APTSVDRSHT')

) p  
PIVOT  
(  
SUM(InvoicedAmount)  
FOR YearMonth IN 
( 
  [201601],[201602],[201603],
  [201604],[201605],[201606],
  [201607],[201608],[201609],
  [201610],[201611], [201612] 
 
  )  
) AS pvt  
ORDER BY pvt.CustomerName;  
-----------------------------------------------------------------

SELECT 
CustomerHQ,
SUM([2016-JAN]) AS JAN_2016,
SUM([2016-FEB]) AS FEB_2016,
SUM([2016-MAR]) AS MAR_2016,
SUM([2016-APR]) AS APR_2016,
SUM([2016-MAY]) AS MAY_2016,
SUM([2016-JUN]) AS JUN_2016,
SUM([2016-JUL]) AS JUL_2016,
SUM([2016-AUG]) AS AUG_2016,
SUM([2016-SEPT]) AS SEPT_2016,
SUM([2016-OCT]) AS OCT_2016,
SUM([2016-NOV]) AS NOV_2016,
SUM([2016-DEC]) AS DEC_2016,
ISNULL(SUM([2016-JAN]),0)+ ISNULL(SUM([2016-FEB]),0)+ISNULL(SUM([2016-MAR]),0)+ISNULL(SUM([2016-APR]),0)+ISNULL(SUM([2016-MAY]),0)+ISNULL(SUM([2016-JUN]),0)+ISNULL(SUM([2016-JUL]),0)+ISNULL(SUM([2016-AUG]),0)+ISNULL(SUM([2016-SEPT]),0)+ISNULL(SUM([2016-OCT]),0)+ISNULL(SUM([2016-NOV]),0)+ISNULL(SUM([2016-DEC]),0) AS TOTAL
INTO #TempApts2
FROM #TempApts1 
GROUP by CustomerHQ;
--------------------------------------------------------

SELECT 
CustomerHQ,
[JAN_2016],
[FEB_2016],
[MAR_2016],
[APR_2016],
[MAY_2016],
[JUN_2016],
[JUL_2016],
[AUG_2016],
[SEPT_2016],
[OCT_2016],
[NOV_2016],
[DEC_2016],
TOTAL
INTO RevenuRptLegal2
FROM #TempApts2 
WHERE TOTAL>0
ORDER BY TOTAL;




GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_byHQ3]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[usp_CreateReportForLegal_byHQ3]
AS

IF OBJECT_ID('tempdb..TempApts1', 'U') IS NOT NULL DROP TABLE tempdb..TempApts1;
IF OBJECT_ID('tempdb..TempApts2', 'U') IS NOT NULL DROP TABLE tempdb..TempApts2;
IF OBJECT_ID('dbo.RevenuRptLegal2', 'U') IS NOT NULL DROP TABLE dbo.RevenuRptLegal2;

SELECT 
CustomerName as CustomerHQ ,  
CustomerID as CustomerNumber,
ParentCompanyLocID as CustomerParentID,
ParentCompanyName as CustomerParentName,
NewCustomerName as NewCustomerName,
[201601] as '2016-JAN', 
[201602] as '2016-FEB', 
[201603] as '2016-MAR',
[201604] as '2016-APR',
[201605] AS '2016-MAY',
[201606] as '2016-JUN', 
[201607] as '2016-JUL', 
[201608] as '2016-AUG',
[201609] as '2016-SEPT',
[201610] AS '2016-OCT', 
[201611] as '2016-NOV',
[201612] AS '2016-DEC' 
INTO #TempApts1
FROM   
(SELECT
CONVERT(money,IL.[Amount]) as InvoicedAmount,
CAST(YEAR(IL.[Posting Date]) as char(4))+
CASE CAST(MONTH(IL.[Posting Date]) as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
                                WHEN '3' THEN '03'
                                WHEN '4' THEN '04'
                                WHEN '5' THEN '05'
                                WHEN '6' THEN '06'
                                WHEN '7' THEN '07'
                                WHEN '8' THEN '08'
                                WHEN '9' THEN '09'
ELSE CAST(MONTH(IL.[Posting Date]) as char(2)) END AS YearMonth , 
CASE WHEN (IL.CustomerAccountName='') THEN (IH.[Bill-to Name]) ELSE (IL.CustomerAccountName) END AS CustomerName,
HQM.[HQName] AS NewCustomerName,
CASE WHEN (IL.CustomerAccountCode='') THEN (IL.[Bill-to Customer No_]) ELSE (IL.CustomerAccountCode) END AS CustomerID,
--COALESCE(IL.CustomerAccountName,IH.[Bill-to Name]) as CustomerName,
--COALESCE(IL.CustomerAccountCode,IL.[Bill-to Customer No_]) as CustomerID,
IL.[Bill-to Customer No_] as [ParentCompanyLocID],
IH.[Bill-to Name] as [ParentCompanyName]
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] IL INNER JOIN 
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Header] IH ON 
IL.[Document No_] = IH.No_ 
JOIN [dbo].[NewHQMatchName] HQM ON 
CAST(IL.[Bill-to Customer No_] AS VARCHAR(25))=CAST(HQM.[BillingLocID] AS VARCHAR(25))
  WHERE [Business Unit Code] IN

(
'AFPLUS',
'APTSDIAMON',
'APTSGOLDA',
'AFPRO',
'APTSDIAMDA',
'APTSMYMED',
'APTSPLATIN',
'APTSPLATNA',
'AFPAK',
'APTSGOLD',
'APTSSILVER',
'APTSSILVRA',
'AFPROODD',
'APTSPHTRTK'
)
--AND IL.CustomerAccountName<>HQM.[HQName]
--  ('AFPAK','AFPLUS','AFPRO','AFPROODD','APN','APT','APT001','APT002','APT003', 
--'APT004','APT005','APTSDIAMDA','APTSDIAMON','APTSGOLD','APTSGOLDA','APTSMYMEA','APTSMYMED',
--'APTSPHTRTK','APTSPLATIN','APTSPLATNA','APTSSILVER','APTSSILVRA','APTSVDRSHT')

) p  
PIVOT  
(  
SUM(InvoicedAmount)  
FOR YearMonth IN 
( 
  [201601],[201602],[201603],
  [201604],[201605],[201606],
  [201607],[201608],[201609],
  [201610],[201611], [201612] 
 
  )  
) AS pvt  
ORDER BY pvt.NewCustomerName;  
-----------------------------------------------------------------

SELECT 
NewCustomerName,
SUM([2016-JAN]) AS JAN_2016,
SUM([2016-FEB]) AS FEB_2016,
SUM([2016-MAR]) AS MAR_2016,
SUM([2016-APR]) AS APR_2016,
SUM([2016-MAY]) AS MAY_2016,
SUM([2016-JUN]) AS JUN_2016,
SUM([2016-JUL]) AS JUL_2016,
SUM([2016-AUG]) AS AUG_2016,
SUM([2016-SEPT]) AS SEPT_2016,
SUM([2016-OCT]) AS OCT_2016,
SUM([2016-NOV]) AS NOV_2016,
SUM([2016-DEC]) AS DEC_2016,
ISNULL(SUM([2016-JAN]),0)+ ISNULL(SUM([2016-FEB]),0)+ISNULL(SUM([2016-MAR]),0)+ISNULL(SUM([2016-APR]),0)+ISNULL(SUM([2016-MAY]),0)+ISNULL(SUM([2016-JUN]),0)+ISNULL(SUM([2016-JUL]),0)+ISNULL(SUM([2016-AUG]),0)+ISNULL(SUM([2016-SEPT]),0)+ISNULL(SUM([2016-OCT]),0)+ISNULL(SUM([2016-NOV]),0)+ISNULL(SUM([2016-DEC]),0) AS TOTAL
INTO #TempApts2
FROM #TempApts1 
GROUP by NewCustomerName;
--------------------------------------------------------

SELECT 
CustomerHQ,
[JAN_2016],
[FEB_2016],
[MAR_2016],
[APR_2016],
[MAY_2016],
[JUN_2016],
[JUL_2016],
[AUG_2016],
[SEPT_2016],
[OCT_2016],
[NOV_2016],
[DEC_2016],
TOTAL
INTO RevenuRptLegal2
FROM #TempApts2 
WHERE TOTAL>0
ORDER BY TOTAL;




GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_byMRKT]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
EXEC [dbo].[usp_CreateReportForLegal_byMRKT]
*/


CREATE proc [dbo].[usp_CreateReportForLegal_byMRKT]
AS

IF OBJECT_ID('tempdb..TempApts1', 'U') IS NOT NULL DROP TABLE tempdb..TempApts1;
IF OBJECT_ID('tempdb..TempApts2', 'U') IS NOT NULL DROP TABLE tempdb..TempApts2;
IF OBJECT_ID('dbo.RevenueRptMrkt', 'U') IS NOT NULL DROP TABLE dbo.RevenueRptMrkt;

SELECT 
CustomerName as CustomerHQ ,  
CustomerID as CustomerNumber,
Zip as Zip,
ParentCompanyLocID as CustomerParentID,
ParentCompanyName as CustomerParentName,
[201601] as '2016-JAN', 
[201602] as '2016-FEB', 
[201603] as '2016-MAR',
[201604] as '2016-APR',
[201605] AS '2016-MAY',
[201606] as '2016-JUN', 
[201607] as '2016-JUL', 
[201608] as '2016-AUG',
[201609] as '2016-SEPT',
[201610] AS '2016-OCT', 
[201611] as '2016-NOV',
[201612] AS '2016-DEC' 
INTO #TempApts1
FROM   
(SELECT
convert(money,IL.[Amount]) as InvoicedAmount,
CAST(YEAR(IL.[Posting Date]) as char(4))+
CASE CAST(MONTH(IL.[Posting Date]) as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
                                WHEN '3' THEN '03'
                                WHEN '4' THEN '04'
                                WHEN '5' THEN '05'
                                WHEN '6' THEN '06'
                                WHEN '7' THEN '07'
                                WHEN '8' THEN '08'
                                WHEN '9' THEN '09'
ELSE CAST(MONTH(IL.[Posting Date]) as char(2)) END AS YearMonth , 
IL.CustomerAccountName as CustomerName,
IL.CustomerAccountCode as CustomerID,
IL.[Site Zip Code] as Zip,
--IL.[Site City] as MarketName,
IL.[Bill-to Customer No_] as [ParentCompanyLocID],
IH.[Bill-to Name] as [ParentCompanyName]
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] IL INNER JOIN 
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Header] IH ON 
IL.[Document No_] = IH.No_ 
--LEFT JOIN [DCSQLPRD104].[EnterpriseSub].dbo.[Address] A ON IL.[Site Zip Code]=A.Zip LEFT JOIN 
--[DCSQLPRD104].[EnterpriseSub].dbo.ResearchMarket RM ON A.ResearchMarketID=RM.ResearchMarketID
  WHERE [Business Unit Code] IN
  ('AFPAK','AFPLUS','AFPRO','AFPROODD','APN','APT','APT001','APT002','APT003', 
'APT004','APT005','APTSDIAMDA','APTSDIAMON','APTSGOLD','APTSGOLDA','APTSMYMEA','APTSMYMED',
'APTSPLATIN','APTSPLATNA','APTSSILVER','APTSSILVRA','APTSVDRSHT')
) p  
PIVOT  
(  
SUM(InvoicedAmount)  
FOR YearMonth IN 
( 
  [201601],[201602],[201603],
  [201604],[201605],[201606],
  [201607],[201608],[201609],
  [201610],[201611], [201612] 
 
  )  
) AS pvt  
ORDER BY pvt.CustomerName;  
-----------------------------------------------------------------

SELECT 
Zip,
SUM([2016-JAN]) AS JAN_2016,
SUM([2016-FEB]) AS FEB_2016,
SUM([2016-MAR]) AS MAR_2016,
SUM([2016-APR]) AS APR_2016,
SUM([2016-MAY]) AS MAY_2016,
SUM([2016-JUN]) AS JUN_2016,
SUM([2016-JUL]) AS JUL_2016,
SUM([2016-AUG]) AS AUG_2016,
SUM([2016-SEPT]) AS SEPT_2016,
SUM([2016-OCT]) AS OCT_2016,
SUM([2016-NOV]) AS NOV_2016,
SUM([2016-DEC]) AS DEC_2016,
ISNULL(SUM([2016-JAN]),0)+ ISNULL(SUM([2016-FEB]),0)+ISNULL(SUM([2016-MAR]),0)+ISNULL(SUM([2016-APR]),0)+ISNULL(SUM([2016-MAY]),0)+ISNULL(SUM([2016-JUN]),0)+ISNULL(SUM([2016-JUL]),0)+ISNULL(SUM([2016-AUG]),0)+ISNULL(SUM([2016-SEPT]),0)+ISNULL(SUM([2016-OCT]),0)+ISNULL(SUM([2016-NOV]),0)+ISNULL(SUM([2016-DEC]),0) AS TOTAL
INTO #TempApts2
FROM #TempApts1 
GROUP by Zip;
--------------------------------------------------------

SELECT 
Zip,
[JAN_2016],
[FEB_2016],
[MAR_2016],
[APR_2016],
[MAY_2016],
[JUN_2016],
[JUL_2016],
[AUG_2016],
[SEPT_2016],
[OCT_2016],
[NOV_2016],
[DEC_2016],
TOTAL
INTO RevenueRptMrkt
FROM #TempApts2 
WHERE TOTAL>0
ORDER BY TOTAL DESC;

select 
      ZRM.ResearchMarketName
      ,SUM([JAN_2016]) [JAN_2016]
      ,SUM([FEB_2016]) [FEB_2016]
      ,SUM([MAR_2016]) [MAR_2016]
      ,SUM([APR_2016]) [APR_2016]
      ,SUM([MAY_2016]) [MAY_2016]
      ,SUM([JUN_2016]) [JUN_2016]
      ,SUM([JUL_2016]) [JUL_2016]
      ,SUM([AUG_2016]) [AUG_2016]
      ,SUM([SEPT_2016]) [SEPT_2016]
      ,SUM([OCT_2016]) [OCT_2016]
      ,SUM([NOV_2016]) [NOV_2016]
      ,SUM([DEC_2016]) [DEC_2016]
      ,SUM([TOTAL]) [TOTAL]
from [dbo].[RevenueRptMrkt] RM JOIN [dbo].[ZipResearchMarket] ZRM ON RM.Zip=ZRM.Zip
GROUP BY  ZRM.ResearchMarketName
ORDER BY [TOTAL] DESC 


GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_CreditMemoAmount]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[uspCREATE_CreditMemoAmount]
as
select
[Line Item ID] as LineItemID,
[Amount] as CreditMemoAmount, 

--CAST
--	      (
--	       CASE WHEN ISDATE(SUBSTRING(SIL.[Description 3],15,10)) = 1 THEN SUBSTRING(SIL.[Description 3],15,10) 
--	       WHEN ISDATE(SUBSTRING(SIL.[Description 3],13,8)) = 1 THEN SUBSTRING(SIL.[Description 3],13,8) 
--	       ELSE DATEADD(MONTH, CASE WHEN SIL.Quantity > 1 THEN SIL.Quantity - 1 ELSE 0 END, CONVERT(VARCHAR(12),DATEADD(DAY,-DAY(DATEADD(MONTH,1,SIL.[Posting Date])), DATEADD(MONTH,1,SIL.[Posting Date])), 101) 
--		   )
--	  END AS DATETIME
--	      )		AS RULE_END_DATE,

	  CAST(
	       CASE WHEN ISDATE(SUBSTRING(SIL.[Description 3],1,10)) = 1 THEN SUBSTRING(SIL.[Description 3],1,10) 
		        WHEN ISDATE(SUBSTRING(SIL.[Description 3],1,8)) = 1 THEN SUBSTRING(SIL.[Description 3],1,8) 
	       ELSE CAST(MONTH(SIL.[Posting Date]) AS VARCHAR(2)) + '/01/' + CAST(YEAR(SIL.[Posting Date]) AS VARCHAR(4)) 
	       END AS DATETIME
	  )		AS RULE_START_DATE
INTO #CreditMemoRaw

from 
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Cr_Memo Line] SIL 
WHERE
CAST(
	       CASE WHEN ISDATE(SUBSTRING(SIL.[Description 3],1,10)) = 1 THEN SUBSTRING(SIL.[Description 3],1,10) 
		        WHEN ISDATE(SUBSTRING(SIL.[Description 3],1,8)) = 1 THEN SUBSTRING(SIL.[Description 3],1,8) 
	       ELSE CAST(MONTH(SIL.[Posting Date]) AS VARCHAR(2)) + '/01/' + CAST(YEAR(SIL.[Posting Date]) AS VARCHAR(4)) 
	       END AS DATETIME
	  )>'2016-07-01 00:00:00.000'
	  ------------------------------------------------------------------------------------------------------

select * from #CreditMemoRaw

alter table #CreditMemoRaw add [ChargeYearMonth] char(6) null;

update CMR
SET CMR.[ChargeYearMonth]=
 CAST(YEAR(RULE_START_DATE) as char(4))+
 CASE CAST(MONTH(RULE_START_DATE) as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
				   WHEN '3' THEN '03'
				   WHEN '4' THEN '04'
				   WHEN '5' THEN '05'
				   WHEN '6' THEN '06'
				   WHEN '7' THEN '07'
				   WHEN '8' THEN '08'
				   WHEN '9' THEN '09'
ELSE CAST(MONTH(RULE_START_DATE) as char(2)) END
FROM #CreditMemoRaw CMR

select * from #CreditMemoRaw

update N
set N.[CreditMemoAmount]=CMR.[CreditMemoAmount]
FROM [cube].[F_ProductRevenueNAV] N JOIN #CreditMemoRaw CMR ON 
N.LineItemID=CMR.LineItemID AND N.ChargeYearMonth=CMR.ChargeYearMonth



GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_FACT_PERIODS_ENT]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[uspCREATE_FACT_PERIODS_ENT]
AS
update E
  set E.[ChargeYearMonth]=
  CAST([ChargeYear] as char(4))+
CASE CAST([ChargeMonth] as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
				   WHEN '3' THEN '03'
				   WHEN '4' THEN '04'
				   WHEN '5' THEN '05'
				   WHEN '6' THEN '06'
				   WHEN '7' THEN '07'
				   WHEN '8' THEN '08'
				   WHEN '9' THEN '09'
ELSE CAST([ChargeMonth] as char(2)) END
FROM [cube].[F_ProductRevenueENT] E
---------------------------------------------------------------------

 update E
  set E.[InvoiceYearMonth]=
     CAST([InvoiceYear] as char(4))+
CASE CAST([InvoiceMonth] as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
				   WHEN '3' THEN '03'
				   WHEN '4' THEN '04'
				   WHEN '5' THEN '05'
				   WHEN '6' THEN '06'
				   WHEN '7' THEN '07'
				   WHEN '8' THEN '08'
				   WHEN '9' THEN '09'
ELSE CAST([InvoiceMonth] as char(2)) END
FROM [cube].[F_ProductRevenueENT] E


GO
/****** Object:  StoredProcedure [dbo].[uspCreate_NAVMarket]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[uspCreate_NAVMarket]
 as
 SELECT 
 SIL.[Document No_] as InvoiceNumber,
 DVM.[Name] as NAVMarketName,
 IH.[Bill-to Name] AS [ParentCompanyName],     
 SIL.[Description] As [ProductName]
 -- [Shortcut Dimension 2 Code] as Department,
  --  DVD.[Name]  as DepartmentName
  INTO cube.D_MarketLookup
 from 
 [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] SIL 
 JOIN [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Header] IH ON SIL.[Document No_] = IH.No_
  LEFT JOIN
  [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Dimension Value] DVM ON 
  SIL.[Shortcut Dimension 1 Code] = DVM.Code LEFT JOIN 
  [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Dimension Value] DVD ON 
   SIL.[Shortcut Dimension 2 Code] = DVD.[Code]
WHERE SIL.[Posting Date] BETWEEN '2016-07-01 00:00:00.000' and '2017-06-30 00:00:00.000'
 --where YEAR([Posting Date])=2017 AND MONTH([Posting Date])=8


GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_PERIOD]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[uspCREATE_PERIOD]
AS
select distinct CAST([ChargeYear] as char(4))+
CASE CAST([ChargeMonth] as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
				   WHEN '3' THEN '03'
				   WHEN '4' THEN '04'
				   WHEN '5' THEN '05'
				   WHEN '6' THEN '06'
				   WHEN '7' THEN '07'
				   WHEN '8' THEN '08'
				   WHEN '9' THEN '09'
ELSE CAST([ChargeMonth] as char(2)) END AS YearMonth,

CAST([ChargeYear] as char(4))+
CASE CAST([ChargeMonth] as varchar(20))  WHEN '1' THEN '-Jan'
                   WHEN '2' THEN '-Feb'
				   WHEN '3' THEN '-Mar'
				   WHEN '4' THEN '-Apr'
				   WHEN '5' THEN '-May'
				   WHEN '6' THEN '-Jun'
				   WHEN '7' THEN '-Jul'
				   WHEN '8' THEN '-Aug'
				   WHEN '9' THEN '-Sept'
				   WHEN '10' THEN '-Oct'
				   WHEN '11' THEN '-Nov'
				   WHEN '12' THEN '-Dec'

 END AS YearMonthName

 from [cube].[F_ProductRevenueENT]
UNION
select distinct CAST([InvoiceYear] as char(4))+
CASE CAST([InvoiceMonth] as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
				   WHEN '3' THEN '03'
				   WHEN '4' THEN '04'
				   WHEN '5' THEN '05'
				   WHEN '6' THEN '06'
				   WHEN '7' THEN '07'
				   WHEN '8' THEN '08'
				   WHEN '9' THEN '09'
ELSE CAST([InvoiceMonth] as char(2)) END AS YearMonth,

CAST([InvoiceYear] as char(4))+
CASE CAST([InvoiceMonth] as varchar(20))  WHEN '1' THEN '-Jan'
                   WHEN '2' THEN '-Feb'
				   WHEN '3' THEN '-Mar'
				   WHEN '4' THEN '-Apr'
				   WHEN '5' THEN '-May'
				   WHEN '6' THEN '-Jun'
				   WHEN '7' THEN '-Jul'
				   WHEN '8' THEN '-Aug'
				   WHEN '9' THEN '-Sept'
				   WHEN '10' THEN '-Oct'
				   WHEN '11' THEN '-Nov'
				   WHEN '12' THEN '-Dec'

 END AS YearMonthName
   from [cube].[F_ProductRevenueENT]
 
 ORDER BY YearMonth

GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_Reps]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[uspCREATE_Reps]
AS

IF OBJECT_ID('cube.D_Reps', 'U') IS NOT NULL DROP TABLE cube.D_Reps;

select C.ContactID,ST.SalesTerritoryRegionID as RegionID , ST.SalesTerritoryDesc, C.FirstName, C.LastName 
INTO cube.D_Reps
from [DCSQLPRD104].Enterprise.dbo.SalesTerritory ST LEFT JOIN
               [DCSQLPRD104].Enterprise.dbo.Contact C ON C.ContactID=ST.AEContactID

--Select * from [DCSQLPRD104].Enterprise.dbo.SalesTerritory


GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_SkuName]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[uspCREATE_SkuName]
AS
SELECT DISTINCT 
SKUID, 
CAST(SKUID AS VARCHAR(20)) +'-Suite-'+ CAST(
(SELECT TOP 1 M.MarketName from dbo.Sku S2 JOIN dbo.Market M ON S2.MarketID=M.MarketID
 where S2.SKUID=S1.SKUID) AS VARCHAR(100) ) +'-'+
CAST(
(SELECT TOP 1 UserCount from dbo.Sku S3  
where S3.SKUID=S1.SKUID) as Varchar(100)) +'-'+
CAST(
(SELECT TOP 1 BTC.BusinessTypeCategory from dbo.Sku S4 
JOIN dbo.BusinessTypeCategory BTC ON 
S4.CustomerType=BTC.BusinessTypeCategoryID
where S4.SKUID=S1.SKUID) as Varchar(100))
as SkuName 
--CAST(
--(SELECT TOP 1 UserCount from err.dbo.SkuPrice S3 where S3.SKUID=S1.SKUID) as Varchar(10)) as UserCount
INTO ##TempSkuName
FROM dbo.Sku S1 
WHERE S1.PRODUCTID IN (1,2,5)  
---------------------------------

update S
Set S.SkuName=T.SkuName
from dbo.Sku S JOIN ##TempSkuName T ON S.SKUID=T.SKUID where S.SkuName IS NULL
-----------------------------------

update SP
SET SP.SkuName=S.SkuName
from dbo.SkuPrice SP JOIN dbo.Sku S ON SP.SKUID=S.SKUID where SP.SkuName IS NULL
-----------------------------------

DROP TABLE ##TempSkuName;

-----------------------------------

GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_SkuName1]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspCREATE_SkuName1]
AS
SELECT DISTINCT 
SKUID, 
ISNULL(CAST(SKUID AS VARCHAR(20)) +'-Addon-'+ CAST(
(SELECT TOP 1 M.MarketName from dbo.Sku S2 JOIN dbo.Market M ON S2.MarketID=M.MarketID
 where S2.SKUID=S1.SKUID) AS VARCHAR(100) ) +'-'+
CAST(
(SELECT TOP 1 UserCount from dbo.Sku S3  
where S3.SKUID=S1.SKUID) as Varchar(100)) +'-'+
CAST(
(SELECT TOP 1 BTC.BusinessTypeCategory from dbo.Sku S4 
JOIN dbo.BusinessTypeCategory BTC ON 
S4.CustomerType=BTC.BusinessTypeCategoryID
where S4.SKUID=S1.SKUID) as Varchar(100)),CAST(SKUID AS VARCHAR(20))+'-'+'Unknown')
as SkuName 
--CAST(
--(SELECT TOP 1 UserCount from err.dbo.SkuPrice S3 where S3.SKUID=S1.SKUID) as Varchar(10)) as UserCount
INTO ##TempSkuName1
FROM dbo.Sku S1 
WHERE S1.SkuName is null
---------------------------------------------------------

update S
Set S.SkuName=T.SkuName
from dbo.Sku S JOIN ##TempSkuName1 T ON S.SKUID=T.SKUID where S.SkuName IS NULL
---------------------------------------------------------

update SP
SET SP.SkuName=S.SkuName
from dbo.SkuPrice SP JOIN dbo.Sku S ON SP.SKUID=S.SKUID where SP.SkuName IS NULL
----------------------------------------------------------
----------------------------------------------------------
DROP TABLE ##TempSkuName1;--------------------------------
----------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_StubAmountAdj]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[uspCREATE_StubAmountAdj]
AS
update E
SET E.[MonthlyPriceAdj]=E.[MonthlyPrice]-T.[StubAmount]
FROM [cube].[F_ProductRevenueENT] E JOIN #TempStubs T
ON 
E.InvoiceDetailID=T.InvoiceDetailID AND
E.LineItemID=T.LineItemID AND
E.ContractID=T.ContractID AND
E.ChargeYearMonth=T.ChargeYearMonth
-------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[uspCREATE_TempBundleID]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[uspCREATE_TempBundleID]
AS
select contractid, date, count(*)+7000000 as BundleID
INTO #LineItemUpateBundle
 from [err].[LineItemXNB]
 group by  contractid, date
order by Contractid, date, count(*);

update LI
SET LI.BundleID=LIB.BundleID
from [err].[LineItemXNB] LI JOIN #LineItemUpateBundle LIB ON LI.ContractID=LIB.ContractID AND LI.Date=LIB.Date;

drop table #LineItemUpateBundle;


GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_ContractMarket]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[uspLOAD_ContractMarket]
as
SELECT  LI.ContractID, SUPM.ProductMarketDesc
INTO cube.D_ContractMarket
FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID

GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_D_Market]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[uspLOAD_D_Market] 
as
select distinct  MajorMarketCode as MarketCode, MajorMarketDesc as MarketDescription  
into cube.D_Market
from 
[DCSQLPRD104].[EnterpriseSub].dbo.MajorMarket
UNION
select distinct  MarketCode as MarketCode, ResearchMarketName as MarketDescription  from 
[DCSQLPRD104].[EnterpriseSub].dbo.ResearchMarket;

with dups as
(
select ContractID, LineItemID, ProductMarketDesc, row_number() over (partition by ContractID, LineItemID, ProductMarketDesc
order by ContractID, LineItemID, ProductMarketDesc) as rn from cube.D_ContractLineMarket
)
delete from dups where rn>1
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_F_Enterprise]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspLOAD_F_Enterprise]
AS

SELECT 
SF.[LocationID],
SF.[ContractID],
SF.[SKUID],
GL.[GLAccount] as GLAccount,
CAST(YEAR(LI.Date) as varchar(4))+
CASE MONTH(LI.Date)
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sep'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END as YearMonth,
SUM(LI.Amount) as SalesAmt,
SUM(SPF.Price) as ListedAmt
INTO F_Enterprise2
FROM [dbo].[LineItemComplete] LI 
LEFT JOIN SkuBridgeFinal2 SF ON LI.LineItemID=SF.LineItemID  LEFT JOIN 
( SELECT DISTINCT [Line Item ID] as [LineItemID], [G_L Account No_] as [GLAccount]
--INTO GLBridge2
from [DCSQLDEV135\ACCT].[NavisionDB260].[dbo].[RIG$G_L Entry] 
--where [G_L Account No_]
) GL ON GL.LineItemID=LI.LineItemID
LEFT JOIN SkuPriceFinal SPF on SF.SKUID=SPF.SKUID 
--LEFT JOIN GLBridge GLB ON GLB.LineItemID=LI.LineItemID
--WHERE LI.skuid<>-1 and LI.Amount>4
GROUP BY 
SF.[LocationID],
SF.[ContractID],
SF.[SKUID],
GL.[GLAccount],
LI.Date


GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_F_Navision]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspLOAD_F_Navision]
AS

SELECT 
ISNULL(SB.SKUID,-1)  AS SKUID,
SIL.[Contract ID] AS ContractID,
SIL.[Line Item ID] AS LineItemID,
SIL.[CustAccountLocationID] AS LocationID,
ISNULL(GLB.GLAccount,-1) AS GLAccount,
CAST(YEAR([Posting Date])  AS VARCHAR(4))+
CASE MONTH([Posting Date])
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sep'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END AS PostingYearMonth,
YEAR([Posting Date]) AS PostingYear,
MONTH([Posting Date]) AS PostingMonth,
[Amount] AS InvoiceAmount,
[Unit Price] AS ContractAmount
INTO [cube].[F_ProductRevenueNAV1]
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] SIL 
LEFT JOIN revenue.SkuBridge SB ON SIL.[Line Item ID]=SB.LineItemID 
LEFT JOIN [dbo].[GLBridge] GLB ON  SIL.[Line Item ID]=GLB.LineItemID  WHERE 
SIL.[Posting Date] BETWEEN '2016-07-01 00:00:00.000' and '2017-06-30 00:00:00.000'
--GROUP BY [Contract ID],[Line Item ID],[CustAccountLocationID],[Posting Date]




GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_InvoiceDetail]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--select count(*) from LineItem1


CREATE PROCEDURE [dbo].[uspLOAD_InvoiceDetail]
AS

SELECT 
[InvoiceDetailID],
[TransactionID],
[InvoiceID],
-1 as SKUID,
-1 as GLAccount ,
ID.[LineItemID],
ID.[ContractID],
[BundleID],
[ChargeMonth],
[ChargeYear],
[InvoiceMonth],
[InvoiceYear],
[InvoiceBatchID],
[BilledThroughDate],
[SiteLocationID]
[LocationID],
[BillingLocationID],
[RevenueMarketID],
[BillingFrequencyCD],
[BillingDescription],
[PreviousBalance],
[InvoiceText],
[DiscountAmount],
[GrossMonthlyPrice],
[MonthlyPrice],
[SalesTaxAmount],
[TotalMonthlyPrice]
INTO [cube].[F_ProductRevenue]
FROM [DCSQLPRD104].Enterprise.dbo.InvoiceDetail ID
WHERE (ChargeYear=2016 AND ChargeMonth IN (7,8,9,10,11,12)) OR (ChargeYear=2017 AND ChargeMonth IN (1,2,3,4,5,6))



GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_LineItem]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspLOAD_LineItem]
AS

--SELECT
--LineItemID as LineItemID, 
--ContractID as ContractID,
--ISNULL(BundleID,-1) as BundleID,
--ISNULL(ProductID,-1) as ProductID,
--ISNULL(ProductMarket,'-1') as MarketID,
--ISNULL(NumberOfUsers,0) as UserCount,
--ISNULL(IT.IndustryTypeID,0) as CustomerType, 
--BillingStartDate as [Date], 
---1 as SKUID ,
--CAST (OriginalMonthlyPrice AS decimal(10,2)) as Amount
--FROM Enterprise.dbo.LineItem LI LEFT JOIN
--EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID LEFT JOIN
--Enterprise.dbo.LocationProfile LP ON LI.SiteLocationID=LP.LocationID LEFT JOIN
--Enterprise.dbo.IndustryType IT ON LP.IndustryTypeID=IT.IndustryTypeID
--WHERE 
----YEAR(BillingStartDate) in (2016,2017) 
--LineItemStatusID=1
--AND BUNDLEID IS NOT NULL
--UNION
SELECT 
LI.LineItemID as LineItemID, 
LI.ContractID as ContractID,
ISNULL(BundleID,-1) as BundleID,
ISNULL(ProductID,-1) as ProductID,
ISNULL(ProductMarket,'-1') as MarketID,
ISNULL(NumberOfUsers,0) as UserCount,
ISNULL(BTC.BusinessTypeCategoryID,8) as CustomerType, 
LI.BillingStartDate as [Date], 
ISNULL(SB.SKUID,-1) as SKUID ,
CAST (DiscountedMonthlyPrice AS decimal(10,2)) as DiscountedMonthlyPrice,
CAST (OriginalMonthlyPrice AS decimal(10,2)) as OriginalMonthlyPrice,
CAST (CurrentMonthlyPrice AS decimal(10,2)) as CurrentMonthlyPrice
INTO dbo.LineItem
FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI LEFT JOIN  [revenue].[SkuBridge] SB ON
LI.LineItemID=SB.LineItemID LEFT JOIN
[DCSQLPRD104].EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.LocationProfile LP ON LI.SiteLocationID=LP.LocationID LEFT JOIN
[dbo].[BusinessType] BT ON LP.BusinessTypeID=BT.BusinessTypeID LEFT JOIN [dbo].[BusinessTypeCategory] BTC ON
BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
WHERE LI.ContractID IN (SELECT ContractID from  [diff].[Contracts]) 
--AND
--LI.LineItemStatusID=1
--((BillingStartDate>'2016-07-01 00:00:00.000') OR (RenewalDate>'2016-07-01 00:00:00.000'))

GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_LineItemAppts]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--select count(*) from LineItem1


CREATE PROCEDURE [dbo].[uspLOAD_LineItemAppts]
AS

TRUNCATE TABLE LineItemAppts;

INSERT LineItemAppts (
            [LineItemID]
           ,[ContractID]
		   ,[ProductID]
           ,[MarketID]
           ,[Date]
           ,[SKUID]
           ,[Amount])

--SELECT
--LineItemID as LineItemID, 
--ContractID as ContractID,
--ISNULL(BundleID,-1) as BundleID,
--ISNULL(ProductID,-1) as ProductID,
--ISNULL(ProductMarket,'-1') as MarketID,
--ISNULL(NumberOfUsers,0) as UserCount,
--ISNULL(IT.IndustryTypeID,0) as CustomerType, 
--BillingStartDate as [Date], 
---1 as SKUID ,
--CAST (OriginalMonthlyPrice AS decimal(10,2)) as Amount
--FROM Enterprise.dbo.LineItem LI LEFT JOIN
--EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID LEFT JOIN
--Enterprise.dbo.LocationProfile LP ON LI.SiteLocationID=LP.LocationID LEFT JOIN
--Enterprise.dbo.IndustryType IT ON LP.IndustryTypeID=IT.IndustryTypeID
--WHERE 
----YEAR(BillingStartDate) in (2016,2017) 
--LineItemStatusID=1
--AND BUNDLEID IS NOT NULL
--UNION
SELECT 
LI.LineItemID as LineItemID, 
LI.ContractID as ContractID,
ISNULL(LI.ProductID,-1) as ProductID,
ISNULL(A.CityID,'-1') as MarketID,
LI.BillingStartDate as [Date], 
PA.SKUID as SKUID ,
CAST (LI.OriginalMonthlyPrice AS decimal(10,2)) as Amount
--INTO [dbo].[LineItemAppts]
FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI LEFT JOIN
[DCSQLPRD104].EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.LocationProfile LP ON LI.SiteLocationID=LP.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Location L ON LI.SiteLocationID=L.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID LEFT JOIN
[dbo].[BusinessType] BT ON LP.BusinessTypeID=BT.BusinessTypeID LEFT JOIN [dbo].[BusinessTypeCategory] BTC ON
BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID LEFT JOIN [dbo].[ProductAppts] PA ON 
LI.ProductID=PA.ProductID

WHERE 
--YEAR(BillingStartDate) in (2016,2017) 
LineItemStatusID=1
AND LI.ProductID IN (SELECT ProductID FROM  [dbo].[ProductAppts])
--BUNDLEID IS NOT NULL

GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_LineItemAppts2]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--select count(*) from LineItem1


CREATE PROCEDURE [dbo].[uspLOAD_LineItemAppts2]
AS


SELECT 
LI.LineItemID as LineItemID, 
LI.ContractID as ContractID,
ISNULL(LI.ProductID,-1) as ProductID,
ISNULL(A.CityID,'-1') as MarketID,
LI.BillingStartDate as [Date], 
PA.ProductPackage as NetworkName,
CASE WHEN BLD.[GrossBldgSqFt]>80 THEN 'P' ELSE 'M' END AS UnitSign,
CAST (LI.OriginalMonthlyPrice AS decimal(10,2)) as Amount,
CAST (C.DefaultTermMonths-1 AS INT) AS ContractTermMonths 
INTO [dbo].[LineItemAppts5]
--INTO #LineItemAppts2
FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI LEFT JOIN 
[DCSQLPRD104].Enterprise.dbo.Contract C ON C.ContractID=LI.ContractID LEFT JOIN  
[DCSQLPRD104].Enterprise.dbo.Location L ON LI.SiteLocationID=L.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID LEFT JOIN
[DCSQLPRD104].Enterprise.[dbo].[PropertyAddress] PRADDR ON L.AddressID=PRADDR.AddressID LEFT JOIN
[DCSQLPRD104].Enterprise.[dbo].[Property] P ON P.PropertyID=PRADDR.PropertyID LEFT JOIN 
[DCSQLDEV104].CoStar2.[dbo].[BldSqFt] BLD ON BLD.PropertyID=P.PropertyID  LEFT JOIN 
[dbo].[ProductAppts] PA ON LI.ProductID=PA.ProductID

WHERE 
--YEAR(BillingStartDate) in (2016,2017) 
LineItemStatusID=1
AND LI.ProductID IN (SELECT ProductID FROM  [dbo].[ProductAppts])
--BUNDLEID IS NOT NULL
--TRUNCATE TABLE [dbo].[LineItemAppts3]
--DROP TABLE [LineItemAppts3]
--select * 
--INTO LineItemAppts2
--from #LineItemAppts2




GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_PO]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspLOAD_PO]
AS

SELECT 
--GLE.[G_L Account No_] as GLAccount,
PIL.[Document No_] as DocumentNumber,
PIH.[No_] as HeaderNumber,
CASE PIH.[PO Number]  WHEN '' THEN '00000' ELSE
ISNULL(PIH.[PO Number],'00000') END as PONumber,
PIH.[Invoice Disc_ Code] as DescrCode,
PIH.[Document Date] as DocDate,
PIH.[Order Date] as OrderDate,
PIH.[Posting Date] as PostingDate,
YEAR(PIH.[Posting Date]) as PostingYear,
MONTH(PIH.[Posting Date]) as PostingMonth,
CAST(YEAR(PIH.[Posting Date])  AS VARCHAR(4))+
CASE MONTH(PIH.[Posting Date])
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sept'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END AS PostingYearMonth,
PIH.[Expected Receipt Date] ERDate,
PIH.[Due Date] as DueDate,
PIH.[Pay-to Vendor No_] as VendorNumber,
PIH.[Pay-to Name] as VendorName,
PIL.[Description] as ItemDescription,
CASE PIL.[Shortcut Dimension 1 Code] WHEN '' THEN '000' ELSE
ISNULL(PIL.[Shortcut Dimension 1 Code],'000') END as DepartmentCode,
CASE PIL.[Shortcut Dimension 1 Code] WHEN '' THEN '000' ELSE
ISNULL(PIL.[Shortcut Dimension 1 Code],'000') END as MarketCode,
PIL.Amount as POAmount
--PIL.Description as ItemDescription
--PIL.[Shortcut Dimension 1 Code] as DepartmentCode,
--PIL.[Shortcut Dimension 1 Code] as MarketCode,
--PIL.Amount as POAmount 
INTO cube.F_PO 
from [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Purch_ Inv_ Header] PIH JOIN 
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Purch_ Inv_ Line] PIL ON
PIH.No_=PIL.[Document No_] 
--JOIN dbo.GLBrideOnDocumentNumber GLE ON  GLE.[Document No_]=PIL.[Document No_]
--AND GLE.[Posting Date]=PIL.[Posting Date]
where PIH.[Order Date] > '2016-07-01 00:00:00.000'
-------------

GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_Vendor]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[uspLOAD_Vendor]
AS
select distinct [VendorNumber],[VendorName] 
into cube.D_Vendor
from [cube].[F_PO]

GO
/****** Object:  StoredProcedure [dbo].[uspProcessContracts]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


select * INTO
LineItem2s from LineItem
truncate table LineItem
Insert LineItem (
            [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount])

Select 

            [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount]
 from LineItem1 where CONTRACTID IN 
 (SELECT CONTRACTID FROM [dbo].[Contract_Input_List])

select * from LineItem

EXEC [dbo].[uspSKU] 152472
EXEC [dbo].[uspSKU] 83492
EXEC [dbo].[uspSKU] 144831
EXEC [dbo].[uspSKU] 152567
EXEC [dbo].[uspSKU] 152562
EXEC [dbo].[uspSKU]

5294,5470,8286,8817
EXEC [dbo].[uspSKU] 5294
EXEC [dbo].[uspSKU] 5470
EXEC [dbo].[uspSKU] 8286
EXEC [dbo].[uspSKU] 8817


TRUNCATE TABLE [dbo].[Sku]
TRUNCATE TABLE [dbo].[SkuPrice]
TRUNCATE TABLE [dbo].[SkuHist]
TRUNCATE TABLE [LineItem] 
UPDATE LineItem SET SKUID=NULL WHERE SKUID IS NOT NULL
SELECT * FROM [dbo].[LineItem] order by [ContractID]
SELECT * FROM [dbo].[LineItem] 
ORDER BY CONTRACTID

SELECT * FROM [dbo].[Sku]
SELECT * FROM SkuHist

*/


CREATE PROCEDURE [dbo].[uspProcessContracts]
AS


DECLARE @CURRENT_CONTRACTID INT

 DECLARE C CURSOR FOR
 SELECT [ContractID] FROM [dbo].[Contract_Input_List]
 ORDER BY [ContractID]
  
 OPEN C
 FETCH c into @CURRENT_CONTRACTID
 WHILE @@FETCH_STATUS = 0
 BEGIN
   EXEC [uspSKU] @CURRENT_CONTRACTID
FETCH c into @CURRENT_CONTRACTID
 END

 CLOSE C
 DEALLOCATE C


GO
/****** Object:  StoredProcedure [dbo].[uspRULE_updates]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------------
 Create proc [dbo].[uspRULE_updates]
 as
alter table [cube].[F_ProductRevenueNAV] add [TermInMonths] int null;
alter table [cube].[F_ProductRevenueNAV] add [RuleYearMonth] char(6) null;
------------------------------------------------------------------------------
alter table [cube].[F_ProductRevenueENT] add [TermInMonths] int null;
alter table [cube].[F_ProductRevenueENT] add [RuleYearMonth] char(6) null;

update N
SET 
N.[RuleYearMonth]=B.[RuleYearMonth],
N.[TermInMonths]=B.[TermInMonths]
FROM [cube].[F_ProductRevenueNAV] N JOIN dbo.RuleBridge B 
ON N.InvoiceNumber=B.InvoiceNumber
and B.TermInMonths<>1
------------------------------------------------------------
update E
SET 
E.[RuleYearMonth]=N.[RuleYearMonth],
E.[TermInMonths]=N.[TermInMonths]
FROM [cube].[F_ProductRevenueNAV] N 
JOIN cube.F_ProductRevenueENT E 
ON N.InvoiceID=E.InvoiceID AND
   N.ContractID=E.ContractID AND
   N.LineItemID=E.LineItemID
where N.RuleYearMonth IS NOT NULL

select * from [cube].[F_ProductRevenueNAV] where 
TermInMonths >1


select * from dbo.InvoiceBridge

select * from [dbo].[RuleBridge] where TermInMonths>1

update N
SET [RuleYearMonth]='-'
from [cube].[F_ProductRevenueNAV] N where [RuleYearMonth] is null
-------------------------------------------------------------------

select * from [cube].[F_ProductRevenueNAV] where [RuleYearMonth]='-'


GO
/****** Object:  StoredProcedure [dbo].[uspSKU]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

EXEC [dbo].[uspSKU] 152472
EXEC [dbo].[uspSKU] 83492
EXEC [dbo].[uspSKU] 144831
EXEC [dbo].[uspSKU] 152567
EXEC [dbo].[uspSKU] 152562

TRUNCATE TABLE [dbo].[Sku]
TRUNCATE TABLE [dbo].[SkuPrice]
UPDATE LineItem SET SKUID=NULL WHERE SKUID IS NOT NULL
SELECT * FROM [dbo].[LineItem] order by [ContractID]
SELECT * FROM [dbo].[LineItem] 
ORDER BY CONTRACTID

SELECT * FROM [dbo].[Sku]
--------------------------

EXEC [dbo].[uspSKU] 152472
EXEC [dbo].[uspSKU] 83492
EXEC [dbo].[uspSKU] 144831
EXEC [dbo].[uspSKU] 152567
EXEC [dbo].[uspSKU] 152562

------------REAL-------------
EXEC [dbo].[uspSKU] 5294
EXEC [dbo].[uspSKU] 5470
EXEC [dbo].[uspSKU] 8286
EXEC [dbo].[uspSKU] 8817
----------------------------

TRUNCATE TABLE [dbo].[Sku]
TRUNCATE TABLE [dbo].[SkuPrice]
TRUNCATE TABLE [dbo].[SkuHist]
TRUNCATE TABLE [dbo].[LineItem]
UPDATE LineItem SET SKUID=NULL WHERE SKUID IS NOT NULL
SELECT * FROM [dbo].[LineItem] order by [ContractID], BUNDLEID
SELECT * FROM [dbo].[LineItem] 
ORDER BY CONTRACTID
SELECT * FROM LINEITEM
SELECT * FROM [dbo].[Sku]

SELECT * FROM SKU

SELECT DISTINCT SKUID FROM SKU

SELECT * FROM SKUHIST

SELECT * FROM SkuPrice

SELECT DISTINCT SKUID FROM SkuPrice

EXEC [dbo].[uspProcessContracts]
-------------------------------------
SELECT CONTRACTID FROM LineItem where ContractID not in (
SELECT ContractID from [dbo].[Contract_Input_List])

select * INTO
LineItem2s from LineItem
truncate table LineItem
Insert LineItem (
            [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount])

Select 

            [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount]
 from LineItem1 where BUNDLEID<>'-1' AND  CONTRACTID IN 
 (SELECT CONTRACTID FROM [dbo].[Contract_Input_List])


*/

CREATE PROCEDURE [dbo].[uspSKU]
@CONTRACTID INT
AS

BEGIN TRY

DECLARE @CURRENT_BundleID  INT
DECLARE @CURRENT_SKUID INT
DECLARE @CURRENT_LIST_PRICE MONEY
DECLARE @EXISTING_SKUID INT
DECLARE @SKU_EXISTS INT


	SELECT DISTINCT BUNDLEID 
		INTO #BundleList 
			FROM LineItem 
				WHERE ContractID= @CONTRACTID
				     AND SKUID=-1

	SET @CURRENT_BundleID = NULL

	SELECT TOP 1 @CURRENT_BundleID = BUNDLEID  
			FROM #BundleList

	WHILE (@CURRENT_BundleID IS NOT NULL)
	
	 BEGIN
				
				SELECT BundleID, ProductID,MarketID,UserCount,CustomerType,Date,Amount
				INTO   #Bundles
					FROM   LineItem
						WHERE  BundleID=@CURRENT_BundleID 
				
				SELECT 

				@SKU_EXISTS=COUNT(*),
				@EXISTING_SKUID=S.SKUID
				
				FROM #Bundles B JOIN Sku S 
					ON B.ProductID=S.ProductID 
						AND B.MarketID=S.MarketID 
							AND B.UserCount=S.UserCount
							   AND B.CustomerType=S.CustomerType

				GROUP BY S.SKUID

				IF @SKU_EXISTS>0 
				   BEGIN 
				   
				         SET  @CURRENT_SKUID=@EXISTING_SKUID 
						 SELECT @CURRENT_LIST_PRICE=SUM(Amount) from #Bundles B
											WHERE B.BundleID = @CURRENT_BundleID

						 UPDATE LI

				         SET LI.SKUID=@CURRENT_SKUID

							FROM LineItem LI JOIN Sku S 
								ON S.ProductID=LI.ProductID 
									AND  S.MarketID=LI.MarketID 
										AND S.UserCount=LI.UserCount
										   AND S.CustomerType=LI.CustomerType
											 AND LI.ContractID=@CONTRACTID
												AND LI.BundleID=@CURRENT_BundleID
                       
					      UPDATE SP

						  SET SP.Price=@CURRENT_LIST_PRICE,
						      SP.LastUpdateDate=GETDATE()
							 FROM SkuPrice SP
								WHERE SP.SKUID=@CURRENT_SKUID						
							   
				   END
								
				ELSE 
				
				BEGIN
			
				SET  @CURRENT_SKUID=NULL

				SELECT @CURRENT_SKUID=COUNT(*) 
					FROM [Sku]
								
				INSERT [Sku] (SKUID,ProductID,MarketID,UserCount,CustomerType,Date,Amount)
				SELECT @CURRENT_SKUID, ProductID,MarketID,UserCount,CustomerType,Date,Amount 
					FROM #Bundles 
						WHERE BundleID=@CURRENT_BundleID
						            
                INSERT SkuPrice (SKUID,Price)
				SELECT SKUID, SUM(AMOUNT)
				      FROM Sku 
					     WHERE SKUID=@CURRENT_SKUID
					      GROUP BY SKUID;

                 UPDATE SP
				    SET SP.LastUpdateDate=GETDATE()
					   FROM SkuPrice SP
					      WHERE SKUID=@CURRENT_SKUID
				  
				
				UPDATE LI
				SET LI.SKUID=S.SKUID
					FROM LineItem LI JOIN Sku S 
						ON S.ProductID=LI.ProductID 
							AND S.MarketID=LI.MarketID 
								AND S.UserCount=LI.UserCount
								   AND S.CustomerType=LI.CustomerType
									  AND LI.ContractID=@CONTRACTID 
										 AND LI.BundleID=@CURRENT_BundleID
	           

				END	
		
		DELETE 
			FROM #BundleList 
				WHERE BundleID = @CURRENT_BundleID

		DROP TABLE  #Bundles

		SET @CURRENT_BundleID = NULL

		SELECT TOP 1 @CURRENT_BundleID = BundleID  
			FROM #BundleList

		IF @@ROWCOUNT = 0 SET @CURRENT_BundleID = NULL
   END 

END TRY

BEGIN CATCH
         -------------ERROR HANDLING AREA
		 DECLARE @Error_Message VARCHAR(8000)
		 SET @Error_Message = ERROR_MESSAGE() 

 
END CATCH





GO
/****** Object:  StoredProcedure [dbo].[uspSKU_AVG_PRICE]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

SELECT SKUID,[Date], 
SUM(Amount) AMT 
FROM SKU
WHERE SKUID=3
GROUP BY SKUID,[Date]
-----------------------
SELECT SKUID,[Date], 
SUM(Amount) AMT 
FROM SkuHist
WHERE SKUID=3
GROUP BY SKUID,[Date]

TRUNCATE TABLE [SkuPrice]

INSERT SkuPrice ([SKUID],[Price])
SELECT SKUID, SUM([Amount])
FROM Sku
GROUP BY SKUID;
UPDATE SkuPrice 
SET [LastUpdateDate]=GETDATE()
WHERE LastUpdateDate IS NULL;

SELECT * FROM SkuPrice

EXEC [dbo].[uspSKU_AVG_PRICE] 0

UPDATE S
SET S.PRICE=NULL
FROM SkuPrice S
WHERE S.PRICE IS NOT NULL
---------------------------------------------------------------
---------------------------------------------------------------
SELECT SKUID, date, 
SUM(Amount) as Amt 
INTO #skulist 
FROM LineItem WHERE skuid<>-1 
GROUP BY SKUID, date 
HAVING SKUID>1

SELECT SKUID,DATE , AMT
FROM #skulist
WHERE Amt<>0
ORDER BY SKUID,DATE , AMT

SELECT 
DISTINCT SKUID 
INTO #skulist1
FROM #skulist 

select skuid from
#skulist1 order by SKUID


select * from #skulist
--------------------------------------------------------
--------------------------------------------------------


*/


CREATE PROCEDURE [dbo].[uspSKU_AVG_PRICE]
--@SKUID INT
AS
----BEGIN TRY
DECLARE @CURRENT_SKUID INT
DECLARE @SKU_NUMBER INT
DECLARE @SKU_TOTAL MONEY
DECLARE @SKU_AVG_PRICE MONEY


SELECT SKUID, date, 
SUM(Amount) as Amt 
INTO #skulist 
FROM LineItem WHERE skuid<>-1 
--AND SKUID=@SKUID
GROUP BY SKUID, date 
--HAVING SKUID>1

SELECT DISTINCT SKUID
INTO #skulist1
FROM #skulist
WHERE Amt<>0
ORDER BY SKUID
				

	SET @CURRENT_SKUID = NULL

	SELECT TOP 1 @CURRENT_SKUID = SKUID  
			FROM #skulist1 ORDER BY SKUID	

	WHILE (@CURRENT_SKUID IS NOT NULL)
	
	 BEGIN


				SELECT SKUID AS SKUID ,DATE, Amt 
				INTO  #SKU_PRICES
				FROM #skulist WHERE Amt<>0 
							AND SKUID= @CURRENT_SKUID ORDER BY SKUID, DATE, Amt
								
			SELECT @SKU_NUMBER=COUNT(*) FROM #SKU_PRICES WHERE SKUID=@CURRENT_SKUID
			SELECT @SKU_TOTAL=SUM(AMT) FROM #SKU_PRICES WHERE SKUID=@CURRENT_SKUID
			SELECT @SKU_AVG_PRICE=(@SKU_TOTAL/@SKU_NUMBER)

			UPDATE S
				SET S.Price=@SKU_AVG_PRICE,
				    S.LastUpdateDate=GETDATE()
					FROM SkuPrice S
						WHERE S.SKUID=@CURRENT_SKUID
						 

		DELETE 
			FROM #skulist1 
				WHERE SKUID = @CURRENT_SKUID

		DROP TABLE  #SKU_PRICES

		SET @CURRENT_SKUID = NULL

		SELECT TOP 1 @CURRENT_SKUID = SKUID  
			FROM #skulist1 ORDER BY SKUID

		IF @@ROWCOUNT = 0 SET @CURRENT_SKUID = NULL
   
END	

UPDATE S
	SET S.Price=0.00
			FROM SkuPrice S
					WHERE S.Price IS NULL

----END TRY

----BEGIN CATCH
----         -----------ERROR HANDLING AREA
----		 DECLARE @Error_Message VARCHAR(8000)
----		 SET @Error_Message = ERROR_MESSAGE() 

 
----END CATCH




GO
/****** Object:  StoredProcedure [dbo].[uspSKUb]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSKUb]
@CONTRACTID INT
AS

BEGIN TRY

DECLARE @CURRENT_DateID  DATE
DECLARE @CURRENT_SKUID INT
DECLARE @CURRENT_LIST_PRICE MONEY
DECLARE @EXISTING_SKUID INT
DECLARE @SKU_EXISTS INT


	SELECT  DateID=DATE,AMT=SUM(AMOUNT)
		INTO #DateList 
			FROM LineItem 
			     WHERE ContractID= @CONTRACTID AND BundleID=-1
			         GROUP BY DATE
                      --  HAVING SUM(AMOUNT)>0

				

	SET @CURRENT_DateID = NULL

	SELECT TOP 1 @CURRENT_DateID = DateID  
			FROM #DateList

	WHILE (@CURRENT_DateID IS NOT NULL)
	
	 BEGIN
				
				SELECT ProductID,MarketID,UserCount,CustomerType,Date,Amount
				INTO   #NewBundles
					FROM   LineItem
						WHERE  ContractID= @CONTRACTID AND BundleID=-1
						  AND Date=@CURRENT_DateID 
				
				SELECT 

				@SKU_EXISTS=COUNT(*),
				@EXISTING_SKUID=S.SKUID
				
				FROM #NewBundles B JOIN Sku S 
					ON B.ProductID=S.ProductID 
						AND B.MarketID=S.MarketID 
							AND B.UserCount=S.UserCount
							   AND B.CustomerType=S.CustomerType

				GROUP BY S.SKUID

				IF @SKU_EXISTS>0 
				   BEGIN 
				   
				         SET  @CURRENT_SKUID=@EXISTING_SKUID 
						 SELECT @CURRENT_LIST_PRICE=SUM(Amount) from #NewBundles B
											WHERE B.Date = @CURRENT_DateID

						 UPDATE LI

				         SET LI.SKUID=@CURRENT_SKUID

							FROM LineItem LI JOIN Sku S 
								ON S.ProductID=LI.ProductID 
									AND  S.MarketID=LI.MarketID 
										AND S.UserCount=LI.UserCount
										   AND S.CustomerType=LI.CustomerType
											 AND LI.ContractID=@CONTRACTID
												AND LI.Date=@CURRENT_DateID
							WHERE LI.BundleID=-1
                       
					      UPDATE SP

						  SET SP.Price=@CURRENT_LIST_PRICE,
						      SP.LastUpdateDate=GETDATE()
							 FROM SkuPrice SP
								WHERE SP.SKUID=@CURRENT_SKUID						
							   
				   END
								
				ELSE 
				
				BEGIN
			
				SET  @CURRENT_SKUID=NULL

				SELECT @CURRENT_SKUID=COUNT(*) 
					FROM [Sku]
								
				INSERT [Sku] (SKUID,ProductID,MarketID,UserCount,CustomerType,Date,Amount)
				SELECT @CURRENT_SKUID, ProductID,MarketID,UserCount,CustomerType,Date,Amount 
					FROM #NewBundles 
						WHERE Date=@CURRENT_DateID
						            
                INSERT SkuPrice (SKUID,Price)
				SELECT SKUID, SUM(AMOUNT)
				      FROM Sku 
					     WHERE SKUID=@CURRENT_SKUID
					      GROUP BY SKUID;

                 UPDATE SP
				    SET SP.LastUpdateDate=GETDATE()
					   FROM SkuPrice SP
					      WHERE SKUID=@CURRENT_SKUID
				  
				
				UPDATE LI
				SET LI.SKUID=S.SKUID
					FROM LineItem LI JOIN Sku S 
						ON S.ProductID=LI.ProductID 
							AND S.MarketID=LI.MarketID 
								AND S.UserCount=LI.UserCount
								   AND S.CustomerType=LI.CustomerType
									  AND LI.ContractID=@CONTRACTID 
										 AND LI.Date=@CURRENT_DateID
                       WHERE LI.BundleID=-1
	           

				END	
		
		DELETE 
			FROM #DateList 
				WHERE DateID = @CURRENT_DateID

		DROP TABLE  #NewBundles

		SET @CURRENT_DateID = NULL

		SELECT TOP 1 @CURRENT_DateID = DateID  
			FROM #DateList

		IF @@ROWCOUNT = 0 SET @CURRENT_DateID = NULL
   END 

END TRY

BEGIN CATCH
         -------------ERROR HANDLING AREA
		 DECLARE @Error_Message VARCHAR(8000)
		 SET @Error_Message = ERROR_MESSAGE() 

 
END CATCH






GO
/****** Object:  StoredProcedure [dbo].[uspSKUb1]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspSKUb1]
@CONTRACTID INT
AS

BEGIN TRY

DECLARE @CURRENT_DateID  DATE
DECLARE @CURRENT_SKUID INT
DECLARE @CURRENT_LIST_PRICE MONEY
DECLARE @EXISTING_SKUID INT
DECLARE @SKU_EXISTS INT


	SELECT  DateID=DATE,AMT=SUM(AMOUNT)
		INTO #DateList 
			FROM LineItem 
			     WHERE ContractID= @CONTRACTID AND BundleID=-1
			         GROUP BY DATE
   SELECT * INTO bug.DateList FROM #DateList
                      --  HAVING SUM(AMOUNT)>0

				

	SET @CURRENT_DateID = NULL

	SELECT TOP 1 @CURRENT_DateID = DateID  
			FROM #DateList
   
    SELECT top 1 DateID INTO bug.Current_DateID FROM #DateList

	WHILE (@CURRENT_DateID IS NOT NULL)
	
	 BEGIN
				
				SELECT ProductID,MarketID,UserCount,CustomerType,Date,Amount
				INTO   #NewBundles
					FROM   LineItem
						WHERE  ContractID= @CONTRACTID AND BundleID=-1
						  AND Date=@CURRENT_DateID 
               
			     Select * INTO bug.NewBundles from #NewBundles
				
				SELECT 

				@SKU_EXISTS=COUNT(*),
				@EXISTING_SKUID=S.SKUID
				
				FROM #NewBundles B JOIN Sku S 
					ON B.ProductID=S.ProductID 
						AND B.MarketID=S.MarketID 
							AND B.UserCount=S.UserCount
							   AND B.CustomerType=S.CustomerType

				GROUP BY S.SKUID

				Insert [bug].[SkuExists](Cnt) SELECT @SKU_EXISTS;

				IF @SKU_EXISTS>0 
				   BEGIN 
				   
				         SET  @CURRENT_SKUID=@EXISTING_SKUID 
						 SELECT @CURRENT_LIST_PRICE=SUM(Amount) from #NewBundles B
											WHERE B.Date = @CURRENT_DateID

						 UPDATE LI

				         SET LI.SKUID=@CURRENT_SKUID

							FROM LineItem LI JOIN Sku S 
								ON S.ProductID=LI.ProductID 
									AND  S.MarketID=LI.MarketID 
										AND S.UserCount=LI.UserCount
										   AND S.CustomerType=LI.CustomerType
											 AND LI.ContractID=@CONTRACTID
												AND LI.Date=@CURRENT_DateID
							WHERE LI.BundleID=-1
                       
					      UPDATE SP

						  SET SP.Price=@CURRENT_LIST_PRICE,
						      SP.LastUpdateDate=GETDATE()
							 FROM SkuPrice SP
								WHERE SP.SKUID=@CURRENT_SKUID						
							   
				   END
								
				ELSE 
				
				BEGIN
			
				SET  @CURRENT_SKUID=NULL

				SELECT @CURRENT_SKUID=COUNT(*) 
					FROM [Sku]
								
				INSERT [Sku] (SKUID,ProductID,MarketID,UserCount,CustomerType,Date,Amount)
				SELECT @CURRENT_SKUID, ProductID,MarketID,UserCount,CustomerType,Date,Amount 
					FROM #NewBundles 
						WHERE Date=@CURRENT_DateID
						            
                INSERT SkuPrice (SKUID,Price)
				SELECT SKUID, SUM(AMOUNT)
				      FROM Sku 
					     WHERE SKUID=@CURRENT_SKUID
					      GROUP BY SKUID;

                 UPDATE SP
				    SET SP.LastUpdateDate=GETDATE()
					   FROM SkuPrice SP
					      WHERE SKUID=@CURRENT_SKUID
				  
				
				UPDATE LI
				SET LI.SKUID=S.SKUID
					FROM LineItem LI JOIN Sku S 
						ON S.ProductID=LI.ProductID 
							AND S.MarketID=LI.MarketID 
								AND S.UserCount=LI.UserCount
								   AND S.CustomerType=LI.CustomerType
									  AND LI.ContractID=@CONTRACTID 
										 AND LI.Date=@CURRENT_DateID
                       WHERE LI.BundleID=-1
	           

				END	
		
		DELETE 
			FROM #DateList 
				WHERE DateID = @CURRENT_DateID

		DROP TABLE  #NewBundles

		SET @CURRENT_DateID = NULL

		SELECT TOP 1 @CURRENT_DateID = DateID  
			FROM #DateList

		IF @@ROWCOUNT = 0 SET @CURRENT_DateID = NULL
   END 

END TRY

BEGIN CATCH
         -------------ERROR HANDLING AREA
		 DECLARE @Error_Message VARCHAR(8000)
		 SET @Error_Message = ERROR_MESSAGE() 

 
END CATCH







GO
/****** Object:  StoredProcedure [dbo].[uspSKUbold]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*

EXEC [dbo].[uspSKU] 152472
EXEC [dbo].[uspSKU] 83492
EXEC [dbo].[uspSKU] 144831
EXEC [dbo].[uspSKU] 152567
EXEC [dbo].[uspSKU] 152562

TRUNCATE TABLE [dbo].[Sku]
TRUNCATE TABLE [dbo].[SkuPrice]
UPDATE LineItem SET SKUID=NULL WHERE SKUID IS NOT NULL
SELECT * FROM [dbo].[LineItem] order by [ContractID]
SELECT * FROM [dbo].[LineItem] 
ORDER BY CONTRACTID

SELECT * FROM [dbo].[Sku]
--------------------------

EXEC [dbo].[uspSKU] 152472
EXEC [dbo].[uspSKU] 83492
EXEC [dbo].[uspSKU] 144831
EXEC [dbo].[uspSKU] 152567
EXEC [dbo].[uspSKU] 152562

------------REAL-------------
EXEC [dbo].[uspSKU] 5294
EXEC [dbo].[uspSKU] 5470
EXEC [dbo].[uspSKU] 8286
EXEC [dbo].[uspSKU] 8817
----------------------------

TRUNCATE TABLE [dbo].[Sku]
TRUNCATE TABLE [dbo].[SkuPrice]
TRUNCATE TABLE [dbo].[SkuHist]
TRUNCATE TABLE [dbo].[LineItem]
UPDATE LineItem SET SKUID=NULL WHERE SKUID IS NOT NULL
SELECT * FROM [dbo].[LineItem] order by [ContractID], BUNDLEID
SELECT * FROM [dbo].[LineItem] 
ORDER BY CONTRACTID
SELECT * FROM LINEITEM
SELECT * FROM [dbo].[Sku]

SELECT * FROM SKU

SELECT DISTINCT SKUID FROM SKU

SELECT * FROM SKUHIST

SELECT * FROM SkuPrice

SELECT DISTINCT SKUID FROM SkuPrice

EXEC [dbo].[uspProcessContracts]
-------------------------------------
SELECT CONTRACTID FROM LineItem where ContractID not in (
SELECT ContractID from [dbo].[Contract_Input_List])

select * INTO
LineItem2s from LineItem
truncate table LineItem
Insert LineItem (
            [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount])

Select 

            [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount]
 from LineItem1 where BUNDLEID<>'-1' AND  CONTRACTID IN 
 (SELECT CONTRACTID FROM [dbo].[Contract_Input_List])


*/

CREATE PROCEDURE [dbo].[uspSKUbold]
@CONTRACTID INT
AS

BEGIN TRY

DECLARE @CURRENT_DateID  DATE
DECLARE @CURRENT_SKUID INT
DECLARE @CURRENT_LIST_PRICE MONEY
DECLARE @EXISTING_SKUID INT
DECLARE @SKU_EXISTS INT
DECLARE @VALID_COUNT INT


	SELECT  DateID=DATE,AMT=SUM(AMOUNT)
		INTO #DateList 
			FROM LineItem 
			     WHERE ContractID= @CONTRACTID 
					   GROUP BY DATE
                     
	 SELECT @VALID_COUNT=COUNT(*) FROM 	#DateList		  
       
--	IF 	@VALID_COUNT>1
	
--	BEGIN	

	SET @CURRENT_DateID = NULL

	SELECT TOP 1 @CURRENT_DateID = DateID  
			FROM #DateList

	WHILE (@CURRENT_DateID IS NOT NULL)
	
	 BEGIN
				
				SELECT ProductID,MarketID,UserCount,CustomerType,Date,Amount
				INTO   #NewBundles
					FROM   LineItem
						WHERE  ContractID= @CONTRACTID 
						    AND Date=@CURRENT_DateID 
				
				SELECT 

				@SKU_EXISTS=COUNT(*),
				@EXISTING_SKUID=S.SKUID
				
				FROM #NewBundles B JOIN Sku S 
					ON B.ProductID=S.ProductID 
						AND B.MarketID=S.MarketID 
							AND B.UserCount=S.UserCount
							   AND B.CustomerType=S.CustomerType

				GROUP BY S.SKUID

				IF @SKU_EXISTS>0 
				   BEGIN 
				   
				         SET  @CURRENT_SKUID=@EXISTING_SKUID 
						 SELECT @CURRENT_LIST_PRICE=SUM(Amount) from #NewBundles B
											WHERE B.Date = @CURRENT_DateID

						 UPDATE LI

				         SET LI.SKUID=@CURRENT_SKUID

							FROM LineItem LI JOIN Sku S 
								ON S.ProductID=LI.ProductID 
									AND  S.MarketID=LI.MarketID 
										AND S.UserCount=LI.UserCount
										   AND S.CustomerType=LI.CustomerType
											 AND LI.ContractID=@CONTRACTID
												AND LI.Date=@CURRENT_DateID
							WHERE LI.BundleID=-1
                       
					      UPDATE SP

						  SET SP.Price=@CURRENT_LIST_PRICE,
						      SP.LastUpdateDate=GETDATE()
							 FROM SkuPrice SP
								WHERE SP.SKUID=@CURRENT_SKUID						
							   
				   END
								
				ELSE 
				
				BEGIN
			
				SET  @CURRENT_SKUID=NULL

				SELECT @CURRENT_SKUID=COUNT(*) 
					FROM [Sku]
								
				INSERT [Sku] (SKUID,ProductID,MarketID,UserCount,CustomerType,Date,Amount)
				SELECT @CURRENT_SKUID, ProductID,MarketID,UserCount,CustomerType,Date,Amount 
					FROM #NewBundles 
						WHERE Date=@CURRENT_DateID
						            
                INSERT SkuPrice (SKUID,Price)
				SELECT SKUID, SUM(AMOUNT)
				      FROM Sku 
					     WHERE SKUID=@CURRENT_SKUID
					      GROUP BY SKUID;

                 UPDATE SP
				    SET SP.LastUpdateDate=GETDATE()
					   FROM SkuPrice SP
					      WHERE SKUID=@CURRENT_SKUID
				  
				
				UPDATE LI
				SET LI.SKUID=S.SKUID
					FROM LineItem LI JOIN Sku S 
						ON S.ProductID=LI.ProductID 
							AND S.MarketID=LI.MarketID 
								AND S.UserCount=LI.UserCount
								   AND S.CustomerType=LI.CustomerType
									  AND LI.ContractID=@CONTRACTID 
										 AND LI.Date=@CURRENT_DateID
                       WHERE LI.BundleID=-1
	           

				END	

--END
		
		DELETE 
			FROM #DateList 
				WHERE DateID = @CURRENT_DateID

		DROP TABLE  #NewBundles

		SET @CURRENT_DateID = NULL

		SELECT TOP 1 @CURRENT_DateID = DateID  
			FROM #DateList

		IF @@ROWCOUNT = 0 SET @CURRENT_DateID = NULL
   END 

END TRY

BEGIN CATCH
         -------------ERROR HANDLING AREA
		 DECLARE @Error_Message VARCHAR(8000)
		 SET @Error_Message = ERROR_MESSAGE() 

 
END CATCH






GO
/****** Object:  StoredProcedure [dbo].[uspUPDATE_SkuName_MarketNameLong]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[uspUPDATE_SkuName_MarketNameLong]
AS
select distinct 
 SKUID,
 
 --SkuName,  
  
 --substring(Skuname,

 --charindex('-Suite-',Skuname)+7,3) AS MarketID, 

 --M.MarketName AS FormattedMarketName, 

 --substring(Skuname,1,charindex('-Suite-',Skuname)+6) AS FirstPartBeforeMarket,

 substring(Skuname,1,charindex('-Suite-',Skuname)+6)+M.MarketName+'-'+CAST(S.UserCount as varchar(10))+'-'+BTC.BusinessTypeCategory  AS NewSkuName

--S.CustomerType
 
 from dbo.sku s JOIN dbo.Market m ON 
 m.MarketID=substring(Skuname,charindex('-Suite-',Skuname)+7,3) JOIN dbo.BusinessType BT ON S.CustomerType=BT.BusinessTypeID JOIN dbo.BusinessTypeCategory BTC ON BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
 

GO
/****** Object:  StoredProcedure [dbo].[uspUpdateMarketSku]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uspUpdateMarketSku]
AS
/*
zero amount skus:

375,
5317,
8481,
11563,
11570,
27205


*/


SELECT 
DISTINCT SKUID 
INTO #TAX_SKUS
FROM SkuLG WHERE SkuName LIKE '%Appraisal/Valuation/Tax Appeal%'
AND Amount>0

SELECT 
DISTINCT SKUID 
INTO #Broker_SKUS
FROM SkuLG WHERE SkuName LIKE '%Brokerage/Consultants%'
AND Amount>0


select distinct skuid
into #State_Skus
 from SkuLG where SKUID in (
SELECT SkuID from #Broker_SKUS
union
SELECT SkuID from #TAX_SKUS)
AND MarketID IN (
SELECT [MarketID] FROM [dbo].[Market2] WHERE [StateFlg]=1)


SELECT 

LineItemID 
INTO #Problem_LineItems
FROM [dbo].[SkuBridge] WHERE SKUID IN (SELECT SKUID FROM #State_Skus)

SELECT  LI.[SiteLocationID], L.SiteAddress, PL.LineItemID 
into #FixedAddr2
FROM [DCSQLDEV104].Enterprise.[dbo].[LineItem] LI JOIN
(
SELECT distinct ID.SiteAddress, ID.LineItemID from [DCSQLDEV104].Enterprise.[dbo].InvoiceDetail ID 
--where ID.LineItemID=LI.LineItemID
) L ON LI.LineItemID=L.LineItemID
JOIN #Problem_LineItems PL ON PL.LineItemID=LI.LineItemID


select distinct LI.LineItemID,L.LocationID,A.City 
INTO #FixedAddr3
FROM [DCSQLDEV104].Enterprise.[dbo].[LineItem] LI
JOIN [DCSQLDEV104].Enterprise.[dbo].Location L on LI.SiteLocationID=L.LocationID 
LEFT JOIN [DCSQLDEV104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID 
where LI.LineItemID  in  (SELECT LineItemID FROM #Problem_LineItems)
-------------------------------------------------------------------------

UPDATE LG
SET LG.SkuName=LG.SkuName+'('+A.City+')'
from [dbo].[SkuLG] LG JOIN [dbo].[SkuBridge] SB ON
LG.SKUID=SB.SKUID JOIN #FixedAddr3 A on SB.LineItemID=A.LineItemID
WHERE (LG.SkuName NOT LIKE '%Broker%' OR LG.SkuName NOT LIKE '%Tax%')
--where SB.LineItemID in (Select distinct LineItemID from #FixedAddr3)
--------------------------------------------------------------------

UPDATE P
SET P.[SkuName]=S.SkuName
from SkuLG S JOIN SkuPriceLG P on S.SKUID=P.SKUID
where P.SKUID IN (Select SkuID from #State_Skus)
AND (S.SkuName NOT LIKE '%Broker%' OR S.SkuName NOT LIKE '%Tax%')
------------------------------------------------------------------

DROP TABLE #State_Skus;
DROP TABLE #TAX_SKUS;
DROP TABLE #Broker_SKUS;
DROP TABLE #FixedAddr2;
DROP TABLE #FixedAddr3;
DROP TABLE #Problem_LineItems;


GO
/****** Object:  StoredProcedure [dbo].[uspUpdateMarketSkuNational]    Script Date: 9/14/2017 9:43:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uspUpdateMarketSkuNational]
AS


SELECT distinct SKUID 
INTO #National_Skus
FROM SkuLG WHERE SkuName LIKE '%National Subscription%'


SELECT 
LineItemID 
INTO #Problem_LineItems
FROM [dbo].[SkuBridge] WHERE SKUID IN (SELECT SKUID FROM #National_Skus)

select distinct LI.LineItemID,L.LocationID,A.City 
INTO #FixedAddr3
FROM [DCSQLDEV104].Enterprise.[dbo].[LineItem] LI
JOIN [DCSQLDEV104].Enterprise.[dbo].Location L on LI.SiteLocationID=L.LocationID 
LEFT JOIN [DCSQLDEV104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID 
where LI.LineItemID  in  (SELECT LineItemID FROM #Problem_LineItems)
-------------------------------------------------------------------------

UPDATE LG
SET LG.SkuName=LG.SkuName+'('+A.City+')'
from [dbo].[SkuLG] LG JOIN [dbo].[SkuBridge] SB ON
LG.SKUID=SB.SKUID JOIN #FixedAddr3 A on SB.LineItemID=A.LineItemID
--where SB.LineItemID in (Select distinct LineItemID from #FixedAddr3)
--------------------------------------------------------------------

UPDATE P
SET P.[SkuName]=S.SkuName
from SkuLG S JOIN SkuPriceLG P on S.SKUID=P.SKUID
where P.SKUID IN (Select SkuID from #National_Skus)
------------------------------------------------------------------

DROP TABLE #National_Skus;
DROP TABLE #FixedAddr3;
DROP TABLE #Problem_LineItems;


GO
