-- MySQL Workbench Forward Engineering
USE carrental;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
DROP DATABASE IF EXISTS carrental;
CREATE DATABASE carrental;
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema carrental
-- -----------------------------------------------------
USE carrental;
-- -----------------------------------------------------
-- Table `booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` INT NOT NULL,
  `booking_start_date` DATE NOT NULL,
  `booking_end_date` DATE NOT NULL,
  `payment` VARCHAR(45) NOT NULL DEFAULT '(confirmed, hold)',
  `invoice_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`, `invoice_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `booking_id_idx1` ON `booking` (`booking_id` ASC) VISIBLE;

CREATE INDEX `invoic_id_idx` ON `booking` (`invoice_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `feedback`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `feedback_date` DATE NOT NULL,
  `comments` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`feedback_id`, `vehicle_id`, `customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `vehcile_id_idx` ON `feedback` (`vehicle_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservation` (
  `reservation_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `total` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL DEFAULT '(confirmed, hold)',
  PRIMARY KEY (`reservation_id`, `customer_id`, `vehicle_id`)
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` INT NOT NULL,
  `booking_id` INT NOT NULL,
  `invoice_id` INT NOT NULL,
  `reservation_id` INT NOT NULL,
  `feedback_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `fullname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(20) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `address` VARCHAR(25) NOT NULL,
  `dl` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`customer_id`, `booking_id`, `invoice_id`, `reservation_id`, `feedback_id`, `vehicle_id`),
  CONSTRAINT `booking_id`
    FOREIGN KEY (`booking_id`)
    REFERENCES `booking` (`booking_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `feedback_id`
    FOREIGN KEY (`feedback_id`)
    REFERENCES `feedback` (`feedback_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `reservation_id`
    FOREIGN KEY (`reservation_id`)
    REFERENCES `reservation` (`reservation_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `vehicle_id_idx` ON `customer` (`vehicle_id` ASC) VISIBLE;

CREATE INDEX `booking_id_idx` ON `customer` (`booking_id` ASC) VISIBLE;

CREATE INDEX `feedback_id_idx` ON `customer` (`feedback_id` ASC) VISIBLE;

CREATE INDEX `invoice_id_idx` ON `customer` (`invoice_id` ASC) VISIBLE;

CREATE INDEX `reservation_id_idx` ON `customer` (`reservation_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `inspections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inspections` (
  `inspections_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `inspection_date` DATE NOT NULL,
  `inspection_comment` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`inspections_id`, `vehicle_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `inspections_id_idx` ON `inspections` (`inspections_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `insurance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `insurance` (
  `insurance_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `insurance_name` VARCHAR(45) NOT NULL,
  `policy_num` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `exp_date` DATE NOT NULL,
  `user_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`insurance_id`, `vehicle_id`, `user_id`, `customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `vehicle_id_idx` ON `insurance` (`vehicle_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `inventories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inventories` (
  `inventories_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `make` VARCHAR(20) NOT NULL,
  `model` VARCHAR(20) NOT NULL,
  `year` VARCHAR(4) NOT NULL,
  `vin` VARCHAR(45) NOT NULL,
  `mileage` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`inventories_id`, `vehicle_id`, `user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `user_id_idx` ON `inventories` (`user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` INT NOT NULL,
  `vehcile_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `reservation_id` INT NOT NULL,
  `invoice_date` DATE NOT NULL,
  `total` INT NOT NULL,
  `paymentstatus` TINYTEXT NOT NULL,
  PRIMARY KEY (`invoice_id`, `customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `customer_id_idx` ON `invoice` (`customer_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `maintenance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `maintenance` (
  `maintenance_id` INT NOT NULL,
  `vehcile_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `maintenance_date` DATE NOT NULL,
  `description` TINYTEXT NOT NULL,
  `feedback_id` INT NOT NULL,
  `invoice_id` INT NOT NULL,
  PRIMARY KEY (`maintenance_id`, `vehcile_id`, `user_id`, `feedback_id`, `invoice_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `invoice_id_idx` ON `maintenance` (`invoice_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` INT NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `user_id_idx` ON `user` (`user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehicle` (
  `vehicle_id` INT NOT NULL,
  `make` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `mileage` INT NOT NULL,
  `vin` VARCHAR(45) NOT NULL,
  `year` VARCHAR(4) NOT NULL,
  `inspections_id` INT NOT NULL,
  `insurance_id` INT NOT NULL,
  `inventories_id` INT NOT NULL,
  `invoice_id` INT NOT NULL,
  `maintenance_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`vehicle_id`, `inspections_id`, `insurance_id`, `inventories_id`, `invoice_id`, `maintenance_id`, `user_id`),
  CONSTRAINT `inspection_id`
    FOREIGN KEY (`inspections_id`)
    REFERENCES `inspections` (`inspections_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `insurance_id`
    FOREIGN KEY (`insurance_id`)
    REFERENCES `insurance` (`insurance_id`),
  CONSTRAINT `inventories_id`
    FOREIGN KEY (`inventories_id`)
    REFERENCES `inventories` (`inventories_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `invoice_id`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `invoice` (`invoice_id`),
  CONSTRAINT `maintenance_id`
    FOREIGN KEY (`maintenance_id`)
    REFERENCES `maintenance` (`maintenance_id`),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `insurance_id_idx` ON `vehicle` (`insurance_id` ASC) VISIBLE;

CREATE INDEX `inventories_id_idx` ON `vehicle` (`inventories_id` ASC) VISIBLE;

CREATE INDEX `inspection_id_idx` ON `vehicle` (`inspections_id` ASC) VISIBLE;

CREATE INDEX `invoice_id_idx` ON `vehicle` (`invoice_id` ASC) VISIBLE;

CREATE INDEX `maintenance_id_idx` ON `vehicle` (`maintenance_id` ASC) VISIBLE;

CREATE INDEX `user_id_idx` ON `vehicle` (`user_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
