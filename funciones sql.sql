set serveroutput on

DECLARE
    nombre    VARCHAR2(25);
    apellido1 VARCHAR2(25);
    apellido2 VARCHAR2(25);
    fecha_nac date;
BEGIN
    nombre := 'ronald';
    apellido1 := 'perero';
    apellido2 := 'riofrio';
    dbms_output.put_line(substr(upper(nombre), 1, 1)
                         ||'.'|| substr(upper(apellido1), 1, 1)
                         ||'.'|| substr(upper(apellido2), 1, 1));
    fecha_nac := '06-MAY-1990';
    dbms_output.put_line(fecha_nac);
    dbms_output.put_line(to_char(to_date(fecha_nac), 'DAY'));
END;

