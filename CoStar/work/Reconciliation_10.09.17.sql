USE [CoStar]
GO
/****** Object:  StoredProcedure [dbo].[ReconciliationRpt]    Script Date: 10/9/2017 4:54:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec [dbo].[ReconciliationRpt] 'SOURCE_TO_DW'


ALTER PROCEDURE [dbo].[ReconciliationRpt]
@RA VARCHAR(50)='SOURCE_TO_DW'
AS
 ---------------------------------
 DECLARE @SrcRowCnt INT 
 declare @SrcRowCnt_sql varchar(max)=''
 DECLARE @TgtRowCnt INT
 DECLARE @SrcAmt Money
 DECLARE @TgtAmt Money
  --------------------------------

 DECLARE @update_sql_SrcRowCnt_head VARCHAR(MAX)='UPDATE RM SET RM.[LastRunDate]=GETDATE(), RM.[SourceRowCount]='
 DECLARE @insert_sql_TgtRowCnt_head VARCHAR(MAX)='UPDATE RM SET RM.[LastRunDate]=GETDATE(), RM.[TargetRowCount]='
 DECLARE @insert_sql_SrcAmt_head VARCHAR(MAX)='UPDATE RM SET RM.[LastRunDate]=GETDATE(), RM.[SourceDollarAmt]='
 DECLARE @insert_sql_TgtAmt_head VARCHAR(MAX)='UPDATE RM SET RM.[LastRunDate]=GETDATE(), RM.[TargetDollarAmt]='
 
  -------------------------------
 DECLARE @update_sql_SrcRowCnt_final VARCHAR(MAX)=''
 DECLARE @insert_sql_TgtRowCnt_final VARCHAR(MAX)=''
 DECLARE @insert_sql_SrcAmt_final VARCHAR(MAX)=''
 DECLARE @insert_sql_TgtAmt_final VARCHAR(MAX)=''
 

 DECLARE @CURRENT_CONTRACTID INT
 
 DECLARE @CURRENT_CLN VARCHAR(150)
 DECLARE @CURRENT_CSN VARCHAR(150)
 DECLARE @CURRENT_CN VARCHAR(150)
 --------------------------------

 DECLARE @CURRENT_TableName VARCHAR(150)
 DECLARE @CURRENT_SourceServer VARCHAR(150)
 DECLARE @CURRENT_SourceDatabase VARCHAR(150)
 DECLARE @CURRENT_TargetServer VARCHAR(150)
 DECLARE @CURRENT_TargetDatabase VARCHAR(150)
 DECLARE @CURRENT_ValueColumnName VARCHAR(150)
 DECLARE @CURRENT_SRC VARCHAR(1000)=''
 DECLARE @CURRENT_TGT VARCHAR(1000)=''

 DECLARE C CURSOR FOR
 
 
SELECT [TableName],[SourceServer],[SourceDatabase],[TargetServer],[TargetDatabase],[ValueColumnName]
FROM [rcl].[Reconciliation_Master] WHERE [ReconciliationArea]=@RA
 
  
 OPEN C
 FETCH c into @CURRENT_TableName,@CURRENT_SourceServer,@CURRENT_SourceDatabase,@CURRENT_TargetServer,@CURRENT_TargetDatabase,@CURRENT_ValueColumnName
 WHILE @@FETCH_STATUS = 0
 BEGIN
   
   SET @CURRENT_SRC = @CURRENT_SourceServer + '.'+ @CURRENT_SourceDatabase + '.' + @CURRENT_TableName
   SET @CURRENT_TGT = @CURRENT_TargetServer + '.'+ @CURRENT_TargetDatabase + '.' + @CURRENT_TableName
   SET @update_sql_SrcRowCnt_final = @update_sql_SrcRowCnt_head + 
   '(SELECT COUNT(*) FROM ' + @CURRENT_SRC + '), RM.[TargetRowCount]='+ 
   '(SELECT COUNT(*) FROM ' + @CURRENT_TGT + '), RM.[SourceDollarAmt]='+ 
   '(SELECT SUM(' + @CURRENT_ValueColumnName +') FROM ' + @CURRENT_SRC +'), RM.[TargetDollarAmt]=' +
   '(SELECT SUM(' + @CURRENT_ValueColumnName +') FROM ' + @CURRENT_TGT +') ' +
   'FROM  [rcl].[Reconciliation_Master] RM  WHERE RM.[ReconciliationArea]=''' +  @RA + ''' AND RM.[TableName]='''+@CURRENT_TableName+'''' 
   		  		      
   PRINT @update_sql_SrcRowCnt_final
   --EXEC (@update_sql_SrcRowCnt_final)

FETCH c into @CURRENT_TableName,@CURRENT_SourceServer,@CURRENT_SourceDatabase,@CURRENT_TargetServer,@CURRENT_TargetDatabase,@CURRENT_ValueColumnName
 END

 CLOSE C
 DEALLOCATE C
