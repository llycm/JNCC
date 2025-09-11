-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: customercredit
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
-- Table structure for table `t_cust_credit_level`
--

DROP TABLE IF EXISTS `t_cust_credit_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cust_credit_level` (
  `cust_id` int NOT NULL COMMENT '客户编号',
  `credit_level` tinyint NOT NULL COMMENT '信用级别',
  `begin_date` datetime NOT NULL COMMENT '评级有效起始日期',
  `end_date` datetime NOT NULL COMMENT '评级有效终止日期',
  PRIMARY KEY (`cust_id`),
  CONSTRAINT `fk_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `t_customer_info` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户信用等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cust_credit_level`
--

LOCK TABLES `t_cust_credit_level` WRITE;
/*!40000 ALTER TABLE `t_cust_credit_level` DISABLE KEYS */;
INSERT INTO `t_cust_credit_level` VALUES (1,5,'2023-01-01 00:00:00','2023-12-31 00:00:00'),(2,4,'2023-02-01 00:00:00','2024-01-31 00:00:00'),(3,3,'2023-03-01 00:00:00','2024-02-28 00:00:00');
/*!40000 ALTER TABLE `t_cust_credit_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_customer_info`
--

DROP TABLE IF EXISTS `t_customer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_customer_info` (
  `cust_id` int NOT NULL AUTO_INCREMENT COMMENT '客户编号',
  `cust_name` varchar(50) NOT NULL COMMENT '客户名称',
  `legal_name` varchar(10) NOT NULL COMMENT '法人代表',
  `reg_address` varchar(60) NOT NULL COMMENT '注册地址',
  `post_code` char(6) NOT NULL COMMENT '邮政编码',
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_customer_info`
--

LOCK TABLES `t_customer_info` WRITE;
/*!40000 ALTER TABLE `t_customer_info` DISABLE KEYS */;
INSERT INTO `t_customer_info` VALUES (1,'爷公司','张三','北京市朝阳区','100000'),(2,'父公司','李四','上海市浦东新区','200000'),(3,'子公司','王五','广州市天河区','510000');
/*!40000 ALTER TABLE `t_customer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_his_cust_credit_level`
--

DROP TABLE IF EXISTS `t_his_cust_credit_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_his_cust_credit_level` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '序号',
  `cust_id` int NOT NULL COMMENT '客户编号',
  `credit_level` tinyint NOT NULL COMMENT '信用级别',
  `begin_date` datetime NOT NULL COMMENT '评级有效起始日期',
  `end_date` datetime NOT NULL COMMENT '评级有效终止日期',
  PRIMARY KEY (`id`),
  KEY `fk_his_cust_id` (`cust_id`),
  CONSTRAINT `fk_his_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `t_customer_info` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户信用等级历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_his_cust_credit_level`
--

LOCK TABLES `t_his_cust_credit_level` WRITE;
/*!40000 ALTER TABLE `t_his_cust_credit_level` DISABLE KEYS */;
INSERT INTO `t_his_cust_credit_level` VALUES (1,1,4,'2022-01-01 00:00:00','2022-12-31 00:00:00'),(2,2,3,'2022-02-01 00:00:00','2023-01-31 00:00:00'),(3,3,2,'2022-03-01 00:00:00','2023-02-28 00:00:00');
/*!40000 ALTER TABLE `t_his_cust_credit_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_his_cust_credit_level`
--

DROP TABLE IF EXISTS `v_his_cust_credit_level`;
/*!50001 DROP VIEW IF EXISTS `v_his_cust_credit_level`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_his_cust_credit_level` AS SELECT 
 1 AS `客户名称`,
 1 AS `信用级别`,
 1 AS `评级有效起始日期`,
 1 AS `评级有效中止日期`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_his_cust_credit_level`
--

/*!50001 DROP VIEW IF EXISTS `v_his_cust_credit_level`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_his_cust_credit_level` AS select `tci`.`cust_name` AS `客户名称`,`thcl`.`credit_level` AS `信用级别`,`thcl`.`begin_date` AS `评级有效起始日期`,`thcl`.`end_date` AS `评级有效中止日期` from (`t_his_cust_credit_level` `thcl` join `t_customer_info` `tci` on((`thcl`.`cust_id` = `tci`.`cust_id`))) */;
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

-- Dump completed on 2025-09-10 19:16:40
