USE [CoStar]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_byHQ]    Script Date: 9/6/2017 2:41:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC [dbo].[usp_CreateReportForLegal_byHQ]


ALTER proc [dbo].[usp_CreateReportForLegal_byHQ]
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
INTO RevenuRptLegal66
FROM dbo.TempApts66 
WHERE TOTAL>0
ORDER BY TOTAL DESC;



