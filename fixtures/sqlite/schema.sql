
-- -----------------------------------------------------
-- Table `notes`
-- -----------------------------------------------------
CREATE TABLE `notes` (
  `notes1` TEXT NULL,
  `notes2` TEXT NOT NULL,
  `notes3` TEXT NULL,
  `notes4` TEXT NOT NULL);


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
CREATE TABLE `item` (
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `image` VARCHAR(255) NULL);


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
CREATE TABLE `user` (
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL);


-- -----------------------------------------------------
-- Table `purchase`
-- -----------------------------------------------------
CREATE TABLE `purchase` (
  `item_id` INT NOT NULL,
  `user_id` INT NULL,
  `cache` DECIMAL(6,2) NOT NULL,
  `date` DATE NULL,
  `deleted` TINYINT(1) NULL,
  `deleted_at` DATETIME NULL,
  CONSTRAINT `fk_purchase_item`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`rowid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`rowid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
CREATE TABLE `recipe` (
  `name` VARCHAR(45) NOT NULL);


-- -----------------------------------------------------
-- Table `recipe_type`
-- -----------------------------------------------------
CREATE TABLE `recipe_type` (
  `title` VARCHAR(45) NOT NULL);


-- -----------------------------------------------------
-- Table `recipe_method`
-- -----------------------------------------------------
CREATE TABLE `recipe_method` (
  `title` VARCHAR(45) NOT NULL);


-- -----------------------------------------------------
-- Table `recipe_has_recipe_types`
-- -----------------------------------------------------
CREATE TABLE `recipe_has_recipe_types` (
  `recipe_id` INT NOT NULL,
  `recipe_type_id` INT NOT NULL,
  CONSTRAINT `fk_recipe_has_recipe_type_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_recipe_type_recipe_type1`
    FOREIGN KEY (`recipe_type_id`)
    REFERENCES `recipe_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `recipe_has_recipe_methods`
-- -----------------------------------------------------
CREATE TABLE `recipe_has_recipe_methods` (
  `recipe_id` INT NOT NULL,
  `recipe_method_id` INT NOT NULL,
  CONSTRAINT `fk_recipe_has_recipe_methods_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_recipe_methods_recipe_method1`
    FOREIGN KEY (`recipe_method_id`)
    REFERENCES `recipe_method` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
CREATE TABLE `address` (
  `user_id` INT NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  CONSTRAINT `fk_address_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `phone`
-- -----------------------------------------------------
CREATE TABLE `phone` (
  `user_id` INT NOT NULL,
  `mobile` VARCHAR(45) NOT NULL,
  CONSTRAINT `fk_phone_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `car`
-- -----------------------------------------------------
CREATE TABLE `car` (
  `model` VARCHAR(45) NOT NULL);


-- -----------------------------------------------------
-- Table `repair`
-- -----------------------------------------------------
CREATE TABLE `repair` (
  `car_id` INT NOT NULL,
  `date` DATE NOT NULL,
  CONSTRAINT `fk_repair_car1`
    FOREIGN KEY (`car_id`)
    REFERENCES `car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `driver`
-- -----------------------------------------------------
CREATE TABLE `driver` (
  `car_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  CONSTRAINT `fk_driver_car1`
    FOREIGN KEY (`car_id`)
    REFERENCES `car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `controls_otm_single`
-- -----------------------------------------------------
CREATE TABLE `controls_otm_single` (
  `name` VARCHAR(45) NOT NULL);


-- -----------------------------------------------------
-- Table `controls_otm_multiple`
-- -----------------------------------------------------
CREATE TABLE `controls_otm_multiple` (
  `first` VARCHAR(45) NOT NULL,
  `last` VARCHAR(45) NULL);


-- -----------------------------------------------------
-- Table `controls`
-- -----------------------------------------------------
CREATE TABLE `controls` (
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
  CONSTRAINT `fk_controls_controls_otm_single1`
    FOREIGN KEY (`controls_otm_single_id`)
    REFERENCES `controls_otm_single` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_controls_otm_multiple1`
    FOREIGN KEY (`controls_otm_multiple_id`)
    REFERENCES `controls_otm_multiple` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `controls_mtm_single`
-- -----------------------------------------------------
CREATE TABLE `controls_mtm_single` (
  `name` VARCHAR(45) NOT NULL);


-- -----------------------------------------------------
-- Table `controls_mtm_multiple`
-- -----------------------------------------------------
CREATE TABLE `controls_mtm_multiple` (
  `first` VARCHAR(45) NOT NULL,
  `last` VARCHAR(45) NULL);


-- -----------------------------------------------------
-- Table `controls_has_controls_mtm_single`
-- -----------------------------------------------------
CREATE TABLE `controls_has_controls_mtm_single` (
  `controls_id` INT NOT NULL,
  `controls_mtm_single_id` INT NOT NULL,
  CONSTRAINT `fk_controls_has_controls_mtm_single_controls1`
    FOREIGN KEY (`controls_id`)
    REFERENCES `controls` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_has_controls_mtm_single_controls_mtm_single1`
    FOREIGN KEY (`controls_mtm_single_id`)
    REFERENCES `controls_mtm_single` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `controls_has_controls_mtm_multiple`
-- -----------------------------------------------------
CREATE TABLE `controls_has_controls_mtm_multiple` (
  `controls_id` INT NOT NULL,
  `controls_mtm_multiple_id` INT NOT NULL,
  CONSTRAINT `fk_controls_has_controls_mtm_multiple_controls1`
    FOREIGN KEY (`controls_id`)
    REFERENCES `controls` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_has_controls_mtm_multiple_controls_mtm_multiple1`
    FOREIGN KEY (`controls_mtm_multiple_id`)
    REFERENCES `controls_mtm_multiple` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `controls_inline_otm_single`
-- -----------------------------------------------------
CREATE TABLE `controls_inline_otm_single` (
  `name` VARCHAR(45) NOT NULL);


-- -----------------------------------------------------
-- Table `controls_inline_otm_multiple`
-- -----------------------------------------------------
CREATE TABLE `controls_inline_otm_multiple` (
  `first` VARCHAR(45) NOT NULL,
  `last` VARCHAR(45) NULL);


-- -----------------------------------------------------
-- Table `controls_inline`
-- -----------------------------------------------------
CREATE TABLE `controls_inline` (
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
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `controls_inline_mtm_single`
-- -----------------------------------------------------
CREATE TABLE `controls_inline_mtm_single` (
  `name` VARCHAR(45) NOT NULL);


-- -----------------------------------------------------
-- Table `controls_inline_mtm_multiple`
-- -----------------------------------------------------
CREATE TABLE `controls_inline_mtm_multiple` (
  `first` VARCHAR(45) NOT NULL,
  `last` VARCHAR(45) NULL);


-- -----------------------------------------------------
-- Table `controls_inline_has_controls_inline_mtm_single`
-- -----------------------------------------------------
CREATE TABLE `controls_inline_has_controls_inline_mtm_single` (
  `controls_inline_id` INT NOT NULL,
  `controls_inline_mtm_single_id` INT NOT NULL,
  CONSTRAINT `fk_controls_inline_has_controls_inline_mtm_single_controls_in1`
    FOREIGN KEY (`controls_inline_id`)
    REFERENCES `controls_inline` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_inline_has_controls_inline_mtm_single_controls_in2`
    FOREIGN KEY (`controls_inline_mtm_single_id`)
    REFERENCES `controls_inline_mtm_single` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `controls_inline_has_controls_inline_mtm_multiple`
-- -----------------------------------------------------
CREATE TABLE `controls_inline_has_controls_inline_mtm_multiple` (
  `controls_inline_id` INT NOT NULL,
  `controls_inline_mtm_multiple_id` INT NOT NULL,
  CONSTRAINT `fk_controls_inline_has_controls_inline_mtm_multiple_controls_1`
    FOREIGN KEY (`controls_inline_id`)
    REFERENCES `controls_inline` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controls_inline_has_controls_inline_mtm_multiple_controls_2`
    FOREIGN KEY (`controls_inline_mtm_multiple_id`)
    REFERENCES `controls_inline_mtm_multiple` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
