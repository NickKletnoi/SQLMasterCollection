-------------------------------------------------------------------------------------------------
--------------------------- Complete SQL for the Legal Report -----------------------------------
-------------------------------------------------------------------------------------------------

SELECT 
CustomerName as CustomerHQ , 
[201607] as '2016-JUL',
[201608] as '2016-AUG',
[201609] as '2016-SEPT',
[201610] AS '2016-OCT', 
[201611] as '2016-NOV',
[201612] AS '2016-DEC', 
[201701] AS '2017-JAN',
[201702] AS '2017-FEB',
[201703] AS '2017-MAR',
[201704] AS '2017-APR',
[201705] AS '2017-MAY',
[201706] AS '2017-JUN'
FROM   
(SELECT N.[InvoiceAmount] as Amount,N.[ChargeYearMonth] as YearMonth , C.CustomerName as CustomerName
FROM [cube].[F_ProductRevenueNAV] N JOIN [cube].[D_Customer] C ON N.LocationID=C.LocationID JOIN [cube].[D_Product] P
ON N.SKUID=P.SKUID 
where P.ProductCategory='Apartments'
) p  
PIVOT  
(  
SUM(Amount)  
FOR YearMonth IN  
( [201607],[201608],[201609],
  [201610],[201611], [201612], 
  [201701],[201702],[201703],
  [201704],[201705],[201706])  
) AS pvt  
ORDER BY pvt.CustomerName;  
-------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
