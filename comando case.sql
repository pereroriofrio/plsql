set serveroutput ON

DECLARE
    usuario VARCHAR2(40);
BEGIN
    usuario := user;
    dbms_output.put_line(usuario);
    CASE usuario
        WHEN 'HR' THEN
            dbms_output.put_line('Eres de recursos humanos');
        WHEN 'SYS' THEN
            dbms_output.put_line('Eres superadministrador');
        WHEN 'SYSTEM' THEN
            dbms_output.put_line('Eres un administrador normal');
        ELSE
            dbms_output.put_line('Usurio no autorizado');
    END CASE;

END;