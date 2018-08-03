SELECT 
CustomerName as CustomerHQ ,  --- [BILL_TO_CUSTOMER_NAME]
[201607] as '2016-JUL', ---use RULE_START_DATE 
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
--INTO #TempApts
FROM   
(SELECT
N.[UNIT_SELL_PRICE] as InvoicedAmount,
CAST(YEAR(RULE_START_DATE) as char(4))+
CASE CAST(MONTH(RULE_START_DATE) as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
				   WHEN '3' THEN '03'
				   WHEN '4' THEN '04'
				   WHEN '5' THEN '05'
				   WHEN '6' THEN '06'
				   WHEN '7' THEN '07'
				   WHEN '8' THEN '08'
				   WHEN '9' THEN '09'
ELSE CAST(MONTH(RULE_START_DATE) as char(2)) END AS YearMonth , 
N.BILL_TO_CUSTOMER_NAME as CustomerName
--L.LocationName as CustomerName
FROM [dbo].[Invoice_Feed] N 
--JOIN [dbo].[Location] L ON N.CUSTOMER_ID=L.ParentLocationID
WHERE N.UNBILLED_AR_SEG4='Apartments'
) p  
PIVOT  
(  
SUM(InvoicedAmount)  
FOR YearMonth IN  
( [201607],[201608],[201609],
  [201610],[201611], [201612], 
  [201701],[201702],[201703],
  [201704],[201705],[201706])  
) AS pvt  
ORDER BY pvt.CustomerName;  
-------------------------------------------------------------------------

--select sum([UNIT_SELL_PRICE]) from [dbo].[Invoice_Feed] where UNBILLED_AR_SEG4='Apartments'
---279,915,984
--133,970,437

