select 
[InvoiceYear],
sum([TotalMonthlyPrice]) as TotalMonthlyPrice,
sum([SalesTaxAmount]) as SalesTaxAmount,
sum([DiscountAmount]) as DiscountAmount
from [dbo].[InvoiceDetail]
group by [InvoiceYear]
order by  [InvoiceYear]

--$36,262,642.34675000000000000000
--$268,127,822.17020900000000000000
--$5,522,737.44787700000000000000
--$24,329,307.46238683787227264458


--226,324,233.8

select count(*) from [dbo].[InvoiceDetail]
where [InvoiceYear]=2017

--------------------------

select count(*) from [dbo].[InvoiceDetail]
where [InvoiceYear]=2017
------------------

SELECT 
      
        SUM([Amount])
      , SUM([Amount Including VAT])
      
  FROM [NavisionDB260].[dbo].[RIG$Sales Invoice Line]

  WHERE year([Posting Date])=2017 
  -----------------------------------

  SELECT 
      
       count(*)
      
  FROM [NavisionDB260].[dbo].[RIG$Sales Invoice Line]

  WHERE year([Posting Date])=2017 
  --------------------------------------



