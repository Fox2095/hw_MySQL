-- Наполнение таблиц 
-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_24
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Логин',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Почта',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_username_idx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jones.van','kulas.erik@example.org','1999-05-20 17:21:09','1992-05-05 07:34:40'),(2,'norberto81','ugorczany@example.org','2007-08-16 08:35:17','2007-11-24 19:38:41'),(3,'leilani81','waters.adrienne@example.com','1992-12-20 06:55:37','1970-05-02 07:13:06'),(4,'price.tanner','annalise77@example.org','1989-04-22 08:51:32','2020-03-18 14:52:12'),(5,'twindler','kgrimes@example.org','1999-04-07 10:03:05','1983-05-24 12:06:26'),(6,'julien44','elmore.sauer@example.org','1995-04-02 17:28:07','1985-11-26 20:20:09'),(7,'lesly.crooks','americo.purdy@example.com','1979-11-29 00:07:05','2014-06-25 14:32:29'),(8,'reva.spencer','mayer.libbie@example.org','2016-10-28 21:40:48','2018-06-12 12:25:22'),(9,'alemke','katheryn.wunsch@example.net','2009-06-05 08:22:15','2008-02-05 07:52:38'),(10,'mkozey','gordon.upton@example.org','1997-03-23 11:17:32','1975-09-04 15:26:01'),(11,'arenner','gutmann.thad@example.net','2003-06-13 18:00:12','2014-03-09 18:33:28'),(12,'miller.ofelia','plebsack@example.com','2007-05-10 21:01:05','1988-04-01 20:53:12'),(13,'alfonzo24','brando92@example.com','1998-11-07 15:09:47','1984-01-14 03:10:13'),(14,'mueller.nicklaus','jaquelin.pouros@example.net','1980-05-24 01:56:44','1979-04-08 11:29:00'),(15,'janie00','uriel06@example.org','1989-09-17 13:06:22','2006-12-07 14:49:31'),(16,'kamren.ritchie','orn.abe@example.org','1986-12-25 06:24:38','1988-07-11 14:17:06'),(17,'walsh.stefan','edythe.ferry@example.net','1973-08-05 20:30:37','1992-02-16 23:05:25'),(18,'foberbrunner','orlando.hand@example.com','1984-12-28 13:14:37','2007-03-01 00:18:35'),(19,'fcrist','dillon35@example.org','1993-07-02 13:48:25','1971-05-02 05:36:56'),(20,'nels92','vernser@example.net','2019-08-30 23:37:35','1998-11-08 03:09:11'),(21,'rylee.mertz','ugreen@example.org','1982-05-29 08:08:29','1984-06-25 15:23:59'),(22,'asteuber','iyundt@example.com','2014-06-16 03:56:41','1980-07-22 14:17:45'),(23,'bernadette.pollich','turner.sophia@example.com','1994-08-12 03:36:43','1978-08-24 21:07:06'),(24,'schuyler48','ljohns@example.net','1981-02-10 06:23:22','1976-08-08 15:43:00'),(25,'mbauch','cremin.tia@example.org','1981-10-20 09:54:15','2004-05-12 16:38:51'),(26,'harmon.jakubowski','bartell.stefanie@example.net','2010-04-15 04:47:52','1989-01-24 00:17:36'),(27,'leanne.halvorson','stella97@example.net','1994-09-15 04:27:48','2018-11-11 00:18:47'),(28,'blick.tyra','huels.antonetta@example.net','1984-10-28 07:11:06','1976-03-07 17:57:05'),(29,'karine16','ehamill@example.com','2018-01-08 00:40:23','2006-06-30 16:17:12'),(30,'katlynn.lesch','price.wiley@example.org','2014-07-05 03:20:11','2021-04-30 23:54:35'),(31,'pansy32','emilio.cremin@example.net','1977-07-12 07:08:52','1985-10-25 07:28:52'),(32,'iweissnat','lemke.queen@example.com','1997-07-05 14:49:15','2010-11-29 06:09:41'),(33,'epfeffer','monahan.mable@example.org','2003-12-17 00:21:13','1972-03-01 04:27:39'),(34,'aileen65','larkin.jeremy@example.org','1984-04-01 11:48:28','2012-01-11 02:47:40'),(35,'brady.hegmann','murphy.tamara@example.org','2018-09-21 04:31:26','1995-12-01 23:24:39'),(36,'langworth.lucas','dlind@example.org','2020-12-14 17:41:12','2016-01-13 14:00:36'),(37,'romaguera.alysha','orval61@example.org','1981-03-22 06:02:30','1971-12-13 05:24:02'),(38,'sunny54','layne43@example.net','1970-09-24 17:54:24','1981-12-05 03:44:08'),(39,'ward58','ilegros@example.com','1973-08-30 19:49:17','1988-09-07 08:36:59'),(40,'nat81','cara74@example.net','1997-09-07 08:29:59','1998-12-26 21:46:14'),(41,'egrant','theodora08@example.org','2003-11-18 18:19:33','2002-04-01 12:46:20'),(42,'ward.jeanette','marilie.heidenreich@example.org','1987-09-29 21:44:30','2018-03-31 23:34:36'),(43,'roberta14','ulices.koch@example.net','2012-08-09 07:21:35','2004-03-12 07:00:13'),(44,'asa60','dstokes@example.net','1984-06-26 15:11:32','2009-09-16 11:23:43'),(45,'amya.west','dach.hoyt@example.net','1993-03-23 16:29:04','1976-07-03 22:48:17'),(46,'djakubowski','nathanael.reilly@example.net','1975-07-24 16:01:16','1983-10-13 04:49:07'),(47,'pdubuque','blaise59@example.net','1987-02-23 21:42:57','1999-04-11 23:06:45'),(48,'courtney.schuster','jbaumbach@example.com','1981-01-12 10:31:09','1989-06-02 17:29:16'),(49,'will.louvenia','lonie.feil@example.com','1995-01-16 18:11:15','1992-12-14 12:50:33'),(50,'cole.madisyn','kris.mariela@example.com','1986-01-03 13:13:31','1976-08-29 07:46:19'),(51,'tremblay.pearl','ruth.jones@example.net','2008-03-01 07:35:40','2005-03-10 17:19:46'),(52,'laurie.goldner','jbuckridge@example.net','2019-11-17 08:13:20','1990-09-26 15:08:38'),(53,'alycia.pfeffer','chris.wolff@example.com','2014-07-02 05:37:31','1986-08-20 23:00:43'),(54,'reynold.heller','beer.arvilla@example.com','1983-09-25 07:25:18','1980-03-13 17:44:44'),(55,'nhomenick','jordane97@example.org','2005-10-21 18:30:54','1991-11-13 04:36:18'),(56,'ocormier','xgusikowski@example.org','2005-09-15 18:50:49','1993-10-27 20:44:59'),(57,'damaris.schowalter','buster27@example.net','2013-03-01 09:33:36','2005-06-25 13:02:17'),(58,'ngoodwin','eldora.oberbrunner@example.net','2018-03-10 23:56:13','2006-07-26 14:01:08'),(59,'rupton','kenyon99@example.org','1983-06-11 13:13:12','1973-03-04 19:21:57'),(60,'angelo.tremblay','crist.rowena@example.com','2002-03-01 04:02:11','1994-12-10 19:59:18'),(61,'mmoen','helena.russel@example.com','1971-12-29 03:57:41','2015-07-21 08:51:47'),(62,'aleen21','treutel.kimberly@example.net','2013-06-26 14:55:36','2006-06-27 10:20:05'),(63,'pouros.kristina','ima.abernathy@example.org','2005-04-15 17:54:00','1970-03-29 07:51:52'),(64,'ally.moen','koss.theresa@example.net','2016-10-12 19:48:47','1990-02-06 19:44:16'),(65,'dach.stella','era.bartoletti@example.com','1982-05-15 18:16:20','1987-12-30 07:05:29'),(66,'noble.padberg','abel.legros@example.net','2018-02-20 21:04:14','1988-03-28 10:11:20'),(67,'trace.hermiston','sonya27@example.org','1970-03-13 02:14:16','1981-12-24 10:48:14'),(68,'durgan.allen','quitzon.gloria@example.com','1994-07-10 20:57:12','1987-10-17 07:06:37'),(69,'ubernier','lindgren.baron@example.org','2013-12-22 00:36:33','1989-09-22 09:56:45'),(70,'nklocko','elvie.tromp@example.net','1984-08-16 06:55:37','1995-09-18 06:07:12'),(71,'qdenesik','freda10@example.net','2008-07-10 18:26:07','1980-05-07 10:10:55'),(72,'canderson','batz.alia@example.com','2002-02-25 12:22:48','2016-04-12 12:41:44'),(73,'xgottlieb','jgottlieb@example.org','1977-12-14 00:39:37','2017-04-18 05:57:16'),(74,'hickle.katherine','carmen83@example.org','2005-11-23 00:02:23','1970-09-21 17:25:29'),(75,'joy50','fleta.denesik@example.com','1986-07-01 16:50:12','2018-06-21 10:35:49'),(76,'satterfield.shanon','matilde23@example.net','2002-04-27 10:38:49','2004-05-19 09:04:54'),(77,'huel.laurence','giovanni83@example.com','1991-05-21 16:42:26','2001-11-13 13:37:36'),(78,'qdurgan','jabari.mclaughlin@example.net','1999-11-08 23:28:17','2014-12-15 22:26:22'),(79,'reilly.jarrell','clifton.schiller@example.com','1983-12-14 08:16:57','1974-04-16 15:56:16'),(80,'kertzmann.magdalena','elroy40@example.org','2002-05-17 07:01:46','2018-12-16 21:54:11'),(81,'gmiller','bschmidt@example.org','1985-02-12 19:39:44','1999-06-03 08:11:49'),(82,'farrell.ross','boyer.jayde@example.com','2007-10-18 08:13:35','1994-01-21 14:34:51'),(83,'cortez39','ajakubowski@example.net','2012-10-11 09:58:21','2000-03-08 10:03:53'),(84,'darlene.gerhold','sawayn.rickey@example.org','2009-06-18 17:48:52','1970-11-08 00:28:40'),(85,'rodriguez.alice','kbayer@example.net','1996-02-21 13:41:39','1996-10-16 03:12:42'),(86,'derek10','tkovacek@example.com','1983-12-19 22:23:20','2018-03-12 04:44:12'),(87,'sswift','buster58@example.net','1996-06-04 01:30:04','1977-04-01 01:39:57'),(88,'mariah.gutmann','xreichel@example.org','2017-07-18 13:29:50','2020-10-30 02:53:55'),(89,'leannon.winifred','leonel47@example.com','1984-12-31 12:06:05','1971-08-02 04:26:33'),(90,'koss.don','brittany23@example.net','2012-08-31 13:11:26','2010-07-31 13:27:24'),(91,'fermin48','desiree30@example.net','2015-02-03 05:37:56','1990-09-08 16:53:59'),(92,'ariel20','malinda77@example.net','2011-10-23 16:58:32','1982-07-27 11:44:13'),(93,'daisha75','rickie.gutmann@example.org','2019-08-12 02:42:17','2011-10-11 13:31:39'),(94,'lulu22','olen41@example.net','1999-12-16 16:41:55','2013-10-22 05:46:44'),(95,'rlesch','elta11@example.net','2019-06-04 15:44:57','1990-10-08 12:33:36'),(96,'rath.ariane','zyundt@example.net','1972-05-09 14:21:08','2001-09-16 15:33:12'),(97,'natasha91','osinski.reese@example.net','2013-06-16 19:55:13','2013-05-16 03:48:21'),(98,'ygerlach','deonte.vandervort@example.org','1977-03-13 10:32:06','2001-07-25 00:41:46'),(99,'ratke.robb','nina.kuvalis@example.com','2009-09-14 12:02:44','2013-07-18 14:07:55'),(100,'howard44','iva.moen@example.net','2016-05-03 02:51:20','1973-04-04 05:27:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-01 13:25:59

