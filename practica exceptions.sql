set serveroutput on
--practica exceptions
declare
nombre_empleado employees.first_name%type;
salario employees.salary%type;
duplicado exception;
pragma exception_init(duplicado, -00001);
begin

insert into regions(region_id, region_name)
values(1,'test');
commit;

select first_name into nombre_empleado from employees where employee_id = 100;
dbms_output.put_line(nombre_empleado);
select salary/0 into salario from employees where employee_id = 100;

Exception
 when no_data_found then
   dbms_output.put_line('Empleado inexistente');
 when too_many_rows then
   dbms_output.put_line('Demasiados empleados en la consulta');
 when duplicado then
   dbms_output.put_line('clave duplicada, intente otra');
 when others then
  dbms_output.put_line(sqlcode);
  dbms_output.put_line(sqlerrm);
end;

