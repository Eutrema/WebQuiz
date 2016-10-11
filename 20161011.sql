-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
INSERT INTO `currentquiz` VALUES (213,0,20,'2016-10-11 18:35:04',0,0,0),(261,0,29,'2016-10-11 18:27:04',0,0,1),(313,0,10,'2016-10-11 18:25:04',0,0,1),(315,0,19,'2016-10-11 18:28:04',0,0,1),(344,0,27,'2016-10-11 18:32:04',0,0,1),(526,0,12,'2016-10-11 18:33:04',0,0,1),(569,0,21,'2016-10-11 18:31:04',0,0,1),(719,0,9,'2016-10-11 18:30:04',0,0,1),(751,0,1,'2016-10-11 18:26:04',0,0,1),(847,0,19,'2016-10-11 18:34:04',0,0,1),(888,0,22,'2016-10-11 18:29:04',0,0,1);
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
  `answerword` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`quizID`),
  UNIQUE KEY `quizID_UNIQUE` (`quizID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,'テスト問題です<br>答えは○',1,156,122,'○'),(2,'テスト問題です<br>答えは×',2,6,4,'×'),(3,'千円札に描かれている人物は野口英世である',1,1,1,'野口英世'),(4,'一万円札に描かれている人物は野口英世である',2,0,0,'福沢諭吉'),(5,'三角形の内角の和は180度である',1,0,0,'180度'),(6,'一番面積が小さい都道府県は香川県である',1,0,0,'香川県'),(7,'世界で一番多い血液型はA型である',2,1,1,'O型'),(8,'ゴールデンウィークの一番最初にやってくる祝日はこどもの日である',2,1,1,'憲法記念日'),(9,'ドイツの首都はロンドンである',2,1,0,'ベルリン'),(10,'イギリスの首都はロンドンである',1,1,1,'ロンドン'),(12,'千は0が3つ、億は0が8つ、兆は0が12個である',1,2,1,'12個'),(13,'アクアリウムとは水族館のことである',1,0,0,'水族館'),(14,'複数の作業を同時に実行することをマルチチャンネルという',2,2,1,'マルチタスク'),(15,'パソコンに接続した周辺機器を動かすためのソフトはアプリケーションソフトである',2,0,0,'ドライバ'),(16,'ホームページを閲覧するためのソフトはブラウザである',1,2,2,'ブラウザ'),(17,'CPUの性能を表すMhzとは100万Hzである',1,1,0,'100万Hz'),(18,'1バイトは8ビットである',1,0,0,'8ビット'),(19,'プログラムミスのことをエラーという',2,0,0,'バグ'),(20,'バグを修正することをデバッグという',1,0,0,'デバッグ'),(21,'受信者の意向に関係なく無差別に大量に一括して送信されるメッセージのことをスパムメールという',1,1,0,'スパムメール'),(22,'アプリケーションをコンピュータで使用可能にするための作業のことをダウンロードという',2,0,0,'インストール'),(23,'ファイルをネットから落とすことをダウンロードという',1,0,0,'ダウンロード'),(24,'アプリケーションの旧バージョンから新バージョンに上書きすることをアップロードという',2,0,0,'アップデート'),(25,'ファイルをネットに上げる(アップする)ことをアップロードという',1,0,0,'アップロード'),(26,'アプリケーションを削除しインストールする前の状態にすることをアンインストールという',1,0,0,'アンインストール'),(27,'iPhoneやiPadなどのモバイル機器に搭載されているOSはiOSという',1,0,0,'iOS'),(28,'グーグル社製のスマートフォン用のモバイルOSはiOSという',2,0,0,'アンドロイド'),(29,'SNSとはソーシャル・ネットワーキング・サービスのことである',1,1,1,'ソーシャル・ネットワーキングサービス'),(30,'グーグル社が運営している無料のEメールサービスはyahoo!mailである',2,0,0,'Gmail');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-11 18:35:09