-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_24
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

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
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'ID пользователя',
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя',
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия',
  `phone` char(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Телефон',
  `gender` enum('m','f','x') COLLATE utf8mb4_unicode_ci DEFAULT 'x' COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `city` varchar(130) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Город',
  `country` varchar(130) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Страна',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `profiles_lastname_idx` (`lastname`),
  KEY `profiles_phone_idx` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Профили';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Jaeden','Bauch','08601411546','m','1974-03-10','Lake Arely','7948','1997-05-16 21:22:51','2004-07-24 06:58:04'),(2,'Clarabelle','Kuphal','043.600.943','f','2003-03-23','Kozeyhaven','5','1986-03-27 13:07:48','2000-05-24 12:09:34'),(3,'Beau','Gerlach','(363)704-83','x','1992-02-11','Kautzerview','2600','1989-12-19 22:51:57','1975-01-14 17:07:57'),(4,'Jimmy','Bergnaum','360-763-349','f','1986-12-06','South Cassidyville','3810','1991-01-12 18:13:36','1977-10-02 07:01:38'),(5,'Ray','Gleason','1-191-572-4','f','1983-02-22','New Issacland','63361802','2010-10-05 07:36:11','2005-09-19 07:03:36'),(6,'Shaylee','Kautzer','1-074-528-7','x','1986-10-23','North Wandabury','559164131','1972-02-24 16:09:45','2011-08-21 11:14:58'),(7,'Gabrielle','Rice','987.501.600','x','2015-08-31','Langoshton','480','1976-10-18 13:48:50','2019-05-13 23:41:10'),(8,'Jabari','Strosin','017-172-720','m','2004-05-11','Port Harrisonside','1541762','1977-08-21 17:49:47','2005-11-12 08:19:47'),(9,'Pauline','Nikolaus','674.972.458','f','2014-08-11','Pacochaville','35','2012-03-10 03:21:06','2012-02-20 05:37:02'),(10,'Ivy','Cremin','+04(4)26790','m','1974-08-24','South Abdiel','919832','2016-04-27 17:22:34','1989-10-02 04:49:57'),(11,'Damion','Ledner','(384)136-74','m','2017-06-25','Lake Onieland','1013','1997-08-16 07:06:29','1999-11-01 03:14:54'),(12,'Aliya','Hilll','664.396.021','f','1988-10-05','Bobbieshire','18','2014-07-31 19:43:01','1995-10-17 02:28:04'),(13,'Hilario','Casper','(970)966-87','x','2019-03-17','Eudoraview','976','1982-12-15 17:20:09','1993-03-04 09:57:33'),(14,'Odessa','Jast','100.428.219','m','1974-07-19','Dollyfurt','74006017','2015-10-02 01:47:29','1984-10-21 02:48:24'),(15,'Eliza','Buckridge','03153848242','x','1993-01-24','Lake Jalynbury','','1980-08-16 10:49:58','1990-05-19 23:31:55'),(16,'Kara','Quitzon','(969)039-71','x','2000-08-17','Beulahhaven','517','1973-08-16 13:04:00','2006-05-29 15:54:51'),(17,'Harley','Bechtelar','(843)208-18','m','1970-02-27','East Clarabelle','2575','1975-05-01 06:50:50','2015-06-04 21:59:21'),(18,'Kole','O\'Kon','074-832-384','f','1993-04-19','Rosamondshire','42899986','2001-10-12 02:08:54','1985-05-16 19:06:53'),(19,'Cynthia','Hermann','164.950.209','m','1985-03-13','Murrayfort','868166','2007-02-22 22:56:46','2015-08-31 07:32:57'),(20,'Zackery','Dietrich','00838505226','f','1971-07-17','North Nicklausshire','663227005','2012-06-09 01:50:24','2012-07-08 17:23:28'),(21,'Hertha','Huels','+26(1)74030','m','2009-01-04','South Jaylon','9','1988-04-04 00:21:00','2020-08-01 01:04:01'),(22,'Raoul','Christiansen','1-874-733-5','m','2017-08-21','East Nicolemouth','936294','2011-11-28 18:53:42','1981-08-03 10:16:33'),(23,'Paul','Keebler','1-617-843-2','f','2020-12-07','Nienowside','66','2005-04-25 04:21:56','1989-04-11 12:24:35'),(24,'Shea','Thiel','458-393-525','x','1993-07-15','North Mia','4695','2012-08-12 04:53:03','1970-12-25 21:59:50'),(25,'Tiara','Jerde','485.544.835','m','1982-07-29','North Shermanhaven','8331356','2020-01-25 05:02:25','2019-08-22 05:35:18'),(26,'Brianne','Schmeler','1-090-007-9','f','2019-05-10','New Leolaborough','11','1998-11-30 03:24:53','2002-11-14 10:51:59'),(27,'Lewis','Welch','1-369-016-1','x','1998-04-29','Gracieport','','1977-05-23 18:26:08','2020-06-20 01:56:34'),(28,'Stephania','Barton','439-286-668','x','1981-05-08','East Jayce','38','2020-08-25 23:15:38','2003-06-01 10:11:20'),(29,'Ottilie','Kertzmann','1-910-515-6','m','1995-06-16','South Juliannefurt','7128277','1971-12-04 07:56:43','2007-09-17 04:02:49'),(30,'Domenico','Reynolds','491-211-780','m','1970-01-17','Weissnatfurt','90','1987-04-08 02:43:06','1991-03-15 21:53:16'),(31,'Leilani','Wolff','(174)409-45','f','1985-07-02','East Reymundomouth','4517400','2002-06-17 05:08:56','2018-07-28 12:52:13'),(32,'Kareem','Lynch','962-328-514','x','1983-03-05','South Monserratehaven','86','1996-08-06 04:32:49','2009-05-19 14:15:46'),(33,'Olaf','Mraz','1-677-753-8','m','1986-07-27','Port Royceland','50270388','1975-01-27 10:24:05','2004-10-25 22:11:35'),(34,'Janae','Wolf','537.228.716','m','2014-04-20','Eldaview','4','1980-02-22 11:16:12','2003-03-27 06:12:01'),(35,'Lesly','Cremin','1-939-327-6','m','1978-01-01','Erdmanburgh','51154310','1977-10-16 04:09:40','2020-09-14 23:37:10'),(36,'Ole','Koch','(679)171-23','f','2018-09-07','Lakinbury','','2014-05-09 12:19:11','2015-10-24 17:08:46'),(37,'Yolanda','Waters','523-499-608','f','2009-07-30','New Alenebury','2','1985-01-08 19:53:38','2009-12-05 08:13:54'),(38,'Elisa','Hermann','823-674-435','m','1976-07-14','New Rosellaview','7145528','2005-12-04 16:25:16','1996-08-27 08:22:02'),(39,'Alvena','Reinger','(248)769-06','x','1971-07-26','Dooleyfurt','5','1994-07-11 11:36:34','2013-08-27 23:09:36'),(40,'Larry','Hand','273-171-434','m','1980-10-17','East Maximillia','9777220','1998-02-10 08:25:54','2000-05-23 13:25:10'),(41,'Herminia','Green','706-205-499','m','1998-10-17','West Howard','7273280','1994-04-11 01:49:47','2006-10-14 00:24:51'),(42,'Colby','Kling','1-702-980-4','m','1991-07-29','Vernhaven','364069','2018-02-22 14:16:27','1990-03-14 19:13:13'),(43,'Sanford','Reichel','169-235-726','f','1983-03-20','Jastburgh','39247227','2000-06-28 21:05:18','1973-08-18 08:57:24'),(44,'Janick','Kerluke','+35(4)61536','f','2010-08-30','Abnerland','6502','1983-10-15 10:08:08','2021-06-19 15:44:41'),(45,'Blanca','Murphy','(237)832-20','x','2004-09-04','D\'Amoreberg','6457941','2014-04-27 13:26:21','1970-07-04 20:07:26'),(46,'Bernhard','Connelly','772.843.444','f','2013-05-20','Issactown','2489709','1986-01-13 13:11:30','2021-03-16 15:34:02'),(47,'Eriberto','Johnson','00130119797','f','1988-08-18','Rogahnshire','475480054','1995-10-23 11:47:28','2009-04-12 04:10:51'),(48,'Johann','Kessler','1-499-606-4','x','1974-12-15','Maiastad','47051006','1987-10-09 18:47:27','1998-11-29 03:24:35'),(49,'Emmet','Lockman','1-446-795-4','f','1988-06-07','Anthonyville','416040','1987-11-11 18:19:44','2018-09-17 20:30:53'),(50,'Glennie','Powlowski','(104)118-02','m','1998-12-20','Rueckermouth','507714','1976-12-07 14:30:40','1997-01-14 13:27:37'),(51,'Zane','Ebert','633.120.683','f','1972-08-02','North Leslieport','943714','1985-12-27 04:08:38','2015-03-25 06:08:39'),(52,'Megane','Bechtelar','1-332-317-1','f','1987-01-26','Zemlakville','549948961','1997-04-23 08:46:22','1995-02-15 23:11:47'),(53,'Darrion','McClure','031-166-488','m','2001-06-19','South Ila','725','1971-05-14 08:16:03','2018-04-07 09:13:12'),(54,'Sabryna','Kuphal','08094958473','m','1989-08-26','Port Nedland','46','1973-04-27 06:53:14','2016-08-04 16:13:57'),(55,'Adolph','Kshlerin','651-404-422','m','2012-06-16','South Erickamouth','9','1979-09-10 05:55:55','1976-08-26 03:57:47'),(56,'Ruby','Donnelly','1-188-903-4','f','2005-02-26','Lillyview','9382','1992-02-27 07:25:35','1982-10-29 22:15:09'),(57,'Urban','White','1-502-187-7','m','1986-12-11','Lake Maidastad','','2015-09-25 08:57:28','2021-05-01 16:15:06'),(58,'Lucile','McCullough','(206)822-44','x','1980-10-14','Luettgenmouth','566048119','1992-03-22 03:58:38','1992-12-30 03:02:45'),(59,'Torey','Nitzsche','1-785-909-4','f','1975-11-01','North Albaport','31849732','2013-08-26 03:50:00','1978-03-02 11:39:32'),(60,'Alisa','Waters','1-659-778-8','m','2010-07-19','Harberburgh','51268677','1989-12-19 18:15:25','1996-11-30 09:16:15'),(61,'Eliseo','Zemlak','1-482-958-6','m','1988-12-05','North Letahaven','3','2014-10-21 08:56:04','1979-05-27 09:04:28'),(62,'Lurline','Moen','151.945.142','f','1975-07-22','South Fayville','522982','1973-11-19 23:43:31','1974-05-16 13:52:12'),(63,'Winston','Gerhold','+67(4)46507','x','1990-01-11','East Janstad','104006233','2013-12-26 02:42:09','1988-03-23 03:36:15'),(64,'Baron','Lebsack','664-111-296','x','1995-04-30','Mikelhaven','','1977-05-06 23:38:38','2009-09-25 05:07:48'),(65,'Destany','Metz','415-298-596','f','1983-04-13','Stoltenbergton','5678','1977-12-10 02:55:48','2007-04-05 15:13:05'),(66,'Cheyanne','Rempel','04040216861','m','2006-02-21','New Julialand','','2008-02-27 03:12:50','2001-03-28 04:01:00'),(67,'Josiane','Douglas','1-683-986-5','f','1992-08-31','North Uriahview','','2008-10-10 01:26:10','1974-04-04 16:13:35'),(68,'Karina','Boyer','189.898.703','f','1981-11-04','Lake Vestaview','14822','1993-01-01 22:26:21','2012-08-11 03:41:19'),(69,'Franco','Satterfield','060.768.368','x','2021-04-02','South Stefaniebury','2','1998-02-07 21:20:25','2008-11-01 20:53:41'),(70,'Rosario','Metz','+96(0)59163','x','1970-05-19','Mohrtown','990044965','1971-02-17 09:31:00','2012-11-10 23:15:29'),(71,'Madison','Quitzon','1-729-301-6','f','2016-11-24','New Deshawnport','','1971-04-12 00:55:45','2009-12-29 22:32:59'),(72,'Jailyn','Roberts','217-969-963','x','2011-09-03','North Uniquestad','4325240','1983-04-12 02:53:05','2003-02-03 13:40:59'),(73,'Brandt','Haley','736-001-721','x','1998-06-12','East Mikaylamouth','1517','1977-01-22 01:21:11','1995-12-01 04:58:09'),(74,'Jarod','McKenzie','1-309-360-6','x','2011-03-17','New Dereckshire','5','2019-01-04 14:42:37','1978-06-26 09:21:01'),(75,'Elisha','Beer','168-862-036','x','2001-07-18','Tevinton','54280','2012-10-22 19:34:41','2015-02-21 09:21:35'),(76,'Henriette','Hilpert','+12(2)70884','x','1994-06-21','North Budfurt','71','1999-03-05 18:23:46','2000-09-11 19:52:51'),(77,'Gerhard','Kilback','1-659-422-8','f','1999-08-09','Auerside','','2001-02-20 13:23:28','2014-10-12 22:39:43'),(78,'Adalberto','Nolan','168-148-412','f','1975-11-12','Vestaport','508717','2011-12-04 06:24:34','1985-10-16 20:01:56'),(79,'Cordelia','Schimmel','1-564-505-7','f','2002-11-30','New Willie','231457763','1983-09-27 22:36:26','1999-09-22 18:19:34'),(80,'Berniece','Schuster','00755676794','m','2008-02-18','Dickensport','95','1999-12-19 15:09:39','1978-08-03 03:46:28'),(81,'Scottie','Lakin','481.116.050','f','1978-05-31','Port Randalmouth','353533','2013-04-25 03:31:29','1980-08-05 03:54:57'),(82,'Ellis','Daugherty','866.672.645','x','2005-10-11','North Myrlburgh','232629908','1973-03-27 01:13:03','2002-09-03 06:09:59'),(83,'Isobel','Purdy','491-118-600','x','2015-07-10','South Sunny','9216','2016-09-19 06:06:43','1978-05-20 12:05:27'),(84,'Lafayette','Weimann','(374)489-95','x','2017-04-19','South Leaburgh','96076998','1971-11-24 13:42:15','1971-02-17 17:55:15'),(85,'Genesis','Zemlak','262.497.805','m','2006-02-27','Nienowmouth','91940','2010-06-16 16:12:09','1977-12-14 08:50:35'),(86,'Hellen','Bailey','(805)847-35','f','2017-08-25','South Jakayla','7504986','2006-03-13 05:41:01','2005-10-22 13:33:10'),(87,'Melissa','Lang','1-614-926-4','m','2002-03-12','Alvenaborough','643','2012-03-29 02:47:45','2014-05-28 16:44:42'),(88,'Kathlyn','Walker','(801)374-17','m','1990-05-24','South Wanda','6','2000-08-29 11:13:08','1974-04-04 19:02:30'),(89,'Carissa','Terry','684.765.570','m','1995-03-03','Rachaelbury','882','1983-12-16 16:58:33','1990-09-07 01:30:26'),(90,'Celine','Franecki','+90(4)09747','m','1998-03-29','New Caesar','994695','2012-03-29 15:24:12','1976-06-30 21:40:24'),(91,'Vito','Gleason','07190306629','f','2020-08-13','Malikaburgh','','1985-09-05 17:22:35','1976-05-16 20:58:10'),(92,'Courtney','Weimann','(018)904-34','x','1971-05-21','Courtneyberg','','2005-05-03 22:33:08','2015-05-11 07:09:19'),(93,'Reagan','Nikolaus','045.299.676','f','2017-02-14','West Ebbatown','48595','2001-08-11 23:44:49','1994-01-14 04:36:48'),(94,'Mariela','Ledner','046-357-872','m','1973-07-26','Alysonmouth','154688623','1991-05-14 14:54:08','2016-03-31 16:36:23'),(95,'Stone','Zemlak','1-796-570-4','f','1985-06-28','Boscofurt','673','1973-10-10 16:20:18','2013-05-23 01:59:59'),(96,'Bruce','Aufderhar','901.143.173','x','2009-05-24','Michellechester','','2006-06-16 09:47:04','1990-05-16 07:04:26'),(97,'Darius','Osinski','(290)166-61','x','1994-11-06','Blandaborough','743','1975-08-21 18:07:35','1979-07-19 05:05:43'),(98,'Dorian','Fritsch','232-631-166','x','2003-11-18','Quitzonton','4865','1988-09-25 05:51:55','2003-08-02 03:42:03'),(99,'Charlie','Volkman','735.491.944','f','1992-12-13','Vanberg','94152','2009-08-08 10:41:26','1972-05-26 13:26:12'),(100,'Calista','Bergstrom','312-473-369','x','1993-07-14','Lake Tyreeport','7479821','1999-12-27 18:17:26','1989-01-30 03:41:13');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-01 13:27:44

