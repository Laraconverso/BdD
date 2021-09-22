/* Crear una vista para poder organizar los envíos de las facturas. Indicar número
de factura, fecha de la factura y fecha de envío, ambas en formato dd/mm/yyyy,
valor del transporte formateado con dos decimales, y la información del
domicilio del destino incluyendo dirección, ciudad, código postal y país, en una
columna llamada Destino.*/
create view InfoFacturas as
select FacturaID as 'Numero_Factura', DATE_FORMAT(FechaFactura,'%d/%m/%Y') as FechaFactura, DATE_FORMAT(FechaEnvio,'%d/%m/%Y') as FechaEnvio, round(Transporte, 2) as Valor_Transporte, EnvioVia as Envio, 
concat(DireccionEnvio, CiudadEnvio, CodigoPostalEnvio, PaisEnvio) as 'Destino' from Facturas;

/*Realizar una consulta con todos los correos y el detalle de las facturas que
usaron ese correo. Utilizar la vista creada.*/
select * from infofacturas
left join Correos on infofacturas.Envio = Correos.CorreoID;

/*¿Qué dificultad o problema encontrás en esta consigna? Proponer alguna
alternativa o solución.
Al intentar hacer una consulta de la vista, se genero un error debido a que la misma no cunsulta acerca de la compania de envio. 
Como solucion alternativa, agregamos a la vista el atributo de EnvioVia. 
*/

#2
/*1. Crear una vista con un detalle de los productos en stock. Indicar id, nombre del
producto, nombre de la categoría y precio unitario.*/
create view ProductosEnStock as
select ProductoID, ProductoNombre, Categorias.CategoriaNombre as Nombre_Categoria, PrecioUnitario, UnidadesStock as En_Stock from Productos
inner join Categorias on Productos.CategoriaID = Categorias.CategoriaID 
having UnidadesStock > 0;

/*Escribir una consulta que liste el nombre y la categoría de todos los productos
vendidos. Utilizar la vista creada.*/
select * from productosenstock 
inner join FacturaDetalle on productosenstock.ProductoID = FacturaDetalle.ProductoID;

/*¿Qué dificultad o problema encontrás en esta consigna? Proponer alguna
alternativa o solución.
Al crear la vista agregamos a la consulta "unidadesStock" para poder obtener el resultado de que unicamente nos de la informacion de los productos que esten en stock (stock>0)*/

