USE [Staging]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateStraightLineDiscountWaterfall]    Script Date: 11/22/2017 2:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
truncate table dbo.StraightLineContracts
drop table dbo.StraightLineContracts

---------------------------------------- CODE FOR THE DISCOUNTS -----------------------------
1. Take the CurrentTermStartDate ,
2. Increment by the 'Discount Month' >>> arrive at the start Month for the discounts
3. Take the #2 add the number of months indicated in Column 'RecurringMonths' >> arrive at the end month of the Discount
4. Create the waterfall from that point; applying the discount;
5. Arrive at the end Contract Amount after applying the discount amount to the final end amount; 
----------------------------------------------------------------------------------------------

CREATE TABLE dbo.StraightLineDiscountContracts (
	[ContractID] [int]  NULL,
	[Waterfall_Amt] [money] NULL,
	[Waterfall_Stub_Amt] [money] NULL,
	[Contract_Final_Amt] [money] NULL,
	StraightLine_Flg bit null
) ON [PRIMARY]

-----------------------------------------------------
EXEC  [dbo].[usp_CreateStraightLineDiscountWaterfall2]
------------------------------------------------------
SELECT * FROM dbo.StraightLineDiscountContracts where contractid=187964

SELECT * FROM dbo.LineItem where contractid=187964

TRUNCATE TABLE Staging..StraightLineDiscountContracts
SELECT * FROM Staging..StraightLineDiscountContracts

EXEC [dbo].[uspProcessStraightLineDiscountContracts]

*/

ALTER PROC [dbo].[usp_CreateStraightLineDiscountWaterfall]
@CONTRACTID INT=187964
AS
------  Declare Period vars 
DECLARE @CURRENT_TERM INT
DECLARE @DISCOUNT_MTH_START INT
DECLARE @TRUE_INI_PRD INT
DECLARE @TRUE_DSC_PRD INT
DECLARE @TRUE_TERM NUMERIC(18,4)
------- Declare flags vars
DECLARE @STRAIGHT_LINE_CONTRACT_FLG BIT=0 
DECLARE @STUB_INVOLVED_FLG BIT
------ Declare money vars
DECLARE @CONTRACT_INITAL_AMT MONEY
DECLARE @CONTRACT_FINAL_AMT MONEY
DECLARE @CONTRACT_DISCOUNT_AMT MONEY
DECLARE @CONTRACT_FINAL_MTH_AMT MONEY
DECLARE @CONTRACT_REG_MTH_AMT MONEY
DECLARE @CONTRACT_DSC_MTH_AMT MONEY
DECLARE @CONTRACT_DSC_PRCT NUMERIC(18,4) 
------- Declare Dates vars
DECLARE @CURRENT_TERM_START_DATE DATE
DECLARE @FIRST_MTH_START_DATE DATE
------- Declare Stub vars
DECLARE @STUB_DIFF_DAYS INT
DECLARE @STUB_FRACTION NUMERIC(18,4)
DECLARE @STUB_MTH_TOTAL_DAYS INT
DECLARE @STUB_START DATE
DECLARE @STUB_END DATE
DECLARE @STUB_START_DAY INT
DECLARE @STUB_AMT MONEY
DECLARE @WATERFALL_AMT MONEY
DECLARE @WATERFALL_STUB_AMT MONEY
--------------------------  Period calculations start below ---------------

SELECT @CURRENT_TERM=datediff(mm,MAX(CurrentTermStartDate),MAX(RenewalDate)) 
FROM Staging..LineItem  WHERE ContractID=@CONTRACTID

------------------------- Stub Calcualtions start below ---------------------

SELECT @STUB_START=MAX(CurrentTermStartDate)  FROM Staging..LineItem  WHERE ContractID=@CONTRACTID;

SELECT @STUB_END=MAX(EOMONTH(CurrentTermStartDate)) FROM Staging..LineItem  WHERE ContractID=@CONTRACTID;

SELECT @STUB_MTH_TOTAL_DAYS=DAY(@STUB_END)

SELECT @STUB_START_DAY=DAY(@STUB_START)

