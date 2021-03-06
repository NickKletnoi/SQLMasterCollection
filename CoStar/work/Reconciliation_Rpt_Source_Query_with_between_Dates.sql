USE [Staging]
GO
/****** Object:  StoredProcedure [rcl].[usp_ReconciliationRpt]    Script Date: 12/19/2017 2:21:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC  [rcl].[usp_ReconciliationRpt1] '201708'

ALTER PROCEDURE [rcl].[usp_ReconciliationRpt]
@RP VARCHAR(50)
AS

 DECLARE @DS INT=29 -- default day spread

 DECLARE @update_sql_head VARCHAR(MAX)='UPDATE RM SET RM.[LastRunDate]=GETDATE(), RM.[SourceRowCount]='
 DECLARE @update_sql_final VARCHAR(MAX)=''

 DECLARE @CURRENT_ReconciliationAreaName VARCHAR(150)

 DECLARE @CURRENT_SourceTableName VARCHAR(150)
 DECLARE @CURRENT_SourceServer VARCHAR(150)
 DECLARE @CURRENT_SourceDatabase VARCHAR(150)
 DECLARE @CURRENT_SourceDateFromColumnName Varchar(150)
 DECLARE @CURRENT_SourceDateToColumnName Varchar(150)


 DECLARE @CURRENT_TargetTableName VARCHAR(150)
 DECLARE @CURRENT_TargetServer VARCHAR(150)
 DECLARE @CURRENT_TargetDatabase VARCHAR(150)
 DECLARE @CURRENT_TargetDateFromColumnName VARCHAR(150)
 DECLARE @CURRENT_TargetDateToColumnName VARCHAR(150)

 
 DECLARE @CURRENT_SourceDollarValueColumnName VARCHAR(150)
 DECLARE @CURRENT_TargetDollarValueColumnName VARCHAR(150)

 DECLARE @CURRENT_SRC VARCHAR(1000)=''
 DECLARE @CURRENT_TGT VARCHAR(1000)=''


UPDATE RM
SET 
RM.[SourceRowCount]=NULL,
RM.[TargetRowCount]=NULL,
RM.[SourceDollarAmt]=NULL,
RM.[TargetDollarAmt]=NULL
FROM [rcl].[Reconciliation_Master] RM WHERE RM.[ReconciliationPeriod]=@RP AND [ActiveFlg]='Y';


DECLARE C CURSOR FOR
 
SELECT 
[ReconciliationAreaName],
[SourceServer],
[SourceDatabase],
[SourceTableName],
[SourceDollarValueColumnName],
[SourceDateFromColumnName],
[SourceDateToColumnName],
[TargetServer],
[TargetDatabase],
[TargetTableName],
[TargetDollarValueColumnName],
[TargetDateFromColumnName],
[TargetDateToColumnName]
FROM [rcl].[Reconciliation_Master] WHERE [ReconciliationPeriod]=@RP AND [ActiveFlg]='Y'
 
  
 OPEN C
 FETCH C into 
 @CURRENT_ReconciliationAreaName,
 @CURRENT_SourceServer,
 @CURRENT_SourceDatabase,
 @CURRENT_SourceTableName,
 @CURRENT_SourceDollarValueColumnName,
 @CURRENT_SourceDateFromColumnName,
 @CURRENT_SourceDateToColumnName,
 @CURRENT_TargetServer,
 @CURRENT_TargetDatabase,
 @CURRENT_TargetTableName,
 @CURRENT_TargetDollarValueColumnName,
 @CURRENT_TargetDateFromColumnName,
 @CURRENT_TargetDateToColumnName
 WHILE @@FETCH_STATUS = 0
 BEGIN
   
   SET @CURRENT_SRC = @CURRENT_SourceServer + '.'+ @CURRENT_SourceDatabase + '.' + @CURRENT_SourceTableName
   SET @CURRENT_TGT = @CURRENT_TargetServer + '.'+ @CURRENT_TargetDatabase + '.' + @CURRENT_TargetTableName
   SET @update_sql_final = @update_sql_head +'(SELECT COUNT(*) FROM ' + @CURRENT_SRC +' WHERE '+ @CURRENT_SourceDateFromColumnName + ' BETWEEN RevPro.dbo.fnGetDayFromPeriod('''+ @RP +''') AND DATEADD(dd,'+ CONVERT(CHAR(2),@DS) +',RevPro.dbo.fnGetDayFromPeriod('''+ @RP + ''')) ),' + 
   ' RM.[TargetRowCount]=(SELECT COUNT(*) FROM ' + @CURRENT_TGT+' WHERE '+ @CURRENT_TargetDateFromColumnName + ' BETWEEN RevPro.dbo.fnGetDayFromPeriod('''+ @RP + ''') AND DATEADD(dd,'+ CONVERT(CHAR(2),@DS) +',RevPro.dbo.fnGetDayFromPeriod('''+ @RP +''')) ), ' + 
   ' RM.[SourceDollarAmt]=(SELECT ISNULL(SUM(' + @CURRENT_SourceDollarValueColumnName +'),0) FROM ' + @CURRENT_SRC +' WHERE '+ @CURRENT_SourceDateFromColumnName + ' BETWEEN RevPro.dbo.fnGetDayFromPeriod('''+ @RP + ''') AND DATEADD(dd,'+ CONVERT(CHAR(2),@DS) +',RevPro.dbo.fnGetDayFromPeriod('''+ @RP + ''')) ),' + 
   ' RM.[TargetDollarAmt]=(SELECT ISNULL(SUM(' + @CURRENT_TargetDollarValueColumnName +'),0) FROM ' + @CURRENT_TGT +' WHERE '+ @CURRENT_TargetDateFromColumnName + ' BETWEEN RevPro.dbo.fnGetDayFromPeriod('''+ @RP +''') AND DATEADD(dd,'+ CONVERT(CHAR(2),@DS) +',RevPro.dbo.fnGetDayFromPeriod('''+ @RP + ''')) ) ' + 
   'FROM  [rcl].[Reconciliation_Master] RM  WHERE RM.[ReconciliationPeriod]=''' +  @RP + ''' AND RM.[ReconciliationAreaName]='''+@CURRENT_ReconciliationAreaName+'''' 
   		  		      
   PRINT @update_sql_final
   --EXEC (@update_sql_final)

FETCH C into 
 @CURRENT_ReconciliationAreaName,
 @CURRENT_SourceServer,
 @CURRENT_SourceDatabase,
 @CURRENT_SourceTableName,
 @CURRENT_SourceDollarValueColumnName,
 @CURRENT_SourceDateFromColumnName,
 @CURRENT_SourceDateToColumnName,
 @CURRENT_TargetServer,
 @CURRENT_TargetDatabase,
 @CURRENT_TargetTableName,
 @CURRENT_TargetDollarValueColumnName,
 @CURRENT_TargetDateFromColumnName,
 @CURRENT_TargetDateToColumnName
 END

 CLOSE C
 DEALLOCATE C



