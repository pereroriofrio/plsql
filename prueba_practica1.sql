set serveroutput on

DECLARE
    a         NUMBER := 10;
    b         NUMBER := 20;
    c         CONSTANT NUMBER := 30;
    nombre    VARCHAR2(100) := 'Ronald Perero';
    edad      NUMBER := 33;
    fecha_nac DATE := '06-05-1990';
BEGIN
    dbms_output.put_line(a + b + c);
    dbms_output.put_line(nombre);
    dbms_output.put_line(edad);
    dbms_output.put_line(fecha_nac);
    dbms_output.put_line(nombre
                         || ' '
                         || edad
                         || ' '
                         || fecha_nac);

END;