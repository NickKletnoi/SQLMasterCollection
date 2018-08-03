UPDATE SB
SET SB.SKUID=39000
--select LI.ContractID,SB.LineItemID,SB.SKUID,LI.BundleID,P.ProductDesc
From dbo.SkuBridge SB 
JOIN Staging..LineItem LI on SB.LineItemID=LI.LineItemID LEFT JOIN apt.Product P ON P.ProductID=LI.ProductID
where P.SKUID=39000 and LI.ContractID IN (select distinct contractid from tst.ContractReprocessCandidatesNegative1)
--LI.ContractID=106431 

select distinct Li.ContractID 
from dbo.SkuBridge SB JOIN Staging..LineItem LI ON SB.LineItemID=LI.LineItemID where SKUID=-1


select distinct contractid from dbo.Active_SOFile

drop table [rev].[Active_SOFile];
drop table [rev].[ProcessedContracts];
drop table [rev].[Sku];
drop table [rev].[SkuBridge];
drop table [rev].[SkuPrice];
drop table [rev].[StraightlineContracts];
drop table [rev].[StraightlineDiscountContracts];
--------------------------------------------------------------
select * into [rev].[Active_SOFile] from [dbo].[Active_SOFile];
select * into [rev].[ProcessedContracts] from dbo.ProcessedContracts;
select * into [rev].[Sku] from dbo.Sku;
select * into [rev].[SkuBridge] from dbo.SkuBridge;
select * into [rev].[SkuPrice] from dbo.SkuPrice;
select * into [rev].[StraightlineContracts] from dbo.StraightLineContracts;
select * into [rev].[StraightlineDiscountContracts] from dbo.StraightLineDiscountContracts;