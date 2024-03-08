SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 0;
    y NUMBER := 0;
    z NUMBER := 0;
BEGIN
    -- tipo loop
    LOOP
        x := x + 1;
        y := 0;
        EXIT WHEN x > 10;
        LOOP
            z := x * y;
            dbms_output.put_line(x
                                 || '*'
                                 || y
                                 || '='
                                 || z);

            y := y + 1;
            EXIT WHEN y > 12;
        END LOOP;

    END LOOP;
    --tipo for
    FOR i IN 1..10 LOOP
        FOR j IN 0..12 LOOP
            dbms_output.put_line(i
                                 || '*'
                                 || j
                                 || '='
                                 || i * j);
        END LOOP;
    END LOOP;
    --tipo while
    x := 0;
    WHILE x < 10 LOOP
        x := x + 1;
        y := 0;
        WHILE y <= 12 LOOP
            dbms_output.put_line(x
                                 || '*'
                                 || y
                                 || '='
                                 || x * y);

            y := y + 1;
        END LOOP;

    END LOOP;

END;