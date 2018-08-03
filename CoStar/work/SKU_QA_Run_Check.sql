--------------------------------------------------------------------------------------
SELECT 
LI.ContractID,
P.ProductDesc,
SP.SkuName,
SP.SKUID,
LI.BundleID,
CASE WHEN 
ISNULL((DATEDIFF(m,CurrentTermStartDate,RenewalDate)+1),0) IN (3,11,13,7,25) 
THEN ISNULL(DATEDIFF(m,CurrentTermStartDate,RenewalDate),0) 
ELSE ISNULL((DATEDIFF(m,CurrentTermStartDate,RenewalDate)+1),0) END AS NewAptContractTerm
--into #Sku2
FROM Staging..LineItem LI 
JOIN dbo.SkuBridge SB ON LI.LineItemID=SB.LineItemID
JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
JOIN apt.Product apt ON LI.ProductID=apt.ProductID
LEFT JOIN Staging..Product P ON LI.ProductID=P.ProductID
WHERE LI.ContractID IN 
(SELECT contractid FROM dbo.ProcessedContracts PC 
WHERE CONVERT(VARCHAR(10),PC.StatusDateTime,101)='01/12/2018' )
ORDER BY LI.ContractID,P.ProductDesc

-------------------------------------------------------------------------------------
---- QA SQL FOR CHECKING INITIAL TERM AND SEEING WHAT VALUE IS COMING IN FROM THE LI:
--------------------------------------------------------------------------------------

SELECT 
LI.ContractID,
P.ProductDesc,
SP.SkuName,
SP.SKUID,
LI.BundleID,
CASE WHEN 
ISNULL((DATEDIFF(m,LI.CurrentTermStartDate,LI.RenewalDate)+1),0) IN (3,11,13,7,25) 
THEN ISNULL(DATEDIFF(m,LI.CurrentTermStartDate,LI.RenewalDate),0) 
ELSE ISNULL((DATEDIFF(m,LI.CurrentTermStartDate,LI.RenewalDate)+1),0) END AS NewAptContractTerm
,
(CASE WHEN COUNT(DISTINCT LI.CurrentTermStartDate)=1 THEN 'I' ELSE 'R' END ) AS InitialTermFlg
--into #Sku2
FROM Staging..LineItem LI 
JOIN dbo.SkuBridge SB ON LI.LineItemID=SB.LineItemID
JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
JOIN apt.Product apt ON LI.ProductID=apt.ProductID
LEFT JOIN Staging..Product P ON LI.ProductID=P.ProductID
WHERE LI.ContractID IN 
(SELECT contractid FROM dbo.ProcessedContracts PC 
WHERE CONVERT(VARCHAR(10),PC.StatusDateTime,101)='01/12/2018' )
--ORDER BY LI.ContractID,P.ProductDesc
GROUP BY 
LI.ContractID,
P.ProductDesc,
SP.SkuName,
SP.SKUID,
LI.BundleID,
LI.CurrentTermStartDate,
LI.RenewalDate

------------------------------------
------- BUNDLE ASSIGNMENT CHECK ----
select 
bundleID, count(*)
 from #Sku1
 group by bundleID
 order by count(*) desc
 ------------------------------------------
 ------ SKU ASSIGNMENT CHECK --------------
select 
SKUID, count(*)
 from #Sku1
 group by SKUID
 order by count(*) desc
 ------------------------------------------
 ------------------------------------------
 select count(*) from #sku1 where skuid<>-1
 select count(*) from #sku1 where skuid=-1
 -----------------------------------------
 select * from #sku1
 select count(*) from #Sku1
 ----------------------------------------





