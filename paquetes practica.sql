--practica 2 paquetes
CREATE OR REPLACE PACKAGE nomina AS
    FUNCTION calcular_nomina (
        a NUMBER
    ) RETURN NUMBER;

    FUNCTION calcular_nomina (
        a NUMBER,
        b NUMBER
    ) RETURN NUMBER;

    FUNCTION calcular_nomina (
        a NUMBER,
        b NUMBER,
        c CHAR
    ) RETURN NUMBER;

END nomina;
/

CREATE OR REPLACE PACKAGE BODY nomina AS

    FUNCTION calcular_nomina (
        a NUMBER
    ) RETURN NUMBER AS
        salario NUMBER;
        irpf    NUMBER;
    BEGIN
        SELECT
            salary
        INTO salario
        FROM
            employees
        WHERE
            employee_id = a;

        irpf := salario * 0.15;
        salario := salario - irpf;
        RETURN salario;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('No existe empleado');
    END;

    FUNCTION calcular_nomina (
        a NUMBER,
        b NUMBER
    ) RETURN NUMBER AS
        salario NUMBER;
        irpf    NUMBER;
    BEGIN
        SELECT
            salary
        INTO salario
        FROM
            employees
        WHERE
            employee_id = a;

        irpf := ( salario * b ) / 100;
        salario := salario - irpf;
        RETURN salario;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('No existe empleado');
    END;

    FUNCTION calcular_nomina (
        a NUMBER,
        b NUMBER,
        c CHAR
    ) RETURN NUMBER AS
        salario  NUMBER;
        comision NUMBER;
        irpf     NUMBER;
    BEGIN
        SELECT
            salary,
            commission_pct
        INTO
            salario,
            comision
        FROM
            employees
        WHERE
            employee_id = a;

        IF
            c = 'V'
            AND comision IS NOT NULL
        THEN
            salario := salario + ( salario * comision );
        END IF;

        irpf := ( salario * b ) / 100;
        salario := salario - irpf;
        RETURN salario;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('No existe empleado');
    END;

END nomina;
/

set serveroutput on

BEGIN
    --dbms_output.put_line(nomina.calcular_nomina(101));
    --dbms_output.put_line(nomina.calcular_nomina(100, 1));
    dbms_output.put_line(nomina.calcular_nomina(145, 1, 'V'));
END;