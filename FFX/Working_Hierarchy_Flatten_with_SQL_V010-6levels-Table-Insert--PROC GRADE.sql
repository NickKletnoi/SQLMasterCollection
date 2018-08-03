
--------------------------------------------------------------------------------------------------------------------
------------------------------ THIS STORED PROC DEPENDS ON THE EXISTANCE OF [dbo].[COST_CENTER_HIER1] --------------
------------------------------ POPULATED FROM SAP DATA SERVICES TABLE FLATTENING FEATURE THAT COMES OUT-OF-BOX------
------------------------------ THE MODIFICATIONS BELOW ARE NEEDED TO BRING IT UP TO PAR FOR SSAS DIM LOAD ----------
--------------------------------------------------------------------------------------------------------------------
DECLARE @t TABLE (cid VARCHAR(64) , n VARCHAR(64), pid VARCHAR(64))
DECLARE @t2 TABLE (ID VARCHAR(64), Level06 varchar (64) ,Level05 varchar (64),Level04 varchar (64),Level03 varchar (64), Level02 varchar(64), Level01 varchar(64))

INSERT @t (cid,n,pid) SELECT [CHILD_ID],[CHILD_DESCR],[PARENT_ID] FROM [dbo].[COST_CENTER_HIER1];

WITH 

e AS

(
SELECT *,cid as id, 1 AS l 
    FROM @t a WHERE NOT EXISTS 
	               (SELECT * FROM @t b WHERE a.cid = b.pid)
UNION ALL
SELECT t.*,	e.id, e.l+1 
    FROM @t t INNER JOIN e ON t.cid = e.pid ),

--select * from e  /// check how the raw input is progressing in terms of levels

e2 AS ( SELECT n, l, id FROM e)

INSERT @t2 (ID,Level06,Level05,Level04,Level03,Level02,Level01)
SELECT * FROM e2
PIVOT ( MAX(n) FOR l IN ([1],[2],[3],[4],[5],[6])) P;

INSERT MD.COST_CENTER (COST_CENTER, COST_CENTER_NAME, DIVISION, AGENCY, DEPARTMENT, BUSINESS_AREA, HIERARCHY)
select ID,Level06,Level05,Level04,Level03,Level02,Level01 from @t2

-------------------------------------------------------------------------------------------------------------------------------------------

