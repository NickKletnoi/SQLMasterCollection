select * from rcl.Reconciliation_Master

EXEC  [rcl].[usp_ReconciliationRpt] '201708'

UPDATE RM 
SET RM.[LastRunDate]=GETDATE(), 
RM.[SourceRowCount]=(SELECT COUNT(*) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.LineItem), 
RM.[TargetRowCount]=(SELECT COUNT(*) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Sales_Order_Feed), 
RM.[SourceDollarAmt]=(SELECT ISNULL(SUM(DiscountedMonthlyPrice),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.LineItem), 
RM.[TargetDollarAmt]=(SELECT ISNULL(SUM(DISCOUNT_AMOUNT),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Sales_Order_Feed) 
FROM  [rcl].[Reconciliation_Master] RM  WHERE RM.[ReconciliationPeriod]='201708' AND RM.[ReconciliationAreaName]='Sales Order (SO)'

SELECT [SourceDateFromColumnName],[SourceDateToColumnName] FROM [rcl].[Reconciliation_Master] RM WHERE RM.[ReconciliationPeriod]='201708' AND RM.[ReconciliationAreaName]='Sales Order (SO)'

SELECT CONVERT(DATE, LEFT(RM.[ReconciliationPeriod],4)+'/'+RIGHT(RM.[ReconciliationPeriod],2)+'/'+'01') AS DATEPERIOD
FROM rcl.Reconciliation_Master RM WHERE RM.[ReconciliationPeriod]='201708' AND RM.[ReconciliationAreaName]='Sales Order (SO)'

SELECT DISTINCT CONVERT( DATE ,[CurrentTermStartDate]), CONVERT(DATE,[TermEndDate]) FROM dbo.LineItem