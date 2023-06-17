-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema RideShareDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `RideShareDB` ;

-- -----------------------------------------------------
-- Schema RideShareDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RideShareDB` DEFAULT CHARACTER SET utf8 ;
USE `RideShareDB` ;

-- -----------------------------------------------------
-- Table `RideShareDB`.`MEMBER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RideShareDB`.`MEMBER` ;

CREATE TABLE IF NOT EXISTS `RideShareDB`.`MEMBER` (
  `m_id` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(15) NOT NULL,
  `pw` VARCHAR(15) NOT NULL,
  `nickname` VARCHAR(10) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `code` INT NOT NULL,
  PRIMARY KEY (`m_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RideShareDB`.`PARTY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RideShareDB`.`PARTY` ;

CREATE TABLE IF NOT EXISTS `RideShareDB`.`PARTY` (
  `p_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(2) NOT NULL,
  `start_date` VARCHAR(12) NOT NULL,
  `start_time` VARCHAR(10) NOT NULL,
  `start_point` VARCHAR(100) NOT NULL,
  `start_lat` VARCHAR(20) NOT NULL,
  `start_lng` VARCHAR(20) NOT NULL,
  `end_point` VARCHAR(100) NOT NULL,
  `current_headcnt` INT NOT NULL DEFAULT 1,
  `total_headcnt` INT NOT NULL,
  `is_confirm` TINYINT(1) NOT NULL DEFAULT 0,
  `is_finish` TINYINT(1) NOT NULL DEFAULT 0,
  `car_number` VARCHAR(8) NULL,
  `content` TEXT NULL,
  PRIMARY KEY (`p_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RideShareDB`.`REVIEW`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RideShareDB`.`REVIEW` ;

CREATE TABLE IF NOT EXISTS `RideShareDB`.`REVIEW` (
  `r_id` INT NOT NULL AUTO_INCREMENT,
  `score` INT NOT NULL,
  `m_id` INT NOT NULL,
  PRIMARY KEY (`r_id`),
  INDEX `fk_REVIEW_MEMBER1_idx` (`m_id` ASC) VISIBLE,
  CONSTRAINT `fk_REVIEW_MEMBER1`
    FOREIGN KEY (`m_id`)
    REFERENCES `RideShareDB`.`MEMBER` (`m_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RideShareDB`.`MEMBER_has_PARTY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RideShareDB`.`MEMBER_has_PARTY` ;

CREATE TABLE IF NOT EXISTS `RideShareDB`.`MEMBER_has_PARTY` (
  `j_id` INT NOT NULL AUTO_INCREMENT,
  `m_id` INT NOT NULL,
  `p_id` INT NOT NULL,
  `is_writer` TINYINT(1) NOT NULL DEFAULT 0,
  INDEX `fk_MEMBER_has_PARTY_PARTY1_idx` (`p_id` ASC) VISIBLE,
  INDEX `fk_MEMBER_has_PARTY_MEMBER_idx` (`m_id` ASC) VISIBLE,
  PRIMARY KEY (`j_id`),
  CONSTRAINT `fk_MEMBER_has_PARTY_MEMBER`
    FOREIGN KEY (`m_id`)
    REFERENCES `RideShareDB`.`MEMBER` (`m_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEMBER_has_PARTY_PARTY1`
    FOREIGN KEY (`p_id`)
    REFERENCES `RideShareDB`.`PARTY` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Table `RideShareDB`.`MEMBER` TestData init.
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-01', '오전 11:20', '백록관', '37.868442369510475', '127.7409329182267', '남춘천역', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-02', '오전 11:20', '글로벌경영관', '37.8695401263153', '127.74543307476856', '남춘천역', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-03', '오전 11:20', '강원대정문', '37.866702867214634', '127.73817664607134', '춘천시외버스터미널', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-04', '오전 11:20', '백록관', '37.868442369510475', '127.7409329182267', '남춘천역', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-05', '오전 11:20', '천지관', '37.87119862478267', '127.74317105800883', '남춘천역', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-06', '오전 11:20', '천지관', '37.87119862478267', '127.74317105800883', '남춘천역', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-07', '오전 11:20', '중앙도서관', '37.87083174292327', '127.74420160286947', '남춘천역', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-08', '오전 11:20', '새롬관', '37.86561629079114', '127.74262632123647', '남춘천역', 2, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-09', '오전 11:20', '미래도서관', '37.8659082189985', '127.74916378699089', '남춘천역', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-10', '오전 11:20', '동문', '37.86533821004242', '127.74954440293214', '남춘천역', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-11', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '새롬관', 2, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-12', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '백록관', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-13', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '강원대정문', 3, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-14', '오전 11:20', '춘천시외버스터미널', '37.86288933799438', '127.71893919844631', '천지관', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-15', '오전 11:20', '춘천시외버스터미널', '37.86288933799438', '127.71893919844631', '글로벌경영관', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-16', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '백록관', 4, 4, true, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-17', '오전 11:20', '춘천시외버스터미널', '37.86288933799438', '127.71893919844631', '중앙도서관', 4, 4, true, true, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-18', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '강원대후문', 4, 4, true, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-19', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '미래도서관', 1, 4, false, false, null, null);
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('택시', '2023-04-20', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '동문', 1, 4, false, false, null, null);

INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-01', '오전 11:20', '백록관', '37.868442369510475', '127.7409329182267', '남춘천역', 1, 4, false, false, '12고3456', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-02', '오전 11:20', '글로벌경영관', '37.8695401263153', '127.74543307476856', '남춘천역', 1, 4, false, false, '384저1293', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-03', '오전 11:20', '강원대정문', '37.866702867214634', '127.73817664607134', '춘천시외버스터미널', 1, 4, false, false, '38버3910', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-04', '오전 11:20', '백록관', '37.868442369510475', '127.7409329182267', '남춘천역', 1, 4, false, false, '94어1923', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-05', '오전 11:20', '천지관', '37.87119862478267', '127.74317105800883', '남춘천역', 1, 4, false, false, '58수3582', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-06', '오전 11:20', '천지관', '37.87119862478267', '127.74317105800883', '남춘천역', 1, 4, false, false, '159허1832', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-07', '오전 11:20', '중앙도서관', '37.87083174292327', '127.74420160286947', '남춘천역', 1, 4, false, false, '84후2195', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-08', '오전 11:20', '새롬관', '37.86561629079114', '127.74262632123647', '남춘천역', 2, 4, false, false, '39누4821', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-09', '오전 11:20', '미래도서관', '37.8659082189985', '127.74916378699089', '남춘천역', 1, 4, false, false, '592저4932', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-10', '오전 11:20', '동문', '37.86533821004242', '127.74954440293214', '남춘천역', 1, 4, false, false, '49더8123', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-11', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '새롬관', 2, 4, false, false, '85러3812', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-12', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '백록관', 1, 4, false, false, '122더4925', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-13', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '강원대정문', 3, 4, false, false, '48거4812', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-14', '오전 11:20', '춘천시외버스터미널', '37.86288933799438', '127.71893919844631', '천지관', 1, 4, false, false, '32고9831', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-15', '오전 11:20', '춘천시외버스터미널', '37.86288933799438', '127.71893919844631', '글로벌경영관', 1, 4, false, false, '50고0854', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-16', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '백록관', 4, 4, true, false, '48두5771', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-17', '오전 11:20', '춘천시외버스터미널', '37.86288933799438', '127.71893919844631', '중앙도서관', 4, 4, true, true, '21누8421', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-18', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '강원대후문', 4, 4, true, false, '48가9125', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-19', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '미래도서관', 1, 4, false, false, '23우1283', '컨텐츠내용 테스트 예제');
INSERT INTO `RideShareDB`.`PARTY` (type, start_date, start_time, start_point, start_lat, start_lng, end_point, current_headcnt, total_headcnt, is_confirm, is_finish, car_number, content) VALUES ('카풀', '2023-05-20', '오전 11:20', '남춘천역', '37.86369763697937', '127.72376542374549', '동문', 1, 4, false, false, '237더1028', '컨텐츠내용 테스트 예제');

