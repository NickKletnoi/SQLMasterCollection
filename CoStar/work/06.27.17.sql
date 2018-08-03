select distinct ContractID from lineitem  where SKUID=-1 

select sum([TotalMonthlyPrice]) from [cube].[F_ProductRevenue2] where SKUID=-1 ;
select sum([TotalMonthlyPrice]) from  [cube].[F_ProductRevenue2] where SKUID is not null;

--963,083,422.32
--963,083,422.32

delete from [cube].[F_ProductRevenue2] where SKUID=-1

---237,849,105.036
--963,083,422.32

select sum([TotalMonthlyPrice]) from [cube].[F_ProductRevenue2] WHERE SKUID IS NOT NULL
--select sum([DiscountAmount]) from [cube].[F_ProductRevenue2];
----------------
--963,083,422.32
--963,083,422.32
----------------

--963,083,422.32

select * from [cube].[F_ProductRevenue2]

update [cube].[F_ProductRevenue2] set SKUID=-1 where SKUID is null;

select SKUID,* from [cube].[F_ProductRevenue2]

select * from [bug].[SkuExists]

select distinct SKUID from [cube].[F_ProductRevenue2] where SKUID<>-1 and SKUID IS NOT NULL
--------------------------------------------------------------
SELECT DISTINCT [SKUID] FROM [cube].[F_ProductRevenue];
SELECT DISTINCT  [ContractID] FROM [cube].[F_ProductRevenue];
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

