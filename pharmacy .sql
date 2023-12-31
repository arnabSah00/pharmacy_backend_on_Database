-- MySQL dump 10.13  Distrib 5.7.24, for osx10.9 (x86_64)
--
-- Host: localhost    Database: pharmacy
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone_no` bigint NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `account_number` bigint DEFAULT NULL,
  `IFSC_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Krypton',NULL,9932333757,'arnabsahoo358@gmail.com',9932333757,'AIRP0000001');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `phone_no` bigint DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Arnab Sahoo',NULL,9932333757,NULL,'sparrow','Arnab@sparrow');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_card`
--

DROP TABLE IF EXISTS `customer_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_card` (
  `CID` int NOT NULL,
  `number` varchar(20) NOT NULL,
  `CVV` int NOT NULL,
  `valid_form` date DEFAULT NULL,
  `upto` date DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `CID` (`CID`),
  CONSTRAINT `customer_card_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_card`
--

LOCK TABLES `customer_card` WRITE;
/*!40000 ALTER TABLE `customer_card` DISABLE KEYS */;
INSERT INTO `customer_card` VALUES (1,'0000000000000001',100,'2023-10-29','2030-12-31');
/*!40000 ALTER TABLE `customer_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EID` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `post_in_company` varchar(50) DEFAULT NULL,
  `phone_no` bigint DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `salary` bigint DEFAULT NULL,
  `account_number` bigint NOT NULL,
  `IFSC_code` varchar(50) NOT NULL,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Arnab Sahoo','Admin',9932333757,'arnabsahoo358@gmail.com',NULL,9932333757,' AIRP0000001');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacture`
--

DROP TABLE IF EXISTS `manufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacture` (
  `MID` int NOT NULL,
  `EID` int DEFAULT NULL,
  KEY `MID` (`MID`),
  KEY `EID` (`EID`),
  CONSTRAINT `manufacture_ibfk_1` FOREIGN KEY (`MID`) REFERENCES `medicine` (`MID`),
  CONSTRAINT `manufacture_ibfk_2` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacture`
--

LOCK TABLES `manufacture` WRITE;
/*!40000 ALTER TABLE `manufacture` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine` (
  `MID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `exp_date` date DEFAULT NULL,
  `cost_per_unit` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `composition` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'fluconazole','2024-09-17',300,10,'fluconazole 1% w/v'),(2,'thyrox 50','2024-12-30',123,10,'thyroxine sodium tablets IP'),(3,'thyrox 75','2023-11-11',150,3,'thyroxine sodium tablets IP'),(4,'thyrox 100','2029-11-11',175,4,'thyroxine sodium tablets IP'),(5,'demo','2023-10-24',100,1,''),(6,'Panadol.','2023-11-11',140,NULL,'Acetaminophen'),(7,'demo','2023-11-10',22,22,'demo'),(8,'demo',NULL,NULL,NULL,NULL),(9,'arnab',NULL,NULL,NULL,NULL),(10,'Acetaminophen','2025-12-30',14,12,'Acetylsalicylic acid'),(11,'Xanax','2024-03-21',NULL,19,'Alprazolam'),(12,'Azithromycin tab','2023-11-11',NULL,NULL,'Azithromycin'),(13,'adam',NULL,NULL,NULL,NULL),(14,'ava',NULL,NULL,NULL,NULL),(15,'lulimac','2023-11-11',300,1,'luliconazole 1% w/v'),(16,'oreo','2024-05-17',30,100,'oreo'),(17,'Abecma','2024-01-12',NULL,1,'idecabtagene vicleucel');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_from_company`
--

DROP TABLE IF EXISTS `purchase_from_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_from_company` (
  `PID` int NOT NULL,
  `MID` int NOT NULL,
  `companyID` int NOT NULL,
  `P_count` int NOT NULL,
  `bill_amount` int DEFAULT NULL,
  `O_date` date DEFAULT NULL,
  `O_time` time DEFAULT NULL,
  `D_date` date DEFAULT NULL,
  `D_time` time DEFAULT NULL,
  PRIMARY KEY (`PID`),
  KEY `companyID` (`companyID`),
  KEY `MID` (`MID`),
  CONSTRAINT `purchase_from_company_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `company` (`company_id`),
  CONSTRAINT `purchase_from_company_ibfk_2` FOREIGN KEY (`MID`) REFERENCES `medicine` (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_from_company`
--

LOCK TABLES `purchase_from_company` WRITE;
/*!40000 ALTER TABLE `purchase_from_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_from_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `TID` int NOT NULL,
  `CID` int DEFAULT NULL,
  `MID` int NOT NULL,
  `EID` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `O_date` date DEFAULT NULL,
  `O_time` time DEFAULT NULL,
  `D_date` date DEFAULT NULL,
  `D_time` time DEFAULT NULL,
  PRIMARY KEY (`TID`),
  KEY `MID` (`MID`),
  KEY `EID` (`EID`),
  KEY `CID` (`CID`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`MID`) REFERENCES `medicine` (`MID`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-09 18:42:52
