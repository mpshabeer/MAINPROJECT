/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.31 : Database - smart_resume_selector
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smart_resume_selector` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `smart_resume_selector`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add candidate',7,'add_candidate'),
(26,'Can change candidate',7,'change_candidate'),
(27,'Can delete candidate',7,'delete_candidate'),
(28,'Can view candidate',7,'view_candidate'),
(29,'Can add career_guidance',8,'add_career_guidance'),
(30,'Can change career_guidance',8,'change_career_guidance'),
(31,'Can delete career_guidance',8,'delete_career_guidance'),
(32,'Can view career_guidance',8,'view_career_guidance'),
(33,'Can add company',9,'add_company'),
(34,'Can change company',9,'change_company'),
(35,'Can delete company',9,'delete_company'),
(36,'Can view company',9,'view_company'),
(37,'Can add login',10,'add_login'),
(38,'Can change login',10,'change_login'),
(39,'Can delete login',10,'delete_login'),
(40,'Can view login',10,'view_login'),
(41,'Can add test_questions',11,'add_test_questions'),
(42,'Can change test_questions',11,'change_test_questions'),
(43,'Can delete test_questions',11,'delete_test_questions'),
(44,'Can view test_questions',11,'view_test_questions'),
(45,'Can add tips',12,'add_tips'),
(46,'Can change tips',12,'change_tips'),
(47,'Can delete tips',12,'delete_tips'),
(48,'Can view tips',12,'view_tips'),
(49,'Can add videos',13,'add_videos'),
(50,'Can change videos',13,'change_videos'),
(51,'Can delete videos',13,'delete_videos'),
(52,'Can view videos',13,'view_videos'),
(53,'Can add vacancy',14,'add_vacancy'),
(54,'Can change vacancy',14,'change_vacancy'),
(55,'Can delete vacancy',14,'delete_vacancy'),
(56,'Can view vacancy',14,'view_vacancy'),
(61,'Can add rating',16,'add_rating'),
(62,'Can change rating',16,'change_rating'),
(63,'Can delete rating',16,'delete_rating'),
(64,'Can view rating',16,'view_rating'),
(65,'Can add mock_test_questions',17,'add_mock_test_questions'),
(66,'Can change mock_test_questions',17,'change_mock_test_questions'),
(67,'Can delete mock_test_questions',17,'delete_mock_test_questions'),
(68,'Can view mock_test_questions',17,'view_mock_test_questions'),
(69,'Can add mock_result',18,'add_mock_result'),
(70,'Can change mock_result',18,'change_mock_result'),
(71,'Can delete mock_result',18,'delete_mock_result'),
(72,'Can view mock_result',18,'view_mock_result'),
(73,'Can add feedback',19,'add_feedback'),
(74,'Can change feedback',19,'change_feedback'),
(75,'Can delete feedback',19,'delete_feedback'),
(76,'Can view feedback',19,'view_feedback'),
(77,'Can add company_complaint',20,'add_company_complaint'),
(78,'Can change company_complaint',20,'change_company_complaint'),
(79,'Can delete company_complaint',20,'delete_company_complaint'),
(80,'Can view company_complaint',20,'view_company_complaint'),
(81,'Can add candidate_complaint',21,'add_candidate_complaint'),
(82,'Can change candidate_complaint',21,'change_candidate_complaint'),
(83,'Can delete candidate_complaint',21,'delete_candidate_complaint'),
(84,'Can view candidate_complaint',21,'view_candidate_complaint'),
(85,'Can add applied',22,'add_applied'),
(86,'Can change applied',22,'change_applied'),
(87,'Can delete applied',22,'delete_applied'),
(88,'Can view applied',22,'view_applied'),
(89,'Can add test_result',23,'add_test_result'),
(90,'Can change test_result',23,'change_test_result'),
(91,'Can delete test_result',23,'delete_test_result'),
(92,'Can view test_result',23,'view_test_result');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$UTk1CRpf2O5fwxXulzsrIA$eHQ98JhzT8LRydzjo7luJ8YnzvaIXpqChgy/iHKaZR0=','2023-05-05 11:55:29.645932',1,'admin','','','admin@gmail.com',1,1,'2023-04-26 10:35:47.287300');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(22,'selector','applied'),
(7,'selector','candidate'),
(21,'selector','candidate_complaint'),
(8,'selector','career_guidance'),
(9,'selector','company'),
(20,'selector','company_complaint'),
(19,'selector','feedback'),
(10,'selector','login'),
(18,'selector','mock_result'),
(17,'selector','mock_test_questions'),
(16,'selector','rating'),
(11,'selector','test_questions'),
(23,'selector','test_result'),
(12,'selector','tips'),
(14,'selector','vacancy'),
(13,'selector','videos'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-03-26 10:00:58.123721'),
(2,'auth','0001_initial','2023-03-26 10:00:58.711720'),
(3,'admin','0001_initial','2023-03-26 10:00:58.852260'),
(4,'admin','0002_logentry_remove_auto_add','2023-03-26 10:00:58.865267'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-03-26 10:00:58.876243'),
(6,'contenttypes','0002_remove_content_type_name','2023-03-26 10:00:58.965634'),
(7,'auth','0002_alter_permission_name_max_length','2023-03-26 10:00:59.038772'),
(8,'auth','0003_alter_user_email_max_length','2023-03-26 10:00:59.070474'),
(9,'auth','0004_alter_user_username_opts','2023-03-26 10:00:59.082632'),
(10,'auth','0005_alter_user_last_login_null','2023-03-26 10:00:59.149997'),
(11,'auth','0006_require_contenttypes_0002','2023-03-26 10:00:59.154482'),
(12,'auth','0007_alter_validators_add_error_messages','2023-03-26 10:00:59.166845'),
(13,'auth','0008_alter_user_username_max_length','2023-03-26 10:00:59.235130'),
(14,'auth','0009_alter_user_last_name_max_length','2023-03-26 10:00:59.336161'),
(15,'auth','0010_alter_group_name_max_length','2023-03-26 10:00:59.367597'),
(16,'auth','0011_update_proxy_permissions','2023-03-26 10:00:59.380696'),
(17,'auth','0012_alter_user_first_name_max_length','2023-03-26 10:00:59.458266'),
(18,'selector','0001_initial','2023-03-26 10:01:00.790422'),
(19,'sessions','0001_initial','2023-03-26 10:01:00.831187'),
(20,'selector','0002_remove_applied_cid','2023-03-28 06:31:48.471675'),
(21,'selector','0003_videos_video','2023-03-28 06:58:16.966064'),
(22,'selector','0004_test_result','2023-04-18 05:49:01.619806'),
(23,'selector','0005_auto_20230427_0942','2023-04-27 04:13:22.491962');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('32z2be92dygmrgnie0yqmu404tzvb930','eyJsaWQiOjMsInZpZCI6Nn0:1pkecY:G6hyY1o0xi3S3Cm-3vlL7VKeATWPPw6wIWU7pJ4vZ3A','2023-04-21 05:26:46.464596'),
('7rnp7nc5yfepjwp76olipq3gzbht2rjj','eyJsaWQiOjMsInZpZCI6MX0:1pkJad:hXrZLgSQeiDiRho8XuJGmdWnobDvx4osS1tqfpNwN7o','2023-04-20 06:59:23.804433'),
('t00hwqii37er9h0jtzk6kz3vnzjeyl80','eyJsaWQiOjIsImNudCI6MCwidmlkIjoxfQ:1poh0y:7IX2SfiMwdeNGwWSXMdKPv54-B1wl5O2yh339ohT4YY','2023-05-02 08:48:40.585170'),
('t01itoynvpfw2rsrqlr14orc10m1c3vc','.eJxVjDEOgzAMRe-SuYoaByd1x-6cATnYFFqUSASmqndvkVhY33v_f8w8ibn7i-l4W8duq7p0OzHOnFji_q15F_Li_Cy2L3ldpmT3xB622raIzo-jPR2MXMf_mkGQgniIADr4hOgkkgok1UjUDDxARE7o6NpTiA4D3BoBcoQupmC-P06SOUM:1puu25:gy6KkSeqSZPGrlxx1R5Aq-riMexH-JDGQ8DhCoKBFUc','2023-05-19 11:55:29.648784'),
('ym826tlamucyn2e9xkikhsfuaze0d9tp','eyJsaWQiOjksInZpZCI6MSwiY2lkIjoxNn0:1phofI:UPl1SyQNbUGE7A3dSBMlGzBjUgHcm6oXA3h4T08INsk','2023-04-13 09:33:52.690200'),
('zin8aj3qylm00n9pbj2eajesc48de2ty','eyJsaWQiOjIsInZpZCI6MSwiY2lkIjoxfQ:1pgNax:DQaVk4U_7goelEAuTLP5ebQ06VUhZC2LRaSQe8WsADc','2023-04-09 10:27:27.167864');

/*Table structure for table `selector_applied` */

DROP TABLE IF EXISTS `selector_applied`;

CREATE TABLE `selector_applied` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `resume` varchar(100) NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  `vid_id` bigint NOT NULL,
  `predicted_score` double NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_applied_candidate_id_id_18827c45_fk_selector_` (`candidate_id_id`),
  KEY `selector_applied_vid_id_220f61cd_fk_selector_vacancy_id` (`vid_id`),
  CONSTRAINT `selector_applied_candidate_id_id_18827c45_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`),
  CONSTRAINT `selector_applied_vid_id_220f61cd_fk_selector_vacancy_id` FOREIGN KEY (`vid_id`) REFERENCES `selector_vacancy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_applied` */

