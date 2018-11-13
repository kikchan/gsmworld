-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: localhost    Database: gsmworld
-- ------------------------------------------------------
-- Server version	5.7.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `oid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Black'),(2,'White'),(3,'Blue'),(4,'Red'),(5,'Yellow'),(6,'Pink'),(7,'Violet'),(8,'Gray'),(9,'Gold'),(10,'Silver'),(11,'Green'),(12,'Orange');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `oid` int(11) NOT NULL,
  `comment` longtext,
  `model_oid` int(11) DEFAULT NULL,
  `user_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_comment_model` (`model_oid`),
  KEY `fk_comment_user` (`user_oid`),
  CONSTRAINT `fk_comment_model` FOREIGN KEY (`model_oid`) REFERENCES `model` (`oid`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `oid` int(11) NOT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `module_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_group_module` (`module_oid`),
  CONSTRAINT `fk_group_module` FOREIGN KEY (`module_oid`) REFERENCES `module` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'Administrators',1),(2,'Registered users',2);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_module`
--

DROP TABLE IF EXISTS `group_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_module` (
  `group_oid` int(11) NOT NULL,
  `module_oid` int(11) NOT NULL,
  PRIMARY KEY (`group_oid`,`module_oid`),
  KEY `fk_group_module_group` (`group_oid`),
  KEY `fk_group_module_module` (`module_oid`),
  CONSTRAINT `fk_group_module_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`),
  CONSTRAINT `fk_group_module_module` FOREIGN KEY (`module_oid`) REFERENCES `module` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_module`
--

LOCK TABLES `group_module` WRITE;
/*!40000 ALTER TABLE `group_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maker`
--

DROP TABLE IF EXISTS `maker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maker` (
  `oid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `created` longtext,
  `website` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maker`
--

LOCK TABLES `maker` WRITE;
/*!40000 ALTER TABLE `maker` DISABLE KEYS */;
INSERT INTO `maker` VALUES (1,'Apple','United States','1976','https://www.apple.com/','Cupertino en California'),(2,'Samsung','South Korea','1938','https://www.samsung.com/','Samsung Town en ciudad de Seul '),(3,'Nokia','Finland','1865','https://www.nokia.com/','Espoo districto de Keilaniemi'),(4,'Sony','Japan','1946','https://www.sony.com/','Minato en Tokio'),(5,'LG','South Korea','1958','https://www.lg.com/','Seúl'),(6,'HTC','Taiwan','1997','https://www.htc.com/','Taoyuan en Taiwán'),(7,'Motorola','United States','1928','https://www.motorola.com','Schaumburg en Illinois'),(8,'Huawei','China','1987','https://www.huawei.com/','Longgang en Shenzhen'),(9,'Microsoft','United States','1975','https://www.microsoft.com/','Redmond en Washington'),(10,'Lenovo','China','1984','https://www.lenovo.com/','Distrito Haidian de Pekín'),(11,'Xiaomi','China','2010','https://www.mi.com/','Pekín'),(12,'Google','United States','1998','https://www.google.com/','Mountain ViewCalifornia'),(13,'Hacer','Taiwan','1976','https://www.acer.com/','Taipéi'),(14,'Asus','Taiwan','1989','https://www.asus.com/','Taipéi'),(15,'Oppo','China','2001','https://www.oppo.com/','Mountain View'),(16,'OnePlus','China','2013','https://www.oneplus.com/','Shenzhen'),(17,'Meizu','China','2003','https://www.meizu.com/','Zhuhai'),(18,'Blackberry','Canada','1999','https://www.blackberry.com/','Waterloo en Ontario'),(19,'Alcatel','France','2004','https://www.alcatelmobile.com/','Paris en 54 rue la Boetie'),(20,'ZTE','China','1985','https://www.zte.com/','Shenzhen'),(21,'Wiko','France','2011','https://www.world.wikomobile.com/','Marsella');
/*!40000 ALTER TABLE `maker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `oid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `sim` varchar(255) DEFAULT NULL,
  `main_camera` varchar(255) DEFAULT NULL,
  `secondary_camera` varchar(255) DEFAULT NULL,
  `battery` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `cardslot` varchar(255) DEFAULT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `rom_oid_2` int(11) DEFAULT NULL,
  `ram_oid_2` int(11) DEFAULT NULL,
  `color_oid_2` int(11) DEFAULT NULL,
  `user_oid` int(11) DEFAULT NULL,
  `maker_oid_2` int(11) DEFAULT NULL,
  `screen_oid_2` int(11) DEFAULT NULL,
  `os_oid_2` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_model_rom` (`rom_oid_2`),
  KEY `fk_model_ram` (`ram_oid_2`),
  KEY `fk_model_color` (`color_oid_2`),
  KEY `fk_model_user` (`user_oid`),
  KEY `fk_model_maker` (`maker_oid_2`),
  KEY `fk_model_screen` (`screen_oid_2`),
  KEY `fk_model_os` (`os_oid_2`),
  CONSTRAINT `fk_model_color` FOREIGN KEY (`color_oid_2`) REFERENCES `color` (`oid`),
  CONSTRAINT `fk_model_maker` FOREIGN KEY (`maker_oid_2`) REFERENCES `maker` (`oid`),
  CONSTRAINT `fk_model_os` FOREIGN KEY (`os_oid_2`) REFERENCES `os` (`oid`),
  CONSTRAINT `fk_model_ram` FOREIGN KEY (`ram_oid_2`) REFERENCES `ram` (`oid`),
  CONSTRAINT `fk_model_rom` FOREIGN KEY (`rom_oid_2`) REFERENCES `rom` (`oid`),
  CONSTRAINT `fk_model_screen` FOREIGN KEY (`screen_oid_2`) REFERENCES `screen` (`oid`),
  CONSTRAINT `fk_model_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,'One','333 €','abr-14','162 g','1','13 Mp','5 MP','3100 mAh','upload/ent2/1/oneplus-one-02.jpg','1','Snapdragon 801 4 nucleos 2.5 GhZ',17,13,1,NULL,16,2,8),(2,'Pocophone F1','300 €','ago-18','182 g','Doble nano-SIM','12 mpx','5 mpx','4000 mAh','upload/ent2/2/Poco-F1-product-page-3.jpg','Yes','Snapdragon 845 Octa-Core: 2 x 2,8GHz Quad-Core + 2x 1,8 GHz Quad-Core',17,15,2,NULL,11,5,11),(3,'Nexus 5','135 €','nov-13','130 g','micro-SIM','9 mpx','1,3 mpx','2300 mAh','upload/ent2/2/Nexus_5_(1).jpg','No','Snapdragon 800 4 nucleos 2,3',16,12,3,NULL,5,6,7),(4,'iPhone 7 Plus','909 €','sep-16','188 g','nano-SIM','12 MP, f/1.8, 28mm (wide), 1/3\", OIS, PDAF 12 MP, f/2.8, 56mm (telephoto), 1/3.6\", 2x optical zoom, AF','7 MP, f/2.2, 32mm (standard)','2880 mAh','upload/ent2/1/iphone7_1.jpg','No','Quad-core 2.34 GHz (2x Hurricane + 2x Zephyr)',16,13,6,NULL,1,2,22);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `model_averagerating_view`
--

DROP TABLE IF EXISTS `model_averagerating_view`;
/*!50001 DROP VIEW IF EXISTS `model_averagerating_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `model_averagerating_view` AS SELECT 
 1 AS `oid`,
 1 AS `der_attr`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `oid` int(11) NOT NULL,
  `moduleid` varchar(255) DEFAULT NULL,
  `modulename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'sv2','Admin'),(2,'sv4','Private');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os`
