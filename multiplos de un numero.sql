set serveroutput on
declare
inicio number := 1;
fin number:= 10;
begin
for i in inicio..fin loop
if mod(i,4) = 0 then
dbms_output.put_line(i);
end if;

end loop;
end;
