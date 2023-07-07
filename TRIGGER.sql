/*Crea un TRIGGER que actualice el stock de un producto después de realizar una
orden de compra.*/

DELIMITER //

   DROP TRIGGER IF EXISTS actualizar_stock;

CREATE TRIGGER actualizar_stockproductos_con_descuentos
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    DECLARE stock_actual INT;
    SET stock_actual = (SELECT stock FROM producto WHERE producto_id = new.producto_id);

    /*Actualizar el stock restando la cantidad de la orden de compra*/
    UPDATE producto
    SET stock = stock_actual - 1
    WHERE producto_id = NEW.producto_id;
    
END //

DELIMITER ;

/*Verifica que TRIGGER se dispare correctamente y actualice el stock de manera adecuada*/

CALL cliente_orden ('Auriculares inalámbricos', 'Aida', 'aidaherreravilar383@gmail.com', 'Costa Rica 1537');
       



