--

DROP TABLE IF EXISTS `os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `os` (
  `oid` int(11) NOT NULL,
  `nameandversion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os`
--

LOCK TABLES `os` WRITE;
/*!40000 ALTER TABLE `os` DISABLE KEYS */;
INSERT INTO `os` VALUES (1,'Android 1.0 '),(2,'Android 2.0 Eclair'),(3,'Android 3.0 Honeycomb'),(4,'Android 4.0 Ice Cream Sandwich'),(5,'Android 4.1 Jelly Bean'),(6,'Android 4.4 Kit Kat'),(7,'Android 5.0 Lollipop'),(8,'Android 6.0 Marshmallow'),(9,'Android 7.0 Nougat'),(10,'Android 8.0 Oreo'),(11,'Android 9.0 Pie'),(12,'Android one'),(13,'iPhone OS 1'),(14,'iPhone OS 2'),(15,'iPhone OS 3'),(16,'iOS 4'),(17,'iOS 5'),(18,'iOS 6'),(19,'iOS 7'),(20,'iOS 8'),(21,'iOS 9'),(22,'iOS 10'),(23,'iOS 11'),(24,'iOS 12'),(25,'Symbian OS 6.0'),(26,'Symbian OS 7.0'),(27,'Symbian OS 8.0'),(28,'Symbian OS 8.1'),(29,'Symbian OS 9.0'),(30,'Symbian OS 9.1'),(31,'Symbian OS 9.2'),(32,'Symbian OS 9.3'),(33,'Symbian OS 9.4'),(34,'Symbian 2'),(35,'Symbian 3 (Symbian 9.5)'),(36,'Nokia Belle (Symbian OS 10.1)'),(37,'Windows CE'),(38,'Windows Mobile 2003'),(39,'Windows Mobile 2003 SE'),(40,'Windows Mobile 5'),(41,'Windows Mobile 6'),(42,'Windows Mobile 6.1'),(43,'Windows Mobile 6.5'),(44,'Windows Phone 7'),(45,'Windows Phone 7.5'),(46,'Windows Phone 7.8'),(47,'Windows Phone 8'),(48,'Windows Phone 8.1'),(49,'Windows 10 Mobile');
/*!40000 ALTER TABLE `os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ram`
--

DROP TABLE IF EXISTS `ram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ram` (
  `oid` int(11) NOT NULL,
  `cuantity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ram`
--

LOCK TABLES `ram` WRITE;
/*!40000 ALTER TABLE `ram` DISABLE KEYS */;
INSERT INTO `ram` VALUES (1,'1 Mb'),(2,'2 Mb'),(3,'4 Mb'),(4,'8 Mb'),(5,'16 Mb'),(6,'32 Mb'),(7,'64 Mb'),(8,'128 Mb'),(9,'256 Mb'),(10,'512 Mb'),(11,'1 Gb'),(12,'2 Gb'),(13,'3 Gb'),(14,'4 Gb'),(15,'6 Gb'),(16,'8 Gb'),(17,'10 Gb'),(18,'12 Gb'),(19,'16 Gb'),(20,'32 Gb');
/*!40000 ALTER TABLE `ram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `oid` int(11) NOT NULL,
  `rating` double DEFAULT NULL,
  `model_oid` int(11) DEFAULT NULL,
  `user_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_rating_model` (`model_oid`),
  KEY `fk_rating_user` (`user_oid`),
  CONSTRAINT `fk_rating_model` FOREIGN KEY (`model_oid`) REFERENCES `model` (`oid`),
  CONSTRAINT `fk_rating_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rom`
