-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ex5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ex5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ex5` ;
USE `ex5` ;

-- -----------------------------------------------------
-- Table `ex5`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex5`.`client` (
  `DNI` INT NOT NULL,
  `NOM` VARCHAR(45) NOT NULL,
  `CONGNOMS` VARCHAR(45) NOT NULL,
  `ADREÇA` VARCHAR(45) NOT NULL,
  `POBLACION` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `TELEFON` VARCHAR(45) NOT NULL,
  `NOM_USUARI` VARCHAR(45) NOT NULL,
  `CONTRASENYA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex5`.`cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex5`.`cita` (
  `Matricula_vehicle` INT NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Dia` VARCHAR(45) NOT NULL,
  `CLIENT` VARCHAR(45) NOT NULL,
  `client_DNI` INT NOT NULL,
  PRIMARY KEY (`Matricula_vehicle`, `CLIENT`),
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula_vehicle` ASC) VISIBLE,
  UNIQUE INDEX `CLIENT_UNIQUE` (`CLIENT` ASC) VISIBLE,
  INDEX `fk_cita_client1_idx` (`client_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_cita_client1`
    FOREIGN KEY (`client_DNI`)
    REFERENCES `ex5`.`client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex5`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex5`.`vehicle` (
  `MATRICULA` INT NOT NULL,
  `TIPUS_VEHICLE` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `CLIENT` VARCHAR(45) NOT NULL,
  `client_DNI` INT NOT NULL,
  `cita_Matricula_vehicle` INT NOT NULL,
  `cita_CLIENT` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MATRICULA`, `cita_Matricula_vehicle`, `cita_CLIENT`),
  UNIQUE INDEX `MATRICULA_UNIQUE` (`MATRICULA` ASC) VISIBLE,
  INDEX `fk_vehicle_client_idx` (`client_DNI` ASC) VISIBLE,
  INDEX `fk_vehicle_cita1_idx` (`cita_Matricula_vehicle` ASC, `cita_CLIENT` ASC) VISIBLE,
  CONSTRAINT `fk_vehicle_client`
    FOREIGN KEY (`client_DNI`)
    REFERENCES `ex5`.`client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_cita1`
    FOREIGN KEY (`cita_Matricula_vehicle` , `cita_CLIENT`)
    REFERENCES `ex5`.`cita` (`Matricula_vehicle` , `CLIENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
