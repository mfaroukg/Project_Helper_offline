-- MySQL Script generated by MySQL Workbench
-- Fri 03 Jan 2020 03:59:49 PM +03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema design_DB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `design_DB` ;

-- -----------------------------------------------------
-- Schema design_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `design_DB` DEFAULT CHARACTER SET utf8mb4 ;
USE `design_DB` ;

-- -----------------------------------------------------
-- Table `design_DB`.`payitems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `design_DB`.`payitems` ;

CREATE TABLE IF NOT EXISTS `design_DB`.`payitems` (
  `Item_code` VARCHAR(20) NOT NULL,
  `payitem description` TEXT NOT NULL,
  PRIMARY KEY (`Item_code`))
ENGINE = InnoDB
AUTO_INCREMENT = 56
DEFAULT CHARACTER SET = latin1
COMMENT = 'that is my work ';


-- -----------------------------------------------------
-- Table `design_DB`.`subcon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `design_DB`.`subcon` ;

CREATE TABLE IF NOT EXISTS `design_DB`.`subcon` (
  `name` VARCHAR(45) NOT NULL,
  `working domain` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Zain2';


-- -----------------------------------------------------
-- Table `design_DB`.`scope`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `design_DB`.`scope` ;

CREATE TABLE IF NOT EXISTS `design_DB`.`scope` (
  `Solution` VARCHAR(45) NOT NULL,
  `solution details` TEXT(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Solution`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = '\\\\\\\\n';


-- -----------------------------------------------------
-- Table `design_DB`.`main`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `design_DB`.`main` ;

CREATE TABLE IF NOT EXISTS `design_DB`.`main` (
  `DUid` VARCHAR(45) NOT NULL,
  `site_id` VARCHAR(45) NULL DEFAULT NULL,
  `Schedule_plan` DATE NOT NULL,
  `subcon_name` VARCHAR(45) NOT NULL,
  `scope_Solution` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DUid`),
  CONSTRAINT `fk_main_subcon1`
    FOREIGN KEY (`subcon_name`)
    REFERENCES `design_DB`.`subcon` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_main_scope1`
    FOREIGN KEY (`scope_Solution`)
    REFERENCES `design_DB`.`scope` (`Solution`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = '\\\\\\\\n';

CREATE UNIQUE INDEX `DUid_UNIQUE` ON `design_DB`.`main` (`DUid` ASC);


-- -----------------------------------------------------
-- Table `design_DB`.`workbench`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `design_DB`.`workbench` ;

CREATE TABLE IF NOT EXISTS `design_DB`.`workbench` (
  `BillNo.` VARCHAR(45) NULL DEFAULT NULL,
  `RNType` VARCHAR(150) NULL DEFAULT NULL,
  `WarningFlag` VARCHAR(150) NULL DEFAULT NULL,
  `Action` VARCHAR(150) NULL DEFAULT NULL,
  `LastOverdueCheckDate` VARCHAR(150) NULL DEFAULT NULL,
  `ProjectCode` VARCHAR(150) NULL DEFAULT NULL,
  `ProjectName` VARCHAR(150) NULL DEFAULT NULL,
  `SubProject` VARCHAR(150) NULL DEFAULT NULL,
  `Province` TEXT(300) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `Office` VARCHAR(150) NULL DEFAULT NULL,
  `ContractNo.` VARCHAR(150) NULL DEFAULT NULL,
  `Subcon` VARCHAR(150) NULL DEFAULT NULL,
  `main_DUid` VARCHAR(45) NOT NULL DEFAULT 'none',
  `DUName` VARCHAR(150) NULL DEFAULT NULL,
  `CustomerSiteID` VARCHAR(150) NULL DEFAULT NULL,
  `SubconWH` VARCHAR(150) NULL DEFAULT NULL,
  `Warehouse` VARCHAR(150) NULL DEFAULT NULL,
  `MOSDATE` VARCHAR(150) NULL DEFAULT NULL,
  `RAD` VARCHAR(150) NULL DEFAULT NULL,
  `ASD` VARCHAR(150) NULL DEFAULT NULL,
  `X-DWHINBOUND` VARCHAR(150) NULL DEFAULT NULL,
  `X-DWHOUTBOUND` VARCHAR(150) NULL DEFAULT NULL,
  `FIRSTSUBCONWHSIGNDATE` VARCHAR(150) NULL DEFAULT NULL,
  `ATA` VARCHAR(150) NULL DEFAULT NULL,
  `FirstSiteSignDate` VARCHAR(150) NULL DEFAULT NULL,
  `DeliveryPurpose` VARCHAR(150) NULL DEFAULT NULL,
  `PickupPerson` VARCHAR(150) NULL DEFAULT NULL,
  `DeliveryAddress` VARCHAR(150) NULL DEFAULT NULL,
  `CustomerPO` VARCHAR(150) NULL DEFAULT NULL,
  `SLA/WarningDay` VARCHAR(150) NULL DEFAULT NULL,
  `OverdueSLA/OverdueDay` VARCHAR(150) NULL DEFAULT NULL,
  `LockSLA/LockDay` VARCHAR(150) NULL DEFAULT NULL,
  `LockScope` VARCHAR(150) NULL DEFAULT NULL,
  `ActualPeriod` VARCHAR(150) NULL DEFAULT NULL,
  `LT-Actual` VARCHAR(150) NULL DEFAULT NULL,
  `Entity` VARCHAR(150) NULL DEFAULT NULL,
  `InvoiceNo.` VARCHAR(150) NULL DEFAULT NULL,
  `IfCreateRN/SDN` VARCHAR(150) NULL DEFAULT NULL,
  `RN/SDNNo.` VARCHAR(150) NULL DEFAULT NULL,
  `IfReserveRN/SDN` VARCHAR(150) NULL DEFAULT NULL,
  CONSTRAINT `fk_workbench_main1`
    FOREIGN KEY (`main_DUid`)
    REFERENCES `design_DB`.`main` (`DUid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `design_DB`.`payitems_and_subcon_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `design_DB`.`payitems_and_subcon_relation` ;

CREATE TABLE IF NOT EXISTS `design_DB`.`payitems_and_subcon_relation` (
  `scope_Solution` VARCHAR(45) NOT NULL,
  `subcon_name` VARCHAR(45) NOT NULL,
  `payitems_Item_code` VARCHAR(20) NOT NULL,
  `Qty` FLOAT NULL DEFAULT NULL,
  `Pay item Price` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`scope_Solution`, `subcon_name`, `payitems_Item_code`),
  CONSTRAINT `fk_payitems_has_subcon_payitems1`
    FOREIGN KEY (`payitems_Item_code`)
    REFERENCES `design_DB`.`payitems` (`Item_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payitems_has_subcon_subcon1`
    FOREIGN KEY (`subcon_name`)
    REFERENCES `design_DB`.`subcon` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payitems_and_subcon_relation_scope1`
    FOREIGN KEY (`scope_Solution`)
    REFERENCES `design_DB`.`scope` (`Solution`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `design_DB`.`scope_has_subcon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `design_DB`.`scope_has_subcon` ;

CREATE TABLE IF NOT EXISTS `design_DB`.`scope_has_subcon` (
  `scope_Solution` VARCHAR(45) NOT NULL,
  `subcon_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`scope_Solution`, `subcon_name`),
  CONSTRAINT `fk_scope_has_subcon_scope1`
    FOREIGN KEY (`scope_Solution`)
    REFERENCES `design_DB`.`scope` (`Solution`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_scope_has_subcon_subcon1`
    FOREIGN KEY (`subcon_name`)
    REFERENCES `design_DB`.`subcon` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `design_DB`.`DN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `design_DB`.`DN` ;

CREATE TABLE IF NOT EXISTS `design_DB`.`DN` (
  `ProjectName` VARCHAR(150) NULL DEFAULT NULL,
  `main_DUid` VARCHAR(45) NOT NULL,
  `SiteName` VARCHAR(150) NULL DEFAULT NULL,
  `DNNo.` VARCHAR(150) NULL DEFAULT NULL,
  `MRNo.` VARCHAR(150) NULL DEFAULT NULL,
  `C/LNo.` VARCHAR(150) NULL DEFAULT NULL,
  `BOXNo.` VARCHAR(150) NULL DEFAULT NULL,
  `OpenFlag` VARCHAR(150) NULL DEFAULT NULL,
  `Item` VARCHAR(150) NULL DEFAULT NULL,
  `Req.Qty` VARCHAR(150) NULL DEFAULT NULL,
  `ShippedQty.` VARCHAR(150) NULL DEFAULT NULL,
  `Unit` VARCHAR(150) NULL DEFAULT NULL,
  `ItemDescription` TEXT(300) NULL DEFAULT NULL,
  `PropertyType` VARCHAR(150) NULL DEFAULT NULL,
  `ActualProperty` VARCHAR(150) NULL DEFAULT NULL,
  `SiteType` VARCHAR(150) NULL DEFAULT NULL,
  `SiteDesc` TEXT(300) NULL DEFAULT NULL,
  `ActualShipmentDate` VARCHAR(150) NULL DEFAULT NULL,
  `Subcon.WHinbounddate` VARCHAR(150) NULL DEFAULT NULL,
  `Receiver` VARCHAR(150) NULL DEFAULT NULL,
  `TotalWholeCases` VARCHAR(150) NULL DEFAULT NULL,
  `TotalPartialCases` VARCHAR(150) NULL DEFAULT NULL,
  `DeliveryPurpose` VARCHAR(150) NULL DEFAULT NULL,
  `DeliveryAddress` VARCHAR(150) NULL DEFAULT NULL,
  `SiteAddress` TEXT(300) NULL DEFAULT NULL,
  `Subcon` VARCHAR(150) NULL DEFAULT NULL,
  `Applicant` VARCHAR(150) NULL DEFAULT NULL,
  `GW(KG)` VARCHAR(150) NULL DEFAULT NULL,
  `MEASUREMENT(CBM)` VARCHAR(150) NULL DEFAULT NULL,
  `BoxName` VARCHAR(150) NULL DEFAULT NULL,
  `SPU` VARCHAR(150) NULL DEFAULT NULL,
  `PickUpPerson` VARCHAR(150) NULL DEFAULT NULL,
  `RegionalSubconWH` VARCHAR(150) NULL DEFAULT NULL,
  `Description` TEXT(300) NULL DEFAULT NULL,
  `BG` VARCHAR(150) NULL DEFAULT NULL,
  `ContractNo.` VARCHAR(150) NULL DEFAULT NULL,
  `Status` VARCHAR(150) NULL DEFAULT NULL,
  `RequestShipmentDate` VARCHAR(150) NULL DEFAULT NULL,
  `MOS` VARCHAR(150) NULL DEFAULT NULL,
  `LSP locator` VARCHAR(45) NULL DEFAULT NULL,
  CONSTRAINT `fk_DN_main`
    FOREIGN KEY (`main_DUid`)
    REFERENCES `design_DB`.`main` (`DUid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
