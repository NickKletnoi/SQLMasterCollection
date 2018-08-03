select * from dbo.SkuPrice where SKUID=97802
----------------------------------------------
select count(distinct contractid) from dbo.ProcessedContracts     --70,816
----                                                              --194,020
----
select count(distinct contractid) from Staging..LineItem
----
SELECT
LLI.ContractID,
P.ProductDesc,
SP.SkuName
FROM dbo.LineItem LLI 
JOIN Staging..LineItem LI ON LLI.LineItemID=LI.LineItemID 
JOIN apt.Product P ON LLI.ProductID=P.ProductID
JOIN dbo.SkuBridge SB ON LLI.LineItemID=SB.LineItemID 
JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
---------------------------------------
select count(*) from dbo.SkuPrice