set serveroutput on

DECLARE
    texto     VARCHAR2(100) := 'Hello X World';
    texto_rev VARCHAR(100) := '';
BEGIN
    WHILE length(texto) > 0 LOOP
        texto_rev := texto_rev
                     || substr(texto, -1, 1);
        --exit when upper(substr(texto, -1, 1)) = 'X';
        texto := substr(texto, 1, length(texto) - 1);
        exit when texto is null;
    END LOOP;

    dbms_output.put_line(texto_rev);
END;