insert  into `selector_applied`(`id`,`resume`,`candidate_id_id`,`vid_id`,`predicted_score`,`status`) values 
(8,'sha 3.pdf',1,10,11,'12'),
(14,'shabeercv_O9j77BG.pdf',1,1,40,'predicted'),
(19,'shabeer  mp cv _xrpMMO6.pdf',4,1,80,'predicted'),
(20,'shabeer  mp cv _2gfEZRD.pdf',1,13,20,'predicted'),
(21,'shabeercv_0ay1FIn.pdf',5,13,25,'predicted'),
(22,'shabeer  mp cv _h4mV8X6.pdf',5,1,80,'predicted');

/*Table structure for table `selector_candidate` */

DROP TABLE IF EXISTS `selector_candidate`;

CREATE TABLE `selector_candidate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` bigint NOT NULL,
  `mail` varchar(100) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_candidate_lid_id_31eb0c5b_fk_selector_login_id` (`lid_id`),
  CONSTRAINT `selector_candidate_lid_id_31eb0c5b_fk_selector_login_id` FOREIGN KEY (`lid_id`) REFERENCES `selector_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_candidate` */

insert  into `selector_candidate`(`id`,`name`,`place`,`gender`,`address`,`phone`,`mail`,`lid_id`) values 
(1,'shabeer','malappuram','male','mp',7893489,'mpshabeer007@gmail.com',2),
(2,'mohammed','malappuram','male','m',5538747,'jhwudd',7),
(3,'shabeer','malappuram','male','moll',27687,'abc@gmail.com',17),
(4,'shabeeb','pulikkal','male','Mullappally House',8281927605,'mpshabeer007@gmail.com',19),
(5,'junaid','malappuram','male','kuttipuram po',32565,'junaidjunu@gmai.com',22);

/*Table structure for table `selector_candidate_complaint` */

DROP TABLE IF EXISTS `selector_candidate_complaint`;

CREATE TABLE `selector_candidate_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `complaint` varchar(500) NOT NULL,
  `reply` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_candidate_c_candidate_id_id_0be08168_fk_selector_` (`candidate_id_id`),
  CONSTRAINT `selector_candidate_c_candidate_id_id_0be08168_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_candidate_complaint` */

/*Table structure for table `selector_career_guidance` */

DROP TABLE IF EXISTS `selector_career_guidance`;

CREATE TABLE `selector_career_guidance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_career_guidance_lid_id_71ded804_fk_selector_login_id` (`lid_id`),
  CONSTRAINT `selector_career_guidance_lid_id_71ded804_fk_selector_login_id` FOREIGN KEY (`lid_id`) REFERENCES `selector_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_career_guidance` */

insert  into `selector_career_guidance`(`id`,`username`,`password`,`lid_id`) values 
(1,'career','careerguide',4),
(2,'career','career',9);

/*Table structure for table `selector_company` */

DROP TABLE IF EXISTS `selector_company`;

CREATE TABLE `selector_company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_company_lid_id_c4e0725d_fk_selector_login_id` (`lid_id`),
  CONSTRAINT `selector_company_lid_id_c4e0725d_fk_selector_login_id` FOREIGN KEY (`lid_id`) REFERENCES `selector_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_company` */

insert  into `selector_company`(`id`,`cname`,`place`,`post`,`mail`,`lid_id`) values 
(1,'tcs','Kochi','6765m','tcs@gmail.com',3),
(3,'abc','malappuram','676506','abc@gmail.com',6),
(10,'abc','malappuram','pazhamallur','abcfgmail.com',18),
(11,'abctech','malappuram','pazhamallor','abctech',20),
(12,'junaid','kuttipuram','6764546','junaid@123',21);

/*Table structure for table `selector_company_complaint` */

DROP TABLE IF EXISTS `selector_company_complaint`;

CREATE TABLE `selector_company_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(500) NOT NULL,
  `reply` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `cid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_company_com_cid_id_e19f6b8d_fk_selector_` (`cid_id`),
  CONSTRAINT `selector_company_com_cid_id_e19f6b8d_fk_selector_` FOREIGN KEY (`cid_id`) REFERENCES `selector_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_company_complaint` */

