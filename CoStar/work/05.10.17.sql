USE [CoStar]
GO

/****** Object:  Table [dbo].[ProductAppts]    Script Date: 5/10/2017 2:55:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[ProductAppts1](
	[ProductID] [int] NULL,
	[SKUID] [int] NULL,
	[ProductName] [varchar](150) NULL,
	[SkuName] [varchar](150) NULL,
	[ProductDesc] [varchar](100) NULL,
	[NavisionProductCD] [varchar](10) NULL,
	[ProductPackage] [varchar](50) NULL,
	[ProductCategory] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



SELECT * FROM [dbo].[ProductAppts]

TRUNCATE TABLE [dbo].[ProductAppts1]
---------------------------------------
SELECT * FROM [dbo].[ProductAppts1]
UPDATE [ProductAppts1] SET ProductCategory='Legacy'
SELECT * FROM [ProductAppts1]
SELECT * FROM [dbo].[SkuAppts]
---------------------------------------









 select distinct
 [SKUID],
 SkuName=CAST([SKUID] AS VARCHAR(50))+'-'+'Appts'+'-'+[NetworkName]+'-'+[UnitSign]

--INTO SkuAppts3
 from [dbo].[ProductAppts1]

 SELECT 
 LIA.[LineItemID],
 LIA.ContractID,
 LIA.ProductID,
 LIA.MarketID,
 PA.SKUID,
 SkuName=CAST(PA.SKUID AS VARCHAR(50))+'-'+PA.ProductCategory+'-'+[NetworkName]+'-'+[UnitSign],
 LIA.Date,
 LIA.NetworkName,
 UnitSign,
 Amount
  INTO #ApptsNew2
     FROM [dbo].[LineItemApptsFinal] LIA JOIN [dbo].[ProductAppts1] PA ON 
 LIA.ProductID=PA.ProductID


 select *
 into LineItemApptsFinal2
  from #ApptsNew2

 select count(*) from #ApptsNew where SkuName like '%Appts%';
  select count(*) from #ApptsNew where SkuName like '%Finder%';

  select distinct Skuid, SkuName from [dbo].[LineItemApptsFinal2]
  order by SkuName
