-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: educationmanage
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
-- Table structure for table `t_education`
--

DROP TABLE IF EXISTS `t_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_education` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '序号',
  `emp_no` int NOT NULL COMMENT '员工编号',
  `degree` varchar(10) NOT NULL COMMENT '学历',
  `major` varchar(40) NOT NULL COMMENT '专业',
  `register_time` datetime NOT NULL COMMENT '入学时间',
  `length_schooling` tinyint NOT NULL COMMENT '学制',
  PRIMARY KEY (`id`),
  KEY `emp_no` (`emp_no`),
  CONSTRAINT `t_education_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `t_employee` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学历表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_education`
--

LOCK TABLES `t_education` WRITE;
/*!40000 ALTER TABLE `t_education` DISABLE KEYS */;
INSERT INTO `t_education` VALUES (1,1,'大学本科','计算机科学','2010-09-01 00:00:00',4),(2,2,'硕士','软件工程','2014-09-01 00:00:00',3),(3,1,'硕士','数据科学','2018-09-01 00:00:00',2),(4,3,'大专','计算机软件','2023-05-01 00:00:00',3),(5,4,'博士','软件工程','2000-01-01 00:00:00',2),(6,4,'大学本科','软件工程','1990-01-01 00:00:00',2);
/*!40000 ALTER TABLE `t_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_employee`
--

DROP TABLE IF EXISTS `t_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_employee` (
  `emp_no` int NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `emp_name` varchar(10) NOT NULL COMMENT '姓名',
  `id_card` varchar(20) NOT NULL COMMENT '身份证号',
  `emp_age` int NOT NULL COMMENT '年龄',
  `emp_birthday` datetime NOT NULL COMMENT '出生日期',
  PRIMARY KEY (`emp_no`),
  UNIQUE KEY `id_card` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_employee`
--

LOCK TABLES `t_employee` WRITE;
/*!40000 ALTER TABLE `t_employee` DISABLE KEYS */;
INSERT INTO `t_employee` VALUES (1,'王三','123456199001011234',34,'1990-01-01 00:00:00'),(2,'李四','123456199102021235',33,'1991-02-02 00:00:00'),(3,'王五','123456199203031236',32,'1992-03-03 00:00:00'),(4,'王老头','123456920303123619',61,'1992-03-03 00:00:00');
/*!40000 ALTER TABLE `t_employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-10 21:42:57