--

DROP TABLE IF EXISTS `rom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rom` (
  `oid` int(11) NOT NULL,
  `cuantity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rom`
--

LOCK TABLES `rom` WRITE;
/*!40000 ALTER TABLE `rom` DISABLE KEYS */;
INSERT INTO `rom` VALUES (1,'1 Mb'),(2,'2 Mb'),(3,'4 Mb'),(4,'8 Mb'),(5,'16 Mb'),(6,'32 Mb'),(7,'64 Mb'),(8,'128 Mb'),(9,'256 Mb'),(10,'512 Mb'),(11,'1 Gb'),(12,'2 Gb'),(13,'4 Gb'),(14,'8 Gb'),(15,'16 Gb'),(16,'32 Gb'),(17,'64 Gb'),(18,'128 Gb'),(19,'256 Gb'),(20,'512 Gb'),(21,'1 Tb'),(22,'2 Tb'),(23,'1Kb');
/*!40000 ALTER TABLE `rom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen`
--

DROP TABLE IF EXISTS `screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen` (
  `oid` int(11) NOT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen`
--

LOCK TABLES `screen` WRITE;
/*!40000 ALTER TABLE `screen` DISABLE KEYS */;
INSERT INTO `screen` VALUES (1,'640x1136','4.0\"'),(2,'1080x1920','5.5\"'),(3,'720x1280','5.0\"'),(4,'86x48','1.5\"'),(5,'1080x2246','6.18\"'),(6,'1080x1920','4.95\"'),(7,'2468x1242','6.5\"'),(8,'768x1280','4.5\"'),(9,'240x320','3.2\"'),(10,'320x240','2.46\"'),(11,'1440x2960','6.4\"');
/*!40000 ALTER TABLE `screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `oid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `group_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_user_group` (`group_oid`),
  CONSTRAINT `fk_user_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kiril','123','kvg1@alu.ua.es',1),(2,'jaime','456','jaime@ua.es',2),(3,'adrian','123','amr139@alu.ua.es',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_oid` int(11) NOT NULL,
  `group_oid` int(11) NOT NULL,
  PRIMARY KEY (`user_oid`,`group_oid`),
  KEY `fk_user_group_user` (`user_oid`),
  KEY `fk_user_group_group` (`group_oid`),
  CONSTRAINT `fk_user_group_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`),
  CONSTRAINT `fk_user_group_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `model_averagerating_view`
--

/*!50001 DROP VIEW IF EXISTS `model_averagerating_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `model_averagerating_view` AS select `al1`.`oid` AS `oid`,avg(`al2`.`rating`) AS `der_attr` from (`model` `al1` left join `rating` `al2` on((`al1`.`oid` = `al2`.`model_oid`))) group by `al1`.`oid` */;
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

-- Dump completed on 2018-11-13 14:09:47