USE peacebook;
INSERT INTO messages VALUES 
	(DEFAULT, 48, 26, 'Hello!', TRUE, NOW()),
    (DEFAULT, 90, 2, 'book', FALSE, NOW()),
    (DEFAULT, 40, 56, 'Sister!', TRUE, NOW()),
    (DEFAULT, 84, 61, 'Animal!', TRUE, NOW()),
    (DEFAULT, 46, 45, 'Footbol!', TRUE, NOW()),
    (DEFAULT, 67, 41, 'I am look!', TRUE, NOW()),
    (DEFAULT, 64, 88, 'Hello!', TRUE, NOW()),
    (DEFAULT, 56, 81, 'book', TRUE, NOW()),
    (DEFAULT, 92, 75, 'Hello!', FALSE, NOW()),
    (DEFAULT, 28, 50, 'Hello!', TRUE, NOW()),
    (DEFAULT, 55, 92, 'I am look!!', TRUE, NOW()),
    (DEFAULT, 88, 22, 'Hello!', TRUE, NOW()),
    (DEFAULT, 15, 99, 'Hello!', TRUE, NOW()),
    (DEFAULT, 94, 43, 'book!', TRUE, NOW()),
    (DEFAULT, 98, 10, 'Hello!', FALSE, NOW()),
    (DEFAULT, 5, 57, 'I am look!', TRUE, NOW()),
    (DEFAULT, 43, 47, 'Hello!', FALSE, NOW()),
    (DEFAULT, 54, 67, 'Hello!', FALSE, NOW()),
    (DEFAULT, 93, 98, 'book!', TRUE, NOW()),
    (DEFAULT, 97, 59, 'Hello!', TRUE, NOW());

