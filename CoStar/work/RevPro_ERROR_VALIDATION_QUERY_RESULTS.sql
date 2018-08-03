
select DW_Fl,RPro_Fl, * from Credit_Memo_Feed
------------------------------------------------------------------------------
update CM
SET CM.DW_Fl='N',CM.RPro_Fl='N'
FROM Credit_Memo_Feed CM
-------------------------------------------------------------------------------
select  DW_Fl,RPro_Fl,count(*) from Credit_Memo_Feed group by DW_Fl,RPro_Fl
-------------------------------------------------------------------------------

select cd.ERROR_COLUMN, ERROR_LEVEL,COUNT(cd.ERROR_COLUMN) as error_count ,CD.ERROR_CODE,CM.ERROR_CATEGORY,CM.ERROR_MESSAGE,CM.NEXT_ACTION   from CSTR_RPRO_ERR_CODE_DETAILS CDINNER JOIN CSTR_RPRO_ERR_CODE_MASTER as CM ON CM.ERROR_CODE=CD.ERROR_CODEwhere BATCH_ID =100491group by ERROR_COLUMN,CD.ERROR_CODE,CM.ERROR_CATEGORY,CM.ERROR_MESSAGE,CM.NEXT_ACTION,ERROR_LEVELorder by COUNT(cd.ERROR_COLUMN) desc;
----------------------------------------------------
select RULE_START_DATE,RULE_END_DATE,* from Credit_Memo_Feed
where RPro_Fl='VE'
-----------------------------------------------------
-----------------------------------------------------
SELECT * FROM [dbo].[CSTR_RPRO_LOOKUP_VALUES];
SELECT * FROM [dbo].[CSTR_RPRO_ERR_CODE_DETAILS];
SELECT * FROM [dbo].[CSTR_RPRO_ERR_CODE_MASTER];
SELECT * FROM [dbo].[CSTR_RPRO_PARAMETER_VALUES];
-----------------------------------------------------
-----------------------------------------------------