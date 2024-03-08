/*
  comentario en varias lineas
  bloque anonimo pl/sql
*/
DECLARE
    d DATE := '06-MAY-1990'; --comentario de una linea
BEGIN
    dbms_output.put_line(sysdate);
    dbms_output.put_line(d);
    dbms_output.put_line(sysdate - d);
    dbms_output.put_line(sysdate + 1);
END;