INSERT INTO friends VALUES 
	(91, 56, 1, '2009.08.04', DEFAULT, DEFAULT),
    (18, 20, 2, '2014.01.13', DEFAULT, DEFAULT),
    (14, 70, 3, '2008.07.11', DEFAULT, DEFAULT),
    (90, 18, 4, '2021.03.30', DEFAULT, DEFAULT),
    (33, 18, 5, '2013.02.19', DEFAULT, DEFAULT),
    (56, 36, 6, '2013.05.22', DEFAULT, DEFAULT),
    (75, 43, 7, '2018.08.07', DEFAULT, DEFAULT),
    (40, 8, 8, '2007.08.07', DEFAULT, DEFAULT),
    (39, 23, 9, '2007.08.28', DEFAULT, DEFAULT),
    (40, 9, 10, '2009.07.07', DEFAULT, DEFAULT),
    (88, 85, 11, '2019.07.07', DEFAULT, DEFAULT),
    (11, 53, 12, '2003.07.31', DEFAULT, DEFAULT),
    (25, 97, 13, '2008.07.14', DEFAULT, DEFAULT),
    (67, 33, 14, '2004.11.03', DEFAULT, DEFAULT),
    (37, 27, 15, '2017.06.29', DEFAULT, DEFAULT),
    (16, 46, 16, '2009.07.09', DEFAULT, DEFAULT),
    (94, 88, 17, '2002.07.20', DEFAULT, DEFAULT),
    (77, 94, 18, '2020.12.19', DEFAULT, DEFAULT),
    (27, 46, 19, '2005.05.27', DEFAULT, DEFAULT),
    (72, 34, 20, '2010.12.07', DEFAULT, DEFAULT);


