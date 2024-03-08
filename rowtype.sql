--create table REGIONES  as select * from regions where 1 = 2

declare 
reg1 regions%rowtype;

begin

select * into reg1 from regions where region_id = 1;

insert into regiones values reg1;
commit;

end;
/

declare
reg1 regions%rowtype;
begin
reg1.region_id := 1;
reg1.region_name := 'AUSTRALIA';

update regiones set row=reg1 where region_id = 1;
commit;

end;