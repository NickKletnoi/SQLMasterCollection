-----------------------------------------------------------------
CREATE TABLE [dbo].[LoopCntTest](
	[Cnt] [int] NULL,
	[StartP] [int] NULL,
	[EndP] [nchar](10) NULL
) ON [PRIMARY]
;
INSERT [dbo].[LoopCntTest] ([Cnt], [StartP], [EndP]) VALUES (1, 1,5); 
INSERT [dbo].[LoopCntTest] ([Cnt], [StartP], [EndP]) VALUES (2, 6,10);
INSERT [dbo].[LoopCntTest] ([Cnt], [StartP], [EndP]) VALUES (3, 11,15);
INSERT [dbo].[LoopCntTest] ([Cnt], [StartP], [EndP]) VALUES (4, 16,20);
INSERT [dbo].[LoopCntTest] ([Cnt], [StartP], [EndP]) VALUES (5, 21,25);

------------------------------------------------------------------
 DECLARE @CURRENT_Cnt INT
 DECLARE @CURRENT_StartP INT
 DECLARE @CURRENT_EndP INT

-- select top 17 ROW_NUMBER() over (order by customername) as r, CustomerName  into dbo.c  from cube.D_Customer 

 DECLARE C CURSOR FOR  select [Cnt],[StartP],[EndP]  from [dbo].[LoopCntTest];
   
 OPEN C
 FETCH c into @CURRENT_Cnt,@CURRENT_StartP,@CURRENT_EndP
 WHILE @@FETCH_STATUS = 0
 BEGIN
							 SELECT CustomerName FROM c where r BETWEEN @CURRENT_StartP AND @CURRENT_EndP    

    FETCH c into @CURRENT_Cnt,@CURRENT_StartP,@CURRENT_EndP
 END

 CLOSE C
 DEALLOCATE C





