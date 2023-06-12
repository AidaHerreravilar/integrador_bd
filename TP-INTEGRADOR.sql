-- -----------------------------------------------------
-- Schema tp_integrador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tp_integrador` ;
USE `tp_integrador` ;
-- -----------------------------------------------------
-- Table `Producto`
-- -----------------------------------------------------


/*1. Creación de tablas:
● Crea la tabla "producto" con al menos los campos: "id" (clave primaria), "nombre",
"precio", "stock".*/

CREATE TABLE IF NOT EXISTS `producto` (

producto_id INT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
precio DECIMAL (5,2),
stock INT NOT NULL
);

-- -----------------------------------------------------

/*Crea la tabla "cliente" con al menos los campos: "id" (clave primaria), "nombre",
"correo", "dirección".*/
-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `cliente` (
cliente_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
correo VARCHAR(45),
dirección VARCHAR(45) NOT NULL
);

-- -----------------------------------------------------

/*Crea la tabla "compra" con al menos los campos: "id" (clave primaria), "cliente_id"
(clave externa), "producto_id" (clave externa), "cantidad", "fecha".*/

-- -----------------------------------------------------
-- Table `Compra`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `compra` (
compra_id INT AUTO_INCREMENT PRIMARY KEY,
cantidad INT NOT NULL,
fecha DATE NOT NULL,
producto_id INT NOT NULL,
cliente_id INT NOT NULL,
FOREIGN KEY (producto_id) 
REFERENCES producto (producto_id)
ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (cliente_id) 
REFERENCES cliente (cliente_id)
ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
