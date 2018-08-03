select 
BundleFlg,
count(*) from dbo.Contract_Input_List
group by 
BundleFlg

select 
LI.ContractID,
LI.LineItemID,
P.ProductDesc,
p.ProductID,
LI.BundleID,
SP.SKUID,	
SP.SkuName
from Staging..LineItem LI JOIN 
dbo.SkuBridge SB ON SB.LineItemID=LI.LineItemID JOIN 
dbo.SkuPrice SP ON SB.SKUID=SP.SKUID JOIN
Staging..Product P ON LI.ProductID=P.ProductID AND
LI.ContractID IN (SELECT ContractID from dbo.Contract_Input_List )


select 

LEFT (SP.SkuName,CHARINDEX('-AddOn-',SP.SkuName)),
'Suite',
RIGHT (SP.SkuName,(LEN(SP.SKuName)-CHARINDEX('-AddOn-',SP.SkuName))-5),
LEFT (SP.SkuName,CHARINDEX('-AddOn-',SP.SkuName)) +'Suite+'+ RIGHT (SP.SkuName,(LEN(SP.SKuName)-CHARINDEX('-AddOn-',SP.SkuName))-5)  as FULLSKUNAME,
SP.SkuName as OriginalName
  from dbo.SkuPrice SP where SP.SkuName like '%AddOn%'
  --------------
  -----------------------------------------------------
  UPDATE SP
  SET SP.SkuName=LEFT (SP.SkuName,CHARINDEX('-AddOn-',SP.SkuName)) +'Suite+'+ RIGHT (SP.SkuName,(LEN(SP.SKuName)-CHARINDEX('-AddOn-',SP.SkuName))-5)
  from dbo.SkuPrice SP  where SP.SkuName like '%AddOn%'
  --------------------------------------------------------

  DROP TABLE bkp.SkuPrice

  select * into bkp.SkuPrice FROM dbo.SkuPrice



                                                     