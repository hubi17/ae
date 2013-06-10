-- MySQL dump 10.14  Distrib 5.5.31-MariaDB, for Linux (i686)
--
-- Host: localhost    Database: uebung
-- ------------------------------------------------------
-- Server version	5.5.31-MariaDB-log

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
-- Table structure for table `klasse`
--

DROP TABLE IF EXISTS `klasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klasse` (
  `kid` int(11) NOT NULL DEFAULT '0',
  `jahrgang` varchar(255) DEFAULT NULL,
  `bezeichnung` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`kid`),
  KEY `pid` (`pid`),
  CONSTRAINT `klasse_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `lehrer` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasse`
--

LOCK TABLES `klasse` WRITE;
/*!40000 ALTER TABLE `klasse` DISABLE KEYS */;
INSERT INTO `klasse` VALUES (2011,'2011-12','FSI2',1),(2012,'2011-12','FSI1',2),(2013,'2012-13','FSI1',2),(2014,'2012-13','FSI2',1);
/*!40000 ALTER TABLE `klasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lehrer`
--

DROP TABLE IF EXISTS `lehrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lehrer` (
  `pid` int(11) NOT NULL DEFAULT '0',
  `kuerzel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrer`
--

LOCK TABLES `lehrer` WRITE;
/*!40000 ALTER TABLE `lehrer` DISABLE KEYS */;
INSERT INTO `lehrer` VALUES (1,'SCR'),(2,'GRM'),(3,'KLE');
/*!40000 ALTER TABLE `lehrer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leistung`
--

DROP TABLE IF EXISTS `leistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leistung` (
  `lid` int(11) NOT NULL DEFAULT '0',
  `leistung` varchar(255) DEFAULT NULL,
  `fach` varchar(255) DEFAULT NULL,
  `bewerter` int(11) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `bewerter` (`bewerter`),
  CONSTRAINT `leistung_ibfk_1` FOREIGN KEY (`bewerter`) REFERENCES `lehrer` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leistung`
--

LOCK TABLES `leistung` WRITE;
/*!40000 ALTER TABLE `leistung` DISABLE KEYS */;
INSERT INTO `leistung` VALUES (1,'SA','AE',2,'2012-04-15'),(2,'EX','ET',2,'2012-03-13'),(3,'SA','ET',3,'2012-02-20'),(4,'SA','AE',2,'2013-04-03'),(5,'SA','AE',2,'2013-04-14'),(6,'EX','AE',2,'2013-01-26');
/*!40000 ALTER TABLE `leistung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leistungsnachweis`
--

DROP TABLE IF EXISTS `leistungsnachweis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leistungsnachweis` (
  `sid` int(11) NOT NULL DEFAULT '0',
  `lid` int(11) NOT NULL DEFAULT '0',
  `note` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`,`lid`),
  KEY `lid` (`lid`),
  CONSTRAINT `leistungsnachweis_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `schueler` (`sid`),
  CONSTRAINT `leistungsnachweis_ibfk_2` FOREIGN KEY (`lid`) REFERENCES `leistung` (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leistungsnachweis`
--

LOCK TABLES `leistungsnachweis` WRITE;
/*!40000 ALTER TABLE `leistungsnachweis` DISABLE KEYS */;
INSERT INTO `leistungsnachweis` VALUES (1,1,1),(1,2,3),(2,1,3),(2,2,3),(3,2,4),(3,4,3),(4,1,4),(4,3,6),(4,4,4),(5,1,5),(6,3,1),(7,4,1),(7,6,3),(8,3,3),(8,5,2),(9,3,5),(9,4,4);
/*!40000 ALTER TABLE `leistungsnachweis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schueler`
--

DROP TABLE IF EXISTS `schueler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schueler` (
  `sid` int(11) NOT NULL DEFAULT '0',
  `vorname` varchar(255) DEFAULT NULL,
  `nachname` varchar(255) DEFAULT NULL,
  `geburtsdatum` date DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schueler`
--

LOCK TABLES `schueler` WRITE;
/*!40000 ALTER TABLE `schueler` DISABLE KEYS */;
INSERT INTO `schueler` VALUES (1,'dietmar','huber','1996-03-25'),(2,'marcus','johansen','1997-06-12'),(3,'gunnar','enderson','1994-12-16'),(4,'frederike','weichselbaum','1993-01-18'),(5,'susanne','meier','1993-11-24'),(6,'frederike','lindgruen','1994-05-12'),(7,'marcus','mueller','1992-06-16'),(8,'wilhelm','schlueter','1991-09-07'),(9,'bert','neuendorfer','1994-08-03');
/*!40000 ALTER TABLE `schueler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schuelerklasse`
--

DROP TABLE IF EXISTS `schuelerklasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schuelerklasse` (
  `sid` int(11) NOT NULL DEFAULT '0',
  `kid` int(11) NOT NULL DEFAULT '0',
  `geld` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`,`kid`),
  KEY `kid` (`kid`),
  CONSTRAINT `schuelerklasse_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `schueler` (`sid`),
  CONSTRAINT `schuelerklasse_ibfk_2` FOREIGN KEY (`kid`) REFERENCES `klasse` (`kid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schuelerklasse`
--

LOCK TABLES `schuelerklasse` WRITE;
/*!40000 ALTER TABLE `schuelerklasse` DISABLE KEYS */;
INSERT INTO `schuelerklasse` VALUES (1,2011,50),(2,2011,50),(3,2012,0),(3,2014,0),(4,2012,30),(4,2014,60),(5,2012,30),(6,2013,40),(7,2013,40),(8,2014,60),(9,2014,60);
/*!40000 ALTER TABLE `schuelerklasse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-10 23:39:38
