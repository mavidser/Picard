CREATE DATABASE  IF NOT EXISTS `picard` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `picard`;
-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: picard
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.13.10.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add colleges',7,'add_colleges'),(20,'Can change colleges',7,'change_colleges'),(21,'Can delete colleges',7,'delete_colleges'),(22,'Can add users',8,'add_users'),(23,'Can change users',8,'change_users'),(24,'Can delete users',8,'delete_users'),(25,'Can add projects',9,'add_projects'),(26,'Can change projects',9,'change_projects'),(27,'Can delete projects',9,'delete_projects'),(28,'Can add log entry',10,'add_logentry'),(29,'Can change log entry',10,'change_logentry'),(30,'Can delete log entry',10,'delete_logentry');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$VP7HxNuQMsrf$tr5ee5Rfj4ce7Z3uze/1xH25tnmlC8KTySJ963ydNwc=','2013-11-23 06:38:25',1,'mavidser','Sid','Verma','nerdy.sid@gmail.com',1,1,'2013-10-05 20:43:01'),(5,'pbkdf2_sha256$10000$P1Bp1f9OmcUL$Uq83buLRdhpBecC5sax3tl8su9tw0L2VgxGsyytV5JE=','2013-11-18 14:41:47',0,'kirk','James','Kirk','kirk@starfleet.com',0,1,'2013-11-15 15:48:37'),(6,'pbkdf2_sha256$10000$I3lFwvHV02DG$xapP5b5RNqkn7aT3Tcc5u0l7/nThqRUnTpUzzCIH9m4=','2013-11-18 16:12:07',0,'doctor','The','Doctor','doctor@galiffrey.com',0,1,'2013-11-15 16:12:17'),(20,'pbkdf2_sha256$10000$njxBOxYy7CGE$v0VRD3lczkoIjYQYONe8rQKsJLNckxm8cTNcLTu/Y2Y=','2013-11-16 18:15:04',0,'data','Mr','Data','data@starfleet.com',0,1,'2013-11-16 18:15:04'),(21,'pbkdf2_sha256$10000$NiPkk6gvLbGm$y6xuPbtpD2w7XhPpMaG1kYEqdu61QocPD3or1igZk3s=','2013-11-17 04:33:57',0,'picard','Jean Luc','Picard','picard@starfleet.com',0,1,'2013-11-16 18:15:04'),(22,'pbkdf2_sha256$10000$R0Ahu5q8AdoW$uqSVUT98P3FMu1ttrNv1A5k8c0eAQSpj8BF1fHxrUGw=','2013-11-16 18:15:04',0,'spock','Mr','Spock','spock@starfleet.com',0,1,'2013-11-16 18:15:04'),(23,'pbkdf2_sha256$10000$GEsp1JMm4Qzz$pLKBsO70nOKrz2RdXgSKViS86teCVuubU+A+300jx8U=','2013-11-16 18:15:04',0,'luke','Luke','Skywalker','luke@jediacademy.com',0,1,'2013-11-16 18:15:04'),(24,'pbkdf2_sha256$10000$Ykhk0izOim2a$xGmQz/jxYZtdTNTrkehAKvzXm9Sf6o6D1gsPdud8Wqo=','2013-11-16 18:15:04',0,'potter','Harry','Potter','potter@hogwarts.com',0,1,'2013-11-16 18:15:04'),(25,'pbkdf2_sha256$10000$U4FlExUS5QIp$/4ntdl46Wq2ZK9vQ30iGuLPE/K+/TYRxWYYhVrmg1zY=','2013-11-16 18:15:05',0,'wolverine','James','Howlett','logan@starfleet.com',0,1,'2013-11-16 18:15:05'),(26,'pbkdf2_sha256$10000$F605AzqI83H4$vPfREYtCFAKj3OWwTpWQQzFaXCVHPiRdpQOXFgdQxyM=','2013-11-19 04:01:43',0,'sidseth','Siddhartha','Seth','seth@gmail.com',0,1,'2013-11-19 03:46:06'),(27,'pbkdf2_sha256$10000$ZJTi3zVl0Mmm$WjXNei9CEAVQMldLUjM+G8M04bvJ8IZXwEEm+LtA1rE=','2013-11-22 18:08:49',0,'shwetank','Shwetank','Singh','shwetank@gmail.com',0,1,'2013-11-19 03:47:24');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-10-06 16:18:28',1,3,'1','mavidser',2,'Changed password, first_name and last_name.'),(2,'2013-11-04 04:28:10',1,8,'doctor','The Doctor',2,'Added projects \"TARDIS\".'),(3,'2013-11-04 04:43:32',1,8,'doctor','The Doctor',2,'Changed partreq for projects \"TARDIS\".'),(4,'2013-11-04 13:21:30',1,8,'doctor','The Doctor',2,'Changed tags and partners for projects \"TARDIS\".'),(5,'2013-11-04 13:24:22',1,8,'doctor','The Doctor',2,'Changed partreq for projects \"TARDIS\".'),(6,'2013-11-04 13:24:36',1,8,'doctor','The Doctor',2,'Changed partreq for projects \"TARDIS\".'),(7,'2013-11-13 19:06:10',1,7,'6','Jaypee University of Engineering and Technology',1,''),(8,'2013-11-13 19:06:22',1,7,'5','Time Lord Academy',2,'Changed noofprojects.'),(9,'2013-11-13 19:09:50',1,7,'6','Jaypee University of Engineering and Technology',2,'Added users \"Sid Verma\". Added users \"Sid Seth\". Added users \"Sid Agarwal\". Added users \"Shwetank Singh\". Added users \"Shivanshu Singh\". Added users \"Shrey Chandra\". Added users \"Harshit Khan\".'),(10,'2013-11-13 19:10:36',1,7,'6','Jaypee University of Engineering and Technology',2,'Added users \"Yash Raj Singh\".'),(11,'2013-11-13 19:20:50',1,7,'6','Jaypee University of Engineering and Technology',2,'Added users \"Sid Verma\". Added users \"Sid Seth\". Added users \"Sid Agarwal\". Added users \"Shwetank Singh\". Added users \"Shivanshu Singh\". Added users \"Shrey Chandra\". Added users \"Yash Raj Singh\". Added users \"Harshit Singh\".');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'colleges','login','colleges'),(8,'users','login','users'),(9,'projects','login','projects'),(10,'log entry','admin','logentry');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('56i1j3hrx4ix9i6iorryk5zpq2y1qwgm','ZWEzMGVkZmQwNDk2NWIzNWMxMzk2NGY0MThlODQwNjUyNDMyY2MzNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2013-10-21 00:46:42'),('6br0fv2zkhoy7tatfbpzje6gld9rtul3','NjBlMThlYTM1OTU4MmVhZTEwMGIxZTgwY2Y1YzAwMWU4ZmMxMDZlYjp7Il9hdXRoX3VzZXJfaWQiOjUsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2013-12-01 05:25:18'),('7i10spuvkgetg67ra1xe2aquksft75wb','ZWEzMGVkZmQwNDk2NWIzNWMxMzk2NGY0MThlODQwNjUyNDMyY2MzNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2013-10-20 16:16:22'),('algk0uxp6qu7j9itjxy0hcdhl47akugw','ZWEzMGVkZmQwNDk2NWIzNWMxMzk2NGY0MThlODQwNjUyNDMyY2MzNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2013-12-07 06:38:25'),('nnq5bwisg3wbzt1oaywaq3wgdnjdl9c0','ODI0NGI4MjU2NGUxODMyMGMzMGExYTg5ZmUxMTVkNWI2OWUxYjg3ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2013-12-02 14:41:47'),('o7lesxljwi00hyqcrtoi0lepgodaxv4a','OTEzNTkxMDQ0YjFiODg5ZmY3Yzk4MTg3MDVjOWVhNzc0ZDYzZjMxZjp7fQ==','2013-12-03 04:04:57'),('t50suawz85auyver0x1zhpgznmkr6xf5','OTEzNTkxMDQ0YjFiODg5ZmY3Yzk4MTg3MDVjOWVhNzc0ZDYzZjMxZjp7fQ==','2013-12-03 04:05:42'),('vwy5fq9j0ksm9uwzt66us6soe90osve2','ZjZkODA5ZTUwZWE1ZjI2ZTlkN2I0YjhlMjZiNjY2NWIwNTI5NmRjZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MjZ9','2013-12-03 04:01:43');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picard_colleges`
--

