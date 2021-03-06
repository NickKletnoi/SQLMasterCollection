USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_QRQ]    Script Date: 04/04/2008 14:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
SELECT * FROM Dim_QRQ

SELECT Distinct IncomeRating,Display_IncomeRating FROM Dim_QRQ

*/

CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_QRQ]
AS
BEGIN

SET NOCOUNT ON

CREATE TABLE #Dim_QRQ
(
QRQID_WK INT,
QRQ NVARCHAR(50),
RiskRating NVARCHAR(50),
InvestmentRating NVARCHAR(50),
IncomeRating NVARCHAR(50),
Display_RiskRating NVARCHAR(50),
Display_InvestmentRating NVARCHAR(50),
Display_IncomeRating NVARCHAR(50),
InsertDate DATETIME,
LastUpdateDate DATETIME
)
	
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('-1','None','','','','None','None','None',convert(datetime,'Mar 14 2008 10:28AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('1','NULL','','','','None','None','None',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('2','B-1-7','B','1','7','Medium','Buy','Same/Higher',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('3','C-1-7','C','1','7','High','Buy','Same/Higher',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('4','B-2-7','B','2','7','Medium','Neutral','Same/Higher',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('5','C-2-7','C','2','7','High','Neutral','Same/Higher',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('6','C-1-9','C','1','9','High','Buy','No Dividend',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('7','C-2-9','C','2','9','High','Neutral','No Dividend',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('8','A-1-7','A','1','7','Low','Buy','Same/Higher',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('9','A-2-7','A','2','7','Low','Neutral','Same/Higher',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('10','C-3-7','C','3','7','High','Underperform','Same/Higher',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('11','B-3-7','B','3','7','Medium','Underperform','Same/Higher',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('12','B-2-9','B','2','9','Medium','Neutral','No Dividend',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('13','B-1-9','B','1','9','Medium','Buy','No Dividend',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('14','C-2-8','C','2','8','High','Neutral','Same/Lower',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('15','C-3-9','C','3','9','High','Underperform','No Dividend',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('16','C-1-8','C','1','8','High','Buy','Same/Lower',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('17','A-3-7','A','3','7','Low','Underperform','Same/Higher',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('18','B-2-8','B','2','8','Medium','Neutral','Same/Lower',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('19','C-3-8','C','3','8','High','Underperform','Same/Lower',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('20','6','6','6','6','No Rating','No Rating','No Rating',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('21','B-1-8','B','1','8','Medium','Buy','Same/Lower',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('22','B-3-8','B','3','8','Medium','Underperform','Same/Lower',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('23','B-3-9','B','3','9','Medium','Underperform','No Dividend',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('24','A-3-8','A','3','8','Low','Underperform','Same/Lower',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('25','REVIEW','R','V','W','Review','Review','Review',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('26','A-2-8','A','2','8','Low','Neutral','Same/Lower',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('27','RSTR**','R','T','*','Restricted','Restricted','Restricted',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('28','2','2','2','2','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('29','A-2-9','A','2','9','Low','Neutral','No Dividend',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('30','XRVW','','','','ExtendedReview','ExtendedReview','ExtendedReview',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('31','A-1-8','A','1','8','Low','Buy','Same/Lower',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('32','A-1-9','A','1','9','Low','Buy','No Dividend',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('33','A-2','A','2','','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('34','1','1','1','1','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('35','B-1','B','1','','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('36','7-Jan','3','4','4','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('37','C-1','C','1','','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('38','B-2','B','2','','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('39','-6-','','','','No Rating','No Rating','No Rating',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('40','7-Feb','3','4','5','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('41','3','3','3','3','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('42','C-2','C','2','','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('43','F-3','F','3','','Closed End Fund','Underperform','Closed End Fund',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('44','IQXL-error 3045: Invalid draft status : 12948','I','X','8','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('45','IQXL-error 3055: Unable to connect any of the Part','I','X','t','Other','Other','Other',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('46','F-2','F','2','','Closed End Fund','Neutral','Closed End Fund',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('47','F-1','F','1','','Closed End Fund','Buy','Closed End Fund',convert(datetime,'Mar 13 2008 10:17AM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('48','A-6-7','A','6','7','Low','No','Same/Higher',convert(datetime,'Mar 31 2008  2:15PM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('50','C-6-7','C','6','7','High','No','Same/Higher',convert(datetime,'Mar 31 2008  2:16PM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('51','B-6-7','B','6','7','Medium','No','Same/Higher',convert(datetime,'Mar 31 2008  2:18PM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('52','C-6-9','C','6','9','High','No','No Dividend',convert(datetime,'Mar 31 2008  2:19PM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('53','---','-','-','-','Other','Other','Other',convert(datetime,'Mar 31 2008  2:20PM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('54','– – –','-','-','-','Other','Other','Other',convert(datetime,'Mar 31 2008  2:20PM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('55','1-7','','1','7','Other','Other','Other',convert(datetime,'Mar 31 2008  2:21PM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('56','2-7','','2','7','Other','Other','Other',convert(datetime,'Mar 31 2008  2:21PM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('57','3-8','','3','8','Other','Other','Other',convert(datetime,'Mar 31 2008  2:21PM'),convert(datetime,''))
		INSERT #Dim_QRQ(QRQID_WK,QRQ,RiskRating,InvestmentRating,IncomeRating,Display_RiskRating,Display_InvestmentRating,Display_IncomeRating,InsertDate,LastUpdateDate)       VALUES('58','C-3','C','3','','Other','Other','Other',convert(datetime,'Mar 31 2008  2:22PM'),convert(datetime,''))




	CREATE TABLE #QRQ_Stage
	(
	QRQ_Stage NVARCHAR(50),
	)

	INSERT INTO #QRQ_Stage
	(
	QRQ_Stage
	)
	SELECT DISTINCT QRQ FROM RDWDB..NG_Product
	
	SET IDENTITY_INSERT Dim_QRQ ON
	INSERT INTO dbo.Dim_QRQ
	(
	QRQ ,
	RiskRating,
	InvestmentRating,
	IncomeRating,
	Display_RiskRating,
	Display_InvestmentRating,
	Display_IncomeRating,
	InsertDate,
	LastUpdateDate
	)
	SELECT	QRQ ,
			RiskRating,
			InvestmentRating,
			IncomeRating,
			Display_RiskRating,
			Display_InvestmentRating,
			Display_IncomeRating,
			InsertDate,
			LastUpdateDate
	FROM
			#Dim_QRQ AS A 
	WHERE NOT EXISTS(SELECT * FROM Dim_QRQ B WHERE B.QRQ=A.QRQ)

	SET IDENTITY_INSERT Dim_QRQ OFF
	
	
	/*
	SELECT	QRQ_Stage,CASE WHEN QRQ_Stage IS NULL THEN 'Unknown' ELSE QRQ_Stage END,
			CASE WHEN QRQ_Stage IS NULL THEN '' ELSE LEFT(QRQ_Stage,1) END,
			CASE WHEN QRQ_Stage IS NULL THEN '' WHEN ISNUMERIC(SUBSTRING(QRQ_Stage,3,1))=0 THEN '' ELSE SUBSTRING(QRQ_Stage,3,1) END,
			CASE WHEN QRQ_Stage IS NULL THEN '' ELSE RIGHT(QRQ_Stage,1) END,
			GETDATE(),
			NULL 
	FROM 
		#QRQ_Stage WHERE NOT EXISTS(SELECT QRQID_WK FROM dbo.Dim_QRQ WHERE QRQ_Stage=QRQ)
				AND QRQ_Stage IS NOT NULL AND QRQ_Stage<>''
	*/


END

