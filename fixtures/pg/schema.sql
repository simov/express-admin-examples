
DROP SCHEMA IF EXISTS "express-admin-examples" ;
CREATE SCHEMA IF NOT EXISTS "express-admin-examples";


ALTER TABLE "purchase" DROP CONSTRAINT "item_id";
ALTER TABLE "purchase" DROP CONSTRAINT "user_id";
ALTER TABLE "recipe_has_recipe_types" DROP CONSTRAINT "recipe_id";
ALTER TABLE "recipe_has_recipe_types" DROP CONSTRAINT "recipe_type_id";
ALTER TABLE "recipe_has_recipe_methods" DROP CONSTRAINT "recipe_id";
ALTER TABLE "recipe_has_recipe_methods" DROP CONSTRAINT "recipe_method_id";
ALTER TABLE "address" DROP CONSTRAINT "user_id";
ALTER TABLE "phone" DROP CONSTRAINT "user_id";
ALTER TABLE "repair" DROP CONSTRAINT "car_id";
ALTER TABLE "driver" DROP CONSTRAINT "car_id";

ALTER TABLE "controls" DROP CONSTRAINT "controls_otm_single_id";
ALTER TABLE "controls" DROP CONSTRAINT "controls_otm_multiple_id";

ALTER TABLE "controls_has_controls_mtm_single" DROP CONSTRAINT "controls_id";
ALTER TABLE "controls_has_controls_mtm_single" DROP CONSTRAINT "controls_mtm_single_id";
ALTER TABLE "controls_has_controls_mtm_multiple" DROP CONSTRAINT "controls_id";
ALTER TABLE "controls_has_controls_mtm_multiple" DROP CONSTRAINT "controls_mtm_multiple_id";

ALTER TABLE "controls_inline" DROP CONSTRAINT "controls_inline_otm_single_id";
ALTER TABLE "controls_inline" DROP CONSTRAINT "controls_inline_otm_multiple_id";
ALTER TABLE "controls_inline" DROP CONSTRAINT "controls_id";

ALTER TABLE "controls_inline_has_controls_inline_mtm_single" DROP CONSTRAINT "controls_inline_id";
ALTER TABLE "controls_inline_has_controls_inline_mtm_single" DROP CONSTRAINT "controls_inline_mtm_single_id";
ALTER TABLE "controls_inline_has_controls_inline_mtm_multiple" DROP CONSTRAINT "controls_inline_id";
ALTER TABLE "controls_inline_has_controls_inline_mtm_multiple" DROP CONSTRAINT "controls_inline_mtm_multiple_id";


-- -----------------------------------------------------
-- Table "notes"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "notes" ;
CREATE SEQUENCE notes_id_seq;

CREATE  TABLE IF NOT EXISTS "notes" (
  "id" INT NOT NULL DEFAULT nextval('notes_id_seq') ,
  "notes1" TEXT NULL ,
  "notes2" TEXT NOT NULL ,
  "notes3" TEXT NULL ,
  "notes4" TEXT NOT NULL ,
  PRIMARY KEY ("id") );


-- -----------------------------------------------------
-- Table "item"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "item" ;
CREATE SEQUENCE item_id_seq;

CREATE  TABLE IF NOT EXISTS "item" (
  "id" INT NOT NULL DEFAULT nextval('item_id_seq') ,
  "name" VARCHAR(45) NOT NULL ,
  "description" TEXT NULL ,
  "image" VARCHAR(255) NULL ,
  PRIMARY KEY ("id") );


-- -----------------------------------------------------
-- Table "user"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "user" ;
CREATE SEQUENCE user_id_seq;

CREATE  TABLE IF NOT EXISTS "user" (
  "id" INT NOT NULL DEFAULT nextval('user_id_seq') ,
  "firstname" VARCHAR(45) NOT NULL ,
  "lastname" VARCHAR(45) NULL ,
  "created_at" TIMESTAMP NOT NULL ,
  "updated_at" TIMESTAMP NOT NULL ,
  PRIMARY KEY ("id") );


-- -----------------------------------------------------
-- Table "purchase"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "purchase" ;
CREATE SEQUENCE purchase_id_seq;