INSERT INTO f_status VALUES 
	(DEFAULT, 'Confirmed', '2020-01-22', '2020-01-22'),
    (DEFAULT, DEFAULT, '2020-01-22', '2020-01-22'),
    (DEFAULT, 'Confirmed', '2020-01-22', '2020-01-22'),
    (DEFAULT, 'Rejected', '2020-02-22', '2020-01-22'),
    (DEFAULT, 'Confirmed', '2020-03-22', '2020-01-22'),
    (DEFAULT, 'Confirmed', '2020-04-22', '2020-01-22'),
    (DEFAULT, 'Rejected', '2020-05-22', '2020-01-22'),
    (DEFAULT, 'Confirmed', '2020-06-22', '2020-01-22'),
    (DEFAULT, 'Confirmed', '2020-07-22', '2020-01-22'),
    (DEFAULT, 'Rejected', '2021-08-22', '2020-01-22'),
    (DEFAULT, 'Confirmed', '2020-09-22', '2020-01-22'),
    (DEFAULT, DEFAULT, '2020-10-15', '2020-01-22'),
    (DEFAULT, 'Confirmed', '2020-01-22', '2020-01-22'),
    (DEFAULT, 'Rejected', '2020-01-22', '2020-01-22'),
    (DEFAULT, 'Confirmed', '2020-01-22', '2020-01-22'),
    (DEFAULT, 'Confirmed', '2020-01-22', '2020-01-22'),
    (DEFAULT, 'Rejected', '2020-01-22', '2020-01-22'),
    (DEFAULT, 'Confirmed', '2020-01-22', '2020-01-22'),
    (DEFAULT, DEFAULT, '2020-01-22', '2020-01-22'),
    (DEFAULT, 'Confirmed', '2020-01-22', '2020-01-22');
    
    
