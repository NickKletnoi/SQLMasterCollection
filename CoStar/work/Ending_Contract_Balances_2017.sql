select 
ContractID,
LineItemID,
SUM(MonthlyPrice) as Amount
from dbo.InvoiceDetail
where ChargeYear=2017
Group By ContractID, LineItemID