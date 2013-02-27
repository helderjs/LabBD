SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `SocialCup` ;
CREATE SCHEMA IF NOT EXISTS `SocialCup` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `SocialCup` ;

-- -----------------------------------------------------
-- Table `SocialCup`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialCup`.`country` ;

CREATE  TABLE IF NOT EXISTS `SocialCup`.`country` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialCup`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialCup`.`city` ;

CREATE  TABLE IF NOT EXISTS `SocialCup`.`city` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(100) NOT NULL ,
  `country_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`, `country_id`) ,
  INDEX `fk_city_country1` (`country_id` ASC) ,
  CONSTRAINT `fk_city_country1`
    FOREIGN KEY (`country_id` )
    REFERENCES `SocialCup`.`country` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialCup`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialCup`.`user` ;

CREATE  TABLE IF NOT EXISTS `SocialCup`.`user` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(100) NOT NULL ,
  `birthday` DATE NOT NULL ,
  `genre` SET('M', 'F') NOT NULL ,
  `username` VARCHAR(50) NOT NULL ,
  `password` VARCHAR(80) NOT NULL ,
  `score` INT(5) NULL ,
  `city_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`, `city_id`) ,
  INDEX `fk_user_city1` (`city_id` ASC) ,
  CONSTRAINT `fk_user_city1`
    FOREIGN KEY (`city_id` )
    REFERENCES `SocialCup`.`city` (`id` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialCup`.`interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialCup`.`interest` ;

CREATE  TABLE IF NOT EXISTS `SocialCup`.`interest` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(150) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialCup`.`stadium`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialCup`.`stadium` ;

CREATE  TABLE IF NOT EXISTS `SocialCup`.`stadium` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(100) NOT NULL ,
  `city_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`, `city_id`) ,
  INDEX `fk_stadium_city1` (`city_id` ASC) ,
  CONSTRAINT `fk_stadium_city1`
    FOREIGN KEY (`city_id` )
    REFERENCES `SocialCup`.`city` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialCup`.`match`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialCup`.`match` ;

CREATE  TABLE IF NOT EXISTS `SocialCup`.`match` (
  `id` VARCHAR(36) NOT NULL ,
  `date` DATE NOT NULL ,
  `hour` TIME NOT NULL ,
  `stadium_id` VARCHAR(36) NOT NULL ,
  `country_a_id` VARCHAR(36) NOT NULL ,
  `country_b_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`, `stadium_id`, `country_a_id`, `country_b_id`) ,
  UNIQUE INDEX `ix_match` (`date` ASC, `hour` ASC) ,
  INDEX `fk_match_stadium1` (`stadium_id` ASC) ,
  INDEX `fk_match_country1` (`country_a_id` ASC) ,
  INDEX `fk_match_country2` (`country_b_id` ASC) ,
  CONSTRAINT `fk_match_stadium1`
    FOREIGN KEY (`stadium_id` )
    REFERENCES `SocialCup`.`stadium` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_match_country1`
    FOREIGN KEY (`country_a_id` )
    REFERENCES `SocialCup`.`country` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_match_country2`
    FOREIGN KEY (`country_b_id` )
    REFERENCES `SocialCup`.`country` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialCup`.`user_has_match`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialCup`.`user_has_match` ;

