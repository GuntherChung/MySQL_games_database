-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema switch_games
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema switch_games
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `switch_games` DEFAULT CHARACTER SET utf8mb3 ;
USE `switch_games` ;

-- -----------------------------------------------------
-- Table `switch_games`.`esrb_model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`esrb_model` (
  `esrb_rating` VARCHAR(10) NOT NULL,
  `esrb_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`esrb_rating`),
  UNIQUE INDEX `esrb_rating_UNIQUE` (`esrb_rating` ASC) VISIBLE,
  UNIQUE INDEX `esrb_description_UNIQUE` (`esrb_description` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `switch_games`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`games` (
  `game_id` INT NOT NULL AUTO_INCREMENT,
  `game_name` VARCHAR(100) NOT NULL,
  `date_released` DATE NOT NULL,
  `developer` VARCHAR(45) NOT NULL,
  `publisher` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE INDEX `game_id_UNIQUE` (`game_id` ASC) VISIBLE,
  UNIQUE INDEX `game_name_UNIQUE` (`game_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 84
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `switch_games`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`genre` (
  `genre_id` INT NOT NULL AUTO_INCREMENT,
  `genre_name` VARCHAR(45) NOT NULL,
  `genre_description` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE INDEX `genre_id_UNIQUE` (`genre_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `switch_games`.`modes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`modes` (
  `modes_id` INT NOT NULL AUTO_INCREMENT,
  `mode_type` VARCHAR(45) NOT NULL,
  `mode_description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`modes_id`),
  UNIQUE INDEX `modes_id_UNIQUE` (`modes_id` ASC) VISIBLE,
  UNIQUE INDEX `mode_type_UNIQUE` (`mode_type` ASC) VISIBLE,
  UNIQUE INDEX `mode_description_UNIQUE` (`mode_description` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `switch_games`.`series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`series` (
  `series_id` INT NOT NULL AUTO_INCREMENT,
  `series_name` VARCHAR(45) NOT NULL,
  `series_description` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`series_id`),
  UNIQUE INDEX `publisher_id_UNIQUE` (`series_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `switch_games`.`game_classifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`game_classifications` (
  `game_id` INT NOT NULL AUTO_INCREMENT,
  `modes_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  `series_id` INT NOT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE INDEX `game_id_UNIQUE` (`game_id` ASC) VISIBLE,
  INDEX `fk_Game Classifications_Genre1_idx` (`genre_id` ASC) VISIBLE,
  INDEX `fk_Game Classifications_Series1_idx` (`series_id` ASC) VISIBLE,
  INDEX `fk_Game Classifications_Games1_idx` (`game_id` ASC) VISIBLE,
  INDEX `fk_Game Classifications_Modes1_idx` (`modes_id` ASC) VISIBLE,
  CONSTRAINT `fk_Game Classifications_Games1`
    FOREIGN KEY (`game_id`)
    REFERENCES `switch_games`.`games` (`game_id`),
  CONSTRAINT `fk_Game Classifications_Genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `switch_games`.`genre` (`genre_id`),
  CONSTRAINT `fk_Game Classifications_Modes1`
    FOREIGN KEY (`modes_id`)
    REFERENCES `switch_games`.`modes` (`modes_id`),
  CONSTRAINT `fk_Game Classifications_Series1`
    FOREIGN KEY (`series_id`)
    REFERENCES `switch_games`.`series` (`series_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 84
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `switch_games`.`ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`ratings` (
  `game_id` INT NOT NULL AUTO_INCREMENT,
  `metacritic_score` INT NULL DEFAULT NULL,
  `user_score` FLOAT NULL DEFAULT NULL,
  `esrb_rating` VARCHAR(10) NULL DEFAULT NULL,
  UNIQUE INDEX `game_id_UNIQUE` (`game_id` ASC) VISIBLE,
  INDEX `fk_Scores_Games1_idx` (`game_id` ASC) VISIBLE,
  INDEX `fk_Scores_ESRB Model1_idx` (`esrb_rating` ASC) VISIBLE,
  CONSTRAINT `fk_Scores_ESRB Model1`
    FOREIGN KEY (`esrb_rating`)
    REFERENCES `switch_games`.`esrb_model` (`esrb_rating`),
  CONSTRAINT `fk_Scores_Games1`
    FOREIGN KEY (`game_id`)
    REFERENCES `switch_games`.`games` (`game_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 84
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `switch_games`.`units_sold`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`units_sold` (
  `game_id` INT NOT NULL AUTO_INCREMENT,
  `units_sold` INT NULL DEFAULT NULL,
  UNIQUE INDEX `game_id_UNIQUE` (`game_id` ASC) VISIBLE,
  INDEX `fk_Units Sold_Games1_idx` (`game_id` ASC) VISIBLE,
  CONSTRAINT `fk_Units Sold_Games1`
    FOREIGN KEY (`game_id`)
    REFERENCES `switch_games`.`games` (`game_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 84
DEFAULT CHARACTER SET = utf8mb3;

USE `switch_games` ;

-- -----------------------------------------------------
-- Placeholder table for view `switch_games`.`counted_series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`counted_series` (`series_name` INT, `total_games` INT);

-- -----------------------------------------------------
-- Placeholder table for view `switch_games`.`games_developed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`games_developed` (`games_developed` INT, `developer` INT);

-- -----------------------------------------------------
-- Placeholder table for view `switch_games`.`general_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`general_info` (`game_name` INT, `developer` INT, `genre_name` INT, `mode_type` INT);

-- -----------------------------------------------------
-- Placeholder table for view `switch_games`.`rated_t_scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`rated_t_scores` (`game_id` INT, `game_name` INT, `esrb_rating` INT, `metacritic_score` INT, `user_score` INT);

-- -----------------------------------------------------
-- Placeholder table for view `switch_games`.`sold_by_ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`sold_by_ratings` (`game_name` INT, `units_sold` INT, `metacritic_score` INT);

-- -----------------------------------------------------
-- Placeholder table for view `switch_games`.`sorted_metacritic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`sorted_metacritic` (`game_name` INT, `metacritic_score` INT);

-- -----------------------------------------------------
-- Placeholder table for view `switch_games`.`sp_games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `switch_games`.`sp_games` (`game_id` INT, `game_name` INT, `date_released` INT, `mode_type` INT);

-- -----------------------------------------------------
-- View `switch_games`.`counted_series`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `switch_games`.`counted_series`;
USE `switch_games`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `switch_games`.`counted_series` AS select `switch_games`.`series`.`series_name` AS `series_name`,count(`switch_games`.`game_classifications`.`series_id`) AS `total_games` from (`switch_games`.`game_classifications` join `switch_games`.`series` on((`switch_games`.`game_classifications`.`series_id` = `switch_games`.`series`.`series_id`))) group by `switch_games`.`game_classifications`.`series_id` order by `total_games` desc;

-- -----------------------------------------------------
-- View `switch_games`.`games_developed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `switch_games`.`games_developed`;
USE `switch_games`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `switch_games`.`games_developed` AS select count(`switch_games`.`games`.`game_id`) AS `games_developed`,`switch_games`.`games`.`developer` AS `developer` from `switch_games`.`games` group by `switch_games`.`games`.`developer` order by `games_developed` desc;

-- -----------------------------------------------------
-- View `switch_games`.`general_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `switch_games`.`general_info`;
USE `switch_games`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `switch_games`.`general_info` AS select `switch_games`.`games`.`game_name` AS `game_name`,`switch_games`.`games`.`developer` AS `developer`,`switch_games`.`genre`.`genre_name` AS `genre_name`,`switch_games`.`modes`.`mode_type` AS `mode_type` from (((`switch_games`.`games` join `switch_games`.`game_classifications` on((`switch_games`.`games`.`game_id` = `switch_games`.`game_classifications`.`game_id`))) join `switch_games`.`genre` on((`switch_games`.`game_classifications`.`genre_id` = `switch_games`.`genre`.`genre_id`))) join `switch_games`.`modes` on((`switch_games`.`game_classifications`.`modes_id` = `switch_games`.`modes`.`modes_id`))) order by `switch_games`.`games`.`game_id`;

-- -----------------------------------------------------
-- View `switch_games`.`rated_t_scores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `switch_games`.`rated_t_scores`;
USE `switch_games`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `switch_games`.`rated_t_scores` AS select `switch_games`.`ratings`.`game_id` AS `game_id`,`switch_games`.`games`.`game_name` AS `game_name`,`switch_games`.`ratings`.`esrb_rating` AS `esrb_rating`,`switch_games`.`ratings`.`metacritic_score` AS `metacritic_score`,`switch_games`.`ratings`.`user_score` AS `user_score` from (`switch_games`.`ratings` join `switch_games`.`games` on((`switch_games`.`ratings`.`game_id` = `switch_games`.`games`.`game_id`))) where `switch_games`.`ratings`.`game_id` in (select `switch_games`.`ratings`.`game_id` from `switch_games`.`ratings` where (`switch_games`.`ratings`.`esrb_rating` = 'T')) order by `switch_games`.`ratings`.`game_id`;

-- -----------------------------------------------------
-- View `switch_games`.`sold_by_ratings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `switch_games`.`sold_by_ratings`;
USE `switch_games`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `switch_games`.`sold_by_ratings` AS select `switch_games`.`games`.`game_name` AS `game_name`,`switch_games`.`units_sold`.`units_sold` AS `units_sold`,`switch_games`.`ratings`.`metacritic_score` AS `metacritic_score` from ((`switch_games`.`games` join `switch_games`.`units_sold` on((`switch_games`.`games`.`game_id` = `switch_games`.`units_sold`.`game_id`))) join `switch_games`.`ratings` on((`switch_games`.`games`.`game_id` = `switch_games`.`ratings`.`game_id`))) where (`switch_games`.`units_sold`.`units_sold` is not null) order by `switch_games`.`units_sold`.`units_sold` desc;

-- -----------------------------------------------------
-- View `switch_games`.`sorted_metacritic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `switch_games`.`sorted_metacritic`;
USE `switch_games`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `switch_games`.`sorted_metacritic` AS select `switch_games`.`games`.`game_name` AS `game_name`,`switch_games`.`ratings`.`metacritic_score` AS `metacritic_score` from (`switch_games`.`games` join `switch_games`.`ratings` on((`switch_games`.`games`.`game_id` = `switch_games`.`ratings`.`game_id`))) where (`switch_games`.`ratings`.`metacritic_score` is not null) order by `switch_games`.`ratings`.`metacritic_score` desc;

-- -----------------------------------------------------
-- View `switch_games`.`sp_games`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `switch_games`.`sp_games`;
USE `switch_games`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `switch_games`.`sp_games` AS select `switch_games`.`game_classifications`.`game_id` AS `game_id`,`switch_games`.`games`.`game_name` AS `game_name`,`switch_games`.`games`.`date_released` AS `date_released`,`switch_games`.`modes`.`mode_type` AS `mode_type` from ((`switch_games`.`modes` join `switch_games`.`game_classifications` on((`switch_games`.`modes`.`modes_id` = `switch_games`.`game_classifications`.`modes_id`))) join `switch_games`.`games` on((`switch_games`.`game_classifications`.`game_id` = `switch_games`.`games`.`game_id`))) where (`switch_games`.`modes`.`modes_id` = 1) order by `switch_games`.`games`.`date_released` desc;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
