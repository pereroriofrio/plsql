CREATE OR REPLACE PROCEDURE read_file IS
    linea VARCHAR2(32767);
    vfile utl_file.file_type;
BEGIN
    vfile := utl_file.fopen('EXERCISES', 'F.txt', 'R');
    LOOP
        BEGIN
            utl_file.get_line(vfile, linea);
            --dbms_output.put_line(linea);
            insert into f1 values(linea);
        EXCEPTION
            WHEN no_data_found THEN
                EXIT;
        END;
    END LOOP;

    utl_file.fclose(vfile);
END;
/

set serveroutput on
begin
read_file;
end;