insert  into `selector_company_complaint`(`id`,`complaint`,`reply`,`date`,`cid_id`) values 
(15,'admin','','2023-03-28',3),
(16,'admin','shhk','2023-03-28',3),
(20,'we caant login at some times','pending','2023-04-07',1),
(22,'system not work properly','pending','2023-04-26',11);

/*Table structure for table `selector_feedback` */

DROP TABLE IF EXISTS `selector_feedback`;

CREATE TABLE `selector_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(500) NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_feedback_candidate_id_id_4545f35e_fk_selector_` (`candidate_id_id`),
  CONSTRAINT `selector_feedback_candidate_id_id_4545f35e_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_feedback` */

insert  into `selector_feedback`(`id`,`feedback`,`candidate_id_id`) values 
(1,'okay',1),
(2,'abcd',1),
(3,'i got placed at tcs',1);

/*Table structure for table `selector_login` */

DROP TABLE IF EXISTS `selector_login`;

CREATE TABLE `selector_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `utype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_login` */

insert  into `selector_login`(`id`,`username`,`password`,`utype`) values 
(1,'admin','admin','admin'),
(2,'sha','123','candidate'),
(3,'tcs','123','verified'),
(4,'career','careerguide','careerguidance'),
(6,'abcd','123','verified'),
(7,'mhd','abcd','candidate'),
(9,'career','career','careerguidance'),
(12,'viaq','shahw','rejected'),
(17,'abcd','1234','candidate'),
(18,'abctech','shab','verified'),
(19,'shabeeb','123','candidate'),
(20,'abctech','abctech','verified'),
(21,'junaid','123','verified'),
(22,'junu','abc','candidate');

/*Table structure for table `selector_mock_result` */

DROP TABLE IF EXISTS `selector_mock_result`;

CREATE TABLE `selector_mock_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  `question_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_mock_result_candidate_id_id_91b8d837_fk_selector_` (`candidate_id_id`),
  KEY `selector_mock_result_question_id_id_02dd63b3_fk_selector_` (`question_id_id`),
  CONSTRAINT `selector_mock_result_candidate_id_id_91b8d837_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`),
  CONSTRAINT `selector_mock_result_question_id_id_02dd63b3_fk_selector_` FOREIGN KEY (`question_id_id`) REFERENCES `selector_mock_test_questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_mock_result` */

