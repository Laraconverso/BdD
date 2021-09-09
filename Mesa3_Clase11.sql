/* MESA 3 
William Jose Ibarra Ibañez
Lara Daniela Converso
Agustina Negri
Héctor Mauricio González Sandoval
Juan Manuel Chilito Zemanate
Karina Dominguez
*/

SELECT * FROM Categorias;
SELECT CategoriaNombre, Descripcion FROM Categorias;

SELECT ProductoNombre FROM Productos;
SELECT * FROM Productos WHERE Discontinuado = 1;
SELECT * FROM Productos WHERE ProveedorID = 8;
SELECT * FROM Productos WHERE PrecioUnitario BETWEEN 10 and 22;
SELECT * FROM Productos WHERE UnidadesStock < NivelReorden;
SELECT * FROM Productos WHERE UnidadesStock < NivelReorden and UnidadesPedidas = 0;

SELECT Contacto, Compania, Titulo, Pais FROM Clientes ORDER BY Pais;
SELECT * FROM Clientes WHERE Titulo = 'Owner';
SELECT * FROM Clientes WHERE Contacto LIKE 'c%';

SELECT * FROM Facturas ORDER BY FechaFactura;
SELECT * FROM Facturas WHERE PaisEnvio = 'USA' and EnvioVia != 3;
SELECT * FROM Facturas WHERE ClienteID LIKE 'GOURL';
SELECT * FROM Facturas WHERE EmpleadoID IN (2, 3, 5, 8, 9);

SELECT ProductoNombre FROM Productos ORDER BY PrecioUnitario DESC;
SELECT ProductoNombre FROM Productos ORDER BY PrecioUnitario DESC LIMIT 5;
SELECT ProductoNombre FROM Productos ORDER BY UnidadesStock DESC LIMIT 10;

SELECT FacturaID,ProductoID, Cantidad FROM FacturaDetalle;
SELECT FacturaID,ProductoID, Cantidad FROM FacturaDetalle ORDER BY Cantidad DESC;
SELECT FacturaID,ProductoID, Cantidad FROM FacturaDetalle WHERE Cantidad BETWEEN 50 AND 100 ORDER BY Cantidad DESC;  
SELECT FacturaID AS NroFactura, ProductoID AS Producto, (PrecioUnitario * Cantidad) AS Total FROM FacturaDetalle;
