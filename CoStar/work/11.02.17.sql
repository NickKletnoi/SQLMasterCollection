select distinct SKUID

select count(*) from dbo.SkuBridge;
select count(*) from revenue.SkuBridge;

 from [Apt].[LineItemSkuNoTerm]
 GROUP BY SKUID

 select distinct skuid from [Apt].[SkuNoTerm]

 select * from [Apt].[ProductList]

 
 SELECT  
 LINT.LineItemID,
 SB.SKUID,
 SP.SkuName,
 LINT.NewTerm,
 LEFT(RIGHT(SP.SkuName,LEN(SP.SkuName)-(CHARINDEX('-',SP.SkuName))),LEN(RIGHT(SP.SkuName,LEN(SP.SkuName)-(CHARINDEX('-',SP.SkuName))))-3)+CAST(  LINT.NewTerm AS varchar(5)) As NewSkuName
 FROM [Apt].[LineItemNewTerm] LINT LEFT
 JOIN dbo.SkuBridge SB ON LINT.LineItemID=SB.LineItemID LEFT JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
 where SP.SkuName like '%N/A%'


