


/*
contract start date of 

November 2017

*/

WITH Nov17Contracts AS (
SELECT 
LI.ContractID as ContractID,
LI.CurrentTermStartDate
FROM RevPro..Active_SOFile ASO JOIN Staging..LineItem LI ON ASO.LineItemID=LI.LineItemID JOIN 
RevPro.apt.Product P ON P.ProductID=LI.ProductID
WHERE YEAR(LI.CurrentTermStartDate)=2017 AND MONTH(LI.CurrentTermStartDate)=10
)
SELECT distinct 
       N.CurrentTermStartDate  
      ,R6.[SkuName]
      ,R6.[CustomerHQ]
      ,R6.[CustomerNumber]
      ,R6.[CustomerID]
      ,R6.[CustomerName]
      ,R6.[SalesRep]
      ,R6.[Executive VP]
      ,R6.[Senior VP]
      ,R6.[Regional VP]
      ,R6.[Regional Director]
      ,[Market Name]
      ,R6.[ContractAmount]
      ,R6.[List Price]
      ,R6.[ContractSignedDate]
      ,R6.[ContractReceiptDate]
      ,R6.[AcctApprovedDate]
      ,R6.[CreatedDate]
      ,R6.[UpdatedDate]
FROM [Apt].[SalesPricingReport6.1] R6  
JOIN Staging..LineItem LI1 on R6.ContractID=LI1.ContractID 
JOIN Nov17Contracts N ON N.ContractID=LI1.ContractID

