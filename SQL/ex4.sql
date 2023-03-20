-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ex4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ex4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ex4` ;
USE `ex4` ;

-- -----------------------------------------------------
-- Table `ex4`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex4`.`CLIENTE` (
  `DNI` VARCHAR(10) CHARACTER SET 'big5' NOT NULL,
  `NOM` VARCHAR(45) NOT NULL,
  `COGNOMS` VARCHAR(45) NOT NULL,
  `ADREÇA` VARCHAR(45) NOT NULL,
  `MOBIL` VARCHAR(45) NOT NULL,
  `VIP` INT NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex4`.`VENEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex4`.`VENEDOR` (
  `DNI` INT NOT NULL,
  `NOM` VARCHAR(45) NOT NULL,
  `COGNOMS` VARCHAR(45) NULL,
  `ADREÇA` VARCHAR(45) NULL,
  `MOBIL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex4`.`TIPUS DE POLISSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex4`.`TIPUS DE POLISSA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOM` INT NOT NULL,
  `DESCRIPCIO` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex4`.`POLISSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex4`.`POLISSA` (
  `NUMPOLISSA` INT NOT NULL,
  `IMPORT` FLOAT NOT NULL,
  `DATA INICI` VARCHAR(45) NULL,
  `DATA FI` VARCHAR(45) NULL,
  `TIPUS DE POLISSA_ID` INT NOT NULL,
  `VENEDOR_DNI` INT NOT NULL,
  `CLIENTE_DNI` VARCHAR(10) CHARACTER SET 'big5' NOT NULL,
  PRIMARY KEY (`NUMPOLISSA`),
  INDEX `fk_POLISSA_TIPUS DE POLISSA_idx` (`TIPUS DE POLISSA_ID` ASC) VISIBLE,
  INDEX `fk_POLISSA_VENEDOR1_idx` (`VENEDOR_DNI` ASC) VISIBLE,
  INDEX `fk_POLISSA_CLIENTE1_idx` (`CLIENTE_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_POLISSA_TIPUS DE POLISSA`
    FOREIGN KEY (`TIPUS DE POLISSA_ID`)
    REFERENCES `ex4`.`TIPUS DE POLISSA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLISSA_VENEDOR1`
    FOREIGN KEY (`VENEDOR_DNI`)
    REFERENCES `ex4`.`VENEDOR` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLISSA_CLIENTE1`
    FOREIGN KEY (`CLIENTE_DNI`)
    REFERENCES `ex4`.`CLIENTE` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
