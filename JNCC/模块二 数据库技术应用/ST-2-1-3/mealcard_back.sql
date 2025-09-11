-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mealcard
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_add_money`
--

DROP TABLE IF EXISTS `t_add_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_add_money` (
  `add_id` int NOT NULL AUTO_INCREMENT COMMENT '充值编号',
  `card_id` int NOT NULL COMMENT '饭卡编号',
  `add_money` decimal(10,1) NOT NULL COMMENT '本次充值金额',
  `add_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '充值时间',
  PRIMARY KEY (`add_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `t_add_money_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `t_card` (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='充值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_add_money`
--

LOCK TABLES `t_add_money` WRITE;
/*!40000 ALTER TABLE `t_add_money` DISABLE KEYS */;
INSERT INTO `t_add_money` VALUES (1,1,100.0,'2025-09-10 19:54:48'),(2,2,200.0,'2025-09-10 19:54:48'),(3,1,50.0,'2025-09-10 19:54:48'),(4,3,1000.0,'2021-04-05 00:00:00'),(5,1,10.0,'2021-04-05 00:00:00');
/*!40000 ALTER TABLE `t_add_money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_card`
--

DROP TABLE IF EXISTS `t_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_card` (
  `card_id` int NOT NULL AUTO_INCREMENT COMMENT '饭卡编号',
  `student_id` int NOT NULL COMMENT '学生学号',
  `student_name` varchar(10) NOT NULL COMMENT '学生姓名',
  `curr_money` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '饭卡余额',
  `register_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '饭卡生成时间',
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='就餐卡（饭卡）表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_card`
--

LOCK TABLES `t_card` WRITE;
/*!40000 ALTER TABLE `t_card` DISABLE KEYS */;
INSERT INTO `t_card` VALUES (1,1001,'张三',0.0,'2025-09-10 19:54:48'),(2,1002,'李四',0.0,'2025-09-10 19:54:48'),(3,1003,'王五',0.0,'2025-09-10 19:54:48');
/*!40000 ALTER TABLE `t_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_consume_money`
--

DROP TABLE IF EXISTS `t_consume_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_consume_money` (
  `consume_id` int NOT NULL AUTO_INCREMENT COMMENT '消费编号',
  `card_id` int NOT NULL COMMENT '饭卡编号',
  `consume_money` decimal(10,1) NOT NULL COMMENT '本次消费金额',
  `consume_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消费时间',
  PRIMARY KEY (`consume_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `t_consume_money_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `t_card` (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='消费表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_consume_money`
--

LOCK TABLES `t_consume_money` WRITE;
/*!40000 ALTER TABLE `t_consume_money` DISABLE KEYS */;
INSERT INTO `t_consume_money` VALUES (2,2,40.0,'2020-02-06 00:00:00'),(3,3,20.0,'2018-09-10 00:00:00'),(5,3,80.0,'2025-09-10 19:54:48');
/*!40000 ALTER TABLE `t_consume_money` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-10 19:55:32
