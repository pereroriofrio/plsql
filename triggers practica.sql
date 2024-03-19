--practica de triggers
--practica 1
CREATE OR REPLACE TRIGGER employees_tr BEFORE
    DELETE ON employees
    FOR EACH ROW
BEGIN
    IF :old.job_id LIKE '%CLERK' THEN
        raise_application_error(-20000, 'No se permite eliminar el empleado');
    END IF;
END;
/

--delete from employees where employee_id = 207;
--insert into employees(employee_id, first_name, last_name, email,phone_number,hire_date, job_id, salary, commission_pct,manager_id, department_id)
--values(207,'Ronald','Perero','rpereror@gmail.com','0991561229','6-MAY-90','AD_ASST',1600,null,101,10)
--select * from employees where employee_id = 207;

--practica 2
CREATE TABLE auditoria (
    usuario         VARCHAR(50),
    fecha           DATE,
    salario_antiguo NUMBER,
    salario_nuevo   NUMBER
);

--practica 3
CREATE OR REPLACE TRIGGER tr2_regions BEFORE
    INSERT ON regions
BEGIN
    INSERT INTO auditoria (
        usuario,
        fecha
    ) VALUES (
        user,
        sysdate
    );

END;
/

SELECT
    *
FROM
    regions;

SELECT
    *
FROM
    auditoria;

    INSERT INTO regions (
        region_id,
        region_name
    ) VALUES (
        3000,
        'Region 3k'
    );
/

--practica 4
CREATE OR REPLACE TRIGGER tr2_employees BEFORE
    UPDATE ON employees
    FOR EACH ROW
BEGIN
    IF :new.salary < :old.salary THEN
        raise_application_error(-20000, 'no se puede bajar un salario');
    END IF;

    IF :new.salary > :old.salary THEN
        INSERT INTO auditoria (
            usuario,
            fecha,
            salario_antiguo,
            salario_nuevo
        ) VALUES (
            user,
            sysdate,
            :old.salary,
            :new.salary
        );

    END IF;

END;

UPDATE employees
SET
    salary = 1;
/
--practica 5
CREATE OR REPLACE TRIGGER tr1_departments BEFORE
    INSERT ON departments
    FOR EACH ROW
DECLARE
    count_dep NUMBER;
BEGIN
    SELECT
        COUNT(1)
    INTO count_dep
    FROM
        departments
    WHERE
        department_id = :new.department_id;

    IF count_dep > 0 THEN
        raise_application_error(-20000, 'Id de departamento ya existe');
    END IF;
    IF :new.location_id IS NULL THEN
        :new.location_id := 1700;
    END IF;

    IF :new.manager_id IS NULL THEN
        :new.manager_id := 200;
    END IF;

END;
/

select max(department_id)from departments;
insert into departments (department_id, department_name, location_id, manager_id)
values(271,'test dep', null, null);