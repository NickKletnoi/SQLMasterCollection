select * from [revenue].[SkuPrice] where SkuName is not null and price>1

update R
set R.AvgPrice=NULL from revenue.SkuPrice R where R.AvgPrice is not null;
--------
update R
set R.AvgPrice=PP.[AvgInvoicePriceAmt] from revenue.SkuPrice R JOIN [cube].[F_ProductPrice] PP
ON R.SKUID=PP.SKUID 

where R.AvgPrice is not null;
--------------------------------------
select * from revenue.SkuPrice

update R
set R.Price=[AvgInvoicePriceAmt]*1.31 from [revenue].[SkuPrice] R where [AvgInvoicePriceAmt] is not null;

select * from revenue.SkuPrice where SkuName is not null and [AvgInvoicePriceAmt]>20

select * from [dbo].[SkuListPriced]

update R
set R.[ListPrice]=SLP.ListPrice from revenue.SkuPrice R JOIN [dbo].[SkuListPriced] SLP ON R.SKUID=SLP.SKUID

 where R.[ListedPrice]  is  null;


 select * from revenue.SkuPrice where(ListPrice<>'0.00')


 update r
 set r.LastUpdatedate= CONVERT(VARCHAR(10),GETDATE(),102) 
 from [revenue].[SkuPrice] r where LastUpdateDate is null
 
 select * from revenue.SkuPrice where SkuName is not null and ListPrice<>'0.00'
 
 
 SELECT CONVERT(VARCHAR(10),GETDATE()
 ,102)


 update r
 set r.GLAccountName='3032' from [revenue].[SkuPrice] r where GLAccountName is null;

 select * from revenue.SkuPrice where SkuName is not null 
 ----------------------
 ----------------------
 ----------------------
  select * from revenue.SkuPrice where SkuName is not null ;
  --and 
  --[AvgInvoicePriceAmt]>20
  --and ListPrice<>'0.00'


Update r
set r.ProductCategory='REA' from revenue.SkuPrice r 
 --select * from revenue.SkuPrice 
  where r.SkuName like '%REA%' and r.SKUID NOT IN (
933,
1636,
2043,
2682,
2932,
3566,
3659,
4092,
4568,
4667,
4699,
4795,
27706,
27807,
27867,
28053,
28221,
28323,
28393,
28712,
29224,
26885,
7569,
19249,
29130
  );
  ---------------------------------

  select * from revenue.SkuPrice where SkuName is not null and AvgInvoicePriceAmt>20
  --ListPrice<>0.00

  select * from revenue.SkuPrice where SkuName like '%-PPR%' 
  
  and SKUID not in (71648)


  Update r
set r.ProductCategory='PPR' from revenue.SkuPrice r 
  where r.SkuName like '%-PPR%' 
  --------------------------------------------------------------

  select count(*) from revenue.SkuPrice
  select count(*) from dbo.SkuPrice

  select * 
  INTO dbo.SkuPrice
  from revenue.SkuPrice
  ----------------------
  -----------------------------------------------------------
  -----------------------------------------------------------
    select * from revenue.SkuPrice where SkuName is not null and AvgInvoicePriceAmt>20 and SkuName like '%Lender%'
  --ListPrice<>0.00
  ---------------------------
  select * from 
  ---------------------------------------------
  ---16553-Suite-(SQF_bucket(1-20))-OwnerPMC
  --------------------------------------------
  ---16489-Suite-(#ofSitesBucket(1-9))-Retailer&CorporateREPricing
  -------------------------------------------


	
