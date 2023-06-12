USE tp_integrador;

/*Agrega una columna "descuento" a la tabla "Productos" utilizando ALTER TABLE.*/

ALTER TABLE producto
ADD COLUMN descuento DECIMAL (5, 2) DEFAULT 0;

UPDATE producto
SET 
descuento = precio * 0.1
WHERE stock > 10;



/*Modifica el tipo de datos de la columna "precio" en la tabla "Productos" utilizando
ALTER COLUMN.*/

ALTER TABLE producto
MODIFY precio DECIMAL(5, 2);



