---------------------------------------------------------------------------------
INSERT [bkp].[Active_SOFile] ([ContractID],[LineItemID],[StatusFlg],[AuditDate])
SELECT ContractID, LineItemID, 'P',GETDATE() FROM Staging..LineItem LI1 where LI1.ContractID IN (
SELECT DISTINCT LI.Contractid  FROM
dbo.SkuBridge SB JOIN Staging..LineItem LI ON LI.LineItemID=SB.LineItemID 
WHERE LI.ContractID NOT IN (SELECT CONTRACTID FROM dbo.Active_SOFile) EXCEPT 
(SELECT CONTRACTID FROM dbo.ProcessedContracts where StatusFlg='I') )
-----------------------------------------------------------------------------------
INSERT [dbo].[Active_SOFile] ([ContractID],[LineItemID],[StatusFlg],[AuditDate])
SELECT ContractID, LineItemID, 'P',GETDATE() FROM Staging..LineItem LI1 where LI1.ContractID IN (
SELECT DISTINCT LI.Contractid  FROM
dbo.SkuBridge SB JOIN Staging..LineItem LI ON LI.LineItemID=SB.LineItemID 
WHERE LI.ContractID NOT IN (SELECT CONTRACTID FROM dbo.Active_SOFile) EXCEPT 
(SELECT CONTRACTID FROM dbo.ProcessedContracts where StatusFlg='I') )
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
select count(distinct contractid) from dbo.Active_SOFile
select count(distinct contractid) from Staging..LineItem where LineItemStatusID=1
select count(distinct ContractID) from dbo.Active_SOFile
select count(*) from bkp.Active_SOFile
-------------------------------------------------------------------------------------
SELECT distinct contractid 
FROM Staging..LineItem WHERE ContractID not in (
SELECT distinct contractid from dbo.ProcessedContracts) 
AND LineItemStatusID=1
-------------------------------------------------------------------------------------
--BETWEEN ---------------------------------------------------------------------------
select DATEADD(DAY,1,EOMONTH(getdate(),-1)) as FirstDayOfMonth
select  EOMONTH(getdate()) as LastDayOfMonth	
-------------------------------------------------------------------------------------
select * from [stg].[Contract_Input_List]
truncate table [stg].[Contract_Input_List]
----------------------------------------
select * into [rev].[Active_SOFile] from [dbo].[Active_SOFile];
select * into [rev].[ProcessedContracts] from [dbo].[ProcessedContracts];
select * into [rev].[Sku] from [dbo].[Sku];
select * into [rev].[SkuBridge] from [dbo].[SkuBridge];
select * into [rev].[SkuPrice] from [dbo].[SkuPrice];
select * into [rev].[StraightLineContracts] from [dbo].[StraightLineContracts];
select * into [rev].[StraightLineDiscountContracts] from [dbo].[StraightLineDiscountContracts];
------------------------------------------
select * from [dbo].[SSIS_Configurations];
------------------------------------------
/* -- */










