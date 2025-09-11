-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: scoremanage
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
-- Table structure for table `t_course_info`
--

DROP TABLE IF EXISTS `t_course_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_course_info` (
  `course_no` int NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `course_name` varchar(10) NOT NULL COMMENT '课程名',
  `credit` tinyint NOT NULL COMMENT '学分',
  `classhour` tinyint NOT NULL COMMENT '学时',
  PRIMARY KEY (`course_no`),
  CONSTRAINT `t_course_info_chk_1` CHECK (((`credit` >= 1) and (`classhour` >= 1)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='课程信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course_info`
--

LOCK TABLES `t_course_info` WRITE;
/*!40000 ALTER TABLE `t_course_info` DISABLE KEYS */;
INSERT INTO `t_course_info` VALUES (1,'数学',4,64),(2,'英语',3,48),(3,'计算机基础',3,48),(4,'数据结构',4,48);
/*!40000 ALTER TABLE `t_course_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_student_info`
--

DROP TABLE IF EXISTS `t_student_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_student_info` (
  `student_no` int NOT NULL AUTO_INCREMENT COMMENT '学号',
  `student_name` varchar(10) NOT NULL COMMENT '姓名',
  `sex` enum('男','女') NOT NULL COMMENT '性别',
  `birth` datetime NOT NULL COMMENT '出生年月',
  `enter_date` datetime NOT NULL COMMENT '入学年份',
  PRIMARY KEY (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student_info`
--

LOCK TABLES `t_student_info` WRITE;
/*!40000 ALTER TABLE `t_student_info` DISABLE KEYS */;
INSERT INTO `t_student_info` VALUES (2,'李四','女','2001-03-15 00:00:00','2019-09-01 00:00:00'),(3,'王五','男','2000-11-20 00:00:00','2018-09-01 00:00:00');
/*!40000 ALTER TABLE `t_student_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_student_score`
--

DROP TABLE IF EXISTS `t_student_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_student_score` (
  `student_no` int NOT NULL COMMENT '学号',
  `course_no` int NOT NULL COMMENT '课程编号',
  `ordinary_scores` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '平时成绩',
  `end_scores` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '期末成绩',
  `total_scores` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '总评成绩',
  PRIMARY KEY (`student_no`,`course_no`),
  KEY `course_no` (`course_no`),
  CONSTRAINT `t_student_score_ibfk_1` FOREIGN KEY (`student_no`) REFERENCES `t_student_info` (`student_no`) ON DELETE CASCADE,
  CONSTRAINT `t_student_score_ibfk_2` FOREIGN KEY (`course_no`) REFERENCES `t_course_info` (`course_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='成绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student_score`
--

LOCK TABLES `t_student_score` WRITE;
/*!40000 ALTER TABLE `t_student_score` DISABLE KEYS */;
INSERT INTO `t_student_score` VALUES (2,1,90.00,92.00,91.00),(2,3,88.00,90.00,89.00),(3,2,70.00,75.00,72.50),(3,3,85.00,88.00,86.50),(3,4,95.00,98.00,96.50);
/*!40000 ALTER TABLE `t_student_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_student_score_info`
--

DROP TABLE IF EXISTS `v_student_score_info`;
/*!50001 DROP VIEW IF EXISTS `v_student_score_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_student_score_info` AS SELECT 
 1 AS `学号`,
 1 AS `姓名`,
 1 AS `课程名`,
 1 AS `总评成绩`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_student_score_info`
--

/*!50001 DROP VIEW IF EXISTS `v_student_score_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_student_score_info` AS select `s`.`student_no` AS `学号`,`s`.`student_name` AS `姓名`,`c`.`course_name` AS `课程名`,`ss`.`total_scores` AS `总评成绩` from ((`t_student_score` `ss` join `t_student_info` `s` on((`ss`.`student_no` = `s`.`student_no`))) join `t_course_info` `c` on((`ss`.`course_no` = `c`.`course_no`))) */;
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

-- Dump completed on 2025-09-10 21:56:42
