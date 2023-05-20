-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema imdb_movie_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema imdb_movie_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `imdb_movie_database` DEFAULT CHARACTER SET utf8 ;
USE `imdb_movie_database` ;

-- -----------------------------------------------------
-- Table `imdb_movie_database`.`Directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb_movie_database`.`Directors` (
  `DirectorID` INT NOT NULL,
  `Name` VARCHAR(255) NULL,
  PRIMARY KEY (`DirectorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdb_movie_database`.`Movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb_movie_database`.`Movies` (
  `MovieID` INT NOT NULL,
  `Title` VARCHAR(255) NOT NULL,
  `Year` DATE NOT NULL,
  `Genre` CHAR(100) NOT NULL,
  `Gross` DECIMAL(10,2) NULL,
  `UserRating` INT NOT NULL,
  `GrossRating` INT NULL,
  `DirectorID` INT NOT NULL,
  PRIMARY KEY (`MovieID`),
  INDEX `director_fk_idx` (`DirectorID` ASC) VISIBLE,
  CONSTRAINT `director_fk`
    FOREIGN KEY (`DirectorID`)
    REFERENCES `imdb_movie_database`.`Directors` (`DirectorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdb_movie_database`.`Actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb_movie_database`.`Actors` (
  `ActorID` INT NOT NULL,
  `Name` VARCHAR(255) NULL,
  PRIMARY KEY (`ActorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdb_movie_database`.`MovieActors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb_movie_database`.`MovieActors` (
  `MovieID` INT NOT NULL,
  `ActorID` INT NOT NULL,
  `Role` CHAR(100) NULL,
  PRIMARY KEY (`MovieID`, `ActorID`),
  INDEX `actor_id_fk_idx` (`ActorID` ASC) VISIBLE,
  CONSTRAINT `movie_id_fk`
    FOREIGN KEY (`MovieID`)
    REFERENCES `imdb_movie_database`.`Movies` (`MovieID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `actor_id_fk`
    FOREIGN KEY (`ActorID`)
    REFERENCES `imdb_movie_database`.`Actors` (`ActorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
