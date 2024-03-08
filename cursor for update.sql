--cursores for update
set serveroutput on
declare
cursor c1 is select * from employees for update;
empl employees%rowtype;
begin
open c1;
loop
fetch c1 into empl;
exit when c1%notfound;
if empl.commission_pct is not null then
update employees set salary =salary * 1.15 where current of c1;
else
update employees set salary =salary * 1.10 where current of c1;
end if;
end loop;
close c1;
end;
/