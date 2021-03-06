/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ConfigurationFilter]
      ,[ConfiguredValue]
      ,[PackagePath]
      ,[ConfiguredValueType]
  FROM [Staging].[dbo].[SSIS_Configurations]



  select * from [Staging].[dbo].[SSIS_Configurations]

  delete from [Staging].[dbo].[SSIS_Configurations] where ConfigurationFilter ='Server';
  delete from [Staging].[dbo].[SSIS_Configurations] where ConfigurationFilter ='Database';


   select * 
   into [dbo].[SSIS_Configurations]
   from   [Staging].[dbo].[SSIS_Configurations]



   Update table1
set LastUpdated = getdate()
from inserted i, table1 a
where i.pk1 = a.pk1

alter TRIGGER [dbo].[trgr_SSIS_Configurations_Upd]
ON dbo.SSIS_Configurations
FOR UPDATE 
AS BEGIN
  UPDATE c
  SET c.ConfiguredValue = u.ConfiguredValue
  FROM inserted u JOIN  RevPro..dbo.SSIS_Configurations c ON u.ConfigurationFilter=c.ConfigurationFilter
 
END


select * from dbo.SSIS_Configurations

update c
set c.ConfiguredValue='2018-02-01'
from dbo.SSIS_Configurations c where c.ConfigurationFilter='RunPeriod'

drop trigger trgr_SSIS_Configurations_Upd

alter TRIGGER trgr_SSIS_Configurations_in_RevPro_Upd  
ON dbo.SSIS_Configurations 
AFTER UPDATE   
AS   
IF (UPDATE (ConfiguredValue) )  
BEGIN  

UPDATE RC
SET RC.ConfiguredValue=SC.ConfiguredValue
FROM dbo.SSIS_Configurations SC JOIN RevPro..SSIS_Configurations RC ON SC.ConfigurationFilter=RC.ConfigurationFilter
END;  
GO  

select * from RevPro..SSIS_Configurations
