set serveroutput on
begin
for i in (select * from regions)loop
dbms_output.put_line(i.region_name);
end loop;
end;