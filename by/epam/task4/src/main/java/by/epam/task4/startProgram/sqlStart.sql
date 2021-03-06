-- MySQL Script generated by MySQL Workbench
-- Sat Dec  7 00:50:26 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema park
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema park
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `park` DEFAULT CHARACTER SET utf8 ;
USE `park` ;

-- -----------------------------------------------------
-- Table `park`.`action`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `park`.`action` (
  `id_action` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`id_action`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `park`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `park`.`role` (
  `id_role` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id_role`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `park`.`human`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `park`.`human` (
  `id_human` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) CHARACTER SET 'utf8' NOT NULL,
  `surname` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `role` INT(11) NOT NULL,
  PRIMARY KEY (`id_human`),
  INDEX `roleFK_idx` (`role` ASC) VISIBLE,
  CONSTRAINT `roleFK`
    FOREIGN KEY (`role`)
    REFERENCES `park`.`role` (`id_role`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `park`.`participant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `park`.`participant` (
  `id_participant` INT(11) NOT NULL AUTO_INCREMENT,
  `from_human` INT(11) NOT NULL,
  `for_human` INT(11) NOT NULL,
  PRIMARY KEY (`id_participant`),
  INDEX `from_humanFK_idx` (`from_human` ASC) VISIBLE,
  INDEX `for_humanFK` (`for_human` ASC) VISIBLE,
  CONSTRAINT `for_humanFK`
    FOREIGN KEY (`for_human`)
    REFERENCES `park`.`human` (`id_human`),
  CONSTRAINT `from_humanFK`
    FOREIGN KEY (`from_human`)
    REFERENCES `park`.`human` (`id_human`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `park`.`plant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `park`.`plant` (
  `id_plant` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `description` VARCHAR(150) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id_plant`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `park`.`mission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `park`.`mission` (
  `id_mission` INT(11) NOT NULL AUTO_INCREMENT,
  `participant` INT(11) NOT NULL,
  `action` INT(11) NOT NULL,
  `plant` INT(11) NOT NULL,
  `status` TINYINT(4) NOT NULL,
  PRIMARY KEY (`id_mission`),
  INDEX `actionFK_idx` (`action` ASC) VISIBLE,
  INDEX `participantFK_idx` (`participant` ASC) VISIBLE,
  INDEX `plantFK_idx` (`plant` ASC) VISIBLE,
  CONSTRAINT `actionFK`
    FOREIGN KEY (`action`)
    REFERENCES `park`.`action` (`id_action`),
  CONSTRAINT `participantFK`
    FOREIGN KEY (`participant`)
    REFERENCES `park`.`participant` (`id_participant`),
  CONSTRAINT `plantFK`
    FOREIGN KEY (`plant`)
    REFERENCES `park`.`plant` (`id_plant`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
