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

#JOINS

SELECT columna1, col2,...
FROM tabla A 
INNER JOIN tabla B
ON condicion


SELECT columna1, col2,...
FROM tabla A 
LEFT JOIN tabla B
ON condicion


CREATE VIEW nombre_de_la_vista AS consulta SQL;

CREATE VIEW canciones_de_rock AS 
SELECT canciones.id, canciones.nombre, generos.nombre AS genero
FROM canciones
INNER JOIN generos
ON canciones.id_genero = generos.id
WHERE generos.nombre IN ('Rock', 'Rock And Roll');

