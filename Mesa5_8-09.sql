#mesa 5
#1 
select count(*) from clientes ; 
-- respuesta 91.
#2 
select ciudad, count(*) from clientes group by Ciudad;

-- Facturas
#1
select sum(Transporte) as Total from facturas;
#2
select EnvioVia, sum(Transporte) from facturas group by EnvioVia;
#3
select ClienteID, count(facturaID) from facturas group by ClienteID order by count(facturaID) DESC;
#4
select ClienteID, count(facturaID) from facturas group by ClienteID order by count(facturaID) ASC limit 5;

select * from correos;

select * from facturadetalle; 

select productoid, precioUnitario * cantidad as Total from facturadetalle where productoID between 30 and 50 group by productoid;

select facturas.facturaID, empleados.apellido, empleados.nombre * from empleados join facturas on 