DROP TABLE IF EXISTS `picard_colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picard_colleges` (
  `collegeid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(45) NOT NULL,
  `noofprojects` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`collegeid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picard_colleges`
--

LOCK TABLES `picard_colleges` WRITE;
/*!40000 ALTER TABLE `picard_colleges` DISABLE KEYS */;
INSERT INTO `picard_colleges` VALUES (1,'Hogwarts School of WitchCraft and Wizardy','Scotland',0),(2,'Xavier\'s School for Gifted Youngsters','Salem Center',0),(3,'Starfleet Academy','Marin County',0),(4,'Jedi Academy','Coruscant',0),(5,'Time Lord Academy','Gallifrey',1),(6,'Jaypee University of Engineering and Technology','Guna',4),(7,'Jaypee Institute of Information and Technology','Noida',0);
/*!40000 ALTER TABLE `picard_colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picard_projects`
--

DROP TABLE IF EXISTS `picard_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picard_projects` (
  `projectid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `desc` text NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `partners` varchar(180) NOT NULL,
  `partdone` varchar(256) NOT NULL,
  `partplanned` varchar(256) NOT NULL,
  `partreq` varchar(256) NOT NULL,
  `opensource` varchar(45) NOT NULL,
  `link` varchar(300) NOT NULL,
  `photo` varchar(256) NOT NULL,
  `timecreated` datetime NOT NULL,
  PRIMARY KEY (`projectid`),
  KEY `picard_projects_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_userid_8bbb8f60` FOREIGN KEY (`user_id`) REFERENCES `picard_users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picard_projects`
--

LOCK TABLES `picard_projects` WRITE;
/*!40000 ALTER TABLE `picard_projects` DISABLE KEYS */;
INSERT INTO `picard_projects` VALUES (1,'TARDIS','TARDIS, short for Time And Relative Dimensions In Space is a Gallifreyan ship which can travel through Space and Time in seconds. The TARDIS owned by The Doctor has been stuck in the form of a Police Box, due to a faulty camouflage, though it\'s easily ignored due to the perception filter surrounding the TARDIS. It is meant to be piloted by 6 people, though often, The Doctor is the only person piloting it. He has a habit of leaving the brakes on which causes it to make a distinct loud noise upon arrival and departure.','doctor','Other','spaceship,sci-fi,gallifreyan','spock|picard|data','In Use','Better Perception Filter,Sauce Dispenser','Back To Life,Unlocking Time-Locked Events','','http://tardis.com','tmp/1.jpg','2013-11-04 04:28:05'),(4,'Domestic Flight System','An efficient way to display data about different flights and their availability details','sidseth','Desktop App','flight,enterprise,windows','shwetank','In Development','Booking Preferences,Personalization for User','Interface Designer','github.com/flights','sidseth.com/myproject','tmp/2.png','2012-12-11 18:30:00'),(5,'Calculator','A simple calculator which performs basic arithematic calculations.','shwetank','Desktop App','utility,desktop,personal','sidseth','Completed','Scientific Calculator,Graphing Capability','Porting to other platforms','','myproject.com','tmp/3.jpg','2012-12-11 18:30:00'),(28,'Attendance Viewer','This app allows you to view your class attendance on your mobile device.\r\nIt visualizes the attendance in a streamlined manner, along with additional details for each subject, providing details about the subject.\r\nYou can also set a Threshold attendance which helps you in maintaining the attendance.\r\nNOTE:\r\nThis app is only for the students of Jaypee University of Engineering and Technology, India. This app doesn\'t work for the students of other colleges.','mavidser','Mobile Application','android,webkiosk,juet','||','Released to Public','marks view,schedule integration','iOS Developer','','','tmp/Screenshot_from_2013-11-23_121354_2.png','2012-12-11 18:30:00'),(29,'PICARD','A website which acts as a platform for students of different colleges to showcase their work and skills.','mavidser','Web Application','colleges,education,development','||','In Development','User interactions,Skills section,Contribution Support','Python Developer','','','tmp/Screenshot_from_2013-11-23_123904.png','2012-12-11 18:30:00');
/*!40000 ALTER TABLE `picard_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picard_users`
--

DROP TABLE IF EXISTS `picard_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picard_users` (
  `userid` varchar(45) NOT NULL,
  `year` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `xp` int(11) NOT NULL,
  `fb_id` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `picard_users_ac3b121a` (`college_id`),
  CONSTRAINT `college_id_refs_collegeid_a91482fe` FOREIGN KEY (`college_id`) REFERENCES `picard_colleges` (`collegeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picard_users`
--

LOCK TABLES `picard_users` WRITE;
/*!40000 ALTER TABLE `picard_users` DISABLE KEYS */;
INSERT INTO `picard_users` VALUES ('data',2050,3,0,''),('doctor',0,5,0,''),('kirk',2044,3,0,''),('luke',2099,4,0,''),('mavidser',2016,6,0,''),('picard',2046,3,0,''),('potter',1997,1,0,''),('shwetank',2016,6,0,''),('sidseth',2016,6,0,''),('spock',2044,3,0,''),('wolverine',1940,2,0,'');
/*!40000 ALTER TABLE `picard_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-23 12:53:46
