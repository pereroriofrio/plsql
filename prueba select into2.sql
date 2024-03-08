-- Practica select into
--%ROWTYPE, %TYPE
--Pratica 1
declare
salario_maximo employees.salary%type;
begin
select max(salary) into salario_maximo from employees where department_id = 100;
dbms_output.put_line(salario_maximo);
end;

--Practica 2
declare
tipo_trabajo employees.job_id%type;
begin
select job_id into tipo_trabajo from employees where employee_id = 100;
dbms_output.put_line(tipo_trabajo);
end;

--practica 3
declare
department_code employees.department_id%type;
nombre_departamento  departments.department_name%type;
numero_empleados number;
begin
department_code := 100;

select  department_name into nombre_departamento  from departments where department_id = department_code;

select count(1) into numero_empleados from employees where department_id  = department_code;

dbms_output.put_line(nombre_departamento);
dbms_output.put_line(numero_empleados);

end;

--practica 4
declare
salario_max employees.salary%type;
salario_min employees.salary%type;
diferencia employees.salary%type;
begin

select max(salary) , min (salary) into salario_max, salario_min from employees;

dbms_output.put_line('salario maximo: ' || salario_max);
dbms_output.put_line('salario minimo: ' || salario_min);
diferencia := salario_max - salario_min;
dbms_output.put_line('diferencia: ' || diferencia);
end;

