truncate table [dbo].[StraightLineDiscountContracts]

EXEC [dbo].[uspProcessStraightLineDiscountContracts]


INSERT RevPro..StraightLineDiscountContracts (ContractID, Waterfall_Amt, Waterfall_Stub_Amt, Contract_Final_Amt, StraightLine_Flg)
SELECT ContractID, Waterfall_Amt, Waterfall_Stub_Amt, Contract_Final_Amt, StraightLine_Flg FROM  [dbo].[StraightLineDiscountContracts] WHERE StraightLine_Flg=1 AND
Waterfall_Amt<>Waterfall_Stub_Amt


select * from vwStraightLineContracts
