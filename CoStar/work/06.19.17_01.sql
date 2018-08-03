 EXEC [dbo].[uspLOAD_F_Navision]

 --40,899,049


 select count(*) from [cube].[F_NAVISION]

 ---4,153,214
 --1,354,709
 ------------------------------------------------------------------------------
 select  Distinct [LineItemID] 
 INTO ukn.LineItem
 from  [cube].[F_NAVISION]  where SKUID=-1;


 delete from [cube].[F_NAVISION] where LineItemID=0
 select count(*) from [cube].[F_NAVISION] where SKUID=-1
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 select Distinct ContractID 
 into ukn.Contract
 from [DCSQLPRD104].Enterprise.dbo.LineItem where LineItemID in (
 select LineItemID from [ukn].[LineItem])
 order by ContractID
 ------------------------------------------------------------------------------

 select distinct LI.ContractID,P.ProductID, P.ProductDesc from [DCSQLPRD104].Enterprise.dbo.LineItem LI JOIN [DCSQLPRD104].Enterprise.dbo.Product P
 ON LI.ProductID=P.ProductID
 ORDER BY LI.ContractID


SELECT  SUM(N.[InvoiceAmount]) AS Inv_Amt,
        SUM(N.[ContractAmount]) AS Cnt_Amt,
		SUM(SP.Price) as LP_Amt
FROM [cube].[F_NAVISION] N JOIN [revenue].[SkuPrice] SP 
ON N.SKUID=SP.SKUID
WHERE N.[SKUID]<>-1;

select * from [revenue].[SkuPrice]


 -------------------------
 ----- Unknown SKU Totals:
 ---187,542,429.55--------
 ---174,192,986.06--------
 -------------------------
 ---Sku totals:
 ---875,118,458.29
 ---756,164,420.41
 -------------------------------------
 ---884,677,062.65
 ---763,997,867.55
 ---2,078,285,234.81
 -------------------------------------
 -------------------------------------
 -------------------------------------
 SELECT SKUID, ISNULL(Price,0.00) AS Price 
 INTO cube.F_ProductPrice  FROM revenue.SkuPrice
 ---------------------------------------
 ---------------------------------------


