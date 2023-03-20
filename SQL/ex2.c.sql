-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ex2.c
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ex2.c
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ex2.c` ;
USE `ex2.c` ;

-- -----------------------------------------------------
-- Table `ex2.c`.`MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`MATRICULA` (
  `ALUMNE` INT NOT NULL,
  `DATA` VARCHAR(45) NOT NULL,
  `ASSIGNATURA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ALUMNE`),
  UNIQUE INDEX `ALUMNE_UNIQUE` (`ALUMNE` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`ASIGNATURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`ASIGNATURA` (
  `NOMBRE` INT NOT NULL,
  `CREDITOS` VARCHAR(45) NOT NULL,
  `DEPARTAMENTO` VARCHAR(45) NOT NULL,
  `PROFESOR` VARCHAR(45) NOT NULL,
  `MATRICULA_FECHA` INT NOT NULL,
  `MATRICULA_ALUMNO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NOMBRE`),
  UNIQUE INDEX `NOMBRE_UNIQUE` (`NOMBRE` ASC) VISIBLE,
  INDEX `fk_ASIGNATURA_MATRICULA1_idx` (`MATRICULA_FECHA` ASC, `MATRICULA_ALUMNO` ASC) VISIBLE,
  CONSTRAINT `fk_ASIGNATURA_MATRICULA1`
    FOREIGN KEY (`MATRICULA_FECHA` , `MATRICULA_ALUMNO`)
    REFERENCES `ex2.c`.`MATRICULA` (`FECHA` , `ALUMNO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`DEPARTAMENTO` (
  `NOMBRE` INT NOT NULL,
  `CREDITS` VARCHAR(45) NOT NULL,
  `DEPARTAMENT` VARCHAR(45) NOT NULL,
  `PROFESOR` VARCHAR(45) NOT NULL,
  `MATRICULA_ALUMNE` INT NOT NULL,
  PRIMARY KEY (`NOMBRE`),
  UNIQUE INDEX `NOMBRE_UNIQUE` (`NOMBRE` ASC) VISIBLE,
  INDEX `fk_DEPARTAMENTO_MATRICULA1_idx` (`MATRICULA_ALUMNE` ASC) VISIBLE,
  CONSTRAINT `fk_DEPARTAMENTO_MATRICULA1`
    FOREIGN KEY (`MATRICULA_ALUMNE`)
    REFERENCES `ex2.c`.`MATRICULA` (`ALUMNE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`ALUMNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`ALUMNO` (
  `DNI` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDOS` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  `DEPARTAMENTO_NOMBRE` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  INDEX `fk_ALUMNO_DEPARTAMENTO_idx` (`DEPARTAMENTO_NOMBRE` ASC) VISIBLE,
  CONSTRAINT `fk_ALUMNO_DEPARTAMENTO`
    FOREIGN KEY (`DEPARTAMENTO_NOMBRE`)
    REFERENCES `ex2.c`.`DEPARTAMENTO` (`NOMBRE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`MATRICULA` (
  `ALUMNE` INT NOT NULL,
  `DATA` VARCHAR(45) NOT NULL,
  `ASSIGNATURA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ALUMNE`),
  UNIQUE INDEX `ALUMNE_UNIQUE` (`ALUMNE` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`DEPARTAMENTO` (
  `NOMBRE` INT NOT NULL,
  `CREDITS` VARCHAR(45) NOT NULL,
  `DEPARTAMENT` VARCHAR(45) NOT NULL,
  `PROFESOR` VARCHAR(45) NOT NULL,
  `MATRICULA_ALUMNE` INT NOT NULL,
  PRIMARY KEY (`NOMBRE`),
  UNIQUE INDEX `NOMBRE_UNIQUE` (`NOMBRE` ASC) VISIBLE,
  INDEX `fk_DEPARTAMENTO_MATRICULA1_idx` (`MATRICULA_ALUMNE` ASC) VISIBLE,
  CONSTRAINT `fk_DEPARTAMENTO_MATRICULA1`
    FOREIGN KEY (`MATRICULA_ALUMNE`)
    REFERENCES `ex2.c`.`MATRICULA` (`ALUMNE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`ALUMNE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`ALUMNE` (
  `DNI` VARCHAR(10) NOT NULL,
  `NOM` VARCHAR(45) NOT NULL,
  `COGNOMS` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `TELEFON` VARCHAR(45) NOT NULL,
  `ADREÇA` VARCHAR(45) NOT NULL,
  `DEPARTAMENTO_NOMBRE` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  INDEX `fk_ALUMNE_DEPARTAMENTO1_idx` (`DEPARTAMENTO_NOMBRE` ASC) VISIBLE,
  CONSTRAINT `fk_ALUMNE_DEPARTAMENTO1`
    FOREIGN KEY (`DEPARTAMENTO_NOMBRE`)
    REFERENCES `ex2.c`.`DEPARTAMENTO` (`NOMBRE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`table2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`table2` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`table3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`table3` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`Alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`Alumno` (
  `DNI` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDOS` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `TELEFONO` VARCHAR(45) NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`Matricula` (
  `DATA` INT NOT NULL,
  `ALUMNO` VARCHAR(45) NULL,
  `ASIGANTURA` VARCHAR(45) NULL,
  `Alumno_DNI` INT NOT NULL,
  PRIMARY KEY (`DATA`),
  INDEX `fk_Matricula_Alumno1_idx` (`Alumno_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumno1`
    FOREIGN KEY (`Alumno_DNI`)
    REFERENCES `ex2.c`.`Alumno` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`PROFESOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`PROFESOR` (
  `DNI` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `APELLIDOS` VARCHAR(45) NULL,
  `TITULACION` VARCHAR(45) NULL,
  `DEPARTAMENTO` VARCHAR(45) NULL,
  `JEFEDEPARTAMENTO` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`ASS_MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`ASS_MATRICULA` (
  `ID` INT NOT NULL,
  `DATA` VARCHAR(45) NOT NULL,
  `ASSIGNATURA` VARCHAR(45) NOT NULL,
  `ALUMNO` VARCHAR(45) NOT NULL,
  `Matricula_DATA` INT NOT NULL,
  `PROFESOR_DNI` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_ASS_MATRICULA_Matricula1_idx` (`Matricula_DATA` ASC) VISIBLE,
  INDEX `fk_ASS_MATRICULA_PROFESOR1_idx` (`PROFESOR_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_ASS_MATRICULA_Matricula1`
    FOREIGN KEY (`Matricula_DATA`)
    REFERENCES `ex2.c`.`Matricula` (`DATA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ASS_MATRICULA_PROFESOR1`
    FOREIGN KEY (`PROFESOR_DNI`)
    REFERENCES `ex2.c`.`PROFESOR` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`Asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`Asignatura` (
  `Nombre` VARCHAR(45) NOT NULL,
  `Creditos` VARCHAR(45) NOT NULL,
  `Departamento` VARCHAR(45) NOT NULL,
  `Profesor` VARCHAR(45) NOT NULL,
  `ASS_MATRICULA_ID` INT NOT NULL,
  PRIMARY KEY (`Nombre`),
  UNIQUE INDEX `Nombre_UNIQUE` (`Nombre` ASC) VISIBLE,
  INDEX `fk_Asignatura_ASS_MATRICULA1_idx` (`ASS_MATRICULA_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Asignatura_ASS_MATRICULA1`
    FOREIGN KEY (`ASS_MATRICULA_ID`)
    REFERENCES `ex2.c`.`ASS_MATRICULA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex2.c`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex2.c`.`Departamento` (
  `Nombre` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `NºPLANTA` VARCHAR(45) NOT NULL,
  `AULA` VARCHAR(45) NOT NULL,
  `PROFESOR` VARCHAR(45) NOT NULL,
  `Asignatura_Nombre` VARCHAR(45) NOT NULL,
  `PROFESOR_DNI` INT NOT NULL,
  PRIMARY KEY (`Nombre`),
  UNIQUE INDEX `Nombre_UNIQUE` (`Nombre` ASC) VISIBLE,
  INDEX `fk_Departamento_Asignatura1_idx` (`Asignatura_Nombre` ASC) VISIBLE,
  INDEX `fk_Departamento_PROFESOR1_idx` (`PROFESOR_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Departamento_Asignatura1`
    FOREIGN KEY (`Asignatura_Nombre`)
    REFERENCES `ex2.c`.`Asignatura` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Departamento_PROFESOR1`
    FOREIGN KEY (`PROFESOR_DNI`)
    REFERENCES `ex2.c`.`PROFESOR` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
