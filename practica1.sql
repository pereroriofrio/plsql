set serveroutput on

DECLARE
    name     VARCHAR2(100);
    lastname VARCHAR2(100);
    x        CONSTANT NUMBER := 10;
    z        NUMBER NOT NULL := 20;
BEGIN
    name := 'Ronald';
    lastname := 'Perero';
    dbms_output.put_line(100);
    dbms_output.put_line('aaaaa' || 'bbbbb');
    dbms_output.put_line(name);
    dbms_output.put_line(lastname);
    dbms_output.put_line(name || ' ' || lastname);
    dbms_output.put_line(x);
    dbms_output.put_line(z);
    z:=30;
    dbms_output.put_line(z);
END;