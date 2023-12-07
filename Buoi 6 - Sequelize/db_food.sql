/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT CURRENT_TIMESTAMP,
  `unlike` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Margherita Pizza', 'margherita.jpg', 12.99, 'Classic tomato and mozzarella', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Cheeseburger', 'cheeseburger.jpg', 8.99, 'Juicy beef patty with cheese', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Taco Supreme', 'taco_supreme.jpg', 10.99, 'Loaded with toppings', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'General Tso Chicken', 'general_tso.jpg', 13.99, 'Spicy and flavorful', 4),
(5, 'Sashimi Platter', 'sashimi.jpg', 20.99, 'Assorted fresh sashimi', 5);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Italian');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'American');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Mexican');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Chinese'),
(5, 'Japanese'),
(6, 'Italian'),
(7, 'American'),
(8, 'Mexican'),
(9, 'Chinese'),
(10, 'Japanese');

INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`, `unlike`) VALUES
(1, 1, 1, '2023-01-02 08:00:00', 0);
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`, `unlike`) VALUES
(2, 2, 2, '2023-02-16 10:30:00', 0);
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`, `unlike`) VALUES
(3, 3, 3, '2023-03-21 12:45:00', 0);
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`, `unlike`) VALUES
(4, 4, 4, '2023-04-06 15:20:00', 0),
(5, 5, 5, '2023-05-11 18:40:00', 0),
(6, 1, 2, '2023-06-15 08:30:00', 0),
(7, 2, 3, '2023-07-20 10:45:00', 0),
(8, 3, 4, '2023-08-25 12:00:00', 0),
(9, 4, 5, '2023-09-30 14:15:00', 0),
(10, 5, 1, '2023-10-05 16:30:00', 0),
(11, 1, 3, '2023-11-10 18:45:00', 0),
(12, 2, 4, '2023-12-15 21:00:00', 0),
(13, 3, 5, '2024-01-20 23:15:00', 0),
(14, 4, 1, '2024-02-25 01:30:00', 0),
(15, 5, 2, '2024-03-01 03:45:00', 0),
(16, 1, 4, '2024-04-05 06:00:00', 0),
(17, 2, 5, '2024-05-10 08:15:00', 0),
(18, 3, 1, '2024-06-15 10:30:00', 0),
(19, 4, 2, '2024-07-20 12:45:00', 0),
(27, 5, 3, '2023-12-07 03:24:32', 1);

INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 5, 'ABC123', 'XYZ789');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 3, 4, 3, 'DEF456', 'UVW123');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 2, 1, 2, 'GHI789', 'PQR456');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 1, 3, 4, 'JKL012', 'MNO789'),
(5, 2, 4, 6, 'STU345', 'VWX012'),
(6, 4, 1, 1, '', NULL),
(7, 4, 2, 2, NULL, NULL),
(8, 4, 2, 2, NULL, '1701930917879'),
(9, 4, 3, 1, NULL, '1701930917879'),
(10, 5, 1, 2, NULL, '1701930973767'),
(11, 5, 2, 3, NULL, '1701930973767'),
(12, 5, 3, 2, NULL, '1701930973767'),
(13, 5, 4, 3, NULL, '1701930973767');

INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 1, 4, '2023-01-01 12:30:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 2, 5, '2023-02-15 14:45:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 3, 3, '2023-03-20 18:00:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 4, 4, 4, '2023-04-05 10:15:00'),
(5, 5, 5, 3, '2023-12-07 04:48:21'),
(7, 5, 1, 4, '2023-12-07 04:50:13'),
(8, 5, 2, 5, '2023-12-07 04:49:57');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Pizza Palace', 'pizza.jpg', 'A cozy place for pizza lovers');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Burger Barn', 'burger.jpg', 'Serving the best burgers in town');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Taco Town', 'taco.jpg', 'Authentic Mexican flavors');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Chopsticks', 'chinese.jpg', 'Experience Chinese cuisine'),
(5, 'Sushi House', 'sushi.jpg', 'Fresh and delicious sushi'),
(6, 'Pizza Palace', 'pizza.jpg', 'A cozy place for pizza lovers'),
(7, 'Burger Barn', 'burger.jpg', 'Serving the best burgers in town'),
(8, 'Taco Town', 'taco.jpg', 'Authentic Mexican flavors'),
(9, 'Chopsticks', 'chinese.jpg', 'Experience Chinese cuisine'),
(10, 'Sushi House', 'sushi.jpg', 'Fresh and delicious sushi');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `price`, `food_id`) VALUES
(1, 'Extra Cheese', 1.5, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `price`, `food_id`) VALUES
(2, 'Bacon', 2, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `price`, `food_id`) VALUES
(3, 'Guacamole', 1.75, 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `price`, `food_id`) VALUES
(4, 'Hot and Sour Soup', 3.5, 4),
(5, 'Miso Soup', 2.5, 5);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Alice Johnson', 'alice@example.com', 'pass123');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Bob Smith', 'bob@example.com', 'securepass');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Charlie Brown', 'charlie@example.com', 'p@ssw0rd');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'David Miller', 'david@example.com', 'mysecret'),
(5, 'Eva Davis', 'eva@example.com', 'strongpassword'),
(6, 'Dustin Gutierrez', 'bester@outlook.com', '123456789'),
(7, 'Hunter Trujillo', 'paley@yahoo.ca', '123456789'),
(8, 'Britney White', 'stinson@live.com', '123456789'),
(9, 'Giovanna Vargas', 'dkrishna@comcast.net', '123456789'),
(10, 'Drake Yoder', 'intlprog@comcast.net', '123456789'),
(11, 'Yaretzi Adkins', 'grady@hotmail.com', '123456789'),
(12, 'Maya Norton', 'scarolan@optonline.net', '123456789'),
(13, 'Preston Owens', 'speeves@hotmail.com', '123456789'),
(14, 'Gina Huffman', 'gommix@comcast.net', '123456789'),
(15, 'Alonso Hubbard', 'burniske@msn.com', '123456789'),
(16, 'Pierce Herman', 'jshearer@att.net', '123456789'),
(17, 'Marie Shelton', 'quantaman@yahoo.ca', '123456789'),
(18, 'Alice Johnson', 'alice@example.com', 'pass123'),
(19, 'Bob Smith', 'bob@example.com', 'securepass'),
(20, 'Charlie Brown', 'charlie@example.com', 'p@ssw0rd'),
(21, 'David Miller', 'david@example.com', 'mysecret'),
(22, 'Eva Davis', 'eva@example.com', 'strongpassword'),
(23, 'Dustin Gutierrez', 'bester@outlook.com', '123456789'),
(24, 'Hunter Trujillo', 'paley@yahoo.ca', '123456789'),
(25, 'Britney White', 'stinson@live.com', '123456789'),
(26, 'Giovanna Vargas', 'dkrishna@comcast.net', '123456789'),
(27, 'Drake Yoder', 'intlprog@comcast.net', '123456789'),
(28, 'Yaretzi Adkins', 'grady@hotmail.com', '123456789'),
(29, 'Maya Norton', 'scarolan@optonline.net', '123456789'),
(30, 'Preston Owens', 'speeves@hotmail.com', '123456789'),
(31, 'Gina Huffman', 'gommix@comcast.net', '123456789'),
(32, 'Alonso Hubbard', 'burniske@msn.com', '123456789'),
(33, 'Pierce Herman', 'jshearer@att.net', '123456789'),
(34, 'Marie Shelton', 'quantaman@yahoo.ca', '123456789');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;