-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pacient` (
  `idPacient` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `NIE` VARCHAR(45) NOT NULL,
  `Consulta_Pacient` INT NOT NULL,
  PRIMARY KEY (`idPacient`, `Consulta_Pacient`),
  UNIQUE INDEX `idPacient_UNIQUE` (`idPacient` ASC) VISIBLE,
  UNIQUE INDEX `Consulta_Pacient_UNIQUE` (`Consulta_Pacient` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medico` (
  `NombreColegiado` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` INT NOT NULL,
  `DNI/NIE/Pasaporte` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NombreColegiado`),
  UNIQUE INDEX `NombreColegiado_UNIQUE` (`NombreColegiado` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta` (
  `Paciente NumeroSegSocial` INT NOT NULL,
  `Metge` INT NOT NULL,
  `Pacient_idPacient` INT NOT NULL,
  `Pacient_Consulta_Pacient` INT NOT NULL,
  `Medico_NombreColegiado` INT NOT NULL,
  PRIMARY KEY (`Paciente NumeroSegSocial`),
  UNIQUE INDEX `Paciente NumeroSegSocial_UNIQUE` (`Paciente NumeroSegSocial` ASC) VISIBLE,
  INDEX `fk_Consulta_Pacient1_idx` (`Pacient_idPacient` ASC, `Pacient_Consulta_Pacient` ASC) VISIBLE,
  INDEX `fk_Consulta_Medico1_idx` (`Medico_NombreColegiado` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient1`
    FOREIGN KEY (`Pacient_idPacient` , `Pacient_Consulta_Pacient`)
    REFERENCES `mydb`.`Pacient` (`idPacient` , `Consulta_Pacient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Medico1`
    FOREIGN KEY (`Medico_NombreColegiado`)
    REFERENCES `mydb`.`Medico` (`NombreColegiado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
