set serveroutput on

DECLARE
    x             NUMBER;
    tipo_producto CHAR(1);
BEGIN
    x := 6;
    IF MOD(x, 2) = 0 THEN
        dbms_output.put_line('PAR');
    ELSE
        dbms_output.put_line('IMPAR');
    END IF;

    tipo_producto := 'E';
    
    IF tipo_producto = 'A' THEN
        dbms_output.put_line('Electronica');
    ELSIF tipo_producto = 'B' THEN
        dbms_output.put_line('Informatica');
    ELSIF tipo_producto = 'C' THEN
        dbms_output.put_line('Ropa');
    ELSIF tipo_producto = 'D' THEN
        dbms_output.put_line('Musica');
    ELSIF tipo_producto = 'E' THEN
        dbms_output.put_line('Libros');
    ELSE
        dbms_output.put_line('El codigo es incorrecto');
    END IF;

END;