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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(45,'Can add videos',12,'add_videos'),
(46,'Can change videos',12,'change_videos'),
(47,'Can delete videos',12,'delete_videos'),
(48,'Can view videos',12,'view_videos'),
(49,'Can add vacancy',13,'add_vacancy'),
(50,'Can change vacancy',13,'change_vacancy'),
(51,'Can delete vacancy',13,'delete_vacancy'),
(52,'Can view vacancy',13,'view_vacancy'),
(53,'Can add tips',14,'add_tips'),
(54,'Can change tips',14,'change_tips'),
(55,'Can delete tips',14,'delete_tips'),
(56,'Can view tips',14,'view_tips'),
(57,'Can add test_result',15,'add_test_result'),
(58,'Can change test_result',15,'change_test_result'),
(59,'Can delete test_result',15,'delete_test_result'),
(60,'Can view test_result',15,'view_test_result'),
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
(88,'Can view applied',22,'view_applied');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(15,'selector','test_result'),
(14,'selector','tips'),
(13,'selector','vacancy'),
(12,'selector','videos'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-03-17 10:48:36.697807'),
(2,'auth','0001_initial','2023-03-17 10:48:37.515003'),
(3,'admin','0001_initial','2023-03-17 10:48:37.682414'),
(4,'admin','0002_logentry_remove_auto_add','2023-03-17 10:48:37.698412'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-03-17 10:48:37.706415'),
(6,'contenttypes','0002_remove_content_type_name','2023-03-17 10:48:37.806621'),
(7,'auth','0002_alter_permission_name_max_length','2023-03-17 10:48:37.881792'),
(8,'auth','0003_alter_user_email_max_length','2023-03-17 10:48:37.915810'),
(9,'auth','0004_alter_user_username_opts','2023-03-17 10:48:37.940443'),
(10,'auth','0005_alter_user_last_login_null','2023-03-17 10:48:38.005977'),
(11,'auth','0006_require_contenttypes_0002','2023-03-17 10:48:38.013959'),
(12,'auth','0007_alter_validators_add_error_messages','2023-03-17 10:48:38.021957'),
(13,'auth','0008_alter_user_username_max_length','2023-03-17 10:48:38.101821'),
(14,'auth','0009_alter_user_last_name_max_length','2023-03-17 10:48:38.182419'),
(15,'auth','0010_alter_group_name_max_length','2023-03-17 10:48:38.214990'),
(16,'auth','0011_update_proxy_permissions','2023-03-17 10:48:38.214990'),
(17,'auth','0012_alter_user_first_name_max_length','2023-03-17 10:48:38.298370'),
(18,'selector','0001_initial','2023-03-17 10:48:40.165004'),
(19,'sessions','0001_initial','2023-03-17 10:48:40.205695');

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

/*Table structure for table `selector_applied` */

DROP TABLE IF EXISTS `selector_applied`;

CREATE TABLE `selector_applied` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `resume` varchar(100) NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  `cid_id` bigint NOT NULL,
  `vid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_applied_candidate_id_id_18827c45_fk_selector_` (`candidate_id_id`),
  KEY `selector_applied_cid_id_2b06ff4a_fk_selector_company_id` (`cid_id`),
  KEY `selector_applied_vid_id_220f61cd_fk_selector_vacancy_id` (`vid_id`),
  CONSTRAINT `selector_applied_candidate_id_id_18827c45_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`),
  CONSTRAINT `selector_applied_cid_id_2b06ff4a_fk_selector_company_id` FOREIGN KEY (`cid_id`) REFERENCES `selector_company` (`id`),
  CONSTRAINT `selector_applied_vid_id_220f61cd_fk_selector_vacancy_id` FOREIGN KEY (`vid_id`) REFERENCES `selector_vacancy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_applied` */

/*Table structure for table `selector_candidate` */

DROP TABLE IF EXISTS `selector_candidate`;

CREATE TABLE `selector_candidate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_candidate_lid_id_31eb0c5b_fk_selector_login_id` (`lid_id`),
  CONSTRAINT `selector_candidate_lid_id_31eb0c5b_fk_selector_login_id` FOREIGN KEY (`lid_id`) REFERENCES `selector_login` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_candidate` */

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_career_guidance` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_company` */

/*Table structure for table `selector_company_complaint` */

DROP TABLE IF EXISTS `selector_company_complaint`;

CREATE TABLE `selector_company_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `complaint` varchar(500) NOT NULL,
  `reply` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_company_com_candidate_id_id_cd453ba2_fk_selector_` (`candidate_id_id`),
  CONSTRAINT `selector_company_com_candidate_id_id_cd453ba2_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_company_complaint` */

/*Table structure for table `selector_feedback` */

DROP TABLE IF EXISTS `selector_feedback`;

CREATE TABLE `selector_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(500) NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_feedback_candidate_id_id_4545f35e_fk_selector_` (`candidate_id_id`),
  CONSTRAINT `selector_feedback_candidate_id_id_4545f35e_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_feedback` */

/*Table structure for table `selector_login` */

DROP TABLE IF EXISTS `selector_login`;

CREATE TABLE `selector_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `utype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_login` */

/*Table structure for table `selector_mock_result` */

DROP TABLE IF EXISTS `selector_mock_result`;

CREATE TABLE `selector_mock_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  `mock_id_id` bigint NOT NULL,
  `vid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_mock_result_candidate_id_id_91b8d837_fk_selector_` (`candidate_id_id`),
  KEY `selector_mock_result_mock_id_id_485e1ccd_fk_selector_` (`mock_id_id`),
  KEY `selector_mock_result_vid_id_54576297_fk_selector_vacancy_id` (`vid_id`),
  CONSTRAINT `selector_mock_result_candidate_id_id_91b8d837_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`),
  CONSTRAINT `selector_mock_result_mock_id_id_485e1ccd_fk_selector_` FOREIGN KEY (`mock_id_id`) REFERENCES `selector_mock_test_questions` (`id`),
  CONSTRAINT `selector_mock_result_vid_id_54576297_fk_selector_vacancy_id` FOREIGN KEY (`vid_id`) REFERENCES `selector_vacancy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_mock_result` */

/*Table structure for table `selector_mock_test_questions` */

DROP TABLE IF EXISTS `selector_mock_test_questions`;

CREATE TABLE `selector_mock_test_questions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `question` varchar(500) NOT NULL,
  `option1` varchar(100) NOT NULL,
  `option2` varchar(100) NOT NULL,
  `option3` varchar(100) NOT NULL,
  `option4` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  `cg_id_id` bigint NOT NULL,
  `vid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_mock_test_q_candidate_id_id_81955026_fk_selector_` (`candidate_id_id`),
  KEY `selector_mock_test_q_cg_id_id_599de567_fk_selector_` (`cg_id_id`),
  KEY `selector_mock_test_q_vid_id_d5b45aa9_fk_selector_` (`vid_id`),
  CONSTRAINT `selector_mock_test_q_candidate_id_id_81955026_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`),
  CONSTRAINT `selector_mock_test_q_cg_id_id_599de567_fk_selector_` FOREIGN KEY (`cg_id_id`) REFERENCES `selector_career_guidance` (`id`),
  CONSTRAINT `selector_mock_test_q_vid_id_d5b45aa9_fk_selector_` FOREIGN KEY (`vid_id`) REFERENCES `selector_vacancy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_mock_test_questions` */

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
  `question_id` int NOT NULL,
  `question` varchar(500) NOT NULL,
  `option1` varchar(100) NOT NULL,
  `option2` varchar(100) NOT NULL,
  `option3` varchar(100) NOT NULL,
  `option4` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  `cid_id` bigint NOT NULL,
  `vid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_test_questions_vid_id_6418d3ea_fk_selector_vacancy_id` (`vid_id`),
  KEY `selector_test_questi_candidate_id_id_4d6fe36c_fk_selector_` (`candidate_id_id`),
  KEY `selector_test_questi_cid_id_24941c95_fk_selector_` (`cid_id`),
  CONSTRAINT `selector_test_questi_candidate_id_id_4d6fe36c_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`),
  CONSTRAINT `selector_test_questi_cid_id_24941c95_fk_selector_` FOREIGN KEY (`cid_id`) REFERENCES `selector_career_guidance` (`id`),
  CONSTRAINT `selector_test_questions_vid_id_6418d3ea_fk_selector_vacancy_id` FOREIGN KEY (`vid_id`) REFERENCES `selector_vacancy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_test_questions` */

