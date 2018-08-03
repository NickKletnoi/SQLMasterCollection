

SELECT DISTINCT 
S.SKUID,S.SkuName
FROM 
 [dbo].[SkuPriceLG] SP JOIN [dbo].[SkuLG] S ON SP.SKUID=S.SKUID
WHERE S.MarketID IN 

(SELECT MarketID FROM Market2 WHERE StateFlg=1)
AND S.SkuName IS NOT NULL AND SP.Price>4
AND S.CustomerType IN (1,2)
--------------------------------------------------------

SELECT 
DISTINCT SKUID 
INTO #TAX_SKUS
FROM SkuLG WHERE SkuName LIKE '%Appraisal/Valuation/Tax Appeal%'
AND Amount>0

SELECT 
DISTINCT SKUID 
INTO #Broker_SKUS
FROM SkuLG WHERE SkuName LIKE '%Brokerage/Consultants%'
AND Amount>0


select distinct skuid
into #State_Skus
 from SkuLG where SKUID in (
SELECT SkuID from #Broker_SKUS
union
SELECT SkuID from #TAX_SKUS)
AND MarketID IN (
SELECT [MarketID] FROM [dbo].[Market2] WHERE [StateFlg]=1)


SELECT 

LineItemID 
INTO #Problem_LineItems
FROM [dbo].[SkuBridge] WHERE SKUID IN (SELECT SKUID FROM #State_Skus)

SELECT  LI.[SiteLocationID], L.SiteAddress, PL.LineItemID 
into #FixedAddr1
FROM [DCSQLDEV104].Enterprise.[dbo].[LineItem] LI JOIN
(
SELECT distinct ID.SiteAddress, ID.LineItemID from [DCSQLDEV104].Enterprise.[dbo].InvoiceDetail ID 
--where ID.LineItemID=LI.LineItemID
) L ON LI.LineItemID=L.LineItemID
JOIN #Problem_LineItems PL ON PL.LineItemID=LI.LineItemID


select DISTINCT LI.SiteLocationID, L.LocationID,ASM.Address from [DCSQLDEV104].Enterprise.[dbo].[LineItem] LI
JOIN [DCSQLDEV104].Enterprise.[dbo].Location L on LI.SiteLocationID=L.LocationID 
LEFT JOIN [DCSQLDEV104].Enterprise.[dbo].AddressSubmarket ASM ON L.AddressID=ASM.AddressID LEFT JOIN 
where LI.LineItemID  in  (SELECT LineItemID FROM #Problem_LineItems)


Select * from [DCSQLDEV104].Enterprise.[dbo].AddressSubmarket

select * from [DCSQLDEV104].Enterprise.[dbo].CitySubmarket









