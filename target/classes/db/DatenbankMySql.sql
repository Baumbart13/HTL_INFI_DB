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
-- Table `mydb`.`BANK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BANK` (
    `BANK_ID` INT(11) NOT NULL,
    `NAME` VARCHAR(255) NOT NULL,
    `BANK_HAUPTANSTALT_ID` INT(11) NULL DEFAULT NULL,
    PRIMARY KEY (`BANK_ID`),
    INDEX `FK_BANK_HAUPTANSTALT_ID` (`BANK_HAUPTANSTALT_ID` ASC) VISIBLE,
    CONSTRAINT `FK_BANK_HAUPTANSTALT_ID`
    FOREIGN KEY (`BANK_HAUPTANSTALT_ID`)
    REFERENCES `mydb`.`bank` (`bank_id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`BANKOMATKARTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BANKOMATKARTE` (
    `KARTENNUMMER` INT(11) NOT NULL,
    `FIRMA` VARCHAR(255) NOT NULL,
    `INHABER` VARCHAR(255) NOT NULL,
    `ABLAUFDATUM` DATE NOT NULL,
    PRIMARY KEY (`KARTENNUMMER`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Kunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kunde` (
    `ID` VARCHAR(255) NOT NULL,
    `NACHNAME` VARCHAR(255) NULL DEFAULT NULL,
    `VORNAME` VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (`ID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`RECHNUNGEN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RECHNUNGEN` (
    `RECHNUNGSNUMMER` INT(11) NOT NULL,
    `KUNDENNUMMER` VARCHAR(255) NOT NULL,
    `BETRAG` DECIMAL(10,2) NOT NULL,
    `RECHNUNGSDATUM` DATE NOT NULL,
    `KARTENNUMMER` INT(11) NULL DEFAULT NULL,
    PRIMARY KEY (`RECHNUNGSNUMMER`),
    INDEX `FK_KARTENNUMMER` (`KARTENNUMMER` ASC) VISIBLE,
    CONSTRAINT `FK_KARTENNUMMER`
    FOREIGN KEY (`KARTENNUMMER`)
    REFERENCES `mydb`.`bankomatkarte` (`kartennummer`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
