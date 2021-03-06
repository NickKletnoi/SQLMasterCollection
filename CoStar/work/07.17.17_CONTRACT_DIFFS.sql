/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [YearMonth]
      ,[YearMonthName]
      ,[YearQuarterName]
  FROM [CoStar].[cube].D_PeriodYearMonth
  order by [YearMonth] desc


  alter table [cube].[D_PeriodYearMonth] add YearQuarterSort int null;
  alter table [cube].[D_PeriodYearMonth] add [Year] int null;
  alter table [cube].[D_PeriodYearMonth] add YearSort int null;

  select * 
  into [cube].[D_PeriodYearMonth1]
  from [cube].[D_PeriodYearMonth]
  ---------------------------------------------------
  truncate table [cube].[D_PeriodYearMonth]
  select * from 
  ----------------------------------------------------
  select * from [stub].[StubAmountbyMonthYear];
  select top 10 * from [stub].[RawInputInvoiceDetail];
  -------------------------------------------------------


  select count(distinct [ContractID]) from [cube].[F_ProductRevenueNAV];
    select count(distinct [ContractID]) from [cube].[F_ProductRevenueENT];

select count(*) from [revenue].[SkuBridge]--610,490
select count(*) from [revenue].[Sku]---137,237
select count(*) from [revenue].[SkuPrice]---14,882



select 
distinct ContractID 
INTO diff.Contracts
from [cube].[F_ProductRevenueENT] where ContractID not in (
select distinct ContractID from [cube].[F_ProductRevenueNAV]
);
---------------------------------------------------------------------
select SP.ProcessingTierflg,[ChargeYear],[ChargeMonth],
sum([GrossMonthlyPrice])-sum([SalesTaxAmount])-sum([DiscountAmount]) as Total
from [cube].[F_ProductRevenueENT] PR JOIN [diff].[Contracts] C on PR.ContractID=C.ContractID JOIN
[revenue].[SkuPrice] SP ON PR.SKUID=SP.SKUID 
group by [ChargeYear],[ChargeMonth],SP.ProcessingTierflg
-----------------------------------------------------------------------