/*Crea una transacción que inserte un nuevo cliente y una nueva orden de compra al
mismo tiempo.*/

DELIMITER //
DROP PROCEDURE cliente_orden;

CREATE PROCEDURE cliente_orden(
IN producto_nombre VARCHAR (45) ,
IN cliente_nombre VARCHAR (45) ,
IN cliente_correo VARCHAR (45) ,
IN cliente_direccion VARCHAR (45) 
)

BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
SHOW ERRORS;
ROLLBACK;
END;

START TRANSACTION;
INSERT INTO cliente (nombre, correo, dirección) VALUES (cliente_nombre, cliente_correo, cliente_direccion);
SET @id_cliente =(SELECT MAX(cliente_id) + 1 FROM cliente);
SET @producto_id = (SELECT producto_id FROM producto WHERE nombre - producto_nombre);

INSERT INTO compra (cantidad, fecha, producto_id, cliente_id)
VALUES (1, CURDATE(), @producto_id, @cliente_id);

COMMIT;
SELECT 'Completa';
END //

DELIMITER ;

CALL cliente_orden('Televisor LED', 'John Doe', 'johndoe@example.com', '123 Main St, CityA, CountryA');
CALL cliente_orden('libro', 'Johana', 'yoh_sho_10@hotmail.com', '619 Saavedra');