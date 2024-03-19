--practica paquetes
--practica 1
CREATE OR REPLACE PACKAGE regiones AS
    PROCEDURE alta_region (
        codigo NUMBER,
        nombre VARCHAR2
    );

    PROCEDURE baja_region (
        codigo NUMBER
    );

    PROCEDURE mod_region (
        codigo NUMBER,
        nombre VARCHAR2
    );

    FUNCTION con_region (
        codigo NUMBER
    ) RETURN VARCHAR2;

END regiones;
/

CREATE OR REPLACE PACKAGE BODY regiones AS

    FUNCTION existe_region (
        codigo NUMBER
    ) RETURN BOOLEAN AS
        region_count NUMBER;
    BEGIN
        SELECT
            COUNT(1)
        INTO region_count
        FROM
            regions
        WHERE
            region_id = codigo;

        IF region_count > 0 THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;

    PROCEDURE alta_region (
        codigo NUMBER,
        nombre VARCHAR2
    ) AS
    BEGIN
        IF regiones.existe_region(codigo) THEN
            raise_application_error(-20000, 'Region ya existe');
        ELSE
            INSERT INTO regions (
                region_id,
                region_name
            ) VALUES (
                codigo,
                nombre
            );

        END IF;
    END;

    PROCEDURE baja_region (
        codigo NUMBER
    ) AS
    BEGIN
        IF regiones.existe_region(codigo) THEN
            DELETE FROM regions
            WHERE
                region_id = codigo;

        ELSE
            raise_application_error(-20001, 'No existe region a eliminar');
        END IF;
    END;

    PROCEDURE mod_region (
        codigo NUMBER,
        nombre VARCHAR2
    ) AS
    BEGIN
        IF regiones.existe_region(codigo) THEN
            UPDATE regions
            SET
                region_name = nombre
            WHERE
                region_id = codigo;

        ELSE
            raise_application_error(-20002, 'No existe region a modificar');
        END IF;
    END;

    FUNCTION con_region (
        codigo NUMBER
    ) RETURN VARCHAR2 AS
        nombre_region VARCHAR2(100);
    BEGIN
        SELECT
            region_name
        INTO nombre_region
        FROM
            regions
        WHERE
            region_id = codigo;

        RETURN nombre_region;
    END;

END regiones;
/

set serveroutput on

BEGIN
    --regiones.alta_region(6, 'MARTE');
    --regiones.mod_region(6, 'jupiter');
    --regiones.baja_region(6);
    dbms_output.put_line(regiones.con_region(5));
END;
/