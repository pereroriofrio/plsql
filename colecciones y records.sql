set serveroutput on
declare
type empleado is record (
   name varchar2(100),
   sal employees.salary%type,
   cod_dep employees.department_id%type
);

type emp_table is table of
  empleado
index by pls_integer;

empleados emp_table;

begin

for i in 100..206 loop
select first_name || ' '|| last_name, salary, department_id into empleados(i)
from employees where employee_id = i;
end loop;

for i in empleados.first..empleados.last loop
 dbms_output.put_line(empleados(i).name || ' ' || empleados(i).sal || ' ' || empleados(i).cod_dep );
end loop;

dbms_output.put_line(empleados(empleados.first).name);
dbms_output.put_line(empleados(empleados.last).name);
dbms_output.put_line(empleados.count);
for i in empleados.first..empleados.last loop
if empleados(i).sal < 7000 then
  empleados.delete(i);
end if;

end loop;
dbms_output.put_line(empleados.count);
end;