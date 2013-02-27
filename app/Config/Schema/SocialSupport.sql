SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `SocialSupport` ;
CREATE SCHEMA IF NOT EXISTS `SocialSupport` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `SocialSupport` ;

-- -----------------------------------------------------
-- Table `SocialSupport`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialSupport`.`company` ;

CREATE  TABLE IF NOT EXISTS `SocialSupport`.`company` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(150) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialSupport`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialSupport`.`user` ;

CREATE  TABLE IF NOT EXISTS `SocialSupport`.`user` (
  `id` VARCHAR(36) NOT NULL ,
  `login` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(80) NOT NULL ,
  `mail` VARCHAR(100) NOT NULL ,
  `status` INT(1) UNSIGNED NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialSupport`.`attendant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialSupport`.`attendant` ;

CREATE  TABLE IF NOT EXISTS `SocialSupport`.`attendant` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(20) NOT NULL ,
  `company_id` VARCHAR(36) NOT NULL ,
  `user_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`, `company_id`) ,
  INDEX `fk_attendant_company` (`company_id` ASC) ,
  INDEX `fk_attendant_user1` (`user_id` ASC) ,
  CONSTRAINT `fk_attendant_company`
    FOREIGN KEY (`company_id` )
    REFERENCES `SocialSupport`.`company` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_attendant_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `SocialSupport`.`user` (`id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialSupport`.`account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialSupport`.`account` ;

CREATE  TABLE IF NOT EXISTS `SocialSupport`.`account` (
  `id` VARCHAR(36) NOT NULL ,
  `type` INT(1) NOT NULL ,
  `profile` VARCHAR(50) NOT NULL ,
  `company_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`, `company_id`) ,
  INDEX `fk_account_company1` (`company_id` ASC) ,
  CONSTRAINT `fk_account_company1`
    FOREIGN KEY (`company_id` )
    REFERENCES `SocialSupport`.`company` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialSupport`.`keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialSupport`.`keyword` ;

CREATE  TABLE IF NOT EXISTS `SocialSupport`.`keyword` (
  `id` VARCHAR(36) NOT NULL ,
  `word` VARCHAR(50) NULL ,
  `account_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`, `account_id`) ,
  INDEX `fk_keyword_account1` (`account_id` ASC) ,
  CONSTRAINT `fk_keyword_account1`
    FOREIGN KEY (`account_id` )
    REFERENCES `SocialSupport`.`account` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialSupport`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialSupport`.`message` ;

CREATE  TABLE IF NOT EXISTS `SocialSupport`.`message` (
  `id` VARCHAR(36) NOT NULL ,
  `text` TEXT NOT NULL ,
  `datetime` DATETIME NOT NULL ,
  `customer_profile` VARCHAR(50) NULL ,
  `customer_name` VARCHAR(45) NULL ,
  `type` ENUM('Compliment', 'Suggestion', 'Doubt', 'Problem') NOT NULL ,
  `status` ENUM('New', 'Pendent', 'Solved') NOT NULL DEFAULT 'New' ,
  `account_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`, `account_id`) ,
  INDEX `fk_message_account1` (`account_id` ASC) ,
  CONSTRAINT `fk_message_account1`
    FOREIGN KEY (`account_id` )
    REFERENCES `SocialSupport`.`account` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialSupport`.`answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialSupport`.`answer` ;

CREATE  TABLE IF NOT EXISTS `SocialSupport`.`answer` (
  `id` VARCHAR(36) NOT NULL ,
  `text` TEXT NOT NULL ,
  `datetime` DATETIME NULL ,
  `direct` INT(1) NULL ,
  `message_id` VARCHAR(36) NOT NULL ,
  `answer_id` VARCHAR(36) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`, `message_id`, `answer_id`) ,
  INDEX `fk_answer_message1` (`message_id` ASC) ,
  INDEX `fk_answer_answer1` (`answer_id` ASC) ,
  CONSTRAINT `fk_answer_message1`
    FOREIGN KEY (`message_id` )
    REFERENCES `SocialSupport`.`message` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_answer_answer1`
    FOREIGN KEY (`answer_id` )
    REFERENCES `SocialSupport`.`answer` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
