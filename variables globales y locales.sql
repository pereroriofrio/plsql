/*
VARIABLES GLOBALES Y LOCALES
*/

set serveroutput on

DECLARE
    x NUMBER; --variable global x
    z NUMBER;
BEGIN
    x := 10;
    z := 1;
    dbms_output.put_line(x);
    DECLARE
        x NUMBER;
        y NUMBER;
    BEGIN
        x := 100; --variable local x
        y := 2;
        dbms_output.put_line(x);
        dbms_output.put_line(y);
        dbms_output.put_line(z);
    END;

END;