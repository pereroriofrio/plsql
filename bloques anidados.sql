/*

BLOQUES ANIDADOS

*/

set serveroutput on

BEGIN
    dbms_output.put_line('primer bloque');
    DECLARE
        x NUMBER := 10;
    BEGIN
        dbms_output.put_line(x);
    END;
END;