/*Table structure for table `selector_mock_test_questions` */

DROP TABLE IF EXISTS `selector_mock_test_questions`;

CREATE TABLE `selector_mock_test_questions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `option1` varchar(100) NOT NULL,
  `option2` varchar(100) NOT NULL,
  `option3` varchar(100) NOT NULL,
  `option4` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `cg_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_mock_test_q_cg_id_id_599de567_fk_selector_` (`cg_id_id`),
  CONSTRAINT `selector_mock_test_q_cg_id_id_599de567_fk_selector_` FOREIGN KEY (`cg_id_id`) REFERENCES `selector_career_guidance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_mock_test_questions` */

insert  into `selector_mock_test_questions`(`id`,`question`,`option1`,`option2`,`option3`,`option4`,`answer`,`cg_id_id`) values 
(3,'which is not a prime','12','11','1','3','12',2);

/*Table structure for table `selector_rating` */

DROP TABLE IF EXISTS `selector_rating`;

CREATE TABLE `selector_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` bigint NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  `cid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_rating_candidate_id_id_cfe33c37_fk_selector_` (`candidate_id_id`),
  KEY `selector_rating_cid_id_d2f584e0_fk_selector_company_id` (`cid_id`),
  CONSTRAINT `selector_rating_candidate_id_id_cfe33c37_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`),
  CONSTRAINT `selector_rating_cid_id_d2f584e0_fk_selector_company_id` FOREIGN KEY (`cid_id`) REFERENCES `selector_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_rating` */

/*Table structure for table `selector_test_questions` */

DROP TABLE IF EXISTS `selector_test_questions`;

CREATE TABLE `selector_test_questions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `option1` varchar(100) NOT NULL,
  `option2` varchar(100) NOT NULL,
  `option3` varchar(100) NOT NULL,
  `option4` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `vid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_test_questions_vid_id_6418d3ea_fk_selector_vacancy_id` (`vid_id`),
  CONSTRAINT `selector_test_questions_vid_id_6418d3ea_fk_selector_vacancy_id` FOREIGN KEY (`vid_id`) REFERENCES `selector_vacancy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_test_questions` */

