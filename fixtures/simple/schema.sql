SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `express-admin-simple` ;
CREATE SCHEMA IF NOT EXISTS `express-admin-simple` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `express-admin-simple` ;

-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE  TABLE IF NOT EXISTS `item` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `notes` TEXT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE  TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `firstname` VARCHAR(45) NOT NULL ,
  `lastname` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchase` ;

CREATE  TABLE IF NOT EXISTS `purchase` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `item_id` INT NOT NULL ,
  `user_id` INT NULL ,
  `cache` DECIMAL(6,2) UNSIGNED NOT NULL ,
  `date` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_purchase_user_idx` (`user_id` ASC) ,
  INDEX `fk_purchase_item1_idx` (`item_id` ASC) ,
  CONSTRAINT `fk_purchase_user`
    FOREIGN KEY (`user_id` )
    REFERENCES `user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subtype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subtype` ;

CREATE  TABLE IF NOT EXISTS `subtype` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type` ;

CREATE  TABLE IF NOT EXISTS `type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `item_id` INT NOT NULL ,
  `subtype_id` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) ,
  INDEX `fk_sub_item_item1_idx` (`item_id` ASC) ,
  INDEX `fk_type_subtype1_idx` (`subtype_id` ASC) ,
  CONSTRAINT `fk_sub_item_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_subtype1`
    FOREIGN KEY (`subtype_id` )
    REFERENCES `subtype` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `property` ;

CREATE  TABLE IF NOT EXISTS `property` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `item_id` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) ,
  INDEX `fk_property_item1_idx` (`item_id` ASC) ,
  CONSTRAINT `fk_property_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE  TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `item_id` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) ,
  INDEX `fk_sub_item_item1` (`item_id` ASC) ,
  CONSTRAINT `fk_sub_item_item10`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_type` ;

CREATE  TABLE IF NOT EXISTS `recipe_type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `notes` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_ref`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_ref` ;

CREATE  TABLE IF NOT EXISTS `recipe_ref` (
  `recipe_id` INT NOT NULL ,
  `recipe_type_id` INT NOT NULL ,
  PRIMARY KEY (`recipe_id`, `recipe_type_id`) ,
  INDEX `fk_recipe_has_recipe_type_recipe_type1_idx` (`recipe_type_id` ASC) ,
  INDEX `fk_recipe_has_recipe_type_recipe1_idx` (`recipe_id` ASC) ,
  CONSTRAINT `fk_recipe_has_recipe_type_recipe1`
    FOREIGN KEY (`recipe_id` )
    REFERENCES `recipe` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_recipe_type_recipe_type1`
    FOREIGN KEY (`recipe_type_id` )
    REFERENCES `recipe_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_ref`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_ref` ;

CREATE  TABLE IF NOT EXISTS `recipe_ref` (
  `recipe_id` INT NOT NULL ,
  `recipe_type_id` INT NOT NULL ,
  PRIMARY KEY (`recipe_id`, `recipe_type_id`) ,
  INDEX `fk_recipe_has_recipe_type_recipe_type1_idx` (`recipe_type_id` ASC) ,
  INDEX `fk_recipe_has_recipe_type_recipe1_idx` (`recipe_id` ASC) ,
  CONSTRAINT `fk_recipe_has_recipe_type_recipe1`
    FOREIGN KEY (`recipe_id` )
    REFERENCES `recipe` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_recipe_type_recipe_type1`
    FOREIGN KEY (`recipe_type_id` )
    REFERENCES `recipe_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `express-admin-simple` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
