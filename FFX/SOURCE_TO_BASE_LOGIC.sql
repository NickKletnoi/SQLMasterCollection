CREATE PROCEDURE [etl].[META_ETL1B_LOAD_SRC_TO_BASE3]
@table_name VARCHAR(200),
@file_name VARCHAR(200)
AS
BEGIN TRY
 --- variable declaration section----------
 DECLARE @insert_sql_stmt VARCHAR (max)='DECLARE @FileID INT Select @FileID =  max(FILE_INSTANCE_ID) from etl.META_FILE_INSTANCE where FILE_INSTANCE_NAME = ' + ''''+@file_name +'''' +' INSERT INTO base.' + @table_name + '(' + char(13) 
 DECLARE @update_sql_head VARCHAR(max)='DECLARE @FileID INT Select @FileID =  max(FILE_INSTANCE_ID) from etl.META_FILE_INSTANCE where FILE_INSTANCE_NAME = ' + ''''+@file_name +'''' + char(13) 
 DECLARE @select_sql_head VARCHAR(max)='DECLARE @FileID INT Select @FileID =  max(FILE_INSTANCE_ID) from etl.META_FILE_INSTANCE where FILE_INSTANCE_NAME = ' + ''''+@file_name +'''' + char(13) 
 DECLARE @select_sql_stmt VARCHAR(max) ='SELECT '
 DECLARE @select_sql_stmt2 VARCHAR(max) ='SELECT '
 DECLARE @insert_sql_hist VARCHAR(max)
 DECLARE @update_sql_stmt VARCHAR(max)=' UPDATE ##TEMP SET ERROR_FLG=1 WHERE '+ char(13) 
 DECLARE @update_sql_OR VARCHAR(max)=' IS NOT NULL OR '+ char(13) 
 DECLARE @add_column_temp VARCHAR(max)='ALTER TABLE ##TEMP ADD ERROR_FLG BIT'
 DECLARE @update_sql_flg VARCHAR(max)='UPDATE b set b.ERROR_FLG=t.ERROR_FLG FROM base.' + @table_name +' AS b JOIN ##TEMP AS t ON b.ROW_ID=t.ROW_ID AND b.FILE_INSTANCE_ID=t.FILE_INSTANCE_ID'  
 DECLARE @update_lne VARCHAR(max)
 DECLARE @update_lne1 VARCHAR(max)
 DECLARE @select_lne VARCHAR(max)
 DECLARE @select_lne1 VARCHAR(max)
 DECLARE @select_lne2 VARCHAR(max)
 DECLARE @insert_lne VARCHAR(max)
 DECLARE @sql_stmt VARCHAR(max)
 DECLARE @sql_stmt2 VARCHAR(max)
 DECLARE @upd_stmt VARCHAR(max)
 DECLARE @data_type VARCHAR(50)
 DECLARE @TEMP VARCHAR (2000)
 DECLARE @FileRowCount INT
 DECLARE @FileInstanceId INT
 DECLARE @position_of_from INT
 --Generic Variables
 DECLARE @Proc_Name varchar(50) 
 DECLARE @Source_Type varchar(15)
 DECLARE @Error_Message varchar(8000)
  
 --Set Value to Generic Variables
 SET @Proc_Name = '[etl].[META_ETL1B_LOAD_SRC_TO_BASE]'
 SET @Source_Type = 'BASE'
 select @FileInstanceId = MAX(FILE_INSTANCE_ID) from etl.META_FILE_INSTANCE F where F.FILE_INSTANCE_NAME = @file_name
 
 --Log Start of Proc
 EXEC etl.META_ETL_LOGGING 'START',@Proc_Name,@table_name,@Source_Type
 
 
 --PRINT @table_name
 --EXECUTE ('truncate table '+'base.'+@table_name)
 ------ SELECT CURSOR STARTS HERE ----------------
 DECLARE select_cursor CURSOR FOR
 SELECT '' + CASE ROW_NUMBER() OVER (ORDER BY META_MASTER_ID) WHEN 1 THEN '' ELSE ',' END + SRC_COLUMN_NAME,
 ISNULL(
  substring(target_table, charindex('(',target_table)+1,ABS(charindex(')',target_table)-charindex('(',target_table)-1))
 ,'-'),BASE_COLUMN_NAME
 FROM etl.META_MASTER1
 WHERE TABLE_NAME = @table_name and BASE_COLUMN_NAME IS NOT NULL
 ORDER BY ROW_NUMBER() OVER (ORDER BY META_MASTER_ID)
 OPEN select_cursor 
 FETCH select_cursor into @select_lne,@data_type,@select_lne1
 
 WHILE @@FETCH_STATUS = 0
 BEGIN
 
 
 IF UPPER(LEFT(RTRIM(LTRIM(CAST(@data_type as CHAR(1)))),1)) ='I' --INTEGER
        BEGIN
        
           IF LEFT(@select_lne,1)=','
           BEGIN
               SET @select_sql_stmt = @select_sql_stmt + 'CASE  WHEN ISNUMERIC('+ RIGHT(@select_lne,LEN(@select_lne)-1) +') = 1 THEN  ' + RIGHT(@select_lne,LEN(@select_lne)-1) +' END as ' + 
              -- RIGHT(@select_lne1,LEN(@select_lne1)-1)
              @select_lne1
               + CHAR(13) 
               + ', CASE  WHEN ISNUMERIC('+ RIGHT(@select_lne,LEN(@select_lne)-1) +') <> 1  THEN  1  END as '+
               --RIGHT(@select_lne1,LEN(@select_lne1)-1) 
               @select_lne1
               +'_ERROR , ' + CHAR(13)
           END
           ELSE  -- For first Column
           BEGIN
  --  SET @select_sql_stmt = @select_sql_stmt + 'CASE  WHEN ISNUMERIC('+ @select_lne + ')=0 THEN 9999 ELSE ' + @select_lne + ' END, ' + CHAR(13)
    
    SET @select_sql_stmt = @select_sql_stmt + 'CASE  WHEN ISNUMERIC('+ @select_lne +') = 1 THEN  ' + @select_lne +' END as ' + @select_lne+ CHAR(13) + ', CASE  WHEN ISNUMERIC('+ @select_lne+') <> 1  THEN  1  END as '+@select_lne +'_ERROR , ' + CHAR(13)
           END
        
        END
         ELSE 
         
    ---
    IF UPPER(LEFT(RTRIM(LTRIM(CAST(@data_type as CHAR(1)))),1)) ='D' --DATE
        BEGIN
        
           IF LEFT(@select_lne,1)=','
           BEGIN
               SET @select_sql_stmt = @select_sql_stmt + 'CASE  WHEN ISDATE('+ RIGHT(@select_lne,LEN(@select_lne)-1) +') = 1 THEN  ' + RIGHT(@select_lne,LEN(@select_lne)-1) +' END as ' + 
              -- RIGHT(@select_lne1,LEN(@select_lne1)-1)
              @select_lne1
               + CHAR(13) 
               + ', CASE  WHEN ISDATE('+ RIGHT(@select_lne,LEN(@select_lne)-1) +') <> 1  THEN  1  END as '+
               --RIGHT(@select_lne1,LEN(@select_lne1)-1) 
               @select_lne1
               +'_ERROR , ' + CHAR(13)
           END
           ELSE  -- For first Column
           BEGIN
  --  SET @select_sql_stmt = @select_sql_stmt + 'CASE  WHEN ISDATE('+ @select_lne + ')=0 THEN 9999 ELSE ' + @select_lne + ' END, ' + CHAR(13)
    
    SET @select_sql_stmt = @select_sql_stmt + 'CASE  WHEN ISDATE('+ @select_lne +') = 1 THEN  ' + @select_lne +' END as ' + @select_lne+ CHAR(13) + ', CASE  WHEN ISDATE('+ @select_lne+') <> 1  THEN  1  END as '+@select_lne +'_ERROR , ' + CHAR(13)
           END
        
        END
         ELSE 
    
         
    ---     
   IF UPPER(LEFT(RTRIM(LTRIM(CAST(@data_type as CHAR(1)))),1)) ='M' --MONEY
        BEGIN
        
           IF LEFT(@select_lne,1)=','
           BEGIN
          SET @select_sql_stmt = @select_sql_stmt + 'CASE  WHEN ISNUMERIC(CONVERT(NUMERIC(20,4),'+ 
          RIGHT(@select_lne,LEN(@select_lne)-1) +')) = 1 THEN  ' + RIGHT(@select_lne,LEN(@select_lne)-1) +' END as ' + RIGHT(@select_lne,LEN(@select_lne)-1)+ CHAR(13) + ', CASE  WHEN ISNUMERIC( CONVERT(NUMERIC(20,4),'+ RIGHT(@select_lne,LEN(@select_lne)-1) +')) <> 1  THEN  1  END as '+RIGHT(@select_lne,LEN(@select_lne)-1) +'_ERROR , ' + CHAR(13)
           END
           ELSE   -- For first Column
           BEGIN
    SET @select_sql_stmt = @select_sql_stmt + 'CASE  WHEN ISNUMERIC(CONVERT(NUMERIC(20,4),'+ @select_lne +')) = 1 THEN  ' + @select_lne +' END as ' + @select_lne+ CHAR(13) + ', CASE  WHEN ISNUMERIC(CONVERT(NUMERIC(20,4),'+ @select_lne+')) <> 1 THEN  1  END as '+@select_lne +'_ERROR , ' + CHAR(13)
           END
        
        END
         ELSE       
         
    
   IF ISNUMERIC(LEFT(RTRIM(LTRIM(CAST(@data_type as CHAR(1)))),1)) =1 --VARCHAR
   
        BEGIN
        
        
        IF LEFT(@select_lne,1)=','
           BEGIN
           SET @select_sql_stmt = @select_sql_stmt + 'CASE  WHEN LEN('+ RIGHT(@select_lne,LEN(@select_lne)-1) +')<=' +@data_type + ' THEN  ' + RIGHT(@select_lne,LEN(@select_lne)-1) +' END as ' + RIGHT(@select_lne,LEN(@select_lne)-1)+ CHAR(13) + ', CASE  WHEN LEN('+ RIGHT(@select_lne,LEN(@select_lne)-1) +')>' +@data_type + ' THEN  1  END as '+RIGHT(@select_lne,LEN(@select_lne)-1) +'_ERROR , ' + CHAR(13)
           END
           ELSE   -- For first Column
           BEGIN
    SET @select_sql_stmt = @select_sql_stmt + 'CASE  WHEN LEN('+ @select_lne +')<= '+@data_type + ' THEN  ' + @select_lne +' END as ' + @select_lne+ CHAR(13) + ', CASE  WHEN LEN('+ @select_lne+') >' +@data_type + '  THEN  1  END as '+@select_lne +'_ERROR , ' + CHAR(13)
           END
                
        END
        ELSE    
         
        BEGIN
    SET @select_sql_stmt = @select_sql_stmt + @select_lne+' '+ @data_type+ CHAR(13)
        END
  
  FETCH select_cursor into @select_lne,@data_type,@select_lne1
  
 END
 --print @table_name
 SET @select_sql_stmt = @select_sql_head + ' ' + LEFT(@select_sql_stmt,LEN(@select_sql_stmt)-3) +  CHAR(13)+ ' INTO ##TEMP FROM src.' +@table_name + ''
 
 
 
 CLOSE select_cursor
 DEALLOCATE select_cursor
 --SET @sql_stmt = @insert_sql_stmt + @select_sql_stmt
 --SELECT @select_sql_stmt
 --Create Temp table and load data from SRC table
 EXEC (@select_sql_stmt)
 ------------------------------------------------------------------------------------------------------
 -- Update Cursor starts here ------------
 -----------------------------------------
 --Add ERRROR_FLAG column in the temp table
 EXEC (@add_column_temp)
 --PRINT @add_column_temp
 
 
    DECLARE update_cursor CURSOR FOR
 SELECT '' + CASE ROW_NUMBER() OVER (ORDER BY META_MASTER_ID) WHEN 1 THEN '' ELSE ',' END + SRC_COLUMN_NAME, BASE_COLUMN_NAME
 FROM etl.META_MASTER1
 WHERE TABLE_NAME = @table_name and BASE_COLUMN_NAME IS NOT NULL
 ORDER BY ROW_NUMBER() OVER (ORDER BY META_MASTER_ID)
 OPEN update_cursor 
 FETCH update_cursor into @update_lne,@update_lne1
 WHILE @@FETCH_STATUS = 0
 BEGIN
          IF LEFT(@update_lne,1)=','
           BEGIN 
               
                SET @update_sql_stmt = @update_sql_stmt + 
                --RIGHT(@update_lne1,LEN(@update_lne1)-1)
                  @update_lne1
                +'_ERROR IS NOT NULL OR '+ char(13)
           END
           ELSE   -- For first Column
           BEGIN
    SET @update_sql_stmt = @update_sql_stmt + @update_lne +'_ERROR IS NOT NULL OR'+ char(13)
           END
        
  FETCH update_cursor into @update_lne,@update_lne1
 END
 SET @update_sql_stmt = @update_sql_head + @update_sql_stmt
 SET @update_sql_stmt = LEFT(@update_sql_stmt,LEN(@update_sql_stmt)-4)
 
 CLOSE update_cursor
 DEALLOCATE update_cursor
 
 --- EXECUTE BOTH THE THESE STATEMENTS BELOW ----
 
 --PRINT @update_sql_stmt
 EXEC (@update_sql_stmt)
 
 
 
 
 --------- INSERT CURSOR STARTS HERE ----------
 DECLARE insert_cursor CURSOR FOR
 SELECT '' + CASE ROW_NUMBER() OVER (ORDER BY META_MASTER_ID) WHEN 1 THEN '' ELSE ',' END + BASE_COLUMN_NAME
 FROM etl.META_MASTER1
 WHERE TABLE_NAME = @table_name and BASE_COLUMN_NAME IS NOT NULL
 ORDER BY ROW_NUMBER() OVER (ORDER BY META_MASTER_ID)
 OPEN insert_cursor 
 FETCH insert_cursor into @insert_lne
 WHILE @@FETCH_STATUS = 0
 BEGIN
  set @insert_sql_stmt = @insert_sql_stmt + @insert_lne + CHAR(13)
  FETCH insert_cursor into @insert_lne
 END
 SET @insert_sql_stmt = @insert_sql_stmt + ') '
 CLOSE insert_cursor
 DEALLOCATE insert_cursor
 --print @insert_sql_stmt
 ---- select cursor starts here ---------
 
   DECLARE select_cursor2 CURSOR FOR
 SELECT '' + CASE ROW_NUMBER() OVER (ORDER BY META_MASTER_ID) WHEN 1 THEN '' ELSE ',' END + BASE_COLUMN_NAME
 FROM etl.META_MASTER1
 WHERE TABLE_NAME = @table_name and BASE_COLUMN_NAME IS NOT NULL
 ORDER BY ROW_NUMBER() OVER (ORDER BY META_MASTER_ID)
 OPEN select_cursor2 
 FETCH select_cursor2 into @select_lne2
 
 WHILE @@FETCH_STATUS = 0
 BEGIN
  set @select_sql_stmt2 = @select_sql_stmt2 + @select_lne2 + CHAR(13)
  FETCH select_cursor2 into @select_lne2
  
 END
 SET @select_sql_stmt2 = @select_sql_stmt2 + ' FROM ##TEMP '
 
 CLOSE select_cursor2
 DEALLOCATE select_cursor2
 SET @sql_stmt2 = @insert_sql_stmt + @select_sql_stmt2
 
 
 --Final load into BASE from Temp table
 --PRINT @sql_stmt2
 EXEC (@sql_stmt2)
 EXEC (@update_sql_flg)
 
 
   -------- Inserting Row Count into table
 set @FileRowCount = @@ROWCOUNT
 UPDATE etl.META_ROWCOUNT 
 SET REALTIME_LOAD_STATUS = 'BASE LOADING...'
 WHERE FILE_INSTANCE_ID = @FileInstanceId
 
 EXECUTE (@sql_stmt)
 set @insert_sql_hist = 'INSERT hist.' + @table_name +' '+@select_sql_stmt
 --print @insert_sql_hist
 EXECUTE (@insert_sql_hist)
  
 set @FileRowCount = @@ROWCOUNT
 UPDATE etl.META_ROWCOUNT 
 SET BASE_TABLE_ROW_COUNT = @FileRowCount
 WHERE FILE_INSTANCE_ID = @FileInstanceId
 
 set @FileRowCount = @@ROWCOUNT
 UPDATE etl.META_ROWCOUNT 
 SET REALTIME_LOAD_STATUS = 'LOADING COMPLETED'
 WHERE FILE_INSTANCE_ID = @FileInstanceId

 
--Log End
 EXEC etl.META_ETL_LOGGING 'END',@Proc_Name,@table_name,@Source_Type
END TRY
BEGIN CATCH
-------------ERROR HANDLING AREA
 SET @Error_Message = ERROR_MESSAGE() 
 EXEC etl.META_ETL_LOGGING 'FAILED',@Proc_Name,@table_name,@Source_Type,@Error_Message
 RETURN 1
 
END CATCH
GO
