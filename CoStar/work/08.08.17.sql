USE [RevPro]
GO

/****** Object:  Table [dbo].[C]    Script Date: 8/8/2017 4:25:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NewApts](
	[SKUID] [int] NULL,
	OldSkuName Varchar(50) null,
	NewSkuName Varchar(50) null
) ON [PRIMARY]

GO

delete from dbo.NewApts where SKUID in (
30046,
30047,
30105
);


update SP
SET SP.SkuName=CAST(SP.SKUID as varchar(20))+'-'+NA.NewSkuName
from [dbo].[SkuPrice] SP JOIN [dbo].[NewApts] NA ON SP.SKUID=NA.SKUID
----------------

update S
SET S.SkuName=SP.SkuName
from [dbo].[SkuPrice] SP JOIN dbo.Sku S ON SP.SKUID=S.SKUID 
where S.SKUID IN (select distinct SKUID from [dbo].[NewApts])
-------------

select * from dbo.SkuPrice where SkuName like '%Apt%'
UNION
select * from dbo.SkuPrice where SkuName like '%Find%'
----------------------------------------------------------

select * from dbo.Sku where SkuName like '%Apt%'
UNION
select * from dbo.Sku where SkuName like '%Find%'


