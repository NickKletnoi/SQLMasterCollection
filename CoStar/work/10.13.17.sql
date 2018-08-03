----------------------------------------------
SELECT * FROM [rcl].[Reconciliation_Archive];
SELECT * FROM [rcl].[Reconciliation_Master];
---------------------------------------------
UPDATE RM
SET 
RM.[SourceRowCount]=NULL,
RM.[TargetRowCount]=NULL,
RM.[SourceDollarAmt]=NULL,
RM.[TargetDollarAmt]=NULL,
RM.[LastRunDate]=NULL
FROM [rcl].[Reconciliation_Master] RM
-------------------------------------------------
EXEC [rcl].[usp_ReconciliationRpt] 'SOURCE_TO_DW'
------------------------------------------------


