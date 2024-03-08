set serveroutput on 
declare
 type empleado is record
 (nombre varchar2(100),
  salario number,
  fecha employees.hire_date%type,
  datos employees%rowtype
 );

emple1 empleado;
begin
select * into emple1.datos
from employees where employee_id = 100;
emple1.nombre := emple1.datos.first_name ||' '||emple1.datos.last_name;
emple1.salario := emple1.datos.salary * 0.1145;
emple1.fecha := emple1.datos.hire_date;
dbms_output.put_line(emple1.nombre);
dbms_output.put_line(emple1.salario);
dbms_output.put_line(emple1.fecha);
dbms_output.put_line(emple1.datos.first_name);

end;