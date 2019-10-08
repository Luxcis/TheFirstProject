-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: recruitdb
-- ------------------------------------------------------
-- Server version	10.4.8-MariaDB

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `companyname` varchar(50) NOT NULL,
  `addr` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyname` (`companyname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_msg`
--

DROP TABLE IF EXISTS `cv_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_msg` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) NOT NULL COMMENT '用户id',
  `name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `addr` varchar(50) NOT NULL,
  `speciality` text NOT NULL COMMENT '所学专业',
  `skill` text NOT NULL COMMENT '掌握技能',
  `position` text NOT NULL COMMENT '职位意向',
  `profile` text NOT NULL COMMENT '个人简介',
  `salary` int(50) NOT NULL COMMENT '薪资意向',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cv_msg_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='简历信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_msg`
--

LOCK TABLES `cv_msg` WRITE;
/*!40000 ALTER TABLE `cv_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `received_cv`
--

DROP TABLE IF EXISTS `received_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `received_cv` (
  `com_id` int(50) NOT NULL,
  `cv_id` int(50) NOT NULL,
  PRIMARY KEY (`com_id`,`cv_id`),
  KEY `cv_id` (`cv_id`),
  CONSTRAINT `received_cv_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `company` (`id`),
  CONSTRAINT `received_cv_ibfk_2` FOREIGN KEY (`cv_id`) REFERENCES `cv_msg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司所收到的简历 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `received_cv`
--

LOCK TABLES `received_cv` WRITE;
/*!40000 ALTER TABLE `received_cv` DISABLE KEYS */;
/*!40000 ALTER TABLE `received_cv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit_msg`
--

DROP TABLE IF EXISTS `recruit_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruit_msg` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `com_id` int(50) NOT NULL COMMENT '公司id',
  `position_name` varchar(50) NOT NULL COMMENT '职位名称',
  `qualification` varchar(50) NOT NULL COMMENT '学历要求',
  `skill` varchar(100) NOT NULL COMMENT '技能需求',
  `max_age` int(50) NOT NULL,
  `min_age` int(50) NOT NULL,
  `max_sal` int(50) NOT NULL,
  `min_sal` int(50) NOT NULL,
  `position_msg` text NOT NULL COMMENT '职位简介',
  PRIMARY KEY (`id`),
  KEY `com_id` (`com_id`),
  CONSTRAINT `recruit_msg_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招聘简章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit_msg`
--

LOCK TABLES `recruit_msg` WRITE;
/*!40000 ALTER TABLE `recruit_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruit_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-07 21:05:17
