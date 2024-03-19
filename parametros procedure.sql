--parametros procedimientos
--in
--out
--inout
create or replace procedure calc_tax_out
(empl in employees.employee_id%type,
t1 in number,
r1 out number)
as-- as|is
--tax number:=0;
sal number:=0;
begin
if t1 < 0 or t1 > 60 then
   raise_application_error(-20000,'El porcentaje debe estar entre 0 y 60');
end if;
select salary into sal from employees
where employee_id = empl;
--tax:=sal*t1/100;
r1:=sal*t1/100;
dbms_output.put('Salary: '||sal);
--dbms_output.put('tax: '||tax);
exception
when no_data_found then
   dbms_output.put_line('no existe el empleado');
end;
/

set serveroutput on
declare
a number;
b number;
r number;
begin
r:=0;
a:=100;
b:=30;
calc_tax_out(a, b,r);
dbms_output.put_line('R='||r);
end;
/