-- -----------------------------------------------------
-- Schema tp_integrador
-- -----------------------------------------------------

 DROP SCHEMA IF EXISTS `tp_integrador`;

CREATE SCHEMA IF NOT EXISTS `tp_integrador`;
USE `tp_integrador` ;
-- -----------------------------------------------------
-- Table `Producto`
-- -----------------------------------------------------


/*1. Creación de tablas:
● Crea la tabla "producto" con al menos los campos: "id" (clave primaria), "nombre",
"precio", "stock".*/


DROP TABLE IF EXISTS producto;

CREATE TABLE IF NOT EXISTS `producto` (

producto_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
precio DECIMAL (5,2) NOT NULL,
stock INT NOT NULL
);

-- -----------------------------------------------------

/*Crea la tabla "cliente" con al menos los campos: "id" (clave primaria), "nombre",
"correo", "dirección".*/
-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cliente`;
 
CREATE TABLE IF NOT EXISTS `cliente` (
cliente_id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
correo VARCHAR(320) NOT NULL,
direccion VARCHAR(65) NOT NULL
);

-- -----------------------------------------------------

/*Crea la tabla "compra" con al menos los campos: "id" (clave primaria), "cliente_id"
(clave externa), "producto_id" (clave externa), "cantidad", "fecha".*/

-- -----------------------------------------------------
-- Table `Compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `compra`;

CREATE TABLE IF NOT EXISTS `compra` (
compra_id INT AUTO_INCREMENT PRIMARY KEY,
cantidad INT NOT NULL,
fecha DATE NOT NULL,
producto_id INT NOT NULL,
cliente_id INT NOT NULL,
FOREIGN KEY (producto_id) 
REFERENCES producto (producto_id)
ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (cliente_id) 
REFERENCES cliente (cliente_id)
ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- -----------------------------------------------------