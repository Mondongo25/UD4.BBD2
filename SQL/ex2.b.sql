-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ex2.b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ex2.b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ex2.b` ;
USE `ex2.b` ;

-- -----------------------------------------------------
-- Table `ex2.b`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.b`.`Pacient` (
  `idPacient` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `NumeroSegSocial` INT NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `DNI/NIE/Passaport` VARCHAR(45) NULL,
  PRIMARY KEY (`idPacient`, `NumeroSegSocial`),
  UNIQUE INDEX `NumeroSegSocial_UNIQUE` (`NumeroSegSocial` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.b`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.b`.`Metge` (
  `NumCol·legiat` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `DNI/NIE/Passaport` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumCol·legiat`),
  UNIQUE INDEX `NumCol·legiat_UNIQUE` (`NumCol·legiat` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.b`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.b`.`Consulta` (
  `Pacient_idPacient` INT NOT NULL,
  `Pacient_NumeroSegSocial` INT NOT NULL,
  `Metge_NumCol·legiat` INT NOT NULL,
  INDEX `fk_Consulta_Pacient_idx` (`Pacient_idPacient` ASC, `Pacient_NumeroSegSocial` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_NumCol·legiat` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient`
    FOREIGN KEY (`Pacient_idPacient` , `Pacient_NumeroSegSocial`)
    REFERENCES `ex2.b`.`Pacient` (`idPacient` , `NumeroSegSocial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_NumCol·legiat`)
    REFERENCES `ex2.b`.`Metge` (`NumCol·legiat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.b`.`PROYECCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.b`.`PROYECCION` (
  `CINE` INT NOT NULL,
  `PELICULA_TITOL` VARCHAR(45) NOT NULL,
  `DATA` VARCHAR(45) NOT NULL,
  `HORA` VARCHAR(45) NOT NULL,
  `SALA` VARCHAR(45) NOT NULL,
  `PELICULA_TITULO` INT NOT NULL,
  `CINE_NOMBRE` INT NOT NULL,
  PRIMARY KEY (`CINE`),
  UNIQUE INDEX `CINE_UNIQUE` (`CINE` ASC) VISIBLE,
  INDEX `fk_PROYECCION_PELICULA1_idx` (`PELICULA_TITULO` ASC) VISIBLE,
  INDEX `fk_PROYECCION_CINE1_idx` (`CINE_NOMBRE` ASC) VISIBLE,
  CONSTRAINT `fk_PROYECCION_PELICULA1`
    FOREIGN KEY (`PELICULA_TITULO`)
    REFERENCES `ex2.b`.`PELICULA` (`TITULO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROYECCION_CINE1`
    FOREIGN KEY (`CINE_NOMBRE`)
    REFERENCES `ex2.b`.`CINE` (`NOMBRE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.b`.`PELICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.b`.`PELICULA` (
  `TITULO` INT NOT NULL,
  `CLASIFICACION` VARCHAR(45) NOT NULL,
  `GENERO` VARCHAR(45) NOT NULL,
  `DIRECTOR` VARCHAR(45) NOT NULL,
  `DURACION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TITULO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.b`.`CINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.b`.`CINE` (
  `NOMBRE` INT NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `POBLACION` VARCHAR(45) NOT NULL,
  `NUMERO` VARCHAR(45) NOT NULL,
  `SALES` VARCHAR(45) NOT NULL,
  `ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NOMBRE`),
  UNIQUE INDEX `NOMBRE_UNIQUE` (`NOMBRE` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.b`.`TARIFA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.b`.`TARIFA` (
  `CINE` INT NOT NULL,
  `TIPOS` VARCHAR(45) NOT NULL,
  `PRECIO` VARCHAR(45) NOT NULL,
  `ID` VARCHAR(45) NOT NULL,
  `CINE_NOMBRE` INT NOT NULL,
  PRIMARY KEY (`CINE`),
  UNIQUE INDEX `CINE_UNIQUE` (`CINE` ASC) VISIBLE,
  INDEX `fk_TARIFA_CINE2_idx` (`CINE_NOMBRE` ASC) VISIBLE,
  CONSTRAINT `fk_TARIFA_CINE2`
    FOREIGN KEY (`CINE_NOMBRE`)
    REFERENCES `ex2.b`.`CINE` (`NOMBRE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.b`.`CINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.b`.`CINE` (
  `NOMBRE` INT NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `POBLACION` VARCHAR(45) NOT NULL,
  `NUMERO` VARCHAR(45) NOT NULL,
  `SALES` VARCHAR(45) NOT NULL,
  `ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NOMBRE`),
  UNIQUE INDEX `NOMBRE_UNIQUE` (`NOMBRE` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.b`.`TARIFA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.b`.`TARIFA` (
  `CINE` INT NOT NULL,
  `TIPOS` VARCHAR(45) NOT NULL,
  `PRECIO` VARCHAR(45) NOT NULL,
  `ID` VARCHAR(45) NOT NULL,
  `CINE_NOMBRE` INT NOT NULL,
  PRIMARY KEY (`CINE`),
  UNIQUE INDEX `CINE_UNIQUE` (`CINE` ASC) VISIBLE,
  INDEX `fk_TARIFA_CINE2_idx` (`CINE_NOMBRE` ASC) VISIBLE,
  CONSTRAINT `fk_TARIFA_CINE2`
    FOREIGN KEY (`CINE_NOMBRE`)
    REFERENCES `ex2.b`.`CINE` (`NOMBRE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.b`.`PELICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.b`.`PELICULA` (
  `TITULO` INT NOT NULL,
  `CLASIFICACION` VARCHAR(45) NOT NULL,
  `GENERO` VARCHAR(45) NOT NULL,
  `DIRECTOR` VARCHAR(45) NOT NULL,
  `DURACION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TITULO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.b`.`PROYECCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.b`.`PROYECCION` (
  `CINE` INT NOT NULL,
  `PELICULA_TITOL` VARCHAR(45) NOT NULL,
  `DATA` VARCHAR(45) NOT NULL,
  `HORA` VARCHAR(45) NOT NULL,
  `SALA` VARCHAR(45) NOT NULL,
  `PELICULA_TITULO` INT NOT NULL,
  `CINE_NOMBRE` INT NOT NULL,
  PRIMARY KEY (`CINE`),
  UNIQUE INDEX `CINE_UNIQUE` (`CINE` ASC) VISIBLE,
  INDEX `fk_PROYECCION_PELICULA1_idx` (`PELICULA_TITULO` ASC) VISIBLE,
  INDEX `fk_PROYECCION_CINE1_idx` (`CINE_NOMBRE` ASC) VISIBLE,
  CONSTRAINT `fk_PROYECCION_PELICULA1`
    FOREIGN KEY (`PELICULA_TITULO`)
    REFERENCES `ex2.b`.`PELICULA` (`TITULO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROYECCION_CINE1`
    FOREIGN KEY (`CINE_NOMBRE`)
    REFERENCES `ex2.b`.`CINE` (`NOMBRE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
