--practicas cursores
--pratica 1
set serveroutput on
declare 
cursor empleados is select * from employees;
empleado employees%rowtype;
nombre_jefe varchar2(50);
begin
open empleados;
loop
fetch empleados into empleado;
exit when empleados%notfound;

nombre_jefe:= empleado.first_name ||' '|| empleado.last_name;
if  nombre_jefe = 'Steven King' then
raise_application_error(-20001, 'El sueldo del jefe no se puede mostrar');
else
dbms_output.put_line(empleado.first_name || ' '||empleado.last_name||' '|| empleado.salary);
end if;
end loop;
close empleados;
end;
/
--pratica 2
set serveroutput on
declare
cursor empleados is select * from employees;
cursor departamentos(empleado_id number) is select * from departments
where manager_id = empleado_id;
empleado employees%rowtype;
departamento departments%rowtype;

begin
open empleados;
loop
fetch empleados into empleado;
exit when empleados%notfound;
 open departamentos(empleado.employee_id);
 fetch departamentos into departamento;
 if departamentos%found then
 dbms_output.put_line(empleado.first_name ||' '|| empleado.last_name ||' es jefe del departamento: ' || departamento.department_name);
 end if;
 
 if departamentos%notfound then
  dbms_output.put_line(empleado.first_name ||' '|| empleado.last_name ||' no es jefe de ningun departamento');
 end if;
 close departamentos;
end loop;
close empleados;
end;
/

--pratica 3
set serveroutput on
declare

cursor empleados(depar_id number) is select count(1) from employees where
department_id = depar_id;

numero_empleados number;

begin

open empleados(10000);
fetch empleados into numero_empleados;
dbms_output.put_line('numero de empleados: '|| numero_empleados);
close empleados;

end;
/

--pratica 4
set serveroutput on
begin
for i in (select first_name from employees where job_id = 'ST_CLERK')loop
dbms_output.put_line(i.first_name);
end loop;
end;
/

--practica 5
set serveroutput on
declare 
cursor empleados is select * from employees for update;
empleado employees%rowtype;
begin
for emp in empleados loop
if emp.salary > 8000 then
update employees set salary = salary * 1.02 where current of empleados;
else
update employees set salary = salary * 1.03 where current of empleados;
end if;
end loop;
commit;
end;
/



