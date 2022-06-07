-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ForceAds
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ForceAds`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ForceAds` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ForceAds`;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `Campaigns_id` int(11) NOT NULL,
  `Date_start` date NOT NULL,
  `Date_end` date NOT NULL,
  `Activity` varchar(10) NOT NULL,
  `Media` varchar(50) NOT NULL,
  `Information` varchar(100) NOT NULL,
  `Order_id` int(11) NOT NULL,
  PRIMARY KEY (`Campaigns_id`),
  KEY `Order_id` (`Order_id`),
  CONSTRAINT `CAMPAIGN_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `orders` (`Order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_locations`
--

DROP TABLE IF EXISTS `campaign_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_locations` (
  `Campaigns_id` int(11) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`Campaigns_id`),
  CONSTRAINT `CAMPAIGN_LOCATIONS_ibfk_1` FOREIGN KEY (`Campaigns_id`) REFERENCES `campaign` (`Campaigns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_locations`
--

LOCK TABLES `campaign_locations` WRITE;
/*!40000 ALTER TABLE `campaign_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Customer_id` varchar(6) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `Company` varchar(25) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Phone_number` int(10) DEFAULT NULL,
  `Date_of_submission` date DEFAULT NULL,
  `Payment_total` int(11) DEFAULT NULL,
  `Action` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('CB1571','Carlee','Boarder','Apple Inc','0387 Pond Lane, Palo Alto, CA','cboarder2@so-net.ne.jp',1137399662,'2021-05-19',1270,'Unqualified'),('CS5323','Chucho','Saxon','Coca-Cola','77 3rd Park,Irvine, CA','csaxon1@techcrunch.com',1174577587,'2020-03-25',1600,'Unqualified'),('DF2689','Devonna','Fosken','Mymm','84357 East Park,Tustin,CA','dfosken0@ucoz.com',1111792308,'2021-02-27',50,'Unqualified'),('DK9509','Danny','Kitteman','Flashdog','6 Veith Point,Seattle, WA','dkitteman4@phpbb.com',1015030675,'2021-01-04',2530,'Qualified'),('GJ8221','George','Jimenez','NASA','123 Fake Street','gjimenez@nasa.org',2147483647,'2021-01-24',2100,'Qualified'),('RL2564','Ric','Labrone','Yabox','66 Dakota Hill, Portland, OR','rlabrone5@senate.gov',1401185039,'2020-05-01',1850,'Unqualified'),('SE8426','Sacha','Edensor','Eidel','97 Hoffman Street,Austin,TX','sedensor3@eepurl.com',1757573392,'2021-01-17',2250,'Qualified');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER special_offer AFTER INSERT ON Customer FOR EACH ROW
BEGIN IF NEW.payment_total >= 2000 THEN
INSERT INTO PROMOTION_QUALIFIED SET 
fname = NEW.fname, lname = NEW.lname,  email = NEW.email, phone_number = NEW.phone_number, amount_spent = NEW.payment_total, action = NEW.action, date_of_submission = NEW.date_of_submission;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `impression`
--

DROP TABLE IF EXISTS `impression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impression` (
  `Impression_id` int(11) NOT NULL,
  `URL` varchar(2000) NOT NULL,
  `Media` varchar(50) NOT NULL,
  `Website` varchar(50) NOT NULL,
  `Impression_on_site_an_hour` int(11) NOT NULL,
  `Clicks` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Hour` time NOT NULL,
  `Campaigns_id` int(11) NOT NULL,
  PRIMARY KEY (`Impression_id`),
  KEY `Campaigns_id` (`Campaigns_id`),
  CONSTRAINT `IMPRESSION_ibfk_1` FOREIGN KEY (`Campaigns_id`) REFERENCES `campaign` (`Campaigns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impression`
--

LOCK TABLES `impression` WRITE;
/*!40000 ALTER TABLE `impression` DISABLE KEYS */;
/*!40000 ALTER TABLE `impression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impression_count`
--

DROP TABLE IF EXISTS `impression_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impression_count` (
  `Date` date NOT NULL,
  `Hour` time NOT NULL,
  `Impression_id` int(11) NOT NULL,
  `Number_an_hour` int(11) NOT NULL,
  PRIMARY KEY (`Date`,`Hour`),
  KEY `Impression_id` (`Impression_id`),
  CONSTRAINT `IMPRESSION_COUNT_ibfk_1` FOREIGN KEY (`Impression_id`) REFERENCES `impression` (`Impression_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impression_count`
--

LOCK TABLES `impression_count` WRITE;
/*!40000 ALTER TABLE `impression_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `impression_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers` (
  `Manufacturer_id` int(11) NOT NULL,
  `Manufacturer_name` varchar(30) NOT NULL,
  PRIMARY KEY (`Manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (111,'Apple Inc'),(222,'Coca-Cola'),(333,'Mymm'),(444,'Flashdog'),(555,'Yabox'),(666,'Eidel');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `massmarket_email`
--

DROP TABLE IF EXISTS `massmarket_email`;
/*!50001 DROP VIEW IF EXISTS `massmarket_email`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `massmarket_email` (
  `Customer_id` tinyint NOT NULL,
  `fname` tinyint NOT NULL,
  `lname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `media_partners`
--

DROP TABLE IF EXISTS `media_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_partners` (
  `Supplier_id` int(11) NOT NULL,
  `Supplier_name` varchar(30) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Phone_number` int(10) DEFAULT NULL,
  PRIMARY KEY (`Supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_partners`
--

LOCK TABLES `media_partners` WRITE;
/*!40000 ALTER TABLE `media_partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `Order_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `Customer_id` varchar(6) NOT NULL,
  `Payment_id` int(11) NOT NULL,
  `Date_purchased` date DEFAULT NULL,
  `Date_to_execute` date DEFAULT NULL,
  `Ad_frequency` int(11) NOT NULL,
  `Location_to_run` varchar(50) DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  PRIMARY KEY (`Order_id`),
  KEY `Product_id` (`Product_id`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Payment_id` (`Payment_id`),
  CONSTRAINT `ORDERS_ibfk_1` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`),
  CONSTRAINT `ORDERS_ibfk_2` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`),
  CONSTRAINT `ORDERS_ibfk_3` FOREIGN KEY (`Payment_id`) REFERENCES `payment` (`Payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1415,'SE8426',6,'2021-01-17','2021-02-20',1000,'Palo Alto, CA',900),(2,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(3,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(4,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(5,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(6,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(7,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(8,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(9,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(10,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(11,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(12,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(13,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(14,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(15,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(16,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(17,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(18,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(19,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(20,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(21,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(22,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(23,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(24,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(25,1415,'SE8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(1111,123,'CB1571',1,'2021-05-19','2021-06-19',10,'New York, NY',650),(2222,123,'CB1571',1,'2021-05-19','2021-06-19',10,'Austin, TX',620),(3333,345,'CS5323',2,'2020-03-25','2020-04-25',2,'Seattle, WA',400),(4444,345,'CS5323',2,'2020-03-25','2020-04-25',2,'Portland, OR',400),(5555,345,'CS5323',2,'2020-03-25','2020-04-25',2,'San Diego, CA',400),(6666,345,'CS5323',2,'2020-03-25','2020-04-25',2,'Los Angeles, CA',400),(7777,678,'DF2689',3,'2020-02-27','2020-03-29',6,'Seattle, WA',50),(8888,91011,'DK9509',4,'2021-01-04','2021-02-14',0,'Seattle, WA',2530),(9999,1213,'RL2564',5,'2020-05-01','2020-05-01',0,'Palo Alto, CA',1850);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `Payment_id` int(11) NOT NULL,
  `Customer_id` varchar(6) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Expiration` date DEFAULT NULL,
  `Verification_code` int(11) DEFAULT NULL,
  `Number` char(16) DEFAULT NULL,
  PRIMARY KEY (`Payment_id`),
  KEY `Customer_id` (`Customer_id`),
  CONSTRAINT `PAYMENT_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'CB1571','VISA','Primary Visa','2023-01-01',367,'4921733189964947'),(2,'CS5323','Discover','My Discover','2023-06-17',879,'6011729671230413'),(3,'DF2689','MasterCard','Best Card','2024-08-25',160,'5163104788871913'),(4,'DK9509','AMEX','American Express','2022-09-14',961,'377578531946655'),(5,'RL2564','Maestro','The Maestro','2023-03-25',314,'5893100970313554'),(6,'SE8426','VISA','Visa #1','2024-02-23',272,'4485691271482566'),(7,'SE8426','VISA','Visa #2','2023-07-14',457,'4532637617978791');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Product_id` int(11) NOT NULL,
  `Manufacturer_id` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Type` varchar(25) DEFAULT NULL,
  `Ad_template` varchar(50) DEFAULT NULL,
  `Medium` varchar(50) DEFAULT NULL,
  `Unit_Cost` int(11) DEFAULT NULL,
  `Information` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Product_id`),
  KEY `Manufacturer_id` (`Manufacturer_id`),
  CONSTRAINT `PRODUCT_ibfk_1` FOREIGN KEY (`Manufacturer_id`) REFERENCES `manufacturers` (`Manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (123,111,'Mass mailing','electronic device','email marketing','mass market','email',10,'iphone 12 ads'),(345,222,'Online product promotion','beverage','video ads marketing','video ads','Youtube',10,'coca-cola advertisement'),(678,333,'Mass mailing','medical drugs','email marketing','mass market','email',50,'drugs advertisement'),(1213,555,'Video advertisement','chip implants','video commercial','video ads promo','Youtube',1850,'tech human enhancement advertisement'),(1415,666,'Mass mailing','vacuum cleaner','email marketing','targeted ads','email',90,'tech device advertisement'),(91011,444,'Billboards','technology','billboards','targeted market','billboards',2530,'pet chip implant advertisement');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `product_purchases_bycustomers`
--

DROP TABLE IF EXISTS `product_purchases_bycustomers`;
/*!50001 DROP VIEW IF EXISTS `product_purchases_bycustomers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `product_purchases_bycustomers` (
  `Customer_id` tinyint NOT NULL,
  `Company` tinyint NOT NULL,
  `fname` tinyint NOT NULL,
  `lname` tinyint NOT NULL,
  `Phone_number` tinyint NOT NULL,
  `Product_id` tinyint NOT NULL,
  `Total_LastYear` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `promotion_qualified`
--

DROP TABLE IF EXISTS `promotion_qualified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_qualified` (
  `Fname` varchar(25) NOT NULL,
  `Lname` varchar(25) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Phone_number` int(10) DEFAULT NULL,
  `Amount_spent` int(11) DEFAULT NULL,
  `Date_of_submission` date DEFAULT NULL,
  `Action` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_qualified`
--

LOCK TABLES `promotion_qualified` WRITE;
/*!40000 ALTER TABLE `promotion_qualified` DISABLE KEYS */;
INSERT INTO `promotion_qualified` VALUES ('George','Jimenez','gjimenez@nasa.org',2147483647,2100,'2021-01-24','Qualified');
/*!40000 ALTER TABLE `promotion_qualified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping` (
  `Shipping_id` int(11) NOT NULL,
  `Shipping_type` varchar(50) NOT NULL,
  `Cost` float DEFAULT NULL,
  `Delivery_date` date NOT NULL,
  `Order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Shipping_id`),
  KEY `Order_id` (`Order_id`),
  CONSTRAINT `SHIPPING_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `orders` (`Order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_product`
--

DROP TABLE IF EXISTS `supplier_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_product` (
  `Supplier_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `Cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`Supplier_id`,`Product_id`),
  KEY `Product_id` (`Product_id`),
  CONSTRAINT `SUPPLIER_PRODUCT_ibfk_1` FOREIGN KEY (`Supplier_id`) REFERENCES `media_partners` (`Supplier_id`),
  CONSTRAINT `SUPPLIER_PRODUCT_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_product`
--

LOCK TABLES `supplier_product` WRITE;
/*!40000 ALTER TABLE `supplier_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `massmarket_email`
--

/*!50001 DROP TABLE IF EXISTS `massmarket_email`*/;
/*!50001 DROP VIEW IF EXISTS `massmarket_email`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `massmarket_email` AS select distinct `c`.`Customer_id` AS `Customer_id`,`c`.`fname` AS `fname`,`c`.`lname` AS `lname` from (`orders` `o` join `customer` `c`) where `o`.`Product_id` in (select `product`.`Product_id` from `product` where `product`.`Ad_template` = 'mass market' and `product`.`Medium` = 'email') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_purchases_bycustomers`
--

/*!50001 DROP TABLE IF EXISTS `product_purchases_bycustomers`*/;
/*!50001 DROP VIEW IF EXISTS `product_purchases_bycustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_purchases_bycustomers` AS select `c`.`Customer_id` AS `Customer_id`,`c`.`Company` AS `Company`,`c`.`fname` AS `fname`,`c`.`lname` AS `lname`,`c`.`Phone_number` AS `Phone_number`,`p`.`Product_id` AS `Product_id`,sum(`o`.`Cost`) AS `Total_LastYear` from ((`orders` `o` join `product` `p` on(`o`.`Product_id` = `p`.`Product_id`)) join `customer` `c` on(`c`.`Customer_id` = `o`.`Customer_id`)) where `o`.`Date_purchased` >= curdate() - 365 group by `p`.`Product_id`,`c`.`Customer_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-16 15:24:10
