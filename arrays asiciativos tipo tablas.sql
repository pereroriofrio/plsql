set serveroutput on
declare
type departamentos is table of
  departments.department_name%type
index by pls_integer;

type empleados is table of
  employees%rowtype
index by pls_integer;

deps departamentos;
empl empleados;

begin

-- tipo simple
deps(1):= 'INFORMATICA';
deps(2):= 'RRHH';
deps(55):='PRUEBA';
dbms_output.put_line(deps(1));
dbms_output.put_line(deps(2));
dbms_output.put_line(deps.last);
dbms_output.put_line(deps.first);
if deps.exists(3) then
 dbms_output.put_line(deps(3));
else
 dbms_output.put_line('El valor no existe');
end if;

--tipo compuesto
select * into empl(1) from employees where employee_id = 100;
select * into empl(2) from employees where employee_id = 110;
dbms_output.put_line(empl(1).first_name);
dbms_output.put_line(empl(2).first_name);

end;
/