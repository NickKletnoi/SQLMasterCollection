
------------------------------------ Sales Order Reconciliation SQL
UPDATE RM 
SET 
RM.[LastRunDate]=GETDATE(), 
RM.[SourceRowCount]=(SELECT COUNT(DISTINCT ContractID) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.LineItem WHERE [CurrentTermStartDate] BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ), 
RM.[TargetRowCount]=(SELECT COUNT(DISTINCT SALES_ORDER_ID) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Sales_Order_Feed WHERE RULE_START_DATE BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ),  
RM.[SourceDollarAmt]=(SELECT ISNULL(SUM(DiscountedMonthlyPrice),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.LineItem WHERE [CurrentTermStartDate] BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ), 
RM.[TargetDollarAmt]=(SELECT ISNULL(SUM(EXT_SELL_PRICE),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Sales_Order_Feed WHERE RULE_START_DATE BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ) 
FROM  [rcl].[Reconciliation_Master] RM  WHERE RM.[ReconciliationPeriod]='201708' AND RM.[ReconciliationAreaName]='Sales Order (SO)';
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------ Invoice Reconciliation SQL 
UPDATE RM 
SET 
RM.[LastRunDate]=GETDATE(), 
RM.[SourceRowCount]=(SELECT COUNT(DISTINCT [Document No_]) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.[RIG$Sales Invoice Line] WHERE [Posting Date]  BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ), 
RM.[TargetRowCount]=(SELECT COUNT(DISTINCT INVOICE_ID) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Invoice_Feed WHERE INVOICE_DATE BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ),  
RM.[SourceDollarAmt]=(SELECT ISNULL(SUM(Amount),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.[RIG$Sales Invoice Line] WHERE [Posting Date]  BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ), 
RM.[TargetDollarAmt]=(SELECT ISNULL(SUM(EXT_SELL_PRICE),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Invoice_Feed WHERE INVOICE_DATE BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ) 
FROM  [rcl].[Reconciliation_Master] RM  WHERE RM.[ReconciliationPeriod]='201708' AND RM.[ReconciliationAreaName]='Invoice (INV)'
----------------------------------------------------------------------------------------------------------------------------------
------------------------------------ CN Reconciliation SQL 
UPDATE RM 
SET 
RM.[LastRunDate]=GETDATE(), 
RM.[SourceRowCount]=(SELECT COUNT(DISTINCT [Document No_]) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.[RIG$Sales Cr_Memo Line] WHERE [Posting Date]  BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ), 
RM.[TargetRowCount]=(SELECT COUNT(DISTINCT INVOICE_ID) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Credit_Memo_Feed WHERE INVOICE_DATE BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ),  
RM.[SourceDollarAmt]=(SELECT ISNULL(SUM(Amount),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.[RIG$Sales Cr_Memo Line] WHERE [Posting Date]  BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ), 
RM.[TargetDollarAmt]=(SELECT ISNULL(SUM(EXT_SELL_PRICE),0) FROM [CS01SQLWDEV435\VSOE].Staging.dbo.Credit_Memo_Feed WHERE INVOICE_DATE BETWEEN RevPro.dbo.fnGetDayFromPeriod('201708') AND DATEADD(dd,29,RevPro.dbo.fnGetDayFromPeriod('201708')) ) 
FROM  [rcl].[Reconciliation_Master] RM  WHERE RM.[ReconciliationPeriod]='201708' AND RM.[ReconciliationAreaName]='Credit Memo (CM)'

----------------------------------------------------------------------------------------------------------------------------