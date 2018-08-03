select count(*) [contracts to be processed] 
from dbo.Contract_Input_List;

select count(*) [contracts processed] 
from dbo.Contract_Input_List where AuditDate is not null;
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
SELECT SP.SKUID, SP.SkuName, SS.Description,SP.AuditDate,SS.StatusFlg
FROM dbo.SkuPrice SP LEFT JOIN dbo.SkuStatus SS ON SP.ProcessingTierflg=SS.StatusFlg
WHERE Convert(varchar(10),SP.AuditDate,101) ='01/31/2018' order by SS.Description
--------------------------------------------------------------------------------------------------------------
update SP
set SP.SkuName = null
from dbo.SkuPrice SP
where Convert(varchar(10),SP.AuditDate,101) =Convert(varchar(10),GETDATE(),101)  and SP.ProcessingTierflg='N'
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
UPDATE SP
set SP.SkuName = dbo.fnCreateSkuName(SP.SKUID)
from dbo.SkuPrice SP  
where Convert(varchar(10),SP.AuditDate,101) = Convert(varchar(10),GETDATE(),101) and SP.ProcessingTierflg='N'
and sp.SkuName is null;
-------------------------------------------------------------------------------------------------------------
UPDATE S
SET S.SkuName=SP.SkuName
from dbo.Sku S JOIN dbo.SkuPrice SP ON S.SKUID=SP.SKUID where S.SkuName IS NULL
select * from dbo.Sku where SKUID=138877 order by ProductID
select SKUID, dbo.fnCreateSkuName(138510) from dbo.SkuPrice SP where SP.SKUID=138510
------------------------------------------------------------------------------------------------------------
select count(*) from dbo.SkuPrice
select count(*) from dbo.SkuBridge
-----------------------------------------
select * from dbo.Sku where SKUID=138406;
------------------------------------------
SELECT * FROM dbo.LineItem where SKUID=138406
----------------------------------------------

select count(*) [All Skus] from dbo.SkuPrice; 
select count(*) [Skus that are + (with addenda added)] from dbo.SkuPrice where SkuName like '%Suite+%';
select count(*) [Skus that are regular ]from dbo.SkuPrice where SkuName not like '%Suite%';
select count(*) [Rest of the Skus]from dbo.SkuPrice where (SkuName not like '%Suite%') AND (SkuName not like '%Suite+%')


select CHARINDEX('Suite',SkuName) as SuitePositionStartPlace , SkuName--7 (starting point )
from dbo.SkuPrice where SKUID=62826

select CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName)) as PositionoftheDashBeforeMarket, SkuName
from dbo.SkuPrice where SKUID=62826

select RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))) as JusttheNameWithoutSuiteandID
from dbo.SkuPrice where SKUID=62826;

select CHARINDEX('-',  RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))))-1 as FirstDash_in_JusttheNameWithoutSuiteandID
from dbo.SkuPrice where SKUID=62826;
------------------------------------------------------------------------------------------------------------------------------

SELECT M.Market,PM.ProductMarketDesc
FROM 
(
select SkuName,

CASE WHEN 
LEFT( RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))),
       CHARINDEX('-',  RIGHT(SkuName,
	                                  (LEN(SkuName)-(CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))
									  
									  )
									  
									  )
									  
									  ))
	   
	   ) LIKE '____' THEN
	   
	LEFT (
	
	LEFT( RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))),
       CHARINDEX('-',  RIGHT(SkuName,
	                                  (LEN(SkuName)-(CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))
									  
									  )
									  
									  )
									  
									  ))
	   
	   ) 
	,3)   
	   
	    END Market
from dbo.SkuPrice WHERE 
LEFT( RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))),
       CHARINDEX('-',  RIGHT(SkuName,
	                                  (LEN(SkuName)-(CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))
									  
									  )
									  
									  )
									  
									  ))
	   
	   ) LIKE '____'
AND 
LEFT( RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))),
       CHARINDEX('-',  RIGHT(SkuName,
	                                  (LEN(SkuName)-(CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))
									  
									  )
									  
									  )
									  
									  ))
	   
	   ) NOT LIKE 'LN%' ) M LEFT JOIN Staging..ProductMarket PM ON m.Market=PM.ProductMarket


	   select * from Staging.dbo.SalesUnitProductMarket







 where 
 LEFT( RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))),
       CHARINDEX('-',  RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))))) LIKE '____'
	   AND 
	    LEFT( RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))),
       CHARINDEX('-',  RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName)))))
	   NOT LIKE 'LN%'


