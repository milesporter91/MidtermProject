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
  `address_id` INT NULL,
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
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`, `phone`) VALUES (4, '1750 Wewatta St', 'Ste 140', 'Denver', 'CO', '80202', '720-409-4242');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`, `phone`) VALUES (5, '1475 S Pearl St', NULL, 'Denver', 'CO', '80210', '720-868-5800');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`, `phone`) VALUES (6, '1226 E Hampden Ave', NULL, 'Englewood', 'CO', '80113', '303-806-9354');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `email`, `create_date`, `last_update`, `image_url`, `about_me`) VALUES (1, 'admin', 'test', 1, 'admin', 1, 'Bob', 'Dobbs', 'bob.dobbs@ghostkitchen.bis', '2025-05-07', '2025-05-09 15:18:43', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `email`, `create_date`, `last_update`, `image_url`, `about_me`) VALUES (2, 'user', 'user', 1, 'user', 2, 'Hungry', 'Dude', 'hgeater2@blockblister.com', '2025-05-08', '2025-05-09 15:29:34', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `email`, `create_date`, `last_update`, `image_url`, `about_me`) VALUES (3, 'foodie', 'foodie', 1, 'user', 2, 'john ', 'Doe', 'john.doe@eatinghub.com', '2025-05-01', '2025-05-01', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant` (`id`, `name`, `address_id`, `enabled`, `image_url`, `website_url`, `description`, `price_range`, `user_id`, `open_time`, `close_time`, `create_date`, `last_update`) VALUES (1, 'Paborito (Filipino BBQ)', 3, 1, 'https://lh3.googleusercontent.com/p/AF1QipO245_gkk76lmlbqm9bbaFC4QGsSX-sAWvpR1HL=s1360-w1360-h1020-rw', 'http://paboritobbq.square.site', '\"Ghost Kitchen that serves Filipino BBQ specialized in Take out and Delivery apps like UberEats, GrubHub and DoorDash.\"', 2, 1, '11:00', '20:00', '2025-05-09', '2025-05-09');
INSERT INTO `restaurant` (`id`, `name`, `address_id`, `enabled`, `image_url`, `website_url`, `description`, `price_range`, `user_id`, `open_time`, `close_time`, `create_date`, `last_update`) VALUES (2, 'Ghost Donkey', 4, 1, 'https://images.squarespace-cdn.com/content/v1/609ac10a4d73c437b2a9b09e/e9dc30b9-dad2-4863-99cc-fb2d87548838/WerkCreative_Ghost_Donkey_20216959_Denver_72DPI.jpg?format=750w', 'http://ghostdonkey.me', 'A lively and vibrant mezcal and tequila bar that embodies the heart and soul of Mexican Hospitality. Ghost Donkey is a mucho good time!', 2, 3, '16:00', '02:00', '2025-05-04', '2025-05-05');
INSERT INTO `restaurant` (`id`, `name`, `address_id`, `enabled`, `image_url`, `website_url`, `description`, `price_range`, `user_id`, `open_time`, `close_time`, `create_date`, `last_update`) VALUES (3, 'Jack\'s On Pearl', 5, 1, 'https://s3-media0.fl.yelpcdn.com/bphoto/gv6kqnxo4eR6M_cHahvXGA/o.jpg', 'http://jacksonpearldenver.com', 'Jack’s on Pearl offers an amazing menu of food and spirits in both of our dinning rooms, Our main floor is set with white tablecloth dining featuring Wagyu steaks, pecan shrimp, lemongrass scallops with forbidden black rice and an on-site sashimi bar. Our second floor features a more casual setting during happy hour and on our large outdoor patio, before shifting to a fine dining experience that resembles that of our main floor after 5:00.', 3, 3, '15:30', '21:00', '2025-05-04', '2025-05-08');
INSERT INTO `restaurant` (`id`, `name`, `address_id`, `enabled`, `image_url`, `website_url`, `description`, `price_range`, `user_id`, `open_time`, `close_time`, `create_date`, `last_update`) VALUES (4, 'Aung\'s Bangkok Café', 6, 1, 'https://images.squarespace-cdn.com/content/v1/555c907ee4b09bb263e61e69/1434145641249-QJYKKKJBWSACDJ4F3X1F/IMG_4921.jpg?format=1500w', 'https://aungsbangkokcafe.com/', 'Family-friendly, Authentic Thai Restaurant  Spice Level: No Spice, Mild, Medium, Hot, or Thai Hot\nPlease Notify us of Any Allergies or Concerns\nTake Out Available. No Delivery.', 3, 3, '11:00', '21:30', '2025-05-14', '2025-05-14');

