USE [CoStar]
GO

/****** Object:  Table [cube].[F_MEA]    Script Date: 6/23/2017 11:34:44 AM ******/
DROP TABLE [cube].[F_MEA]
GO

/****** Object:  Table [cube].[F_MEA]    Script Date: 6/23/2017 11:34:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [cube].[F_MEA](
    [SKUID] [int] NULL,
	[ContractID] [int] NULL,
	[YR_MTH] [varchar](8) NULL,
	[CarveAmount] [money] NULL
) ON [PRIMARY]
------------------------------------------------
------ CREATE CUSTOMER DIMENSIONS --------------
------------------------------------------------

select *
into [cube].[D_Contract]
from [DCSQLPRD104].Enterprise.dbo.[Contract]
------------------------------------------------ 
select *
into [cube].[D_LineItem]
from [DCSQLPRD104].Enterprise.dbo.[LineItem]
------------------------------------------------
select *
into [cube].[D_GLAccount]
from [dbo].[D_GLAccount]
--------------------------------------------------
select *
into [cube].[D_Location]
from [dbo].[D_Location]
--------------------------------------------------
select *
into [cube].[D_Period]
from [dbo].[D_Period]
--------------------------------------------------
select *
into [cube].[D_Product]
from [dbo].[D_Product]
--------------------------------------------------------------
--------------------------------------------------------------

/*
Things to perform:
1. add Quarters for periods
2. add SIC for customer types
3. run the queries to make sure you are connecting
4. read 605 and 606;

*/

select count(distinct [LocationID]) as CntLocation, count(distinct [ContractID]) as CntContract
from [cube].[F_ProductRevenue]

--1,951,084


select distinct [LocationID] 
into cube.Location
from [cube].[F_ProductRevenue]

select * from cube.Location