INSERT INTO sms_status VALUES 
	(DEFAULT, 91, 'Hello!', TRUE, FALSE, DEFAULT),
    (DEFAULT, 18, 'Animal', FALSE, FALSE, DEFAULT),
    (DEFAULT, 14, 'Book!', TRUE, TRUE, DEFAULT),
    (DEFAULT, 90, 'Hi!', FALSE, TRUE, DEFAULT),
    (DEFAULT, 33, 'Goods!', TRUE, FALSE, DEFAULT),
    (DEFAULT, 56, 'Book!', FALSE, FALSE, DEFAULT),
    (DEFAULT, 75, 'Hello!', TRUE, TRUE, DEFAULT),
    (DEFAULT, 40, 'Hi!', FALSE, TRUE, DEFAULT),
    (DEFAULT, 39, 'Goods!',TRUE, FALSE, DEFAULT),
    (DEFAULT, 40, 'Hello!', FALSE, FALSE, DEFAULT),
    (DEFAULT, 88, 'Book!', TRUE, TRUE, DEFAULT),
    (DEFAULT, 11, 'Book!', FALSE, TRUE, DEFAULT),
    (DEFAULT, 25, 'Hello!', TRUE, FALSE, DEFAULT),
    (DEFAULT, 67, 'Goods!', FALSE, FALSE, DEFAULT),
    (DEFAULT, 37, 'Hi!', TRUE, TRUE, DEFAULT),
    (DEFAULT, 16, 'Goods!', FALSE, TRUE, DEFAULT),
    (DEFAULT, 94, 'Hello!', TRUE, FALSE, DEFAULT),
    (DEFAULT, 77, 'Book!', FALSE, FALSE, DEFAULT),
    (DEFAULT, 27, 'Hi!', TRUE, TRUE, DEFAULT),
    (DEFAULT, 72, 'Goods!', FALSE, TRUE, DEFAULT);
    

