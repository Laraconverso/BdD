SELECT COUNT(*) FROM movies;
SELECT COINT(id) AS total FROM movies WHERE genre_id=3;

SELECT AVG(rating) FROM movies;
SELECT SUM(length) FROM movies;

SELECT MIN(rating) FROM movies;
SELECT MAX(length) FROM movies;


SELECT columna_1
FROM nombre_tabla
WHERE condicion
GROUP BY columna_1;


SELECT columna_1
FROM nombre_tabla
WHERE condicion
GROUP BY columna_1;
HAVING condition_Group
ORDER BY columna_1;


SELECT clientes.id AS ID, clientes.nombre, ventas.fecha
FROM  clientes, ventas 
WHERE clientes.id = ventas.cliente_id



SELECT cliente.id, cliente.nombre, factura.fecha
FROM cliente
INNER JOIN factura
ON cliente.id = factura.cliente_id;


SELECT DISTINCT columna_1, columna_2
FROM nombre_tabla;