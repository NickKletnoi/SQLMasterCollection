DECLARE @CONTRACT_ESC1 TABLE (ESC_MTH1 INT,CONTRACT_TRM1 INT,ESC_TERM1 INT,ESC_AMT1 MONEY,TOTAL_ESC_AMT1 MONEY)
DECLARE @ESC_MTH1 INT, @CONTRACT_TRM1 INT=36,@ESC_TERM1 INT,@ESC_AMT1 MONEY ,@TOTAL_ESC_AMT1 MONEY,@CONTRACT_ID1 INT=187369
DECLARE @GRAND_TOTAL_ESC_AMT MONEY
DECLARE @ESC_NUMBR_IN_THIS_CONTRACT INT

INSERT INTO @CONTRACT_ESC1 (ESC_MTH1,CONTRACT_TRM1,ESC_TERM1,ESC_AMT1,TOTAL_ESC_AMT1)
SELECT 
LIE.FirstEscalationMonth AS ESC_MTH1,
@CONTRACT_TERM AS CONTRACT_TERM1,
((@CONTRACT_TERM-CONVERT(INT,LIE.FirstEscalationMonth))+2) AS ESC_TERM1,
SUM(LIE.EscalationAmount) AS  ESC_AMT1,
SUM(LIE.EscalationAmount)*((@CONTRACT_TERM-CONVERT(INT,LIE.FirstEscalationMonth))+2)  AS TOTAL_ESC_AMT1
FROM 
Staging..LineItem LI 
JOIN Staging..LineItemEscalation LIE 
ON LI.LineItemID=LIE.LineItemID 
WHERE LI.ContractID =@CONTRACT_ID1 
GROUP BY LIE.FirstEscalationMonth

SELECT @GRAND_TOTAL_ESC_AMT=SUM(TOTAL_ESC_AMT1) FROM @CONTRACT_ESC1;
SELECT @ESC_NUMBR_IN_THIS_CONTRACT=COUNT(*) FROM @CONTRACT_ESC1;