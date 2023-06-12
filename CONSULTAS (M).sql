USE tp_integrador;

/*Realiza una consulta utilizando SELECT JOIN para obtener la información de los
productos comprados por cada cliente.*/


SELECT c.nombre, p.nombre
FROM cliente c
INNER JOIN compra co ON c.cliente_id = co.cliente_id
INNER JOIN producto p ON co.producto_id = p.producto_id;

/*Crea una VIEW que muestre los productos con descuento.*/

CREATE VIEW productos_con_descuentos AS
SELECT nombre,stock,descuento
FROM producto
WHERE descuento > 0;

/*Crea un INDEX en la columna "nombre" de la tabla "Productos" para mejorar la
velocidad de las consultas.*/

CREATE INDEX `productos` ON `producto` (`nombre`ASC) VISIBLE;






