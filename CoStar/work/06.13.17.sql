USE [CoStar]
GO



INSERT [dbo].[SkuListPriced2] ([SKUID],[ListPrice])
SELECT [SKUID]
      ,[ListPrice]
  FROM [dbo].[SkuListPriced]

-------------------------------------
SELECT * FROM [dbo].[SkuListPriced];
-------------------------------------
SELECT
L.ContractID,
SUM(
COALESCE( L.CurrentMonthlyPrice,L.OriginalMonthlyPrice) 
) AS ContractAmount
INTO ContractListEnterprise
FROM [DCSQLPRD104].Enterprise.dbo.LineItem L JOIN SkuBridgeFinal2 SBF2 ON L.LineItemID=SBF2.LineItemID
where SBF2.SKUID IN (Select Distinct SKUID from [dbo].[SkuListPriced])AND  L.LineItemStatusID=1 
group by L.ContractID
HAVING SUM(L.CurrentMonthlyPrice) >0


select top 10 * from [DCSQLPRD104].Enterprise.dbo.LineItem