/*Table structure for table `selector_test_result` */

DROP TABLE IF EXISTS `selector_test_result`;

CREATE TABLE `selector_test_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `candidate_id_id` bigint NOT NULL,
  `test_id_id` bigint NOT NULL,
  `vid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_test_result_candidate_id_id_82d70455_fk_selector_` (`candidate_id_id`),
  KEY `selector_test_result_test_id_id_2e349579_fk_selector_` (`test_id_id`),
  KEY `selector_test_result_vid_id_46e46dd3_fk_selector_vacancy_id` (`vid_id`),
  CONSTRAINT `selector_test_result_candidate_id_id_82d70455_fk_selector_` FOREIGN KEY (`candidate_id_id`) REFERENCES `selector_candidate` (`id`),
  CONSTRAINT `selector_test_result_test_id_id_2e349579_fk_selector_` FOREIGN KEY (`test_id_id`) REFERENCES `selector_test_questions` (`id`),
  CONSTRAINT `selector_test_result_vid_id_46e46dd3_fk_selector_vacancy_id` FOREIGN KEY (`vid_id`) REFERENCES `selector_vacancy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_test_result` */

/*Table structure for table `selector_tips` */

DROP TABLE IF EXISTS `selector_tips`;

CREATE TABLE `selector_tips` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(500) NOT NULL,
  `cg_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_tips_cg_id_id_b1cf973f_fk_selector_career_guidance_id` (`cg_id_id`),
  CONSTRAINT `selector_tips_cg_id_id_b1cf973f_fk_selector_career_guidance_id` FOREIGN KEY (`cg_id_id`) REFERENCES `selector_career_guidance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_tips` */

/*Table structure for table `selector_vacancy` */

DROP TABLE IF EXISTS `selector_vacancy`;

CREATE TABLE `selector_vacancy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vacancy` varchar(100) NOT NULL,
  `requirments` varchar(300) NOT NULL,
  `cid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_vacancy_cid_id_40c07d8a_fk_selector_company_id` (`cid_id`),
  CONSTRAINT `selector_vacancy_cid_id_40c07d8a_fk_selector_company_id` FOREIGN KEY (`cid_id`) REFERENCES `selector_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_vacancy` */

/*Table structure for table `selector_videos` */

DROP TABLE IF EXISTS `selector_videos`;

CREATE TABLE `selector_videos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cg_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector_videos_cg_id_id_8ec73db2_fk_selector_career_guidance_id` (`cg_id_id`),
  CONSTRAINT `selector_videos_cg_id_id_8ec73db2_fk_selector_career_guidance_id` FOREIGN KEY (`cg_id_id`) REFERENCES `selector_career_guidance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `selector_videos` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
