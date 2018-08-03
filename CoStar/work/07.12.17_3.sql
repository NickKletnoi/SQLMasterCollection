 

declare @table varchar(50)='bug.SkuExists'
 
 select 
 
  substring(@table, charindex('.',@table)+1,ABS(
  
  charindex('.',@table)
  
  -charindex('.',@table)-1))
;
------------------------------------------------------------------------
 select distinct 
 SKUID,
 
 --SkuName,  
  
 --substring(Skuname,

 --charindex('-Suite-',Skuname)+7,3) AS MarketID, 

 --M.MarketName AS FormattedMarketName, 

 --substring(Skuname,1,charindex('-Suite-',Skuname)+6) AS FirstPartBeforeMarket,

 substring(Skuname,1,charindex('-Suite-',Skuname)+6)+M.MarketName+'-'+CAST(S.UserCount as varchar(10))+'-'+BTC.BusinessTypeCategory  AS NewSkuName

--S.CustomerType
 INTO ##SkuLongMarket
 from dbo.sku s JOIN dbo.Market m ON 
 m.MarketID=substring(Skuname,charindex('-Suite-',Skuname)+7,3) JOIN dbo.BusinessType BT ON S.CustomerType=BT.BusinessTypeID JOIN dbo.BusinessTypeCategory BTC ON BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
 -------------------------------------------------------------------
 --select top 10 
 --LEN(SkuName)-(LEN(substring(Skuname,1,charindex('-Suite-',Skuname)+7))+LEN( charindex('-Suite-',Skuname)+7,3)))
 --from dbo.Sku


 update S
 set S.SkuName=SML.NewSkuName
 from revenue.SkuPrice S JOIN ##SkuLongMarket SML ON S.SKUID=SML.SKUID
 ------------------------------

 update S
 set S.SkuName=SP.SkuName
 from dbo.Sku S JOIN dbo.SkuPrice SP ON S.SKUID=SP.SKUID
 -----------------------------
 
 update S
 set S.SkuName=SP.SkuName
 from revenue.Sku S JOIN revenue.SkuPrice SP ON S.SKUID=SP.SKUID
 -------------------------------------------------------------
  Update S
 set S.CustomerPricingCategory='Lender' from revenue.SkuPrice S where SKUID IN (

 select * from revenue.SkuPrice where SkuName is not null and AvgInvoicePriceAmt>20 and SkuName like '%Lender%'
 and SKUID not in (select SKUID from dbo.SkuListPriced)

 )
 ---------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------
  /* FIND OUT ABOUT THE MARKET TIERS AND HOW TO EFFECTIVELY BRING THEM INTO THE SKU
    DEFINITIONS FOR THE CORPORATE RE AND THE OWNER PMC CLIENTS; */
  --------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------

  alter table dbo.lineitem add DateNum varchar(8) null;

  update L
  set L.DateNum=CONVERT(VARCHAR(8),date,112)
  from dbo.LineItem L

  select * from dbo.LineItem

  SELECT * 
  INTO dbo.LineItem
  FROM 
  
  [dbo].[LineItemLEFTTOSKU] order by Contractid, ProductID
  ---- contract: 41938

  update L
  set L.BundleID=-1
  from dbo.LineItem L where BundleID>7000000

  select * from dbo.LineItem 
  --where BundleID>7000000

  select contractid, CONVERT(VARCHAR(8),date,112) as Date, count(*)+7000000 as BundleID
INTO ##LineItemUpateBundle1
 from dbo.LineItem
 group by  contractid, CONVERT(VARCHAR(8),date,112)
order by Contractid, CONVERT(VARCHAR(8),date,112), count(*);

update L
set L.BundleID=UB.BundleID
from dbo.LineItem L JOIN ##LineItemUpateBundle1 UB ON L.ContractID=UB.ContractID and L.DateNum=UB.Date
and L.ContractID=41938

------------------------

select * from dbo.LineItem where ContractID=41938

select * from ##LineItemUpateBundle where ContractID=41938
-------------------------------------------------------------

 SELECT CONVERT(VARCHAR(8),date,112) as trueDate, date  
 from ##LineItemUpateBundle where ContractID=41938

 select * from ##LineItemUpateBundle1 where ContractID=41938
















 select count(*) from dbo.sku
 select count(*) from dbo.SkuPrice
 ------------
  select count(*) from revenue.sku
 select count(*) from revenue.SkuPrice
 ----------------------------------------------
 -----------------------------------------------
  select distinct contractid from dbo.LineItem order by ContractID
  -----------------------------------------------

  INSERT  [dbo].[Contract_Input_List] (ContractID)
    select distinct contractid from dbo.LineItem order by ContractID