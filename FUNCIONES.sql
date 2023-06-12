/*Crea una función que calcule el promedio de precios de los productos.*/

DELIMITER //
CREATE FUNCTION calcular_promedio()
RETURNS DECIMAL(5,2) DETERMINISTIC
BEGIN
DECLARE promedio DECIMAL (5,2);
SELECT AVG (precio) INTO promedio FROM producto;
RETURN promedio;

END//
DELIMITER ;

/*Utiliza la función para obtener el promedio de precios de todos los productos.*/

SELECT calcular_promedio();
