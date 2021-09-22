#MESA 7: Hasta donde llegamos 
-- PARTE 1 --
select Facturas.FacturaID, FechaFactura, Correos.Compania, Contacto as 'Nombre Cliente', Categorias.CategoriaNombre, Productos.ProductoNombre, FacturaDetalle.PrecioUnitario, FacturaDetalle.Cantidad
from Facturas 
inner join Clientes on facturas.clienteID = Clientes.ClienteID  
inner join FacturaDetalle on Facturas.FacturaID = FacturaDetalle.FacturaID
inner join Productos on Productos.ProductoID = FacturaDetalle.ProductoID
inner join Categorias on Productos.CategoriaID = Categorias.CategoriaID
inner join Correos on Correos.CorreoID = Facturas.EnvioVia; 
 
 -- PARTE 2 --
 -- 1 --
 select * from  Categorias left join Productos on Categorias.CategoriaID = Productos.CategoriaID;
 
 -- 2 --
 select * from Clientes left join Facturas on Facturas.ClienteID = Clientes.ClienteID where Facturas.FacturaID is null;
 
 -- 3 --
 select Productos.ProductoNombre, Categorias.CategoriaNombre, Proveedores.Contacto from Productos 
 inner join Categorias on Productos.CategoriaID = Categorias.CategoriaID
 left join Proveedores on Productos.ProveedorID = Proveedores.ProveedorID;
 
 -- 4 --
select * from Productos;
 