SELECT  
GL.[Contract ID] as Contract_ID, 
SUM(SIL.Amount) AS Amount
FROM [RIG$G_L Entry] GL
      JOIN [RIG$Sales Invoice Line] SIL 
            ON SIL.[Document No_] = GL.[Document No_] 
            AND SIL.[No_] = GL.[G_L Account No_]
WHERE YEAR(SIL.[Posting Date])=2017
GROUP BY GL.[Contract ID]
ORDER BY GL.[Contract ID] 


--select top 10 * from [dbo].[RIG$Sales Invoice Line]

SELECT 
[Line Item ID] as LineItemID,
[Contract ID] as ContractID,
[Bill-to Customer No_] as LocationID,
[Posting Date] as Posting_Date,
SKUID=-1,
[Amount] as Revenue_AMT
FROM [dbo].[RIG$Sales Invoice Line]
WHERE YEAR([Posting Date])=2017 and Amount>0



