select count(*) from cube.F_ProductRevenueNAV
--1,911,361
select count(distinct InvoiceNumber) from cube.F_ProductRevenueNAV
select count(distinct contractid) from cube.F_ProductRevenueNAV

-- 175582 

select * from [DCSQLPRD104].Enterprise.dbo.LineItem where 
lineitemid in (3005722,3005740)


ContractID=175582;
select * from [DCSQLPRD104].Enterprise.dbo.Contract where ContractID=175582;

select min([BillingStartDate]),max([BillingStartDate])  from [cube].[F_ProductRevenueENT]
--- max >> 2017-06-07
------------------------------------------------------------------------------------------
--3005722	9563
--3005740	9563

select * from 


select count(*) from dbo.SkuBridge

select * from dbo.SkuBridge where 
LineItemID IN (
3005744,
3005745,
3005718,
3005719,
3005720,
3005721,
3005722,
3005723,
3005724,
3005725,
3005726,
3005727,
3005728,
3005729,
3005730,
3005731,
3005732,
3005733,
3005736,
3005737,
3005738,
3005739,
3005740,
3005741,
3005742,
3005743,
3005746,
3005747,
3005748,
3005749,
3005750,
3005751,
3005752,
3005753,
3005754,
3005755,
3005756,
3005757,
3005758,
3005759,
3005760,
3005761,
3005762,
3005763,
3005764,
3005765
);
--------------------------------------------------------------------------
--Start the skuing logic for picking up the values of the system;---------
--this is what needs to be done in order to provide the best possible-----
--value for what you have;------------------------------------------------
--------------------------------------------------------------------------
/*
----------------------------------------------------------------------------------------
start at least the broad outlines of the incremental logic for you to incorporate
this will just be the case for each and every  value that is needed for what we have;
----------------------------------------------------------------------------------------
*/

select * from [cube].[D_Product] 



SELECT 
C.CustomerName,[ChargeYearMonth],P.ProductCategory,COUNT(*) AS CNT
FROM        [cube].[F_ProductRevenueNAV] N LEFT JOIN 
            [cube].[D_Product]  P ON N.SKUID=P.SKUID LEFT JOIN 
			[cube].[D_Customer] C ON N.LocationID=C.LocationID
WHERE P.ProductCategory IN ('Apartments','Suite')
GROUP BY C.CustomerName,[ChargeYearMonth],P.ProductCategory
ORDER BY COUNT(*) DESC, C.CustomerName
----------------------------------------------------