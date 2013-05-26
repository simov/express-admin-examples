SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `express-admin-stress-test` ;
CREATE SCHEMA IF NOT EXISTS `express-admin-stress-test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `express-admin-stress-test` ;

-- -----------------------------------------------------
-- Table `item_choice1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_choice1` ;

CREATE  TABLE IF NOT EXISTS `item_choice1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item_choice2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_choice2` ;

CREATE  TABLE IF NOT EXISTS `item_choice2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE  TABLE IF NOT EXISTS `item` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `item_choice1_id` INT NOT NULL ,
  `item_choice2_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_item_item_choice1` (`item_choice1_id` ASC) ,
  INDEX `fk_item_item_choice21` (`item_choice2_id` ASC) ,
  CONSTRAINT `fk_item_item_choice1`
    FOREIGN KEY (`item_choice1_id` )
    REFERENCES `item_choice1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_item_choice21`
    FOREIGN KEY (`item_choice2_id` )
    REFERENCES `item_choice2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item_group1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_group1` ;

CREATE  TABLE IF NOT EXISTS `item_group1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item_group2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_group2` ;

CREATE  TABLE IF NOT EXISTS `item_group2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item_has_item_group1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_has_item_group1` ;

CREATE  TABLE IF NOT EXISTS `item_has_item_group1` (
  `item_id` INT NOT NULL ,
  `item_group1_id` INT NOT NULL ,
  PRIMARY KEY (`item_id`, `item_group1_id`) ,
  INDEX `fk_item_has_item_group1_item_group11` (`item_group1_id` ASC) ,
  INDEX `fk_item_has_item_group1_item1` (`item_id` ASC) ,
  CONSTRAINT `fk_item_has_item_group1_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_has_item_group1_item_group11`
    FOREIGN KEY (`item_group1_id` )
    REFERENCES `item_group1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item_has_item_group2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_has_item_group2` ;

CREATE  TABLE IF NOT EXISTS `item_has_item_group2` (
  `item_id` INT NOT NULL ,
  `item_group2_id` INT NOT NULL ,
  PRIMARY KEY (`item_id`, `item_group2_id`) ,
  INDEX `fk_item_has_item_group2_item_group21` (`item_group2_id` ASC) ,
  INDEX `fk_item_has_item_group2_item1` (`item_id` ASC) ,
  CONSTRAINT `fk_item_has_item_group2_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_has_item_group2_item_group21`
    FOREIGN KEY (`item_group2_id` )
    REFERENCES `item_group2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one1_choice1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one1_choice1` ;

CREATE  TABLE IF NOT EXISTS `inline_one1_choice1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one1_choice2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one1_choice2` ;

CREATE  TABLE IF NOT EXISTS `inline_one1_choice2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one1` ;

CREATE  TABLE IF NOT EXISTS `inline_one1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `item_id` INT NOT NULL ,
  `inline_one1_choice1_id` INT NOT NULL ,
  `inline_one1_choice2_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_inline_one1_item1` (`item_id` ASC) ,
  INDEX `fk_inline_one1_inline_one1_choice11` (`inline_one1_choice1_id` ASC) ,
  INDEX `fk_inline_one1_inline_one1_choice21` (`inline_one1_choice2_id` ASC) ,
  CONSTRAINT `fk_inline_one1_item10`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_one1_inline_one1_choice11`
    FOREIGN KEY (`inline_one1_choice1_id` )
    REFERENCES `inline_one1_choice1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_one1_inline_one1_choice21`
    FOREIGN KEY (`inline_one1_choice2_id` )
    REFERENCES `inline_one1_choice2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one2_choice1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one2_choice1` ;

CREATE  TABLE IF NOT EXISTS `inline_one2_choice1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one2_choice2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one2_choice2` ;

CREATE  TABLE IF NOT EXISTS `inline_one2_choice2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one2` ;

CREATE  TABLE IF NOT EXISTS `inline_one2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `item_id` INT NOT NULL ,
  `inline_one2_choice1_id` INT NOT NULL ,
  `inline_one2_choice2_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_inline_one2_item1` (`item_id` ASC) ,
  INDEX `fk_inline_one2_inline_one2_choice11` (`inline_one2_choice1_id` ASC) ,
  INDEX `fk_inline_one2_inline_one2_choice21` (`inline_one2_choice2_id` ASC) ,
  CONSTRAINT `fk_inline_one2_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_one2_inline_one2_choice11`
    FOREIGN KEY (`inline_one2_choice1_id` )
    REFERENCES `inline_one2_choice1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_one2_inline_one2_choice21`
    FOREIGN KEY (`inline_one2_choice2_id` )
    REFERENCES `inline_one2_choice2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many1_choice1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many1_choice1` ;

CREATE  TABLE IF NOT EXISTS `inline_many1_choice1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many1_choice2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many1_choice2` ;

CREATE  TABLE IF NOT EXISTS `inline_many1_choice2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many1` ;

CREATE  TABLE IF NOT EXISTS `inline_many1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `item_id` INT NOT NULL ,
  `inline_many1_choice1_id` INT NOT NULL ,
  `inline_many1_choice2_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_inline_many1_item1` (`item_id` ASC) ,
  INDEX `fk_inline_many1_inline_many1_choice11` (`inline_many1_choice1_id` ASC) ,
  INDEX `fk_inline_many1_inline_many1_choice21` (`inline_many1_choice2_id` ASC) ,
  CONSTRAINT `fk_inline_many1_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_many1_inline_many1_choice11`
    FOREIGN KEY (`inline_many1_choice1_id` )
    REFERENCES `inline_many1_choice1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_many1_inline_many1_choice21`
    FOREIGN KEY (`inline_many1_choice2_id` )
    REFERENCES `inline_many1_choice2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many2_choice1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many2_choice1` ;

CREATE  TABLE IF NOT EXISTS `inline_many2_choice1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many2_choice2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many2_choice2` ;

CREATE  TABLE IF NOT EXISTS `inline_many2_choice2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many2` ;

CREATE  TABLE IF NOT EXISTS `inline_many2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `item_id` INT NOT NULL ,
  `inline_many2_choice1_id` INT NOT NULL ,
  `inline_many2_choice2_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_inline_many2_item1` (`item_id` ASC) ,
  INDEX `fk_inline_many2_inline_many2_choice11` (`inline_many2_choice1_id` ASC) ,
  INDEX `fk_inline_many2_inline_many2_choice21` (`inline_many2_choice2_id` ASC) ,
  CONSTRAINT `fk_inline_many2_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_many2_inline_many2_choice11`
    FOREIGN KEY (`inline_many2_choice1_id` )
    REFERENCES `inline_many2_choice1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_many2_inline_many2_choice21`
    FOREIGN KEY (`inline_many2_choice2_id` )
    REFERENCES `inline_many2_choice2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one1_group1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one1_group1` ;

CREATE  TABLE IF NOT EXISTS `inline_one1_group1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one1_group2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one1_group2` ;

CREATE  TABLE IF NOT EXISTS `inline_one1_group2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one2_group1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one2_group1` ;

CREATE  TABLE IF NOT EXISTS `inline_one2_group1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one2_group2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one2_group2` ;

CREATE  TABLE IF NOT EXISTS `inline_one2_group2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many1_group1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many1_group1` ;

CREATE  TABLE IF NOT EXISTS `inline_many1_group1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many1_group2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many1_group2` ;

CREATE  TABLE IF NOT EXISTS `inline_many1_group2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many2_group1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many2_group1` ;

CREATE  TABLE IF NOT EXISTS `inline_many2_group1` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many2_group2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many2_group2` ;

CREATE  TABLE IF NOT EXISTS `inline_many2_group2` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one1_has_inline_one1_group1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one1_has_inline_one1_group1` ;

CREATE  TABLE IF NOT EXISTS `inline_one1_has_inline_one1_group1` (
  `inline_one1_id` INT NOT NULL ,
  `inline_one1_group1_id` INT NOT NULL ,
  PRIMARY KEY (`inline_one1_id`, `inline_one1_group1_id`) ,
  INDEX `fk_inline_one1_has_inline_one1_group1_inline_one1_group11` (`inline_one1_group1_id` ASC) ,
  INDEX `fk_inline_one1_has_inline_one1_group1_inline_one11` (`inline_one1_id` ASC) ,
  CONSTRAINT `fk_inline_one1_has_inline_one1_group1_inline_one11`
    FOREIGN KEY (`inline_one1_id` )
    REFERENCES `inline_one1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_one1_has_inline_one1_group1_inline_one1_group11`
    FOREIGN KEY (`inline_one1_group1_id` )
    REFERENCES `inline_one1_group1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one1_has_inline_one1_group2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one1_has_inline_one1_group2` ;

CREATE  TABLE IF NOT EXISTS `inline_one1_has_inline_one1_group2` (
  `inline_one1_id` INT NOT NULL ,
  `inline_one1_group2_id` INT NOT NULL ,
  PRIMARY KEY (`inline_one1_id`, `inline_one1_group2_id`) ,
  INDEX `fk_inline_one1_has_inline_one1_group2_inline_one1_group21` (`inline_one1_group2_id` ASC) ,
  INDEX `fk_inline_one1_has_inline_one1_group2_inline_one11` (`inline_one1_id` ASC) ,
  CONSTRAINT `fk_inline_one1_has_inline_one1_group2_inline_one11`
    FOREIGN KEY (`inline_one1_id` )
    REFERENCES `inline_one1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_one1_has_inline_one1_group2_inline_one1_group21`
    FOREIGN KEY (`inline_one1_group2_id` )
    REFERENCES `inline_one1_group2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one2_has_inline_one2_group1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one2_has_inline_one2_group1` ;

CREATE  TABLE IF NOT EXISTS `inline_one2_has_inline_one2_group1` (
  `inline_one2_id` INT NOT NULL ,
  `inline_one2_group1_id` INT NOT NULL ,
  PRIMARY KEY (`inline_one2_id`, `inline_one2_group1_id`) ,
  INDEX `fk_inline_one2_has_inline_one2_group1_inline_one2_group11` (`inline_one2_group1_id` ASC) ,
  INDEX `fk_inline_one2_has_inline_one2_group1_inline_one21` (`inline_one2_id` ASC) ,
  CONSTRAINT `fk_inline_one2_has_inline_one2_group1_inline_one21`
    FOREIGN KEY (`inline_one2_id` )
    REFERENCES `inline_one2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_one2_has_inline_one2_group1_inline_one2_group11`
    FOREIGN KEY (`inline_one2_group1_id` )
    REFERENCES `inline_one2_group1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_one2_has_inline_one2_group2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_one2_has_inline_one2_group2` ;

CREATE  TABLE IF NOT EXISTS `inline_one2_has_inline_one2_group2` (
  `inline_one2_id` INT NOT NULL ,
  `inline_one2_group2_id` INT NOT NULL ,
  PRIMARY KEY (`inline_one2_id`, `inline_one2_group2_id`) ,
  INDEX `fk_inline_one2_has_inline_one2_group2_inline_one2_group21` (`inline_one2_group2_id` ASC) ,
  INDEX `fk_inline_one2_has_inline_one2_group2_inline_one21` (`inline_one2_id` ASC) ,
  CONSTRAINT `fk_inline_one2_has_inline_one2_group2_inline_one21`
    FOREIGN KEY (`inline_one2_id` )
    REFERENCES `inline_one2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_one2_has_inline_one2_group2_inline_one2_group21`
    FOREIGN KEY (`inline_one2_group2_id` )
    REFERENCES `inline_one2_group2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many1_has_inline_many1_group1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many1_has_inline_many1_group1` ;

CREATE  TABLE IF NOT EXISTS `inline_many1_has_inline_many1_group1` (
  `inline_many1_id` INT NOT NULL ,
  `inline_many1_group1_id` INT NOT NULL ,
  PRIMARY KEY (`inline_many1_id`, `inline_many1_group1_id`) ,
  INDEX `fk_inline_many1_has_inline_many1_group1_inline_many1_group11` (`inline_many1_group1_id` ASC) ,
  INDEX `fk_inline_many1_has_inline_many1_group1_inline_many11` (`inline_many1_id` ASC) ,
  CONSTRAINT `fk_inline_many1_has_inline_many1_group1_inline_many11`
    FOREIGN KEY (`inline_many1_id` )
    REFERENCES `inline_many1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_many1_has_inline_many1_group1_inline_many1_group11`
    FOREIGN KEY (`inline_many1_group1_id` )
    REFERENCES `inline_many1_group1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many1_has_inline_many1_group2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many1_has_inline_many1_group2` ;

CREATE  TABLE IF NOT EXISTS `inline_many1_has_inline_many1_group2` (
  `inline_many1_id` INT NOT NULL ,
  `inline_many1_group2_id` INT NOT NULL ,
  PRIMARY KEY (`inline_many1_id`, `inline_many1_group2_id`) ,
  INDEX `fk_inline_many1_has_inline_many1_group2_inline_many1_group21` (`inline_many1_group2_id` ASC) ,
  INDEX `fk_inline_many1_has_inline_many1_group2_inline_many11` (`inline_many1_id` ASC) ,
  CONSTRAINT `fk_inline_many1_has_inline_many1_group2_inline_many11`
    FOREIGN KEY (`inline_many1_id` )
    REFERENCES `inline_many1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_many1_has_inline_many1_group2_inline_many1_group21`
    FOREIGN KEY (`inline_many1_group2_id` )
    REFERENCES `inline_many1_group2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many2_has_inline_many2_group1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many2_has_inline_many2_group1` ;

CREATE  TABLE IF NOT EXISTS `inline_many2_has_inline_many2_group1` (
  `inline_many2_id` INT NOT NULL ,
  `inline_many2_group1_id` INT NOT NULL ,
  PRIMARY KEY (`inline_many2_id`, `inline_many2_group1_id`) ,
  INDEX `fk_inline_many2_has_inline_many2_group1_inline_many2_group11` (`inline_many2_group1_id` ASC) ,
  INDEX `fk_inline_many2_has_inline_many2_group1_inline_many21` (`inline_many2_id` ASC) ,
  CONSTRAINT `fk_inline_many2_has_inline_many2_group1_inline_many21`
    FOREIGN KEY (`inline_many2_id` )
    REFERENCES `inline_many2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_many2_has_inline_many2_group1_inline_many2_group11`
    FOREIGN KEY (`inline_many2_group1_id` )
    REFERENCES `inline_many2_group1` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inline_many2_has_inline_many2_group2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inline_many2_has_inline_many2_group2` ;

CREATE  TABLE IF NOT EXISTS `inline_many2_has_inline_many2_group2` (
  `inline_many2_id` INT NOT NULL ,
  `inline_many2_group2_id` INT NOT NULL ,
  PRIMARY KEY (`inline_many2_id`, `inline_many2_group2_id`) ,
  INDEX `fk_inline_many2_has_inline_many2_group2_inline_many2_group21` (`inline_many2_group2_id` ASC) ,
  INDEX `fk_inline_many2_has_inline_many2_group2_inline_many21` (`inline_many2_id` ASC) ,
  CONSTRAINT `fk_inline_many2_has_inline_many2_group2_inline_many21`
    FOREIGN KEY (`inline_many2_id` )
    REFERENCES `inline_many2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inline_many2_has_inline_many2_group2_inline_many2_group21`
    FOREIGN KEY (`inline_many2_group2_id` )
    REFERENCES `inline_many2_group2` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
