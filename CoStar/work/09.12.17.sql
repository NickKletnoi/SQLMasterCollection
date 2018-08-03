SELECT 
C.NAME AS COLUMN_NAME,
T.NAME AS TABLE_NAME 
	FROM 
[DCSQLPRD104].EnterpriseSub.SYS.columns C JOIN 
[DCSQLPRD104].EnterpriseSub.SYS.TABLES T 
	ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN 
[DCSQLPRD104].EnterpriseSub.SYS.schemas S 
	ON T.[SCHEMA_ID]=S.[schema_id]
	WHERE
--C.NAME like '%Sales%'
T.NAME like 'SalesTerritory' 
--AND 
--	ORDER BY C.COLUMN_ID
	------------------------------------
------------------------------------------------------------
select * from [DCSQLPRD104].Enterprise.dbo.SalesFunnel
-------------------------------------------------------------
-------------------------------------------------------------
select * from [DCSQLPRD104].Enterprise.dbo.CostarDepartment;
select * from [DCSQLPRD104].Enterprise.dbo.Contact;
select * from [DCSQLPRD104].Enterprise.dbo.SalesTerritoryArea;
select * from [DCSQLPRD104].Enterprise.dbo.rptBookofBusinessBySalesAESnapShot
select top 10 * from [DCSQLPRD104].Enterprise.dbo.SalesUnit;
--------------------------------------------------------------------
--------------------------------------------------------------------
SELECT TOP 10 * ----------------------------------------------------
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Customer];---
---------------------------------------------------------------------
---------------------------------------------------------------------
--AEContactId
Create proc [dbo].[uspCREATE_Reps]
AS
select C.ContactID, ST.SalesTerritoryDesc, C.FirstName, C.LastName 
INTO cube.D_Reps
from [DCSQLPRD104].Enterprise.dbo.SalesTerritory ST LEFT JOIN
               [DCSQLPRD104].Enterprise.dbo.Contact C ON C.ContactID=ST.AEContactID
--------------------------------------------------------------------------------------------

delete from [cube].[D_Reps] where ContactID is null;

select * from 	[cube].[D_Reps]		
-------------------------------------------------------------------------------------------
alter table [cube].[F_ProductRevenueENT] add [DiscountAmountAdj] numeric(38,20) null;
alter table [cube].[F_ProductRevenueENT] add [GrossMonthlyPriceAdj] numeric(38,20) null;
alter table [cube].[F_ProductRevenueENT] add [MonthlyPriceAdj] numeric(38,20) null;
alter table [cube].[F_ProductRevenueENT] add [SalesTaxAmountAdj] numeric(38,20) null;
alter table [cube].[F_ProductRevenueENT] add [TotalMonthlyPriceAdj] numeric(38,20) null;
alter table [cube].[F_ProductRevenueENT] add [ListedAmountAdj] numeric(38,20) null;
------------------------------------------------------------------------------------------

drop table #TempStubs

select 
[InvoiceDetailID],
[LineItemID],
[ContractID],
[ChargeYearMonth], 
LEFT(ChargeYearMonth,4)+ CAST((CAST(RIGHT(ChargeYearMonth,2) AS INT)+1) as VARCHAR(2)) as NewChargeYearMonth,
[StubAmount]
from #TempStubs


Into #TempStubs
from [cube].[F_ProductRevenueENT]
where [StubAmount]>0
--2,373,126
--2,373,126
select count(*) from [cube].[F_ProductRevenueENT]

select * from #TempStubs
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

