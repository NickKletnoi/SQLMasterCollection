select count(*) Total_LineItems from [cube].[F_ProductRevenue];
select count(distinct [ContractID]) as Distinct_Contracts from [cube].[F_ProductRevenue];
select sum([InvoiceAmount]) total_dollars from [cube].[F_ProductRevenue];
select sum([ContractAmount]) total_Contract_dollars from [cube].[F_ProductRevenue];
select count( distinct [SKUID]) Distinct_Products from [cube].[F_ProductRevenue];

--1,062,660,887.84

/*
Here are the totals : 06.16.16 to 06.16.17 ( full 12 months )

1. Total number of  LineItems :        4,153,214 
2. Total Distinct Contracts:              50,669
3. Total Revenue Dollars:         $1,062,660,887.84
3.1 Total Revenue Dollars (Contract) 930,357,406.47
4. Total number of distinct Skus:           8411
*/

select 
R.ContractID,
R.SKUID, 
R.[PostingYearMonth],
Cast(AVG([ContractAmount]) as money) as Contract_Amt
INTO cube.AvgPriceFact
from [cube].[F_ProductRevenue] R JOIN [cube].[F_ProductPrice] P ON R.SKUID=P.SKUID
group by 
R.ContractID,
R.SKUID, 
R.[PostingYearMonth]
--------------------------
select SKUID, CAST(AVG(
ISNULL(Contract_Amt,0)
) as money)  as AvgPrice 
INTO cube.AvgPriceFact2
from cube.AvgPriceFact
GROUP By SKUID
--------------------------
update FP
SET FP.Price=APF.AvgPrice
FROM [cube].[F_ProductPrice] FP 
JOIN [cube].[AvgPriceFact2] APF ON FP.SKUID=APF.SKUID
---------------------------
---------------------------
---------------------------
select distinct [PostingYearMonth] from [cube].[F_ProductRevenue]
alter table [revenue].[SkuPrice] add AvgPrice money null;


select 
SUM([InvoiceAmount]) as Inv_Amt,
SUM([ContractAmount]) as Cont_Amt,
SUM(P.Price) as List_Amt
from [cube].[F_ProductRevenue] R JOIN [cube].[F_ProductPrice] P on R.SKUID=P.SKUID
--ere R.PostingYearMonth='2016-Jun'
--------------------------------
select * from [cube].[F_ProductPrice]
select distinct [PostingYearMonth] from [cube].[F_ProductRevenue]
--------------------------------
-----------------
--884,677,062.65
--763,997,867.55
--909,776,620.61
-----------------
select sum([InvoiceAmount]) from [cube].[F_ProductRevenue]

---1,062,660,887.84

select * from [cube].[F_ProductPrice] where Price>4

select count(*) from [cube].[F_ProductPrice];
select count(distinct skuid) from [cube].[F_ProductPrice];

select * from [revenue].[Sku] where SKUID=28212

select * from [cube].[F_ProductPrice] where SKUID=28212
