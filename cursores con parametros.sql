set serveroutput on
declare
cursor empleados(sal number) is select * from employees 
where salary > sal;
empleado employees%rowtype;
begin
 open empleados(800);
 loop
  fetch empleados into empleado;
  exit when empleados%notfound;
  dbms_output.put_line(empleado.first_name || ' ' || empleado.salary);
 end loop;
 close empleados;
end;