select count(*) from dbo.SkuBridge where SKUID=-1
-----
-------------------------------------------------------------------------------------
----------------------- THIS IS A FIX FOR THE NON-APARTMENT RELATED -1 --------------
-------------------------------------------------------------------------------------
UPDATE SB
set SB.SKUID=[dbo].[fnGetMaxSku](a.ContractID)
FROM
(
select c.ContractID,c.LineItemID , COUNT(distinct SB.SKUID) SkuCnt
FROM
(
select LI.ContractID,LI.LineItemID,count(*) as Cnt
from dbo.SkuBridge SB 
JOIN Staging..LineItem LI ON SB.LineItemID=LI.LineItemID 
LEFT JOIN apt.Product P ON LI.ProductID=P.ProductID
where SB.SKUID=-1 AND  P.ProductID IS NULL
group by LI.ContractID,LI.LineItemID
) c JOIN Staging..LineItem LI on C.ContractID=LI.ContractID 
JOIN dbo.SkuBridge SB ON SB.LineItemID=LI.LineItemID
Group by c.ContractID,c.LineItemID
Having  COUNT(distinct SB.SKUID)>1 
) a JOIN dbo.SkuBridge SB on a.LineItemID=SB.LineItemID


select count(*) from bkp.SkuBridge

select * into bkp.SkuBridge from dbo.SkuBridge


---------------------------------------
------------------------------------===

select * from dbo.SkuBridge SB 
JOIN Staging..LineItem LI on SB.LineItemID=LI.LineItemID 
LEFT JOIN apt.Product P ON LI.ProductID=P.ProductID
where LI.ContractID=179915
AND P.ProductID IS NULL;


--
--
--

select * from dbo.SkuBridge where SKUID=79588


SELECT COUNT(*) FROM vwStraightLineContracts WHERE StraightLineStatusFlg=1


 SELECT  MAX(A.SKUID)----87241
    FROM 
	( SELECT TOP 1 L.SKUID, COUNT(L.LineItemID) as Maxcnt
	  FROM RevPro..LineItem L 
	  WHERE L.ContractID=433 
	  AND SKUID<>-1
	  GROUP BY L.SKUID
	  ORDER BY COUNT(L.LineItemID) desc
	   ) A 
-----------------------------------------------

SELECT   MAX(A.SKUID)  ---137387
    FROM 
	( SELECT L.SKUID, COUNT(L.LineItemID) as Maxcnt
	  FROM RevPro..LineItem L 
	  WHERE L.ContractID=433
	  GROUP BY L.SKUID
	  ) A