select RenewalDate,CurrentTermStartDate,NewContractTerm1=ContractTermMonths-1,

NewContractTerm2=DATEDIFF(m,CurrentTermStartDate,RenewalDate)+1

,  
---------------------------------- working logic for the Apt Term ------------------------------------------------------
CASE WHEN 
ISNULL((DATEDIFF(m,CurrentTermStartDate,RenewalDate)+1),0) IN (3,11,13,7,25) THEN ISNULL(DATEDIFF(m,CurrentTermStartDate,RenewalDate),0) 
ELSE ISNULL((DATEDIFF(m,CurrentTermStartDate,RenewalDate)+1),0) END AS NewAptContractTerm
-------------------------------------------------------------------------------------------------------------------
,
* 
FROM [DCSQLPRD104].Enterprise.dbo.LineItem L  LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Product P ON L.ProductID=P.ProductID 
WHERE P.ProductName like  '%Apts%' and L.LineItemStatusID=1 