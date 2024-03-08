set serveroutput on
declare 
type departamentos is table of
  departments%rowtype
index by pls_integer;

deps departamentos;

begin

for i in 1..10 loop
select * into deps(i) from departments where department_id = i *10;
end loop;


for i in deps.first..deps.last loop
 dbms_output.put_line(deps(i).department_name);
end loop;

end;