insert  into `selector_test_questions`(`id`,`question`,`option1`,`option2`,`option3`,`option4`,`answer`,`vid_id`) values 
(6,'which is not a prime number','12','1','3','5','12',1),
(9,'find the odd one','inheritance','class','object','android','android',1),
(10,'which is not a data type','int','char','double','malloc','malloc',1),
(11,'Number of primitive data types in Java are?','6','7','8','9','8',1),
(12,'full form of css','Cascading Style Sheets','Cascading sheet','Style Sheets','Cascading Style','Cascading Style Sheets',1),
(13,' Who developed object-oriented programming?','Adele Goldberg','Dennis Ritchie','Alan Kay','Andrea Ferro','Alan Kay',1),
(14,'Which of the following is not an OOPS concept?','Abstraction','Exception','Polymorphism','Encapsulation','Exception',1),
(15,'Which of the following language supports polymorphism but not the classes?','C++ programming language','Java programming language','Ada programming language','C# programming language','Ada programming language',1),
(16,'Which among the following feature is not in the general definition of OOPS?','Modularity','Efficient Code','Code reusability','Duplicate or Redundant Data','Duplicate or Redundant Data',1),
(17,' A single program of OOPS contains _______ classes?','Only 1','132','999','Any number','Any number',1),
(26,'which is not a prime number','12','3','5','7','12',13),
(27,' Who created the first DBMS?','Charles Bachman','Charles Babage','Bachman fransis','Charles ','Charles Bachman',7),
(28,'which is not a prime number','12','5','7','9','12',7),
(29,'.	_________are words that a programming language has set aside for its own use ?','Control words','Control structures ','Reserved words','Reserved key','Reserved words',7),
(30,'Which of the following software could assist someone who cannot use their hands for computer input ?','Video conferencing ','Speech recognition','Audio digitizer','Synthesizer',' Speech recognition',7),
(31,'A can do a piece of work in 4 hours; B and C can do it in 3 hours. A and C can do it in 2 hours. How long will B alone take to do it ?','10 hours ','12 hours ','15 hours ','16 hours ','12 hours ',7),
(32,'If A and B together can complete a piece of work in 15 days and B alone in 20 days, in how many days can A alone complete the work ?','60 days','30 days','70 days ','40 days ','60 days ',7);

/*Table structure for table `selector_test_result` */

DROP TABLE IF EXISTS `selector_test_result`;

