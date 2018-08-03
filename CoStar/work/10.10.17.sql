----------------------------------------
SELECT * FROM rcl.Reconciliation_Master
SELECT * FROM rcl.Reconciliation_Archive
------------------------------------------
UPDATE RM
SET 
RM.[SourceRowCount]=NULL,
RM.[TargetRowCount]=NULL,
RM.[SourceDollarAmt]=NULL,
RM.[TargetDollarAmt]=NULL
FROM [rcl].[Reconciliation_Master] RM
------------------------------------------------
EXEC [rcl].[usp_ReconciliationRpt] 'SOURCE_TO_DW'
-------------------------------------------------
SELECT * FROM rcl.vw_Reconciliation
-------------------------------------------------
--------------------------------------------------
--------------------------------------------------

