--practica insert, update, delete
declare
id_departamento departments.department_id%type;
begin

select max(department_id)+1 into id_departamento from departments;

insert into departments(department_id, department_name, manager_id, location_id)
values(id_departamento, 'INFORMATICA', 100, 1000);

commit;

end;
/

select * from departments;
/
--update department
begin

update departments
set location_id = 1700
where department_id = 271;

commit;

end;

/
begin
delete departments
where department_id = 271;
end;
