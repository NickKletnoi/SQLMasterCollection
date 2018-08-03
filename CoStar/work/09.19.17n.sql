SELECT
C.ContractID,
L.LineItemID,
C.ContractSignedDate,
C.AcctApprovedDate,
P.ProductName, 
CT.ContactID as RepID_from_ContractContactID,
CT.FirstName + ' '+ CT.LastName as RepNameAs_from_ContractContactID,
CT1.ContactID as ApproverID_from_AcctApprovedByContactID,
CT1.FirstName + ' '+ CT1.LastName as ApproverNameAs_from_AcctApprovedByContactID

--SUM(L.OriginalMonthlyPrice) as ContractAmount,
--SUM(PL.ManualListPrice) ManualAmount 
--INTO [Apt].[SalesPricingReport]
FROM  
[DCSQLPRD104].Enterprise.dbo.LineItem L JOIN 
[DCSQLPRD104].Enterprise.dbo.Contract C ON L.ContractID=C.ContractID LEFT JOIN 
[DCSQLPRD104].Enterprise.dbo.Contact CT ON C.ContractContactID=CT.ContactID LEFT JOIN 
[DCSQLPRD104].Enterprise.dbo.Contact CT1 ON C.AcctApprovedByContactID=CT1.ContactID LEFT JOIN 
[DCSQLPRD104].Enterprise.dbo.Location LOC ON C.BillingLocationID=LOC.LocationID LEFT JOIN
dbo.SkuBridge SB ON L.LineItemID=SB.LineItemID LEFT JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Product P ON L.ProductID=P.ProductID JOIN [Apt].[ProductList] PL ON SB.SKUID=PL.SKUID
WHERE P.ProductName like  '%Apts%' and L.LineItemStatusID=1 AND
CT.LastName like '%Culver%'


GROUP BY L.LineItemID, P.ProductName,LOC.LocationName,LOC.LocationID,CT.LastName, CT.FirstName,SP.SkuName,CT.ContactID
HAVING  SUM(L.OriginalMonthlyPrice)>1

select top 10 * from [DCSQLPRD104].Enterprise.dbo.Contract