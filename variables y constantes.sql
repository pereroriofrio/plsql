--PRACTICA VARIABLES Y CONSTANTES
set serveroutput ON

DECLARE
    impuesto  CONSTANT NUMBER := 21;
    precio    NUMBER(5, 2);
    resultado precio%TYPE;
BEGIN
    precio := 10.2;
    resultado := precio * impuesto / 100;
    dbms_output.put_line(resultado);
END;