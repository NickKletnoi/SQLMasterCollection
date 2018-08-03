USE [msdb]
GO

/****** Object:  StoredProcedure [dbo].[uspSendMail]    Script Date: 06/03/2011 13:39:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[uspSendMail]
AS



DECLARE @ERROR_Cnt  int
DECLARE @ERROR_CHKSUM_Cnt int
DECLARE @SUCCESS_CHKSUM_Cnt int
DECLARE @ERROR_Msg Varchar(1000)
DECLARE @ERROR_Msg1 Varchar(1000)
DECLARE @ERROR_Msg2 Varchar(1000)
DECLARE @SUCCESS_Msg Varchar(1000)
DECLARE @SUCCESS_Msg2 Varchar(2000)
DECLARE @SUCCESS_Msg3 Varchar(2000)
DECLARE @SUCCESS_Cnt int
DECLARE @ERROR_PKG Varchar(100)
DECLARE @PKG_RUN_TIME int
DECLARE @LAST_STEP Varchar(50)
DECLARE @START_STAMP DATETIME
DECLARE @END_STAMP DATETIME


SELECT @SUCCESS_Cnt=COUNT(*) FROM  WayneRaeSQLPROD.ERAEDWPROD.dbo.ComQaStgDataVerification

SELECT @ERROR_Cnt=Count(*)  FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
       WHERE event='OnError' AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
       
   
SELECT  @ERROR_CHKSUM_Cnt=Count(*)  FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
       WHERE event='ChkSumError' AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
   
 
SELECT  @SUCCESS_CHKSUM_Cnt=Count(*)  FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
       WHERE event='ChkSumSuccess' AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)

  
        
SELECT top 1 @ERROR_Msg=message,@ERROR_PKG=source  FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
       WHERE event='OnError' 
       AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
       ORDER BY id desc
       
SELECT  @ERROR_Msg2=message  FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
       WHERE event='OnError' 
       AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
       and ID=(Select MAX(id)-1 from  WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog  WHERE event='OnError' 
       AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11))       

-------------------- ChkSum Messeges -------------------------
SELECT top 1 @ERROR_Msg1=message FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
       WHERE event='ChkSumError' 
       AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
       ORDER BY id desc
       
SELECT top 1 @SUCCESS_Msg3=message FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
       WHERE event='ChkSumSuccess' 
       AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
       ORDER BY id desc
----------------------------------------------------------------

SELECT top 1 @END_STAMP=MAX(endtime),@LAST_STEP=source  FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
       WHERE LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
       AND (event='PackageEnd') 
       Group by source    
       
SELECT @START_STAMP=MIN(starttime)  FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
       WHERE LEFT(Cast(starttime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
       AND (event='PackageStart')

SELECT top 1 @PKG_RUN_TIME=DATEDIFF(mi,
(SELECT MIN(starttime)  FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
       WHERE LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
       AND (event='PackageStart')),
 (SELECT MAX(endtime)  FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
       WHERE LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
       AND (event='PackageEnd'))) FROM WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog 
 
 
 SET @ERROR_Msg=
               N'<HTML><body><p><font size ="2" face="arial"> '  +
              -- N'JOB RUN:	 NEW_ERAE_ETL PROD started on ' + Cast(@START_STAMP as Varchar(25)) + '<BR>' +
              -- N'DURATION:  ' + Cast(@PKG_RUN_TIME as varchar(5))+ ' min.' + '<BR>' +
               N'STATUS: 	   FAILED <BR>' +
               N'ERROR STEP:   The job failed on Step: ' + @ERROR_PKG + '<BR>' +
               N'ERROR MSG:   '+@ERROR_Msg + ' : ' +  @ERROR_Msg2 +
               N'</font></p></body></html>'
               
                 
 SET @SUCCESS_Msg=
               N'<HTML><body><p><font size ="2" face="arial"> '  +
               N'DURATION:    ' + Cast(@PKG_RUN_TIME as varchar(5))+ ' min.' + '<BR>' +
               N'STATUS: 	     SUCCESS <BR>' +
               N'JOB RUN:	    NEW_ERAE_ETL PROD started on ' + Cast(@START_STAMP as Varchar(25)) + '<BR>' +
               N'MESSAGES:     The job succeeded. The last step to run was: ' + @LAST_STEP +
               N'</font></p></body></html>'
  
   
 SET @SUCCESS_Msg2=
			 N'<HTML><body><p><font size ="2" face="arial"> The Enterprise Reporting & Analytic Environment(ERAE) has encountered <b>' + Cast(@SUCCESS_Cnt as varchar(5))+
              N' </b>Items that require corrective action when intergrating data from the ' +
              N'PSFT1 - Peoplesoft 8.8' +
              N' environment. These ' +
              N' errors are compromising ERAE strategic and operational objectives to provide complete, accurate, consistent, reliable and trusted information to its Users. The following data sources below require your immediate attention for remediation, and the specific errors can be found within the ' +
              N' <a href="http://sales.gaf.com/Reports/ReportsLibrary/DataStagingErrorVerification.rdl">Data Staging Error Verification Report</a> ' +
              N' residing in the Quality Assurance Framework folder.<BR><BR> ' +
              N'                                                              ' +
              N'Regards, <BR>' +
              N'<b><i>Enterprise Business Intelligence</i></b><BR>' +
              N'</font></p></body></html>'
            
    
    
 IF @ERROR_Cnt=0    

BEGIN

EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'ERAEAdmin',
    @recipients = 'ERAEAdmin@gaf.com',
    @subject = 'NEW ERAE ETL on PROD' ,
    @body_format = 'HTML' ,
	@importance = 'High',
    @body = @SUCCESS_Msg


EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'ERAEAdmin',
    @recipients = 'ERAEAdmin@gaf.com',
    @subject = 'NEW ERAE ETL on PROD' ,
    @body_format = 'HTML' ,
	@importance = 'High',
    @body = @SUCCESS_Msg2
    
 UPDATE WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog
 SET event='PackageStart-emailed'
 WHERE event='PackageStart' AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
 
 UPDATE WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog
 SET event='PackageEnd-emailed'
 WHERE event='PackageEnd' AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
    
 END   
 
 IF @ERROR_Cnt<>0    

BEGIN

EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'ERAEAdmin',
    @recipients = 'ERAEAdmin@gaf.com',
    @subject = 'NEW ERAE ETL on PROD' ,
    @importance = 'High',
    @body_format = 'HTML' ,
    @body = @ERROR_Msg
    
 UPDATE WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog
 SET event='OnError-emailed'
 WHERE event='OnError' AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
 
 UPDATE WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog
 SET event='PackageStart-emailed'
 WHERE event='PackageStart' AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
 
 UPDATE WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog
 SET event='PackageEnd-emailed'
 WHERE event='PackageEnd' AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
 
 
    
 END   
 

------------ CheckSum Starts Here ------------------------------------------------------------

IF @ERROR_CHKSUM_Cnt>0    

BEGIN

EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'ERAEAdmin',
    @recipients = 'ERAEAdmin@gaf.com',
    @subject = 'CheckSum Error in ERAEDWPROD' ,
    @importance = 'High',
    @body = @ERROR_Msg1
    
 UPDATE WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog
 SET event='ChkSumError-emailed'
 WHERE event='ChkSumError' AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
 
    
 END   
 
IF @SUCCESS_CHKSUM_Cnt>0    

BEGIN

EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'ERAEAdmin',
    @recipients = 'ERAEAdmin@gaf.com',
    @subject = 'CheckSum Success in ERAEDWPROD' ,
    @importance = 'High',
    @body = @SUCCESS_Msg3
    
 UPDATE WayneRaeSQLPROD.ERAEDWPROD.dbo.sysssislog
 SET event='ChkSumSuccess-emailed'
 WHERE event='ChkSumSuccess' AND LEFT(Cast(endtime as char(25)),11)=LEFT(Cast(GetDate() as char(25)),11)
 
    
 END   
 


GO