SELECT @STUB_DIFF_DAYS=(@STUB_MTH_TOTAL_DAYS-@STUB_START_DAY)+1

SELECT @STUB_FRACTION=CAST(@STUB_DIFF_DAYS AS NUMERIC(18,4))/CAST(@STUB_MTH_TOTAL_DAYS AS NUMERIC(18,4))

SELECT @DISCOUNT_MTH_START=MAX(DiscountMonth) 
FROM Staging..LineItemDiscount LE 
     JOIN Staging..LineItem L ON LE.LineItemID=L.LineItemID
                                          WHERE ContractID=@CONTRACTID
SELECT @TRUE_DSC_PRD=MAX(RecurringMonths) 
FROM Staging..LineItemDiscount LE 
     JOIN Staging..LineItem L ON LE.LineItemID=L.LineItemID
                                          WHERE ContractID=@CONTRACTID

---------------------------- Monetary Calcualtions Start Below -------------
--------------------- Step 1. calculate the initial amount (contract value before Discounts ) 
SELECT @CONTRACT_REG_MTH_AMT=SUM(ISNULL(CurrentMonthlyPrice,0))
FROM Staging..LineItem  WHERE ContractID=@CONTRACTID

--------------------- Step2 calculate the Discount amount (value of Dicounts )
SELECT @CONTRACT_DSC_MTH_AMT=SUM(ISNULL(EffectiveDiscountAmount,0))
FROM Staging..LineItem  WHERE ContractID=@CONTRACTID

IF @DISCOUNT_MTH_START < @CURRENT_TERM AND @CONTRACT_DSC_MTH_AMT > 0
  BEGIN    SET @STRAIGHT_LINE_CONTRACT_FLG=1  END 

SET @TRUE_INI_PRD=(@CURRENT_TERM-@TRUE_DSC_PRD) + 1
SET @CONTRACT_INITAL_AMT=@CONTRACT_REG_MTH_AMT * @TRUE_INI_PRD

SET @TRUE_TERM=CAST(@CURRENT_TERM AS NUMERIC(18,4)) + CAST(@STUB_FRACTION AS NUMERIC(18,4))
SET @WATERFALL_AMT = @CONTRACT_INITAL_AMT / @TRUE_TERM
SET @WATERFALL_STUB_AMT = @WATERFALL_AMT * @STUB_FRACTION
--------------------------------------------------------
----------- DISPLAY INTERM RESULTS --------------------
--SELECT @CONTRACTID CONTRACTID
--SELECT @CURRENT_TERM CURRENT_TERM;
--SELECT @TRUE_DSC_PRD TRUE_DSC_PRD
--SELECT @TRUE_INI_PRD TRUE_INI_PRD
--SELECT @CONTRACT_INITAL_AMT CONTRACT_INITAL_AMT
--SELECT @CONTRACT_REG_MTH_AMT CONTRACT_REG_MTH_AMT
--SELECT @CONTRACT_DSC_MTH_AMT CONTRACT_DSC_MTH_AMT
--SELECT @DISCOUNT_MTH_START DISCOUNT_MTH_START
--SELECT @CONTRACT_INITAL_AMT CONTRACT_INITAL_AMT
--SELECT @CONTRACT_REG_MTH_AMT CONTRACT_REG_MTH_AMT
--SELECT @TRUE_TERM TRUE_TERM 
--SELECT @STUB_FRACTION STUB_FRACTION
--SELECT @WATERFALL_AMT WATERFALL_AMT
--SELECT @WATERFALL_STUB_AMT WATERFALL_STUB_AMT
--SELECT @STRAIGHT_LINE_CONTRACT_FLG STRAIGHT_LINE_CONTRACT_FLG
-------------------------------------------------------
---- Perform final Insert of the Results for that Contract

INSERT Staging..StraightLineDiscountContracts (
[ContractID],
[Waterfall_Amt],
[Waterfall_Stub_Amt],
[Contract_Final_Amt],
StraightLine_Flg
)
SELECT 
@CONTRACTID,
@WATERFALL_AMT,
@WATERFALL_STUB_AMT,
@CONTRACT_INITAL_AMT,
@STRAIGHT_LINE_CONTRACT_FLG









