-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema CarRental_updates
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `CarRental_updates` ;

-- -----------------------------------------------------
-- Schema CarRental_updates
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CarRental_updates` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `CarRental_updates` ;

-- -----------------------------------------------------
-- Table `CarRental_updates`.`CusomterRental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarRental_updates`.`CusomterRental` ;

CREATE TABLE IF NOT EXISTS `CarRental_updates`.`CusomterRental` (
  `customer_id` INT NOT NULL,
  `fullname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `DL_num` VARCHAR(45) NOT NULL,
  `booking_id` INT NOT NULL,
  `reservation_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`, `booking_id`, `reservation_id`),
  INDEX `booking_id_idx` (`booking_id` ASC) VISIBLE,
  INDEX `reservation_id_idx` (`reservation_id` ASC) VISIBLE,
  CONSTRAINT `booking_id`
    FOREIGN KEY (`booking_id`)
    REFERENCES `CarRental_updates`.`BookingRental` (`booking_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `CarRental_updates`.`VehicleRental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarRental_updates`.`VehicleRental` ;

CREATE TABLE IF NOT EXISTS `CarRental_updates`.`VehicleRental` (
  `vehicle_id` INT NOT NULL,
  `make` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `mileage` INT NOT NULL,
  `vin(vehcileIdentityficationNum)` VARCHAR(45) NULL DEFAULT NULL,
  `registration_exp` DATE NULL DEFAULT NULL,
  `maintenance_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`vehicle_id`, `maintenance_id`, `user_id`),
  UNIQUE INDEX `vin(vehcileIdentityficationNum)_UNIQUE` (`vin(vehcileIdentityficationNum)` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `CarRental_updates`.`ReservationRental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarRental_updates`.`ReservationRental` ;

CREATE TABLE IF NOT EXISTS `CarRental_updates`.`ReservationRental` (
  `reservation_id` INT NOT NULL,
  `costomer_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `location` INT NOT NULL,
  `tatal` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL DEFAULT '(confirmed, hold)',
  PRIMARY KEY (`reservation_id`, `costomer_id`, `vehicle_id`, `location`),
  UNIQUE INDEX `reservation_id_UNIQUE` (`reservation_id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`costomer_id` ASC) VISIBLE,
  INDEX `vehcile_id_idx` (`vehicle_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`costomer_id`)
    REFERENCES `CarRental_updates`.`CusomterRental` (`customer_id`),
  CONSTRAINT `vehicle_id`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `CarRental_updates`.`VehicleRental` (`vehicle_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `CarRental_updates`.`BookingRental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarRental_updates`.`BookingRental` ;

CREATE TABLE IF NOT EXISTS `CarRental_updates`.`BookingRental` (
  `booking_id` INT NOT NULL,
  `reservation_id` INT NOT NULL,
  `booking_date` DATE NOT NULL,
  `payment_status` VARCHAR(45) NOT NULL DEFAULT '(confrimed, hold)',
  PRIMARY KEY (`booking_id`, `reservation_id`),
  INDEX `reservation_id_idx` (`reservation_id` ASC) VISIBLE,
  CONSTRAINT `reservation_id`
    FOREIGN KEY (`reservation_id`)
    REFERENCES `CarRental_updates`.`ReservationRental` (`reservation_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `CarRental_updates`.`UserRental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarRental_updates`.`UserRental` ;

CREATE TABLE IF NOT EXISTS `CarRental_updates`.`UserRental` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `passwords` VARCHAR(45) NOT NULL,
  `fullname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` INT NOT NULL,
  `maintenance_id` INT NOT NULL,
  `insurances_id` INT NOT NULL,
  `booking_id` INT NOT NULL,
  `reservation_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `maintenance_id`, `insurances_id`, `booking_id`, `reservation_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `user_id_idx` (`insurances_id` ASC) VISIBLE,
  INDEX `user_id_idx1` (`maintenance_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `CarRental_updates`.`InspectionRental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarRental_updates`.`InspectionRental` ;

CREATE TABLE IF NOT EXISTS `CarRental_updates`.`InspectionRental` (
  `inspection_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `inspection_date` DATE NOT NULL,
  PRIMARY KEY (`inspection_id`, `vehicle_id`, `user_id`),
  INDEX `vehcile_id_idx` (`vehicle_id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `CarRental_updates`.`UserRental` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `CarRental_updates`.`InsuraneRrental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarRental_updates`.`InsuraneRrental` ;

CREATE TABLE IF NOT EXISTS `CarRental_updates`.`InsuraneRrental` (
  `insurance_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `insurane_name` VARCHAR(45) NOT NULL,
  `policy_num` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `premium_amount` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`insurance_id`, `vehicle_id`, `user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`insurance_id` ASC, `user_id` ASC) VISIBLE,
  INDEX `insurance_id_idx` (`vehicle_id` ASC) VISIBLE,
  CONSTRAINT `insurance_id`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `CarRental_updates`.`VehicleRental` (`vehicle_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `CarRental_updates`.`InventoriesRental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarRental_updates`.`InventoriesRental` ;

CREATE TABLE IF NOT EXISTS `CarRental_updates`.`InventoriesRental` (
  `invent_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`invent_id`, `vehicle_id`, `user_id`),
  INDEX `vehcile_id_idx` (`vehicle_id` ASC) VISIBLE,
  CONSTRAINT `vehcile_id`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `CarRental_updates`.`VehicleRental` (`vehicle_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `CarRental_updates`.`MaintenanceRental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CarRental_updates`.`MaintenanceRental` ;

CREATE TABLE IF NOT EXISTS `CarRental_updates`.`MaintenanceRental` (
  `maintenance_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `maintenance_date` DATE NOT NULL,
  `description` TINYTEXT NOT NULL,
  PRIMARY KEY (`maintenance_id`, `user_id`, `vehicle_id`),
  INDEX `vehcile_id_idx` (`vehicle_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`vehicle_id` ASC) VISIBLE,
  CONSTRAINT `maintenance_id`
    FOREIGN KEY (`maintenance_id`)
    REFERENCES `CarRental_updates`.`VehicleRental` (`vehicle_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
