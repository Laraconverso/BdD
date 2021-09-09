#mesa 5
#1 
select count(*) from clientes ; 
-- respuesta 91.
#2 
select ciudad, count(*) from clientes group by Ciudad;
-- Facturas
#1
select sum(Transporte) from facturas;
#2
select EnvioVia, sum(Transporte) from facturas group by EnvioVia;
#3
select ClienteID, count(facturaID) from facturas group by ClienteID order by count(facturaID) DESC;
#4
select ClienteID, count(facturaID) from facturas group by ClienteID order by count(facturaID) ASC limit 5;