CREATE  TABLE IF NOT EXISTS "purchase" (
  "id" INT NOT NULL DEFAULT nextval('purchase_id_seq') ,
  "item_id" INT NOT NULL ,
  "user_id" INT NULL ,
  "cache" DECIMAL(6,2) NOT NULL ,
  "date" DATE NULL ,
  "deleted" BOOLEAN NULL,
  "deleted_at" TIMESTAMP NULL,
  PRIMARY KEY ("id") ,
  
  CONSTRAINT "item_id"
    FOREIGN KEY ("item_id" )
    REFERENCES "item" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "user_id"
    FOREIGN KEY ("user_id" )
    REFERENCES "user" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "recipe"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "recipe" ;
CREATE SEQUENCE recipe_id_seq;

CREATE  TABLE IF NOT EXISTS "recipe" (
  "id" INT NOT NULL DEFAULT nextval('recipe_id_seq') ,
  "name" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") );


-- -----------------------------------------------------
-- Table "recipe_type"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "recipe_type" ;
CREATE SEQUENCE recipe_type_id_seq;

CREATE  TABLE IF NOT EXISTS "recipe_type" (
  "id" INT NOT NULL DEFAULT nextval('recipe_type_id_seq') ,
  "title" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") );


-- -----------------------------------------------------
-- Table "recipe_method"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "recipe_method" ;
CREATE SEQUENCE recipe_method_id_seq;

CREATE  TABLE IF NOT EXISTS "recipe_method" (
  "id" INT NOT NULL DEFAULT nextval('recipe_method_id_seq') ,
  "title" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") );


-- -----------------------------------------------------
-- Table "recipe_has_recipe_types"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "recipe_has_recipe_types" ;

CREATE  TABLE IF NOT EXISTS "recipe_has_recipe_types" (
  "recipe_id" INT NOT NULL ,
  "recipe_type_id" INT NOT NULL ,
  PRIMARY KEY ("recipe_id", "recipe_type_id") ,
  
  CONSTRAINT "recipe_type_id"
    FOREIGN KEY ("recipe_id" )
    REFERENCES "recipe" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "recipe_id"
    FOREIGN KEY ("recipe_type_id" )
    REFERENCES "recipe_type" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "recipe_has_recipe_methods"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "recipe_has_recipe_methods" ;

CREATE  TABLE IF NOT EXISTS "recipe_has_recipe_methods" (
  "recipe_id" INT NOT NULL ,
  "recipe_method_id" INT NOT NULL ,
  PRIMARY KEY ("recipe_id", "recipe_method_id") ,
  
  CONSTRAINT "recipe_method_id"
    FOREIGN KEY ("recipe_id" )
    REFERENCES "recipe" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "recipe_id"
    FOREIGN KEY ("recipe_method_id" )
    REFERENCES "recipe_method" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "address"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "address" ;
CREATE SEQUENCE address_id_seq;

CREATE  TABLE IF NOT EXISTS "address" (
  "id" INT NOT NULL DEFAULT nextval('address_id_seq') ,
  "user_id" INT NOT NULL ,
  "street" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") ,
  
  CONSTRAINT "user_id"
    FOREIGN KEY ("user_id" )
    REFERENCES "user" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "phone"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "phone" ;
CREATE SEQUENCE phone_id_seq;

CREATE  TABLE IF NOT EXISTS "phone" (
  "id" INT NOT NULL DEFAULT nextval('phone_id_seq') ,
  "user_id" INT NOT NULL ,
  "mobile" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") ,
  
  CONSTRAINT "user_id"
    FOREIGN KEY ("user_id" )
    REFERENCES "user" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "car"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "car" ;
CREATE SEQUENCE car_id_seq;

CREATE  TABLE IF NOT EXISTS "car" (
  "id" INT NOT NULL DEFAULT nextval('car_id_seq') ,
  "model" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") );


-- -----------------------------------------------------
-- Table "repair"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "repair" ;
CREATE SEQUENCE repair_id_seq;

CREATE  TABLE IF NOT EXISTS "repair" (
  "id" INT NOT NULL DEFAULT nextval('repair_id_seq') ,
  "car_id" INT NOT NULL ,
  "date" DATE NOT NULL ,
  PRIMARY KEY ("id") ,
  CONSTRAINT "car_id"
    FOREIGN KEY ("car_id" )
    REFERENCES "car" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "driver"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "driver" ;
CREATE SEQUENCE driver_id_seq;

CREATE  TABLE IF NOT EXISTS "driver" (
  "id" INT NOT NULL DEFAULT nextval('driver_id_seq') ,
  "car_id" INT NOT NULL ,
  "name" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") ,
  CONSTRAINT "car_id"
    FOREIGN KEY ("car_id" )
    REFERENCES "car" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "controls_otm_single"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_otm_single" ;
CREATE SEQUENCE controls_otm_single_id_seq;

CREATE TABLE IF NOT EXISTS "controls_otm_single" (
  "id" INT NOT NULL DEFAULT nextval('controls_otm_single_id_seq'),
  "name" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("id"));


-- -----------------------------------------------------
-- Table "controls_otm_multiple"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_otm_multiple" ;
CREATE SEQUENCE controls_otm_multiple_id_seq;

CREATE TABLE IF NOT EXISTS "controls_otm_multiple" (
  "id" INT NOT NULL DEFAULT nextval('controls_otm_multiple_id_seq'),
  "first" VARCHAR(45) NOT NULL,
  "last" VARCHAR(45) NULL,
  PRIMARY KEY ("id"));


-- -----------------------------------------------------
-- Table "controls"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls" ;
CREATE SEQUENCE controls_id_seq;

CREATE TABLE IF NOT EXISTS "controls" (
  "id" INT NOT NULL DEFAULT nextval('controls_id_seq'),
  "controls_otm_single_id" INT NULL,
  "controls_otm_multiple_id" INT NULL,
  "static" VARCHAR(45) NULL,
  "text" VARCHAR(45) NULL,
  "boolean" BOOLEAN NULL,
  "bigint" BIGINT NULL,
  "double" DOUBLE PRECISION NULL,
  "upload" VARCHAR(45) NULL,
  "binary" BYTEA NULL,
  "date" DATE NULL,
  "time" TIME NULL,
  "datetime" TIMESTAMP NULL,
  "textarea" TEXT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "controls_otm_single_id"
    FOREIGN KEY ("controls_otm_single_id")
    REFERENCES "controls_otm_single" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_otm_multiple_id"
    FOREIGN KEY ("controls_otm_multiple_id")
    REFERENCES "controls_otm_multiple" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "controls_mtm_single"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_mtm_single" ;
CREATE SEQUENCE controls_mtm_single_id_seq;

CREATE TABLE IF NOT EXISTS "controls_mtm_single" (
  "id" INT NOT NULL DEFAULT nextval('controls_mtm_single_id_seq'),
  "name" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("id"));


-- -----------------------------------------------------
-- Table "controls_mtm_multiple"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_mtm_multiple" ;
CREATE SEQUENCE controls_mtm_multiple_id_seq;

CREATE TABLE IF NOT EXISTS "controls_mtm_multiple" (
  "id" INT NOT NULL DEFAULT nextval('controls_mtm_multiple_id_seq'),
  "first" VARCHAR(45) NOT NULL,
  "last" VARCHAR(45) NULL,
  PRIMARY KEY ("id"));


-- -----------------------------------------------------
-- Table "controls_has_controls_mtm_single"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_has_controls_mtm_single" ;

CREATE TABLE IF NOT EXISTS "controls_has_controls_mtm_single" (
  "controls_id" INT NOT NULL,
  "controls_mtm_single_id" INT NOT NULL,
  PRIMARY KEY ("controls_id", "controls_mtm_single_id"),
  CONSTRAINT "controls_id"
    FOREIGN KEY ("controls_id")
    REFERENCES "controls" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_mtm_single_id"
    FOREIGN KEY ("controls_mtm_single_id")
    REFERENCES "controls_mtm_single" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "controls_has_controls_mtm_multiple"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_has_controls_mtm_multiple" ;

CREATE TABLE IF NOT EXISTS "controls_has_controls_mtm_multiple" (
  "controls_id" INT NOT NULL,
  "controls_mtm_multiple_id" INT NOT NULL,
  PRIMARY KEY ("controls_id", "controls_mtm_multiple_id"),
  CONSTRAINT "controls_id"
    FOREIGN KEY ("controls_id")
    REFERENCES "controls" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_mtm_multiple_id"
    FOREIGN KEY ("controls_mtm_multiple_id")
    REFERENCES "controls_mtm_multiple" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "controls_inline_otm_single"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_inline_otm_single" ;
CREATE SEQUENCE controls_inline_otm_single_id_seq;

CREATE TABLE IF NOT EXISTS "controls_inline_otm_single" (
  "id" INT NOT NULL DEFAULT nextval('controls_inline_otm_single_id_seq'),
  "name" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("id"));


-- -----------------------------------------------------
-- Table "controls_inline_otm_multiple"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_inline_otm_multiple" ;
CREATE SEQUENCE controls_inline_otm_multiple_id_seq;

CREATE TABLE IF NOT EXISTS "controls_inline_otm_multiple" (
  "id" INT NOT NULL DEFAULT nextval('controls_inline_otm_multiple_id_seq'),
  "first" VARCHAR(45) NOT NULL,
  "last" VARCHAR(45) NULL,
  PRIMARY KEY ("id"));


-- -----------------------------------------------------
-- Table "controls_inline"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_inline" ;
CREATE SEQUENCE controls_inline_id_seq;

CREATE TABLE IF NOT EXISTS "controls_inline" (
  "id" INT NOT NULL DEFAULT nextval('controls_inline_id_seq'),
  "controls_id" INT NOT NULL,
  "controls_inline_otm_single_id" INT NOT NULL,
  "controls_inline_otm_multiple_id" INT NOT NULL,
  "static" VARCHAR(45) NOT NULL,
  "text" VARCHAR(45) NOT NULL,
  "boolean" BOOLEAN NOT NULL,
  "bigint" BIGINT NOT NULL,
  "double" DOUBLE PRECISION NOT NULL,
  "upload" VARCHAR(45) NOT NULL,
  "binary" BYTEA NOT NULL,
  "date" DATE NOT NULL,
  "time" TIME NOT NULL,
  "datetime" TIMESTAMP NOT NULL,
  "textarea" TEXT NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "controls_inline_otm_single_id"
    FOREIGN KEY ("controls_inline_otm_single_id")
    REFERENCES "controls_inline_otm_single" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_inline_otm_multiple_id"
    FOREIGN KEY ("controls_inline_otm_multiple_id")
    REFERENCES "controls_inline_otm_multiple" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_id"
    FOREIGN KEY ("controls_id")
    REFERENCES "controls" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "controls_inline_mtm_single"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_inline_mtm_single" ;
CREATE SEQUENCE controls_inline_mtm_single_id_seq;

CREATE TABLE IF NOT EXISTS "controls_inline_mtm_single" (
  "id" INT NOT NULL DEFAULT nextval('controls_inline_mtm_single_id_seq'),
  "name" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("id"));


-- -----------------------------------------------------
-- Table "controls_inline_mtm_multiple"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_inline_mtm_multiple" ;
CREATE SEQUENCE controls_inline_mtm_multiple_id_seq;

CREATE TABLE IF NOT EXISTS "controls_inline_mtm_multiple" (
  "id" INT NOT NULL DEFAULT nextval('controls_inline_mtm_multiple_id_seq'),
  "first" VARCHAR(45) NOT NULL,
  "last" VARCHAR(45) NULL,
  PRIMARY KEY ("id"));


-- -----------------------------------------------------
-- Table "controls_inline_has_controls_inline_mtm_single"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_inline_has_controls_inline_mtm_single" ;

CREATE TABLE IF NOT EXISTS "controls_inline_has_controls_inline_mtm_single" (
  "controls_inline_id" INT NOT NULL,
  "controls_inline_mtm_single_id" INT NOT NULL,
  PRIMARY KEY ("controls_inline_id", "controls_inline_mtm_single_id"),
  CONSTRAINT "controls_inline_id"
    FOREIGN KEY ("controls_inline_id")
    REFERENCES "controls_inline" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_inline_mtm_single_id"
    FOREIGN KEY ("controls_inline_mtm_single_id")
    REFERENCES "controls_inline_mtm_single" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "controls_inline_has_controls_inline_mtm_multiple"
-- -----------------------------------------------------
DROP TABLE IF EXISTS "controls_inline_has_controls_inline_mtm_multiple" ;

CREATE TABLE IF NOT EXISTS "controls_inline_has_controls_inline_mtm_multiple" (
  "controls_inline_id" INT NOT NULL,
  "controls_inline_mtm_multiple_id" INT NOT NULL,
  PRIMARY KEY ("controls_inline_id", "controls_inline_mtm_multiple_id"),
  CONSTRAINT "controls_inline_id"
    FOREIGN KEY ("controls_inline_id")
    REFERENCES "controls_inline" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_inline_mtm_multiple_id"
    FOREIGN KEY ("controls_inline_mtm_multiple_id")
    REFERENCES "controls_inline_mtm_multiple" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
