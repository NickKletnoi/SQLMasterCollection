 
 select [document No_] as InvoiceNumber,
 [Bill-to Customer No_] as ParentHQID,
 [Shortcut Dimension 1 Code] as Market, 
  DVM.[Name] as MarketName, 
  [Shortcut Dimension 2 Code] as Department,
    DVD.[Name]  as DepartmentName
  --INTO cube.D_MarketLookup
 from 
 [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] SIL LEFT JOIN
  [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Dimension Value] DVM ON 
  SIL.[Shortcut Dimension 1 Code] = DVM.Code LEFT JOIN 
  [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Dimension Value] DVD ON 
   SIL.[Shortcut Dimension 2 Code] = DVD.[Code]

 where YEAR([Posting Date])=2017 AND MONTH([Posting Date])=8

 select top 100 * from  
 [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] 

 select top 100 * from 
  [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Dimension Value]