-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EX8
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EX8
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EX8` ;
USE `EX8` ;

-- -----------------------------------------------------
-- Table `EX8`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EX8`.`EMPLEADO` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Fecha_Nacimiento` VARCHAR(45) NOT NULL,
  `Edad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `DNI_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EX8`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EX8`.`Ticket` (
  `ID` INT NOT NULL,
  `Numero de factura` VARCHAR(10) NOT NULL,
  `Fecha` DATETIME NOT NULL,
  `Hora` DATETIME NOT NULL,
  `Empleado_DNI` INT NOT NULL,
  `TOTAL_IVA_INCLOS` FLOAT NOT NULL,
  `EMPLEADO_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Identidicador_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Ticket_EMPLEADO1_idx` (`EMPLEADO_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_EMPLEADO1`
    FOREIGN KEY (`EMPLEADO_ID`)
    REFERENCES `EX8`.`EMPLEADO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EX8`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EX8`.`Producto` (
  `CODI_INTERN` INT NOT NULL,
  `Descripcion` VARCHAR(50) NOT NULL,
  `CODI_BARRES` VARCHAR(13) NOT NULL,
  `IVA` FLOAT NOT NULL,
  `Precio_final` FLOAT NOT NULL,
  `PVP_TOTAL` FLOAT NOT NULL,
  PRIMARY KEY (`CODI_INTERN`),
  UNIQUE INDEX `Codigo_barras_UNIQUE` (`CODI_INTERN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EX8`.`LINEATICKET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EX8`.`LINEATICKET` (
  `ID` INT NOT NULL,
  `TICKET` INT NOT NULL,
  `codigo_producto` INT NOT NULL,
  `descripcion_producto` FLOAT NOT NULL,
  `unidades_descuento` FLOAT NOT NULL,
  `precio_unitario` FLOAT NOT NULL,
  `Ticket_ID` INT NOT NULL,
  `Producto_CODI_INTERN` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Identificador_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_LINEATICKET_Ticket_idx` (`Ticket_ID` ASC) VISIBLE,
  INDEX `fk_LINEATICKET_Producto1_idx` (`Producto_CODI_INTERN` ASC) VISIBLE,
  CONSTRAINT `fk_LINEATICKET_Ticket`
    FOREIGN KEY (`Ticket_ID`)
    REFERENCES `EX8`.`Ticket` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LINEATICKET_Producto1`
    FOREIGN KEY (`Producto_CODI_INTERN`)
    REFERENCES `EX8`.`Producto` (`CODI_INTERN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