CREATE TABLE `selector_test_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mark` int NOT NULL,
  `date` date NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  `question_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_test_result_candidate_id_id_82d70455_fk_selector_` (`candidate_id_id`),
  KEY `selector_test_result_question_id_id_2ecccc51_fk_selector_` (`question_id_id`),
  CONSTRAINT `selector_test_result_candidate_id_id_82d70455_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`),
  CONSTRAINT `selector_test_result_question_id_id_2ecccc51_fk_selector_` FOREIGN KEY (`question_id_id`) REFERENCES `selector_test_questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_test_result` */

insert  into `selector_test_result`(`id`,`mark`,`date`,`candidate_id_id`,`question_id_id`) values 
(1,1,'2023-04-30',1,6),
(2,1,'2023-04-30',1,9),
(3,1,'2023-04-30',1,10),
(4,0,'2023-04-30',1,11),
(5,1,'2023-04-30',1,12),
(6,1,'2023-04-30',1,13),
(7,0,'2023-04-30',1,14),
(8,0,'2023-04-30',1,15),
(9,1,'2023-04-30',1,16),
(10,1,'2023-04-30',1,17),
(11,1,'2023-04-30',4,6),
(12,1,'2023-04-30',4,9),
(13,1,'2023-04-30',4,10),
(14,1,'2023-04-30',4,11),
(15,1,'2023-04-30',4,12),
(16,1,'2023-04-30',4,13),
(17,0,'2023-04-30',4,14),
(18,1,'2023-04-30',4,15),
(19,1,'2023-04-30',4,16),
(20,1,'2023-04-30',4,17),
(21,1,'2023-05-05',1,27),
(22,1,'2023-05-05',1,28),
(23,1,'2023-05-05',1,29),
(24,0,'2023-05-05',1,30),
(25,1,'2023-05-05',1,31),
(26,0,'2023-05-05',1,32),
(33,1,'2023-05-05',5,6),
(34,0,'2023-05-05',5,9),
(35,0,'2023-05-05',5,10),
(36,0,'2023-05-05',5,11),
(37,1,'2023-05-05',5,12),
(38,1,'2023-05-05',5,13),
(39,0,'2023-05-05',5,14),
(40,1,'2023-05-05',5,15),
(41,0,'2023-05-05',5,16),
(42,1,'2023-05-05',5,17);

/*Table structure for table `selector_tips` */

DROP TABLE IF EXISTS `selector_tips`;

CREATE TABLE `selector_tips` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `tips` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_tips` */

insert  into `selector_tips`(`id`,`date`,`tips`) values 
(2,'2023-03-26','use capital letter for name');

/*Table structure for table `selector_vacancy` */

DROP TABLE IF EXISTS `selector_vacancy`;

CREATE TABLE `selector_vacancy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vacancy` varchar(100) NOT NULL,
  `requirments` longtext NOT NULL,
  `no_of_vacancy` int NOT NULL,
  `cid_id` bigint NOT NULL,
  `experiance` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_vacancy_cid_id_40c07d8a_fk_selector_company_id` (`cid_id`),
  CONSTRAINT `selector_vacancy_cid_id_40c07d8a_fk_selector_company_id` FOREIGN KEY (`cid_id`) REFERENCES `selector_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_vacancy` */

insert  into `selector_vacancy`(`id`,`vacancy`,`requirments`,`no_of_vacancy`,`cid_id`,`experiance`) values 
(1,'software engineer','Java\r\nHtml\r\nsql',6,1,1),
(7,'dot net develepor','Dot net, c#, c',4,1,1),
(9,'sftware engineer','Ds,oops ',3,1,1),
(10,'Software Tester','one Year Experience in Testing',4,11,1),
(11,'django dev','Python\r\nCss\r\nHtml',3,1,3),
(13,'data science','R,SQL,Data Visualization',5,1,2),
(14,'sftware engineer','JAVA,Flutter',1,12,4);

/*Table structure for table `selector_videos` */

DROP TABLE IF EXISTS `selector_videos`;

CREATE TABLE `selector_videos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `video` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_videos` */

insert  into `selector_videos`(`id`,`date`,`video`) values 
(6,'2023-03-30','How can consumers redeem e-RUPI__wYV9EZe.mp4');

/*Table structure for table `sortrank` */

DROP TABLE IF EXISTS `sortrank`;

CREATE TABLE `sortrank` (
  `candidateid` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `mark` int DEFAULT NULL,
  `resumescore` int DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sortrank` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
