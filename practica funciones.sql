--pratica 1 y 2
CREATE OR REPLACE FUNCTION sum_salary_dep (
    dep_id   IN departments.department_id%TYPE,
    num_empl OUT NUMBER
) RETURN NUMBER AS
    sum_salary    employees.salary%TYPE;
    department    departments%rowtype;
    num_employees NUMBER;
BEGIN
--validar que exista el departamento
    SELECT
        *
    INTO department
    FROM
        departments
    WHERE
        department_id = dep_id;

    SELECT
        COUNT(1)
    INTO num_employees
    FROM
        employees
    WHERE
        department_id = department.department_id;

    IF num_employees > 0 THEN
        SELECT
            SUM(salary)
        INTO sum_salary
        FROM
            employees
        WHERE
            department_id = dep_id;

        num_empl := num_employees;
    ELSE
        raise_application_error(-20000, 'El departamento existe pero no tiene empleados : ' || dep_id);
    END IF;

    RETURN sum_salary;
END;
/

set serveroutput on

DECLARE
    num_empl         NUMBER;
    salary_employees NUMBER;
BEGIN
    salary_employees := sum_salary_dep(100, num_empl);
    dbms_output.put_line('Suma de los salarios del departamento: '
                         || salary_employees
                         || ' numero de empleados del departamento: '
                         || num_empl);
END;
/
--pratica 3
CREATE OR REPLACE FUNCTION crear_region (
    nombre_region regions.region_name%TYPE
) RETURN NUMBER IS
    max_id NUMBER;
BEGIN
    SELECT
        MAX(region_id) + 1
    INTO max_id
    FROM
        regions;

    INSERT INTO regions (
        region_id,
        region_name
    ) VALUES (
        max_id,
        nombre_region
    );

    COMMIT;
    RETURN max_id;
END;
/

set serveroutput on
begin
dbms_output.put_line(crear_region('prueba'));
end;