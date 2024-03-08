set serveroutpu on

declare
texto varchar2(100) := 'Hello World.!';
limite number;
texto_rev varchar2(100):='';
begin
limite := length(texto);

while limite > 0  loop
exit when upper(substr(texto,limite, 1)) = 'X';
texto_rev := texto_rev ||  substr(texto,limite, 1);
limite := limite- 1;
end loop;

dbms_output.put_line(texto_rev);

end;
