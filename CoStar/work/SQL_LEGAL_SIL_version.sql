USE [Staging]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateReportForLegal_InvFeed]    Script Date: 8/22/2017 3:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

EXEC [dbo].[usp_CreateReportForLegal_SIL]


ALTER proc [dbo].[usp_CreateReportForLegal_SIL]
AS

IF OBJECT_ID('tempdb..TempApts1', 'U') IS NOT NULL DROP TABLE tempdb..TempApts1;
IF OBJECT_ID('tempdb..TempApts2', 'U') IS NOT NULL DROP TABLE tempdb..TempApts2;


SELECT 
CustomerName as CustomerHQ ,  --- 
CustomerID as CustomerNumber,
ParentCompanyLocID as CustomerParentID,
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
--[201701] AS '2017-JAN',
--[201702] AS '2017-FEB',
--[201703] AS '2017-MAR',
--[201704] AS '2017-APR',
--[201705] AS '2017-MAY',
--[201706] AS '2017-JUN'
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
IL.[Bill-to Customer No_] as [ParentCompanyLocID],
IH.[Bill-to Name] as [ParentCompanyName]
FROM [dbo].[RIG$Sales Invoice Line] IL
  INNER JOIN [dbo].[RIG$Sales Invoice Header] IH ON IL.[Document No_] = IH.No_
  WHERE [Business Unit Code] IN
  ('AFPAK','AFPLUS','AFPRO','AFPROODD','APN','APT','APT001','APT002','APT003', 
'APT004','APT005','APTSDIAMDA','APTSDIAMON','APTSGOLD','APTSGOLDA','APTSMYMEA','APTSMYMED',
'APTSPHTRTK','APTSPLATIN','APTSPLATNA','APTSSILVER','APTSSILVRA','APTSVDRSHT')
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
  --[201701],[201702],[201703],
  --[201704],[201705],[201706]  
  )  
) AS pvt  
ORDER BY pvt.CustomerName;  
-----------------------------------------------------------------

SELECT 
CustomerParentID, 
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
SUM([2016-JAN])+ SUM([2016-FEB])+SUM([2016-MAR])+SUM([2016-APR])+SUM([2016-MAY])+SUM([2016-JUN])+SUM([2016-JUL])+SUM([2016-AUG])+SUM([2016-SEPT])+SUM([2016-OCT])+SUM([2016-NOV])+SUM([2016-DEC]) AS TOTAL
--SUM([2017-JAN]) AS JAN_2017,
--SUM([2017-FEB]) AS FEB_2017,
--SUM([2017-MAR]) AS MAR_2017,
--SUM([2017-APR]) AS APR_2017,
--SUM([2017-MAY]) AS MAY_2017,
--SUM([2017-JUN]) AS JUN_2017
INTO #TempApts2
from #TempApts1 
group by CustomerParentID
--------------------------------------------------------

--SELECT * FROM #TempApts2

---------------------------------------------------------

ALTER TABLE #TempApts2 ADD CustomerParentName varchar(150) null;

--------------------------------------------------------------------

update T
SET T.CustomerParentName=L.LocationName 
from #TempApts2 T JOIN Location L on T.CustomerParentID=L.ParentLocationID
--------------------------------------------------------------------------

select * from #TempApts2 order BY TOTAL
--SUM([2016-JAN])+ SUM([2016-FEB])+SUM([2016-MAR])+SUM([2016-APR])+SUM([2016-MAY])+SUM([2016-JUN])+SUM([2016-JUL])+SUM([2016-AUG])+SUM([2016-SEPT])+SUM([2016-OCT])+SUM([2016-NOV])+SUM([2016-DEC])
----------------------------------------------------------------------------

