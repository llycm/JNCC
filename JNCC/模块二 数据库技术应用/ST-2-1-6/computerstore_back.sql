-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: computerstore
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
-- Table structure for table `t_category`
--

DROP TABLE IF EXISTS `t_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_category` (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '商品类别编号',
  `category_name` varchar(50) NOT NULL COMMENT '商品类别名称',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_category`
--

LOCK TABLES `t_category` WRITE;
/*!40000 ALTER TABLE `t_category` DISABLE KEYS */;
INSERT INTO `t_category` VALUES (1,'电子产品'),(2,'办公用品'),(3,'生活用品');
/*!40000 ALTER TABLE `t_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_goods`
--

DROP TABLE IF EXISTS `t_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_goods` (
  `goods_id` int NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(6,1) NOT NULL COMMENT '单价',
  `category_id` int NOT NULL COMMENT '商品类别编号',
  PRIMARY KEY (`goods_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `t_goods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`category_id`),
  CONSTRAINT `t_goods_chk_1` CHECK ((`goods_price` between 1 and 1000))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_goods`
--

LOCK TABLES `t_goods` WRITE;
/*!40000 ALTER TABLE `t_goods` DISABLE KEYS */;
INSERT INTO `t_goods` VALUES (1,'笔记本电脑',500.0,1),(2,'打印机',150.0,1),(3,'笔记本',10.0,2),(4,'纸巾',5.0,3);
/*!40000 ALTER TABLE `t_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_storage`
--

DROP TABLE IF EXISTS `t_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_storage` (
  `store_id` int NOT NULL COMMENT '仓库编号',
  `goods_id` int NOT NULL COMMENT '商品编号',
  `store_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '日期',
  `storage_quantity` int NOT NULL COMMENT '库存量',
  `safety_storage_quantity` int NOT NULL DEFAULT '100' COMMENT '安全库存量',
  PRIMARY KEY (`store_id`,`goods_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `t_storage_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `t_store` (`store_id`),
  CONSTRAINT `t_storage_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='库存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_storage`
--

LOCK TABLES `t_storage` WRITE;
/*!40000 ALTER TABLE `t_storage` DISABLE KEYS */;
INSERT INTO `t_storage` VALUES (1,1,'2025-09-10 22:13:27',100,100),(1,2,'2025-09-10 22:13:27',50,100),(2,3,'2019-12-18 00:00:00',200,100),(2,4,'2019-01-05 00:00:00',300,100);
/*!40000 ALTER TABLE `t_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_store`
--

DROP TABLE IF EXISTS `t_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_store` (
  `store_id` int NOT NULL AUTO_INCREMENT COMMENT '仓库编号',
  `store_name` varchar(50) NOT NULL COMMENT '仓库名称',
  `store_leader` varchar(20) NOT NULL COMMENT '负责人',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='仓库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_store`
--

LOCK TABLES `t_store` WRITE;
/*!40000 ALTER TABLE `t_store` DISABLE KEYS */;
INSERT INTO `t_store` VALUES (1,'一号仓库','张三'),(2,'二号仓库','李四');
/*!40000 ALTER TABLE `t_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_low_storage`
--

DROP TABLE IF EXISTS `v_low_storage`;
/*!50001 DROP VIEW IF EXISTS `v_low_storage`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_low_storage` AS SELECT 
 1 AS `goods_name`,
 1 AS `store_leader`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_low_storage`
--

/*!50001 DROP VIEW IF EXISTS `v_low_storage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_low_storage` AS select `g`.`goods_name` AS `goods_name`,`st`.`store_leader` AS `store_leader` from ((`t_storage` `s` join `t_goods` `g` on((`s`.`goods_id` = `g`.`goods_id`))) join `t_store` `st` on((`s`.`store_id` = `st`.`store_id`))) where (`s`.`storage_quantity` < `s`.`safety_storage_quantity`) */;
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

-- Dump completed on 2025-09-10 22:22:51
