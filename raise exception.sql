set serveroutput on

declare
control_regions exception;
region_code regions.region_id%type;
begin
region_code := 201; 

if region_code > 200 then
 raise control_regions;
end if;

insert into regions(region_id, region_name)
values(region_code, 'test');
commit;
exception 
  when control_regions then
     dbms_output.put_line('Codigo no permito, debe ser inferior a 200');
  when others then
     dbms_output.put_line(sqlcode);
     dbms_output.put_line(sqlerrm);
end;