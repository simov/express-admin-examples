SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `express-admin-examples` ;
CREATE SCHEMA IF NOT EXISTS `express-admin-examples` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `express-admin-examples` ;

-- -----------------------------------------------------
-- Table `notes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notes` ;

CREATE TABLE IF NOT EXISTS `notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `notes1` TEXT NULL,
  `notes2` TEXT NOT NULL,
  `notes3` TEXT NULL,
  `notes4` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `image` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchase` ;

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_id` INT NOT NULL,
  `user_id` INT NULL,
  `cache` DECIMAL(6,2) NOT NULL,
  `date` DATE NULL,
  `deleted` TINYINT(1) NULL,
  `deleted_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_purchase_item_idx` (`item_id` ASC),
  INDEX `fk_purchase_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_purchase_item`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_type` ;

CREATE TABLE IF NOT EXISTS `recipe_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_method`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_method` ;

CREATE TABLE IF NOT EXISTS `recipe_method` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_has_recipe_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_has_recipe_types` ;

CREATE TABLE IF NOT EXISTS `recipe_has_recipe_types` (
  `recipe_id` INT NOT NULL,
  `recipe_type_id` INT NOT NULL,
  PRIMARY KEY (`recipe_id`, `recipe_type_id`),
  INDEX `fk_recipe_has_recipe_type_recipe_type1_idx` (`recipe_type_id` ASC),
  INDEX `fk_recipe_has_recipe_type_recipe1_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_recipe_has_recipe_type_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_recipe_type_recipe_type1`
    FOREIGN KEY (`recipe_type_id`)
    REFERENCES `recipe_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_has_recipe_methods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_has_recipe_methods` ;

CREATE TABLE IF NOT EXISTS `recipe_has_recipe_methods` (
  `recipe_id` INT NOT NULL,
  `recipe_method_id` INT NOT NULL,
  PRIMARY KEY (`recipe_id`, `recipe_method_id`),
  INDEX `fk_recipe_has_recipe_methods_recipe_method1_idx` (`recipe_method_id` ASC),
  INDEX `fk_recipe_has_recipe_methods_recipe1_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_recipe_has_recipe_methods_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_recipe_methods_recipe_method1`
    FOREIGN KEY (`recipe_method_id`)
    REFERENCES `recipe_method` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_address_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phone` ;

CREATE TABLE IF NOT EXISTS `phone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `mobile` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_phone_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_phone_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car` ;

CREATE TABLE IF NOT EXISTS `car` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `repair`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `repair` ;

CREATE TABLE IF NOT EXISTS `repair` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `car_id` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_repair_car1_idx` (`car_id` ASC),
  CONSTRAINT `fk_repair_car1`
    FOREIGN KEY (`car_id`)
    REFERENCES `car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `driver` ;

CREATE TABLE IF NOT EXISTS `driver` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `car_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_driver_car1_idx` (`car_id` ASC),
  CONSTRAINT `fk_driver_car1`
    FOREIGN KEY (`car_id`)
    REFERENCES `car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_otm_single`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_otm_single` ;

CREATE TABLE IF NOT EXISTS `controls_otm_single` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_otm_multiple`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_otm_multiple` ;

CREATE TABLE IF NOT EXISTS `controls_otm_multiple` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first` VARCHAR(45) NOT NULL,
  `last` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls` ;

CREATE TABLE IF NOT EXISTS `controls` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `controls_otm_single_id` INT NULL,
  `controls_otm_multiple_id` INT NULL,
  `static` VARCHAR(45) NULL,
  `text` VARCHAR(45) NULL,
  `boolean` TINYINT(1) NULL,
  `bigint` BIGINT NULL,
  `double` DOUBLE NULL,
  `upload` VARCHAR(45) NULL,
  `binary` BLOB NULL,
  `date` DATE NULL,
  `time` TIME NULL,
  `datetime` DATETIME NULL,
  `year` YEAR NULL,
  `textarea` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_controls_controls_otm_single1_idx` (`controls_otm_single_id` ASC),
  INDEX `fk_controls_controls_otm_multiple1_idx` (`controls_otm_multiple_id` ASC),
  CONSTRAINT `fk_controls_controls_otm_single1`
    FOREIGN KEY (`controls_otm_single_id`)
    REFERENCES `controls_otm_single` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_controls_otm_multiple1`
    FOREIGN KEY (`controls_otm_multiple_id`)
    REFERENCES `controls_otm_multiple` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_mtm_single`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_mtm_single` ;

CREATE TABLE IF NOT EXISTS `controls_mtm_single` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_mtm_multiple`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_mtm_multiple` ;

CREATE TABLE IF NOT EXISTS `controls_mtm_multiple` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first` VARCHAR(45) NOT NULL,
  `last` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_has_controls_mtm_single`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_has_controls_mtm_single` ;

CREATE TABLE IF NOT EXISTS `controls_has_controls_mtm_single` (
  `controls_id` INT NOT NULL,
  `controls_mtm_single_id` INT NOT NULL,
  PRIMARY KEY (`controls_id`, `controls_mtm_single_id`),
  INDEX `fk_controls_has_controls_mtm_single_controls_mtm_single1_idx` (`controls_mtm_single_id` ASC),
  INDEX `fk_controls_has_controls_mtm_single_controls1_idx` (`controls_id` ASC),
  CONSTRAINT `fk_controls_has_controls_mtm_single_controls1`
    FOREIGN KEY (`controls_id`)
    REFERENCES `controls` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_has_controls_mtm_single_controls_mtm_single1`
    FOREIGN KEY (`controls_mtm_single_id`)
    REFERENCES `controls_mtm_single` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_has_controls_mtm_multiple`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_has_controls_mtm_multiple` ;

CREATE TABLE IF NOT EXISTS `controls_has_controls_mtm_multiple` (
  `controls_id` INT NOT NULL,
  `controls_mtm_multiple_id` INT NOT NULL,
  PRIMARY KEY (`controls_id`, `controls_mtm_multiple_id`),
  INDEX `fk_controls_has_controls_mtm_multiple_controls_mtm_multiple_idx` (`controls_mtm_multiple_id` ASC),
  INDEX `fk_controls_has_controls_mtm_multiple_controls1_idx` (`controls_id` ASC),
  CONSTRAINT `fk_controls_has_controls_mtm_multiple_controls1`
    FOREIGN KEY (`controls_id`)
    REFERENCES `controls` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_has_controls_mtm_multiple_controls_mtm_multiple1`
    FOREIGN KEY (`controls_mtm_multiple_id`)
    REFERENCES `controls_mtm_multiple` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_inline_otm_single`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_inline_otm_single` ;

CREATE TABLE IF NOT EXISTS `controls_inline_otm_single` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_inline_otm_multiple`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_inline_otm_multiple` ;

CREATE TABLE IF NOT EXISTS `controls_inline_otm_multiple` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first` VARCHAR(45) NOT NULL,
  `last` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_inline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_inline` ;

CREATE TABLE IF NOT EXISTS `controls_inline` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `controls_id` INT NOT NULL,
  `controls_inline_otm_single_id` INT NOT NULL,
  `controls_inline_otm_multiple_id` INT NOT NULL,
  `static` VARCHAR(45) NOT NULL,
  `text` VARCHAR(45) NOT NULL,
  `boolean` TINYINT(1) NOT NULL,
  `bigint` BIGINT NOT NULL,
  `double` DOUBLE NOT NULL,
  `upload` VARCHAR(45) NOT NULL,
  `binary` BLOB NOT NULL,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `datetime` DATETIME NOT NULL,
  `year` YEAR NOT NULL,
  `textarea` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_controls_inline_controls_inline_otm_single1_idx` (`controls_inline_otm_single_id` ASC),
  INDEX `fk_controls_inline_controls_inline_otm_multiple1_idx` (`controls_inline_otm_multiple_id` ASC),
  INDEX `fk_controls_inline_controls1_idx` (`controls_id` ASC),
  CONSTRAINT `fk_controls_inline_controls_inline_otm_single1`
    FOREIGN KEY (`controls_inline_otm_single_id`)
    REFERENCES `controls_inline_otm_single` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_inline_controls_inline_otm_multiple1`
    FOREIGN KEY (`controls_inline_otm_multiple_id`)
    REFERENCES `controls_inline_otm_multiple` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_inline_controls1`
    FOREIGN KEY (`controls_id`)
    REFERENCES `controls` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_inline_mtm_single`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_inline_mtm_single` ;

CREATE TABLE IF NOT EXISTS `controls_inline_mtm_single` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_inline_mtm_multiple`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_inline_mtm_multiple` ;

CREATE TABLE IF NOT EXISTS `controls_inline_mtm_multiple` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first` VARCHAR(45) NOT NULL,
  `last` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_inline_has_controls_inline_mtm_single`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_inline_has_controls_inline_mtm_single` ;

CREATE TABLE IF NOT EXISTS `controls_inline_has_controls_inline_mtm_single` (
  `controls_inline_id` INT NOT NULL,
  `controls_inline_mtm_single_id` INT NOT NULL,
  PRIMARY KEY (`controls_inline_id`, `controls_inline_mtm_single_id`),
  INDEX `fk_controls_inline_has_controls_inline_mtm_single_controls__idx` (`controls_inline_mtm_single_id` ASC),
  INDEX `fk_controls_inline_has_controls_inline_mtm_single_controls__idx1` (`controls_inline_id` ASC),
  CONSTRAINT `fk_controls_inline_has_controls_inline_mtm_single_controls_in1`
    FOREIGN KEY (`controls_inline_id`)
    REFERENCES `controls_inline` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_inline_has_controls_inline_mtm_single_controls_in2`
    FOREIGN KEY (`controls_inline_mtm_single_id`)
    REFERENCES `controls_inline_mtm_single` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controls_inline_has_controls_inline_mtm_multiple`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controls_inline_has_controls_inline_mtm_multiple` ;

CREATE TABLE IF NOT EXISTS `controls_inline_has_controls_inline_mtm_multiple` (
  `controls_inline_id` INT NOT NULL,
  `controls_inline_mtm_multiple_id` INT NOT NULL,
  PRIMARY KEY (`controls_inline_id`, `controls_inline_mtm_multiple_id`),
  INDEX `fk_controls_inline_has_controls_inline_mtm_multiple_control_idx` (`controls_inline_mtm_multiple_id` ASC),
  INDEX `fk_controls_inline_has_controls_inline_mtm_multiple_control_idx1` (`controls_inline_id` ASC),
  CONSTRAINT `fk_controls_inline_has_controls_inline_mtm_multiple_controls_1`
    FOREIGN KEY (`controls_inline_id`)
    REFERENCES `controls_inline` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_inline_has_controls_inline_mtm_multiple_controls_2`
    FOREIGN KEY (`controls_inline_mtm_multiple_id`)
    REFERENCES `controls_inline_mtm_multiple` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
