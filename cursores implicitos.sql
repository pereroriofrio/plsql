--cursores
--implicitos
--explicitos
--sql%isopen -- devuelve false en cursores implicitos(no aplica para cursores de este tipo osea implicitos)
--sql%found
--sql%notfound
--sql%rowcount

begin

update regiones
set region_name = 'aaaa'
where region_id = 10;

dbms_output.put_line(sql%rowcount);

if sql%found then
dbms_output.put_line('encontrado');
end if;

if sql%notfound then
dbms_output.put_line('no encontrado');
end if;



end;
