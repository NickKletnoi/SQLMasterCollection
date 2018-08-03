select * from Staging..SSIS_Config;
select * from staging..SSIS_Configurations;
-----------------------------------------------------------------------
UPDATE Cnfg
SET Cnfg.ConfiguredValue='2017-10-01'
from  Staging..SSIS_Config Cnfg 
where Cnfg.ConfigurationFilter = 'RevPro'
-----------------------------------------------------------------------
UPDATE Cnfg_s
SET Cnfg_s.ConfiguredValue='NOV17.'
from staging..SSIS_Configurations Cnfg_s
where Cnfg_s.ConfigurationFilter='sMonth'
------------------------------------------------------------------------
