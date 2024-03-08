set serveroutput on

DECLARE
    nombre  VARCHAR2(100) := 'Ronald';
    mascara VARCHAR2(100) := '';
BEGIN
    FOR i IN 1..length(nombre) LOOP
        mascara := mascara || '*';
    END LOOP;

    dbms_output.put_line(nombre||'->'||mascara);
END;