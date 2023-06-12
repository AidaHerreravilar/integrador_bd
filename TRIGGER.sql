/*Crea un TRIGGER que actualice el stock de un producto después de realizar una
orden de compra.*/

DELIMITER //

DROP TRIGGER actualizar_stock;

CREATE TRIGGER actualizar_stock
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    DECLARE stock_actual INT;

    /*Actualizar el stock restando la cantidad de la orden de compra*/
    UPDATE producto
    SET stock = stock_actual - NEW.cantidad
    WHERE producto_id = NEW.producto_id;
    
    
        /*Obtener el stock actual del producto*/
    SELECT stock INTO stock_actual
    FROM producto
    WHERE producto_id = NEW.producto_id;
    
END //

DELIMITER ;

/*Verifica que TRIGGER se dispare correctamente y actualice el stock de manera adecuada*/

CALL cliente_orden ('Auriculares inalámbricos', 'Aida', 'aidaherreravilar383@gmail.com', 'Costa Rica 1537');
       



























