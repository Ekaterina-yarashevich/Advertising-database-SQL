-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ForceAds
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

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
-- Table structure for table `CAMPAIGN`
--

DROP TABLE IF EXISTS `CAMPAIGN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAMPAIGN` (
  `Campaigns_id` int(11) NOT NULL,
  `Date_start` date NOT NULL,
  `Date_end` date NOT NULL,
  `Activity` varchar(10) NOT NULL,
  `Media` varchar(50) NOT NULL,
  `Information` varchar(100) NOT NULL,
  `Order_id` int(11) NOT NULL,
  PRIMARY KEY (`Campaigns_id`),
  KEY `Order_id` (`Order_id`),
  CONSTRAINT `CAMPAIGN_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `ORDERS` (`Order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMPAIGN`
--

LOCK TABLES `CAMPAIGN` WRITE;
/*!40000 ALTER TABLE `CAMPAIGN` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAMPAIGN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAMPAIGN_LOCATIONS`
--

DROP TABLE IF EXISTS `CAMPAIGN_LOCATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAMPAIGN_LOCATIONS` (
  `Campaigns_id` int(11) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`Campaigns_id`),
  CONSTRAINT `CAMPAIGN_LOCATIONS_ibfk_1` FOREIGN KEY (`Campaigns_id`) REFERENCES `CAMPAIGN` (`Campaigns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMPAIGN_LOCATIONS`
--

LOCK TABLES `CAMPAIGN_LOCATIONS` WRITE;
/*!40000 ALTER TABLE `CAMPAIGN_LOCATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAMPAIGN_LOCATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
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
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES ('CA1571','Carlee','Boarder','Apple Inc','0387 Pond Lane, Palo Alto, CA','cboarder2@so-net.ne.jp',1137399662,'2021-05-19',1270,'Unqualified'),('CH5323','Chucho','Saxon','Coca-Cola','77 3rd Park,Irvine, CA','csaxon1@techcrunch.com',1174577587,'2020-03-25',1600,'Unqualified'),('DA9509','Danny','Kitteman','Flashdog','6 Veith Point,Seattle, WA','dkitteman4@phpbb.com',1015030675,'2021-01-04',2530,'Qualified'),('DE2689','Devonna','Fosken','Mymm','84357 East Park,Tustin,CA','dfosken0@ucoz.com',1111792308,'2021-02-27',50,'Qualified'),('RI2564','Ric','Labrone','Yabox','66 Dakota Hill, Portland, OR','rlabrone5@senate.gov',1401185039,'2020-05-01',1850,'Unqualified'),('SA8426','Sacha','Edensor','Eidel','97 Hoffman Street,Austin,TX','sedensor3@eepurl.com',1757573392,'2021-01-17',2250,'Unqualified');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMPRESSION`
--

DROP TABLE IF EXISTS `IMPRESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMPRESSION` (
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
  CONSTRAINT `IMPRESSION_ibfk_1` FOREIGN KEY (`Campaigns_id`) REFERENCES `CAMPAIGN` (`Campaigns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMPRESSION`
--

LOCK TABLES `IMPRESSION` WRITE;
/*!40000 ALTER TABLE `IMPRESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMPRESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMPRESSION_COUNT`
--

DROP TABLE IF EXISTS `IMPRESSION_COUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMPRESSION_COUNT` (
  `Date` date NOT NULL,
  `Hour` time NOT NULL,
  `Impression_id` int(11) NOT NULL,
  `Number_an_hour` int(11) NOT NULL,
  PRIMARY KEY (`Date`,`Hour`),
  KEY `Impression_id` (`Impression_id`),
  CONSTRAINT `IMPRESSION_COUNT_ibfk_1` FOREIGN KEY (`Impression_id`) REFERENCES `IMPRESSION` (`Impression_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMPRESSION_COUNT`
--

LOCK TABLES `IMPRESSION_COUNT` WRITE;
/*!40000 ALTER TABLE `IMPRESSION_COUNT` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMPRESSION_COUNT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANUFACTURERS`
--

DROP TABLE IF EXISTS `MANUFACTURERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MANUFACTURERS` (
  `Manufacturer_id` int(11) NOT NULL,
  `Manufacturer_name` varchar(30) NOT NULL,
  PRIMARY KEY (`Manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANUFACTURERS`
--

LOCK TABLES `MANUFACTURERS` WRITE;
/*!40000 ALTER TABLE `MANUFACTURERS` DISABLE KEYS */;
INSERT INTO `MANUFACTURERS` VALUES (111,'Apple Inc'),(222,'Coca-Cola'),(333,'Mymm'),(444,'Flashdog'),(555,'Yabox'),(666,'Eidel');
/*!40000 ALTER TABLE `MANUFACTURERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `MASSMARKET_EMAIL`
--

DROP TABLE IF EXISTS `MASSMARKET_EMAIL`;
/*!50001 DROP VIEW IF EXISTS `MASSMARKET_EMAIL`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MASSMARKET_EMAIL` (
  `Customer_id` tinyint NOT NULL,
  `fname` tinyint NOT NULL,
  `lname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `MEDIA_PARTNERS`
--

DROP TABLE IF EXISTS `MEDIA_PARTNERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDIA_PARTNERS` (
  `Supplier_id` int(11) NOT NULL,
  `Supplier_name` varchar(30) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Phone_number` int(10) DEFAULT NULL,
  PRIMARY KEY (`Supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDIA_PARTNERS`
--

LOCK TABLES `MEDIA_PARTNERS` WRITE;
/*!40000 ALTER TABLE `MEDIA_PARTNERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MEDIA_PARTNERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERS`
--

DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDERS` (
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
  CONSTRAINT `ORDERS_ibfk_1` FOREIGN KEY (`Product_id`) REFERENCES `PRODUCT` (`Product_id`),
  CONSTRAINT `ORDERS_ibfk_2` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`Customer_id`),
  CONSTRAINT `ORDERS_ibfk_3` FOREIGN KEY (`Payment_id`) REFERENCES `PAYMENT` (`Payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERS`
--

LOCK TABLES `ORDERS` WRITE;
/*!40000 ALTER TABLE `ORDERS` DISABLE KEYS */;
INSERT INTO `ORDERS` VALUES (1,1415,'SA8426',6,'2021-01-17','2021-02-20',1000,'Palo Alto, CA',900),(2,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(3,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(4,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(5,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(6,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(7,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(8,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(9,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(10,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(11,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(12,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(13,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(14,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(15,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(16,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(17,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(18,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(19,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(20,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(21,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(22,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(23,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(24,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(25,1415,'SA8426',7,'2021-01-17','2021-02-20',1000,'Santa Ana, CA',900),(1111,123,'CA1571',1,'2021-05-19','2021-06-19',10,'New York, NY',650),(2222,123,'CA1571',1,'2021-05-19','2021-06-19',10,'Austin, TX',620),(3333,345,'CH5323',2,'2020-03-25','2020-04-25',2,'Seattle, WA',400),(4444,345,'CH5323',2,'2020-03-25','2020-04-25',2,'Portland, OR',400),(5555,345,'CH5323',2,'2020-03-25','2020-04-25',2,'San Diego, CA',400),(6666,345,'CH5323',2,'2020-03-25','2020-04-25',2,'Los Angeles, CA',400),(7777,678,'DE2689',3,'2020-02-27','2020-03-29',6,'Seattle, WA',50),(8888,91011,'DA9509',4,'2021-01-04','2021-02-14',0,'Seattle, WA',2530),(9999,1213,'RI2564',5,'2020-05-01','2020-05-01',0,'Palo Alto, CA',1850);
/*!40000 ALTER TABLE `ORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENT`
--

DROP TABLE IF EXISTS `PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAYMENT` (
  `Payment_id` int(11) NOT NULL,
  `Customer_id` varchar(6) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Expiration` date DEFAULT NULL,
  `Verification_code` int(11) DEFAULT NULL,
  `Number` char(16) DEFAULT NULL,
  PRIMARY KEY (`Payment_id`),
  KEY `Customer_id` (`Customer_id`),
  CONSTRAINT `PAYMENT_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENT`
--

LOCK TABLES `PAYMENT` WRITE;
/*!40000 ALTER TABLE `PAYMENT` DISABLE KEYS */;
INSERT INTO `PAYMENT` VALUES (1,'CA1571','VISA','Primary Visa','2023-01-01',367,'4921733189964947'),(2,'CH5323','Discover','My Discover','2023-06-17',879,'6011729671230413'),(3,'DE2689','MasterCard','Best Card','2024-08-25',160,'5163104788871913'),(4,'DA9509','AMEX','American Express','2022-09-14',961,'377578531946655'),(5,'RI2564','Maestro','The Maestro','2023-03-25',314,'5893100970313554'),(6,'SA8426','VISA','Visa #1','2024-02-23',272,'4485691271482566'),(7,'SA8426','VISA','Visa #2','2023-07-14',457,'4532637617978791');
/*!40000 ALTER TABLE `PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT` (
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
  CONSTRAINT `PRODUCT_ibfk_1` FOREIGN KEY (`Manufacturer_id`) REFERENCES `MANUFACTURERS` (`Manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES (123,111,'Mass mailing','electronic device','email marketing','mass market','email',10,'iphone 12 ads'),(345,222,'Online product promotion','beverage','video ads marketing','video ads','Youtube',10,'coca-cola advertisement'),(678,333,'Mass mailing','medical drugs','email marketing','mass market','email',50,'drugs advertisement'),(1213,555,'Video advertisement','chip implants','video commercial','video ads promo','Youtube',1850,'tech human enhancement advertisement'),(1415,666,'Mass mailing','vacuum cleaner','email marketing','targeted ads','email',90,'tech device advertisement'),(91011,444,'Billboards','technology','billboards','targeted market','billboards',2530,'pet chip implant advertisement');
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `PRODUCT_PURCHASES_byCUSTOMERS`
--

DROP TABLE IF EXISTS `PRODUCT_PURCHASES_byCUSTOMERS`;
/*!50001 DROP VIEW IF EXISTS `PRODUCT_PURCHASES_byCUSTOMERS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `PRODUCT_PURCHASES_byCUSTOMERS` (
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
-- Temporary table structure for view `PRODUCT_SUM25_REVENUE200UP`
--

DROP TABLE IF EXISTS `PRODUCT_SUM25_REVENUE200UP`;
/*!50001 DROP VIEW IF EXISTS `PRODUCT_SUM25_REVENUE200UP`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `PRODUCT_SUM25_REVENUE200UP` (
  `Name` tinyint NOT NULL,
  `Type` tinyint NOT NULL,
  `Manufacturer_name` tinyint NOT NULL,
  `Unit_quantity` tinyint NOT NULL,
  `Cost` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `PROMOTION_QUALIFIED`
--

DROP TABLE IF EXISTS `PROMOTION_QUALIFIED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROMOTION_QUALIFIED` (
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
-- Dumping data for table `PROMOTION_QUALIFIED`
--

LOCK TABLES `PROMOTION_QUALIFIED` WRITE;
/*!40000 ALTER TABLE `PROMOTION_QUALIFIED` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROMOTION_QUALIFIED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIPPING`
--

DROP TABLE IF EXISTS `SHIPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHIPPING` (
  `Shipping_id` int(11) NOT NULL,
  `Shipping_type` varchar(50) NOT NULL,
  `Cost` float DEFAULT NULL,
  `Delivery_date` date NOT NULL,
  `Order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Shipping_id`),
  KEY `Order_id` (`Order_id`),
  CONSTRAINT `SHIPPING_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `ORDERS` (`Order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIPPING`
--

LOCK TABLES `SHIPPING` WRITE;
/*!40000 ALTER TABLE `SHIPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHIPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIER_PRODUCT`
--

DROP TABLE IF EXISTS `SUPPLIER_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUPPLIER_PRODUCT` (
  `Supplier_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `Cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`Supplier_id`,`Product_id`),
  KEY `Product_id` (`Product_id`),
  CONSTRAINT `SUPPLIER_PRODUCT_ibfk_1` FOREIGN KEY (`Supplier_id`) REFERENCES `MEDIA_PARTNERS` (`Supplier_id`),
  CONSTRAINT `SUPPLIER_PRODUCT_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `PRODUCT` (`Product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIER_PRODUCT`
--

LOCK TABLES `SUPPLIER_PRODUCT` WRITE;
/*!40000 ALTER TABLE `SUPPLIER_PRODUCT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SUPPLIER_PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ForceAds`
--

USE `ForceAds`;

--
-- Final view structure for view `MASSMARKET_EMAIL`
--

/*!50001 DROP TABLE IF EXISTS `MASSMARKET_EMAIL`*/;
/*!50001 DROP VIEW IF EXISTS `MASSMARKET_EMAIL`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `MASSMARKET_EMAIL` AS select distinct `C`.`Customer_id` AS `Customer_id`,`C`.`fname` AS `fname`,`C`.`lname` AS `lname` from (`ORDERS` `O` join `CUSTOMER` `C`) where `O`.`Product_id` in (select `PRODUCT`.`Product_id` from `PRODUCT` where `PRODUCT`.`Ad_template` = 'mass market' and `PRODUCT`.`Medium` = 'email') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PRODUCT_PURCHASES_byCUSTOMERS`
--

/*!50001 DROP TABLE IF EXISTS `PRODUCT_PURCHASES_byCUSTOMERS`*/;
/*!50001 DROP VIEW IF EXISTS `PRODUCT_PURCHASES_byCUSTOMERS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `PRODUCT_PURCHASES_byCUSTOMERS` AS select `C`.`Customer_id` AS `Customer_id`,`C`.`Company` AS `Company`,`C`.`fname` AS `fname`,`C`.`lname` AS `lname`,`C`.`Phone_number` AS `Phone_number`,`P`.`Product_id` AS `Product_id`,sum(`O`.`Cost`) AS `Total_LastYear` from ((`ORDERS` `O` join `PRODUCT` `P` on(`O`.`Product_id` = `P`.`Product_id`)) join `CUSTOMER` `C` on(`C`.`Customer_id` = `O`.`Customer_id`)) where `O`.`Date_purchased` >= curdate() - 365 group by `P`.`Product_id`,`C`.`Customer_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PRODUCT_SUM25_REVENUE200UP`
--

/*!50001 DROP TABLE IF EXISTS `PRODUCT_SUM25_REVENUE200UP`*/;
/*!50001 DROP VIEW IF EXISTS `PRODUCT_SUM25_REVENUE200UP`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `PRODUCT_SUM25_REVENUE200UP` AS select `PRODUCT`.`Name` AS `Name`,`PRODUCT`.`Type` AS `Type`,`MANUFACTURERS`.`Manufacturer_name` AS `Manufacturer_name`,count(`ORDERS`.`Order_id`) AS `Unit_quantity`,sum(`ORDERS`.`Cost`) AS `Cost` from ((`PRODUCT` join `ORDERS` on(`PRODUCT`.`Product_id` = `ORDERS`.`Product_id`)) join `MANUFACTURERS` on(`MANUFACTURERS`.`Manufacturer_id` = `PRODUCT`.`Manufacturer_id`)) group by `ORDERS`.`Product_id` having count(`ORDERS`.`Order_id`) >= 25 and sum(`ORDERS`.`Cost`) > 200 */;
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

-- Dump completed on 2021-05-11  5:10:02
root@debian:~# 
