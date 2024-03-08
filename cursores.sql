set serveroutput on
declare
cursor c1 is select * from regions;
v1 regions%rowtype;
begin

open c1;
fetch c1 into v1;
dbms_output.put_line(v1.region_name);
fetch c1 into v1;
dbms_output.put_line(v1.region_name);

close c1;

end;
/
--loop cursor
declare
cursor c1 is select * from regions;
v1 regions%rowtype;
begin
open c1;

loop
fetch c1 into v1;
exit when c1%notfound;
dbms_output.put_line(v1.region_name);
end loop;
close c1;

--for cursor
for i in c1 loop -- esto abre, recorre, finaliza y cierra el cursor
dbms_output.put_line(i.region_name);
end loop;

end;