INSERT INTO books VALUES 
	(DEFAULT, 'Идиот', 'Роман Достоевского', 'О жизни', 'book.ru', 11, '1895-01-01', DEFAULT, DEFAULT, 299.54),
    (DEFAULT, 'Пролетая над гнездом кукушки', 'Роман Кен кизи', 'О жизни', 'book.ru', 11, '2020-01-01', DEFAULT, DEFAULT, 455.56),
    (DEFAULT, 'Шантарам', 'Роман австралийского писателя', 'О жизни', 'book.ru', 11, '2013-01-01', DEFAULT, DEFAULT, 599.12),
    (DEFAULT, 'О природе', 'Книга', 'О жизни', 'book.ru', 11, '1996-01-01', DEFAULT, DEFAULT, 985.00),
    (DEFAULT, 'Психология', 'книга', 'О психологии', 'book.ru', 11, '1997-01-01', DEFAULT, DEFAULT, 154.55),
    (DEFAULT, 'Турист', 'книга', 'О жизни', 'book.ru', 11, '1985-01-01', DEFAULT, DEFAULT, 10458.99),
    (DEFAULT, 'Мертвые души', 'книга', 'О жизни', 'book.ru', 11, '1955-01-01', DEFAULT, DEFAULT, 564.54),
    (DEFAULT, 'Зеленая миля', 'книга', 'О жизни', 'book.ru', 11, '1975-01-01', DEFAULT, DEFAULT, 466.56),
    (DEFAULT, 'Парфюмер', 'книга', 'О жизни', 'book.ru', 11, '1996-01-01', DEFAULT, DEFAULT, 455.56),
    (DEFAULT, 'Идиот', 'книга', 'О жизни', 'book.ru', 11, '2005-01-01', DEFAULT, DEFAULT, 755.54),
    (DEFAULT, 'Физика', 'книга', 'О жизни', 'book.ru', 11, '1988-01-01', DEFAULT, DEFAULT, 456.45),
    (DEFAULT, 'История', 'книга', 'О жизни', 'book.ru', 11, '1977-01-01', DEFAULT, DEFAULT, 455.45),
    (DEFAULT, 'Математика', 'книга', 'О жизни', 'book.ru', 11, '2021-01-01', DEFAULT, DEFAULT, 455.54),
    (DEFAULT, 'Библия', 'книга', 'О жизни', 'book.ru', 11, '2020-01-01', DEFAULT, DEFAULT, 755.45),
    (DEFAULT, 'Рыбалка', 'книга', 'О жизни', 'book.ru', 11, '2003-01-01', DEFAULT, DEFAULT, 7555.85),
    (DEFAULT, 'Баллада о солдате', 'книга', 'О жизни', 'book.ru', 11, '1911-01-01', DEFAULT, DEFAULT, 455.45),
    (DEFAULT, 'Исчезновение', 'книга', 'О жизни', 'book.ru', 11, '2018-01-01', DEFAULT, DEFAULT, 456.54),
    (DEFAULT, 'Сказки', 'книга', 'О жизни', 'book.ru', 11, '2010-01-01', DEFAULT, DEFAULT, 565.46),
    (DEFAULT, 'Навждение', 'книга', 'О жизни', 'book.ru', 11, '1964-01-01', DEFAULT, DEFAULT, 455.45),
    (DEFAULT, 'Хождение по мукам', 'книга', 'О жизни', 'book.ru', 11, '1945-01-01', DEFAULT, DEFAULT, 565.56);
    

INSERT INTO countries VALUES 
	(DEFAULT, 'Россия'),
    (DEFAULT, 'Австралия'),
    (DEFAULT, 'Беларусь'),
    (DEFAULT, 'Америка'),
    (DEFAULT, 'Англия'),
    (DEFAULT, 'Эстония'),
    (DEFAULT, 'Украина'),
    (DEFAULT, 'Мальта'),
    (DEFAULT, 'Норвегия'),
    (DEFAULT, 'Швеция'),
    (DEFAULT, 'Швецария'),
    (DEFAULT, 'Германия'),
    (DEFAULT, 'Китай'),
    (DEFAULT, 'Сингапур'),
    (DEFAULT, 'Тайланд'),
    (DEFAULT, 'Франция'),
    (DEFAULT, 'Египет'),
    (DEFAULT, 'Италия'),
    (DEFAULT, 'Дания'),
    (DEFAULT, 'Словакия');
    
INSERT INTO countries_books VALUES 
	(1, 20, DEFAULT),
    (2, 19, DEFAULT),
    (3, 18, DEFAULT),
    (4, 17, DEFAULT),
    (5, 16, DEFAULT),
    (6, 15, DEFAULT),
    (7, 14, DEFAULT),
    (8, 13, DEFAULT),
    (9, 12, DEFAULT),
    (10, 11, DEFAULT),
    (11, 10, DEFAULT),
    (12, 9, DEFAULT),
    (13, 8, DEFAULT),
    (14, 7, DEFAULT),
    (15, 6, DEFAULT),
    (16, 5, DEFAULT),
    (17, 4, DEFAULT),
    (18, 3, DEFAULT),
    (19, 2, DEFAULT),
    (20, 1, DEFAULT);
    

