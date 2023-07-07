USE tp_integrador;

/*Agrega una columna "descuento" a la tabla "Productos" utilizando ALTER TABLE.*/

ALTER TABLE producto
DROP COLUMN descuento;

ALTER TABLE producto
ADD COLUMN descuento VARCHAR (20);

UPDATE producto
SET descuento = '20%';

/*Modifica el tipo de datos de la columna "precio" en la tabla "Productos" utilizando
ALTER COLUMN.*/

ALTER TABLE producto
MODIFY precio FLOAT;



