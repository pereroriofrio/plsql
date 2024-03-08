declare
salario number;
nombre EMPLOYEES.FIRST_NAME%TYPE;
EMPLEADO EMPLOYEES%ROWTYPE;
begin
--select salary, first_name into salario, nombre from employees
select *  into EMPLEADO from employees
where employee_id = 100;

dbms_output.put_line(EMPLEADO.salary * 100);
dbms_output.put_line(EMPLEADO.first_name);
end;