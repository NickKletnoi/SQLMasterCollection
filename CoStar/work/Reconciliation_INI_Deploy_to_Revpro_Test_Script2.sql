exec [rcl].[usp_ReconciliationRpt] '201708'


select * from rcl.Reconciliation_Master

UPDATE 
RM SET RM.[LastRunDate]=GETDATE(), 
RM.[SourceRowCount]=(SELECT COUNT(*) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.LineItem), 
RM.[TargetRowCount]=(SELECT COUNT(*) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Sales_Order_Feed), 
RM.[SourceDollarAmt]=(SELECT ISNULL(SUM(DiscountedMonthlyPrice),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.LineItem), 
RM.[TargetDollarAmt]=(SELECT ISNULL(SUM(DISCOUNT_AMOUNT),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Sales_Order_Feed) 
FROM  [rcl].[Reconciliation_Master] RM  WHERE RM.[ReconciliationPeriod]='201708' AND RM.[ReconciliationAreaName]='Sales Order (SO)'
------------------------------------------------------------------------------------------------------------------------------------
UPDATE RM 
SET RM.[LastRunDate]=GETDATE(), 
RM.[SourceRowCount]=(SELECT COUNT(*) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.[RIG$Sales Invoice Line]), 
RM.[TargetRowCount]=(SELECT COUNT(*) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Invoice_Feed), 
RM.[SourceDollarAmt]=(SELECT ISNULL(SUM(Amount),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.[RIG$Sales Invoice Line]), 
RM.[TargetDollarAmt]=(SELECT ISNULL(SUM(EXT_SELL_PRICE),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Invoice_Feed) 
FROM  [rcl].[Reconciliation_Master] RM  WHERE RM.[ReconciliationPeriod]='201708' AND RM.[ReconciliationAreaName]='Invoice (INV)'
-----------------------------------------------------------------------------------------------------------------------------------

UPDATE RM 
SET RM.[LastRunDate]=GETDATE(), 
RM.[SourceRowCount]=(SELECT COUNT(*) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.[RIG$Sales Cr_Memo Line]), 
RM.[TargetRowCount]=(SELECT COUNT(*) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Credit_Memo_Feed), 
RM.[SourceDollarAmt]=(SELECT ISNULL(SUM(Amount),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.[RIG$Sales Cr_Memo Line]), 
RM.[TargetDollarAmt]=(SELECT ISNULL(SUM(EXT_SELL_PRICE),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Credit_Memo_Feed) 
FROM  [rcl].[Reconciliation_Master] RM  WHERE RM.[ReconciliationPeriod]='201708' AND RM.[ReconciliationAreaName]='Credit Memo (CM)'