INSERT INTO genres VALUES 
	(DEFAULT, 'Драма'),
    (DEFAULT, 'Комедия'),
    (DEFAULT, 'Фантастика'),
    (DEFAULT, 'Детектив'),
    (DEFAULT, 'Наука'),
    (DEFAULT, 'История'),
    (DEFAULT, 'ЖЗЛ'),
    (DEFAULT, 'Сказки'),
    (DEFAULT, 'Религия'),
    (DEFAULT, 'Кулинария'),
    (DEFAULT, 'Для дома'),
    (DEFAULT, 'Экономика'),
    (DEFAULT, 'Языки'),
    (DEFAULT, 'Боевик'),
    (DEFAULT, 'Путешествия'),
    (DEFAULT, 'Роман'),
    (DEFAULT, 'Дети'),
    (DEFAULT, 'Басни'),
    (DEFAULT, 'Стихи'),
    (DEFAULT, 'Учебник');
    
INSERT INTO genres_books VALUES 
    (1, 20, DEFAULT),
    (2, 19, DEFAULT),
    (3, 18, DEFAULT),
    (4, 17, DEFAULT),
    (5, 16, DEFAULT),
    (6, 15, DEFAULT),
    (7, 14, DEFAULT),
    (8, 13, DEFAULT),
    (9, 12, DEFAULT),
    (10, 11, DEFAULT),
    (11, 10, DEFAULT),
    (12, 9, DEFAULT),
    (13, 8, DEFAULT),
    (14, 7, DEFAULT),
    (15, 6, DEFAULT),
    (16, 5, DEFAULT),
    (17, 4, DEFAULT),
    (18, 3, DEFAULT),
    (19, 2, DEFAULT),
    (20, 1, DEFAULT);
    
INSERT INTO authors VALUES 
	(DEFAULT, 'Александр', 'Пушкин', '1845-01-01', 1, DEFAULT, DEFAULT, 200),
    (DEFAULT, 'Михаил', 'Лермонтов', '1866-01-01', 2, DEFAULT, DEFAULT, 175),
    (DEFAULT, 'Стивин', 'Кинг', '1964-01-01', 3, DEFAULT, DEFAULT, 17),
    (DEFAULT, 'Алексей', 'Толстой', '1948-01-01', 4, DEFAULT, DEFAULT, 45),
    (DEFAULT, 'Александр', 'Голиков', '1998-05-30', 5, DEFAULT, DEFAULT, 47),
    (DEFAULT, 'Кен', 'Кизи', '1955-03-28', 6, DEFAULT, DEFAULT, 95),
    (DEFAULT, 'Федор', 'Достоевский', '1866-01-01', 7, DEFAULT, DEFAULT, 78),
    (DEFAULT, 'Михаил', 'Булгаков', '1891-01-01', 8, DEFAULT, DEFAULT, 35),
    (DEFAULT, 'Борис', 'Пастернак', '1890-01-01', 9, DEFAULT, DEFAULT, 15),
    (DEFAULT, 'Виктор', 'Пелевин', '1961-01-01', 10, DEFAULT, DEFAULT, 12),
    (DEFAULT, 'Николай', 'Гоголь', '1821-01-01', 11, DEFAULT, DEFAULT, 45),
    (DEFAULT, 'Леонид', 'Андреев', '1871-01-01', 12, DEFAULT, DEFAULT, 62),
    (DEFAULT, 'Владимир', 'Орлов', '1936-01-01', 13, DEFAULT, DEFAULT, 74),
    (DEFAULT, 'Пауло', 'Коэльо', '1911-01-01', 14, DEFAULT, DEFAULT, 36),
    (DEFAULT, 'Эрнест', 'Хаменгуэй', '1845-01-01', 15, DEFAULT, DEFAULT, 21),
    (DEFAULT, 'Джоан', 'Роулинг', '1845-01-01', 16, DEFAULT, DEFAULT, 10),
    (DEFAULT, 'Джон', 'Толкин', '1845-01-01', 17, DEFAULT, DEFAULT, 93),
    (DEFAULT, 'Александр', 'Сидоров', '1845-01-01', 18, DEFAULT, DEFAULT, 74),
    (DEFAULT, 'Иван', 'Алексеев', '1899-01-01', 19, DEFAULT, DEFAULT, 45),
    (DEFAULT, 'Алексей', 'Петров', '1985-01-01', 20, DEFAULT, DEFAULT, 41);
    
INSERT INTO authors_books VALUES 
	(1, 20, DEFAULT),
    (2, 19, DEFAULT),
    (3, 18, DEFAULT),
    (4, 17, DEFAULT),
    (5, 16, DEFAULT),
    (6, 15, DEFAULT),
    (7, 14, DEFAULT),
    (8, 13, DEFAULT),
    (9, 12, DEFAULT),
    (10, 11, DEFAULT),
    (11, 10, DEFAULT),
    (12, 9, DEFAULT),
    (13, 8, DEFAULT),
    (14, 7, DEFAULT),
    (15, 6, DEFAULT),
    (16, 5, DEFAULT),
    (17, 4, DEFAULT),
    (18, 3, DEFAULT),
    (19, 2, DEFAULT),
    (20, 1, DEFAULT);
 
 USE peacebook;
INSERT INTO comments VALUES 
	(DEFAULT, 1, 20, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 2, 19, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 3, 18, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 4, 17, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 5, 16, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 6, 15, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 7, 14, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 8, 13, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 9, 12, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 10, 11, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 11, 10, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 12, 9, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 13, 8, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 14, 7, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 15, 6, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 16, 5, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 17, 4, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 18, 3, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 19, 2, DEFAULT, 'Good!', DEFAULT),
    (DEFAULT, 20, 1, DEFAULT, 'Good!', DEFAULT);