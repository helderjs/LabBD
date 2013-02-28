SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `SocialCup` ;
CREATE SCHEMA IF NOT EXISTS `SocialCup` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `SocialCup` ;

-- -----------------------------------------------------
-- Table `country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `country` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `country` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `city` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(100) NOT NULL ,
  `country_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `user` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(100) NOT NULL ,
  `birthday` DATE NOT NULL ,
  `genre` SET('M', 'F') NOT NULL ,
  `username` VARCHAR(50) NOT NULL ,
  `password` VARCHAR(80) NOT NULL ,
  `score` INT(5) NULL DEFAULT NULL ,
  `city_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`, `city_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `interest` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `interest` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(150) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `stadium`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stadium` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `stadium` (
  `id` VARCHAR(36) NOT NULL ,
  `name` VARCHAR(100) NOT NULL ,
  `city_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`, `city_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `match`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `match` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `match` (
  `id` VARCHAR(36) NOT NULL ,
  `date` DATE NOT NULL ,
  `hour` TIME NOT NULL ,
  `stadium_id` VARCHAR(36) NOT NULL ,
  `country_a_id` VARCHAR(36) NOT NULL ,
  `country_b_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`id`, `stadium_id`, `country_a_id`, `country_b_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `ix_match` ON `match` (`date` ASC, `hour` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_has_match`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_match` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `user_has_match` (
  `user_id` VARCHAR(36) NOT NULL ,
  `match_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`user_id`, `match_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_has_interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_interest` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `user_has_interest` (
  `user_id` VARCHAR(36) NOT NULL ,
  `interest_id` VARCHAR(36) NOT NULL ,
  PRIMARY KEY (`user_id`, `interest_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_has_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_user` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `user_has_user` (
  `user_a_id` VARCHAR(36) NOT NULL ,
  `user_b_id` VARCHAR(36) NOT NULL ,
  `date_time` DATETIME NOT NULL ,
  PRIMARY KEY (`user_a_id`, `user_b_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Placeholder table for view `vw_self_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vw_self_user` (`id` INT, `name` INT, `birthday` INT, `genre` INT, `username` INT, `password` INT, `score` INT, `interest_id` INT, `interest_name` INT, `city_id` INT, `city_name` INT, `country_id` INT, `country_name` INT);
SHOW WARNINGS;

-- -----------------------------------------------------
-- Placeholder table for view `vw_other_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vw_other_user` (`id` INT, `username` INT, `genre` INT, `birthday` INT, `interest_id` INT, `interest_name` INT, `country_id` INT, `country_name` INT);
SHOW WARNINGS;

-- -----------------------------------------------------
-- Placeholder table for view `vw_user_score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vw_user_score` (`id` INT, `name` INT, `score` INT);
SHOW WARNINGS;

-- -----------------------------------------------------
-- Placeholder table for view `vw_meetings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vw_meetings` (`id` INT, `name` INT, `met_id` INT, `met_name` INT, `date_time` INT);
SHOW WARNINGS;

-- -----------------------------------------------------
-- Placeholder table for view `vw_matches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vw_matches` (`id` INT, `name` INT, `team_a` INT, `team_B` INT, `stadium_name` INT, `city_name` INT, `city_id` INT, `match_id` INT, `date` INT, `hour` INT);
SHOW WARNINGS;

-- -----------------------------------------------------
-- procedure routine1
-- -----------------------------------------------------

-- USE `SocialCup`;
-- DROP procedure IF EXISTS `routine1`;
-- SHOW WARNINGS;
-- USE `SocialCup`$$
-- CREATE PROCEDURE `routine1` ()
-- BEGIN

-- END$$
-- SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_user_interests`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_user_interests` ;
SHOW WARNINGS;
DROP TABLE IF EXISTS `vw_user_interests`;
SHOW WARNINGS;
USE `SocialCup`;
CREATE  OR REPLACE VIEW `vw_user_interests` AS
SELECT us.id, us.username, us.genre, us.birthday, it.id AS interest_id, it.name AS interest_name
	FROM user AS us
	LEFT JOIN user_has_interest AS ui ON (ui.user_id = us.id)
	LEFT JOIN interest AS it ON (ui.interest_id = it.id)
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_self_user`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_self_user` ;
SHOW WARNINGS;
DROP TABLE IF EXISTS `vw_self_user`;
SHOW WARNINGS;
USE `SocialCup`;
CREATE  OR REPLACE VIEW `vw_self_user` AS
	SELECT us.id AS id,
            us.name AS name,
            us.birthday AS birthday,
            us.genre AS genre,
            us.username AS username,
            us.password AS password,
            us.score AS score,
            it.id AS interest_id,
            it.name AS interest_name,
            ci.id AS city_id,
            ci.name AS city_name,
            co.id AS country_id,
            co.name AS country_name
	FROM user AS us
	INNER JOIN city AS ci ON (us.city_id = ci.id)
	INNER JOIN country AS co ON (ci.country_id = co.id)
	LEFT JOIN user_has_interest AS ui ON (ui.user_id = us.id)
	LEFT JOIN interest AS it ON (ui.interest_id = it.id)
	LEFT JOIN user_has_match AS um ON (um.user_id = us.id)
	LEFT JOIN `match` AS ma ON (um.match_id = ma.id)
	LEFT JOIN stadium AS st ON (ma.stadium_id = st.id)
	LEFT JOIN city AS cist ON (st.city_id = cist.id);
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_other_user`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_other_user` ;
SHOW WARNINGS;
DROP TABLE IF EXISTS `vw_other_user`;
SHOW WARNINGS;
USE `SocialCup`;
CREATE  OR REPLACE VIEW `vw_other_user` AS
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
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_user_score`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_user_score` ;
SHOW WARNINGS;
DROP TABLE IF EXISTS `vw_user_score`;
SHOW WARNINGS;
USE `SocialCup`;
CREATE  OR REPLACE VIEW `vw_user_score` AS
SELECT us.id, us.name, COUNT(uu.user_b_id) AS score
FROM user AS us LEFT JOIN user_has_user AS uu ON (us.id = uu.user_a_id)
GROUP BY us.id, us.name;
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_meetings`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_meetings` ;
SHOW WARNINGS;
DROP TABLE IF EXISTS `vw_meetings`;
SHOW WARNINGS;
USE `SocialCup`;
CREATE  OR REPLACE VIEW `vw_meetings` AS
SELECT us.id, us.name, ub.id AS met_id, ub.name AS met_name, uu.date_time
FROM user AS us
LEFT JOIN user_has_user AS uu ON (us.id = uu.user_a_id)
LEFT JOIN user AS ub ON (ub.id = uu.user_b_id);
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_matches`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_matches` ;
SHOW WARNINGS;
DROP TABLE IF EXISTS `vw_matches`;
SHOW WARNINGS;
USE `SocialCup`;
CREATE  OR REPLACE VIEW `vw_matches` AS
SELECT us.id,
	us.name,
	ca.name AS team_a,
	cb.name AS team_B,
	st.name AS stadium_name,
	ci.name AS city_name,
	ci.id AS city_id,
	ma.id AS match_id,
	ma.date,
	ma.hour
FROM user AS us
INNER JOIN user_has_match AS um ON (us.id = um.user_id)
INNER JOIN `match` AS ma ON (ma.id = um.match_id)
INNER JOIN stadium AS st ON (ma.stadium_id = st.id)
INNER JOIN city AS ci ON (ci.id = st.city_id)
INNER JOIN country AS ca ON (ca.id = ma.country_a_id)
INNER JOIN country AS cb ON (ca.id = ma.country_b_id);
SHOW WARNINGS;
USE `SocialCup`;

DELIMITER $$

USE `SocialCup`$$
DROP TRIGGER IF EXISTS `tg_increment_user_score` $$
SHOW WARNINGS$$
USE `SocialCup`$$
CREATE TRIGGER tg_increment_user_score AFTER INSERT ON `user_has_user`
	FOR EACH ROW
	BEGIN
		UPDATE user
			SET score = (score + 1)
		WHERE `user`.id = NEW.user_a_id OR `user`.id = NEW.user_b_id;
	END;$$

SHOW WARNINGS$$

USE `SocialCup`$$
DROP TRIGGER IF EXISTS `tg_check_user_hasnt_itself` $$
SHOW WARNINGS$$
USE `SocialCup`$$
CREATE TRIGGER tg_check_user_hasnt_itself BEFORE INSERT ON `user_has_user`

	FOR EACH ROW
	BEGIN
		IF NEW.user_a_id = NEW.user_b_id THEN
			SET NEW ='YOU CANNOT MEET YOURSELF';
		END IF;
	END;$$

SHOW WARNINGS$$

DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

