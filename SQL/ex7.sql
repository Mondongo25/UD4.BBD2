-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EX7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EX7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EX7` ;
USE `EX7` ;

-- -----------------------------------------------------
-- Table `EX7`.`PASAJERO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EX7`.`PASAJERO` (
  `DNI_PASAPORTE` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `PALELLIDOS` VARCHAR(45) NOT NULL,
  `GMAIL` VARCHAR(45) NOT NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI_PASAPORTE`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI_PASAPORTE` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EX7`.`AVION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EX7`.`AVION` (
  `ID` INT NOT NULL,
  `MODELO` VARCHAR(45) NOT NULL,
  `CAPACIDAD` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EX7`.`VUELO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EX7`.`VUELO` (
  `NUM.VUELO` INT NOT NULL,
  `AVION` VARCHAR(45) NOT NULL,
  `ORIGEN` VARCHAR(45) NOT NULL,
  `DESTINO` VARCHAR(45) NOT NULL,
  `DIA.LLEGADA` VARCHAR(45) NOT NULL,
  `DIA.VUELTA` VARCHAR(45) NOT NULL,
  `HORA.SALIDA` VARCHAR(45) NOT NULL,
  `HORA.VUELTA` VARCHAR(45) NOT NULL,
  `AVION_ID` INT NOT NULL,
  PRIMARY KEY (`NUM.VUELO`),
  UNIQUE INDEX `NUM.VUELO_UNIQUE` (`NUM.VUELO` ASC) VISIBLE,
  INDEX `fk_VUELO_AVION1_idx` (`AVION_ID` ASC) VISIBLE,
  CONSTRAINT `fk_VUELO_AVION1`
    FOREIGN KEY (`AVION_ID`)
    REFERENCES `EX7`.`AVION` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EX7`.`RESERVA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EX7`.`RESERVA` (
  `ID` INT NOT NULL,
  `PASAJERO` VARCHAR(45) NOT NULL,
  `DIA.RESERVA` VARCHAR(45) NOT NULL,
  `NUM.VUELO` VARCHAR(45) NOT NULL,
  `VUELO_NUM.VUELO` INT NOT NULL,
  `PASAJERO_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_RESERVA_VUELO1_idx` (`VUELO_NUM.VUELO` ASC) VISIBLE,
  INDEX `fk_RESERVA_PASAJERO1_idx` (`PASAJERO_ID` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVA_VUELO1`
    FOREIGN KEY (`VUELO_NUM.VUELO`)
    REFERENCES `EX7`.`VUELO` (`NUM.VUELO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_PASAJERO1`
    FOREIGN KEY (`PASAJERO_ID`)
    REFERENCES `EX7`.`PASAJERO` (`DNI_PASAPORTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EX7`.`citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EX7`.`citas` (
  `Usuarios` INT NOT NULL,
  `Vehiculos` VARCHAR(45) NOT NULL,
  `dia_hora` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Usuarios`),
  UNIQUE INDEX `Usuarios_UNIQUE` (`Usuarios` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EX7`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EX7`.`Vehiculo` (
  `numero_matriculas` INT NOT NULL,
  `tipos_vehiculos` VARCHAR(45) NOT NULL,
  `marca_fabricante` VARCHAR(45) NOT NULL,
  `citas_usuarios` VARCHAR(45) NOT NULL,
  `citas_Usuarios` INT NOT NULL,
  PRIMARY KEY (`numero_matriculas`),
  UNIQUE INDEX `numero_matriculas_UNIQUE` (`numero_matriculas` ASC) VISIBLE,
  INDEX `fk_Vehiculo_citas1_idx` (`citas_Usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Vehiculo_citas1`
    FOREIGN KEY (`citas_Usuarios`)
    REFERENCES `EX7`.`citas` (`Usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EX7`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EX7`.`Clientes` (
  `DNI` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `poblacion` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `contrseña` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `numero_vehiculos` VARCHAR(45) NOT NULL,
  `numero_matriculas` VARCHAR(45) NOT NULL,
  `vehiculo_matricula` VARCHAR(45) NOT NULL,
  `Vehiculo_numero_matriculas` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  INDEX `fk_Clientes_Vehiculo1_idx` (`Vehiculo_numero_matriculas` ASC) VISIBLE,
  CONSTRAINT `fk_Clientes_Vehiculo1`
    FOREIGN KEY (`Vehiculo_numero_matriculas`)
    REFERENCES `EX7`.`Vehiculo` (`numero_matriculas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
