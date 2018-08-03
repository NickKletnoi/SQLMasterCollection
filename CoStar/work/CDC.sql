 
 
 ----------------------
 exec sp_cdc_enable_db;
 ----------------------
 exec sp_cdc_enable_table @source_schema='Apt', @Source_name='ProductList',@role_name=NULL;
 ----------------------

 select  *    from sys.tables where name like '%List%' order by name

  select * from cdc.Apt_ProductList_CT