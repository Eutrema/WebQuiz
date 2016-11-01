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
INSERT INTO `currentquiz` VALUES (50,0,26,'2016-11-01 19:50:12',0,0,1),(156,0,2,'2016-11-01 19:45:12',0,0,1),(194,0,12,'2016-11-01 19:46:12',0,0,1),(297,0,25,'2016-11-01 19:51:12',0,0,1),(381,0,8,'2016-11-01 19:49:12',0,0,1),(448,0,20,'2016-11-01 19:52:12',0,0,1),(558,0,7,'2016-11-01 19:48:12',0,0,1),(655,0,17,'2016-11-01 19:44:12',0,0,1),(762,0,14,'2016-11-01 19:53:12',0,0,1),(906,0,11,'2016-11-01 19:54:12',0,0,0),(941,0,2,'2016-11-01 19:47:12',0,0,1);
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
INSERT INTO `guestanswer` VALUES (1,'さｄｓｚ',50,3),(2,'らせだｓだ',50,1),(3,'ｒうぇれあｓだだだｓだｓｄ',50,-5);
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
INSERT INTO `quiz` VALUES (1,'千円札(せんえんさつ)にかかれている人(ひと)は野口英世(のぐちひでよ)である',1,3,2,'野口英世(のぐちひでよ)'),(2,'一万円札(いちまんえんさつ)にかかれている人(ひと)は野口英世(のぐちひでよ)である',2,0,0,'福沢諭吉(ふくざわゆきち)'),(3,'三角形(さんかくけい)の内角(ないかく)の和(わ)は180度(ど)である',1,5,4,'180度(ど)'),(4,'一番面積(めんせき)がちいさい都道府県(とどうふけん)は香川県(かがわけん)である',1,4,3,'香川県(かがわけん)'),(5,'世界(せかい)で一番(いちばん)おおい血液型(けつえきがた)はA型である',2,6,2,'O型(がた)'),(6,'ゴールデンウィークの一番(いちばん)はじめにやってくる祝日(しゅくじつ)はこどもの日である',2,6,3,'憲法記念日(けんぽうきねんび)'),(7,'ドイツの首都(しゅと)はロンドンである',2,5,2,'ベルリン'),(8,'イギリスの首都(しゅと)はロンドンである',1,5,2,'ロンドン'),(9,'千(せん)は0が3つ、億(おく)は0が8つ、兆(ちょう)は0が12個(こ)である',1,8,4,'12個(こ)'),(10,'アクアリウムとは水族館(すいぞくかん)のことである',1,1,1,'水族館(すいぞくかん)'),(11,'桃太郎(ももたろう)がサルたちにあげたのは泥団子(どろだんご)である',2,4,2,'きびだんご'),(12,'サイコロの1の反対側(はんたいがわ)にかかれているのは6である',1,3,3,'6'),(13,'ホームページを閲覧(えつらん)するためのソフトはブラウザである',1,3,2,'ブラウザ'),(14,'2020年にオリンピックが行われるのは東京(とうきょう)である',1,3,1,'東京(とうきょう)'),(15,'ピカチュウの進化(しんか)はライチュウである',1,1,1,'ライチュウ'),(16,'サザエさんにドラえもんは登場(とうじょう)する',2,7,3,'登場(とうじょう)しない'),(17,'干支(えと)に猫(ねこ)はいる',2,5,3,'いない'),(18,'東京ディズニーランドは東京都(とうきょうと)にある',2,6,1,'千葉県(ちばけん)'),(19,'サッカーと野球(やきゅう)、1チームの人数(にんずう)がおおいのはサッカー',1,6,3,'サッカー'),(20,'100円玉(えんだま)と10円玉大きいのは100円玉',2,3,1,'10円玉(えんだま)'),(21,'大阪府(おおさかふ)枚方市の「枚方」は、「ひらかた」と読む',1,7,5,'ひらかた'),(22,'大阪府(おおさかふ)の府庁所在地(ふちょうしょざいち)は、枚方市(ひらかたし)である',2,3,1,'大阪市(おおさかし)'),(23,'子どもの日は5月5日である',1,3,2,'こどもの日(ひ)'),(24,'Tuesdayは木曜日(もくようび)である',2,3,0,'火曜日(かようび)'),(25,'富士山(ふじさん)は静岡県(しずおかけん)にある',1,1,0,'静岡県(しずおかけん)'),(26,'世界一(せかいいち)かたいダイヤモンドはハンマーでたたいたらわれる',2,0,0,'われる'),(27,'赤信号(あかしんごう)はわたってはいけない',1,4,3,'わたってはいけない');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz4select`
--

DROP TABLE IF EXISTS `quiz4select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz4select` (
  `quizID` int(10) unsigned NOT NULL,
  `quizString` varchar(1000) DEFAULT NULL,
  `quizAnswer` int(11) DEFAULT NULL,
  `answers` int(11) DEFAULT NULL,
  `corrects` int(11) DEFAULT NULL,
  PRIMARY KEY (`quizID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz4select`
--

LOCK TABLES `quiz4select` WRITE;
/*!40000 ALTER TABLE `quiz4select` DISABLE KEYS */;
INSERT INTO `quiz4select` VALUES (1,'来年の就活面接解禁日は？ <br>1.4月1日<br>2.5月1日<br>3.6月1日<br>4.7月1日',3,23,9),(2,'イギリスの雑誌が発表している世界大学ランキング(2016)でアジア1位となった大学は？<br>1.東京大学<br>2.大阪工業大学<br>3.北京大学<br>4.シンガポール国立大学',4,17,6),(3,'リオ五輪で日本が最初に金メダルを獲得した競技は？<br>1.体操男子団体<br>2.柔道男子73キロ級<br>3.水泳男子400ｍ個人メドレー<br>4.陸上男子4×100mリレー\r ',3,7,2),(4,'リオ五輪で安倍首相が扮したキャラクターは？<br>1.マリオ<br>2.ドラえもん<br>3.キャプテン翼<br>4.パックマン',1,6,0),(5,'厚生労働省が13日に発表した全国の100歳以上の高齢者の数は？\n<br>1.3万5692人<br>2.6万5692人<br>3.16万5692人<br>4.26万5692人',2,8,2),(6,'プロ野球のセリーグで25年ぶりに優勝したチームは？<br>1.阪神タイガース<br>2.広島東洋カープ<br>3.横浜DeNAベイスターズ<br>4.読売ジャイアンツ',2,6,0),(7,'コント日本一を決める「キングオブコント2016」の優勝者は？\n<br>1.ライス<br>2.ラブレターズ<br>3.ジャングルポケット\n<br>4.ロバート',1,4,0),(8,'日本の火山を標高が高い順に並べたものとして正しいものを選択してください。<br>\n1．富士山➡御嶽山➡乗鞍岳<br>2.富士山➡浅間山➡岩木山\n<br>3.御嶽山➡十勝岳➡阿蘇山<br>4.富士山➡阿蘇山➡岩木山',1,0,0),(9,'次の選択肢の中で日本の食料自給率(カロリーベース、平成25年度)<br>最も高い品目を選択してください。<br>1.りんご<br>2.魚介類<br>3.きのこ類<br>4.みかん',4,0,0),(10,'日本の都道府県で温泉の数が最も多い場所は？<br>\n1.兵庫県<br>2.宮崎県<br>3.北海道<br>4.大分県',3,1,0),(11,'次のうち、夏の季語でないものは？<br>\n1.雨蛙<br>2.とかげ<br>3.鮎<br>4.サザエ',4,1,0),(12,'英語で「ディンプル」といえば何のこと？<br>\n1.そばかす<br>2.えくぼ<br>3.しみ<br>4.にきび\n',2,2,0),(13,'今年(2016年)のノーベル賞で日本人が受賞したのは？<br>\n1.化学賞<br>2.物理学賞<br>3.医学生理学賞\n<br>4.文学賞\n',3,1,0),(14,'長さの単位1オングストロームは何m？<br>\n1.1億分の1<br>2.10億分の1<br>3.100億分の1\n<br>4.1兆分の1',3,1,0),(15,'人間の骨の数はおよそいくつ？<br>\n1.200個<br>2.300個<br>3.400個<br>4.500個',1,2,0),(16,'かつての地震の震度階級で震度7は何と言った？<br>\n1.中震<br>2.激震<br>3.烈震<br>4.強震',2,3,0),(17,'1983年にアップル社が発売したオフィス向けのパソコンは？<br>\n1.Lisa<br>2.Yuki<br>3.Aiko<br>4.Anna',1,2,0),(18,'ビールを漢字で書くと？<br>\n1.米酒<br>2.火酒<br>3.麦酒<br>4.夏酒',3,7,1),(19,'「内臓」という意味があるスポーツなどでの頑張りを表す言葉は？<br>\n1.ファイト<br>2.ガッツ<br>3.ハッスル<br>4.スタミナ',2,3,2),(20,'これ以上生きるのは珍しいということから「珍寿」と呼ばれるのは何歳のお祝い？<br>\n1.112歳<br>2.104歳<br>3.120歳<br>4.108歳',1,1,0),(21,'日本のミスタードーナツを運営している企業は？<br>\n1.不二家<br>2.ダスキン<br>3.森永乳業<br>4.雪印',2,0,0),(22,'日本料理で「吉野」と言えば何を使った料理？<br>\n1.たらのき<br>2.くり<br>3.くず<br>4.わさび\n',3,4,1),(23,'次のうち、英語で「渋滞」を意味する言葉はどれ？<br>\n1.オレンジ<br>2.ジャム<br>3.バター<br>4.ピーナッツ',2,0,0),(24,'ピアノの数の数え方として正しいものは？\n<br>1.一盤、二盤<br>2.一両、二両<br>3.一台、二台<br>4.一基、二基',3,1,0),(25,'「さくら」と呼ばれるのは何の肉？ <br>1.鹿<br>2.馬<br>3.猪<br>4.豚',2,3,0),(26,'その町で最もにぎわっている通りや繁華街のことを<br>人間の顔のある部分を使って何通りという？<br>1.目抜き通り<br>2.歯抜き通り<br>3..耳抜き通り<br>4..口抜き通り',1,3,0),(27,'俗に「森のバター」とも呼ばれる果物といえば何？ <br>\n1.アボカド<br>2.ランブータン<br>3.マンゴー<br>4.キウイ',1,6,1),(28,'日本でも大ヒットした「ルービックキューブ」を考案したルービック博士はどこの国の人？ <br>1.ルーマニア<br>2.ハンガリー<br>3.クロアチア<br>4.アメリカ',2,2,1),(29,'次のうち30日までしかないのは？<br>\n1.9月<br>2.10月<br>3.5月<br>4.12月',1,1,0),(30,'次のうち、値段が安い形容に使われる言葉は？ <br>1.二束三文<br>2.四束五文<br>3.三束三文<br>4.五束三文',1,3,0);
/*!40000 ALTER TABLE `quiz4select` ENABLE KEYS */;
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

-- Dump completed on 2016-11-01 19:53:40
