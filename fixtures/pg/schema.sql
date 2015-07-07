
--DROP SCHEMA IF EXISTS "public" ;
CREATE SCHEMA "public";
GRANT ALL ON SCHEMA "public" to liolio;
GRANT ALL ON ALL TABLES IN SCHEMA "public" to liolio;
GRANT ALL ON ALL sequences IN SCHEMA "public" to liolio;


-- -----------------------------------------------------
-- Table "notes"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."notes" ;
CREATE SEQUENCE "public".notes_id_seq;
ALTER SEQUENCE "public".notes_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."notes" (
  "id" INT NOT NULL DEFAULT nextval('notes_id_seq') ,
  "notes1" TEXT NULL ,
  "notes2" TEXT NOT NULL ,
  "notes3" TEXT NULL ,
  "notes4" TEXT NOT NULL ,
  PRIMARY KEY ("id") );
ALTER TABLE "public"."notes" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "item"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."item" ;
CREATE SEQUENCE "public".item_id_seq;
ALTER SEQUENCE "public".item_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."item" (
  "id" INT NOT NULL DEFAULT nextval('item_id_seq') ,
  "name" VARCHAR(45) NOT NULL ,
  "description" TEXT NULL ,
  "image" VARCHAR(255) NULL ,
  PRIMARY KEY ("id") );
ALTER TABLE "public"."item" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "user"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."user" ;
CREATE SEQUENCE "public".user_id_seq;
ALTER SEQUENCE "public".user_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."user" (
  "id" INT NOT NULL DEFAULT nextval('user_id_seq') ,
  "firstname" VARCHAR(45) NOT NULL ,
  "lastname" VARCHAR(45) NULL ,
  "created_at" TIMESTAMP NOT NULL ,
  "updated_at" TIMESTAMP NOT NULL ,
  PRIMARY KEY ("id") );
