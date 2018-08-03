
/*
-----------------------------------------------
-------- These are Tryout Contracts ----------
----------------------------------------------

184123
184363
192837
195669

*/

select P.ProductDesc, * from Staging..LineItem LI LEFT JOIN Staging..Product P  ON LI.ProductID=P.ProductID
where LI.ContractID=184123 order by P.ProductID
------------------------------------------------
select count(*) ASO_bkp from [bkp].[Active_SOFile];
select count(*) ASO_dbo from [dbo].[Active_SOFile];
------------------------------------------
select count(*) PC_bkp from [bkp].[ProcessedContracts];
select count(*) PC_dbo from [dbo].[ProcessedContracts];
----------------------------------------------
select count(*) S_bkp from [bkp].[Sku];
select count(*) S_dbo from [dbo].[Sku];
-----------------------------------------------
select count(*) SB_bkp from [bkp].[SkuBridge];
select count(*) SB_dbo from [dbo].[SkuBridge];
-----------------------------------------------
select count(*) SP_bkp from [bkp].[SkuPrice];
select count(*) SP_dbo from [dbo].[SkuPrice];
-----------------------------------------------
select count(*) SLC_bkp from [bkp].[StraightLineContracts];
select count(*) SLC_dbo from [dbo].[StraightLineContracts];
------------------------------------------------
select count(*) SLDC_bkp from [bkp].[StraightLineDiscountContracts];
select count(*) SLDC_dbo from [dbo].[StraightLineDiscountContracts];
-------------------------------------------------
select count(*) vwSLC from vwStraightLineContracts;
-------------------------------------------------
select count(*) from ProcessedContracts where StatusFlg<>'I'
------------------------------------------------------------
select count(distinct contractid) from dbo.Active_SOFile;
------------------------------------------------------------
------------------------------------------------------------

drop table [rev].[Active_SOFile];
drop table [rev].[Sku];
drop table [rev].[SkuBridge];
drop table [rev].[SkuPrice];
drop table [rev].[StraightLineContracts];
drop table [rev].[StraightlineDiscountContracts];
---------------------------------------------------

select * into [rev].[Active_SOFile] from [dbo].[Active_SOFile]; 
select * into [rev].[Sku] from  [dbo].[Sku];
select * into  [rev].[SkuBridge] from dbo.SkuBridge;
select * into rev.SkuPrice from dbo.SkuPrice;
select * into rev.StraightlineContracts from dbo.StraightLineContracts;
select * into rev.StraightlineDiscountContracts from dbo.StraightLineDiscountContracts;
--------------------------------------------------------------------------------
