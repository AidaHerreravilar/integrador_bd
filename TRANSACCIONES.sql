/*Crea una transacción que inserte un nuevo cliente y una nueva orden de compra al
mismo tiempo.*/
DROP PROCEDURE IF EXISTS cliente_orden;

DELIMITER //

CREATE PROCEDURE cliente_orden(
IN producto_nombre VARCHAR (45) ,
IN cliente_nombre VARCHAR (255) ,
IN cliente_correo VARCHAR (320) ,
IN cliente_direccion VARCHAR (65) 
)

BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
SHOW ERRORS;
ROLLBACK;
END;

START TRANSACTION;
INSERT INTO cliente (nombre, correo, direccion) VALUES (cliente_nombre, cliente_correo, cliente_direccion);
INSERT INTO compra (cantidad, fecha, producto_id, cliente_id)
VALUES (1, CURDATE(), producto_id, cliente_id );

COMMIT;
SELECT 'Completa';
END //

DELIMITER ;

CALL cliente_orden('Televisor LED', 'John Paulo', 'johndoe@example.com', '1234 Main St, CityA, CountryA');
CALL cliente_orden('libro', 'Johana', 'yoh_sho_10@hotmail.com', '619 Saavedra');