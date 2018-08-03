------------------------------------------------------------------------------
------------------------------------------------------------------------------
select top 100 * from [dbo].[LineItemComplete] where skuid<>-1 and Amount>4;--
select count(*) from [LineItemComplete];--------------------------------------
------------------------------------------------------------------------------
select * from ValidProduct

------------------------------------------------------------------------------
SELECT 
ContractID as ContractID,
LI.SKUID,
GLB.[GLAccount] as GLAccount,
GLR.GLDescription as GLAccountDesc,
CASE VP.ProductType WHEN 'O' THEN 'Other' 
                    WHEN 'LN' THEN 'LoopNet'
					WHEN 'VP' THEN 'VP'
					WHEN 'C'  THEN 'Comps'
					WHEN 'P'  THEN 'Property'
					WHEN 'T'  THEN 'Tenant'
					WHEN 'MA' THEN 'Analytics'
					WHEN 'PPR' THEN 'PPR'
					ELSE 'Other' END AS ProductType,
ISNULL(SM.MarketName,'Unknown') as MarketName,
SPF.SkuName as SkuName,
BT.BusinessTypeName as CustomerTypeName,
SF.UserCount as UserCount,
CAST(YEAR(LI.Date) as varchar(4))+
CASE MONTH(LI.Date)
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sep'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END as YR_MTH,
YEAR(LI.Date) as YEAR, 
MONTH(LI.Date) as MTH, 
SUM(LI.Amount) as RevenueAmt
INTO F_REVENUE5
FROM [dbo].[LineItemComplete] LI JOIN SkuFinal SF ON LI.SKUID=SF.SKUID 
LEFT JOIN [dbo].[ValidProduct] VP ON LI.ProductID=VP.ProductID
JOIN  [dbo].[SkuPriceFinal] SPF ON LI.SKUID=SPF.SKUID
JOIN [dbo].[BusinessType]BT ON LI.CustomerType=BT.BusinessTypeID
JOIN [dbo].[SkuMarket] SM ON LI.SKUID=SM.SKUID
JOIN [dbo].[GLBridge] GLB ON LI.[LineItemID]=GLB.[LineItemID]
JOIN [dbo].[GLRevenueDESC] GLR ON GLB.GLAccount=GLR.GLAccount
WHERE LI.skuid<>-1 and LI.Amount>4
GROUP BY 
ContractID,
LI.SKUID,
VP.ProductType,
GLB.[GLAccount],
GLR.GLDescription ,
SM.MarketName,
SPF.SkuName,
BT.BusinessTypeName,
SF.UserCount,
YEAR(LI.Date), 
MONTH(LI.Date)
ORDER by 
SUM(LI.Amount) DESC,
YEAR(LI.Date), 
MONTH(LI.Date)

--select * from F_REVENUE
--drop table F_REVENUE

select * from F_REVENUE5
---------------------------------------------------------------------------------

SELECT COUNT(*) FROM [dbo].[Market]

select * from [dbo].[BusinessType]

SELECT DISTINCT GLAccount 
GLAccount
into GLRevenue
FROM F_REVENUE
-------------------------

select * from GLRevenue



select Distinct SF.SKUID, SF.SkuName, (select top 1 M.MarketName from 
                                SkuFinal SF1 JOIN Market M ON SF1.MarketID=M.MarketID where SF1.SKUID= SF.SKUID ) as MarketName
INTO SkuMarket
FROM  
[dbo].[SkuFinal] SF


select * from SkuPriceFinal

/*
this is what you play with in the mean time;
bring in the following:
1. Customer
2. GL Account Group
3. Product Type
4. 
*/




select distinct SKUID from SkuFinal where (ProductID in (1,2,5)) and (ProductID not in (
select Productid from 
))

select * from F_REVENUE5 where SKUID NOT IN (
select SKUID from [dbo].[SKUCMA])

select * from F_REVENUE5 where SkuName not like '%Suite%'

update F5
set ProductType = 'Combo' from F_REVENUE5 F5 where SkuName like '%Combo%'

update F5
set ProductType = 'Single' from F_REVENUE5 F5 where SkuName ='U'


select * from F_REVENUE5

select Distinct
GLAccount,GLAccountDesc
INTO D_GL
 from F_REVENUE5

 select distinct Skuid, SkuName, ProductType 
 INTO D_PRODUCT
 from F_REVENUE5

 select distinct 
 CustomerTypeName 
 into D_Customer
 from F_REVENUE5

 select distinct UserCount 
 into D_UserCount
 from F_REVENUE5 

 select distinct YR_MTH
 into D_YEAR_MONTH
 from F_REVENUE5

 select distinct 
 MarketName
 into D_Market
 from F_REVENUE5

 select * from D_GL

 select * from D_PRODUCT


 update D_PRODUCT
 set ProductType='Single' where ProductType='U'



 select count(*) from F_Revenue where SkuName like '%OwnerPMC%'
 UNION
  select count(*) from F_Revenue where SkuName like '%Vendor%'
  UNION
 select count(*) from F_Revenue where SkuName like '%Brokerage/Consultants%'
 union
 select count(*) from F_Revenue where SkuName like '%Lender%'


 
 select count(*) 
 
 update R
 set R.ProductType='Single'
 from F_Revenue R where SkuName like'U'
 
  update R
 set R.ProductType='SuiteCMA'
 from F_Revenue R where SkuName like '%Vendor%'
 
 
   update R
 set R.ProductType='SuiteCMA'
 from F_Revenue R where SkuName like '%Brokerage/Consultants%'

    update R
 set R.ProductType='SuiteCMA'
 from F_Revenue R where SkuName like '%Lender%'

 select 
 ProductType,
 count(*)
  from F_Revenue
  group by ProductType

  select 
  
  Update F_Revenue
  set ProductType='Single'
   from F_Revenue where ProductType='U'


 
 UNION
  select count(*) from F_Revenue where SkuName like '%Vendor%'
  UNION
 select count(*) from F_Revenue where SkuName like '%Brokerage/Consultants%'
 union
 select count(*) from F_Revenue where SkuName like '%Lender%'


 46414-Suite-PA1-5-4-Brokerage/Consultants

 --3710




