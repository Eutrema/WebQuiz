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
INSERT INTO `quiz` VALUES (1,'テスト問題です<br>答えは○',1,146,115),(2,'テスト問題です<br>答えは×',2,5,3);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizowner`
--

DROP TABLE IF EXISTS `quizowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizowner` (
  `quizOwnerID` int(11) NOT NULL,
  `quizOwnerName` varchar(45) NOT NULL,
  PRIMARY KEY (`quizOwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizowner`
--

LOCK TABLES `quizowner` WRITE;
/*!40000 ALTER TABLE `quizowner` DISABLE KEYS */;
INSERT INTO `quizowner` VALUES (0,'Server');
/*!40000 ALTER TABLE `quizowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `teacherID` int(11) NOT NULL,
  `teacherPassword` varchar(45) NOT NULL,
  `teacherName` varchar(45) NOT NULL,
  PRIMARY KEY (`teacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'aaaa','test');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-26 11:53:05
