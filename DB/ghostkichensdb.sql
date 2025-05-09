-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ghostkitchensdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ghostkitchensdb` ;

-- -----------------------------------------------------
-- Schema ghostkitchensdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ghostkitchensdb` DEFAULT CHARACTER SET utf8 ;
USE `ghostkitchensdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `street2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` CHAR(2) NULL,
  `zip_code` VARCHAR(10) NULL,
  `phone` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(50) NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `image_url` VARCHAR(2000) NULL,
  `about_me` TEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `fk_user_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant` ;

CREATE TABLE IF NOT EXISTS `restaurant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `address_id` INT NOT NULL,
  `enabled` TINYINT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `website_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  `price_range` INT NULL,
  `user_id` INT NOT NULL,
  `open_time` TIME NULL,
  `close_time` TIME NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_restaurant_address_idx` (`address_id` ASC) VISIBLE,
  INDEX `fk_restaurant_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review` ;

CREATE TABLE IF NOT EXISTS `review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `restaurant_id` INT NOT NULL,
  `comments` TEXT NULL,
  `rating` INT NULL,
  `enabled` TINYINT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_review_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_restaurant` ;

CREATE TABLE IF NOT EXISTS `favorite_restaurant` (
  `user_id` INT NOT NULL,
  `restaurant_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `restaurant_id`),
  INDEX `fk_user_has_restaurant_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  INDEX `fk_user_has_restaurant_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_restaurant_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_restaurant_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cuisine_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cuisine_type` ;

CREATE TABLE IF NOT EXISTS `cuisine_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_cuisine_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant_cuisine_type` ;

CREATE TABLE IF NOT EXISTS `restaurant_cuisine_type` (
  `cuisine_type_id` INT NOT NULL,
  `restaurant_id` INT NOT NULL,
  PRIMARY KEY (`cuisine_type_id`, `restaurant_id`),
  INDEX `fk_cuisine_type_has_restaurant_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  INDEX `fk_cuisine_type_has_restaurant_cuisine_type1_idx` (`cuisine_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_cuisine_type_has_restaurant_cuisine_type1`
    FOREIGN KEY (`cuisine_type_id`)
    REFERENCES `cuisine_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cuisine_type_has_restaurant_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant_type` ;

CREATE TABLE IF NOT EXISTS `restaurant_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `image_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_has_restaurant_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant_has_restaurant_type` ;

CREATE TABLE IF NOT EXISTS `restaurant_has_restaurant_type` (
  `restaurant_id` INT NOT NULL,
  `restaurant_type_id` INT NOT NULL,
  PRIMARY KEY (`restaurant_id`, `restaurant_type_id`),
  INDEX `fk_restaurant_has_restaurant_type_restaurant_type1_idx` (`restaurant_type_id` ASC) VISIBLE,
  INDEX `fk_restaurant_has_restaurant_type_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_has_restaurant_type_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_has_restaurant_type_restaurant_type1`
    FOREIGN KEY (`restaurant_type_id`)
    REFERENCES `restaurant_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant_tag` ;

CREATE TABLE IF NOT EXISTS `restaurant_tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_restaurant_tag_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_tag_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_has_restaurant_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant_has_restaurant_tag` ;

CREATE TABLE IF NOT EXISTS `restaurant_has_restaurant_tag` (
  `restaurant_id` INT NOT NULL,
  `restaurant_tag_id` INT NOT NULL,
  PRIMARY KEY (`restaurant_id`, `restaurant_tag_id`),
  INDEX `fk_restaurant_has_restaurant_tag_restaurant_tag1_idx` (`restaurant_tag_id` ASC) VISIBLE,
  INDEX `fk_restaurant_has_restaurant_tag_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_has_restaurant_tag_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_has_restaurant_tag_restaurant_tag1`
    FOREIGN KEY (`restaurant_tag_id`)
    REFERENCES `restaurant_tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review_comment` ;

CREATE TABLE IF NOT EXISTS `review_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  `enabled` TINYINT NULL,
  `user_id` INT NOT NULL,
  `review_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_review_comment_review1_idx` (`review_id` ASC) VISIBLE,
  INDEX `fk_review_comment_review_comment1_idx` (`in_reply_to_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_comment_review1`
    FOREIGN KEY (`review_id`)
    REFERENCES `review` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_comment_review_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `review_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review_rating` ;

CREATE TABLE IF NOT EXISTS `review_rating` (
  `user_id` INT NOT NULL,
  `review_id` INT NOT NULL,
  `rating` TINYINT NULL,
  PRIMARY KEY (`user_id`, `review_id`),
  INDEX `fk_user_has_review_review1_idx` (`review_id` ASC) VISIBLE,
  INDEX `fk_user_has_review_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_review_review1`
    FOREIGN KEY (`review_id`)
    REFERENCES `review` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS ghostkitchensuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'ghostkitchensuser'@'localhost' IDENTIFIED BY 'ghostkitchensuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'ghostkitchensuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`, `phone`) VALUES (1, '3435 S Inca St', 'Ste C', 'Englewood', 'CO', '80110', '720-444-5555');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`, `phone`) VALUES (2, '901 Englewood Pkwy', NULL, 'Englewood', 'CO', '80110', NULL);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`, `phone`) VALUES (3, '810 Vallejo St   ', NULL, 'Denver ', 'CO', '80204', '720-900-7112');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `email`, `create_date`, `last_update`, `image_url`, `about_me`) VALUES (1, 'admin', 'test', 1, 'admin', 1, 'Bob', 'Dobbs', 'bob.dobbs@ghostkitchen.bis', '2025-05-07', '2025-05-09 15:18:43', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `email`, `create_date`, `last_update`, `image_url`, `about_me`) VALUES (2, 'user', 'user', 1, 'user', 2, 'Hungry', 'Dude', 'hgeater2@blockblister.com', '2025-05-08', '2025-05-09 15:29:34', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant` (`id`, `name`, `address_id`, `enabled`, `image_url`, `website_url`, `description`, `price_range`, `user_id`, `open_time`, `close_time`, `create_date`, `last_update`) VALUES (1, 'Paborito (Filipino BBQ)', 3, 1, 'https://lh3.googleusercontent.com/p/AF1QipO245_gkk76lmlbqm9bbaFC4QGsSX-sAWvpR1HL=s1360-w1360-h1020-rw', 'paboritobbq.square.site', '\"Ghost Kitchen that serves Filipino BBQ specialized in Take out and Delivery apps like UberEats, GrubHub and DoorDash.\"', 2, 1, '11:00', '20:00', '2025-05-09', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `review` (`id`, `user_id`, `restaurant_id`, `comments`, `rating`, `enabled`, `create_date`, `last_update`) VALUES (1, 2, 1, 'food was hot and spicy', 5.0, 1, '2025-05-09', '2025-05-09');

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_restaurant`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `favorite_restaurant` (`user_id`, `restaurant_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cuisine_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Filipino', 'The food was so delicious I had to order a few days later. The meats are juicy and flavorful, and great portions for the price.', 'https://i0.wp.com/www.denverpost.com/wp-content/uploads/2024/12/TDP-L-Paborito-01.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant_cuisine_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant_cuisine_type` (`cuisine_type_id`, `restaurant_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant_type` (`id`, `name`, `image_url`, `description`) VALUES (1, 'Ghost Kitchen', 'https://images.prismic.io/cloudkitchens-main/092ff16d-2857-4245-aa1f-9c9d447893f7_Denver_Exterior_VallejoDSC02348+Large.jpeg?auto=compress,format', 'Vallejo Food Pickup is a Denver food hall and delivery hub. We have over 20+ kitchens run by some of the best small-business chefs in the city, as well as family favorite national chains. Place your order for delivery via your favorite major delivery app, or order pickup via our website. You can also come in today to try out one of our many kitchens for takeout by using our state-of-the-art lobby kiosks!\n');

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant_has_restaurant_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant_has_restaurant_type` (`restaurant_id`, `restaurant_type_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant_tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant_tag` (`id`, `name`, `user_id`) VALUES (1, 'Filipino', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant_has_restaurant_tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant_has_restaurant_tag` (`restaurant_id`, `restaurant_tag_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `review_comment` (`id`, `comment`, `create_date`, `enabled`, `user_id`, `review_id`, `in_reply_to_id`) VALUES (1, 'This was great food', '2025-05-09', 1, 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `review_rating` (`user_id`, `review_id`, `rating`) VALUES (1, 1, 10);

COMMIT;

