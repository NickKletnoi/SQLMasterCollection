------------------------------------------------------------------------------------------
select * 
into Staging..Sales_Order_Feed1
from Staging..Sales_Order_Feed; -- 10.19.2017

select *  
into Staging..Credit_Memo_Feed1
from Staging..Credit_Memo_Feed; -- 10.19.2017


select * 
into Staging..Invoice_Feed1
from Staging..Invoice_Feed;     -- 10.19.2017
------------------------------------------------------------------------------------------
--27,737 SO (RevPro ) 10.19.2017
--36,056 SO (NAV )  10.19.2017 
------------------------------------------------------------------------------------------
--29,622 (RevPro ) 10.19.2017
--48,834 (Nav) 10.19.2017
select distinct INVOICE_NUMBER  from Staging..Invoice_Feed1 -- 29,622 INV (RevPro ) for 10.19.2017
select distinct Sales_Order_ID from Sales_Order_Feed
select distinct Sales_Order_ID from Staging..Credit_Memo_Feed1 -- 1521
------------------------------------------------------------------------------------------
select distinct ContractID from 

SELECT distinct 
SIL.[Document No_] AS InvoiceID  ---48,834
--SIL.[Contract ID] AS ContractID
--INTO 
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] SIL 
 WHERE SIL.[Posting Date] BETWEEN '2017-10-01 00:00:00.000' AND '2017-10-19 00:00:00.000'
 ------------------------------------------------------------------------------------------

 
SELECT distinct 
SIL.[Contract ID] AS ContractID
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] SIL 
 WHERE SIL.[Posting Date] BETWEEN '2017-10-01 00:00:00.000' AND '2017-10-30 00:00:00.000'
 AND SIL.[Contract ID] NOT IN (SELECT DISTINCT [ContractID] FROM [dbo].[Active_SOFile])
 AND SIL.[Contract ID] NOT IN  (SELECT DISTINCT Sales_Order_ID from Staging..Sales_Order_Feed1)
 --------------------------------------------------------------------------------------------

 select top 10 * from [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line]

 --[RIG$Sales Cr_Memo Line]

 -------------

 SELECT distinct 
SIL.[Contract ID] AS ContractID  --114
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Cr_Memo Line] SIL 
 WHERE SIL.[Posting Date] BETWEEN '2017-10-01 00:00:00.000' AND '2017-10-30 00:00:00.000'
 --AND SIL.[Contract ID] NOT IN (SELECT DISTINCT [ContractID] FROM [dbo].[Active_SOFile])



--[dbo].[RIG$Sales Cr_Memo Line]