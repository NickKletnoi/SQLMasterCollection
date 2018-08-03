SELECT 
[Line Item ID] as LineItemID,
[Contract ID] as ContractID,
[Bill-to Customer No_] as LocationID,
[Posting Date] as Posting_Date,
SKUID=-1,
[Amount] as Revenue_Amount
INTO FACT_INV_2017
FROM [DCSQLDEV135\ACCT].NAVISIONDB260_PRD.[dbo].[RIG$Sales Invoice Line]
WHERE YEAR([Posting Date])=2017 and Amount>0
-----------------------------------------------------------------------