COMMIT;


-- -----------------------------------------------------
-- Data for table `review`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `review` (`id`, `user_id`, `restaurant_id`, `comments`, `rating`, `enabled`, `create_date`, `last_update`) VALUES (1, 2, 1, 'food was hot and spicy', 5, 1, '2025-05-09', '2025-05-09');
INSERT INTO `review` (`id`, `user_id`, `restaurant_id`, `comments`, `rating`, `enabled`, `create_date`, `last_update`) VALUES (2, 1, 2, 'If you\'re a fan of tequila and mezcal, Ghost Donkey is a must-visit bar in Colorado. Nestled in a cozy corner, this spot exudes a cool, intimate vibe with just the right amount of mystery. The moment you step in, you\'re transported into a dimly lit, speakeasy-style haven where the focus is all about exceptional drinks and laid-back vibes.', 5, 1, '2025-05-12', '2025-05-12');
INSERT INTO `review` (`id`, `user_id`, `restaurant_id`, `comments`, `rating`, `enabled`, `create_date`, `last_update`) VALUES (3, 2, 3, 'Went here last night for a celebration and our server Paul was amazing. We really appreciated his expertise knowing the menu and the wine selection.We got the yellow tail sushi roll and it was the best sushi roll we\'ve ever had.We also got the Champion Filet and the Lobster and Shrimp Linguine - which were amazing!We can\'t wait to go back and will always suggest Jack\'s to friends looking for a nice date night.', 5, 1, '2025-04-19', '2025-04-19');

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_restaurant`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `favorite_restaurant` (`user_id`, `restaurant_id`) VALUES (1, 1);
INSERT INTO `favorite_restaurant` (`user_id`, `restaurant_id`) VALUES (2, 3);
INSERT INTO `favorite_restaurant` (`user_id`, `restaurant_id`) VALUES (3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cuisine_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Filipino', 'Filipino Barbecue (BBQ) dishes with sweet and savory, tangy marinade, typically grilled over hot coals. Common ingredients include pork, chicken, or even fish, marinated in a mixture of soy sauce, vinegar, garlic, brown sugar, banana ketchup, and lemon-lime soda. The dishes are served with rice and a variety of delicious side dishes.', 'https://i0.wp.com/www.denverpost.com/wp-content/uploads/2024/12/TDP-L-Paborito-01.jpg');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Mexican', 'Known for its bold flavors, vibrant colors, and rich history. Featuring dishes like tacos, enchiladas, tamales, and salsas, it combines indigenous Mesoamerican ingredients such as corn, beans, and chili peppers with Spanish influences to create a diverse and flavorful culinary tradition.', 'https://s3-media0.fl.yelpcdn.com/bphoto/ReY4URD_uS--kS_f3lFQfw/348s.jpg');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (3, 'American', 'American cuisine reflects a melting pot of cultural influences, featuring everything from classic burgers and fried chicken to regional favorites like Southern barbecue, New England clam chowder, and Tex-Mex. It emphasizes hearty portions, comfort food, and regional diversity.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQzbYGbKDtXlA8j5-JWhINvw9MLTz81Sj_vg&s');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (4, 'Thai', 'Expertly spiced, reasonably priced, authentic Thai cuisine', 'https://aungsbangkokcafe.com/');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (5, 'Brazilian', 'Savor traditional Brazilian churrasco cooking served with the generous spirit and hospitality that Texas is known for.', 'https://texasdebrazil.com/wp-content/uploads/2019/05/Q2-Special-Menu-Feature-Items.gif');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (6, 'Japanese', 'Crazy Tuna Roll was super good.\nGreat spot for all tuna roll lovers. ', 'https://menuimages.chownowcdn.com/image-resizing?image=41630%2F622ec093-a7ce-4ad2-b885-d687fd291e02.jpg&left=0&top=504&right=0&bottom=504&height=800&width=924&quality=85&fit=contain');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (7, 'Middle-Eastern', 'Come enjoy the warmth and welcome that make Jerusalem Restaurant a unique Middle Eastern oasis in Colorado.', 'https://static-content.owner.com/menu-items/items/0huiSbvJtr2z.png?v=1553708190&w=640&q=80&auto=format');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (8, 'Columbian', 'Discover the authentic taste of Colombia at Sabor Colombiano in Denver! We offer traditional Colombian dishes like Chicharron Carnudo, Empanadas Vallunas, and Bandeja Paisa.', 'https://menufyproduction.imgix.net/638733389036932560+1658809.png?max-h=300&max-w=1000&fit=crop');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (9, 'Polish', 'Step right up and take a trip to Poland without ever leaving your chair! Our authentic Polish cuisine will transport your taste buds straight to the streets of Warsaw. Indulge in the classic pierogi, hearty kielbasa, and savory cabbage rolls, all made with the freshest ingredients and cooked to perfection. It\'s like a delicious history lesson in every bite! So what are you waiting for?\n\nCome get your Polish fix at our restaurants, food truck or order pierogies to your door and let us take you on a mouth-watering journey through Eastern Europe!\n\n\n\nOnline Store\nfrozen bags\n\"Let us do the driving! Enjoy nationwide delivery to your doorstep.\"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nLoad More Content\nStep right up and take a trip to Poland without ever leaving your chair! Our authentic Polish cuisine will transport your taste buds straight to the streets of Warsaw. Indulge in the classic pierogi, hearty kielbasa, and savory cabbage rolls, all made with the freshest ingredients and cooked to perfection. It\'s like a delicious history lesson in every bite! So what are you waiting for?\n\nCome get your Polish fix at our restaurants, food truck or order pierogies to your door and let us take you on a mouth-watering journey through Eastern Europe!\n\n\n\nOnline Store\nfrozen bags\n\"Let us do the driving! Enjoy nationwide delivery to your doorstep.\"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nLoad More Content\nStep right up and take a trip to Poland without ever leaving your chair! Our authentic Polish cuisine will transport your taste buds straight to the streets of Warsaw. Indulge in the classic pierogi, hearty kielbasa, and savory cabbage rolls, all made with the freshest ingredients and cooked to perfection. It\'s like a delicious history lesson in every bite! So what are you waiting for?\n\nCome get your Polish fix at our restaurants, food truck or order pierogies to your door and let us take you on a mouth-watering journey through Eastern Europe!\n\n\n\nOnline Store\nfrozen bags\n\"Let us do the driving! Enjoy nationwide delivery to your doorstep.\"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nLoad More Content\n', 'https://popmenucloud.com/cdn-cgi/image/width%3D3840%2Cheight%3D3840%2Cfit%3Dscale-down%2Cformat%3Dauto%2Cquality%3D60/exiyfguk/733ee1b1-1d1a-4451-b751-88d5f829c42b.jpg');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (10, 'Chinese', 'Everything has just been fantastic! I would recommend this restaurant to anyone.', 'https://greatwallcotogo.com/assets/images/9.png');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (11, 'Ethiopian', 'Ethiopia, an ancient land rich in diverse cultures, religions, languages, and ethnic groups, is also a treasure trove of distinctive culinary traditions. From iron-rich teff grains to the world-renowned Arabica coffee, and the fiery chili peppers to an array of unique spices, Ethiopia is the birthplace of a remarkable culinary heritage', 'https://images.squarespace-cdn.com/content/v1/666d2b56b40ced5c181b692b/4c6ddd28-9cea-4b39-9522-0a4474281807/17-EatopiaEthiopiaFood_LambOrBeefNechTibsNotSpicy.jpg?format=1000w');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (12, 'Greek', 'Delicious Greek and Lebanese Food', 'https://popmenucloud.com/cdn-cgi/image/width%3D3840%2Cheight%3D3840%2Cfit%3Dscale-down%2Cformat%3Dauto%2Cquality%3D60/oqnhfcya/5acbf479-2bf4-4d70-b89f-917f6962608f.jpeg');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (13, 'African', 'Savor the Flavors of Africa: Lets celebrate Denver Restaurant Week at the African Grill and Bar in Lakewood, Colorado.', 'https://img1.wsimg.com/isteam/ip/b5b5df92-0549-43e6-b411-73f8345449c2/chakalaka%20tilapia.jpg/:/cr=t:0%25,l:12.5%25,w:75%25,h:100%25/rs=w:720,h:720,cg:true');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (14, 'Hawaian', 'Fast, delicious and fresh ingredients. The location faces Lafayette St on North side of Colfax. Great tuna & spicy tuna', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/7c/db/be/photo0jpg.jpg?w=1400&h=-1&s=1');
INSERT INTO `cuisine_type` (`id`, `name`, `description`, `image_url`) VALUES (15, 'Peruvian', 'Serving craft pizza and award winning wings, with a full beer and cocktail menu in the heart of Belleview Station in the Denver Tech Center', 'https://popmenucloud.com/cdn-cgi/image/width%3D1536%2Cheight%3D1536%2Cfit%3Dscale-down%2Cformat%3Dauto%2Cquality%3D60/vguojifd/aede28b7-44a9-49e6-9c6d-23a99e52ff22.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant_cuisine_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant_cuisine_type` (`cuisine_type_id`, `restaurant_id`) VALUES (1, 1);
INSERT INTO `restaurant_cuisine_type` (`cuisine_type_id`, `restaurant_id`) VALUES (2, 2);
INSERT INTO `restaurant_cuisine_type` (`cuisine_type_id`, `restaurant_id`) VALUES (3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant_type` (`id`, `name`, `image_url`, `description`) VALUES (1, 'Ghost Kitchen', 'https://images.prismic.io/cloudkitchens-main/092ff16d-2857-4245-aa1f-9c9d447893f7_Denver_Exterior_VallejoDSC02348+Large.jpeg?auto=compress,format', 'Vallejo Food Pickup is a Denver food hall and delivery hub. We have over 20+ kitchens run by some of the best small-business chefs in the city, as well as family favorite national chains. Place your order for delivery via your favorite major delivery app, or order pickup via our website. You can also come in today to try out one of our many kitchens for takeout by using our state-of-the-art lobby kiosks!\n');
INSERT INTO `restaurant_type` (`id`, `name`, `image_url`, `description`) VALUES (2, 'Bar', 'https://www.shutterstock.com/shutterstock/photos/2533572829/display_1500/stock-vector-cocktails-vector-set-for-menu-design-bars-restaurants-cafes-parties-colored-sketch-of-2533572829.jpg', 'Bar');
INSERT INTO `restaurant_type` (`id`, `name`, `image_url`, `description`) VALUES (3, 'Traditional ', 'https://cdn3.iconfinder.com/data/icons/hotel-171/100/Restaurant-1024.png', 'Traditional Sit-Down Table Service');

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant_has_restaurant_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant_has_restaurant_type` (`restaurant_id`, `restaurant_type_id`) VALUES (1, 1);
INSERT INTO `restaurant_has_restaurant_type` (`restaurant_id`, `restaurant_type_id`) VALUES (2, 2);
INSERT INTO `restaurant_has_restaurant_type` (`restaurant_id`, `restaurant_type_id`) VALUES (3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant_tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant_tag` (`id`, `name`, `user_id`) VALUES (1, 'Filipino', 1);
INSERT INTO `restaurant_tag` (`id`, `name`, `user_id`) VALUES (2, 'Mexican Cocktails', 2);
INSERT INTO `restaurant_tag` (`id`, `name`, `user_id`) VALUES (3, 'Fusion', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant_has_restaurant_tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `restaurant_has_restaurant_tag` (`restaurant_id`, `restaurant_tag_id`) VALUES (1, 1);
INSERT INTO `restaurant_has_restaurant_tag` (`restaurant_id`, `restaurant_tag_id`) VALUES (2, 2);
INSERT INTO `restaurant_has_restaurant_tag` (`restaurant_id`, `restaurant_tag_id`) VALUES (3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `review_comment` (`id`, `comment`, `create_date`, `enabled`, `user_id`, `review_id`, `in_reply_to_id`) VALUES (1, 'This was great food', '2025-05-09', 1, 1, 1, NULL);
INSERT INTO `review_comment` (`id`, `comment`, `create_date`, `enabled`, `user_id`, `review_id`, `in_reply_to_id`) VALUES (2, 'Mezcal and tequilla is a dangerous combination', '2025-05-12', 1, 2, 2, NULL);
INSERT INTO `review_comment` (`id`, `comment`, `create_date`, `enabled`, `user_id`, `review_id`, `in_reply_to_id`) VALUES (3, 'It is the nector of life', '2025-05-12', 1, 1, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `ghostkitchensdb`;
INSERT INTO `review_rating` (`user_id`, `review_id`, `rating`) VALUES (1, 1, 1);
INSERT INTO `review_rating` (`user_id`, `review_id`, `rating`) VALUES (2, 2, 0);
INSERT INTO `review_rating` (`user_id`, `review_id`, `rating`) VALUES (3, 3, 1);

COMMIT;

