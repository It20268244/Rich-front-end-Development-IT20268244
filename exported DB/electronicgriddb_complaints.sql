-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: electronicgriddb
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `complaintID` int NOT NULL AUTO_INCREMENT,
  `AccNo` char(10) DEFAULT NULL,
  `complaintType` varchar(20) DEFAULT NULL,
  `contactNo` char(11) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT (now()),
  `replyMessage` varchar(100) DEFAULT 'Not replied',
  `status` varchar(20) DEFAULT 'pending',
  PRIMARY KEY (`complaintID`),
  KEY `AccNo` (`AccNo`),
  CONSTRAINT `AccNo` FOREIGN KEY (`AccNo`) REFERENCES `account` (`AccNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (1,'1234567895','Supplied+fail+','0778989657','there%2Bis%2Bno%2Bpower%2Bfor%2Bour%2Barea%2Bfor%2Bmore%2Bthan%2B5h%2Bnow','2022-04-23 14:05:20','Resolved+by+our+team','replied'),(14,'1234567895','breakdownnn','0778989654','breakdown%2Bof%2Bthe%2Belectricity%2Bline','2022-05-04 23:16:02','Not%2Breplied','pending'),(15,'1234567895','High%2Bvoltage','0778989654','There%2Bis%2Ba%2Bissue%2Bwith%2Bthe%2Bmeter%2Bbox','2022-05-05 07:29:11','Not%2Breplied','pending');
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15  0:25:32