ALTER TABLE "public"."user" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "purchase"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."purchase" ;
CREATE SEQUENCE "public".purchase_id_seq;
ALTER SEQUENCE "public".purchase_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."purchase" (
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
    REFERENCES "public"."item" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "user_id"
    FOREIGN KEY ("user_id" )
    REFERENCES "public"."user" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."purchase" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "recipe"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."recipe" ;
CREATE SEQUENCE "public".recipe_id_seq;
ALTER SEQUENCE  "public".recipe_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."recipe" (
  "id" INT NOT NULL DEFAULT nextval('recipe_id_seq') ,
  "name" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") );
ALTER TABLE "public"."recipe" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "recipe_type"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."recipe_type" ;
CREATE SEQUENCE "public".recipe_type_id_seq;
ALTER SEQUENCE "public".recipe_type_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."recipe_type" (
  "id" INT NOT NULL DEFAULT nextval('recipe_type_id_seq') ,
  "title" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") );
ALTER TABLE "public"."recipe_type" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "recipe_method"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."recipe_method" ;
CREATE SEQUENCE "public".recipe_method_id_seq;
ALTER SEQUENCE "public".recipe_method_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."recipe_method" (
  "id" INT NOT NULL DEFAULT nextval('recipe_method_id_seq') ,
  "title" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") );
ALTER TABLE "public"."recipe_method" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "recipe_has_recipe_types"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."recipe_has_recipe_types" ;

CREATE  TABLE IF NOT EXISTS "public"."recipe_has_recipe_types" (
  "recipe_id" INT NOT NULL ,
  "recipe_type_id" INT NOT NULL ,
  PRIMARY KEY ("recipe_id", "recipe_type_id") ,
  
  CONSTRAINT "recipe_type_id"
    FOREIGN KEY ("recipe_id" )
    REFERENCES "public"."recipe" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "recipe_id"
    FOREIGN KEY ("recipe_type_id" )
    REFERENCES "public"."recipe_type" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."recipe_has_recipe_types" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "recipe_has_recipe_methods"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."recipe_has_recipe_methods" ;

CREATE  TABLE IF NOT EXISTS "public"."recipe_has_recipe_methods" (
  "recipe_id" INT NOT NULL ,
  "recipe_method_id" INT NOT NULL ,
  PRIMARY KEY ("recipe_id", "recipe_method_id") ,
  
  CONSTRAINT "recipe_method_id"
    FOREIGN KEY ("recipe_id" )
    REFERENCES "public"."recipe" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "recipe_id"
    FOREIGN KEY ("recipe_method_id" )
    REFERENCES "public"."recipe_method" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."recipe_has_recipe_methods" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "address"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."address" ;
CREATE SEQUENCE "public".address_id_seq;
ALTER SEQUENCE "public".address_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."address" (
  "id" INT NOT NULL DEFAULT nextval('address_id_seq') ,
  "user_id" INT NOT NULL ,
  "street" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") ,
  
  CONSTRAINT "user_id"
    FOREIGN KEY ("user_id" )
    REFERENCES "public"."user" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."address" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "phone"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."phone" ;
CREATE SEQUENCE "public".phone_id_seq;
ALTER SEQUENCE "public".phone_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."phone" (
  "id" INT NOT NULL DEFAULT nextval('phone_id_seq') ,
  "user_id" INT NOT NULL ,
  "mobile" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") ,
  
  CONSTRAINT "user_id"
    FOREIGN KEY ("user_id" )
    REFERENCES "public"."user" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."phone" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "car"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."car" ;
CREATE SEQUENCE "public".car_id_seq;
ALTER SEQUENCE "public".car_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."car" (
  "id" INT NOT NULL DEFAULT nextval('car_id_seq') ,
  "model" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") );
ALTER TABLE "public"."car" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "repair"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."repair" ;
CREATE SEQUENCE "public".repair_id_seq;
ALTER SEQUENCE "public".repair_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."repair" (
  "id" INT NOT NULL DEFAULT nextval('repair_id_seq') ,
  "car_id" INT NOT NULL ,
  "date" DATE NOT NULL ,
  PRIMARY KEY ("id") ,
  CONSTRAINT "car_id"
    FOREIGN KEY ("car_id" )
    REFERENCES "public"."car" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."repair" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "driver"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."driver" ;
CREATE SEQUENCE "public".driver_id_seq;
ALTER SEQUENCE "public".driver_id_seq OWNER TO liolio;

CREATE  TABLE IF NOT EXISTS "public"."driver" (
  "id" INT NOT NULL DEFAULT nextval('driver_id_seq') ,
  "car_id" INT NOT NULL ,
  "name" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id") ,
  CONSTRAINT "car_id"
    FOREIGN KEY ("car_id" )
    REFERENCES "public"."car" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."driver" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_otm_single"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_otm_single" ;
CREATE SEQUENCE "public".controls_otm_single_id_seq;
ALTER SEQUENCE "public".controls_otm_single_id_seq OWNER TO liolio;

CREATE TABLE IF NOT EXISTS "public"."controls_otm_single" (
  "id" INT NOT NULL DEFAULT nextval('controls_otm_single_id_seq'),
  "name" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("id"));
ALTER TABLE "public"."controls_otm_single" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_otm_multiple"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_otm_multiple" ;
CREATE SEQUENCE "public".controls_otm_multiple_id_seq;
ALTER SEQUENCE "public".controls_otm_multiple_id_seq OWNER TO liolio;

CREATE TABLE IF NOT EXISTS "public"."controls_otm_multiple" (
  "id" INT NOT NULL DEFAULT nextval('controls_otm_multiple_id_seq'),
  "first" VARCHAR(45) NOT NULL,
  "last" VARCHAR(45) NULL,
  PRIMARY KEY ("id"));
ALTER TABLE "public"."controls_otm_multiple" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls" ;
CREATE SEQUENCE "public".controls_id_seq;
ALTER SEQUENCE "public".controls_id_seq OWNER TO liolio;

CREATE TABLE IF NOT EXISTS "public"."controls" (
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
    REFERENCES "public"."controls_otm_single" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_otm_multiple_id"
    FOREIGN KEY ("controls_otm_multiple_id")
    REFERENCES "public"."controls_otm_multiple" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."controls"  OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_mtm_single"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_mtm_single" ;
CREATE SEQUENCE "public".controls_mtm_single_id_seq;
ALTER SEQUENCE "public".controls_mtm_single_id_seq OWNER TO liolio;

CREATE TABLE IF NOT EXISTS "public"."controls_mtm_single" (
  "id" INT NOT NULL DEFAULT nextval('controls_mtm_single_id_seq'),
  "name" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("id"));
ALTER TABLE "public"."controls_mtm_single" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_mtm_multiple"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_mtm_multiple" ;
CREATE SEQUENCE "public".controls_mtm_multiple_id_seq;
ALTER SEQUENCE "public".controls_mtm_multiple_id_seq OWNER TO liolio;

CREATE TABLE IF NOT EXISTS "public"."controls_mtm_multiple" (
  "id" INT NOT NULL DEFAULT nextval('controls_mtm_multiple_id_seq'),
  "first" VARCHAR(45) NOT NULL,
  "last" VARCHAR(45) NULL,
  PRIMARY KEY ("id"));
ALTER TABLE "public"."controls_mtm_multiple"  OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_has_controls_mtm_single"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_has_controls_mtm_single" ;

CREATE TABLE IF NOT EXISTS "public"."controls_has_controls_mtm_single" (
  "controls_id" INT NOT NULL,
  "controls_mtm_single_id" INT NOT NULL,
  PRIMARY KEY ("controls_id", "controls_mtm_single_id"),
  CONSTRAINT "controls_id"
    FOREIGN KEY ("controls_id")
    REFERENCES "public"."controls" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_mtm_single_id"
    FOREIGN KEY ("controls_mtm_single_id")
    REFERENCES "public"."controls_mtm_single" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."controls_has_controls_mtm_single"  OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_has_controls_mtm_multiple"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_has_controls_mtm_multiple" ;

CREATE TABLE IF NOT EXISTS "public"."controls_has_controls_mtm_multiple" (
  "controls_id" INT NOT NULL,
  "controls_mtm_multiple_id" INT NOT NULL,
  PRIMARY KEY ("controls_id", "controls_mtm_multiple_id"),
  CONSTRAINT "controls_id"
    FOREIGN KEY ("controls_id")
    REFERENCES "public"."controls" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_mtm_multiple_id"
    FOREIGN KEY ("controls_mtm_multiple_id")
    REFERENCES "public"."controls_mtm_multiple" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."controls_has_controls_mtm_multiple" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_inline_otm_single"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_inline_otm_single" ;
CREATE SEQUENCE "public".controls_inline_otm_single_id_seq;
ALTER SEQUENCE "public".controls_inline_otm_single_id_seq OWNER TO liolio;

CREATE TABLE IF NOT EXISTS "public"."controls_inline_otm_single" (
  "id" INT NOT NULL DEFAULT nextval('controls_inline_otm_single_id_seq'),
  "name" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("id"));
ALTER TABLE "public"."controls_inline_otm_single" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_inline_otm_multiple"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_inline_otm_multiple" ;
CREATE SEQUENCE "public".controls_inline_otm_multiple_id_seq;
ALTER SEQUENCE "public".controls_inline_otm_multiple_id_seq OWNER TO liolio;

CREATE TABLE IF NOT EXISTS "public"."controls_inline_otm_multiple" (
  "id" INT NOT NULL DEFAULT nextval('controls_inline_otm_multiple_id_seq'),
  "first" VARCHAR(45) NOT NULL,
  "last" VARCHAR(45) NULL,
  PRIMARY KEY ("id"));
ALTER TABLE "public"."controls_inline_otm_multiple"  OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_inline"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_inline" ;
CREATE SEQUENCE "public".controls_inline_id_seq;
ALTER SEQUENCE "public".controls_inline_id_seq OWNER TO liolio;

CREATE TABLE IF NOT EXISTS "public"."controls_inline" (
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
    REFERENCES "public"."controls_inline_otm_single" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_inline_otm_multiple_id"
    FOREIGN KEY ("controls_inline_otm_multiple_id")
    REFERENCES "public"."controls_inline_otm_multiple" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_id"
    FOREIGN KEY ("controls_id")
    REFERENCES "public"."controls" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."controls_inline" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_inline_mtm_single"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_inline_mtm_single" ;
CREATE SEQUENCE "public".controls_inline_mtm_single_id_seq;
ALTER SEQUENCE "public".controls_inline_mtm_single_id_seq OWNER TO liolio;

CREATE TABLE IF NOT EXISTS "public"."controls_inline_mtm_single" (
  "id" INT NOT NULL DEFAULT nextval('controls_inline_mtm_single_id_seq'),
  "name" VARCHAR(45) NOT NULL,
  PRIMARY KEY ("id"));
ALTER TABLE "public"."controls_inline_mtm_single" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_inline_mtm_multiple"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_inline_mtm_multiple" ;
CREATE SEQUENCE "public".controls_inline_mtm_multiple_id_seq;
ALTER SEQUENCE "public".controls_inline_mtm_multiple_id_seq OWNER TO liolio;

CREATE TABLE IF NOT EXISTS "public"."controls_inline_mtm_multiple" (
  "id" INT NOT NULL DEFAULT nextval('controls_inline_mtm_multiple_id_seq'),
  "first" VARCHAR(45) NOT NULL,
  "last" VARCHAR(45) NULL,
  PRIMARY KEY ("id"));
ALTER TABLE "public"."controls_inline_mtm_multiple" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_inline_has_controls_inline_mtm_single"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_inline_has_controls_inline_mtm_single" ;

CREATE TABLE IF NOT EXISTS "public"."controls_inline_has_controls_inline_mtm_single" (
  "controls_inline_id" INT NOT NULL,
  "controls_inline_mtm_single_id" INT NOT NULL,
  PRIMARY KEY ("controls_inline_id", "controls_inline_mtm_single_id"),
  CONSTRAINT "controls_inline_id"
    FOREIGN KEY ("controls_inline_id")
    REFERENCES "public"."controls_inline" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_inline_mtm_single_id"
    FOREIGN KEY ("controls_inline_mtm_single_id")
    REFERENCES "public"."controls_inline_mtm_single" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."controls_inline_has_controls_inline_mtm_single" OWNER TO liolio;


-- -----------------------------------------------------
-- Table "controls_inline_has_controls_inline_mtm_multiple"
-- -----------------------------------------------------
--DROP TABLE IF EXISTS "public"."controls_inline_has_controls_inline_mtm_multiple" ;

CREATE TABLE IF NOT EXISTS "public"."controls_inline_has_controls_inline_mtm_multiple" (
  "controls_inline_id" INT NOT NULL,
  "controls_inline_mtm_multiple_id" INT NOT NULL,
  PRIMARY KEY ("controls_inline_id", "controls_inline_mtm_multiple_id"),
  CONSTRAINT "controls_inline_id"
    FOREIGN KEY ("controls_inline_id")
    REFERENCES "public"."controls_inline" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "controls_inline_mtm_multiple_id"
    FOREIGN KEY ("controls_inline_mtm_multiple_id")
    REFERENCES "public"."controls_inline_mtm_multiple" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE "public"."controls_inline_has_controls_inline_mtm_multiple" OWNER TO liolio;


ALTER TABLE "public"."purchase" DROP CONSTRAINT "item_id";
ALTER TABLE "public"."purchase" DROP CONSTRAINT "user_id";
ALTER TABLE "public"."recipe_has_recipe_types" DROP CONSTRAINT "recipe_id";
ALTER TABLE "public"."recipe_has_recipe_types" DROP CONSTRAINT "recipe_type_id";
ALTER TABLE "public"."recipe_has_recipe_methods" DROP CONSTRAINT "recipe_id";
ALTER TABLE "public"."recipe_has_recipe_methods" DROP CONSTRAINT "recipe_method_id";
ALTER TABLE "public"."address" DROP CONSTRAINT "user_id";
ALTER TABLE "public"."phone" DROP CONSTRAINT "user_id";
ALTER TABLE "public"."repair" DROP CONSTRAINT "car_id";
ALTER TABLE "public"."driver" DROP CONSTRAINT "car_id";

ALTER TABLE "public"."controls" DROP CONSTRAINT "controls_otm_single_id";
ALTER TABLE "public"."controls" DROP CONSTRAINT "controls_otm_multiple_id";

ALTER TABLE "public"."controls_has_controls_mtm_single" DROP CONSTRAINT "controls_id";
ALTER TABLE "public"."controls_has_controls_mtm_single" DROP CONSTRAINT "controls_mtm_single_id";
ALTER TABLE "public"."controls_has_controls_mtm_multiple" DROP CONSTRAINT "controls_id";
ALTER TABLE "public"."controls_has_controls_mtm_multiple" DROP CONSTRAINT "controls_mtm_multiple_id";

ALTER TABLE "public"."controls_inline" DROP CONSTRAINT "controls_inline_otm_single_id";
ALTER TABLE "public"."controls_inline" DROP CONSTRAINT "controls_inline_otm_multiple_id";
ALTER TABLE "public"."controls_inline" DROP CONSTRAINT "controls_id";

ALTER TABLE "public"."controls_inline_has_controls_inline_mtm_single" DROP CONSTRAINT "controls_inline_id";
ALTER TABLE "public"."controls_inline_has_controls_inline_mtm_single" DROP CONSTRAINT "controls_inline_mtm_single_id";
ALTER TABLE "public"."controls_inline_has_controls_inline_mtm_multiple" DROP CONSTRAINT "controls_inline_id";
ALTER TABLE "public"."controls_inline_has_controls_inline_mtm_multiple" DROP CONSTRAINT "controls_inline_mtm_multiple_id";