CREATE  TABLE IF NOT EXISTS `SocialCup`.`user_has_match` (
  `user_id` VARCHAR(36) NOT NULL ,
  `match_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`user_id`, `match_id`) ,
  INDEX `fk_user_has_match_match1` (`match_id` ASC) ,
  CONSTRAINT `fk_user_has_match_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `SocialCup`.`user` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_match_match1`
    FOREIGN KEY (`match_id` )
    REFERENCES `SocialCup`.`match` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialCup`.`user_has_interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialCup`.`user_has_interest` ;

CREATE  TABLE IF NOT EXISTS `SocialCup`.`user_has_interest` (
  `user_id` VARCHAR(36) NOT NULL ,
  `interest_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`user_id`, `interest_id`) ,
  INDEX `fk_user_has_interests_interests1` (`interest_id` ASC) ,
  CONSTRAINT `fk_user_has_interests_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `SocialCup`.`user` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_interests_interests1`
    FOREIGN KEY (`interest_id` )
    REFERENCES `SocialCup`.`interest` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SocialCup`.`user_has_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SocialCup`.`user_has_user` ;

CREATE  TABLE IF NOT EXISTS `SocialCup`.`user_has_user` (
  `user_a_id` VARCHAR(36) NOT NULL ,
  `user_b_id` VARCHAR(36) NOT NULL ,
  `date_time` DATETIME NOT NULL ,
  PRIMARY KEY (`user_a_id`, `user_b_id`) ,
  INDEX `fk_user_has_user_user2` (`user_b_id` ASC) ,
  CONSTRAINT `fk_user_has_user_user1`
    FOREIGN KEY (`user_a_id` )
    REFERENCES `SocialCup`.`user` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_user_user2`
    FOREIGN KEY (`user_b_id` )
    REFERENCES `SocialCup`.`user` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Placeholder table for view `SocialCup`.`vw_self_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SocialCup`.`vw_self_user` (`id` INT, `name` INT, `birthday` INT, `genre` INT, `username` INT, `password` INT, `score` INT, `city_id` INT, `interest_id` INT, `interest_name` INT, `city_id` INT, `city_name` INT, `country_id` INT, `country_name` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SocialCup`.`vw_other_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SocialCup`.`vw_other_user` (`id` INT, `username` INT, `genre` INT, `birthday` INT, `interest_id` INT, `interest_name` INT, `country_id` INT, `country_name` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SocialCup`.`vw_user_score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SocialCup`.`vw_user_score` (`id` INT, `name` INT, `score` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SocialCup`.`vw_meetings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SocialCup`.`vw_meetings` (`id` INT, `name` INT, `met_id` INT, `met_name` INT, `date_time` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SocialCup`.`vw_matches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SocialCup`.`vw_matches` (`id` INT);

-- -----------------------------------------------------
-- procedure routine1
-- -----------------------------------------------------

USE `SocialCup`;
DROP procedure IF EXISTS `SocialCup`.`routine1`;

DELIMITER $$
USE `SocialCup`$$
CREATE PROCEDURE `SocialCup`.`routine1` ()
BEGIN

END$$

DELIMITER ;
-- -----------------------------------------------------
-- View `SocialCup`.`vw_self_user`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `SocialCup`.`vw_self_user` ;
DROP TABLE IF EXISTS `SocialCup`.`vw_self_user`;
USE `SocialCup`;
CREATE  OR REPLACE VIEW `SocialCup`.`vw_self_user` AS
	SELECT us.*, it.id AS interest_id, it.name AS interest_name, ci.id AS city_id, ci.name AS city_name, co.id AS country_id, co.name AS country_name
	FROM user AS us 
	INNER JOIN city AS ci ON (us.city_id = ci.id)
	INNER JOIN country AS co ON (ci.country_id = co.id)
	LEFT JOIN user_has_interest AS ui ON (ui.user_id = us.id)
	LEFT JOIN interest AS it ON (ui.interest_id = it.id)
	LEFT JOIN user_has_match AS um ON (um.user_id = us.id)
	LEFT JOIN `match` AS ma ON (um.match_id = ma.id)
	LEFT JOIN stadium AS st ON (ma.stadium_id = st.id)
	LEFT JOIN city AS cist ON (st.city_id = cist.id)
;

-- -----------------------------------------------------
-- View `SocialCup`.`vw_other_user`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `SocialCup`.`vw_other_user` ;
DROP TABLE IF EXISTS `SocialCup`.`vw_other_user`;
USE `SocialCup`;
CREATE  OR REPLACE VIEW `SocialCup`.`vw_other_user` AS
SELECT us.id, us.username, us.genre, us.birthday, it.id AS interest_id, it.name AS interest_name, co.id AS country_id, co.name AS country_name
	FROM user AS us 
	INNER JOIN city AS ci ON (us.city_id = ci.id)
	INNER JOIN country AS co ON (ci.country_id = co.id)
	LEFT JOIN user_has_interest AS ui ON (ui.user_id = us.id)
	LEFT JOIN interest AS it ON (ui.interest_id = it.id)
	LEFT JOIN user_has_match AS um ON (um.user_id = us.id)
	LEFT JOIN `match` AS ma ON (um.match_id = ma.id)
	LEFT JOIN stadium AS st ON (ma.stadium_id = st.id)
	LEFT JOIN city AS cist ON (st.city_id = cist.id);

-- -----------------------------------------------------
-- View `SocialCup`.`vw_user_score`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `SocialCup`.`vw_user_score` ;
DROP TABLE IF EXISTS `SocialCup`.`vw_user_score`;
USE `SocialCup`;
CREATE  OR REPLACE VIEW `SocialCup`.`vw_user_score` AS
SELECT us.id, us.name, COUNT(uu.user_b_id) AS score
FROM user AS us LEFT JOIN user_has_user AS uu ON (us.id = uu.user_a_id)
GROUP BY us.id, us.name;

-- -----------------------------------------------------
-- View `SocialCup`.`vw_meetings`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `SocialCup`.`vw_meetings` ;
DROP TABLE IF EXISTS `SocialCup`.`vw_meetings`;
USE `SocialCup`;
CREATE  OR REPLACE VIEW `SocialCup`.`vw_meetings` AS
SELECT us.id, us.name, ub.id AS met_id, ub.name AS met_name, uu.date_time
FROM user AS us 
LEFT JOIN user_has_user AS uu ON (us.id = uu.user_a_id)
LEFT JOIN user AS ub ON (ub.id = uu.user_b_id)
;

-- -----------------------------------------------------
-- View `SocialCup`.`vw_matches`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `SocialCup`.`vw_matches` ;
DROP TABLE IF EXISTS `SocialCup`.`vw_matches`;
USE `SocialCup`;
CREATE  OR REPLACE VIEW `SocialCup`.`vw_matches` AS
SELECT us.id, 
	us.name, 
	ca.name AS team_a, 
	cb.name AS team_B, 
	st.name AS stadium_name
	ci.name AS city_name
	ci.id AS city_id
	ma.id AS match_id
	ma.date,
	ma.hour
FROM user AS us 
INNER JOIN user_has_match AS um ON (us.id = um.user_id)
INNER JOIN `match` AS ma ON (ma.id = um.match_id)
INNER JOIN stadium AS st ON (ma.stadium_id ON st.id)
INNER JOIN ;
USE `SocialCup`;

DELIMITER $$

USE `SocialCup`$$
DROP TRIGGER IF EXISTS `SocialCup`.`tg_increment_user_score` $$
USE `SocialCup`$$


CREATE TRIGGER tg_increment_user_score AFTER INSERT ON `user_has_user`
	FOR EACH ROW
	BEGIN
		UPDATE user 
			SET score = (score + 1)
		WHERE `user`.id = NEW.user_a_id OR `user`.id = NEW.user_b_id;
	END;
$$


USE `SocialCup`$$
DROP TRIGGER IF EXISTS `SocialCup`.`SYNTAX_ERROR_1` $$
USE `SocialCup`$$



CREATE TRIGGER tg_check_user_hasnt_itself BEFORE INSERT ON `user_has_user`
	FOR EACH ROW
	BEGIN
		IF NEW.user_a_id = NEW.user_b_id
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "YOU CANNOT MEET YOURSELF";
	END;
$$


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
