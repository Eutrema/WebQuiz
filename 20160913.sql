-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `currentquiz`
--

DROP TABLE IF EXISTS `currentquiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currentquiz` (
  `currentQuizID` int(10) unsigned NOT NULL,
  `quizOwnerID` int(10) unsigned NOT NULL,
  `quizID` int(10) unsigned NOT NULL,
  `quizDeadline` datetime NOT NULL,
  `answerTrue` int(11) NOT NULL,
  `answerFalse` int(11) NOT NULL,
  `quizState` int(11) NOT NULL,
  PRIMARY KEY (`currentQuizID`),
  UNIQUE KEY `currentQuizID_UNIQUE` (`currentQuizID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currentquiz`
--

LOCK TABLES `currentquiz` WRITE;
/*!40000 ALTER TABLE `currentquiz` DISABLE KEYS */;
INSERT INTO `currentquiz` VALUES (190,0,2,'2016-09-13 23:40:44',0,0,1),(198,0,1,'2016-09-13 23:44:44',0,0,1),(408,0,2,'2016-09-13 23:41:44',0,0,1),(476,0,1,'2016-09-13 23:46:45',0,0,1),(509,0,1,'2016-09-13 23:48:45',0,0,1),(545,0,2,'2016-09-13 23:45:46',0,0,1),(631,0,2,'2016-09-13 23:43:44',0,0,1),(696,0,1,'2016-09-13 23:45:44',0,0,1),(706,0,1,'2016-09-13 23:47:45',0,0,1),(718,0,2,'2016-09-13 23:50:45',0,0,0),(780,0,1,'2016-09-13 23:42:44',0,0,1),(816,0,2,'2016-09-13 23:49:45',0,0,1);
/*!40000 ALTER TABLE `currentquiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestanswer`
--

DROP TABLE IF EXISTS `guestanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestanswer` (
  `guestAnswerID` int(11) NOT NULL,
  `guestName` varchar(45) NOT NULL,
  `currentQuizID` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  PRIMARY KEY (`guestAnswerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestanswer`
--

LOCK TABLES `guestanswer` WRITE;
/*!40000 ALTER TABLE `guestanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `guestanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `quizID` int(10) unsigned NOT NULL,
  `quizString` varchar(45) NOT NULL,
  `quizAnswer` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `corrects` int(11) NOT NULL,
  PRIMARY KEY (`quizID`),
  UNIQUE KEY `quizID_UNIQUE` (`quizID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,'テスト問題です<br>答えは○',1,142,113),(2,'テスト問題です<br>答えは×',0,2,1);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-13 23:54:25
