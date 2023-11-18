/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 11.2.0-MariaDB : Database - pantry
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pantry` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `pantry`;

/*Table structure for table `MT_Community` */

DROP TABLE IF EXISTS `MT_Community`;

CREATE TABLE `MT_Community` (
  `CommunityID` bigint(20) NOT NULL,
  `ProfileID` bigint(20) NOT NULL,
  `RecipeID` bigint(20) DEFAULT NULL,
  `Content` text NOT NULL,
  `ContentImage` varchar(50) NOT NULL,
  `ReferenceTableStatusID` bigint(20) NOT NULL DEFAULT 1,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CommunityID`),
  KEY `FK_Community_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  KEY `FK_Community_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_Community_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  KEY `FK_Community_ProfileID` (`ProfileID`),
  KEY `FK_Community_RecipeID` (`RecipeID`),
  CONSTRAINT `FK_Community_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Community_ProfileID` FOREIGN KEY (`ProfileID`) REFERENCES `M_Profile` (`ProfileID`),
  CONSTRAINT `FK_Community_RecipeID` FOREIGN KEY (`RecipeID`) REFERENCES `T_Recipe` (`RecipeID`),
  CONSTRAINT `FK_Community_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Community_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `MT_Community` */

/*Table structure for table `MT_Experts` */

DROP TABLE IF EXISTS `MT_Experts`;

CREATE TABLE `MT_Experts` (
  `ExpertsID` bigint(20) NOT NULL,
  `ProfileID` bigint(20) NOT NULL,
  `LicenseID` bigint(20) NOT NULL,
  `PantryID` bigint(20) DEFAULT NULL,
  `Points` varchar(30) NOT NULL DEFAULT '0',
  `ReferenceExpertsStatusID` bigint(20) DEFAULT 5,
  `ReferenceTableStatusID` bigint(20) NOT NULL DEFAULT 1,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLogInID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLogInID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ExpertsID`),
  KEY `FK_Experts_LicenseID` (`LicenseID`),
  KEY `FK_Experts_PantryID` (`PantryID`),
  KEY `FK_Experts_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  KEY `FK_Experts_AddedByUserLogInID` (`AddedByUserLogInID`),
  KEY `FK_Experts_UpdatedByUserLogInID` (`UpdatedByUserLogInID`),
  KEY `FK_Experts_ProfileID` (`ProfileID`),
  CONSTRAINT `FK_Experts_AddedByUserLogInID` FOREIGN KEY (`AddedByUserLogInID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Experts_LicenseID` FOREIGN KEY (`LicenseID`) REFERENCES `M_License` (`LicenseID`),
  CONSTRAINT `FK_Experts_PantryID` FOREIGN KEY (`PantryID`) REFERENCES `t_pantry` (`PantryID`),
  CONSTRAINT `FK_Experts_ProfileID` FOREIGN KEY (`ProfileID`) REFERENCES `M_Profile` (`ProfileID`),
  CONSTRAINT `FK_Experts_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Experts_UpdatedByUserLogInID` FOREIGN KEY (`UpdatedByUserLogInID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `MT_Experts` */

insert  into `MT_Experts`(`ExpertsID`,`ProfileID`,`LicenseID`,`PantryID`,`Points`,`ReferenceExpertsStatusID`,`ReferenceTableStatusID`,`DateAdded`,`AddedByUserLogInID`,`DateUpdated`,`UpdatedByUserLogInID`) values 
(1,9,1,NULL,'0',5,1,'2023-08-21 11:57:51',1,NULL,NULL),
(2,10,2,NULL,'0',5,1,'2023-08-21 15:39:13',1,NULL,NULL),
(3,8,1,NULL,'0',5,1,'2023-08-21 20:26:07',1,NULL,NULL),
(4,11,3,NULL,'0',5,1,'2023-08-21 20:29:04',1,NULL,NULL),
(5,12,4,NULL,'0',5,1,'2023-08-21 20:33:02',1,NULL,NULL),
(6,13,5,NULL,'0',6,1,'2023-08-21 20:43:51',1,NULL,NULL),
(7,14,6,NULL,'0',6,1,'2023-08-21 21:06:21',1,'2023-08-22 22:10:41',18),
(8,17,7,NULL,'0',6,1,'2023-08-22 21:43:13',1,'2023-08-22 22:19:35',1),
(9,18,8,NULL,'0',6,1,'2023-08-22 22:13:46',1,'2023-08-22 22:20:07',1),
(10,20,9,NULL,'0',5,1,'2023-08-22 22:28:01',1,NULL,NULL),
(11,23,10,NULL,'0',6,1,'2023-11-06 13:18:24',1,'2023-11-06 13:35:04',1);

/*Table structure for table `MT_MealPlan` */

DROP TABLE IF EXISTS `MT_MealPlan`;

CREATE TABLE `MT_MealPlan` (
  `MealPlanID` bigint(20) NOT NULL,
  `ProfileID` bigint(20) NOT NULL,
  `RecipeID` bigint(20) NOT NULL,
  `MealType` varchar(50) NOT NULL,
  `MealPlanDate` date NOT NULL,
  `ReferenceTableStatusID` bigint(20) NOT NULL DEFAULT 1,
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`MealPlanID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `MT_MealPlan` */

insert  into `MT_MealPlan`(`MealPlanID`,`ProfileID`,`RecipeID`,`MealType`,`MealPlanDate`,`ReferenceTableStatusID`,`AddedByUserLoginID`,`DateAdded`,`UpdatedByUserLoginID`,`DateUpdated`) values 
(1,21,1,'Breakfast','2023-11-02',2,1,'2023-11-02 21:18:15',23,'2023-11-15 11:56:20'),
(2,22,1,'Breakfast','2023-11-06',1,22,'2023-11-05 18:10:03',NULL,NULL),
(3,21,1,'Breakfast','2023-11-02',1,1,'2023-11-06 16:20:11',NULL,NULL),
(4,22,2,'Lunch','2023-11-02',1,22,'2023-11-06 16:20:46',NULL,NULL),
(5,22,2,'Lunch','2023-11-11',1,22,'2023-11-06 16:22:27',NULL,NULL),
(6,22,1,'Dinner','2023-11-02',1,22,'2023-11-09 19:38:16',NULL,NULL),
(7,22,2,'Dinner','2023-11-16',1,22,'2023-11-15 01:37:56',NULL,NULL),
(8,22,1,'Dinner','2023-11-16',1,22,'2023-11-15 01:39:49',NULL,NULL),
(9,22,2,'Dinner','2023-11-16',1,22,'2023-11-15 01:39:57',NULL,NULL),
(10,22,2,'Breakfast','2023-11-29',1,22,'2023-11-15 02:04:07',NULL,NULL),
(11,22,4,'Breakfast','2023-11-02',1,22,'2023-11-15 02:05:58',NULL,NULL),
(12,22,1,'Breakfast','2023-11-02',1,22,'2023-11-15 02:06:22',NULL,NULL),
(13,22,4,'Breakfast','2023-11-02',1,22,'2023-11-15 02:06:47',NULL,NULL),
(14,22,1,'Breakfast','2023-11-02',1,22,'2023-11-15 02:07:41',NULL,NULL),
(15,22,4,'Breakfast','2023-11-02',1,22,'2023-11-15 02:07:51',NULL,NULL),
(16,22,1,'Breakfast','2023-11-02',1,22,'2023-11-15 02:08:18',NULL,NULL),
(17,22,1,'Breakfast','2023-11-02',1,22,'2023-11-15 02:08:30',NULL,NULL),
(18,22,1,'Breakfast','2023-11-02',1,22,'2023-11-15 02:10:09',NULL,NULL),
(19,22,1,'Breakfast','2023-11-02',1,22,'2023-11-15 02:10:17',NULL,NULL),
(20,22,1,'Breakfast','2023-11-02',1,22,'2023-11-15 02:10:30',NULL,NULL),
(21,22,1,'Breakfast','2023-11-02',1,22,'2023-11-15 02:11:20',NULL,NULL),
(22,23,1,'Lunch','2023-01-01',2,23,'2023-11-15 11:49:29',23,'2023-11-15 11:58:11'),
(23,23,2,'Lunch','2023-01-31',1,23,'2023-11-17 10:04:02',NULL,NULL),
(24,23,1,'Lunch','2023-01-27',1,23,'2023-11-17 10:59:09',NULL,NULL),
(25,23,1,'Lunch','2023-01-17',2,23,'2023-11-17 11:06:35',23,'2023-11-17 11:08:25'),
(26,23,1,'Lunch','2023-01-17',1,23,'2023-11-17 11:08:10',NULL,NULL),
(27,22,1,'Breakfast','2023-11-18',1,22,'2023-11-17 17:11:18',NULL,NULL),
(28,22,2,'Breakfast','2023-11-18',1,22,'2023-11-17 17:11:24',NULL,NULL),
(29,22,3,'Lunch','2023-11-18',1,22,'2023-11-17 17:12:59',NULL,NULL),
(30,22,4,'Lunch','2023-11-18',1,22,'2023-11-17 17:13:37',NULL,NULL),
(31,22,1,'Breakfast','2023-11-17',1,22,'2023-11-17 21:36:47',NULL,NULL),
(32,22,4,'Breakfast','2023-11-17',1,22,'2023-11-17 21:36:55',NULL,NULL),
(33,22,1,'Breakfast','2023-11-23',1,22,'2023-11-17 22:07:29',NULL,NULL),
(34,22,3,'Breakfast','2023-11-21',1,22,'2023-11-17 22:32:50',NULL,NULL),
(35,22,1,'Breakfast','2023-11-26',1,22,'2023-11-17 22:35:13',NULL,NULL),
(36,22,1,'Lunch','2023-11-27',1,22,'2023-11-17 22:37:45',NULL,NULL),
(37,22,1,'Breakfast','2023-11-13',1,22,'2023-11-17 22:43:10',NULL,NULL),
(38,22,1,'Dinner','2023-11-05',1,22,'2023-11-17 22:44:47',NULL,NULL),
(39,22,2,'Dinner','2023-11-05',1,22,'2023-11-17 22:45:02',NULL,NULL),
(40,22,3,'Dinner','2023-11-05',1,22,'2023-11-17 22:46:36',NULL,NULL),
(41,22,1,'Dinner','2023-11-12',1,22,'2023-11-17 22:53:15',NULL,NULL),
(42,22,3,'Lunch','2023-11-08',1,22,'2023-11-17 22:59:55',NULL,NULL),
(43,22,4,'Breakfast','2023-11-08',1,22,'2023-11-17 23:00:01',NULL,NULL),
(44,22,1,'Dinner','2023-11-30',1,22,'2023-11-17 23:03:31',NULL,NULL);

/*Table structure for table `M_Cheffies` */

DROP TABLE IF EXISTS `M_Cheffies`;

CREATE TABLE `M_Cheffies` (
  `CheffiesID` bigint(20) NOT NULL,
  `UserGroupID` bigint(20) DEFAULT 5,
  `ProfileID` bigint(20) NOT NULL,
  `ReligionID` bigint(20) NOT NULL,
  `HealthProblemsID` bigint(20) DEFAULT NULL,
  `ReferenceTableStatusID` bigint(20) NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CheffiesID`),
  KEY `FK_Cheffties_ReligionID` (`ReligionID`),
  KEY `FK_Cheffties_HealthProblemsID` (`HealthProblemsID`),
  KEY `FK_Cheffties_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  KEY `FK_Cheffties_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_Cheffties_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  KEY `FK_Cheffies_ProfileID` (`ProfileID`),
  KEY `FK_Cheffies_UserGroupID` (`UserGroupID`),
  CONSTRAINT `FK_Cheffies_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Cheffies_HealthProblemsID` FOREIGN KEY (`HealthProblemsID`) REFERENCES `M_HealthProblems` (`HealthProblemsID`),
  CONSTRAINT `FK_Cheffies_ProfileID` FOREIGN KEY (`ProfileID`) REFERENCES `M_Profile` (`ProfileID`),
  CONSTRAINT `FK_Cheffies_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Cheffies_ReligionID` FOREIGN KEY (`ReligionID`) REFERENCES `M_Religion` (`ReligionID`),
  CONSTRAINT `FK_Cheffies_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Cheffies_UserGroupID` FOREIGN KEY (`UserGroupID`) REFERENCES `M_UserGroup` (`UserGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `M_Cheffies` */

insert  into `M_Cheffies`(`CheffiesID`,`UserGroupID`,`ProfileID`,`ReligionID`,`HealthProblemsID`,`ReferenceTableStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,5,21,1,1,1,'2023-08-25 21:17:51',1,'2023-11-02 19:43:21',1),
(2,5,22,1,1,1,'2023-10-20 18:10:53',1,NULL,NULL);

/*Table structure for table `M_HealthProblems` */

DROP TABLE IF EXISTS `M_HealthProblems`;

CREATE TABLE `M_HealthProblems` (
  `HealthProblemsID` bigint(20) NOT NULL,
  `HealthCondition` varbinary(50) DEFAULT NULL,
  `Allergies` varchar(100) DEFAULT NULL,
  `MedicalHistory` varchar(500) DEFAULT NULL,
  `ReferenceTableStatusID` bigint(20) DEFAULT 1,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`HealthProblemsID`),
  KEY `FK_HealthProblems_ReferenceHealthProblemsID` (`ReferenceTableStatusID`),
  KEY `FK_HealthProblems_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_HealthProblems_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  CONSTRAINT `FK_HealthProblems_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_HealthProblems_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_HealthProblems_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `M_HealthProblems` */

insert  into `M_HealthProblems`(`HealthProblemsID`,`HealthCondition`,`Allergies`,`MedicalHistory`,`ReferenceTableStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,'Blood Pressure','','',1,'2023-11-02 19:41:47',1,NULL,NULL),
(2,'Cholesterol',NULL,NULL,1,'2023-11-17 11:19:55',1,NULL,NULL),
(3,NULL,'Shellfish',NULL,1,'2023-11-17 11:21:02',1,NULL,NULL);

/*Table structure for table `M_Ingredients` */

DROP TABLE IF EXISTS `M_Ingredients`;

CREATE TABLE `M_Ingredients` (
  `IngredientsID` bigint(20) NOT NULL,
  `IngredientsName` varchar(50) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `NutritionalInformation` varchar(50) NOT NULL,
  `ReferenceTableStatusID` bigint(20) NOT NULL DEFAULT 1,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` date DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`IngredientsID`),
  KEY `FK_Ingredients_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  KEY `FK_Ingredients_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_Ingredients_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  CONSTRAINT `FK_Ingredients_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Ingredients_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Ingredients_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `M_Ingredients` */

insert  into `M_Ingredients`(`IngredientsID`,`IngredientsName`,`Category`,`NutritionalInformation`,`ReferenceTableStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,'apple','fruits','calories 95',1,'2023-08-23 20:23:43',1,NULL,NULL),
(2,'orange','fruits','sugar 55',1,'2023-08-23 20:42:43',1,NULL,NULL),
(3,'bread','pastry','wheat',1,'2023-08-25 21:27:39',1,NULL,NULL);

/*Table structure for table `M_License` */

DROP TABLE IF EXISTS `M_License`;

CREATE TABLE `M_License` (
  `LicenseID` bigint(20) NOT NULL,
  `LicenseType` varchar(20) NOT NULL,
  `Certificate_Pic` longblob DEFAULT NULL,
  `License_Pic` blob DEFAULT NULL,
  `ReferenceTableStatusID` bigint(20) NOT NULL DEFAULT 1,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`LicenseID`),
  KEY `FK_License_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  KEY `FK_License_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_License_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  CONSTRAINT `FK_License_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_License_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_License_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `M_License` */

insert  into `M_License`(`LicenseID`,`LicenseType`,`Certificate_Pic`,`License_Pic`,`ReferenceTableStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,'SSS','test',NULL,1,'2023-08-21 11:57:51',1,NULL,NULL),
(2,'SSS','test',NULL,1,'2023-08-21 15:39:13',1,NULL,NULL),
(3,'SSS','test',NULL,1,'2023-08-21 20:29:04',1,NULL,NULL),
(4,'SSS','test',NULL,1,'2023-08-21 20:33:02',1,NULL,NULL),
(5,'Nurse','PRN',NULL,1,'2023-08-21 20:43:51',1,NULL,NULL),
(6,'Nurse','PRN',NULL,1,'2023-08-21 21:06:21',1,NULL,NULL),
(7,'Nurse','PRN',NULL,1,'2023-08-22 21:43:13',1,NULL,NULL),
(8,'Nurse','PRN',NULL,1,'2023-08-22 22:13:46',1,NULL,NULL),
(9,'Nurse','PRN',NULL,1,'2023-08-22 22:28:01',1,NULL,NULL),
(10,'Nutritionist','����\0JFIF\0\0`\0`\0\0��\0C\0\n\n\n\r\r��\0C		\r\r��\0�o\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��X^/nU�)�dU$���I���vg߭L.d\n����Eu�\'��&���S��\rt>	����6��t��SR�8�W?R��Tz�����\0�WI����>%k3�^���\Zl�a�<�O�\0}j9�����X�#�㊁.�ZE,gj���(��?��ُ��`�t�\0�O���V�{��n��],|����?�T����5V�#��1�8x���@i�\0ڐ�k���w���~�³�;)ǂ��L��\0����_(��7A��}:�&�V/h��O��,��H�e�8�ǨB�^V���\0Z�?Z���\0�y����<����\0 ȏ��J��q����}4���\\�:?\rWQ�+*�Ђy\0y��SR���\\��9Ȑb�t���W��r{iЏ���/���?��=��G��G,�Ώ�K{�k�\'�G�o��N�������W���t0p��s�e�\0N��ш*4=,��\0N�4�d>t~G�$r$�b�c��f;�ӌw��ud\'q9��lll�Z��]/KUt�5�Ai�;J�~��N����8��|��G�0���Uf1�I�dʏ|�i�h���p�C\0��К��[�F��Ƹ崈g�Zj�f�Ǎ���Ŵ`l����!s��f72�m�GΨ<w����q�]�m%�#�h��k�U ��Y[O�`{X���l��3\r�}��Џ�<�:?ŋ�&ϲ����1�\0��8�=���!��H�[4j�LA��8��4�с\rkl;�G��:�5��Z�f�Q�O�AΏ�i,�e���;���m�����@\"�&�{*�iez�\Z���r�Wiӡ����=o#� 0A�rO��~���GA�B�d\r�(��r��GἺ~�qn�	�c�����;�0=N?j�O�q�=R�UeޣM�Xc��{W� �HՁ\nx�\0��cVF���ร���G���cU�tO�jG�ɖ=6`b��\nt�գuF�5IѶ+�ӦR[�/5��%�y`��~l���ӿ�%<���r˸���u/����C�z��$�͗���v��>ב���	�|��������w���pYw�u�:S��������v��+Iu2?�𯋭٢�\0�{Y�T���nq��w�E���J����^�J�\n���s���ҵW�*��y��j�zj\\f\'w�0����*_\0��X�k ��r�c>�s����i#����E����uܲL��v�cs�k�zM?,̨�a\\���t�����7\"�F���X�x��d��H�>�.c����9�����$���\n���FK�/8c�:\Z��m6�H�<l�1�oJ����a\"&T�]�?�\Z�2?��W�=2K��`�F��/�|�\0pu`6s�ǽC�\0\n��24��ח\n����}��cgA�����,���r~n	�4�a��o�%��O�1�G�T{��?	-���ۙ�\Z�%����\06�����U��Y��\Z��k�D�i҆*x#8��ި��5aB�@�E�*�\0�L3�U^A�~��#���I:x\'ĒK$��a��6�ϵ\"|\"��cg �n�q.�\\E��8I�M~���VtW���PX�jFR2��Sǽ���>\n����|����b�r0�d�NsU��-�c\n���9����[��3�~��i#�~NI��������H��2(��\\�0�>�A�7�<�0���t��J�r�n�=~�Ga���\0�-Դ�~ϦHJ(��ؤ�B�\'� 68�C1y�e�v>��旼?\n.>�J�v��-�2c�H61^@�s�������̇����e�N�#\'��ӭ~�\rj�!�3�����f��+@9�PR?	,�\0g��v�G���A$�Fd�O�06��1��U��\0g��\Z�M��8}��p�p��!��������5ʌ�j6���.�q\0#8=h��̏�F��~*�ܸ�u�S$��\n�H���jA�5�O��Ὴ%�a\r*�>�����_�q̭-̂B��/$�i�3�n���{�̏��_ُ��f�^*eܱ͛�FI�q�O���u�yΈ��o�y!�G ���ʆ�O��Ұ���Q�I]	��,L�ĀFH���������\0f?�qH�6�\0|F�F<�Ti�A�W��x�*t��~-��9>x��ш��2~f��pFIϵ~�%̾Ky�3H�PF��v}}*´�I��b�l1�#���W?\r.�dϋ�!ᧈ�U�Y,r>`\0��5;~��u+�F�a�U�Ymv�s_���+�IJ�p>cۦj4�hb���2�y�Q���?�/�8�H�~���Q#�\0���lz�ե��~3ú�\Z��6iT�c�0�r{��k���!s���\0zT��������x9����d�p��A���ȸ��*0��j6��~4\\B��1�,C�G�:��kt���q#�?���aE��`���.�.���KP�?�i�;���0׎��[/�G`wt�N��/ƨK\\��ݹ�yk\Z}���zw���ui ��\n�n�����T�)�&��Nx\0��Q�g���1G�{�Ls|5�\n���vF�xeۗ�GN*k�ؗ�f�!�|0�lǘY�F#*���ܯ��#����֧�e��w�y�Q3�?د㤛��u��Dr�HH�\'���	��ޙ7�G�E`�5���%�2�p��s_�WS47&�<��\0��K:�aݖ?30�OQ��~��\0�|7ԉt\n��D\n1��`���6O�3ᶤA�O1c������f��W!3�ێ�RUy�5#R7�Ǯ9�P?W�#��u�-��8��B�Q��AQrKn���a�sC�x�x#�2 :��Y��He~A���R��^)�\n�n�O@�X����c��oe���ḛ�\"UeNF���>�s��՜�<$J0��P�W�@}k��<H�j���\r an�\00_���{١]C���zz�|�7$��v�b_,Цp~��o��㝬N[��������H9a�c�~�y\'�ݒ˴\r���ۮ%�Dk����C��m��\0�||w�3�k���\Z@U��#�z�	���i�\0�O?�V�L����$�ڔJ[=�O�ڿan�x�jϞ�^N���wl�d~B���㴂	%�-Rh�(uh70\'�=*M7�	���D�4-:.6cY���n����oT%��QF�U�J}Gj.c�z��	�񵮘͢��nG\Z�\n@��R[�;>;�:�z6��W\nN��9�ʿV�D�X�Ns�������iwc�����ؘg����Y�b�aTV�\'�&���\0�o|i��^/��!�1��\0�Q*�}F+�=~h@\0nS����S���}Ú��?�;s㇓,t%�!diWW�n��-�5$��Mߍ?dT���!��.˭�S#�B��rz��~�n~F�\0�b�;4��bKw�;0��Mu�\0���f����co�2\riO��`���U��v��y�bO;A�c ��YNa@�\0*�I�K�ĕ?(��!���A���E�\\��?�M���`��}-1P��MQ[9�\'J��\0���Dq�%�\\*��H\'����������͎*<���yb���?/t��&/ţ|&����זr�/�P:`\'��O_�&����:��y2	o�@��Ur�1_��_���yƑ�۾00\0���P�?0�	��f6������ܾ��l\'��=�5�\0�_�Xk��\0���Z��gk�b����ڿO�b�I��֥�&F���jz�C�\n�&w����V��ĲE�u���Gh�#oɀ���Mo�&��jR�\\�d��H�u+31\'$��������O#�Ts*�\'�1F�t��k_�&��Y����\n��f$����5�\0����F��c��\r*�\\3���G�ҿN��-���Ui$8�OLѨ����\'��������|/�3(���o�g�_�V���cW��_�\0��p���<�J�-e&;��}��ݴg�J��s#�%�\0��?b�3G���0-��<t�\0W�X��	o�xcY|S�6;~c���~���^�4��E��j{1]3�S�[�	�\ZQ�o*�q���1�}�j�?�J_���\'>v��\r\r�\0�|��M3nW9��憟q�~Wx����}r�na����;\0q$#\'��;u�\0e��?�V_�������d���V9�G\'�sX�^�O�W�N�k$�Uχ<HTdCgz��q�D�2\Z�o��_��I񏆵ީ�K؈;���\0�W�}�ノ���5��煾+xn_��C���(;c��yF?ćV�qK������Z���_��Ҿ����\0`��\0��P>)�\\�?.d�Y?y>������z+�8���b�&x#�O1}.X�w��]7��\0��<�u���Z���{2Ao\n�1��{�OlV���\nW��	�\0�n�\"M?I־!�D���i��l\033}s�1[�t3z#迀�\0�;�>�N=.��X�kj\Z���3����á�z��4��͑���A\"�7\rħ�8c��=��Z�^%S����˘j�y���9T�f�v�\"٘�.�2v��Khя��v��Y#F���X��(�T�\r���EV�z5Pˌw�l\0��U��̀�����T`��w�1�j�Nj&�r9�� S���9\0�ޕ��v��[\"��H������Y������:\nf��n2)j-�`�Zd�t��j��9�����Nᠪ�)8(OSH����O�G�Nw�y�#8�4\\v-4�\0�9늯$�6��H�����#[��l�sPp�NE7�\n�\0�zzS��k�w)��O[w*���������18�N���ʻ7��tv���^?JC�!Rzb���6�*�\ZL�q��U����;°\\��s)�a��T�Z��1$�����*���;���(��XY��x���5s��L�&}�wFO5�o��X�.����޵\Z�#L !�\n�Z�-�8ݻ\'���PYAth���m�|�<�՛{0�g�ʁ��sV#����c��9�꿖[�p�vi����wHqP���\n�7��7�X~Up@�1�U�c*ё�g�ŶE坟j��0�\\�j$�9����Ƨ��ԏ�?6q�V��\\1\'�z���Ok5U�`<0�V��#�qa��J��#m-��#��S\'ku=�Ec$,Iܝ��M�&��9#��QP�kee���o��ހ-��}�3QI��C1*�n�\0Je�$���`�H�\'\0z��X����6F�9�\02���UG<r}��#b���(���4���t���BB���`��X�3xQ�m��Ks�ݲ0��\0\rY�w��b���$�x�i��Y�@N�G�Z�l�f��Gz��C(�~Pr=�9+z�����!B�`���\0��U�|�`6�@~�<S��Y@Nz��TR2�q?q_p������&�mm�c��Kv�b2�����]�I�H��Mpɵ#\\�s�\0�@d��\r�r�z\n#aC�+�r\n�O֨�#��#��vbö���~g��BN���h��ׅՕ�]��<���L����\0����۫	�8>v��ZQ���Glȧi8���n���3��m��U�%b0�=\rM4�����.0\rg�=��9RU����[e��\r��Wp>��=�F<�۞���.��9#��S��RFI%x���&x 0�\n@>�H�-#���&�s\'���-#s��H�d*>�c��H��?�,r\"B�\"�\r�*� �h�1��l?�\0�ˎ���{�A��0�0S�����m�p�A����W&�n�ER�ۉ��S��f�/��Uc�1�����知23�eo0ŝ�sԚ��,[�-�N�(�.j]�����8�lv��$tǥB��F�lu�\n9\ZH����y�:�2��2�w��y+��}i���#{	:\0͐G��\n:m�p\\H�_�ٟ�c��WM����\'v�Ǌl��q.I��U��]���>�\0ѹ��m��f.\Z?-7��K7�9+���U���X�s�4�E}#C��9�O��RK���e���8�Cx6�&������Pf-�s`�\r�Wb[%����!��OOjn��8�%�����V�	\0d�@/*8���#y#�~�G�=,\nN�	�4\0��������Y�a�4�,?ڨշL���{P��Y�F=�nb9QS*|�A�q֐�[�J���\0#I��P�<��h�m^W8��>�[#�\0,���*G�;�p�c��O�i����E�2)Q]�)�#>�m>u\0��x��v�ZFf`[ڥ���C1�4�(Y�83@*��0\rQ�֓q�\n}�y����J!]�<s@�?�~�\n�T�&\0�}�Bu �!��{SU��f9����\n�s�GJ\"�㜎����29�E\"�-�PM���#��xۉ���=��lN��}x�g�v�U�v��su7��[8�����sQ*���Qپ�Q\0���Ɩ�G\0e�q�W�k���<���tR��:��i�}�ƀ�����s�\0𴡚�NO�I��Q�e�X��U!��[qc~�k��/�Y��]�pi�`\r��ҫ���J�e���[�~���w	����ܫ<KHY���h��;V��~#E�Eoqd`��fݶm:O0u88;{gօ�I�ɠ���Bve�B��I�fzt�=7^�Ԣ\r�ʟ�~�Py���af��(�]���/�=��M�>i��\\p*C�\'�4�CPሦI��g��d�69�Y�\\=�j�\\9��;h?Z�t�h:����U��58�vPC�.�סW��!�&��k�Ѭ�F�iq��,.�g̷rJr>����1-���$����Vφ��?x��\\i�-����Y�7&�K��s�TtӗF~hi�:�nwc5�%�.�]<7�7�\n�\0d��[��Q�������\Z���UNI<��~����\0�+��1��±�)?��V���oC���Y��zA�T��O�&#R:\'��H�r��\0V��i�}�tb!�qɭ���2[H̭�Y�C(4�_9��\"�s��_�J�ă�1��o�5�/i��jW�鶐��M)�\Z�\0�N3�ҺӢ��$R��r�\ry���zw�U�)5���� ��_2yx�Ga�5��o�\n,<\'ms��^L,P��� �dیc�	�*��_�Z�>!�\0���2j��_�9��X�RH>���H�����$�ʃ�%��`�c��)~%|O��O�9�=pu/8A8%b��\'���~X�S����>�ך|m����P����ϧ۽ͼ�o$r���\'\0�����.�������\'�:��������\0�lo���-_dԾ^\'�g�x!����s]�?�[���5�{���� s��H�?�_�q���_�h1x�N��Oԙ��8�tEp��	����;[9ȯ�,<\'�}>+{t�C�E\ZcE��ZΜ�֥�ݏ�.�\0j�[qu�\0_�>��\\[,K\Z��Ĝ��^Ӡ��~\"��5=6�+��%�T�t#��خ�P�8����0,��F�c�AY�=��&�k�π���~�:��.$/>��kFn��=k����*{�<;A`	Z��,H����k㯄|D\"��Zj0_�Oi\'����8�8�M�L�j�2����IȎ[3��W��/�̌�d���GW�)���4zLb?/����24KC��M��52i2�b��A]�iaU\\�Z�t�*��v��h����B��h�jg=*�~ڤ��n��],v�j\"��Ҧ���.H�;QqX����UJ���1������C�1�o��*�\r�*=i��۳aC09�\r+�P]-#}���Gj���k�26����V��$�+�#������ZY�d�P9�LZ�f1��/V=A��j�+d�;Wy��D�S\'8j9.���{�jpv�cH��wX�v`�����Ѥ�,��ˋ#kg�r:�ڴ������*���*�M��=X0�|�1�2�!D@G\'8������.G�#>�c��r��;��÷��\n4$�\" �+s�����n\nʧ�O�.��S�Wp|6?0?v��������i&�go/�3���adX�R_�rx���LA\"A�6�P��k���u��55��6��5�F8#�����:�I�L�N�~3�`P��m �c1�,��}�&�$f p1��ֶ5�Ozo���@�m��f�V�X�@��Tּ�▹�C�O�:��r����9�#ؤ*�Y~g�A���P���)��漫⇄?�(��}9�9u�v���E�;2�7�E&3�]ռ\'�/\rAk�H�[k��-��l�[�����E��{8溽G⶙�O}���j��4W���d��l@�1�N-�6޽k��<\n~x���>�U�{�,u�>���������+�\n7�n|E�jZo�/L��]������i.v�c\'�\'�Tܻ#�u�\Z^��X�F�������i�K���J��NG<d�\0`�å$�4��ϩ<W�47��w62������/#��^u����y�DO�9�@�ΰ���\'��;�u��K� c����k��W�-tk�e�u�+�=&dr�@1���\\�����Ut&�W����/b���5t��e\\�t077bOJ�\r�f�u�]Y�����SB�ծp>]��A\'n��r�C{u��������i�}��{n&���&fV>�rB��Ec�k���}���i�K6�^]A�����͞�\';���j��5�����y�j�:��o�z�I�]�~��L�_�o�1�:���i�j��݌j��\0�p���~~rH;��(\'��\\��\r�]G�	����~ժ�d��I�#�u�<���V�6����^2�sR���|5	��<�d	�.Rɴ�|\Zb�z6��KO�:v��J�W���ʠ�e����}1\\C�q���q�j�ᴟ��%����\0{y�w��+�������F�kQ����n�q�8���p�z�ב����X�\r��ڌ��ڶ���X\Z{��\0��݆�q�1����k���~1ͧ���=7M�K{_-!v�ٞrܘdB������_�(𥥆�yymuy����~ӕ!m�7V�\0���!��>���#�G#�ͣi�����4;���<��-i��}�=V�K��c�u_�\\�� �o,�˸���}���1��V�4k�\0���kİ����LvV���Gd���q���֍��cw��f�_[[���%�؅�0�n#�x���_W��~$���ڦ�{=�>N�l���?J�~\Z��6>��MR�l�ö�7�f�p�^[L����b��������	x�/Y�G�֙����k�>�O�C.pHe`r�yW���P��w��*����o��<Pè��d���$�����O�N�����o��Kǆ;xf�y�$D�wNĐ�;T�j;����|b��մx�\r$iE�p# �H~URz��s�Һ���\'�t�\'�������Z-���j�q<�w@��G��5�^���w^��=���S�4��/�fXԜ��H\'�j��o����:>���SM�Ζֺ|��a�c*9�MA�?�:������M6��á�,N��c�s����9�<Gq#xe�o�4I<[q����yc�\'X�*�\0֭�ī_i�ʰ�5)/5��O<M3̃<��K*�Oj�Ѿ�Vq��Ma(h<Ys{>J-��U�\r��\'��z�������z�/�����uE�6��x�	#89��@���R]>\ry5m\Zm+YҴ��E�\\$�qo�9���ބqN�~*\\M���-겥���5�n|�.���v�y��e�k!��~(�tٴ8�9.�iku2�q���r\0�9�Z����_�\Z/�t����[i,���I%��2D��bPI���\r��&�d�(�?�x^��xluJK�K��d���<�a~T���O��T0j\Z�����������i�u{pp[r�pp\n{�r5�E�2Zͩ��?fl�~H��+g��\r�<W��jC\Z�&������I��S����C����MGn�}���������_iY$�y���g��ލ�Ko�V����]3��W�U�ѵ�����i�3�d�q��t_��wp�6g�旧�v����Z��MnUHgx�>�ͷ���57�<��:������Asr���v��j�y輒�ԏC�@��d���c�!O�nc��|��Um�f�ς9��W.��-����Y[�Kf\"��昘H�[y��rs�OJ��\nB!U�o@j��;C2밑�jϼ�.!p�19���ޝ���\Z���Z�� m�q�G+��㚆���u���5���I�<�����6��6���O�Qy�N�wA�2�:�Q�H�C\0ƟK�ڵ�X6���޴,����\n��>c�TrH6�3�z�mC��ѳ,{�J�i2��\rЕTe\0#56\0��aq�)��.X��61����;��Y� ����b�F_8���f�\Z��deF\rA+��	��ʬ�ڗpbv���E��9��[<S�id\n>��oZ�ily	���2�3`b����I�b�IFz�빊��#�[��a}hi��\0d������ �K��zR�λ�k���Lf9V��Nk�hv�d��R��ڍ�]�-Yc8a�v��+&��z�U�T�(tG|aGA���M��_J9C���\'����S#�Hσ�*�wtyl���>�rҳ[�K��C�<sUo/�l�BrNS���R�G�yϏ��=��	��]K��z�X���q�ۢ���r{\n�W�-7f��1��t�Y�w&����Xe��F-q&�8@�����*|9�.��$�/�,�\"t��Ň�4��U�0pzkɦ���\Zb��53U�,[B�|����G\Z2���uy�SX���^;K;K���lb�P�F{{		��S�m��q��8yU�M{�\'QSW5�]\'^����R�ũi�^\\_N���b`���X�����i�zD0�zTگ�����r�|ϕF�\",�#J௵I��{]Kƞ\"�K_�����4�fM̫#�!	�/��Mk�L�O�Ώ|����y`����8_62N=r���yd����>X�އ��:\\�ڇ��m<]����6a�Z[��YN79f\'{3�q��V�<?�/���C�[�m��ʼ0F��/(&�����l@W�A�(t%I�A��6Y@�=>�?>�i�Y�#r76���5����U�>���j������è %$���S%N񝧑X�˥~��]���>����Z��$�MӢV�֙B�J�b$�oyHy�Q������Z�(M��IH�lܼ��bb������}/���7W�f�Y��$��\\`���\'nq��+�5������e��~�ܴ��l�n$�\\�1��m��5\"P�c���R�9^�}�J2SG�^f�w\r�0*E\n��=���k�R��3����S��áA���2cw|WL%ή����K�q�\'9���D��Ǩ�M͆}ڮ����s����z��g�?��1_��~%�H��X�?~��\0���+�;��1^�v2��&��:n{r9?�QҖƑ��X�o(۸�~����J��\0�\nP�e:\r�]��1��Kª�W�o�����ޯ�J�����\r��|�������xE\Z\\2�E*��nF�jO.9��B�軲Mh*��ded�l���W���w����\ZӘ�͸U�K3,b0A���������`�c(�GB��Q#\0Fw��l���D$2�S���t�>�\\�F��xsİ�ͼ,Fm�%�B2*�m�{J�-le�����+\\F(N���8��z������/����D��W�d���X�g����;���o�|g���.����\Z���cI�1�rq�8bx�֢i�Dh{��[�VZ%��k��i�H��H��d�I��Ҽ�\r�����u�k2x[�;D�i֮�+\'f�����\0V.���w��\0����De��Yh�4wS-�E�F}9��,�>�����ꁴ��7l��E��V5V�\0��GN3\\،B��s�Ɣ��숼�_���7�����=N�i��p�/G,r2!�1� ��O���cŐ�#��/n�m7\\�&;������x=���>�ZXt�F��F�D�9��H�\0V����*s�Z�|;�Z��\r�H>���,�M^��y���(L�\0\'��nMp�*X�zeԥ(���f��i�4b��YI㍭�b����lq��V���g�A������{6�k5c�@e� u�^E�\r>�����n4M6�m\"\'����T�K��*�,AS�9�U�B ��>�ߦ�n�S������O���Y�RI�=6�ע����7N�࿂M��/��4Y�E��I#s���2�����vЬ(�${6��Je�����8��\nF�\0�W�%S�?&:��t��0m_C�~,�|!�\\j:�d���`�۞\0�\n?�K�[�۲��-X�Z���ι�s�§kc_ָ�\0��\0\r|���r�6��D�y��A���wS�g�ь��{�|u��[��&���.%�edOA��=J�u?���5��:�]Af�ܯ�� �88;���\Z�m��ϧ�Z��t�<���1�e���0�/���?��e�>\'���ѧ�����1�v?�W��{������>��E{٭$�\n�\n	���?Q^�5��\Z<*��9ϧ�p��ῇ�n�b���-A�B��%�\\0V=0:�֟��Iu��>��u��FH�abŀϢ��j=��VVdΣZ���\r\'P6��\0jԚ7��[*���\'�+��Oĭ#�M,:u�u�K;�P���+��W��E��6W������^y[��\"F?*�<}���<�����A�3X�ZKKi�$I�*��.��T*xZ�H?u-B����|S���[[_Et��2��� �@m��GW9g�Ixa�]R�Ǚ�\0�\r\\w�qmu��\r��t/h�\'�2�}���~����)Sј�Kg�:t��F���οR�ţh���۩���\0�TBNHn�͟�K�_g}K��ҞR��ѱX_�6�c�xBK�{Ћm��11\\{Uo\r�����+5��L�e���`�&��N��w��Q�O��3��ލ:)�Ԩ���;�c�+��7���7�Y��>��=�59�d�9���m���R��e�0��<��)ۜ��+��\0���<-y�A�-�s��$�	\r�\0��Rs��z��7z��=��4oL���e��V�쌾r�:�*Ǐ>\'i���޼�K&Lv��d������g�Ǉ��\0Z��嵭��,�cn��8�|e�=����	��-Y�:���iRC	�%?,���ƽ���}��8����4�������}{�_Z\\���_8��=	�Sڻ�x�����ژ5ͧɅ��n�x�&֯>|Z�N���`���ʩ,����h�0�<g��Z��0|-�f�I7�~��ie۸o\'�c�)Ӆ�)_��^\Z�T>.��5H�{{y���f\0��e ��#vk�|Q�Ih�e����]j1��<�+m���#\'��q�O����}�3a�g{R��+��b����\rt��\'o�^i��^�G�����Z�\0�\Zn1������-���Z7�\n��&���e����\0<�a����M�⽯�˫5����7BO+�*l�9?�y7�	A�mwJ�4K�=ĥ�cR��ǆ�=	NÎ�O��~��>����M���g��<~X�S��kf\'&�����n�Z�muV�\"��e���r8�9�r�~*Z�B�Ւ����l�iʐ�f^\0�-y��\\���\n�]ḅ�X̜[����\0�4���x� �\\j\09��\\c?���eI+��ݑ��>��n�Y�IR&TX��]ٰ\0\'�׿���\0~$Yx�;�!�kI��RH\'tc����^��?*���/T��XѼ=m����$TbIf�bR>���U>��>0]�#}�y\r��?xR�4�I8������=��=���Ŝ�)-��ǒB�b��չ�}Zh6:�0H�_B��� �V��\0=k�?i%f�J��z}֯B�V��	��aJ�F	�F8�d�.j�{[�2x�<@ѷۡ�{%�y���NGs����x�\0�I�_ͪ=�_w�>Ύ�s�����c\"*�$�ݰ+��\0hRo�����|��j��\"�%r�iz~��pJ�t�y���5®rzq����d��ox�ki-��7C�JP�9���������!����Z��W̲�!����A�\\χ��\'��9�-\0�K��9\\@�\0U�;F6�A�l\Z�#��1Rk���;[�+ė\ZD�4�oq�69�4p˸��8�F?\Z���!h\r	�нM҄��ۜ�O�+�K�P�jQ��-\Zt�ÓL����Mv1�n����k2ƍ�F�c�Qׂr>�J����os��|qk�x6����I`��]�yc$��^Q�~����C�����o�u)�r6���&��<x����b��������ˆ�;�Ʒ>xWI�O����8��g�+����UlȀ�]�ȃ��eh�<�m˖,��Ǎ\'�ڔz|��LԤɷV�<sq�F��O���m��i�ZigPk�;M�nd	��l�ڹ}k��5[j�>$��^\'�o������H$�5��D4��%���9Ly���\\cMi�7{��ަ�ṧf#����߄\'o#��q\r>)/�Rv���]�`��!nH�����c��\r��`����ƼS�tY?�|@�E�o-��Մ/�qYS��%~�J�#�>|U��j!t�,^�>�C+o݀\0�\0w?��HH&VA�Q�q�5�������d*ےffo���ۜgWб�\"��j	\0\n#8���dk��s�>0��z��΋+Z���y��P{�r?>,���X^��7V��B��h���`�rߴ���Qi\Z\'\rs?�*g%6����$�����?�?��e��m����̑�������Ȕ[B���f2���|@��q��\0O��hk$6ʱy�N�\\0B�;¹\rC㔺��̾��67?l�)4�$�YCp1������Vb�UIl����Z�x��ti � w72��OZ�r��ݯa�nefmk�\0$��kc��hv�V���i�cY�D�c�����=�+�-�I�����&�ce\r�/�#;F!N��Ҽ�����M�W���A�,ֆ0B��s���X�7��>�\"-/j.���\"�\'�\0��\Zq�S]Xܥ4˷_����^�<;L�����P��w)=}=��~�\\����Z<&�S�<ݜ2�����\rt>�}��|5�f#�`��M�ҹ9w\'�p��\n��\0�v��O�VW�o�&r�f8�j��}���#�k8�ԗ\"Ciۚ�q㯋�~�tzT:|S�)�����,\0�QϾk������;@�ʖOy��L��^�b��[��t�U{�X|��!��I\n���\'�>��B�cޟa(�7��T��=��S��S���=/៎\'�u��l�\r�!n�����I6i��P�Fx��ז~ϻ��w\0+0x9<��ks�6������.݂7��W9��ʲ�}�tCX�i����5ư����1u*;��u�꣦j���\0h�5Mv-��X�o��E��\Z+��ʍ�.Ip8�z����KX�/u��Q�������n�\0_a������j�UԞ�͉,���ļ�w8�+���IY�T��\0>\"i�\0tS{{�I$*��<y�?#ۂI�^\0ߴg���R�Ö�I��k3�9�2�)hF|[����!Q��~��\'�־���(4}l� E��<��@6���+{;��\n�vL�~|h�~\'Z���\Z�����pT���n���?i}_�~:��\"�[M>q\ZI3�I �яF�9b?\n�\Z��5��\r��y6�+���ys���n$�ڹ_�\ZH�ſ\Z\"�I,k-�F���ď��Z�R��)[F�dݬ}K�߈����ە��p�+3�{��^A�_��׾!x�\rT�l!������I�r��a�1ָ�x���\0f=\'K.^S�6�̣8�!�\0{�\n���=m�X�eh�d/�ky��a��a$֦r���:�\0���\"�ߎ���LқN�n^�A&���ś8G�׸���~�wy�p&�Gq������>nq_\Z��D:��ψ�q�	cS��0w\"�����[�/�3j������k@?7�,��?Үxh�C��Ԓm3��|z�� x�mV�O���*�j\\6T�c�9<�5k:�\0��W�wֶ��Y�ʬ��/}�s^1�մ�R��,��F���qn�V��f��<@���Kx��\n��Q��&��fڹ�|T�����e�,V��t� ��]B�TE�c�\'��<1�Jx��>,�J�ޑ�[y%D�A��\0~]���${�!����q�;B�:��\\[\\IK�\'�$NW�9=>��t��j�}�V��{K�}��3����f&zQ.D�n�*��l�/���g�5�5���-#�6�[h1�s�i5��|t���د���`�C5Zm5��8q��*��c�]��<1�_hqIx�2H�cnrZ��\r���6�k�4�ڛP�Ŵo�p�Fmn�f�H+�x�5�\'��UNm���?����᦯�~ͨ��Ҽ�r|��K���\n����)��\0�}b�X0yֳ�\Zh���BN���ҙ�{���7���=���DY���&�18lc_j�_��ĺ���P�I��6����:U*JQ�՘����<u�O��^�����M\n1�o�ϖG���\'֙���~9��Ei��	\\I�O��oۏ�����[��?���^����w-�ۼ��yJ�v�%�J�?kM���~�};���-张d��S�ۿ\Z�(Ƭhr�\\|�Psl���}ׅ>7��=<�5��s2y��r�r*�����|3p��1�Z�$*eC�:��;{m���Y�V���Ix���N�.>����Oற�_3��5�S$ѯ��\nK���Wգ����u%̭��|V�!����q����O$y���~l���8�+�\ny����[�����?�K)ʺ��`}:�{����ʟ�7LW2�*���e�fG�5��=&��0���#;�����/]\\�3[$�W�V�|�۩�#�uWV,�h?;:F\0���$ת�HԠ�����mͩ�3s��R�1��8��+�|3�mC�M������]�h�>$�obi���H� B�.጖\'���~������آ����\0¹�s����ƞ\'�Dw�6���Ka��ǖ�	`#\0�^ci�_��[QMQ�	�\\5������p��\Z���q<K�[�:�nn��)�J�q�P�� !�h�6rW-�^_�k���q-���Ρ&̙n�.Gݖ$zc��h�������\'�-O@���/K���z��t>]�����vG�\0�<�<zRxf�_��1x����ڼz]��M��5̈FJ�ʪ��s�����\0�u�x�u�[ٴ\r�N�P�U�g�G\Z�����#t^��H<T�.�ɤ��^,6���͵-�\"�6KX�|�k�䎬��9���V兛��ܥ�^���qm�h��^Zk�D�W���L���He�$�k��|Kq��\\h���Kc�	�0��&R��V�^��<#�#K�F�{��5߅\Z�#l��{c��@�c8R�)ʮNNA\"�5��+���?iX4��o=]����dc5��\n�4R������04�|<�-5)4��6h�tW�J�npW���4�Ҿ$xJ�Ǎ�Il��64�\n�`F�����?t���o�5=R������7�f/\r�\'ON@�k�~j�6>?�w�\"��nX�P��)�\\�\0g��ۊ�̨˗�uGE\n�Nſ��:{�-���~�h߻����Q�p|���<�����yn�E h�AV�H��֙ƙ473�[�cv��]x�����~��0�4aJ.r�Gs_@�R�L~[����Y����F9��ۅNE��e�:�V�2�d��Ywg��SeUn\0�@���ʯ�s����c��X����ҼO�ސ��,��/#�G�=G^�2n������?��~����\0���$\\V��f���9���F�pG����o�_G�a]\Z���ǔ���,32%X�S��601�W�����W��yc�Y�\0����*F�Տ;X.x%���%l�w:\r���ޥ��Ϋ#+�Q��NXex˗ݖ�0hdC%���A`GPͻ���kq\"2���F*�5�j���\'?v�kq�\0&A��\ZC<\'���8��H�k5�,mW�|��|�u�4v�$��L��ྦྷ���ѿ��w��{f�����Y���~8�W���_	�F\"K�A��0\0�\n�W�EFڑ+��{;=s�K�_y��������G�FO��	ʯ���[��X��Y�V�5��,�d�>�`0��C�������t5�QMw�jz�_Ex0�M�VB�9��^�ß����ܬ�W�/I����I6}�f�*��#>��\'2����^�ڕUs�<y�J���n�1G,%�RG݌�=�^�h�Z��|K�}B]���:[ZD�	4�X��8��ws[�\r[���x�t�*�ݷ;��d;H�6�\0O�ƹ�k���C��\0�Im�[K�}=̲�ێ~l�;��־o��ˢ�g�|L�[����kIi�E�s�1��N�E��Դ��cX�7��)O1IϿ#�h�K:6wI2�q�G�Y�j7����\'�����u��]P�ZS�)Իg�b(ӧCE���,��%�����#4��i�(W���7���TL*�Nz�\n����c\Z�X���Ij�<���	>\Z���ld8�2��X~F�����[��~VMr+8�,���F�2py�^��+�sx���Ιm$V�Q�F�r��RA���|.�l�\r�m��za��3+���f�\0�\\*�S�!Ŷf|2�O��:��_jk�BA���Q}}k�|\'��/\Z|N�.�%�ݭ���r�Ġ��0�d��_U5�~J�лO82+�|���\0ÿ�?�^Eug3N��a\"�X7���F��&ެ9U�+��0|3�����&��Y�K!+���{�2t�^��Qxn\rk��E�s5����~�����=:WG��E�ĭ&\"��o�C���s\\\0�@�kc��<����x_ŞN�h S�r�˗8%��{S��V���ş�\Z��t!��[;x�&Veތ� �;d3ּ����$�\'�4�O�]�e��`*��`�)��Q��A�þ XmwnIe�]�>}�7ך�>���z��u����m�a�%|p�O�oz��|ɓilq�/�Ş\Z�G�b[1�:ntV���f��?�o��ny��2G��w�\0�6���o�w�]SǾ%ѵ�h��$wH~b][ ��zW�[�2�#c9N�;Ք�K�XS�?i��tH�\0���w^!aW<�O�ڿ�t�R��qqk(.J��/Q��\"����\rn�\"��v��Ck�[��3])bvGˎ�k�?��Kɳ_�NQT�����S�|���s�l<=�|#���>�ku=�J��[����\'��\08�h��~=I}�M�O����+�r�V���#|� �=�z��[��Q�\\ګj��Z�p,b�J��ž�� q\\V��5���i�ް�6�����x����9\\p8�+8�)�>W%��\\i|(���Aa|ڋ+� �`>�;Y�s�W�����\'��mq�wDG���#{p�v�PU�tp��>���k���Z��nC�eG%���\'�c��X|q4:����j��d��Ut2�#��u)�T^���	t_h�T�&��\"dSgp���p���K�jW\Z���o�����$i$�,PHq���?\n�m�;뺅�+���Oj�e��r�\0d��t�H�w���<�4ٗO���ʆB���9�iJ�V�ܞW{�S�hoy�?���;��VQ���)��g�U�3�}[�:}�3���8��4m��/C��W���/���\r�Kؑ%�e�BȌ����8��^W�~��-���j����c�r���K�Fi�[3^WЩ�BkQ�z���ZH�0�<�;]ʢ/�a���~:i_a��h��݂pF<���\0�_�w>�m�]Au˖�oԖ�(V49�Է���Z��3�U׎��*���m#���y�_;��8��u�h��g�³�c[��a�/ّ]�H�Ȕ`���	��_��o��x�b�%h��=7H�,�+۵�\0��]���<�n!�دuݏ]�\Z���𖓮C��_jV��;�K|�l�9�VRMH|��]k:�\0�>\"^��D��P���Z�5�H�5%P����6�����\rsJ}:���+\0�KY3�<����~�%����ҋ���vR�6�@mx��0��÷:L����ȗKyN�G�##>�O�tC��uK|9�/�}��W�L;��`נ�3� ���\rq\n��`�����x\"����W^������k{��n�rI�sv�\0���K���\0�0�;��\0���	F�|�;��/�R���̪��8��^U����ڧ�������2��º�?\rO��{�T�{�q2ɺT�F b�~ x��B��^sk�\0�`�S���\\�j2F��+ោ:��\Z�_�&�\\�IV)���ec��x�>�\'���{m/S�<?ye��3��U@�VQ�E#c�+�{�^��	7��#o�<�{[���o,۳�c�W�O�1�5��:n��M�J\'�R<�����[�f�F\\�	��u��\n�#�k9>���6�ۖ�ON��D��ÈRh~��� k̐=7���/��x��Z��\rh.\"H����c*w�+���c_)�k�3)ھU��d���2Z�٧r������ze��is�mܺ�\n�ӒNO����N��|K�W�u�k�j,�7Q0\n@�qֺx/	�F�@���P� E�_$�`J����k����v�/�[�̥[<u�@j#V-rH=���ψ>Ҽ#�\r/I�$�cm�$��R6�*9<����RKg��އU�ɑY�N	YU��k��W��e��%ު�j��x�\\�1�ъ�X���~\"|=����t�F-���u�����	�*Nj�U��K�1�i��I�{#�KPMCN�����Ff^KD@_���c^k�9[\\��u�\"��;9\'>��,��k�w������,�f��\0׳xo��>�����D�\0c%��䑆v�#��E�S��L�o��XӴ[�~[׎�0��Y%P�v����[�:>�Eo�Z�Ҝ*,���p�=+�O�f�ݵ����Xۡ����j���\0g�_\r���0k7&{b�\ZH��`����*�J��b����k:��O�څφ��n-~kV���q�UK~�c%��\r7�6��o,j(�[�mká�]�9\0��-��=��>�$��Gz>�-���`^\0ݸ.@%�}q[�.�e��4��]��ep�r���s�@8�4���j�ǙX������u��)�Ch��L�I��\r�\0@�t��kʿe�(�\0�&ׯ<��\\�iĀ�O��!GL�o�>\0O��Mƚ��\Z���87�*N |{sU~�\'��\r��Օ��ԗ��b�.�$VJQQ�]J���i�����7l������s�[�>x7VFV���*9T�n�q^���ͧ�+{[뫋x��̌�T1c��YH铎��o�8�+�w\Z�YG\n�~�s�Tp\\�\'�F�,R-��{��\0�mW�0M=��V�sĂ2o$n��#5�~)�-�+|^��ӏ�c���J��*7/$��$�]6��3i����u��>����Ʋ�:�1�?k����F�l;���w�/�{#��P:�����8�1���I��(֤�O��dҴ6�6�C�h�6��\'i�5�����j\r{Oi�Smpd���3?���Z��k�=���^�ݼѴa ���V2J���I����xf�ž���F�v۽����v�=�֪5,��*��~�\Z�sxR�b��|p�b���KIox7V��=�7��к��O���O�6��:Q���i�yL���H����9�\"�̫��/QQ9���qVZ7�Οt�M����}�47&x~�J�$Bݘ:��\0�?�M��&ZV��w��w���&��Č@DV\\7Is�]?��g?x�T��1>��Lť��k,��h۩�\0ij�\0��~������������0|�(\'����i��5��$���_�SF���\0��3�Tq��<��x��Q���Z7��kz�[��+�qip�e����\"u���~��&�>��ڥݭ��I��Ou#�׌��%�i�\'x�[XQ�D�vtT�?�jc^��j�|��G	๤���BI�ax��yV�ę�P�l�sx�q�׵^��������jѨK����0T5��Ã_Ex+�֕�]<Y�)k���I�I�՛�e����߈�1��#X�\r�NL[�a>�3�t�����`�Nڟi���E���\r�uA�d��mc�\0|��^��>8k��m��e�|⽪����g��Ky��b�p�ҿ{a\\��Vl~�zG��D�-�ʇw�X���}�_�7}:쏟|\'��?j��L�����e�|����$𿂯uO�~�,�u3��+)�U:�����߄z.����D\'�׾gfy\'�A�`�A��Z�o�W��o��Ŷ�wj���K�LfG9I��8ǩ�8�W �;?xMc�\\x�!o*\"��@�)\0~;)�\r�%��5����E�`����\'����I�3��?.�al���\\��h�rS/�9A=c�sK�����{�\0�o1�n�Fy%��1�r��;z�����b}���ǍWE���h?��H�ϷDK`��C�2��Փ��3�q?�6���T��o%����\\i���d��0X��F@�_H�F�ៈ7q]jVR��ci���ʐ�0�<\03�X����#�]i5��R�[|�S�\"��p6���4S�R^��n���8�^>���\n�>k{�km&�Y�G\"�UN�v�����\Z|T�G���V{;���\"�kR�i)Q�m����8�m�7�4�h�Zn�k���_6\'$���t ���\"����$ۼ�B\"�w�T�����s��x�oYt�%�<��{�����\0��X�\nH��\0�\n���_��|7���\rg��������̏ʾ������e�?a`�ZS��4P��c����I���O���N��Y�v�ҫN��\0=�S�)>g�Q��ϗ�f�\0�v_u],3��Kr��3y��Q��(ֺ�#���<u�۟xj�MPߺ,�Q@�\Z��a\Zg��ʽ�f����|)�Q��XҢ��\0oгA;�� 6=���\0\0~�>�4��Y��6�o��u+M\"7���1��8�m�Kj�t����x��7^��l��Ua�i຺��\'a���¾��7�ס���\\$Oqi3/1β��O���X���i2i:����dh���X۲��!j�\0�|5g�}�Hҭ����0�����9<�\'�5��-��osXҶ��?\0����o�m�Q��Z��!$Ŷ7%y���گV�;�i���	�F�2iP���fc��Am���\'?Z��5X�6l2=�a^���{��O��yW�k��]pOj�q\\C���j��8t���#���_���|J���4{�R��nm�Ī<�w��Hf9��^��GL���/�j�Ip�ڵ����т�\\�b\0%y��1�7�KO�ǩxC�գu�i�W�����\n��!s�mRN\0#���>��.���|�e�����vW/a�iU�-�6�\0�$0w`��-sf����x��W:b����̀�D��F7��b7��>,x�g�ɠAu��FpJ�c!NK(2+u8�^u�x�S������Fi��H�cAb͜��=k�<*��a��d����7s���j� �\Z���R]_\\_�&mJC��1�p����`E<c��+��𖹨H.a��(��K��C��Y��\\dר�>2��ݷ���9���CG���v��:Ϲ�\n1�͌J�{W2�7�~�W��i�k�q��Y!��V�$�x�?��fT�N4���;�!NI��g��=�.V�P��ֵ�����p<rx�[ƞ0�t�\n�V�����ޅ����D�޺��!��hء��95��~\Z�<}�mKďi�i���̞8�d�Ws��\0c�;�2q޺\ro�e����_xf�[9�������VYb�����*|�\0C����]}:���W[v3ĸN��F�x>���\Z|G�`�Y�\0�Y��K�v���8#9(�st�����;I1nvgm���e`�\'��5�x7��ZG�-��77)6$�E$K�!���ï�OZ�߃���v���1Zi����0���|g�Ewc#����ZQ\\��<E6�����8�omL�B�\0l�ic��\Z~�/�� �W���n�gk9b�06�h|�\0��*�ݫ�<]�?_|V��ntY䐽��Q!��H3�o����8�{���a�+��&���w�?/�ۊ���d{�{�d�:�W#�i�;��2*�#,�?�TV�M���8\'�v\\�ȝ�nv�pk�l&~��0@���g׿�\\U�[���F&3�x��y/�fq�9���9͐�3�\0/P��-����geK�; ���z\Z����?�Ox1*�=�Kz�)_Ͼ��s�����O=�W�%�h\Z�ᯅ �B��v��r?�-O�-�]ڰ\"�dT�$�4���-s��SN~�°��s�RZ��3p��\rhb4B��X�{\'�N1���ca��!x$�\rM4K\n4����W��}q\\?�<W5��I�\":����?��\0�Y^�uG.��M�~�L�ӌL�/�� ��׉�}��L���佒9U��kr�ԑ��䧨�]��I\'�>$�zп������bx!(P��T\0���A�\\���Cg+�$�ڢyQ��q�eN=9# ��*JQ��TƯ�ob�i�4����1���2܅,:��U//\"��3_7�=ï�\"JTƠ��b}��</�KxO\\����icR�@cܥ���\rp\ZǇ�͵����q����n�$<��`W�K,EEM��8�tsְ��Wsè_M0���W+����@8��²hw(he�=�B�A�%U\r\Z\0W�H�&���f�-�����w�x��]�>�Nթqwv�[����m���m�*�9wbF��9�k��;ԔO��M�YI-M���]��}�����bא�5�o2b�@\'�$\0��X��/t�ɬ�+���ѨA�}�1�y���9$�:�5�|ږ���+��\Z~C<a���c��?0�r9��>K�j�TBU��PG�/�P8]�An�S��|%��ܥ윦ϳd���\";QF�����2�`t���_�_|B�nt;�\0�H,9._Ob�E, �,Q#�E�0q���\rz��|Ga�-*���o:�e%]�sʸ��Bq����%�˒3oG+�ͷ�J�����z\n��U��$�ˆM��bNE\".I%U��Np@�U�5��e����}_ؼ�&/�$�����r����YmD,$\'x�*���֭#G2�\0�=�;�V�Ab%��*�2\rX��c�0n?Jaq��+�;z~5��<��\\Y]x��+�wh�VV�:�08�5��+�o�ѐI�_?�>\'��\'�KM���Q��PB�<��*t-j{/��(x[Ʋ=]���U�����9�T>\'���o�aյ�,�6�L.!�b@�J��xrox*��|Bڂ�ɥ�c�9%F����uO��h��)%߈.��4���I%�5b� �?ʚ�g�Axἤ�M�s�eW^���u�+����5x�Ee�2m#9��>?����U�n�o�}4�0�;m�y�\r���\'���m浮|<�����[]^�(��$1��=E#񣮃h�|p�o�u	-���^�[c�\ne)��Z��w�\r�6s����:�B0�+Ǟ짞k;���������{%�4��f�VP͖?S���^I�Ya�O�\n��Lΐn���P�4���8$�s�ý1jz��~0x[�z��z�����3Bcf���Ym�Ix6���������Z�/��w�h������!�DE��7\nw�����t����\0ď��\"�-t�{����ĲZckg=�}��Ηş<7��m5+�� �<[���N8+Ұ����\n��u�$�xe�l{⸏�>\"�|+��ú��1M2�Ne�yf]�,\0+�t��?l�P%T@�;t�*������=N/�xv-w��E�I\0�[��TX����Z�᡼����\\,T^}��9� �~����A��/��?�c}k��5�k���A����5OG����V�Ή��6���eqe����FP@��#��+�c��j\Z]����\\i�G�&��FQ�������\n���۽�����ح���٤о��\n�-]mM5�}>�FR�xP�\0�#\'#���/��ᶍ��M�Ϡ]Z�ζ�lr�����O�����Ƒ�k����{n�,�r2z�<3��\'�Wڵ��H��sy+$e�O���#�z�>�o�3x�U�g�5aqo}�m>�/��_���da��\\�­HX�5	�p޼���*�8��lZ����\Z�d��f�v�d��aW�\Z��o���&�4خ���n\Z�ݛ���A�\\��=5m*�Ś�)s�j�2�0ݵT���+w�w�l|E��N�Ku7�6���`q*2`��\n� �ؤo|@�֙�}:�M�H\'�BJ����8�Z�n��g����.\"Y��?z6\0�=x#����ďM�σ���g3��k4��s����B��Mt?\r�kχ�.����y�i���?$����l~�PQ��������\Z֋k��!����2��@�O~���\"i?��ԵY\\[��Ku.���(�+�~��\0����?����8�Q���>%|o����&���w���G	�{��i��ǯ�:�\Zƛoy\rǝis�9~�����=+#M�柭x�S�\"I���\Z4�H��1\nG~k��yq����M���pꃠ�;�C.z�G�Ee�!q����aa�|�q8e�W��=�;?�a\0nÊϿ�[y�+���x?ZՀ����������C隂�W����M\".�oM���x��7*�71i�&g�I�FDR]T��+�o�còF��n�2�$H,��:�|��~\ZH���~ ؤ��z���������\0\n|<��G� � `�^��5��c��=�o��4��m:拞�Q�+����x_ė�4�Z��vʬ����	`H �#�S↓�~,�\'\\��X$��6w�n�Vh����n}p+\Z�ƶ�����B����)-a�U�O1�b���#�\rnuk�Nxn݊ɥ����U��	#���rq�j�i�I�}�[j]���)��Ǩ��5�Y~��ơm�u�,�F����RNߘ�a�\Z������/��睡��\0ζy7(gQ��@�@��y�R�kx�#�J����$R2\n�Ey���/P��;m7V�����9���e.0C��s���oj\Z���ą�U��\0{g,�h���zw�H�K�1�$��J`-�JP��x��X�G}�Oi63\"K����ʾu�/q���J��ƈ|_5�K��{N�������[��T�)ڭ�-��������Q0+�YB�((~x�?^k�|I��+��r�Z����ݔcB��i��I����[����J7���*r0��$�X���V��q�<G5�r�G0a�9�⸿��_���M��$\0�2�9��<}*�ÿ��x_��6�?�������� �d!���=9����>������jr�:Αo��漗���	ژ<�����x��vZ՜Kgop�Dw�2���I+�\0\\�+���x����~�Z���ͷ�q\0f8��팅B1�W������\0��{�i-ܒZ	!9O�bK�m}�E�g��|s�mB��A�u����<�|Y�aG\0���O�������=/��Mesi:�c�����@;����{ឋk��7A����퍔l��,���9�j�\0�^3��4�y���k ��~�q��֕��ٖ�q�KO�sQׯ�M\r�n0BAb	TrI#��a�?Ƕ~<�kP��\0��[W(�$���*�$����+ξ5��xG��̿���[Q��Q�ɒN\'q�}��_�C��E���|D�ښtQ$,�A�\'\r�\n)�ik_�u�ho/~�����%؉G��K���\Z��5�����������\\����\Z���]|�79>D|� ��9�\0>��|,�1��@\Zd\'�?��Jk`d^��i��>\"�|6SEu�²�t�%\n#�S֨�D�Ѥ��!-�5�z�G�����yހ��ӊ��_ړǥ?���?������7��f|M���������5���̐B��������4b������\r��1cp�!�s�ę�\0��Q����^�㏈֞��)��gE4B�e��;��?�jx�A���{��E�Z��c�`�#p>�yJ��Eծ�?�7�vS��++�o��`�7\0��)94?C鯆,�\"xf�U�?�kv`^�q�z{Y������!c�d\Z�����2L{\n�\r�q�V�߉!��\r�-���ǂE���;�����\0t���C1o��4;e�O�I�(q��O�E�Sߤc�E,@N��G��yg��4[�w\\�\0�I�o|O�&A#�X��A���W��L���cG�h.T��w����]b��~$�>n��k�4��¨��=:S��rƟ���Bխl�u�;�\n}��E�-�\'�7��F\r{E���GY�dz`���g����O��7���O�X��)#�gk)��}+���⸾�/�.,G�,v�ia��;\r��O?(��h�p������Ӽq�R�ذ��̏e3Lۄrm�\0��s�v?<x���x�mMٲ�:���\"��T�q��5�߈�tφ>�}�蚵�η�y���i�̝n9�H�d)�\0z�3��ԭu����ݼ�k[�-��0U�B��9��L�w2l�3|Jմ�{�O��SY\\B�C(����t�5�|3������j�׆|Oe\0�[��������W��К��~h�u��Zm2����Ҩ�ET���G#=�k�N���N���mR�-/G]=�t�X��>r�c�\0������]	���w�8�\'��3���_F��,�w� 0��2jhh�K�������}�[K��Q2�m����\0��z�ҫ|\rUo��Шp���������uo��)�XQ���77�\n�����%s���\\Bd/�x0�0��L��m .=8�\0�מ~���έ��·7�L�bX�99`�P��^�щNF:��lǩ��w#�zZtKL��.Gբ���U�����s�֕�vI#|����\0��,\'�]UX�zI�y�������g�*�z�3-��̈�`��i�&�1��c����\ZH�k������rύ�������)�&mKB��훸Ȓ#���8�b�~��������Z��4�B��\"��E��3����␈�`P&���_QM*6�<�}9�<���r�S=�>��Oj��M.VA��R�w|����+ǯ������tE�FǑx��X���/�\Ztw0��G�]nݐGrG�9Z>�\\���\0�ǧ�S��@ծ&��<\'fd#̞M*�KT��$�`Ƚy���i�\0|q�I��{�:Bl5u/-\'��Ȑ���1�LI\'�\"�	;�>�i>,�9������6��l��6�W�\0g��W�e���\\��^��14\\��K�S\\Ь�u��Kk¢>ӨL��С\\�c�q����>\'�^&�������Z��S��mV7�����G�2��̤w�+T������Wֺ������������Vp#��]��]O ��{K�&���H��\\�,jQ.���+\"F�+���u�  �F�^��+A]��ӌ�·�?5=ð�:�~%��b�Kyg�CGlΌ�8r�h�ګ�_��֋�����vk���r�р�;r�q�x�\\Ʊi��@�����j�2}>��m�$d��9�$���y��I$�¾��-nm�]{V�4�,O0!�\"ʌ4��I�(�N^�|��|�Z@�k�m��������\'�F��te\r�J�@\"��Ik\rWP��-<_�i\n���ǲ��s�vƧs1S�l��xᵗ�k-?�?Q��Ӵ��$\nJ�r8\r�`��[�����Rcg��x�����_v�)��*��rF~a_9���v��WS��Q�W��=¾\"���wB�Kԯ.�5�Vi�\\�O2Y,﵋\r�\08�5�&���=>u*�\n��q�Z���	��Z[�e�H�Io�i{��4��\n��Ns޽���<����Z�)G���=\n��}�-�Q��e{T�\\+���w�%/&�+���|2nS������ڏw�(?`��\0�@X��\0��\\b�/�u��#=k���W����r����}ES-����v��<���\\c8��o��\0�kᅍ�9ҭN?�|��?\Zl��Jw)������fk�-\"T�z}�g�\Z�j~�oa����r�>e���Z����7a��j9�������?ҟk+��ʠg#g��Bh��r�ect\'��!�^��|<׵=tho��ז��Yʪ!�l����lt�ep{-���0a\Z9�\0VҰ<E���^&��U��c1���񟨤4|��h��[��|s��j��s�L����d�cU8�x�o~�W�j\Zn��]U-5�&���|�9\0,����|����i���W��-V�����TMBI�+y\"�I3BT���LG$�rI��|S��I�iV�ݬQ��uM��hX\"��V�%�8*I\'����Ve�x�x����i�X�]�J��w%���֛�^^�Z���]���D�\r�X���N��^�	���q\\��h�%Yu(v���u��~�����!-�ܤZ�d��A}x�u�3��4N�#��S儯aKS�4�y��G�̻��YA_��?�]�.��YEю;q�\"��Pz����\r�>��]�6��\0h\"8���]Ơ���@+��3���eo��Y���hd�jp��v3����b��1^}L?���v�b��P��f�����v�k���c�6�� *g���⺝�:�~�񞯦yV��[YX��&o�Ns��\0������|ua��4e��u[=���Y$ti\r��,��6z\Z��ms]�c�C\r���<0�+�aq���@?{,���GP�B�b�a�3��2U�ʑ���\Z�|i&�|.�?�}�=D���!dQ)�ʶJ���}��MA�+�^�Q%�ʀ0G.ʸ�h-��+��?��<��JmI,t��.�U�}�{��q��Uc?qz��]�h�n���9�Kt����z�G�cV93�՘�DT��.;T+,���_z�Y|�#w�1ւCn���}*��Vx�č���}3ZQ��lNI��̪>\\��=(�Z�l]Co�V쾕~IC\0�xQ��F���n��:e�9���u<�#�]�O�_>|\'��|{�O�kK�Q0kDdݹ7I98��:�J�^hp\rb���t��Ӵ�-���θxЩ�����<�΂�b���\Z�k�7Rϣ�Zu�6�!���:z{חMio�~�g����5�����0f	���#�{�|���I�\rd��4�ɫ�>��U\"�E���yx����;Qa��#�����~x:�-oJk�x�+����(�<goҦ��ώ�����z�/ź�.&����NC��״�l�*X����L�\Z��|�xf9�Ҵ�M.9�̕m��č�q�4�a��<��>\'�lV���m����sov�\'IP�r>A��r� ���o�|5��6Tִ��j\Zƨ�<�%ac$`���שx�ᯆ�Qx/uMO����K4?3�ub�����\r��v�k�X[�C��M�Z:���+��{k��xA)�	�na�0�S�T�r+�,�-<D.!��Y�#�n����`pj_i�\0�.��v�j�<�x!ě;��q�[^dP�G�E>��?����5];C��<3y�]���.��t�i�	� ��n+�O�?\r$�b]gC�\'�6\"`獣����-k�z_����/t�K�T`�i�[��Ҫ���ÊC`i66��^�;P\r�g�O������{�~\Z�-W��\\��y�a%U\n�2�aԟu�X����\Z�j:��wo\"3<3C���H�Z�(4hlm�����5�b ��1���a������-��0ύ��ʼ�s�1E�	�U����\Zo]�@�\\��$7Q-0U=c���g�ߍ��mS�W�vZ�ò���U��}ӎGc�z%+ug�h8ܰ��X����xBצ[��N�y>g���wz���4r�s�~ǥ���=K�\n��am�J�b�o�L�LZ��V�-C�?�^U��rq�L㞽�b��Lӭ��8ⵂ;H�p��U_�U�?F��n�{x������a�?3�����<7᷌��.g�o�^M6k���T�K[�F܏���i|N���x�I��^��C����ʤm��9�@5�z��i�[�������SD��q��AY�?�촸�]:���d]�-!T;O\'$�{S�\\����]�\r/�FHocIg�f͌z�{W��\\�{�\0	��d�\"�\\��\0H��\r�Y2Î͌c�8�5�I����c����� p��<u��Hܬ9�ڥ���O��\0-����� ���m�Wr�����\n��\Z�#��Z�,�u\rN�P֥k��wJ�$�-���=����`�i��qn��\'G�N��s��͕����Fʪ\n�@�0\0��+�>k������^������{0f���C`1��Tv�8Ѽ��Ʒ\Z��R(�\'a�seF�s��З:LW�-��s��E�����B���ׅ����s4���p��9���WG7��\0�������1\\�\\1�8�XH��\rt�&�ɣݾ�C�9m�q���\0���^��Rk{+;yQ�	B:� qֶ!Uh�G�\0�)|���)�i��ξN��.I��s�$��o���!�O�ZN���1�ym�dK�3#��q^��L1[�PC��X�Lw�zsY\r�4B>�f۱�6�����ë��=GO��O��$�&��\\H\n�$d\'�*�׋����,��.\r�R���90�v�<��5�p���{W�XӅQ���5�ˑ=�����,H�q�G����^?h��ȥ5(��G%���-�+g��?^+��ڗ�o��Oq�wr�/�FR������{:�j�b1�؀���l��׷z��:4��\"X�Wh���q��\\�?�~\n�V��I��K�h�����F	ޞ��W=	�_�~�k��2$�MU�*�v��z�cҽ��E�I;�������b���+t�9�X�.O��z,<O��X�V�i��d����c��c|Y�Ǳ��ֵ��|+|�X\";IA��l���V=0\\8��Θ�d0y�OJtV��!V՝�FA\'��G���f=CfN-��R�*�U�Py>���L�j��/�ܪ��+ #��?�r]ž���\"(���p�c���H�6�/1cf�6��)��1��x��Z��3���s���+�>xF��?��Ѿ��ao<����`C�NH��^�˵e\rp�����v�U^f�<�QB�ۻ?)�\0S����t�m��ZF��G�o6��Ͱm����$c���?����/�\Zv����:�t��uq$f�N	d�~�@\0ꪬz׵�6�W��u\n�)�(�/9���@���\ZG�)ʐ~�9�v�Ҙϝ>�/O��x��~&��������|n����`�\r�;ri�>��{x3M��Q�o���d����x+�\'�q�l��~X�@�*��PO\"����pO�v��R<�V��?g�_U��F����x��`���0y�9���Lo�#�ɿ���NrW�uMn]q���*}�������<+�v2\'�E�����?��D������O�^ë|������W\Z����D���lg<�����q_@}��$�jSf]U����\'���u6\Z�S�u��\n?�����mc�7HbQ5���0���\'۩��_Ù>~�������Q���w�-3H���Q�>�׿��\"4�!N}j����	)f�W����T�d�<�</m�σ�F��DW:M�țpc\"1����^�x��/\rk���4�a\'��z\\֐ݴ-�HW�H~���+���-�j�0�o�+����d�1�/��ڡ��#;��\0�c�o�_;�q�~��0�.�{��3X��o���^{IH���x GJ�V�-ʑ�\0c�ҩ��f7.x�8�.���9����`���>ҵ���h�կ#ke�M�Ď�x$�v��_�F��|�B;�K���^��]����v��#h�Q���\"��D��C/=�U��ػ3�OLz�Ubn�3����Kc8_i6W3���AG�0�`s�\rx��������\0	�\Zm����7٢�\0Fb.\"�C)���d7�E}g����<g;����2�1`C�5��l�!6rle�ᯆ���ط�T0Omp�,<���+�<+����*\\��zu�߀�Fف��.�tǍ�(\r�GB���8�ڛI�z��ٕ���N*���z?�u��� j2x?�:͞�:�3i��F!�gs`ێ���ox�㆖����x{N�aM��\0��k�U�ۜ;���S���t�A�-�}(���/�v��>Ӵ�e?g�� ��`��O���5�.�\\ҫ�Ǻ<d�<�gY��6H�n�����q�� �Wd��5JV��4��HZ92ǡ?ʙ�� ���ȡ�-#���3QG2ye�Ԃj�\"y3�	[q;iYL�+1v��\'�&��\0���\"�c�jY[\r��1Vc��Y���o����OM�k��:�}?*���\0�����w4c��g�g8F�y\'�JN;4�V�H�ʿjh���G}6Y��wls��Cd.d�$r>`y��k��6��/��W?\'kf[Ԇn5K�#̞M�d��Ɯl\r}gu���&]$�s�����9<>��%�Ѯ���;�2����a�Dx��^%\\3�u���	�KCƾ;i\r��Ao�k�{�����X�BD�� -Dd��!��j�\n���O_���-��r�Z��W�xwL�l?��qY��HM�dt\'�+����k���o�Gus$&E�B\\�L!uVec���lI\0�]����ĺ���:e����[�m*����\Z�>��8�߭i�RәęQRwkC�<���\"�\Z?�%ږ�4^w��鮩L����\"��\'���ǌto��&��/x)�4�:�}�w���A\Z�K��qҢ�[�]K��-ѵu��W�\r�hd7�Ȥ��*����Q�s�zޭ�7�F��_G���5kH�����aV�RO�.��9��aϪ��%Q�]�cľ��#Ox��;�sWy�����jK~�9�� ��T�9�t�W���t�X�P[[Al��_CB�q+d �����{WG��\0�v�xY/L)��0�����_�<��+����\n\0�A��TF���SH�)�-F�v�kko�4P���U?J���Wo�<��@��ȘH�t�]ѲVF\r��Zw<�=��|�,rZ��j��3�BW\n�䨭6*��1�k���?�_�0w}���\0�������\\�ūqs��}��	?��U2�h\\w?4;P�Jџ�\r���_�B�,�k��	T��cn�<�濞MF����IRCz�z�~�i?|^��/�Z[i6�\\�\"�\0T\r�Kn,�;�6������#��ոD��>f9��<G$p+�~c6.:��^��ih�A>�g%��Ym��F��̫������G�*\r�>��j1������Gqo\ZH�^A�_\'\n�w���<U�X�	&�ث�e�ʹ9B�=1ֳZI5��V)�r�Q^6+��8<W���\0�k�\0���9-���e�8���d�y�J�*v�=IR?�^ox�H׭m��QP��a��~I.d@Ґ،lA�n\0�H�X�����[j6��K\'ޅ��7�[<�^��_���%�������%�[]�sn��&V�s���|N�$�i�\0e��o�<~����BFcrx��{\'#p�F*Y�#x�K�um>�R��K(Fc��5`��HK*��Fv�֐�|/ԣ�s�fZB��Ӧ#nq�.2�T���+#I��<�Xjh�7�al։�-�����rѷ��d0\"������zs��j��ʲm�V7(��4G�Ye�\" �s�u�ō]�<ֽ���X�h����-ʹ̓g9T�\0	��Z,��\0��O�,/#ҵV���Y���G$L0O-���ֺh��w�^�qu��m{0��Y��qy�f=��n[��`�q\\��_wj,�ӝ����wXm�(V2H� u���|t��M���߄�Syc<ww։usi���=�ʞ��|�Z���+����5�[ڨGcmon�J�8R��$d������z�۬�Y�?Ώ���ߐ1鎵��U��mo�]Gd�pۤ�X\"�?gGe*�A%��\0��z��K⇈Z��;������ ���ʈ�#wr�͹	��R�X>SL�z�\"5wn0pz�k\"3Wo�y���Z|O��n�t�K	#F���a+c,K��t�eh>%񎡩��:��h�����G5�l��Tiw�Y\n��$s��I�X�X�B�D8�t��y�K�ݕzW��\0���*���4�o��[�M،�!�	vx\nF8 .̶s[��ǋf�u罰?�Z~��e-�uq+����D�J�`�&�X�]����Bj�LB��k�wt��<q{k	A⫡��\\��@�n����#$�6�~�9�3�;�n��Y5��\\��B,�ۤ!!���bFO�^�c����F�}��j#rg>���-~$��K�/�V�� ���x͉v{�.f�R�\n��s��U��ex�4�g\Z��ˤ�?1m��P��FA\'�,v�qJ�c�8n�l��@�	���p)��#�x*s��W�?��Gk{4l���*i:i�2.���H��ʕ�c�\0;3g�|��_}�J�h�F��\"�K]�L�qX3�ڄe*=Q�SLV=���J�S�����8��x�~��4�{+]F������<�6�dki[&D��C)�vmb�q�I��5�,:ƹkp����6�x�_6%1�ha\n��g�0<��i�Pf�3��?xqLi��YNMx6��#č���?P��M��u��K2V�E�h���ż��A�@�5��x�^��t�4�o�i��Y��&Y��UJ�XDea�s��P3�KG���1��-��o��\0���y��R���b��Q�\Z���}nK �pYd�*�ܷ!Wv̐��e�\n�����V����M.�VX���a<y�Q�����㏘��>rIp���7c�Uxd����D�0�f������_��[cR�`\Zŝ��z�*[�RC,�y�S!rn��k3¾&��\0���}f�Uӑ�?�u��lwɝ�\"*@\n��d�s@�{Z�*�	FR�[s�=jk{�>b���ּ?Q���^����ik�-�vs/�%��	e!\nƠ�i76G@>$�n���:�ڐ�ST�g�O�]~PDe����l�h�׊�@e# p��ӚH�Dm�8��m���Ceu{��p��ۛ�6���(��.cܸ���*���-�9�jR�\Z��R��6�����f\"P6,d\"���W�1�{ڵ����\\�iY#�07�@Nyq�x-��xuE�U�T�;V�g{Xf�e)g�V�&*$>cd�A85��[P�$�׈c��W�3�_!�8�G�\0e�1���>e�g�\\F\Z�.c�t�0��?�H�����B���-��H:n�[S�i�bi�kt��lܑ#��2�b<c(Fi�������^M^EU��[��ko��1ي�|��9��\Z�r��;��$���b��Z��N@wU�U\0\'���y�>.�/�7ms�j���,�%>�p�aus\ZPs���7���O_񅽆��}p���)��Uc3� ڠI���ۖ]����j�n���&f8�lt.��\"�ļpF�X���:����I�M��\r޸�*Ӭ.��-f�[��0��U�Wv�Wg�#p�j�����H���N+��/i`��sh�T��ݥ�8�F��ac��7\\���Xr��X�<dz�J�q�XX����lkq�Ǔ�s�J���7�4�~��w�mumJ���}4jVq���������4�Y�����xo�z�j��jVZr�~�i�;�I��	T`���H#<Ѣ)��K�{w�+y��s���ϴ.�3�H����7:���O�{6��[vk5��y.|�s2�d	�p��̖�i�:�����x5v�Ok���Q�o�xL[IF%�S��\0xR�9Y�X�P�[<��Q��9r��k�u���^#����Q����!�X�q��f�����\\�����|Giq��5�4�cf���R�&c� �}����o��	3���8\0Gny�G5�<�-���\n�] ���Pӥ�{�9��c���i �y��,>R6mYf+��*�?�)�f��qk�T3�m�d[���EM�4�(���P\r3֚�U�;A�;��\Z��b�bm����\r��<gc�Z͠i��ޑk���U�$�-\n#n\'���<�cB�M��m\n��u)��l�{�(�ݔI���X��(�paR�`(;�Z��m�W�m�ןZ���<`��&�=p��b�#E*�#y�����X�61Si��[��\0f�$�w��$���,�V|�0��xC\r����\n�W/�ڪ�ȼ�	-�0#߆S�=21^ �?�w\\ϥ���	����e�RA%�*	�Ĉ8<�8\'9�o��W�&��K##�Is1Cir�g���\0,������\0S�s�@�ŗ��=��ӽX��� 9O+�9�|�\0�\n��R�ʁ�Դ�Y�?�L�%�ě\\�-!\r��m�<b��\Zo��tU�:��Ξ�O5�ܢ}�5�K�>^���I ԁ�\"�9pB����)��aą�1�2��n:s^\r�񽮕�i�����WV;7\"�DH�\0�d���k�-���Rj����u)���$R������0�	l���M�q�$Pny���YF�Rw�HS�r?�5��g�Z��X�����E�Z�����\r�����Ĩ�1c\'���E����x��&���qf��=:�!�d��H��g%�~y}�{�j����ۀYwU�\'��Ol���O�w�k;7 (���GA��̗�\r��6���y%�Zm��EnK��t�83/����d(��x_�e����$m����nd��\\)b!c���_i��\n�A�,{[�$�>�M����*H���1����?����T�o�����\'�����%�a�3�Fy��цlc��|���4?��C�����w�IgY�5�ʘdi�o3�r�ТK�H`�������xCd�PW��q�y�*X�\n�#�I����N��L�z�k_�>$�\\�y<Cq-���?f������!f#�~��ql�J�o<�)t���Zx���[5�.����`���|�X��_��X��|�6�o �8^���~|Ӿ�Z#q\n	ޣ#�q�c������O���D[-�/��H�L�1$qJңRbB�P-���ֺo\Z|5�<A�/��]5�������rM+�WP��`X���r���i\\,{�:�~:��s�c߭^��H61e��\0	�q�O#�W��|E�����?�tk{�?�u��Y$��\"DT�vH�d�a�b�G���\Z�n5�u�	`��Y�h�@$q18�,�i�\Z���o!��\'$go�;�y�83O�Vݵ�����>�8=8��_\0x�������2�le�B�xRp.��J#�@~d.H�OK�s�8��J������F��<���2�\r�� P�䌁L{��2 ��$�zu��ݨ�B2��\0\"��#+�8��޼O�^+�ԥ��-G��b��\Z~�%�!���A�,�e�F�r3D��j,��[A>��Y ���П1�i���6�ޱ9�=�{�R謁U���$�s����],��b��sd��V��ח|H�>�����[m.����O�Ʋ9�ld�r���Q�����߅~(\r�7JR׷\r/�>����	�ͫ8M�z�FI#��UryO�!��KP�w���9��Ӝ�i.q������������u�����hV�C�E}c�Z��4�����)P>]��ӹ5��|;����$M��goy=�\0��\\��3n���A�+�d|�����15cؖ�A���\\1�@��}iV�7�]Y��;][+��z/z�Y�\r�I6�mg��z���q%弥��Ȏ.�6�.�\"����:w��]j\Zh�����������Zq5�&W�w̫�9E(ܰfN�TI��^$�#TogH�$�~^���J��Ecv�G�0Kc<rO����s���o\n��:f��K�=n���5ن��Y�bxܩ��ŀa¶A�3Yz��v�]�E���4��)r�jA�s�T �\\|�/�|f�{��VW����`c�G��_B�ZGEP3�u�\'����_4��/ư^Y�Gb��r[ǧ��3�1��6��W��wH}��\"���_����Sy���~Ii���!��Ws+)pq@X�!�+U�ci��\n��>� 0���~�U�B�nd��W|��Ud�0��\'��s�_=j�|oz��4^K�t����Y�C& )�8�n��W,��ʬv����O��#��q�K�m4�W7Z����U�u �H6f5�\0%�Ս�I����_Eb��%�p�g�(RF鎽:�=j+�kN�(b7���\"�4�\Z@Ol�\'�����_�\Z���5\r�S���x��U7��{Y�c�H���6�����{�5�����	V=7Y���kky~ܰ�0�IG���������wB��M��i�*I�3�1�|������JK]~��$B�٦U�c3(m� 9�A8�<u�A^1��\0�ڗë?�\Z����m	�������m֫#1��;�K�d�\\-����[K���Jm�����[Xb?\"�T�;ݝG<��\Z>��T��r�p[��^YUn8x���=��ֱiej��s�ZiUWq�1�Ԛ��{Ὲ�K⹼C���$�\n�\r�v�i6ȥ�sHP�M�� t5���6Ԥ���M7A�>æ\\iϥܬ�YDҪ�����(۰�J� �Rmt�����?�ۋ����̫,k��˞9�T:�t�C�/�.Wa`a�V�c�Q�n��~����MN������13��D�`\\���$�0��8�&�!�W��]4�Ʊ,�i�����T@��FUW!��G����%���^%�^��w\"�H#�F��d����9��}�������ym<��[��$ ��{��\Z��	�����k+�(�\0��&qǖ�Yad�o�����b���\0gi4�49�W�K�gcu5��\Z8��uXB�C�r���`R��+����Zm��q[��A�bWw�����_\\c�Uoh6��J��+r�]ck��t+�3�?C^9���~!�-��}ku�^�`DBĪZ3FX��$6;|޵��:���-��Ew<���K{h��&>fǔ���|��U�84G�/aݞ�i�-\n{3s��� a�[��Tp3���;�Q�6�4۴����-�dc\Z��p�&��\0\'���0z�k�uo٥.�[+X/��Z��jw?>�-�UUE��N�I$f��|���54֭���e1��<r�i��]��U@ �\'�]���x��F�y$�o���%�\"x�F1ٿ�zud��T�\0�gxg��8��$���jL3ts���\'5��9�iV\"�k�:+{�)mb��*�!�%W�\'��A�T�f�f�\rV����ky�f-4�X�Pmd`d2�	RpÒU���u�M��dլb��_2h\Z�<���e�Ls��<�d��(Z\"�$�Dr�#o�._�@s����_5�GK���\0�4�t�/Q3Eh��U��y!�d�\0;V���R��^�/4�� ��0�����c�9B��F�H枖�K_�>q�kzzYW?�HNz)=��9�+\'�G��������[OnV�C0*��}���V�<M\r��_K���jc�ʍ����s�8c�>�&��_S���\\]�1�bbe�\0�g͇s���QS&�Tw?�-� @���l�k����O\r��䶇+�O�������f3&�f�Y�s/^�_м��\0}?jʱ����G�1Y�R�A,)��\0�v!;=\0���%���~Fڻ�s�29\'�1�B��#�&nY�\nl1�2G���g��^7{J��A��|oj�j:��\0I99	=O�XkX��8ݕ`ۺ��Z�Y�ET۷ �E2%p��c�G�6��P+�#k+o9X(��WaПzIlZ0�Q]���#�����q���s�֝�\"�$���GJr��*���ü`ci��˨#���x�g���*ǽFrp@�dځp�r	�LM���\"��`s��0jH���P9�2�&�����.I���-҂JM	�ܶ�g�֝�2b\\�o�\0����V�W�ݙ�H{\0:�gp��Yz`�E]�Cc��S,�\0F8��enI6x8�\0=XV��n���J�y��>�\Z,.fV�դ�#����i�b \r7�=������V��9��~�aG8��r���$�I)wp\n�i�bYT�h��I�r0֑��˽���9�߹@ź�\'PG�\n��|���=�z�U���vT��үy{��q�\"��B�̮���,OA\\o�c@�{���c_)����$t�,��2��sʳ��b�ՖF�Si�*��~�̻�����$\nJ��G\'�=��\r����wny��ӎ�\0�iO��2�Vp6{��*��g�Y��<�J�!��p3���&�-�����o`�u��D��FH����X�_�/���r����韭>/�q�R~l���>�Zl��@[;��N��Þ��+��ʩ`8����?�=�UC8���1�Hm\'$��D�J����9�/a�l�$���(�ҫ6¡���6�����������T/,`l�*�f�ց�	[X�1�� S.���$er��g�\'�Z�O��c\"��YB�{U{��֚X2ڡ*T�G���i��.,I1�70C�<��5���0��N�����\\-��6F�ƃˑ!��ڧ���5���gwP��W=�{�!L�)�ޯ��q��K��G�٤�\'#����I�Rs�$g�\\��@d;Y�W\0�nh+�S-�����@pO5�����X���ͷI� �q���8$-|�4��p�w�l0��`w���)�q�0���jKj�I�.6�Z0O�\0V~�v5F�1\"[p�0s�\0�?���V��lQ�����1�UXm��ɽeU�0��f7�m�y���H#+��:�֯i�_fC\n��g��+f��8��\\֛G#5ıFr|��\"���W����<��RG��P���!�1<�l1�g]�a�y2�ɹ\0s�{�R���#X�ь��py�J�kf\r�	!�\\�i=�fe�j��/6UvP��:�Ա]��1$,\"RP09��oĞ�j얆6��d�c\0���Kk7s�3��X����d{����b%[�]Y�%C����#�ϥE{\"Gp��A|�˼�~U�Z�t��(�Ed|�q\nN{g֩����)[1&Ydl���>����36#�Ve1������\"�����I6 *�i�q����X\Zlw��N|�����z�>��1[p�PJW���1A��p��嶆H���X�r5m���q��\08�\0<VF���;�Q�����	\n:��tN�O^EoG0*��07y9r��]Xcڜ!|��0��KmQ��]��:z��~T�n���EV��#���z�Zj�O2DFg\n0:�M@��In��e�\\��r�Zzċ��|���H�9�EF�2M�2�Q�;���W��yfh�V�Oλ��9��3@�O4�\\�e\'����\0!�U	�-�� ?�\r�\\�\0:�v�d �n�ʴ���rj���6@��S����u;�V,�Fy;GZGg,z\n���8\"W��4V]�Y�ヂO?�U]V���s�\0?�\0�Pk�/��Ȥ�.X`�u����9\"��m����Cquth�I���h��m�wm�(��`\09<Hj�&���$de������|���j(n��f��9&&V�<d�NK5�v�3:D3�.ʪO�X㧥ٓ�x�@�LT�n�~|t�w<g5V��.e��H�0#؏�\0]:;Ț�[y���9���~�9��Ґˋ\Z�6��W�=�\0�?r±��>�\'4ƕ[s����1�\' \n�mu�a��n9X�I?>��\Z�#ʸ`�,FPx�S�\"6[���[���?*�[�6�8\n9�����u;Oө��i��²+�f\0p1�J�qG�Q0��T?�U��ya��?�ҭGu�\\R�AaAEcb�:�;7P��5ج0��d]j���VLt%�ZF�e����P/�G#���Ns�9����[��\0k��\0ꩮ.�>A@\n��k�U!�U^�0�!�j�\n��ά8=�\0�M2kt�\0��AZu��\"�8�8��2=���\0.P)$g�u�M!�ov]�r�}�ғ�U�b�k��|��摮|�q�@��Z3�#�6��s��\n�/V;�m���\0�TMx��\r�i�;Ƿ����PO��xLd�G�Ud�iw��;�1b[w̼\Z���I9�9�i�ܫ�9�|�ي�OsH��:u�`�$qx�@\n�조ǐ9���<ң���z��ya����i��qےN�}��S�m�z㨧��2Nq�)Y�X�l��\0��4m_4��I9��5$�\'@86�\0�nG�-�**�Tc��������F��)Lc�4�1B��\'k���OXԔ`q�}}i6�I�b��B|���NM�+��HU�8�j�sS/�#�0z�/��`{�~n��A~Z�:1��j2��.}����F\'��D֋$ ��zm���RЮ�s�i�˶E��;O\\��n���9�H��0�Cd����6��\0Tk�\0f�\"��p�r�ұ|}j&��������Moc�FMfx�1/�uu�X�\0�tt=����w��V����\n�06�u��kڟ�tM8Xxz��	4j%Ҫ���������O�O{H�q_�ޣn�i�@�XNG���{�>)�/��Z�9ۛ��C���\0c_e�n<��=AdQ�ҽ;$�.s�r:�8B� n�\0d���1<���$�����\0X���P����f�?�������ҕN��W���k���R5�5�Z�ĭ#I�T��q�{P���|V��T��\0b�Ŏi��w�#e��j�S��X�=>�跖*��v��a��\"��+��ܳ�1�\'�6+��\"���c��>գ�?{Ν?��\0���u)\n�̿i@q^���F��W�cbw~u\"�-��6��k���#V<��w���w�+�Q�*>������o��^j�Q�����==��5[\r&��7�mn3������~Ѻn��K�X��9��������ۡ�o����>j@\09K�	 צ+�,k�������+�Oc ���?|^�<X�	�A	����q�I�Fk��|���\0H+z#�E��s�6�x��T�\"�O���v�$��bF7��lA�\0Ǫ��.��0��>Z�\rޜ5|�\0}y�ˇb�����\0v��*)�ӕ�	�x��Ҹr�H��b�ff	�Ť���\0i��oA�S�x���G$�|?��-�n�}z\Z���M#MY�V6��]�l[iОz�ڷ4�Z���;{4��j�%��w�8,�Õ��Sܤ�׍Z���8\'u�Y\'���B��x��u�\\~���ߎ��\n�R�1� 啕#s�R�\0��r]�x��\0w�\n���B�<�o�^<�=�������G�4��X�91��\0����ֽm�U�ة�Q���ժ��ʩZBISk��ʯ(��gu�Ԓ|B�����?t>��Ez�6aTPS�:�Jt�a�\0�*y����&��\0�5���򜪝Ay5b��^<U\n�J1��B+�׫Kn�̝�|�o�Z	2��p灎ht�v������T��N�\0�B|}�k3x#9���q����������JY#T.7`�6�hy|B����\0��/�I~�?�n|?���x�PԴ�cA\ZՐ���.��9���P�2,����r\Z�o�Ocl�C�s����ށi����%��=�~���3����?hR�n�:9����}�gvx\"���f��E3+.AOj��\0F�֛������aԭ�xRoa,��B�9Q�*jz��\Z]x�7\Z��	s���mi�h��8��U���⿇�����i^|W�V�F9sݗv9�#�z���?x7M�̳YC/������%�B����<�\rX���\r�$x�Jט��ڍ�����ؔY�0��#^`0�:��J�X���>!�@���l�c�o�V#d��C����~v���k\'�1����z�\0���ί3Gj��!E���;�9`x�J�mP�ƍ�|.��t�F��c����[kE��2��H���\n��\'F��h�epm��?�N�\"��)�On3��0;�&�\0�v>���o��py��OV0�&Pa��k��[���\Zn�k�Eme�Cjo��#��`e ��!�㢑^��	��wa4�m\"��csyʼO���#�&ݎ��,�4	+�[�m��T6Nz����C��˛ς�1���,S3�c��I\nu�8����F�|r5�[���6|�T;DR�`�<�8�)���վ���v�6�s#\\<��\"�$$g�S���z�mt�o��m\n�\0Q�:�\Z�_��W��>B�LyJ�@�v���ƕƢ�?�`ԵO�ڇ��������\"Ӧ�\n����bz�n�\0�G�C�|r��>3\r$�:���R�jw7���:W����GT�or����ɮ�V��I|�.9��ֵ��\0���&ZK$��ME�L}6]�������vW*6�#�ψ�<�U�I��͌�s[�uY�V�721�~�׵ٴ�HL�nɐ�(���|��7��u��a��b}E��Kmo>ԇ<��9�>��w��\"���hU����]<�*�YA\0��cE�܉+��nr���hn8��K&�WtO�����*��Ǔo���I�ztR$l��c���ϭ2D��L�ry?�\\nf�2�V#�$�B8�i���dr)�B�oq��܁���&N�[h��v�K���!d\'s`q�_�X��ZFt@O?#d�ު�Q��T�d���2��f�&�K!q���L�t�>V8$+�p8�%�Y7�W��8��SB��mu��Y�OJ\0�g�p��2�o]�a��i.H�����0l����\0�Y��5Sn2�gv�?�g��h�&+��\0qGP�������{�.v��;�V�ve����b���ߴ�E0��2D�G�^@�u�zw�ȯ\0�a�YXF�\r{)��g9��\0;�a����\0�/-�4�:F]��1鏙Bzz����v|�]h$�זK�仂DP<�!�F�����6u�k%dY,.6:�ݹ��\0�NONk�<��\0����=:�8d�v��X� ��ÁU~#�~��>	�t*�}k$I����O���^4⯡�3�|�j���.n��涝�`�jA\'����+��?�/�Q�4�,�6�$�J�e�BG@	�����)?�>�L����^]Aĩ	;e�D3���7�?�_�b��_���rO��\0�	ܰ��?V�1�Y�I%c��\0�6��G�mkD����H\Z�P�����:L�A.�s���^���\'��9�d0���M�#��Zq���?���b���x_P�����5;�%�&c�����9ϥ}k���\'}k_#;�ֈ�c������)+s�ji�g��ė6�f�5�&L0�P�$�{rq]^��	h\Z׆��FOj��#��v�yi�g=�����W��/�<����#ݒ]1��?J�)~�>)�w�[�jw:���q��$;�{u1PHd��Ou���k��w�MW����Iy�2�C?��J�,J̋��Y�2:�]������oJ��ԧ{��ϑ�T�Ff��f*��+}��o�R�bQ�<�R���������\0���\r|����V���2�U��tm\n�+(X<v�B��ҳ�B)�9l���{Ե������7�q�٧�B[z���[��?�^��{���EH_�Y����pP+�/�������N�6��^�R�o\Z���P9t�r���l=�������m㏂��Mh�ST�I�oO0[���m�\0�$G{��_�6�KԵ?�����\Z�N�|)�PI�d\r �zS<z��zk�O,��i�J͐#D�=���5�?�+}��M�}�W@,�ku\"�en� Q���Wa���o��G�S����4�&=r+��c�`F^ŷF���~�c���k�\r�i��i^\Z�<������yҪ�������j�>#~ɺ��o\r��/	��7�tF�x�V��\'N��{W���>4_\n�\\��9��\r��Ι��� D�L��Y��X�_g�n����\"�5�ť�v	\'%Y�h�*/]�Y�O_j\Z}ŭ�\'�]��}�[����ԉ6�����\0�.�nG���IH�z��$m����ڼW���Oe�.��唲H-l�VXϸ�(�(��8��7����i�u��m�8�3��=�n92�����+�e\\u����i�\\ƿ۟pwi@����^�4l\0�������Y�m�u����#oX\\�ֹ~[`\0�_�ڛ%�ʫ̏�wk=���v��SpN;�vbຖE!�f��\'�w\r�r\0��O�n��lM��4�q���OX,�ǌ��Ӏ��Ok�W����Se�`m>���y.>�Xiq��OOAP���s����n}(a�<�LBI\'>��0�#�<�Q�ל�3`�`9~f\'vqJ��T�U���4��7�4\0��{8�c�-E{�J�[#�԰\Z�CԎ�2���Q�sU��\0��ضỾ\rM�I\"^��\\T����դf�z���v���@*��\0Z��ws��R+)�\"�#o>���[�8��M� t���x50U�͇<⁡y��S,�3�ED��ӌ�]�_�a)����I��=��\ZEPI�SJ�4l<�s@\0��*�E)o1�ޠۀNH�)�\0\r�7^5\"�|�0UA&���e`�9��!Uo�!�AT���Z�W����?���*ȇ��ա�\\]���$OiL^����IÌq_�ޥx� ��I�������I�y+��caӆq��j��u��&�6!�e����OR�F�����f��K�9��(X����Ko$�\0�dC��t^�O\r\n�]����9�1/���6lU\'9�D�`R/0�t����\0r�UO.:\ZK}�\Z�v�N�P1��d���U9 �\0s�	9��j�%T����wt5Y��瑆T���?��RUQ������6�?�E�\Z��uY�I�|o=����=KP����%�UQK:���c_1|E�狵�4r�A��`o���ʓФ�9���ƚ��O�C(	\n��#���s��5�d�F�|���)�t��*ͼC�{��ȃ����@��,��Ynf��m�!�d�/�����f�D�}�\Z���\0i`����O`9�ս?C���r�Ze�hf%�p���}\'C�QIw$W�0�2�ϱ����Y:��-�@N$98ܝ09�qY;��5�����St@��7�v.s�=��G4�	��kW�t��qm2�D@\n]���޼W[kw�\r�<r(dfM�\\I�@�޹e���$�- 4��L1\0�U,X�\0��4�n.%�<�\"X�>@�i��O�&�a��<b�?�;e�>����exd6�X�\r�\n[�yݟAZ��L7ZO��,eP��H%p:��c��=Fy��t{�\0�xm��Vôw�r�iСN����&�D��xk��Q�u�$���L��T�\'�Ez���\0����ok�koky�)�ׁ\'����:W��C���I4��	��]?�����H�-R6WԴI̬���+���Cm�Us�\"�X��C$������%��sW���f*��H��+�B���1\\��[�w���:\rˌ�M{|l�h�8#9V\r�\Zw\"�f��d;V�98�G!_-{��Z�w.�azU��}�! LD&�Ȭ�`�������u�z�*�gf�%���/\nB� �������{�I!T\nY�R��*��!;N0I,1�PyA>i#X�^�����҆����+���F���ےQލ���?:�$�T���\'û��>�PJG�[��:bgm�VrA�D�Q�ܴ��@۟~����+JOS�Q�aWs(G��I��������L��Q]#}�7�vڧ��p>�֮Mp���Y����Y�V���\0{�(Hdq��S�q�W���}iM�L�Ӱ������ǶC�c�w���,�����qN�-�l����\n�k0�Wf��Nzv�,�ɖ���ޣ��|<*�+\\B5�Y�q��\Z�0��@l�\0c�J��1��p�u^��2����(��y\r����bq�Lk0�� ꣿ�9f�!s��E9�bߝ���h�Y$v]�?�fOlS�P����1<�GZ{\\�!fE���T)|ܶ��v<f�2_�IѢ���$����_3hP@!��rF*��߿ɓju(�5Z����βc��1A&�ë�(C��9�h�O¥kͶ�c;q��\"�<�Z�L�s�c�)�p�����0�w�LgC��Ђ��y���%���o�n��\\����\"�+����y隍�IKn\'b��ȪH.t�}��.0>��V�R1�^��n��M���o����\Z��T�c�֝��:Yo?vp~�뚧5�L�6�ܞO�b����}:R$��R��b�h9?\n��|;�\\�W(���s;�n.P0��\'�E�~�S^��,P�R���<}k#�@a�~��7*9�\'5���^����\'ӥ@�e@��9�;T\nY���I�� `������?�c;�x�Yմ?���~�)��d���_�n��<W���|�N����k]6�(#v�K���[�o�*����*�J�>�/Q�S�b��|S���)_j����ti�/��Som4rF%r�w��ן\\T�ɿ$ȓ�~�����(�p>~��}�-�����mQR00[��F�s寎��.��K�=���\\h�QӮﮭ�Sw&T���ʞ����ðE�2��2���-%��V!���WD߻@�À���\0U=�����^��<��>6��u�|\'���x���3��\"�9��m.�׸�*��J�����8���o��W�ǈ5={W׭�G�\\��x��k\\3ɹ�K�`�����ku�v=iѯ8\n1�|����<�����?�������u#$������C�Us�W�꟱&��|%мw��em+V���o�9U�h�Up��5�����F6�#��V�=�#l�3�g4r�R}O<�>��$�C�\06��qe����!0�\0\"���YYc5����\0�W{�g⦟⻯G��g�}�t���FS%��0	<qǽ}��dV��QyI�U8���Oc�ߏ����>1jk��Sxc]�:�����i#���ԃ��k�,�\0`�Wė�G�_5-oO�����#8p^g\"%��S׌W�r[�^W`逧�1�yݰ�y�\r-Ԥ��x�zï��~�c���PU#�Ŏ3$��np2k�\\A�Vf��\0��l�5C&���>᪺\'V3���J����yCr�G������(��4�1��$u��y�R�r�)�ҭ���\0,��M\Z+ ��{�\n�P�5`ۺ��\0�H��67��ih+2��Rwa��;TK$��H��n��YdF�\0/m��j� P<������\Z��9�OBv�N0O�X��MF7�a���;0=�&��M#6�)��jHs���ܼp~�ϛvh�G\0���c�F�� �E�,p;q@��(��nF?�r�_5.�qOY09��1R�ynpzR�7!O�ޢ�nr*F]�ҳ�؍�Z�d)���u��?/ݦz��/�8�Z��8��Ͻ �r�	��K+g$TQ�@ԪŲ�c�D�4�xT�&�V�Sߊ�r̡H��6h88��{�N��84�����aOOZ��q��jIo�)��AD�vcm�0��f�X�����6܆���ǚ\0�w��8�LS��^��	c�:�f����w̞ZeG_���reW֧Uy,�A�P��J[2���/���񦂠}��~a��*���u�x�H�\0R4ʬ���;\n��Y�?�|.��4�����xz����#V�M�1ur��q�ڢ��H��X����gNr/J�B�(	��\'�T1�a��YT/a�j��D��sȹe���8��LI�cڻYv�����#֞]c�_\n��85Z8��Q����=�_z�qk��̧�b���$1��o�O9=�+�ա�U`8m���54�i!�3��Ƴu�J6��{�*\"Bp��Z`x��/��y\Z%��~餝v���\n�-Ly̩��e9a����Z���z�5S���\"HİP8��c�a�c��n��aK \'�Ea&h������*d(���\\ی��SƳ4�1YFUv��l�Ԓ3�zqU��ol�0�2�|����7��=:֕��s\r�0��G*U���8<��g�+�h��?c��\"U1�C,��\'�5^k��x�.w%�e��8?��:>�+�	��,d`���H��X��)#h@�v��t�,ʾ��t��i�f��5�������s�T:,h�Ԯ��ZC$�d|�Q�-��\n��(Hm�`�lĶܦF�zrpMn�z��rB>ue��q����V�N�R�ӭ�U�{�L���kb%���\'b�z�lu-N�MX.�f���[�y\nOM�����%�x�,R{m>8�v���6�bX�����|�Y�D��p;g�|�}�z~ԃ�����9�LG�a叠��uF�V�s$#[����x�O��Jһ�n���<Č���H�¯�*�]�oc&w�F�6��s7��r\Zh��Y�/�L��/��[XL�,�7�F�6�wmہ�Ls_Dٵ��Of�4s�֏���9�k�xsJ�>�>��]G-ؙ\\�jC@�fI�<�۔pA&��=�S���Vz�Կ1x�j�[HK\0A�u��G��oq\Z��E��\0����(�KO9��8�8�++��)��F�m��EY!�d�.=3]C��du�J�ɵ��`��E�eB��0�QK�Y]I�i��RIyT\n=9�Mg*�vb@���έ�`i��ZL���ª,�H-͌�ݹ�����Q���_<}(���b��^��Y> ��Hrpcq�<Wey+�h��\0�`��t��rF��N1��?N��%����;c��A6������!@����EM�Z��Y�g��(x��X��u���6q��8�(�.�����ަ�c�i.�b_��\0�:�|wQ����g��^�0�����\r3M�Eε���	����R���vK#�u�+̴�����!>$��)_i�!�odK&I�u��\nX�r\\�z\r�Zh|��9�	ې�O������/�vp�n��а�?J�G�W�����_]���Ɠ\r֫�i����ى۟+咠$����������~\"����/bԭ�G��Õ����+�����������{���?RL\'�53]�L�dt�۟����ƺ��4;\Zj^.��k{���K7K%��\0ۿ<���\rU��~\"x�ß|+�g���\Z��o�������H�^�Ƙ����JM�ʬ�с�����u�������w�+�k_�g����h7�A��sK����7\rp�L���E�+����3����ķ~Ԯ��o��ͩYڳ��Y�d\\�ׁ�Z,;3�Sp���c�K�O~�]��M�<θ��z�������/ÏO�JK+�kpX�[I坓!e]��	d���x��f��o���p�Mq�5����t����e\r�	?�v3��#�I�m���o!�\Z�ɹ�h�#v9�q��5���SS��#��Q��V��\rKX��Ե�fe�HU��v��mR����5	�W�����=[�#�K5��p]l�s��(�K���)\nG���9�T��S��-�h+�?ޏ�Ϧ+3�WFX���)w7ρ�?-��i؋�[�i>u���Yb$�\0:��y���9��ja��w����ȮEİM#+l�o�$DI?� BT�Ƨ�,~D�r[���i�0ʊ�W���P�� �d`{yt�I�Y��w�����Pdmc����=84\0�W���]���0��񏐎I�����F�NB����\0�A���҅���x���ϊ5k��v��[k�-��\\�r��~��85�PM�\0�@\r�ù�+��Ǜ�񗉢!C�R������W��#���W��E�{��h������K(�r~{k�e��NVyQ�J5,~�.�$��8�{�>5�~�r�> �-�]\"ݑe��|F0U�8�s�3i?t��N�����i��<l��_\\}+��R��3^�	ٶ��n���%+��]98��c��w�~�_�I�\0Fl��y����W�x�\'�~$h�x_[��t��[�XɽQ�+\n����?e_���\'�ٴ�>5�O\Z��7�>�6�-䴅�-����ּ���h?��#��uyዅ�#���^[��y�O��Sy��8�9���������9��K:����oiFe��7��i%T\0���zsU~�Z��k[��\nx��_��u��KB�E#UX7 :�¿�Po^�H���/�::�q=��i\"�w��I����$���U?d���g�\0�Z�s{v�g�K6���Vb�̶�������2]�}��/�g��������-�u��d���1��-uK{�6������)#o�E`\n�z�?�~w�\0�U�����CZ��S�;�����\\|5����g�`����\"���K�|������?��\'��o,�y���6Q��r1�z����O�L�/��3�]r{%�%��6Uw�ܿ��>��:ѷ����+�U���b��\nˏ�]G�?S�����x��l�J.�uɻ��J��?GVUa�W֠��4�W,Xl8��M�Dm��>�*}-7k��b�	>Pj���3�����0���==�mGg l��\rM��$��K\\���E!���\nZ(��bR�Ed&�;m%�Õ	��ʊZ(�T%��QvBR����QE\Z�B�X� �⿴��V)�nVQ�޹��6�R�dȦ��G��냎)�����n��i��%X�֢�FP\0ݚ�[h+o(@nz敕�2i���p���6U�M0B�%@�s��͜�h2��qF����PQ*����zVe�<b�U!I<҄]��\rK��1$�jM�TE^Bp\0��G�U3Y�=9���.A�)���q�^�q�@BÑ�����#����69�ՎY��	�Q��y�lI�SU�\nw@��Z	$Q��}=*L��OZ��W�g�/�����U�񞢣2�9�\0S��Ɇ��z�B��;:��4��a�r;�m���<TY:��R+m�B���A�*H�W?�F˳9�<�/��P܎Gr���)ܩ��_�ҡ)�Մ���a� }ED�Tw?>HO�_\n�ĞZ궨���&1�M@��Ԑ�� \rߵ~\0|V�����,���b�9��>���\0~�2����1�۽JZ�#0��p��h�O��W�#�(x�	ppG�֫�n#ˮI\'��3Bs���\r�=�N�%��9����=��z�\ZU\0�ϻT�{]���?1�S[��3s;�\0�3���1�d\Z�,�Mц��ٮn�cj^}��.�+�����=���	#�k�V��F�m#F��6�y=2}(z+�:���f��� �\r�ȻIc��jCC�$X��Af�t�z4�ǧ���4[��1A�\\q��7z{S���at�-�dI����q�`c\\��m���|˹��S!j���O��OOJܲ�f�>�1����q�\n��[�~�3��U���Q�#?C]m�����8�jrɸq��:#��i�y��aq�����km|(�㴞w\'l*� R9���E}�W��� !s�?\nݲ��M��叐2�>oSI�(�q�>[X�m�;K���\r�cݸ��~ur�N�\0�kM��]C$�D���2�8�`�5�X[y�F_�lB�w\0�J��i���#�$,v�#�I9�z��sǯ4�/Dr���ͽ��N��^^��3!\0�-ªz�ܟJ�k᙭�T��i��.�t�J�\Z�=:��� i�@\0���Ȓ��T�=�ک��1U�uY��#�#�5,��|2�IX-ͳ_p�S�v��UK�	4]�-n�I�ܪ6`�\'�kj��WO#��E!Q��\0g��oF\0`qޱ5�-�m����!��U$���-�*z�y�-�d��fb�P�\"�F�|�������+:�o.������A�ܜ7(8�\0�w�V�i���4�ZZ�r�.8b�W²�c�\0W�5�QY�ȭ��c,�#�����YB�S�~����Ɛؼ�\\�I[urvw�F1_F}�R�CN�\0(����\0K���)md�v�왛8������]T�i6W{��4k +n�c��ⷋ�9�����6H~}GZk�� �89쾼V$ӫ�WQ����\0�U&�M�\0��x&6��ե��l�|ce,�\0\'�Y������z����`�G�&��>�#g�����=���t���,s����f���l�_�/;f�8lLH������C�@,�\0W�[8��jݺݵ�\\4��(�y�\0�<V2�s�<�\"����^��>K��Fz,��^/�_��\0������ziW�Bt�.\"�}��@��x�L׮��ycoԒO�=L,<��S�l��\0�T�K��7ߴ��n�N\r��6�d��B\"[����H<�H�;ט����v���r����j^i2�#�UB�P$���6�^z��2H��a�s�#�\0f�2��\ZF�6�Č�\0��Ua��/�g�N�\Z�«$�Lq��:�bV�Vhܸ9R��_�<կ��u��9�:�P�]�WS�C��O�Cb�D�\'�I\'�OAɯ]��F�\0{U�B�j|���h9㿳�����\0c��Ca�-M/�%xĪ�km�C����M��j����?�-��}I�����̪RW�`�nF�m�����E��\"��Bz��1Q�bCL��)�J���������z-��|��D.�~�4�80mc��|m#��zT���ϋ�3����O�w7-��V|�c�#!d��n�\n�ZK$U�w��\'��O#�\"�����-�~�֋xS�F����aE�4rE/�9�8�9��t~����㗊�����N	o�|;��W�VV1�ڥ��͜W��\npT*���Dk�<ޕ���\r��C�~�;��C���|9�����:�@5�\0����!�T���x�m���Tԯa�?��o	XG�\r֟�-�I&�#e@6�e��1�Z�O�y���G��i�	�6��c��,\'+�F���E!y\n8Jn�܅�ѷ�޴�*���j��b|�MLNTsg=�\n�.I�C~dd�ʞi����B�٧*�nq@�0sң�W�ݜ��ڕ���R>Z���z@݊p-T��A��x�洞B�ݱ�Ts*�|����:SN�~dx��z��>$x�L�m.�[�5K�Cm<y��\'��}!�w�5����T���:����w�I��P:rM}�i���6�d��I�*y�݋v뜞����5�;\nT��*�����tG4hEJ�c��}�-l�!����Xm�X�q�\n���\n3���>!��$�\n��p��P�\0C_XD��N��������4����H����x�]g_<s;X�\"�I�R0?��-��T}�~̿���?�!��5�oN�oo����OXR�˴p��W���\0g~�:�xO�=D����q��̨	��`6��d�=��\'�F�3�{/	�zK���d�T��Q,��}�\0`g�V�\0�	����Z��u,�a�ZKetl�U�bq���c�=�T�CW5�~JxWŞ8���Ik?|�+�k�����Q7xa��Ene\npM�n�OcU>=x�⮛�cL���K��}���٬�`�kl:���c��j�9��6�_�|ү��A|M�-�����Ylx \0��x����g�ǅN��{y��[���kY<� �G���	RZ�1���|%�\0\"��|#�R�X��\'��H�����c�k���\0�?���?�+O��\0ciz\\0�+L\"���Q�17�d,6��w8��/�a�Lm~jZt�\"𭙑��V��${���(B�Ă�I5��4>]y ���hm̏}���w.�\0/y��\0ӳ{	5k3�?��zXԼ}��R�ݒ�?\\#y��	%���\0�:���&���ߊ^.�~�og$�!7R�Q��G�� n����_��W�����b�i6��Y��I+�s�zg�^\'��Ὤע\rC�q,���\\rl$�P��Y��;���mϧ��\Z�zs��:D�Ͱ�o�C#n<\0ǜ�B���b��,��n�|���\0�\'�\0Ý^ҵH���~�2�O;���*��+������i�y���E$�p�z��f�uc�S�EW)�QE\n(��\n(��\n(���QH�(� �������3GP�y^��\0��F�f�\\��犚��\\��7�57M�5��n/,r�z���Ӡ�8^�B(L����=h��Z:9>�����4���3�K��:R,\'��`t桱������V����C�֗i�Kc�RQgj�Ni�\0\0ϵ1[j�=Zw���<\Z\0\n0r)��|�g��H[8� $_��\'���Ȧ�����J�x�Mb�;��w �w\"�d®[<�O��AQ��H��Y	�>^�����f9�y��h₉��{R�e[�i����u�z�Ԯ�F{�@�F9�V<8�Eh���\'�A ���\'��jR�G/�����A�\n��?�4�2H�-��_��*\'�����O��_���>��՗z�\0�%~��H�q*��q��,;W������a� ���׬n&�u5�����y�Z���i��P�Lr�vs$;>OϷ�Ψn�W����*k[�ޒĆ��g}LYv��&ߒ�S�(���{�����\0��yr(f��i�#�{p��𞆁y�v���~u�_�����@�p����3N��� ��A�_I���EY�g��_-�|��x�ܙ�@���X�@���7p)=bʎ�va��gW�9��2�#*yM��9�\0�WG��7��w?�3�w���q�gۥr+�5�����-��W`$|���^O�w�\rw[�y�e��;\0�/�k��q^��m�q�J�Q�����ӭn�De�	dY#�%@1X\Z\\�~��F������5����0�����I���,n6�䀱��pz�[�������f����6�F�P`of���mCw���^e�rP����Z�u�Z����4r0���� �?�U���Eh^�#���2F\0#�oθ�U��a��c�~Q��q����Qp�<�xf���=\0���aٞ�����&X���`�^\"q�X]���\0�߯\0�Z�<Q*�H�a�O�\'�;�\\?vu�_����\nj&��=O� ��гv���zn���[X֧�2�6�!~��%q�9�U��jśs�ʨ;Q�ێ��\Z��3e�ؽN8��\0J�R�a|D�����Go9L��Czd3^96�qI�6Ǔ/�7v�:潻W�3bl�\r�����$/��5eu��ʱ~B��ʳ�hʬy�9�˄���t3�`e�y9�󯸾	��}����	�)��vAe�o�����\0�$��V0���)#j��={���^�e��x.]F$_�B2k���Ԏ���ct�1��=�)�c�(]q���z�.�1\'�����*�Z#����#��u��s�3�o8\0�\0R�c�Ĉ����j\"�@��Ln�l`�`m��y��?�<^�e6��-zm��\0G���A����^i�uV���?�A0��t��b/\Z�$��*}�c��\'�Al�;p;zU(�+y�!d������j��\0x�wc�)���õ3qe%���U�����9�?��I�<��\0\n�O>�ɵ+@�_���mT�Ο��C\'��gހ��m.p�	�\"I��=sY\ZO�t�Zv��T�o����S�1�*���qޝ�kZ~��ﯭ���[k��$A���	�=j�3ad6@9����`����om�[%������l=��4y��q�}MX�ԭo<䷸��r�G���8\\�ls���X����l\01Ұ�oh�=�A��Ze���;��a�FU�x\"�l��uK������A���d��@`H>�� L@�<�\ZE��/CU�u[}N�W����H���[̒�?e$�FӃ�>���P������0��fI�8e�[���h�������� �=7S��>��[�[�m����& �X+�t���R�mB]>;�V�O����\ZuP��cv9�H�\r�;0�n�89�0v�S���Z���w�O{o���m�x�Iy�-�ߠ=+*o\Z�]��]k�=����h濉Ђ�v4S����zb���<����ؒ�	����oI�p����#�=�\\�=�by<qҀCUUFOQNS�|���ٹ��}��FOj\nJ�\'��,-ӏ��{X7��J�Wo���\01���C����R�W_�y�/$1���*2X��M&�@Y���\\���.=�]��H`G=7��·�_K�k�G�m\rޗk��A�f�Ή�(x��r?Z���9�<]�Gy��V���&����\0��\'��M)5�9�Z2vGk�i��A���o�+d��Î��;�.%���N:��u5�͵+#ҧ�vd�\0�7f9b���#xj̨��N~��z*y��*2����O�1�����FU����kV���Õv2�6.*ߝ1|-b���rGzڢ�3X�2�l�3�\0]���79�yk�|�9Wc\'��>��>�O�ö�ˁ&�7w�:)s0�B�KE�\n(��\n(��\n(�kŗs��o�Jц\r����)�re.S��Ҽ�u[ݠ��^�7�F�/�\0�ܤ�\0�kOfe�Q�{[��^{��z�?Ҧ��4��/�����\0x��j�E��?�j���k¿��1�1���.d��3�\\��/k��I.#�e�T���ak^(��3�y�0���G�}k�f�s3ri����zQ.�\"2Źc���yb1����+��O0��ɭw�����K�9Z\0qLz\Z\\�F��8���6=�8���1͕�z@ۻN@�-�iz��+&Z��R���.�+�\'��\0�Q߹�,C�P1�n�֖6e\r��4�7`\Z�T���G�D\nA`<f���H~q�w��T��HS�t�wlSX��O��Ҁ$Gܻ@�Swm8힝���H�ӽM�(q�A#�\r��sJ��O\\�b��`\0��S@H?w\0��p t����sP�������G�\0L�B�S�\0����t|}jE��=�c�_�qSB��Aa��)�xj�?��Y�m���u������[���K��]�\0Nr� ����?��~��Z���Ik���du�����R%:��m�ӭ~��2cV���Qҭn]M�V�\"�9�#�U�n�B�K��0�X����1o\\qV㔼k���[V9�ny�&nw:����Gp�JVD=���<�\\�����2^�T��8��E��WT����/(�n2��|w��\Z6���,��p�=°V�A�\0h�+�ɞkwFA�z㿵|/�^��|q�ڠ�34�L��DOĀ3I�DpՎ�\0��η�y�k6v�X�y��\'n��^����ְڵ��Ԧ�O\'���\'�+Ƽb׼Owf\"M�,a�|�$��Ǒ��薺Շ����gPd�c�fۃ�_j��Z�7k��jʪ��J�x���}sS�c��a���������[^�\'����\"�vEndڽ�~=��f]��?},D�����[F1[�R���G3)�t�~U���5��[��\"�����8�_1O�Ix�C��n�m�u��On�k����M{�4qj�=����~�e\0�2G�Z^; M��z���l��*8L�͏;FUar#��W�֬��n��@�\nQ�9�e��\r�5ʁ���3֕�ִ�.���o�\\}�\\��Ҥ��L��\Z}�J�J�u��i����K�>^\ry_��&x���IHm��<��<��4��D���o��$.�q�0����CO��y7�D����G�Ҿc��~4x���:U�\0cΖ�\"A��Kq���O���2#��V��c�?�>h��_c���I!w��AGUl�q��^/�w�skV�i�;�!��1����U�<�\0�q<�Ɓ)2�I4\rj9$c�_�^����G��qMfe(f�i^:�\'i-\r���������ѡx��]��I,Xw9��_O~ž)�x�i/ �d��6�	��xƝ�K�F�$��q7C\r�$���&������B�ŖZ2�[˦\r>i��\n$\'���-�C�1g5H�ϵ�Y2C��f�B�q��tr7;��\n�\n.{�$���s�F���t�f�[��1�SYSp�j�䣂��)�y��Y��+^Y�Y�&��#��cJ�[��m�-��\0��\0���\0�����@z���Z��q��_���>���K�	%sg��_KӮ��\nַ����Lpq�8���Բ�8b9�F��u(�/è�+p�<�	\"cnA�h�����NpMC4����?�\'��1�x���.��8|/����D�\"�ʽ��1�v�O�e��j��-���[|����g�?��b�������O��q�K��Xj��ٿӤ-�P}����(�I�~Ο�S|f�kP@�Lg�Z7�K�9?7�3��pE%s{���g^~�\Z?�-4�����P��[47>p�34�[���b�����/~˃��tZ�����a��)t��FRFK*�ץA�<x��^�<⟊Mu�8��iz.��r�\Z��9gbK�o��[?g��c�\0���oK��G�����G\Z�� �@ �,I�#C��o�������\0K��&�i�M��[��2m4Y�Y�6$.�=���ks�9�[��N�>-�A�!\\~��x�=ŧ�\r?��:�u׎<M��4���;;�|�S�$��=@�SA����}K���ϊV����ɨIn��锒v�6�����\Zc��C�ko�\0n|:���m&�i�i�hm���IfN̸�����m���|<�SJ�ǀl��@��%�b�!ʻ�7����,վx��S����\0 ��˭*�M��M\r\'�C��\0gE`�����E�xe-�S��S�	�wԒ�lǖOȞZ`\r��zd��c�?������K�ƗR�� �\'׮t]w�Y]#���c���a����|%��>#jᏝ���W�^w��C� ��W�x/�u���\0��s���|<Ac�^]]y���̤�?ƅA�=�\\E��q½#����\02�6�}0�#푈��n��N�5#Ovǜ��:����捡�~$����⸿k;�)�VR�<M��rW��#�U�F�u�ڻş��̋B�&��_&ϕ�nc���@��#5�o�o��L��_��ٞ�<?�&�Ş�\Z$ꬤ��0@0z�V=����i�-G]3����#hmp�k����N�1�PpJ����5֧��=�x��o�O/�t�iI!���f���4�^��j��4�k���\0�S������b3 dr����d��޽���f�_\0�3�杭}�O��I}%����ż�e�(X���A/�_�<g��H�\0�rj&����X���s�1��:��Bq���x7O���֏��&�g�k� P�I�)�Hʓ��zw���(b�[O��t�+mkT:ޯj�:���}�A����W9=�j�\r�ܑ�ެ��*�����*sڜ�ؤ����nA�\0�l�U^a�J�V#\'֝�/^����zf��\\����dS\"����<ӋI݉��������v�>�s�Ɂ�ej���*׼��M�^��-_\"V��ѳ��W����o��> ����\ZC�WJ���dDy�r����z���\'��Ꮗ%/���V�A_�\n���p�^���1��Ҍ7g�,�F���S��e�}B���z4�C�{��Z�N����``c=s����s^��*]��͵�������2���9#��G�	QXQ@Q@Q@Q@Q@Q@QH�o�qh?�o�+�=+���5������;��Z��U����=�ȠG��\r֐�B����@?Z��I�>�+m�x�)sۥ�O/j�SZ:�6+�G��(�|�TK֞���vX�z�(~�Z��9��89�5�Vʞ(wgsK�Ȧm+׭\"7�s@��q�֣lg�Μ�W���@��LMV��?i�rx?Zdj7V�,��0���\\m�Q�ǃH��{R��穧3��=NzSBc��Z\0rI���s���犎8�u�R*z��\0*��}�9^8�J�$m;�4����@��^y�վ^�Y~�.�	�R]�*U��S@�4��쎔�sRB�\\�2���26�u���t��N�[��s�S������z՛H~ՅׯAҪ/����V�������a����*e��ks���QX����t���u� \0��̦�j5y6�W����~/~�y�\0���xde}��]�<��9��MXf�v\'?1���V��V���ҕ]�v�zf�6�ڥژ$�[��.�C6O���(r��4�&*��qȦ�G\'uϥ=S�f[|�#\0g��������ǚ眓y�`ZE��=��b�*�$}�9\0:f�8����\0P��_�LwWv��3�o�圏��LV56�Շ���9_��p�xj��h�M�Ť,Cg�5�_�B�\Z�T�Z��e�t����7q��p�\0a?���q��f|��+��mQ���L���$E������Q���5���[8��k]�,�Q������I�!V>#���rDs8p\0���|Eᯈ���h��cؤ7��JǓ���<\'q�j?5�Vqέax	�:�h���[F��\"Tm�����\0x���ҵB�I#{�I��\\����\0�m}=c�?������6�>}cƿ\r&8��\r6m��I(~b\0s^��x���5[%�߇��&�\0C���\0!v�G��=�R��:|�٣��6�eo6��S�`��vӲ܅��nl��\\�W�w���n�\n��.��-�o���Usi�c��#c�I���i�.��x4�<�\'��䎀����[�	⼘��8����:�)�-�I�jpZ��M�����\"G�&gq V��d�m�Z|n�R��]kvQJ��(�x*?������H�������ln-z���;0<�\0�0�+��o��x��OԼy�L3\rn8��c�E�B��G�q�8�SY�f�k�-6��oû���1\Zkwy-v�m;�����bs�h߼}4�&�{P�x��ᄌ�_��d��D�I�B�C\\W��n_���G��c�\')��?��\rzW���LQI|w�\0����N�qQW��7�M�Ծ(Z��̲]Y#-������9�g�~#Gkwn��&�+���#�����V�Ě&�s���˞vr0�8\rv��?ak�L�4�i��4�a�/Ƞg\'�=�cgJM�D�����O9�FmŊ�v$u�)��>�>5�1[�4�Ԭ���1�I\"�����	UG9�e>a]�8�)��xʖ�m�y���,��zKl��5�WV6�j����e��g���}w@�y��4�\0��jz��?��9>PB��>���[�h5�n[ocM�:����	�0�S�Ry�7�#��.H���ncFzw�̋��5��\0(l�q����r�(�zs�P���jsV�6�7��p>��ZB�\'�� Pr`y�8����ӊ����~�H�����0�sFYI$=E@c\n����V�P��摶���hDcV9�MhN�֥1�n�7a��C��M�F*F��2~�&�\r�LgQ0�#�،.F3�\"������4�\\6�x�NF;�>�R�\0(Q���fܣTFLI����#q��L�*�{Sw����N\0��((��f9�H����sK�7v�0*�����(�P�q&N>lc�OJԴ��	�+6�*���z�ִ��/�\n��h��.n�S�U����?�jڬ\nȬ.@\n�\n���{���B�(�4\n(��\n(��\n(��\n(��\n(��\n(��\n(����\\��Cy��Hk}�{����Wƍ�[<��OoqZGs:���ጤ3:�bv1�~�m[�8֣��UVUe��3K�o\0��8�@��\\��;n��4� �����=�\0V�i9����8��#�\04y#�F�78旝Ǟ1Q�[�<�@ۜ��L�U���\0tqL�wh\0ozM���+�4��t�\07!W��\0psO����)�2�Np}(�3�0TR	7(��iU�\0�*,U����x4������}(U3�jJd,���qNa��S�m�BK0�Oh�?)��6�l�R!q@(�u�.�\\�qL�;T�#y����-D,wpi۷��QrI\0u��m�Vڤ�➬q�i���?\Zr�T�4&ѵ~u\"�í@�<�ȩ#��x=��8+��Npx$��q�qҥ_Ri�{���Y��B����^�֣���=����ch���&�-n~!~ȶ��P�7�)|ԏZ�a&�s����F��sݏ���\0ح�\'>\Z\n\rf&y��������w]K��� �Sݎ�O�� ���l����\'�b�����`e��:��B���*é�s�L1����!1�r�N0Ҿl��WRojZ~�v��$HK��=\r}+3u!�����⮭i6���7v�����3�]Go�\ZΧ�w���#¼is�􄜳-�����^�����\\Fb����\\N��G����\"0���i��>PB�2;\n�G���zO\n%�yi�\'��C�������H&���\\4�����6L/��4�RP�7S����K�ͩ��:���˨Nr�j&ҭ ����q힕����aYV>A�����\'�|�����Z�ǎ�m�!h�\"5o�[��ֻ�5N����W\'̂U;��ծ�JY%�̑Y\\�v��Wc:��P��\0M�3�Js�Ϲӭ��)0*��6ִn�6���O�Jt�6%�Z�s�g�ڹ�n��Z��K��g,O̲jՒk١����,y�K~U`ؽ��.X�6:}=(�����wK��KjGk�]���60Z�KH�ːn^^kզ�J�7�ݍiX�7\n�Lf�1��U\\�����_5�0	�TUR:����:}����LԔ�B�F�k��_�˱~�q]����Z\r���Q�}� �v� �q铟q\\��+oX��N[m�+$%U���^�3Q(�b����G��E�朼ni���c���֤��k����WqT={T^aYs�BEJ�6��`�x�N� ДR��{ח�\r��H�ځ������دS�E򙟧Nk�<��G�J�>�nzg�Y�\0�+���8��p�Fk�|U�P|9���/�=O�2[�6�7��El�r<�{�5�W�6��H�+�k]{�~\Z���D��i�(�dO�����kx��U�~��������#�}\'�/�^�G��?�~!��M`�V7�0=�\\8`6��#�R|1���ߌW��ԮogӢ�Gu��j	 12(�P��x�����\'�����#֍׉^��mZ#�����W;cIR�q��z���όv���W�]������M�t����?l�`�rnޝ�A|��5����V��\\XO��t-\\��֝c=�0�z4��A���wK�?Ð����m@�����U���\"K`����P67��$���_�>־�SD����_�j-uq丏j1�\0��9�1�k�o�\0�k�Z|���f�<\r%���|�̱]|�݂��\\��럵w���Si7>)7PH-���{�drv�fE۝�8������e��_�ך�����ܽ��s��B\n�0��\Z����S�ܖ��|m�~k��v�/*�����\"Ny�\'���u����4_����țŖ��*3�E*H�s�dz�.U��W���k�\0�Z�k�_a�����Ѯ|י��&�u�I���ƿ�Zk�|/�Ǩ�Y*�� ��9��@�����㿶5ޣ�����h�ZM���崷�o&�0�2��$rݲ*��;��~ӟ��\0\Z�m�?h�:[��E{cg�3�=�O���3�=�\0�G���d�����\0�j�G��\0���ʝ�̠�ʯʤ�\\Z�<E�`|0�Ʊ��z���Z^��-i:6�rS�F!��2����|��O^���z����I�<Y�e�E�Ķ+Ń���q�k�?lMn�Ş�9������Coy\0��G���H �P.U��m���}�%�͎��+j�����Ώq��\"�S�6s����>;�7�f��^��7�˯�4�6�K˵��\\���6�Xt�W������?�P�!�\0������.�8���5W�M�;��.���x����TQ����p�_;��	/jW)�����xP�v���{�����̈�e�PK��p ��<T����\Zx�ƺ6�׺\r�R<��,��Z�ux�ޭ�rpT�+�j�;�W��v/��\0��_�n1\n^l��ݸ�\0q�{�)�ָ�\'�\r�?���࿱j.�J��&X�>��ص��/�|U�x�N�����ڕ�]�L�b-r���I��3�j��g�k��l��\rj�R�O��t�A$2F@<�~v��g��s��ϡ��m�8R�УC�\'k���O��?|��\0�\ZR]]h�jZ���8���y�LG�$��*=h*g�z/�/	x���ώ`�E��`i\"���#\0F��������1��7�ڃ�ߋ��m\Z�^���T�mB�kXn�p<��\0���r2O���N����kMUټ\r/�/�n|��T��\r�\\g��W�߷5����gO+QK�h�So�p�\"m���@�֘r���6\0P��J*��Z�<9x�Y�Eur�jp��-��\"��c���$�^��Æ���PC���=�U˗Q�%29�5zYnW#�~�H��c���%���h��*���}:�\r�f�Λ�h��[%w#g?w־��K�J�O�B�o����\0:^��Y�1�I��g���\0���h����ʎ�G�G5��%�\Zk�L�t��K�o*��뽉!T�&�����E�U��S���sy�u�?)���Z���+�d��������f�ڽØ|�<��f�~@��ɻ �\0 ��2�T*8�t}-sA]EV�EPEPEPEPEPEPER\0�Wƃ3Z@��WU\\���$�ǣ1ZGs9�s�CzSB�B��;RȬ1��]��y�ZFviv����:d�\0v>����$b���H�W�߽\03�fP{Sv�ɩ���i��HQ��Cnۂ(\"=�׵+�#�@�y�ڂ�48�Ҭ�8�+�1AHn㻞)��c����c�m�w�@1��FEH��<PJ����I+���԰Dj}zQ�����Ŧa��oLqP�\Z��֔��x�7o�׏zn�� c1�A�<�������rb�@\n��=�1��\0`\Z~�U�l⍁�X}=h�|R�=�����H�x+����&Ybs�ұ}�m��*�x�\nNp�to��b�V;���[\n�\rÊ�?��sހ&��>�.sۑQ,��J�{S��@\0��S2��	�*��?�W��i��*��8�jŭ���\0؎�?ᨾȲoa�����9�~����.��;�����Go~՟#�~WSV8���+�6�4k�����h��Rٓ�(4���lƹ�i$ܬcJc��=ks���|�����B\0w{�����n8ۓց�n>\"F�k�_�\Z}ŷ����7��$�ӝ��`~���&��$�\ry��5��5�0ܻp�����\\�����:�9�ϖ4uf��\\���Xwq��L�ā�ʀ�s�ַ�����/�4�kh�s�;w�=~��a	�B��|�P�{�\\<�g�FQ��=?B�-�R��ώ0+M�mre�5va�k��d1Dʀ�\'��A�Z�_�2%�`@�m,c\"}^H���m�	,_k�mt�|Q9���pD�»�5��<��[�ϧ�r\Z��$��W��K�\nS��*���!��b�%����gK�o*!�v��\0s��]�vhT�%[w�^?�i�3���K�A|G|�,�J��К�-�%�ij�ڠ����\'܎+Uc9ɷdt������4}?vq���5�&�F�If��t�Y�\rV��\Z�[X����;L�	>��K�j����j�g�a�_�����L_+��N��Uv�\"��#�>Te:�\ns��k�{V*��� ��ѣ�\"B�$��\nI9)=\r��:;uܐ�pAU�O�6F�����[�W��\0��^\\X�2O!�j�ϩ��:��Q��/?��$a��b>Q�FG�?*����xN��ygf�c�S#�fr��>��{�S��V�Z����O�BrV�A������X�kq��\Z.Ԏ0��YZ����O��l��،~��m�\n�h�p����G��V��Wem�+�w4�@7皟�[<sQ3L}(N�wFCt��1�w��X�9�~�\0��W�O�+�2��0�u����\0?k����}(��k�|�X����\0\r�\'�<\'�/kVV�\ry��(�n<�ت���s�Z�-rTn<�z����h*�^~�~��>��?\'W]M�&�m�z��4H�[k��)� v=�{����Ꮗ�\Z�ZK�j�jv��V��6�o,d����\0�c^���\'#�L�fq�9��������}���<Ce�\\���=��.R���Y��ki�G����~%���=S��9����t��$�C)��l��A�zg��朑�����2����_�}��K�l.]<G��i�,��N���]X��%[�c�L�W}��F��Yt�ג�O�A5����eg��+�T�Q�Oe1ځs\\�u��B���xkV����@��|��\rI�RY�p�*�V\'���k�~.��5ݽ宯�i3h�sY^4h�Λ]Y@��H��^�˻z�%�����(c�Ӿ�\Zw�T�,:{7�����jҳ?���I%���V�\0����<!�?M�.��[Ϸi��9�_9\n�A,��<{׬yj��@���.�\0�9��4O��$�泬�q-ցvo�~�9�|�W�\0����s_?gx��Rx��=GJ�$�dڮ���e%�۴�(�6A\'��ߺ�P	<�H�:�4���O\n�\r���|�xKKӥ��udx�	\Zv{����7�H�=	5u��^��}��۫&��Ž�vq�4�̈�(�����⻭�5�D��P>f�\n�.���Ӽ7�D�ٺtE�sJ\\�c s��McxS����;�X�<?s�����c1��m�|�ӯ�Ə;O^1L�7r2)��5�~�7G�o/��Hk�\n�$��;�w29�]_�d�鶰��/x��冨�Z��y���95}Rk����2�ب�OLW������%�pČP8_\n�)�</�/x�O���^\"e����ycr��3��Woʠ��}z�țH��~�PH�F|��d�}���2�>bz�\\qZ\nǩ�R��\\��^�)��� �$���k�+���K��.g[+3�gF��d�#���⾗��í�\ZX��t�}*�q�m� �}]�%�Ԛ�!�G�wCWca���\n�z�\"�ކ1��v5�n�-�W�0}�f�.{��oɻ�/�5�^d�#ӧ��QRhQE\0QE\0QE\0QE\0QE\0QE\0QE \n�i�֟��+�_�\\��s�Y���V�܊��`:��ҙ�sHI�\0<WA�J���d`3�9�36�\0�NڴF�Y��`�fq\\�eQ�v�}?*������5\r�\"h�s�=��Rۉ>�>�T�27(�A?)������?wf�ލ���=h�G?/OJg�F3�ƞ~\\��7z�1�9�R336v�\nE��i�dP1<�[#5&Ѵ�M\\��Q o\\RcT/$f���朼���/\r�\"�\Z��GZn��4�{�&��E!�(1��4��HP�\"�­R����4��F�8�+㓎�\0��.1�*�-�iT���x]���|�0TP�|�w�a�8��N�SI�@4�7\\0�4c��ӕG~ĩh�4#������$w��=�Ԋ��9��	{�hq�O_M��I�F�i�ۏLc�cE��\0m��z~�:���ꢮ��V��-r��s����)n~,��{����mj�y\0��y�G�~��yq�\"�������\'�5�È�_�Q����D��ӜW�U��ו��E=����0zv�2�_;�`c�* T�[�\r�ʨ=i[,���O�>�?/�Ls@\r���G2`�<T�UUF\"ƒ�\0p���t7X��:\r������Hd�W�\'<c�����$l�{ �zf��Z�N�$%~V;ѱ�\'8�\'���i�;Kb�Y�.x*�皰�������μq�C]B2\\Z�@��ֳG�\'����\\j��p�.�崫&ݧדZ6Z\r�6�I�J\0ô�}����_/4�Vm\'S���$�ձ^I�Bn\"�|=c���r^�U�&N7$D������!FU>�I���o6\n�\0��T���#`hD=~V���&��K���i��}�t��uqز1-��mg��4�x�*�.B�Drȑ���+��֌��B��w�&�,u��I��l�9���sV���O�>Q�Q��k�W��y.���;=�2���z�UpJ�\rs���}�|mi�eT��-@�x����E�H�U+?v.Ǻ\\Iq�����\\p���\07��=��-��qs����-�u������\ZΤ��(��ߏ���=�^���-�2�\0R娥K��n�7 \'��S�.���F1�5i�*�֭�OK:�����h!s1��SZI������i����er=8�ax51�`dg�Օ�v��%&�4�@:T���Fzf�/�O\\n냏Jd��c�cQ<ex�$�8��#�\\�4T�Pap};W�|6+�\0��\0^A���\n��a���j�߇8?�|wo_�@0?될g���B瓎�� �ű��Ny�8A��z��c���m�e��C�m���|+(MN�O��2�E`�e�\0[�\'�\nQrWG�4��zu�����=x���G�C�Z��>\'𾁨x���w�i��1L�]Cp�O�ۉR��\0�x����{�_j~4�M�íI�[��kW�H�a��NF	�\\�P.S�C�	��8��s郌Wϐ��Z���SV������m�����l�*3��#�滛�֚o�_�>���}_D}bK��]��RGh�<gp6M\"�zh�/ ���g�p+��7����mpگ�>k~)�dw��u�o\"��w*��d��Kg��A�#����]nk=K�>��{�L���\0��X�?)����ϵ0���/�8���$�a��k��\0~�\Z߄�(�_�����\r{W�H��\'ԭէdH��.0L�G�\ru?>:[�����<+�x��v��\0�/U�9~�o��Dẃ�4�����nH�s��p�׋j_�����z��oq��6�౸�<�Au\"HY�~�������B���O��]6Z��]b+[�RM3N��T�G~ᶡN�p�\0���ы�����d�+�#�W���\r��S�^��χz��5돤�ms�E)�B���F�۶�|e��[?\Zj>�O�u��J@ڏ�gH-��lm�W�m����>Vz�HK*����E`����ÿ�.��o��T]\"�J����]O�z�/�b*8�7Mݰ=i>��\Zď�����me�����ty&V�=��R�W���U��0�=�[j�9�s�LW6+�\0W#�?���:�a�k�K����`�f��8�^/�ڋľ\'�n<K�� կ�%m<�Oyg�C$��B�X1���,ϦY@l����i6��7�_<9��#�Zm���y��͘���8?u�1^q���������\0_h~���:4V�A�=�$��J�VV`6�n?�Y���}��n�#�|�c�Lx�T�f��?�:�ν���z��dq��=9�ҵ����U�x��:�~^x�]X`�x�h�Ty[o����&����А�\0�>��6i�Ϋ��I�_j��}�hZuέ����O\0���YD����w����ΰ��Aj����z\'���{�Si���i<�Ӭo��Xث�� ��o�L�ǵ~^���Z��>0x��H�g�5����[�]���iS��6}�蟅����԰�x���S�j�����}��e${\n�%�T��±1�>���>�z��\0f����k�^#�^�O����m�;�i�������;�1Ҿz�q�Osڤ�Ţ�+3P��(\0��(\0��(\0��(\0��(\0��(\0��)\r�ҹO�Y���WW\\��l�cٿ��#��M�d��4}��)_<qCcwZ�8�݅⚭�9��Fq��\r\09�晀�����Ҟ��\'��a@A��S7N��Wޚ�Tpx4\0���+�����|ԛ�\'�{�-*�3��g2t�$�[�:�5��UGұ�����\0��*���Fj���r\0҆���\\��7v8n��@�}�g���\r�E,|O�)�ۻPP���S��4�j�=����@�*\0���+`�F3׵;�K8��������o�������;����=��Ӿ]��^�=3֚\0��I�sO+����c����`�qM��6��摉��zQ�wc�H���֞��~����s�S�H\\g\0��A���<Tj�69��\\ӕ�:S\Z,�̪��w�u���6���[�m���~�^��خ��?�	n���G��&޲-��(��[�3_�w��?y�_�_�O��oڻ��#�_:v=٥�~��If-�트n:�~��OQB���6����N��SFܚc/qO��i��N(��Fޝh�I�W�SH>Uc>���B�q@�*�W!�o��4�HFˈ�t�����`fW�+�^\"��֏w�]ʑ�n�O��{vQ����R�|ǃK2�����v�݈�m|����Z����Ț�\\��<�$*�y5����nb�?t��=�\\��e�Ϣ�y�H�#��myq�F{W����b�.�-�N�K��T�kա���ryR��Et佄�	br\\u���ɝ4kN���|���Z��#TJ3�g�ͳ��c�T:��6�rcBl�R��85��^�ٵn\"�,3�[l��U�#|%E��̜gΒ��R��z��-�<��	a���[5��q˱��=���s�߆���m�]�M�K4#�>�~��>���[��X��p�$��]����c�In7�r+EN;�8��R�\'<t�\0�F�a|��%~�r��GF����Y�M�����[��[R�6��w�xe⎶<�g7vI;4x1�K�j�>�t�~���t�NC\\�w��9��^8����i{��$n����d�Y� Ïƽ���&_xoM����y\nH#�J��I�\"�:�����:��K~�#vP?\Zb���4/���Ue�9�)ۇ�j/0ȧ��#�d�*�sQʁ�G&�Me?{8��\n�	��{ז|6_3����B?됯U�b�<s^_��l~<��/;����!@�F�\"i �x#�k�KM����?h�<�ӡ��^��6b�5�9A3\r����E}�`Y#�%��t�\0	i�>��j\Zv�iiw�Ȳ����T��d�=i�i8��\\xv����7��d�ץ[��2;��c�\"೐�V�x\0�ڽ�Ƈq⏂>��?�W_��[mF{n,����	wK$b�w��s�����߂�I�Johri�O%�Y���fq��&ݡ�$qW�+���>�Yth�� �I4��2\0r����\Z��#�|o�վ�^\'�i�3N�����\r���2� ���z;�m#��4=bO~Կu]h�qu��<k��eP�+=��9+�pA<t��vԾ\n�R֟W��?�nuBK5ܺdM#u\'o^{�B���e�6����cfl��\Z�|�m�A�>T��ZV/���X�>�/�>�Q�մ�CR�I�\'�K�n�F���D뎁�ш�H��<ٴ_�`�-���ՌrW1)e\'�RH�+��?�c�>ֿ�4oxKԷo[�M>8�F\'\'\r���+���4�Gh���k��g:�ڭ�J�	���RA�{��\\�?~�Vw��ď�v�e��F�s���#E�[yY�º��k�����5��Q_\0~�[�v��|[a�\rJ����g�fH��@X�x�����}/ė�7\Z��g�^X�nl繉^Ki�^2G�I�:\n����w�\Z�۵��Z�ٷkV���I$h�a�,y�{�C�A^�C��?�ğ��\0�<~���Oյ������u(LR2�,pcN@��\nj��k���<�\'�� �<Ciz\n��(˧����+�o������f�RBm��@�(�\n�6��=�9~\Z�c�\'L�_úc�l�����ha��9�\Zc��*��3��\0i�R��_��M�����[��������/��o�^\r�Υc����_�SK�Je�5b]���v�n��_J�>�����WM��.�&7��Ĳ=���ј��9�/�w�C>#��%N�d�������@�|�u4>���@��Bau�x|16��v��o�\nF�)���38�By&����1�E����=�����\Z���s��B�\\c������v�Ҡ���\"���D�����z�@0G��N_�A�AM>�=$A�o��\n�H&�co�)����¿�o�ц�\Z��ׅnH��-���)x/���5滮�w�u;��K�7��P�n�w(\0.0z�ԖZ�����6���B�T6�F8�P0ҹ]?����E�m|%�Ay��|zl!�������}OA����5�{MS⇉��L���0�wR瞁�Op��xQ|O�����m׋4=\'Ö� ���9����)�U���F�l\\g1��/�7��ھ���i��w�{�,�\'�^Kv8�6#(x1ҍo��G������MG�r��e��d�dĊH8<G<\n��߇Q����`Q �m3<W#��^e�ͥ/���O���e]F6Ccs���C3���B@\0�����~���/u{}>�-V�Un/�%L@ύ�l��վ�[ZԦԮ�5��j�������f�3�8h6�e��Z�xoK��[�\0���[��ViU��R��J���+SWQ$d��Q��A���;;k8t�t)\r��j�ƹ\'\n�`����˫@�q�R�[��?*�\'B��H�im���zAsʓ+s�]7�>%����M�ZX�@}Z�+��T��#{/N���|?�)xn��\Z��5��_�������[E����Fx��8�s��V�Uq\Z\r���*�@J�	�PT���97#�i�/�|��Km5��������v���U3�na�x�&���5��x�%�h<���\0���j��NR���%$���+3P��(\0��(\0��(\0��(\0��(\0��(\0��)\r�r�4]�V\'���b���`�k����w3��ɶ�Q�Z6�s֥�y���t���b�+^��G\\sG�^�\0.J�wc�&��>�7�Z\0R���v�(\0 �4��\0�����J��E9~�\r;h�eܜ���[��)d�1ӽFI�\n�\'>�i�N2\0�\n��s�9��03F�*\09<55�lqޜ=��NL�y��ڀ�U�pf�}�T�G%���:\n@�S%Vm�zT�~_Jo�\09T*�׎(曻b���L_����l��NM&K��S��j6X�t,LY\rE\0���2�0\n\06��=E?n���l�����)\0l*=�RƥI��(�O�9~^���@Щ���:R�j��v����N���*�pO�b��q���*��o\"�e�<sI�>����k/I�hR[�\'�\0F~߉����f ��5�#�\0�A�\0\r[���A��v}�y,2+���Wsf���U�U��(wu���S~U��V�l	�o%��;�hf�M\0��M*Up8>��c��c�U���쟗ۮi����#xs�Oz��㏍/|Q�-ÖQy����<�P�N�?z��>Q���?|VO	�r�M�����a��ؚ��٫Oo|FԵyo������ڎ�r��NW�	����33����|`����v�?2�7ʿ/ʤ	�#ּ?-�=ͻ?��\"�y��~$x?�O\r*D��Ī8���W��n� YU�ft?�}1^EX�G��j��&q��@��~�h���9�ֻ�;R0�GV^�	��8��\0j�����eX��Q��=݃�Z�&�r2Xg?�ggcЕ���l[���1�psKk},��F1��N��i����W1Ԕjٵ՞F%eW���uū�;�)-㍕���ޤi#�p>l{⸣�	m�P�T�;��LH���݇�!�&��s��5����_���1��w�s�T����B��sR�Wҵ��,�#f#L)^������u�<��~�!����urO�X7�s����~F��\0e߉����r�M�w���vH2BI�%�ֽ{��\'��i����e^5������\Z<�d/-���sip�\0�N��^�\n��M�x�������r�N�Jz�ܠ1^o��ƛ�����-[�1[�_�)đI�+ԩ�x��u!X|�c�f��NT�fs�Ic^:��t���a��;w��9�\"Æ9�oĊ�F[�y�I�w�cB�VEy��\r����?o��\0Eק�/����0�Z��u�-�\01�\0�]=ndn8��7lb�Qɐ�)|�f*���w�ܠޖHp=E\"��Z\Zo;�9�ɠ.5�V3�)�)Da�6�9��dp}�9$�T�TE�S�ޟ��9$1�U���sS��q�v�@h����	l>8�)F�9�z�f]�n�m`})�雁�y�i�z�\r $���{S0*��7`A��N~PAL]G�ۊR�\'�W�pi������,j����\'�\rJ�Lx�G����@��b��:�cU�a���JHP�9�J�s��;@���q����-���g>Ks�7nZ\0g���c�F����\"�����wW�^P�N3��\0*<��nL��RW޵4k�O��Ey��~5�c��楡Z�-��aw5��DG!1�]�?���W����HWTrkiS�l�3�H�fu�ܢ�Gˏ���bxfO3�\'����[u�?��)��ET\Z1�TuFl��>�$k*�q�� �\0�?��Tg_�y�W\'��@Z\0��$�^�����>���0���P�p3֖������(��(��(�a\\y����1]s>0\'̵�7�q�Φ�5\"�on�d�NM�q�M`2EtC0\0nh\\s����#�.�y�|ێ8�7o�GSR1�x�*�9��`�JWc��u�e�J�/\\S�`)�6A���Ԋ�qN�v��{Fs�\Z6w���S�\\�O&�0\n��枽\r< n��5�CK{R�{Xz���c�.N�Y��~�������C�(�+ڛ�]��J��sJ�����\n���Ԇ�v=�U~^y�m�j��]��?�E�:R8�\"��s���cR�����j\07~�h�1SF���H��򼖧�$�9�AC��X`�⍹��@��C�JYT��%y4\0����j{e�%R:d��v����jŬ�9c*H�s���\'������Nx~�W��W�w\0bK�\0�֛��Gq޿%�\0��rj�v&�ܪ����W�]��F%� V��:�}��`�G9�D���z�RN��������$fP�=���s�+��w�x3���Z�2��#q,��ּ�_����xN�[}�%�<Ҟ�Q~Q�|V��&��O�Ն�j����p(�Iq(E������Oxc��\\�A��Wԙ���#f��u���|���^%���\rSY��8���\"�<s�Qӎ���K�Z��-�V�������g�W�KmY����׊5Ox�Rh�U��o-�l}�ԐN0z���3���\0\Z�>������Ѽ��G�+`+�J�.ͮ.5�p.�N2+�����ݏ�}]�\Ziڥ���)nma��d��<�1,��Iwy�11�7b�}a4g�+�^9��\0�gy6�a�E#�O;\\�����l�F���Euf��ѩ�%�Z�%��q>e�+ȻF�H����h��[�`��zW�x��k3���[�z{�y��n�U��?2����jǭJ�6��R�B�c�h.�[V��kyz��E�w.��mt6��\0���5~J6F���M�6�a��=����r���gLVվ�oj6�Q�W�Pܹ�L��\n�&�Rh��Xr����g����^�V���.��\0E�&(��#��a�ޤ���$�mF\"����3��{W��ً[p�q���qҮ1��:�����Ј�N~pWa�t�_�L��}��D�G<�1\n3��s�;{W�ڭ���\'������-|Y�U-5�����-<��{��c�l�_A�G�U�y��]��7�P�:�awj�K� H�FS���v�����~\Z֬� �%�^��7���1��{6�_�X�����ktI	\"�D&&?�=�Z[M>(#�n�����nx8�8���Z���j���(��K}B�Ois�\r�g��:}x=��^1���_�_~%���㦇�\r$Hu��[�G �\0=	�~���J�3���c��!i����}�ϵx50r��苹���\Z�:������\0������v1���������&2:�n#�$Y�\n0*\\n���V^����^?�7�����|c����K��Z��#�B�\0�e��j(1�\0l�B�N�f�ڨb�������q��,�#�r���~9��Umg��>�)�ՙb{3�G7��*I��W��e�s�t���i�}k��-WU��������B�@���oDW �N	���i��/��ڱ�	�Εa\r������\"Q��\"C&�$�v\0`��s]����KU���_�M>�K�V������ٖ�\Z6�1�F�y�W��o���V�7�7�W�ٽ��N��kO����і��^���6�y#���|%��nl�W������\0M�5m?K6v��#�fU|/\\���$�_\"=;�q���|[�s?�u�[+K��K�*�d턦�C�rCʸ=[���쵯����io�-<�,�H�3�\0����\'��ڼ��_��௄�\r��Oϫ��m��ܺC��M��\"����Uu�{����̖�>t�${a`YY�\\s���PW*=����}+᎝�&�������V�]7L76�ֶ��\0-2������޽�B����x�G�.�{����rd>61���r�q��_4xg�֛u�5h��~��x��2x}4��]&&	;I#�]��t=G9�y�C��O���;��K�g�5�̑�4�/��\r�ϵqFO���\Z����Z���:���0[XKB	C�bq��W���w�,��8񕮋�^��ĺ�͜���&X�e�d\r��W9<�X�\0\n>+����᧌�u;O��v�:z��J5%�H��dR�s���|9���#��t�N���V_�ɡd%���>�+��(R}2EI���I.<��ľ�����O��4k��C��,��4xR?x����`�߉�3xƞҦ��sZ��X�M���(w��h&L2T�ל�_�o�|)�Ǡh�e�ܞ��,5��3&�z�f�~@Cn��ҽs�����+|\n�d��G>\\d�L��6�s�iBi~,|@�o����u����Ě��W�h�1� ��@�#��� �\\u�����m[�F���}R���=]m.���^HAm�K?�9\0u5��~��o�K�[}�vC{x��1��v�Oּ�\0���#��]3���Z��康{].{��c2�\rѩ�~a��Q/S�Ȧ��#��*)�}�3A� �4�MJՙ�.�I�i#(�YC)*@*pGdV��2�8��ʹq��6��s�Q�\0��T��Uݒzu�V�6`�\n����i�r}�����r�,c�M`6�S����.\0���[���\0:ג?��3,���8���j��{�����ג��R�h�v\r�v�4)S��G=k�����$𯑧x��$ҐI;���q�tp=����\0��⟋m�RGf�.�c�K4���T�=k־�Ǻ��c�P�l�xL����%�I�D`���n���\'���UMO0���t>���S�������w�#7��K�vm���888 �^�ߕy��\0h_�{�?A����_�,���1�\r$�\\�z�ɯE�lcھ�������)�$���#�߱��lU��sR�}O���QE\0RR�@Q@Q@Q@Q@Q@s0+������?\Zw�-kZ��\0�u;��q�Z�h�e��o)$rʿ3v\n���e��˩���GY�wF_|�+H\'��IYX�/�{�x�$S�[�����߃�[����F0I5\'��҈ӯL���8�m�T������(�ϯosF�ʜ�d✫��@\\��8��K�/QK�q@�F�lR�+�rsҝ���9����@���0<qRB��\r���1�����4�i�9��Ne�6Զ\" ���)�~��6��y�T�Ō��k�ۜg�����/��q�ށ�F���y�S�u�*�� #�zS�=�Ҝ��9�6�Z\0����gkS��\"��A\\��\0E�A�\\��T�Y-��D�.6�(��N�jx©\'�70�Q>Y�恒�\r��3i�إ�m�w��J\0x�^�Զ��\\����О*Dh�����������L�6�\0�V��S�7�%R\0��u��mcW��m���Q[C�K3�_ο(����?���*����P![l�F:W�ߴ寋�/�W�C�>�!�ʍ����U~��B<�5Ow��A���������L��߼���|��/�kŞ\"IV=I��i	8�03з$W\n���kh7�Y�%��;+>��:�l^].��A�����F�8=Nt�3o5D����C4�Iv$�o��Y��,�fX.c�-�֪躶�vb�Ү����\r��@�*���mf��&��[��Ɩf���ax^�Мó8�&!6�{\"�\Z�lV(�����#�vz��]>;�	�iv���}l�>������V|�]j;h�t�#^��\r���ݝ�$\0����=�f����{�S�^�g_�4�K���y�Q�g�[���iqť�[1@v왼�623�O~߭}9�.�\Z���c���Qi����oku(y\"�9��1^A��;�4\Z}�宓�A~�d1ZHʇ�v�q�]��|U�h��>�\r\r�_�W�H�@����p�ڹ+N�C�?A-[n��b<`�����4ɌylF3�?�Z1�o�����y�+�h�r�p����ş��W���!�$�*�s��Qev*8?���U�߉�\nq��Y3H�����m>�N�˞9#�<�u��n\Z?��>�^��Mԕ~�l�/D}� ���g�q�����\r��H��IA���X:}���S����F���\n��-^�࿇�ha��c����l��3Z_tm�K��t���7����r�����l!Dx�B���\\`��T�̭;;%�g9b9�[�R>�#��nd\r��\0�2�6�Q�/?*��m�ïS���u>ԅ��1J��rۈ��Wþ%+���ot�w,\"I-n���2��:⾴��^_Ze��Ԕ����u��_2��\\ȗ:�q��3M�AoNI�W���b���4�8)-�K����/�,����l�kh�3�A�#Ө������Em���#5��[�#�~0\Z�.<�Q��:���j�R��-���\0�Ϧ*��x�E6S��)g�F���8nA�z��WQ��yv�4�t1=�x�|˥�U�?+��G5���Ued����!�A���\\�G�m���2��o���w��R~��{��e����FI�]R1��<6�N>R~Z^�/��+9Y$}S����}�dǰ5�	����v�V�f�B�:�Bhv��\'��k���$F{K�+U2.67�edPy\0|�T�:�E,���Z$�;wVg��qQ\'Jz1r��O��ޓ�),4oi�V\Z���l�XǾ̖}���nQ��Һ_���ZǊ� �;WX�GuM�>�S_x/�ڟ�&��o�K�ۃ#[��a*��s_T���\0�~\"����H����^&&�\"��ϡm���߇�x`іT��Ոc*�7_a^Y�e�f�N�Uv��R4r$��X\'�Z��[�4��z�t�[]N�<�>ʮ@�>x�k��\'o=�ک��c�$�z����M��|�[��!*�m�@F2�����qJۑ8��V��V`TaX�TzAS-�ܐLl���X�y���i�F��͟z�%��P-H�,P1`zƧ\0��Z�U���8��9�O�>�46Nz�7��̐�P�\'��,��C���b+O��H惝۱��ܤ�c�}��v��\"(V��J˖8�(Nyǵ=B�\0���~�*1RT���\0�J�x�O�#��}*c�f9�@��v�i�=x�A�\0@�7L-W���J�<  U�R�==)��U�h�<-�_�~�&��+7Y���yu��/�ř#\'�\\�����4�q�p*ߖ[=�֞�T���\'-$ė*,��>b��nV��$�\n��V1=��V��j��\Z�n�Mh̀��\0�#�i��Z�Y��+��y��F�1�(�C���Ė�����m�/�\\�\\c&Ѷ�T�F���q�\0-?�`���e�\0�k����i>Vl���~�L�_[?,��)ɯ�6x��Ea*Mlr��^ѝ��\\�A��E5�Ej��1�\0�\n��v�i6�(�A��|Mi�e�N_Z7O;���3|���j�K�\rTgB|Ci�/��)��;@3��*�h���mG���r��ټ<Sh�\'���N�\0���II��Esg��i�-�f�|�^і��a�(L#G	���lVR�F\0��V��N�����Q!@�����N�ݕ�|��\Z�G��n&���ޘ���1LV\"Pѱ���c��L��&�5b���|R��q�r���:S�m8nE\01W\0ӥ9�m����<��*��ɧ�\"0qR�w�������E������U��W\0P#E!U��jE_@0)ʻ�=b���B�[Љ���i��r��w���a�\r�Ry~���ӥ���J]�i����ށ�^��R�rz��F�H�3��\0\"�#4�pI�i���ޗ�Oր\"+����}ޜR��)�Q@���A!������n�@\0FnzS�����g�<���ˌ�;~�}(e}�N�u���EM\'���T���j5�\0Y�Tжٗ9�Q��ޔ�S�;�	�o��A��D�V\'PI@�cb\0Nz�	��~#~������u�R�Y��׊���<u���o�\rnW��ф���.�Qx��������ӭi\r��W�17�6����J�$���#�sFUu�������$�v|�A�c\n9�t9˹������n���y\0��j��}0*i?bo\ny[W��.Un��6l�_H8��W�F{)��p՟5Y��>����c^U�����+Q�d.Ud>9�ӫ����a����Cj����n���.v�����?��Px���1�֏�Jc~�z�8�ǎ�\0�u�w}k���B�y�+M�������x\"�ɰ[��|G��\\|��8��O��?�cx�\0>�ڼ׼�yf��R��[\0�jC�x0�����w�P��j��j��U2�|M��/u�����AW��i3���w�@\\�%���r��E��G?�V�����9!��O�f��꠆�b��v��	������Ϝ����G��>��Ɩ6�\'ɏRڼ� ���\0�X�[���:��95����[\np(�9���W��c⇎�\0?�`8��,ܪ�~\'x񏶢:W���R)\ZeF�ۻ��W>t���m/�[���~7�b1��N?*��\0c.|C���o�\0H>�+����`}�ڌ��R�JMc���c[��?��\n���9N�z��?��`�|H�¶9e�Fs�WЪ�	�M6GM�yϹ��]X�>t����fy>%��W\'���wϧ����+Ә�o��7`����^���H<�\'ޞ�)Pt4���>g���v ��F��I��\0O�L?���0>#x�(m�Y�R7xq�޾�f\0�ϵK$xb��R]���b�(|�_��7&��C�zu��F�C�N��%�����j�j�k�M��X ^��^�YF��B)� ��9֕��BF\0\\S�Q�M����*ĀMfޝ��}\0�H�#�ZU���B��GAL\\��̀r�\Z23��Zh,&᝹4��c�\\�4�`-�Ҩ�ҕ�̧�9���7Z���s@�=�C���*��q�=d^��C?z]͸Tk2�*Q���O�i��J�����Ę�2�ҏ3<�R\0�2ʤ��e9�9��^>bǷ4���T�4�+�f��nq�C���R����h|�����\0Q©����oPGր�mR<��\"�$q�Bȝ��OAN����\n��?Jc?�0h\0����^ԫ��8����c�V]Ď(��;�68�2#��#���Vf��C}jT��=�RnV����cs!�ߛ\r�t��4֓��{\Z]床i�-���\'\r�3LiFT`Q�|�^��������0QҢ���Ef�^��2^��a�I�p�A��\n�|�,��3?1�;�6i�n�l\0x�(	3�8�jO3��Te�?\'�`��*HI����5�\'�`�˃�h�[�@�\n�����T��7lP#�3֐�c������jm��Zqe�jn�Vh@\\���e$��N�Y�:�imۃޞ�a��^�֌��4���h��4Ą ��=qOݎ�)wq�1AD~^�֝�8�ZX��9������M\05Wo�\nY��AOU#=q@�{b��R	OZ^@�i�z�k+s����a\Z�^��w9>��=*6��9���6���Dj�F(�d�ǵwpې=h�@��Q�sH�:~{c&�+\r��^9�iUO9�Q垸Y��\n���U�0G���ZE�.)\0�/��Nho������`��<��ɧ����i�(��8$R�^���J�x�;�����(���ޥ�@�ޜ��L�l�ÿ=�:Oa�?\'�������Jȡ?�����U���~l4��>��G�\0�O+���Ga�\r���A����*���J��T�M���c��fdC�8��3Q��`+��jek��������\0�Pټ�*��wq�=G�xK���8�F�B#��d��������Ht.����Z��vf�U\',x�D��x����>��\0������X�$���s�\0�RI�xx�r�N��	��f��\0���n�ɔ#ڪ�;o���������ϧ�����|ͧ�p���I?��6o���+WK��㹷���_,I+�a�x�%ď �)��-b&}J������b�9���������ҩ��\0�y?���V�����_npOu���+����/�(�[v�����;��j��Q�����w�����_\'�]��R��qG����Ϭ����ʠ�����������\0o�2�����}�\0�U�jʹ`T�������=�Ϭ����fRF���\0��/�\0U�\0��^8������b��\0���ZAg�9\'֩�\'|�{y����c�A�tp�|:}��\0�T��\0�������뜿�U|���\"��TM&ܜ~4{y��H��?�(\'�v��?�9�\0�R�\0�T��������3�\0<��\0�䵘�#9<�N�4{y��L���\r�UbF��й�������(/�n%*t?��?w/�\0_$��s��֥K����sG��{iw>����D��D���`��+�@|fe�D���)7�\0_\'B�~���R\\�y �z�Zm��Tg�?��/y�î?ܛ�i���/\Z�����7���qI#1����^y�9�{i�������6x�� �߿���O�(7�Ղ/�����\0Z�1C1s��M�^pz�\n�m0ugk�^��\0�`c@���LM�4���o�������񯑧R��\0��c&��:�ҏkPJ�ϭ��\n\r��!����;<���W�\n�挱��1?ξL1J#܊�w�A?�vd�z����+�L�����\\�\0�;�����:?�(O�C�\Z��$�PKy&l7���ݿ֙�yWpn�v���\'دk>�֋�\0\n�WS�{n(�\0��x�F\'�����\'�\0\n�\r�+�sNݖ<|�u�֏k!{Y�Z���Rd�K���NO���N��\0�{A�\0��>�|�g��`?jߖ��v���ҢVg���~x�9J��tlc���?���2Ɂ����\0���|�r�I(`�1�ƕw�P�!$}�2;Q��?i3�	?o�[���\r�:y��J��P����\0�W@\r�g��|�$m���ru��5\\�\'�T�i�I;3�x�\0��-��=��$�\0��x�;�\Z�w{O6?�|��I�$�vt;zQ�/���\n�i2��Ϯ�;����\0�g��zI8����xw�wxgAP:����y�;�y���H>��O���i����\0����f@|3���������\0����$m�І?���_\"C���*`��5c4�\'9��K��N�ϰ��\0��x�4�gC$�>o�W�\n��<-�6{}��9�7R����Uv�03��\Z~�a�g{`��|Pѓ�\0��\0<�\\�g�<;�M������������VV$p:�����bU�qK��\rԚ>��\0��x�x_	h~�\0�3�\0�4�\0�xw���|#���\0_3�\0�5���d�?ZV�]��Y8���^ڥ�}���P����\0�OCz�\0�O��Mo�(��#\\��:���\0�M|����Ö��F���pF��i���=��\"�C�A����`C�/\'�\0�4��\0�\"�ǃtR���?O��A��F*�`8�F�M�#��H��Oq��{a�(��r��F�ӧ�\0�j_�x�����6���&�3h�r0\\��t���A����������\0�!V�E��7�\0K�\0���x3F��O�\0��ƒ�f�� �������\'�=��l��!���\0\"^�q�\0O��\0�4��\0אx#I9�\0������଼�\0�5\n�Yq�AG��+�T>�O�(v���D�$�o��\0�i��\0֣\\��,s���5�0J�	��RȎPg���b���G�CV��i{��\0A	���H�\0�\Z�p�oid��j�\0�|c�C�IL�0z�2�`d���O��=�C���\0࢚�bO�t�@�ғ�\0��1�\0�C56��������\0�E|K⧌�z�j�ʏR=zb�m1{j��?��\rSs+x\Zı���ʑ?�Z��\0���A�\0������XH� �=��N��e�\0Gb��c��t{i�����:?�(���żb��\\���\0�dx\Z���NL��E*6�_v\n��}jӗ�f�[vX����/oP�Q���ؓ���Hந��_�x��R��(�]L��\0A���l�:T��5m�Խ���&����\n#t\0#���`���?��H��P����B���+���\0_�ϴ\r�8�ޤ�IC.K�\Z=���z���\0�b7��\\�_�F�\0�*�\0��͹A�%��?�M|[w��RİϮ?Jn�E�n�����l��8��\0�2:�\0���\0���\0�ä�#����	�?�\Z���6�������U�d��S�>� ��Ϸ��\n\"̣�(xFx#�H�\0�4\'�?sm�\0�\":����5����\"��A��)ZM������\rb&}��\0m��#Cן���4��\0l3��jv�\0�kṧb돗��!f~NX�h�ć���p�å���A##�?�g�\0���)��� ���G�\0�����|����~Q�@���ǜi}b]	x��r7�Q��\0�\Z<������N�\0��n����ǿ�L��\0�k�9���г3G������ĺ��>��QC�s�U�����\0I\'�C�`��c�?�\Z�md8\0�zsNY{mϮM?�0��Ϲ?��O@1�j��� �\0��>s�\0\"2��R?�M|2�8�۞��1��ߝ/�K���3�O�x��%|	+�\0Q?�ƥO�(�b� �q����\0�5���4)�;s�T�il��Kw>���0��>�o�(���|	^\n�\'�\0���G �����\0_\n5�������?����1�iw>��Q3$�_� ����P�5<_�P���\0�\r�r��\0_-�,���#\"�I#��a��4,DƫO��j�\0�C��|\n��\0�)�\0����\n�7� �}1��\0���]t �r3R�#2�y\0��)�bm�K�>��w�o��r�uѤ�\"K+����@�W9�zҷ���W��\0��g�|L�>��Ȋ�a��÷f*I���OZ竇��.��`b���n�^�\"����S:�Y��R�\n�:)�\'�M_�4������<����{\rn~Q�-�M�JE?s�ީ�1��9�թ���I����%�������4;��� ��k�Nt\r����aSq��9�QL�<�S2�U��*+���l�sZ�#�O�No-4}�\0E!�����H�}�w�+�?�S���66�-�|kp�w��ם����؟�2������?Nk>{�f�Ň�S)g��T�V�A9�㔊O�����L���*b9�TRi�266�)�d���!�r�}�&�IϦ(�rЋ�~��F>�RmEl��ʼE#�Lvn��OZL�s\"�UU�Rs늂6#;�Gj7ڋ�bF\n���W`ri��]���H�����iY�қ�\0w)9\0\n\Z����\0o�zӣm̠/�>���=i8��ڝ����-��~&x_K�,����Q�a�e]NI��į���>!�-�Z�4�ZX�k[�8�0r��Ӛ�k�w��?��;�a���3�����0x�w��]n�Q%p���m��F_c�^�*Q;hۖ����߅ >>�t��0�I�E�H�!�j�_����<m���4=�Cp� ���s�z����c¿�3�An���\Z�����1s��A�vF�a��uq�϶V�S�Wer��,�?\0~��;������GK��*�?��N���I����8-�%�ʙ���^��g�HQe�laW@����J�k�_YQ����?�gYZ�5�#���׀4��wZŧ���mb+y���!fٸ�{��쿳ƙ��X�oef�#Y%�D�ֳ>Al�AS�k诊���&8o����*�⿝�Pr	?Ҫr䶆��%�����\r�/	����ދ2� ���E!�\'#My��\"������I�X���%��\0k8���a�\0�_Ӌ���W�Y%���Ey\'����y=�9�)2�V����[����\r����R�V�MB���\\��o�c\0��W�H�\0e�>�e�<1��#쓓�����j��&\"\0��L�B�?Â�����?�/�ƨ�\'��cV,Z7��\'<?��������e��k���9�g�ɭx5��XL���ݳ�\\�]����s^�+��%kZg��h5kk]<ʖ�\r��%T9����/�/���\n�STk��b�ⴚ@�73I��(9E$�@8�x�G����w�S.6I�����C��\\#̑2Q�H�~\'|2�q��������-��\0F��ͪ	\n\0ѳg��d��>��\0���b�G�t�P�n�m�3�\nX�_�9ϥyw����\0~�G�<���a�7��\0\n�\\�.��L�k/�r��Բ>��¿�~���w��_�\'��*:�+�<E�|�\'�oi����m�oW�X��x�����_J�mi&��S��iG�<+�O�s��E�Ƨ��%$��b�S��=����\'��\Z5އ�ZiW3L������/�k����\0e���������#��帺��!�B� g�pzW�~��:��n7�\n㷖Z�_^O����i\n#��L�}��ڄ�\0��ӕ8�\"�S�5�\"���\0���ƍ�C���?#��晑�/��s�g�����x+�~m{�Σ�4�������\0g\nX����\rz�aq$o.���__~��-���Ğw\r�@��Ľ�gܮ��5�e\Z��*�4�Z<���7ğ4��v&�Ʉ�u��TX؀@澜����9|w{�-#X��7�EȹU��r�q�Ʋt}�E����uح$��[ ~?ν��Ⰿ�^��k�#���}5�P2�7<^�PH�b��q�5�b��������v��S�Z�l�ze�юX��T����`��j/�>���-|?�ŦZ�d�4��ͽ���zW�I��|;��</kY�no��dYq��Y�������k[�<u��s�F���<���4���I�����8�?��/�}\'�V�~��[��$�n�<�w�S�w���hc�~-��ݭlc��Ĥ�I+��7+w3_A����\0��KhX��q\\����·^����N�䶁�$o�G!$�X���\060x5\\��h�o�n����/�����jr�~M��ŽL��s^3�H~�v_�Zχ$�}F���ďjޥ�T�<潻�_��<J��>���[\Z��֪�U+�c,�⿴W��4�KM�L�W���O���B�D�mĐh�aˢ\n�.:�7I����=��OO��}���v���;����~\0��ã]�<5��<�����1�^\0�U ��6�ӭ�ۋ�y�}��G�E�����b�\0�笒f��$�1�R��#�x_�V���(����#e���`�i��j���P�r���[���bI�qמ��~*�f��I�i���Y�$���k����#����=��S�s��L������a,�CH����O��_Wx������e��&�v�˺���P�g��_=���o�+\"/���q���:�?n��O���N?�[�zon+��Q�sjRP����W�_����P�,��ȹ��.����B�o��}+�=w�߃~![�oY�s����Y;^6�FW�A<�ҽ�7�v���o�����]B�H.b��8?PF3�^��Yh���\0�\"k�m̼u�:�?�?�_*��wUb�����?g\0��Zu����\0f_����n$���<��k����\0f_��-�K�x��Zw�2G4�^΃	#���\0�\\����� �1ӂ.����5l�˺X�g=*�HP�Gyo�\r��$�:�����M��8��*Z�	.t\0zڝ���=^k�������d�}��5�\0��E��̮�\00ms���W[��?���|qi �P$��\0z��\0�ג|`�������X��v��\\���<$ddI��\r�L���;�>������K�$k���+�F���L����^�i�*��<7�m��M�����/�^Y�2��k�qwAt��J���)��t߱�G�S�W�:���Njw�Δ�c����ن�E���<��ͩ�;��|���Q|��~x�୮���/q�\\A35ٻ�\n2�/\n��w���yL���s�/#���`�\0�5�D�?��?S����SNJm�g�+X���O���M�G�\n���o2?�Cs}-�S`,AC��qϡ����0�Ϟ<���[k1�v��z�Är2��+�=zgiQpJ���_a�>f?�>0��e��s�,҄���b�5��co�\0�\0f��\\��\\iv�B�d�}n�27p�\Z�_\0�|D���K����4�\0,�y7Ҫ�by�O���\0�M��⟉�b�[���g�װ�?ܷ�<[���,��j��)r�R��kC�B|<Ӿ�H�4�	M��D�����\Z�X�y�Z���~�<Y|�݌�\Z�!�1L���Ȁ�=7�AZ�\0��v���$o��b=���޾����~��s��PS��ɩ>˶5ǰ�>i���_���c�����CL�����䈷��$��HI��x�5�e��7ede87\0/s��U��2�B��o�5�Y�k�B�Ybo5�ݭ�\\�Ny�K-|]�_���C�ڶ�*`���u\0�~�S�IE�<D�����?�]w�����G�\\Y�\'�#�gܲ2,q\\d��|c���\0<Q�h�j�[)L{�㪿NA���;��ï��\n�i����Ѳ��-r������$W����a�4{?\Z��[���E(��Rq됾ث�F-hh�4׿gC�9Xx����u�m��3}�F\\�\0����W�7�)o3��u�@<M����f[�2Տ��s_k�]�w$:W5h���#h���@�*��J����1���\\�?���zU?�Ȼ�Mr��\ZM�l_�c�6fY$�,��rà�Q���xrq���6�rz�r������GzFo1U�}Kt4Նf\'�\\�y���{P�>Z���i����j{�:�K�C���1��I���J5���z>T#��	�3�߭5������d���\r!<n<�p���0��@	#�Tp:�OgX㚏����B��y���PM ��ҝ�)��\0SW�O\'�\0=���ӊT�_�t縨�v���$S�`�(3I�rW����PB���=�y��S�s/}�m;�\'����Uڈ�1 ��Q����ㅩᄕF[��[����`6?�>(����\\q��\Z�&97�zv��������Nv��?�8p�ي����{�Q��>Xm�ϥ4g�ԫ������@�~S�sRy�[*����S�|��i���g��ǥ\'�Ks���	j���P�F��_����Ҳ�����O�&W���IG�3hW_(�s���q�W�d��N���5�\'�T�c(��p>��(�OlT껔����]�q�V��m@�.��������o 8c�k���I�ͤ/��\0ξ7�;�}�y�ω=��#1�������ZY[-��������i����u�%��H�T�5��z\nL��}�֍çZv� ��L/s�ښ->�{F~njd�R���\'�<���Sܢ��R6z�[��;�\nz�$�U�����D���,TO.p3�Ս��7�cXW*�����3�����ݐi�����<t�v�i�O�{Qp)�%�S��3ۚ�!�T�ۅ��;����C|h�n���b9C_E���Yx���0��Gf�$AV�2?P?Z�G�~)��~,�u�!���O�K��f+���+�����V�Ө�]�\Z]��mm�	�;+d䓼���ϒ\rFZy�p|8�,?i���oV��!�\\�W�I��]p~�\rp������8|\\ǃ����|��C�����jR�jַ�L��R����\0���gҮ|p��5�M��C�Ң�W��g��$��1�ַ�d�t{or�s�O�ŏٺ�N�\'_2�J��^C���\0U�#�\Z�WP��~!�,}\Z/jFw��O�\0o38��P�$���]�u��H���H���4���C#��;���k٤�\0��k�IC��/-��.e*�i��*�*GQ*��o-�x��^��5\r:儒�����#�`S���}��oTdk�1��ڻ�\0�ߴW��,L�X�Hl��N�R�Fy�#;���5��đ��nz沫QJ�-Y�=�٦m�0雺}��g�^S����A�wo��������ך��߆k��<;c{qK����!rN�c#ux=α5묎�[?uz�:�#(�))$~�~�,�b�g-��tO �����{�Ǎs�w���j7��,������ۺyl�|��\n}�߭c�������������$�<��0w��~���ǉ%��).�U�I��td�q��u�\"H�Q�)#�\'���K��P�~�6ѣ�}N��O��w��Z�?�������F���\0<@Y�A�dw�r_�\0l�oᇃ\"�Ժ��gm�;y��H�$l���$cҰ�~��ߏ5���j�b��I�8���[�GB8�j�C�6��NJL�mo�+ړ\'�\Z�<��+���U�\0�|xM��\ZYs�\0~d����>0x��W�ӠҌ�\Z��Fc;�e|/��7�i�\"��/��we�W*�z�����x��F2���G��GǇ#?(h%���+�߂�_��\r��ҋ\r�ֶ>9~�w��4�6�o���6�1\\4�s�k��_��𿉴�j8��[	��8����y�*�unS��s�����p.9�a���?���\0���gǿ��d�+Mqf,�@80\\�-���g���_�i��\0�0��s��RY��6\\<��.?����|;���_���ԴK�\0%�ֳ.�{�:Bv�z�\rj�ǚ�col�#o���q�]a��\n�y�)qe���\0�3�}q�}��%|\r�>�_T�|K�kz�ǒ�xc�\r�	�X�O�W�h�\0�QM^��e�,\'�)�Io��\nI����O�ל�Z���k�*�]5~���BD��v��/M�H�8�m�Ҍ���!�Rգ���K~��j6��Z�5Ǒ\"�f5���<�\0����\\�����=OO�������:�Tq�~����ߊ��6�ݏ�a��Q��Y���ޤr�s��AW�/�p��׌�.�o����%�S<�mw�=��ЅSF~��v\r㵷�|f��q`��<���,;m~q��_>�ۖ����Jg�995y���V�#aw������<�z[�t`h���\n��\0������u��O��͢å}��C��M�oݒ�s��\\j�]KU��n��ߵ@_�Q�������g���0=�˼����α��\Z�Z����B[\\�DbU\nWvAߜ^G�[�ȿ���U��xb�M-,25�i8O�v�f�������\rj7�hRZMkx����i-���+�ncޏk����t^�ſ��+Múo��}ee\n�X��V�1<�W�Q�}�������ⴷ:��`�8��T�8l��z��\0��^�����/�hƫ\"ǻ��Pdg�Z�_���\'��/�Pj\"�K�\"���8Bǝ�X���MՇ+EJ�>[D�mq�\Z����5�	�\"�\0�o�\'=������7�J�Ė�1ھ��U�^\\�)�h|*<-��&�v/�D����v�>��Fq��g%9(�s�|T��O�s�r���s�������#X��Y��]�f����F�����;��?�=\\|jِ�]��3w�����ψ���]�ݺ���{kw�N�>U�_?|��7��\ZA�E���IlmZs�����}1�\0�{�M���Z\n1�3uBq�;)8r�G��\Z�,���:���i�M������Y�n6����q�WK�Ux��S����>�=2��6`s���H��#�O�B5�R�[}�V�$�b���䌑�p����5�J����C�v�^]%�\\��V�����@�H�Y	�	Z\'�߶���\0�	��&j8�~F�?ٕ�#������x���|�\\<���ۊ�S��u\'��\0Xi1�h��\r�N��=I���c��}ks�����\0\n��6����L]G��Y,�ym�=�UR/[��b�l�|G��K8e��h�����p�*��5�=���ombˑ���u�����<z�Eľ�-�����\0�*�>!~��x�º���	��^@�y�j�ꛇ��.NkN,%(�5s���>׹��H�5�C��w~�6d.O�#�1��Z�;.5E���ٳ\'�y9����7�l$������Ff��k%�7ȫ��yy��5�9(�aM�3�5E�\0L#��.A=+��VRf�$u��u﹫��Vk鄦0�����_\n�\0k�~�+�­�iu	!Y�Wkz#_���v�����d�&�6xW��-�������\0�l���-���_j������`\\��C^��7~ё|	��\"�B�Y[�Y�Cr��eWh2�����1��$�S����/�_���������O��+l��X�\0�\\��>#�\0�}��SZKc��L!��¹����m�:�|��#�j��:4���B��v�B�����i�q�[���z���K�ښM\n%޷�����$g\'�S�����&���þ���\0�u\r?M�n�EktHI#L.΀q_����c�W��߅.�Q�p���ۂ�������k����H���7��eΓk��H&�������\\\n�Uc�t{Eu��/¿~���!��^����\Z��*�m4��=U>q���#����a��x��\n���ᱍҠO�S����+�;R��)�-�I��m�+dc>��ſ�K������·�����K�s�Ɂ�Fy�Z#Z5�U�l���U��tA���v���\0�G򪿳7��>.|(��k��\\�@�f���u\"6Ϫ���k��(~ֶ^=�_c�[O��M�^�{��F�2\0F}��0�C�f��w�,|K\rv��{E�(�\'\\2=��*=)J�T��٫{|X�k�K�g�О�n[O�c��Q�v��z�����J|�Ҿ����q�^<�����_Q����c�.ah�n���_&j\Z�_L�����w�X�&�і\"jOCf4��Jb���`U�,�#���Q���9;zW�ȵ؁c\\���㑁֙�Հ\0��h��\0�V[f~U9�SC��m����fFaH�>k�I���dwr<�Y{��O�~\0�Oeo/\0.~���*����Z<��B.��HϯsS�-�m<�S|�������D*s���CF��=O�Y�\\�����Z\\�\'��,#��;��7Gpi�!��g\'��\n꥗\r�❸���T�z����p��lN���?�&�9���OXʿ=ja\0U�riUc-��Q��9�VLa�a�j\Z}�\0��7g84�zT��:R���S\"$r˚�-�Hѐsɦ���$qm�w^y��t	�s�<�3i~*RT�����\r}�>^g5���!����VXy�rU�{Wّ�N=q�{0�Q�a~\0��������uϵK�q�P����*�@��\Z=ï�Y6eF޴yXo!N��3�R�)n~V�\0�-���.^UP��j@��T�ϛ�?J���\0�\\4�~����06�s��\0�\'5��빙�⪞�**�Ğ��M����B�������q����A%�t;0��5����?��¿�Am;�N���cd�$x��\0i�|�y�\'�Ye,�lu�ۭ�\0��~��j���͵���!�;��f�B8�![μ6_�����?i�c��\0[Q����R����ia�Qݟ/7��a�oHx��[��\0�*;�/⼳e�(\n8���?�e}C�\0��}�����ʮ0WE����R/���~3���<L����+���t�,]~ȿfo��.a���k��U�@���ǂf+�{k�\0�k�o���������A)\0��\Z��3܎����\Z#��Ns\\l��m�Ns�G��U���#��~/*��\0�.`1�5��?�m@�\0��\0���x����ة�|���|s�/i�.��:ok�\"�_�H���b��c\'j�<�*_��	��</a�?��x�T����;�2(\Z�J�\r����7?N�}^!�Zg��2\'����%���ٿ�����m�\0�\"�;����������߉~�PԼC����_���Mއon��8!��q�K����&�ƙ�Ak�<xvOۼKa�s&s�x�֟���ա��n?���\0c�]6G/-��\0є�?d?��B\\���շ�\0�Ԉ�X�+ǰU8�k����=��>\Z�~�f�a�M��4 0-��!NW#?�{R����g��ɿ�����A�\0���9N_�+�۰U�%���mſ�\0��.?g�2\\?i{��ǆ-�������-xcŚm�����U�C&nt��\r۫N���E`P��\rV�?U�>&o�#��?$��\'����r���K��o���01���\0�����O�ߊ�&�u������������w�c�w�dw��c������\0x�O����\0���A3�yt�2_Ъ�P�M�1?P(��E�Jg��?��<|?�Xu�\0[�\0��S%��~-Ƭ����S�\0٫��ᮅ�o�B��Ş)�ƚ�&M��V\"��B~U��޹��>\n���F�\"�/ě_����.|�_���>b˳n�9����3��e_���\0j�<���\0�����aߟ��ǯ*��\0Ы�v��B���\0���f��E?�������}Px��.����ǣ-�ٰ~}̬Knc�揫A��)��-�)�Y��~�*:�l�\0�O��sa�\0�}����g�\0�W�2���8�$<�\0����!��r��>�}V��D߲�ťo���A����Q���Y���s�D��U~�|^���h6��|g��WI��yy���:,0��%B��s�����_��nW���㎿�,(��K��[�ϒ��_���?��rb\\։?e�\0�ۗw��o���_x|�/ƿ��[�|O��a��l񭍾�m��r\nH$�0ˎ��J�\'��3��y��~\"�q|\0oU�òh�d���309p~ozk��3�y?f�ʣu�=�?֣Oً����{�ӭ~��B*�\"e^C8<�q������\n�_ǫ�K�x��W�5?�ԯ&�k��[��\Z��e�v=\r?��_U�|-7��]��\0ž���o�ʫ�����\0�y���\0E��(���c�$��\0���cG�Ƶ����Ώ��4����m��)�A�o$����\Z��?3��h������g��ԋ�4�TeL|9�\0��\0�5}c�\0\n���V~/x\0�۴2���F�\'�_�~֯��W�|\'�m\"K]��h�F�X�7�HͰev���W���L�(~̟9?�D9�}���e����\0º��ɫ����[��GU��^K��A���Z�k��>��F���s9��a.9��xh괏Ψ�\0f�G����C���Z����(Hy�{�\" ���}U�\0\n��Ȓ]��3������\0�k���|>������_İȱg/���2B�o0�QAۊ_W�?T�s��oٗ�M��;�!\r�\0NmB~�_��w�+���ac_��Hv�-X�����}3_?�c��\0i-S�Ms��_�����©k�E��� ���8�4����L�i�fϊ\r1?�LG\\��\0\nl��?�]���Ĉ��6M~�X\\\\,0��X��ʂV�@W~�a��<A���]�҅�j-o(�7l<�8�����8�i�Z ��?\'��\0g�\03�ï0<m��|���m������K��?�ߧ�_r��i7�O/�k�ڷ�M��!�cT��ye~E�9�&���_�/��P�p�Ǭ}�Ae��X��|�ú�Ə�C�����G���&q�\0�Ā{�8����q���)��ć8��>C�+�	�3�oͰɭ�	��,Pc�\\�S��B����\0hr��Q�]߅���³IN�pJ_W��-���u���+�/�4�?�Oo�8�M���d��z�����y�+�R���V�-�z�@���]�H\\m5����_J�\0����-!���Mp+��-�=�B�@_U��Wu�<�L�`��\0���?���T��=|Jl3|?�\"�gO��~U�_ǈi;�Z���~�ßcC8���b�-�.е��\0�\0\r;k�i[�>�𱳘�\0ĝ�Y���c�pp@oΏ�����nO�_����ǩ���L�\0��)�|�\"\0���!��\0��>1/�u\'�\rh|>���G�A��\0h=��~��?|��+��?��(��c�;�g�����Y_S��?\0~#��>x���5�\0��d�\0~%�2���$���?���9�9y��>ҿ�e���ǘo��64ob�v0����z����ַD���\0쪾�}V�	��UT�ę�\0kN��\0����_�?���ĺN?���W��y�ko��8����H4�},i��ټ3�s־D]K��W���<e�M�`9��������b|��o��[����C�J\0��\0v��|��oq���^T0��?�����G��_��׵�g�zt����\"mB+b�>Ѱa����^�Ck��>.�_��n�6�y��X{o9�K�*7� m��\'��}N>�࿎s��x��:���O�S�|��Աƞ�;��Ν0?�\r}4������	�Tɜ��K,���7���ˏܟ�Z%��������O����]ۻ�T�V=E�8�Z���[�#��J����}�-T��ߎ`�3_�����\0�k�k��>KK���\\}z\Z�+ⷊ�\0l8~!ki�oh7K�]6[�K$ (�\'��������j�#�Ч�> ���7?��J~��h�� Nq��ٿ���~?~�Ѵ�����0U[\\}���{�n�\0�o7�^\Z�?��+.���C?�D`�3n<�g�V�F?�é��\'D����Iӥ�\0�)_�?�����k��tٿ����?�_�dr|���[�$v�������~��K��u�m.}3��Y)����\"[���J�q���RXu�>�L���\0�W�P����]:^?JY>\Z��H�?���?���\0�k�o�ǟ���i��6zφc����|\"ir	u�S���T��G��u��_<m�xA���/��\"I�6h�f�[�W�}N���k�x��1����\0 ������ƮWÚ�v�#\Zt�I\\���h�_��������=g�Q�C���byZb��a�C����߳�\0�_ڏU��g�|M�}g�x:Ky�k��)FY������\"\'���]�ÿ���\0ֶF6�2�\"��\0���5���L?�Z���ůڧA���[|9�om�x6$�]\\ď-��\Z@I�v��Q����\0i?��|0�O��\0���V�.��q��<�c����O����~p7�u��Y��\0g��\0�ҧ�u�U#A�k���\0���r|p�����~�!���?�>�o����]��=fp�,Tw�\0��������>W�\0�\'[�e�5u^�����v�<�*�\Z&�	���7?��~��į�)�9C��B�����9>�XDn��NF�o#\r�|�y����f%~Bp��q�OGգЏ���r?�=[HՁ����\0�h֋4�T��_�&��_���\\j|ς��}F���z������m��\'�=Ql$����?�Q�X�px8.I�}nC��j�:Ǆ��M\'�!����\Z�������bt�j��������=ͣ$��f@̟�H�+��#������3���ɼS�嵋\Z��S��L��PC|�H8Z����|��Z<�\0dj`㠱��ݨ������#R��yK����?���x����\0`�M����E��M�\\[�3�6G�?�����W�V���O��:�gq���\n,��\0�i��-X���5@��l�5�S�����1���_��^#�5�@��[�K*�!�t�B�I|�6���E���?�o�ym�%l�<4���$�c=��^q���]�8����GSc�i:�����M9|���t�H/�y��\0����������[�R�}q�,��[+�����ʺĂ\0�k�>/x�[�ýV�s�-z�ɤ�ӣ�WL\0ڥTEWA�8����j�`Η��G8�����Ψ�Ɠ��;�Ɍ�5����g�U�)�&����\rC�w�S��x\09;��GՐ��\r�|ھ\Z�$b����)r�ܧ���S�I��\0ׄ��M~�~̿�q�3�w׿<-q��bC�[=���|[��q��H�k�.�Ks	�����Ց?S���/�u@˷JԳ�����QI�}Sr�\0ĳP#b�O�&����?i/�_�~�7�υW�-о��V]*��y͒˹>\\\0�^3?���M�&��x�z�íUL���>p��z�_�@����㴿���`�Z��8���M}����5��ʯP4�Yn�mp�t��\0����/�.��4���Φ��Q�r��m,�ԣp���\0^R�\0�5����\0nO�\"��ze���bh4ٮa��A�^��#ȪϜvRO<q^��^~ѿ~��n/�\n���{�I{�\0뛄�AC�\'�s�WD�J�`�#���|���R�\0�4��E����9?¿Z��I��\"�*�ψ�Ma\'����V��K�%���Wee.@#=���Ԡ���޼c˓9���Ԡ~-�9~�Ķ��z�Y2�R�3���ӒI?d��+����_�\n��zo����V��v_�O���e�,��y�����1�t_���U�_�ߏt���\0��<Q�Kf%�P�K��qvXh�h�@����Ԡ|#�oݓ���������O�÷Q��/vgM���U�\r�_\\x������K�_�\Zm��Ō��5�̊�\r��Į<s_4�����_��:�tO|?�Ő\\i�\0n��{+���deH���p2s�\"���}J�����\Z_��{i��Ia �F�`@�R	��-�;zY~�\'�7�tMWP�{+��.����y5fM�� �9�k�P�q�9�\"�Q�\nJ�� �����cڿ7#8��=��BzS52\Z6V?!#�C����\0&��Փ��S��R�=��\0�֥�5��U�\0�b>>ܮX����`���~�]],r6��j���\0�]�I��V�,�gD�#kq�?J�1�I<��i�wc�[o2��r��ϵN#	\Z�\0�qLUۂZ��3t]&{�\"3��7i�Ó�EYr\n�8��f!�\Z@S��&S99N1S(ہ���M\r�L�NARM�y��dg�\n��+�{��\\3��jM��zzPAaӌ��~v���=(��t<Q`$_0#����\n�H�b�&\0V�F%�;y��`�ǃȦH[��})cb�zw�e�E�R� �Lv��@�❷�@]�޴�n7`��\0>���1�ޡo�#��pzP��9l�*/�����\\�A8�C���4Xm!���ҳ3rN@���R}сL	VC�׽F��(B�ò��1���M�Ƿ֚����Ъ��A�u4)ć�?x�?�=�� �j˹��zS�6��Ԁ�y�Qu� �T���CmZ\0M�#�ǵY$��C�R�rh$Ԋ���y �4�v�^s@Vegx4ǌ2�;w4��CJ�c�@�y�5c?/@>��Z��񦫝�P)+�I�.NNsM-��piV@=�\09��s��ϖ\05_w��ɆS��@��y����WxvP8��w�\0��=���\"�\Z�wg~��R�$���i\n�\'4�׵+�\"y�K6�מjX��y�9�i�B�M����pu+�Y?\np�&W!�p1ǥ+`�u��eQ��F%�9��TaY[%G�i�zS�����L9� P��\0sRy�1�Πf��=G�g�ӏj	&��Ev*��+��{�T�\\n���[���;L\Z&��+����sAW-F�cm���\0롤+�0De	�����<n\'�ri&ʝ̾__�Ek1�2�0XaW��\r(³�v�����@\\�f��Gjn[y0�+1Vl��)1�3zt�9�eus�)xa���SE3*���}�j>�`\nl{��F����fpJz�@@���Q1=3���Y�\\��d���}�҄%[�n=��z����1�����(&㷝�7\"��V� O¢f<�t���ぞ�|�f,I8��Jc\\I��v3���9�*)7���$i=?\ZwY�N:sI����\ZlO��i����ڙ���kL��OO\\TL������N�:9�L�F\'����2�\n6G~�3mPH�<z��3n\'�Z@Mg4��]�`sӃ�~��fs���u�֢g�i��p)��y��5��dќ������s����h���R��ۑ��\0���!��A��#R���v�1ց��ϐKn#;s�4纔ub��j$�E.���P���,����3��!�ޝi�o�q�vJ���n��\0�R��pA#�5Q��8�8��D�{*�þ1�G����?��i�I<�ӻ#����n\'�il�4�u2����j&����*���M��:�!7,�X	c�9o\'x��e-�Us�z�^1���/?Z�%7l�|����4٤�0�GZc.�OZn�A�KN��-�����#��?�9��P�$t����f��2�����ڟ\\\ZfO���`��Xdқ�B�dHS����u]��9\0�M�Ó�\0J�/�����>9���s�y�c��5#6р(eu���̜����2����5���8�ZB������w�G&X��I�Τ�2dg��0?�u��pm�z�Hs�\\t�ÊOa��_�K��-�����I_�6?�_���QSGr�^n��R���(�Üc}���\rR/_�F���Q@П��}j����E&Q2ң��\n(�K&_�>��>�$?�ڤ��X�QE\0=~�^�Q@\\}妷j(��������Ƣ�\0V�\0V>��㢊\0t�����\Z(�/�����\0Y�QE\0Co�\0!\'�U��\0�h��O�`�J�>���E ,�1�����(���#}�Ɗ(��\0_�Pd�\0X�J�>�Q@K�i��E\0+�����Y��\0o�>���4Q@\r���E\0�?����h��$N��袀\'��P�T=�֊(a�\0Xԣ�>�(f�\0����a��\04Q@��X�S���4Q@��G���U=���E\0�����W�[}(��+?��j�Z(�h|��Iq���E��M)�Z(����W�N���Pk�d��l�v:(���\0҅����c�M��}(������D?յP���>���h��X�}ꉺ�E\0�����\n(��?�����MP��}*.ߍP��Z�:QE\0\"��g�\Z(��o�E7�Z(�7�Z��tQED��n�^o�h���H���\0\n����4QZt-�Jk�?Z(�]KޫQR��Q\'�����TQ@��?��r}բ���','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0���\0\0\0gAMA\0\0��7��\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\07�IDATx��\r�UՕ��R~�mʐԋ|�ʫ5	ŤSE��B�\Z��3k����t�Ӏ���#I1Y��@ҳ:����\nM:=$<�I7U�\r$U��\Z�����{������?oש��{��UPu7�.�{�Ͼ��}�r���X�-\\\rA�E0(`�����;::�w����t:Y]M�u�~��L�^�8�L���t:���\Z//���yZ��x\\%+�dnF��z���jTF���Dn�*D�ͶWʮ�����M�\Z�Q�Z{�#dt�ꎀ���B4tnJ�H�tC��MM�֬%P[W��\rc��޴q�=��$rݚ5�\"\r��d2��.ٺ�i����m�[7m�X��lin�����M�����_0���+���Vcc�e�1��z��ѩohHm�����VFS�x��N�\0�I������\Z�ʕk׬QF����ٸ��l{���_/��ں:2�մ��������2���hWG���:B�%K�R��3��\\��[��f�����,*Ǌ���b��JAݛ6l��-����n[0�Z�6���_\\�6��˚.$6���L:cM����e��6y�tU����Q#�y\rL^SS����Yg��}T���i�i�btl�-#�NQ���k�ǝ<�z4t��Q~^���b���)2��G@��!�T��>EM���DB�i�!bKF>Y�+��JD�S�=��CpɢBxKdG{�r�=*�HRB�i��DL�B����㐒Z\Z�-܊�&�ό�6*\\�{_���P�)D������)ߟ�K��V=$h�gzj}�C���K@��-�������YK�1\Z~�Q-ɲ]���7\ZL�_ f���`����\n�SS]�繁b��8s&,՚G!�W!����P��D�U!j*5tꅇ��8�H�y��T��3QI}d����0�R\"��\"I���-$�hI����D��\'�A��M����ҩ˒e�CM\n�(p��Q\"�[:�K�F�v�w�}\n����|y<�>�\n���\r6n����#��{/)��LVa���S�N���)Sn���\'O�SY^<t��N�<��/.�>�x|�ȊU_�2��������`ܸ�d��Ě��I5���V�B�Oz��f7Y=eʔ����4�,D�?��N���峷�N9��x_g5%��B��y�1��Zn�r#i�٠d^y=�C���²��̞3[Y�����-��\0��\n�K3�?�@i�C���8����B�5k�Q&���:DK�I�T�t2���-}$�,K�.��P��!1��&�Qr�N�2 �]t{�2q�H\'Œ���Jgh��-#-A�g̽ڇ�����7��Iu��I���%�b\0�Q�����޽����A��:�O\'Y�W��-3ɸ	�|ٴN�G��ڂ�b��`dS�Kؗ���pC���5��<�^)K ,YG��}6�X�\'���t���,V�߱���b	{�?,%�����o%����X��\Zӓ��E)}�,����~J�����h�b0�eѧ�,\Ze�H����࿆vC]���(�C\\%�K#���\0*&���y����E����8��I*DP$@iQ#��\0	�K�ɮ�f�fq3�zZLiή1�o�Io�6��ܭZ\\��.�^Cj��ro�Y��9+2vC;h�#���k�����4�WA=oU���\\k(�b�CźЎػ��գi��t�O�\"��w \"�ڞR���+\\*օv�~ڄ��\"Y�XD�{�����h��nޜW�@�����h�\"(2���6ĴID;x�l@O2���.���2��>��%�3s��\ZB�`��u�����c��p������[oݻwon��|Ĉ��wߝw��`�22YTC���J����8��hw�\rZ\0�@�/}�K�G�~�\'>��d.R�m��c�V�ZEʚ��h�bY�\Z-�B¼���g7��]�t)�6B8�K/��\r�-�7�t��I۸q#��;N�>mv�\0���:g�!�\\,�W���v���ݘ1c\\����y�@P�p\nG@���;�X���w�R�{]���n��.�57��\0���O���A�>��O���� \\@�u�.��+�BI]�ue;��J��쨬�o� :�`��ܹ�o�K6m������ϕX�����k�³�NL��omj��f�J�H���gث۝���۰aL�S�3e��\"`���}@���\nw5_ȡr�&>|�9��y�ᇩ�t����}��G6�ߥH$gl�Ϙ�\'.�u;��зL<�,��0�\0�-_�\0y\\��P/�z�)W�\rT\n5B�!�$S�jm2d���]��`ߘ��[#���8\0\r�G5oV�D�r�w��_kA�V_��G�a�Š`��龜2�V��ꪫ�+1�cǎ��+�ʭ@8ʧ4���>�:J���X�?�yF\Zy%�n����3b�=�&�yd��Z(���o�̷����tv̢�R�\'����Ma[�:��+��Ec�Ï;����!D@0\'���j�~nݺ�j�YgF��Q,��r[�K^�ڞ,����V\r5-@�\Z�ҀC��w�u��d�����ѣ]�LJZť�}�yv֮q������v��Yصkך��~|�ys��G��R\0S�sϞ=̓�1��a�7�x����/���q*V�D�^nFҐ8�@i;}��{��fZE�%�z�U\ZHF�r#U���_���w{:q�D^��gxU�[T�ǹ�\0�?���\nt�io���uݚ�2j/��p�c������O�6�_��s*J�L\"%��@���C�*i�F�Ҟ�v��>��t�0�Χ7H��_b��S��6�k+G6��@���k�C��ho��W�Q�I|�ޑJ-���C$��S��(�d���i�B�:�J�2�lђ\\/\Z���q��|��z(n\nݙ`����~��e�\\Y^1j���Њrp�A�h�.�^B�m*�d�/mW��3f6�g˳~XB��q�-?����K{=�,\0�w; ��ep\n�,	dT+��^�@��i,5P�����?�\"���6�P�;L$��pq7���SS��\\Au�h���X*n�[�9\Z�̅�n0\\��%��\Z%�涶/�,(���g�	�\n�l]��k���&��g?�E}̥�_���2�.O&���HW�pF���V��!b�;��bą.Ę(i8G۔F�($\0�?�UX*U��.j�Y����U�\Z(��χ�*�m-a����\'����I�b��vF�re���fݥ+n`�d�����m`D�ޕ����w,�Ƭ(������ލ�9)������0�q�T�\\B\Z�`���ىgLD�C��R;�a�U8���A|V��wh��Ou>0��}�U���ܯ���4P��Id,Pfh�b�%N}��8h��n�j�\Z�\0V�ѫS�\rr��R�T���*D�Ղҟ|o�)��طo��]�Q�Lw��$k)_d1y�r��OF��-�P!�������mHhG�;��J]��H���b#f�p��-��6�)���5��|K[�[�X֓SP�\0+�N�ITQ2�K{i%���;��Ss�9�Y���w�8N߀π>`���v�6I�2ysE��OwY�$L��D�\\j�m����E��0LȔ��*>k�)M6�{F��@�}�Z�v�Ce;�_�7%�p��d˗}�n_$���e;[@1}�Hَ~��S��	,��*����z!j������PJ�|�ʫ��n�4i�ڥ�]@\ZX.�{ޒ�y�`����A�_��Ny��#��{a}������}�K�5>hў���l%�]/�����@�H��0jR;�g����>ׯ�S	C;�u��m�|�����Ծg�yd�x���{��+~*鏽�Y�掾ɕ�G��k�Θl@��F�̨}Ǔ;;:V���Kb��w?�k��4�b�%���Q�:&DU�õ��t����ˮx鷿y��7�=A�h�Vy�����Z;}��u�>���~3���V�<{�ӑ�/�rBe����}��lX�>+[�_~Y�Z��}j?c�)W϶-;4`��xi]%9£�����w,����� � �0[�}��7/j|�7m�_;���?֎��û|d�����w)����6�����׿\0�Δв-~ٕ���`ڇ>���j���^����34Y�F/l�pV3�Tj�����y�Cݽ�u�k�65�ƒ��v���d�\"rKX{���([\\`�o�Vu2�\'	LBUb;�H�������[4����no�{��������_\'���|pO��W;�s�\\��iݳ�{yb�;?s�!��:~Xď4�[���p1J�Y���!����?V�x��ʀ�B�y���i��@��<����(�e�).��l<�I���J���ˠ��e�-\0�]�tM�<����}�}W\\z٘��=j��QcN����鷚��S�pCe�\r�Z��N�?������}��Q���U�ɨO�N\'�7���s���`g&��3�ܑJ�hl�뺳�ǲ��K��i�=��7�Ya�)��X�Zݵ��C:$�\'ڦ�E�1���W�S˼�:���֖��斶go��iͦ��{��v�(ş°���x.��?�O�\'���� o�D�i��\0��knn.���2j��]v���.�Oh��e��3Ex�r�ދ3��E\Z��,^�|ػ�&����[�~�yc�5��������J�lk?(�����SN��y���I����B\'�q��e7z�uB�Ci��8c`�>k�=/�>��B�J�(������������W��9��S?}��7ߒ�)�Wn^-����~\n��I�}��EÍ\r,h�pi��\0��Q1w��#5�v��evy�[��]�s-�\n��̴w�6��E{]S�ܤu��˾��+��X� �e�{\Zaƺ�#�����F<��K�B��W�Oȑ�����<��D׭����^�Q��yFn#(�6y^:��x��~Ͻ+u�]j{JjH��*!dM[��>-�h\'}B�w�F#����8�L�W/�]h���ˢ��<#o��扴��p���>F���H��V��vv�p��y���,��c��cP�]V.R�{<�Yh���d�5\'�[Zn�1�ú1v<�>�ZZ�|C�zR����u�c�FbY�z%�&P���:�\n�m��-60b�Y�{�\0�KE᳹�ڇ�I���Kyɝ�7u��6�&�b�Sͺ���Ha��k;��^�i.�W���F���/e�v[@���ɪ@�ʍ�~�~�I���;�S�m��PJa��E�ڑS!*\\y)����Ӱ��� �x��U��]߭5�Zn��[�U�U�\ZlĔXSP������u��;7����T*����}�H��oխԺ	�H��eeemmm�v�\"���>��cB�\'N�O�\'L�@\Zڰ�G_F��Q�Fi8�Ç�>\\r)��x�Ke\Z��T�Đ�\0%L�>]�����5o�m�6��5ko5�����j�Nai�-Z$��ټ�E� �Wd�y4i�����I*g����!RR5�z%P�%�65F����	�x�����4Ԣ�\n��o#f-�Y̤�N�5��ty�.����Iz�pW�m��L���+�����o�;�vFc�m��d�%�A��Dt�>b}�,2\Z��BP�E���-ԇ.�R���n�8��hs��F���F0bYOg�*�ӑ����4�$p��y�32�\Z\"�w�}��&�ň�jlU�et�f#sL%�-\0kOlӆ��.�њk���+�h7��7���ٓ�����(��_�3��1�8\'eǩ�����n�7g��t\n��b���h[����x[�wݱ���L���\'xUxS��	�#��o�`߹�H#�d��\n��G��*TEE�C�yk�Y&�m����;�4�`p�k晫�:�R$��mN���3�Af�靗�6*�ͨ�����L\"(`�����j3|�X �s�i��y���.��]Vȋ�.��Jti{ŀ�M����:�6��;��b����g�\0\"�.�\"e;�^����Ն0�\'+�����#0cfc$�EP�l�&�`��\nEs-8���Q, u��gE�X%t�i˖�Z;�Q{�?����̳�����hO�w�=wܙۀP�v��-�����𳽽=\\����6w������Sg{�R{��֧�cE�B��~��8`��\ZՀ��ǜk\'��U2b�1��(�#��\nTg	�KeZ��f!��EY��73O�<��݀��z�߸�E���}i�i�I� Gs`�\'T3)m�ǲ��:��kfp�\'bdL&�\0���bm#��vŏ����F�e�UgV2(R9�����A�1�\r�~EͰ=~� �u���e�$�śy�\r�y��iS,{$�̢�0�r�w��ॶo��p�[l�Kź�Nkz��\'Y�,��gO�]�*�	�@��\\��u��&\\W�wB7��y�2��SiCh_Kc��0Ov%1�-�n�##���X�����xEm0C@�Vm39a�T�����X�9>��BV�*V�F��ا�D�]���\\zC�u��n턶���<q�:{_^���!F��	ŘIH1�*��rݦ�_�+͉�~�P�d;9��Q{��V��nF�A��#-f\Znt�e�g�`\\/Z�?�ީ&�<�+��Z����������ˌY��G���%B��de{�K��Q�m����ᙆ�J�ͳ$`�GĿ�\\���z��̦!T-���&{�Et�b��ѬF���.�y����F��/�S� H*u�[-��g�[dyX�������W)�l�t�<�;iaҒ.�4g�����Z��I����J��u|A1�E���k�,^^�%M�ܦ�7�.�͵ѵS\Z7U��J����)i䎍\0eک�\n�y�uL��a�+�钓⍄{\ro��`���2�l����3����\'7m�X^�qʍ}l�:1p��	2N���1��F�ҡI�&�kq�j��>k�,?j�tn���N9���h׮]������+ڣ�u�C��:�@.+�2M�q�a)��B�I ��C����O����/*J�U��u����Q(s���4���5w2�lkm�o��Pf͙�`�B{�Ϳ����O����7����u[q�v\Z�a��?���i�\n���X�#�ƛ�xE8W*@`���-M�%٥x���Z\\I�=�cp�D8W*��u�A<�+C�d�%��}si{Ĳf����D��͝n�$�v�����3��@H�C9g7j�.Țy���\Z��0��<;݌ڑ���I3�t�b1�2-Y����b�-�I��\rF���˞��f˼נ�amku�H����)U�`�2��7dk�݇�݆&��G6nB��ڴu���%Y���7�1}�t:��֦�V�X1y��c��]�Qˡ��E�(s۶m���\n���\"��������5kVYY�����D9(ɷ6Fg�2�q;R�����ĉ�W��	cB�)���AL�8�I���ݫ�� �����m�{�\ny�)����BF\\[�%��p�q�ԩF�Lͤ�M�6ٍ9��O������\0P��\n�������!8��6\'��Ĳ>P\nt�xb�\"%���u�R$�f��L�ګ\r�����}�^�v�Zz�ϱ�ՇP�ʇڗT���RVI��=%Ѥbv���uN9\'��3�\0�|�t&\r���j^�vAsssӖ-2󴻠�����º�QNㄵ\n�荔����i��f�{́y1r5\0�OE�\n��O��v��K9Ȯ�y�����\"�4ڥU�Q��\nt�h�l�b�-Z낍I�&�۷�L�6��`c��u͘��>�Mɞ�8e�%�=e��,F�Z�+�̳�-5��\"[E͙�$�K3�8Q���!q,{�&�?�����*:*�.������Ei�u�2�\0]�I���©Kf��\\���Dx&T��,�u$��%єˡ��. ,!rB��h`�7T�1�O����A���ʴBYl�Z�{�]w�v����go��f����\"���S�ȳ�,e���aa�v��1I⁛[\r�dv���|�=���9��!�)���\'�pI�K��7�<7�0F$Pb�܃R��O�����\\��R��\r���l��)�5�\Z�����v�Cb��i�2!�4��U� ڡ���7x��UVn��T���D������J%R�����FJF�%_�җ�)��0c�ĉR���6��g� �+�O��_�f́�σW���E<pؒX�1�=�E��d���{�*w��-��ƛ��ߓ�=�d&\ZJ\n,�U����IE�Ҹ&z�2���IQY����r�!�z���j�䛂�/�8rZ���Yw%4�d�n�\nL�4�ȉY�AWV�ZR�\n>|��X�\nMb$�ku��A=z��E�D/�M�;s�*�e�Ν��%�!���IW�t�X��M7�$Y[򖜸��Jc8Du��!#tk�ر��;b�\"���d̥��sϞ=4�M�Z���A�W��a�Da\r����{�\'7�����;z~p8��q�If�:��\r��3�Oy���s��񜀻�7|ȗ���t���q��ZF��M�I\"{h��+�/���+<42�c]{�Ӈ��>�#i1�\Zf��?0��g?�t\"LHF��n.��5��<��7�`A}C�@�14����bV[�p�����\'w޽|95cf�Yz^��fd�9��A2��>)�(3`@�AEb����[]����@9f�Zఓ>�YEbf�:�B7M��3s�3O��E�ġ�7EZ*�f���F��ܻ�ҭ[�&�a1�^DnB2)3�BF�>��ղ�nXtӽ���	�h\"^���gΔug,��$f�Z��+ᴔe���1��G�5`\0�	��ݼ9 ޅ��J���lF��@��\'�`{Y�\rO�\0s|-G���{�b���\"�v?Q�T��d��^0�l��$�h��w����ߜ�\Z�uS���7��=�I�/�IaU>����E�^Ckk��<���y/���\ry�����E�y\Z�h�`Uf=3Oș�օk��^�>H��Ng�қg���&��	:Յ����I`��(\"�@���x���p�v�q���͝\'3O�E��`��</]���\ZnԮ�y<����g[tOE���d�雬\'��<�;x�(|>x����yJ�}d�� u���&	��F��i�h�\"�J��:l,��-хvH|Z1�|l\'*[[[��S{|� �#���5��v��$>�5&�����A�d;1L8\'z�y�t������4om���i���Æ\r��ُ?���D�,++S�<S�8q�\\���N������O�<Y;���mkk���{�����vBA�ƻv��k\09��+�G��Zu��a�� g\"t�|gS�^Y��mu){�nu��b����J���&��nB2������S`��S��X&��8���m;V<�K�h��{�s�vy��FǮt5�i�\ns.!�v�]P\0�ѻ�btK\'����_���T]v�\\���N�����^�}j�S�\r��YT�h\\,�fYM�7k[�_Jm�nԉ�%��_��5j��zǵNY�fM��U���m2#�l	�4��N��z�ޔ���H!A��[����+X{���СE�_���W���=�\'�����?}BB,k�{�ag,{�F�zO�](^��±��W骱��L�7g���{��q��ų����]��9]8��C�:ç�U�{(P�,F\r=�X�%T�<�ފ�>�QE�T�ے���сE�*�N]�n����\"�%�ǉ\n�Gs\Z��J(+=��X��$��~��\r�F\'t�[���Q8;�g4U��������1����P��:5-ҨV���vQ�_�M��7��z�;\'��~������O�sMb�5�N�ПW^}���]��߀h���N�����A��D���m�m`[�o����ӑ�L	��Ɯ������+$�Q>��\ns�Ii�+�Q�C�$zjQ@W��6btiO]��ļ\"�ڬ|ȥ^��\\�K:�U��y(D\n?�wB��1�\"�T{�[�zxO�뇿�����~�{���]6����r��ۙ�_�˶g�}a���>��g�_:��	�U=)P�<}7N\r��#7%��!*�h�˽%��dE�\\�����Z~�s�+T����*�\Z�N�5��N\n@�d�\n��1�z�\n������?���?�sE��ļo���t�z��KF��x���W]9�ʲ�����·���6?�����Ί|Z��磛7�Pu��6�ͳ���|_v(����n;7*/U�8�ܸ�S��o\"����%{�m����`v��w�������@�Sx�ҡ���.���Չ�p,V5j��Ǐ>z�����?�����Z��Y�>]��\nas֛�퉅_�9���c-����\0Ӕ�5ke�ȏ-ܘۯ�j\Z���wV�񬭚8�fʵ#?��n�K��k�TϜ<��Ǐ]}�p��N}����Φ̞1�ԍb��f7j\'�v�yB�\"3O�\\��ͳ�K岩���z�[��7??t�P\ZV���^?~l�A��ј�y �oԈ� i~Ѷ�H^��_~2��|4O�\0��3p�l�J�J�����3��ƏSd��E�?����䛤xH�c�=&���n ���%�u�V7m�~۶mJ/���i�_�������a0�؄?EW��I�Ϋ?��nը1_txe�`��]̫�.-{M��ߵC������C��|�GFƯ�-������C/~k���^�\"��5����d��@Rhcg�T�du���9EW�j#K��j{M�)�f�҆i$�I�*X��*,�XS���h��?��A�3�F͘$����{�~�Ϯ���0\"��HX�ʫG�y$�R¿�z(��A�*����#+F�H� g�zҍ�\ZK��ϛ���^A����=�Z}Nw�n��_@uEJ?j4�bzAϼ�����>�+%C�{��-*-��\0����;Ⱦ������Ѫ��6�c�n>P�$�a��82���:K�<�3~��_���	@� u�a�&O�@2X�e�_�}\"ہpzKz��[1r��[rk��\'\Z�LQ�V�:�\'vQ;!)x=��>�z\Z���_�+A#D7�HkrP���!�>]��ܙ�DJ.YN���y��]/�y�W:_CA�_ve��8�a�m(P1�v��Q{�7���\"3ρ��{�WQ�F�F-��s�mz�Ѫ�%f����y\"�Vi���|?��@��Z<ca�a�g{d��3�Dl�^�>����ۣ��3�\Z(%��Խo�H\"a� ��o�\n<�S.����ԁ��_ؗ[��yj=$|�،ڵ����l@�u�6�������u>��v��?\"I`�E\0�G$��簗��	�I.08�.(�\ZOY����݌�}��ZyV,�ǧ�7\0�^?~�����[h(�ړ\0�����?�Va�t^�|��08�y|���ms���t=������` ��J�L�ViR @2��0x������g}��I��/�W	$6�7\0.��ok��`��֬=p�y���~i�̆^�n��H3�>��L����+��ɉ-��g[�\n5����|��|��x�R�^���C݅�A|>��\r��1�qi��\\����ٍ�U8���B[�K���9u��\r�V�cYQ3I�e���T�0�/��l�B0Ir�����hw9�ק�#$ɉ:J�}��¤���T͘jaLvLEȲ�:�ҳ�{Wnڰ1�*�K�5=pν�v\0�Y��h��X&LvS���`�FD��Y��>ٽLhg��� :y�%���Ӫ����N_U�F�Qc��\nd�J-�D���*8,8�ZO�����_F���\\�N�)X��d7;T�ہ�duRvlOi�e`P;���{m�ˈ�����*k�ɓ\'��Gϵ\"�4�t�<�w��e�M�D�����e�oye�\\��8�Ω�[~\n�M�k�v�	v�//������:�l����Jk�鷎��}��!����]s���6;P�O~�PhB2y��I�l�?x�ق��^З?%3Ts�H;�:�a��r��ZJS��T�\n��W}�]�~����2w�С�p5c�Չ3v���˶\r$��㴤W�#�s���v�]�����\0k�&�0E���f\r�ͨ=��|����u��n��uo��0朅�e���2�4�JWL�\\,Wb���:��&e�/<Gǎ\\#��h�n�M3}����ᘾ�z4�p(\rBM�)N�D��}d��}�D>�;;����.���n򼠽yj�����7�\'�	�F���v���.��Ԟ\\�v��1�9;i�\npf�\"�k9Kx�s.̝��������o	��m���)`����M)���\n�G!o�_�|�*����[�24�6Z��\Z���v]hgF��/\\�]dq�n���)@��7��u;�oj���.�.w�jJ,�L�e_^��{迯Z���.n�ާA)��\0\\��H{ _u����l������ć�<4�<��-�g��\r�\'ۥR�3�ڔ�v4������1�l۶MƘL?a\"�A�~�-ʴ���K9xOfN^�FƯ����;ՙ~�ĩ�Gү�}�|S��^=t�ƣ�������z�|�\Z�5�����|�?���f���o��f��Nݖ�o���xf���!.&J&\Zs�5M�� �D�d���sE���D���mm���,�����y����E{e`�\'\'M�����Z��<׭Y��vL>���ZJ�{����nW�ͅ2��������k���_��i+N��~�����2x���c:?���u��]1	���x*�]f�R�zj7�72�<0�����/�Zv�%e`�\'��w|;����o�wc��Ίs1����z��-<2j_�t��<���Y$\0���������x�)X+ʯ�\Z5�/��M�ПL���<}�	�/���I�x��g�kS\"�7�\0�4�f�𰭩	�z[s����G���\"OǑ�gŀ=5m������~�l�oo\'��;��yFP���	��\"ޝݨ=�yFP�U�PN���UȨ=Y��	|4p2�m������1��ԿN��0�	�m���k�%eB2����j��|:�&��I�� ��(�b,�?q��U`O�4ƣ�����������^~�����+?И�k�(�L�����,��@cB�׊�����l3*�Uڵ9�Ӟ,h�J1n����\Z8�翸��H���(�H�ᒥKFVTd2�aÆ��L�²/�M�;y�TlH�7�4峋n��\\���{�]Y1��N�$ˌ����D������������$%��,4�<W���u�tvv�a�!��I5��xH��r�	P&Y(���eXmVQQ1e�2�_� �_!I-j-iN�:�,7N�\ZO�D���kj�KS黖�IFQ����3x���ӣ}{��L_/� �׻g�̫��{�M���6~�2�Z��H�>y򤲔���Ό�3_<t�r�e��ٚ~5X����*�������}��z��7 1M��Ȑ�go�ݯq�Ԙo��6SLה���%�>��17�r�Ig4�dYy�J��8S2ݡ�@LE�Ht����%�u[1[�fͦ\rKpS����>;��J��+\Z�Q�<<��HR�f�@�o�\"_��=4�K��\"���˒eiC���Q��-���-�Љ���u�.޷w�?|C(���c��	��|I /��a^A� B4��<�6~�h4�/�jz�fR���e@JF�=g6�9�b�O�����e�:��E���&�kr�go��n���<�LV��P!|p4̧�1 /(�ҋ�o���\'=o!~�,�BF�4�Ƨ3>IVKhF�O i-��UP���1���Y��p|�Hz��-�wH,v�a\Z\"ji��HS�G�t�|��i�^�P�����D\Z	�\nfBc�H����FF�\Z��?#��^;)����&񩐑vM��{jd:������8itE	�ܳr%%��x�G��Id���Kk������rH+	T��o�z(\'��A�I�)�xH�q�]��bo�,oi>��2�woY��rs�ޫw�o��M&�xG~�Z��]��7�؞z�k\nߕ���u�ΰ�������2����_�ٮJu�Wk?:��Q�-2���.����f��f�.,�b��k\"�5�A�������e�.*jn���ޕ�~7u]��]*��=	��Ύv�ͥ?tBS݁Ղ����Lo��T��U�:�C\'�J��X\Z��S2�Z*3�6Q�i�FFچ�F���Ք��\Z�G6nR��uDJ	��2t4^�oܡ�Xo�\ZVR�o��}��n��A&K�f@s�A|T�ՠ�N���,/|���1�3<Uvu��hT�2>��{|ʨ�je�(����V��G�(c�ۙZ�xۂ���2ʃ��ǭQU����f��(���(N���G#�\Z��3}TJ��d��.��.�� ��\"��\0��̲���\0\0\0\0IEND�B`�',1,'2023-10-20 23:18:57',1,NULL,NULL);

/*Table structure for table `M_PaymentType` */

DROP TABLE IF EXISTS `M_PaymentType`;

CREATE TABLE `M_PaymentType` (
  `PaymentTypeID` int(11) NOT NULL,
  `PaymentType` varchar(20) NOT NULL,
  `ReferenceTableStatusID` bigint(20) DEFAULT 1,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLogInID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PaymentTypeID`),
  KEY `FK_PaymenType_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  KEY `FK_PaymenType_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_PaymenType_UpdatedByUserLogInID` (`UpdatedByUserLogInID`),
  CONSTRAINT `FK_PaymenType_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_PaymenType_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_PaymenType_UpdatedByUserLogInID` FOREIGN KEY (`UpdatedByUserLogInID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `M_PaymentType` */

insert  into `M_PaymentType`(`PaymentTypeID`,`PaymentType`,`ReferenceTableStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLogInID`) values 
(1,'GCASH',1,'2023-10-20 23:20:39',1,NULL,NULL);

/*Table structure for table `M_Profile` */

DROP TABLE IF EXISTS `M_Profile`;

CREATE TABLE `M_Profile` (
  `ProfileID` bigint(20) NOT NULL,
  `ProfileFirstName` varchar(50) NOT NULL,
  `ProfileMiddleName` varchar(50) DEFAULT NULL,
  `ProfileLastName` varchar(50) NOT NULL,
  `ProfileExtName` varchar(10) DEFAULT NULL,
  `ProfileBirthdate` date DEFAULT NULL,
  `ProfileAddress` varchar(200) DEFAULT NULL,
  `ProfileContactNo` varchar(12) DEFAULT NULL,
  `ProfilePic` varchar(100) DEFAULT NULL,
  `ProfileEmail` varchar(100) DEFAULT NULL,
  `ReferenceGenderID` bigint(20) DEFAULT NULL,
  `ReferenceTableStatusID` bigint(20) NOT NULL DEFAULT 1,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedbyUserLoginID` bigint(20) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedbyUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ProfileID`),
  UNIQUE KEY `FK_Profile_Unique` (`ProfileFirstName`,`ProfileLastName`,`ProfileBirthdate`),
  KEY `FK_Profile_ReferenceGenderTypeID` (`ReferenceGenderID`),
  KEY `FK_Profile_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  KEY `FK_Profile_AddedbyUserLoginID` (`AddedbyUserLoginID`),
  KEY `FK_Profile_UpdatedbyUserLoginID` (`UpdatedbyUserLoginID`),
  CONSTRAINT `FK_Profile_AddedbyUserLoginID` FOREIGN KEY (`AddedbyUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Profile_ReferenceGenderTypeID` FOREIGN KEY (`ReferenceGenderID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Profile_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Profile_UpdatedbyUserLoginID` FOREIGN KEY (`UpdatedbyUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `M_Profile` */

insert  into `M_Profile`(`ProfileID`,`ProfileFirstName`,`ProfileMiddleName`,`ProfileLastName`,`ProfileExtName`,`ProfileBirthdate`,`ProfileAddress`,`ProfileContactNo`,`ProfilePic`,`ProfileEmail`,`ReferenceGenderID`,`ReferenceTableStatusID`,`DateAdded`,`AddedbyUserLoginID`,`DateUpdated`,`UpdatedbyUserLoginID`) values 
(1,'demo',NULL,'account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2023-08-09 19:18:02',1,NULL,NULL),
(2,'Jonas',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'arnalen@gmail.com',4,1,'2023-08-20 22:55:54',1,'2023-11-02 18:40:23',2),
(3,'Ara',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'arna@gmail.com',4,1,'2023-08-21 10:18:12',1,NULL,NULL),
(4,'AraAra',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'arna_ar@gmail.com',4,1,'2023-08-21 10:23:20',1,NULL,NULL),
(5,'arma',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'arnaar@gmail.com',4,1,'2023-08-21 10:43:37',1,NULL,NULL),
(6,'aran',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'arnaarn@gmail.com',4,1,'2023-08-21 10:44:46',1,NULL,NULL),
(7,'arana',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'arnaarna@gmail.com',4,1,'2023-08-21 10:46:29',1,NULL,NULL),
(8,'zoilo',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'zoilo@gmail.com',4,1,'2023-08-21 10:50:22',1,NULL,NULL),
(9,'amz',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'amz@gmail.com',4,1,'2023-08-21 11:57:51',1,NULL,NULL),
(10,'amz2',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'amz2@gmail.com',4,1,'2023-08-21 15:39:12',1,NULL,NULL),
(11,'am1z2',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'a1mz2@gmail.com',4,1,'2023-08-21 20:29:04',1,NULL,NULL),
(12,'am1z12',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'a1mz12@gmail.com',4,1,'2023-08-21 20:33:02',1,NULL,NULL),
(13,'Diane',NULL,'Maya',NULL,'1983-01-23',NULL,NULL,NULL,'zunakis@gmail.com',NULL,1,'2023-08-21 20:43:51',1,NULL,NULL),
(14,'Arna',NULL,'Maya',NULL,'1983-01-23',NULL,NULL,NULL,'expert@gmail.com',NULL,1,'2023-08-21 21:06:21',1,NULL,NULL),
(15,'JohnJohn',NULL,'Zoilo',NULL,'1981-07-09','Santiago San Francisco','09989129540',NULL,'johnhon@gmail.com',4,1,'2023-08-22 09:50:01',2,NULL,NULL),
(16,'Beany',NULL,'Meagol',NULL,'1981-09-09',NULL,NULL,NULL,'beany@gmail.com',NULL,1,'2023-08-22 10:25:58',1,NULL,NULL),
(17,'Arnae',NULL,'Maya',NULL,'1983-01-23',NULL,NULL,NULL,'expert1@gmail.com',NULL,1,'2023-08-22 21:43:13',1,NULL,NULL),
(18,'Arnel',NULL,'Maya',NULL,'1983-01-23',NULL,NULL,NULL,'arnale@gmail.com',NULL,1,'2023-08-22 22:13:46',1,NULL,NULL),
(19,'Beany1',NULL,'Meagol',NULL,'1981-09-09',NULL,NULL,NULL,'beany1@gmail.com',NULL,1,'2023-08-22 22:20:53',19,NULL,NULL),
(20,'Analy',NULL,'Maya',NULL,'1983-01-23',NULL,NULL,NULL,'analy@gmail.com',NULL,1,'2023-08-22 22:28:01',1,NULL,NULL),
(21,'Tobe',NULL,'Supangan',NULL,'2002-05-02',NULL,NULL,NULL,'tobey@gmail.com',NULL,1,'2023-08-29 13:18:20',1,NULL,NULL),
(22,'Joshua',NULL,'Gimao',NULL,'2001-11-08',NULL,NULL,NULL,'asd@gmail.com',NULL,1,'2023-10-20 17:50:07',1,'2023-11-08 12:48:56',22),
(23,'Naofumi',NULL,'Kazuto',NULL,'2001-11-08',NULL,NULL,NULL,'naofumi@gmail.com',NULL,1,'2023-11-06 13:17:41',1,'2023-11-09 20:38:49',23),
(24,'Naofumi',NULL,'Iwatani',NULL,'2001-10-10','Cebu City','09123456789',NULL,'naofumi4@gmail.com',3,1,'2023-11-07 13:21:04',1,NULL,NULL);

/*Table structure for table `M_Reference` */

DROP TABLE IF EXISTS `M_Reference`;

CREATE TABLE `M_Reference` (
  `ReferenceID` bigint(20) NOT NULL,
  `ReferenceGroup` varchar(100) DEFAULT NULL,
  `ReferenceCode` char(10) DEFAULT NULL,
  `ReferenceShortDescription` varchar(100) DEFAULT NULL COMMENT 'Use for linking on other table instead of ID For Faster Troubleshooting',
  `ReferenceLongDescription` varchar(200) DEFAULT NULL,
  `ReferenceGroupCode` varchar(20) DEFAULT NULL,
  `ReferenceSequence` int(4) DEFAULT NULL,
  `ReferenceTableStatusID` bigint(20) DEFAULT 1,
  `DateAdded` datetime DEFAULT current_timestamp(),
  `AddedByUserID` bigint(20) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserID` bigint(20) DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  PRIMARY KEY (`ReferenceID`),
  UNIQUE KEY `ReferenceCode` (`ReferenceCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `M_Reference` */

insert  into `M_Reference`(`ReferenceID`,`ReferenceGroup`,`ReferenceCode`,`ReferenceShortDescription`,`ReferenceLongDescription`,`ReferenceGroupCode`,`ReferenceSequence`,`ReferenceTableStatusID`,`DateAdded`,`AddedByUserID`,`DateUpdated`,`UpdatedByUserID`,`Comment`) values 
(1,'TableStatus','ACT','A','Active',NULL,1,1,'2018-06-22 17:40:09',NULL,NULL,NULL,NULL),
(2,'TableStatus','INACT','I','In Active',NULL,2,1,'2018-06-24 00:58:08',NULL,NULL,NULL,NULL),
(3,'Gender','ML','M','Male',NULL,1,1,'2023-08-20 22:01:42',NULL,NULL,NULL,NULL),
(4,'Gender','FM','F','Female',NULL,2,1,'2023-08-20 22:01:56',NULL,NULL,NULL,NULL),
(5,'ExpertsStatus','ESP','Pending','Pending',NULL,1,1,'2023-08-21 16:21:52',NULL,NULL,NULL,NULL),
(6,'ExpertsStatus','ESV','Verified','Verified',NULL,2,1,'2023-08-21 16:22:30',NULL,NULL,NULL,NULL),
(7,'RecipeStatus','RSA','Approved','Approved',NULL,1,1,'2023-08-23 21:06:44',NULL,NULL,NULL,NULL),
(8,'RecipeStatus','RSC','Cancelled','Cancelled',NULL,2,1,'2023-08-23 21:07:19',NULL,NULL,NULL,NULL),
(9,'Restriction','RSP','Posted','Posted',NULL,1,1,'2023-11-02 20:47:32',NULL,NULL,NULL,NULL),
(10,'Restriction','RSCL','Cancelled','Cancelled',NULL,2,1,'2023-11-02 20:48:01',NULL,NULL,NULL,NULL),
(11,'PaymentStatus','PSPD','Paid','Paid',NULL,1,1,'2023-11-03 21:21:45',NULL,NULL,NULL,NULL),
(12,'PaymentStatus','PSCAN','Cancelled','Cancelled',NULL,2,1,'2023-11-03 21:22:07',NULL,NULL,NULL,NULL),
(13,'ReceiptStatus','RSPST','Posted','Posted',NULL,1,1,'2023-11-03 22:11:24',NULL,NULL,NULL,NULL),
(14,'ReceiptStatus','RSCAN','Cancelled','Cancelled',NULL,2,1,'2023-11-03 22:11:52',NULL,NULL,NULL,NULL),
(15,'SubscriptionStatus','SSS','Subscriber','Subscriber',NULL,1,1,'2023-11-03 22:48:17',NULL,NULL,NULL,NULL),
(16,'SubscriptionStatus','SSC','Cancelled','Cancelled',NULL,2,1,'2023-11-03 22:48:35',NULL,NULL,NULL,NULL);

/*Table structure for table `M_Religion` */

DROP TABLE IF EXISTS `M_Religion`;

CREATE TABLE `M_Religion` (
  `ReligionID` bigint(20) NOT NULL,
  `ReligionType` varchar(50) NOT NULL,
  `ReferenceTableStatusID` bigint(20) NOT NULL DEFAULT 1,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ReligionID`),
  KEY `FK_Religion_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  KEY `FK_Religion_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_Religion_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  CONSTRAINT `FK_Religion_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Religion_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Religion_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `M_Religion` */

insert  into `M_Religion`(`ReligionID`,`ReligionType`,`ReferenceTableStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,'Roman Catholic',1,'2023-08-22 09:50:01',1,NULL,NULL),
(2,'1',1,'2023-11-07 13:21:04',1,NULL,NULL);

/*Table structure for table `M_UserGroup` */

DROP TABLE IF EXISTS `M_UserGroup`;

CREATE TABLE `M_UserGroup` (
  `UserGroupID` bigint(20) NOT NULL,
  `UserGroupCode` char(10) DEFAULT NULL,
  `UserGroupName` varchar(50) NOT NULL,
  `ReferenceTableStatusID` bigint(20) DEFAULT 1,
  `DateAdded` datetime DEFAULT current_timestamp(),
  `AddedbyUserLoginID` bigint(20) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedbyUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UserGroupID`),
  KEY `FK_UserGroup_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  CONSTRAINT `FK_UserGroup_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `M_UserGroup` */

insert  into `M_UserGroup`(`UserGroupID`,`UserGroupCode`,`UserGroupName`,`ReferenceTableStatusID`,`DateAdded`,`AddedbyUserLoginID`,`DateUpdated`,`UpdatedbyUserLoginID`) values 
(1,'SUP','Superuser',1,'2018-09-17 07:46:45',NULL,'2019-05-31 11:00:16',4),
(2,'ADM','Admin',1,'2018-09-17 07:46:45',NULL,'2019-06-30 06:17:42',3),
(3,'STF','Staff',1,'2018-09-17 07:46:45',NULL,NULL,NULL),
(4,'EXP','Expert',1,'2023-08-21 21:04:10',NULL,NULL,NULL),
(5,'CHF','Cheffies',1,'2023-08-21 21:04:27',NULL,NULL,NULL);

/*Table structure for table `M_UserGroupMember` */

DROP TABLE IF EXISTS `M_UserGroupMember`;

CREATE TABLE `M_UserGroupMember` (
  `UserGroupMemberID` bigint(20) NOT NULL,
  `UserGroupID` bigint(20) NOT NULL,
  `UserLoginID` bigint(20) DEFAULT NULL,
  `EffectiveDate` datetime NOT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `ReferenceTableStatusID` int(11) DEFAULT 1,
  `DateAdded` datetime DEFAULT current_timestamp(),
  `AddedbyUserLoginID` bigint(20) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedbyUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UserGroupMemberID`),
  KEY `UserGroup_ID` (`UserGroupID`),
  KEY `FK_UserGroupMember_UserloginID` (`UserLoginID`),
  CONSTRAINT `FK_UserGroupMember_UserGroupID` FOREIGN KEY (`UserGroupID`) REFERENCES `M_UserGroup` (`UserGroupID`),
  CONSTRAINT `FK_UserGroupMember_UserloginID` FOREIGN KEY (`UserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `M_UserGroupMember` */

insert  into `M_UserGroupMember`(`UserGroupMemberID`,`UserGroupID`,`UserLoginID`,`EffectiveDate`,`ExpiryDate`,`ReferenceTableStatusID`,`DateAdded`,`AddedbyUserLoginID`,`DateUpdated`,`UpdatedbyUserLoginID`) values 
(1,1,1,'2023-08-09 19:20:02',NULL,1,'2023-08-09 19:20:04',1,NULL,NULL),
(2,2,6,'2023-08-21 00:00:00',NULL,1,'2023-08-21 10:43:37',1,NULL,NULL),
(3,2,7,'2023-08-21 00:00:00',NULL,1,'2023-08-21 10:44:46',1,NULL,NULL),
(4,2,8,'2023-08-21 00:00:00',NULL,1,'2023-08-21 10:46:29',1,NULL,NULL),
(5,2,9,'2023-08-21 00:00:00',NULL,1,'2023-08-21 10:50:22',1,NULL,NULL),
(6,2,10,'2023-08-21 00:00:00',NULL,1,'2023-08-21 11:57:51',1,NULL,NULL),
(7,4,11,'2023-08-21 00:00:00',NULL,1,'2023-08-21 15:39:13',1,NULL,NULL),
(8,4,12,'2023-08-21 00:00:00',NULL,1,'2023-08-21 20:29:04',1,NULL,NULL),
(9,4,13,'2023-08-21 00:00:00',NULL,1,'2023-08-21 20:33:02',1,NULL,NULL),
(10,4,14,'2023-08-21 00:00:00',NULL,1,'2023-08-21 20:43:51',1,NULL,NULL),
(11,4,15,'2023-08-21 00:00:00',NULL,1,'2023-08-21 21:06:21',1,NULL,NULL),
(12,5,16,'2023-08-22 00:00:00',NULL,1,'2023-08-22 09:50:01',2,NULL,NULL),
(13,5,17,'2023-08-22 00:00:00',NULL,1,'2023-08-22 10:25:58',1,NULL,NULL),
(14,4,18,'2023-08-22 00:00:00',NULL,1,'2023-08-22 21:43:13',1,NULL,NULL),
(15,4,19,'2023-08-22 00:00:00',NULL,1,'2023-08-22 22:13:46',1,NULL,NULL),
(16,5,20,'2023-08-22 00:00:00',NULL,1,'2023-08-22 22:20:53',19,NULL,NULL),
(17,4,21,'2023-08-22 00:00:00',NULL,1,'2023-08-22 22:28:01',1,NULL,NULL),
(18,5,22,'2023-10-20 00:00:00',NULL,1,'2023-10-20 17:50:07',1,NULL,NULL),
(19,4,23,'2023-11-06 13:40:43',NULL,1,'2023-11-06 13:40:54',1,NULL,NULL),
(20,5,24,'2023-11-07 00:00:00',NULL,1,'2023-11-07 13:21:04',1,NULL,NULL);

/*Table structure for table `M_UserLogin` */

DROP TABLE IF EXISTS `M_UserLogin`;

CREATE TABLE `M_UserLogin` (
  `UserLoginID` bigint(20) NOT NULL,
  `ProfileID` bigint(20) NOT NULL,
  `UserLoginName` varchar(100) NOT NULL,
  `UserLoginPassword` varchar(100) DEFAULT NULL,
  `UserLoginPW_LastChanged` datetime DEFAULT NULL,
  `UserLoginForce_PW_Change` tinyint(1) DEFAULT 0,
  `ReferenceTableStatusID` int(11) DEFAULT 1 COMMENT '0=inactive, 1=active',
  `DateAdded` datetime DEFAULT current_timestamp(),
  `AddedbyUserLoginID` bigint(20) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedbyUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UserLoginID`),
  KEY `FK_UserLogin_Profile_ID` (`ProfileID`),
  KEY `index_UserLoginName` (`UserLoginName`),
  KEY `index_UserLoginPassword` (`UserLoginPassword`),
  CONSTRAINT `FK_Userlogin` FOREIGN KEY (`ProfileID`) REFERENCES `M_Profile` (`ProfileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `M_UserLogin` */

insert  into `M_UserLogin`(`UserLoginID`,`ProfileID`,`UserLoginName`,`UserLoginPassword`,`UserLoginPW_LastChanged`,`UserLoginForce_PW_Change`,`ReferenceTableStatusID`,`DateAdded`,`AddedbyUserLoginID`,`DateUpdated`,`UpdatedbyUserLoginID`) values 
(1,1,'demo','d4a539993c1ab7e9eb6df524391f2b4976e5af16',NULL,0,1,'2023-08-09 19:18:29',1,NULL,NULL),
(2,1,'zarnalen@gmail.com','d4a539993c1ab7e9eb6df524391f2b4976e5af16',NULL,0,1,'2023-08-20 22:44:10',1,'2023-11-02 19:22:20',2),
(3,2,'arnalen@gmail.com','81be65c90334dcb6d3b2dfc327a7f38f65867bbe',NULL,0,1,'2023-08-20 22:55:54',1,NULL,NULL),
(4,3,'arna@gmail.com','81be65c90334dcb6d3b2dfc327a7f38f65867bbe',NULL,0,1,'2023-08-21 10:18:12',1,NULL,NULL),
(5,4,'arna_ar@gmail.com','81be65c90334dcb6d3b2dfc327a7f38f65867bbe',NULL,0,1,'2023-08-21 10:23:20',1,NULL,NULL),
(6,5,'arnaar@gmail.com','81be65c90334dcb6d3b2dfc327a7f38f65867bbe',NULL,0,1,'2023-08-21 10:43:37',1,NULL,NULL),
(7,6,'arnaarn@gmail.com','81be65c90334dcb6d3b2dfc327a7f38f65867bbe',NULL,0,1,'2023-08-21 10:44:46',1,NULL,NULL),
(8,7,'arnaarna@gmail.com','81be65c90334dcb6d3b2dfc327a7f38f65867bbe',NULL,0,1,'2023-08-21 10:46:29',1,NULL,NULL),
(9,8,'zoilo@gmail.com','81be65c90334dcb6d3b2dfc327a7f38f65867bbe',NULL,0,1,'2023-08-21 10:50:22',1,NULL,NULL),
(10,9,'amz@gmail.com','81be65c90334dcb6d3b2dfc327a7f38f65867bbe',NULL,0,1,'2023-08-21 11:57:51',1,NULL,NULL),
(11,10,'amz2@gmail.com','81be65c90334dcb6d3b2dfc327a7f38f65867bbe',NULL,0,1,'2023-08-21 15:39:13',1,NULL,NULL),
(12,11,'a1mz2@gmail.com','81be65c90334dcb6d3b2dfc327a7f38f65867bbe',NULL,0,1,'2023-08-21 20:29:04',1,NULL,NULL),
(13,12,'a1mz12@gmail.com','81be65c90334dcb6d3b2dfc327a7f38f65867bbe',NULL,0,1,'2023-08-21 20:33:02',1,NULL,NULL),
(14,13,'zunakis@gmail.com','d4a539993c1ab7e9eb6df524391f2b4976e5af16',NULL,0,1,'2023-08-21 20:43:51',1,NULL,NULL),
(15,14,'expert@gmail.com','d4a539993c1ab7e9eb6df524391f2b4976e5af16',NULL,0,1,'2023-08-21 21:06:21',1,NULL,NULL),
(16,15,'johnhon@gmail.com','d4a539993c1ab7e9eb6df524391f2b4976e5af16',NULL,0,1,'2023-08-22 09:50:01',1,NULL,NULL),
(17,16,'beany@gmail.com','d4a539993c1ab7e9eb6df524391f2b4976e5af16',NULL,0,1,'2023-08-22 10:25:58',1,NULL,NULL),
(18,17,'expert1@gmail.com','d4a539993c1ab7e9eb6df524391f2b4976e5af16',NULL,0,1,'2023-08-22 21:43:13',1,NULL,NULL),
(19,18,'arnale@gmail.com','d4a539993c1ab7e9eb6df524391f2b4976e5af16',NULL,0,1,'2023-08-22 22:13:46',1,NULL,NULL),
(20,19,'beany1@gmail.com','d4a539993c1ab7e9eb6df524391f2b4976e5af16',NULL,0,1,'2023-08-22 22:20:53',1,NULL,NULL),
(21,20,'analy@gmail.com','d4a539993c1ab7e9eb6df524391f2b4976e5af16',NULL,0,1,'2023-08-22 22:28:01',1,NULL,NULL),
(22,22,'asd@gmail.com','cd3f875c6fdb8fc243065d06da6e9b030dd22673',NULL,0,1,'2023-10-20 17:50:07',1,'2023-11-08 12:33:37',22),
(23,23,'naofumi@gmail.com','cd3f875c6fdb8fc243065d06da6e9b030dd22673',NULL,0,1,'2023-11-06 13:19:07',1,'2023-11-09 19:52:15',23),
(24,24,'naofumi4@gmail.com','0a0cc18a4d0af8e5cd5592c11a3e26b9e340ba4e',NULL,0,1,'2023-11-07 13:21:04',1,NULL,NULL);

/*Table structure for table `M_UserModule` */

DROP TABLE IF EXISTS `M_UserModule`;

CREATE TABLE `M_UserModule` (
  `ModuleID` bigint(20) NOT NULL,
  `ModuleName` varchar(50) NOT NULL,
  `ModuleController` varchar(50) DEFAULT NULL,
  `ModuleDescription` varchar(200) DEFAULT NULL,
  `ModuleParentID` bigint(20) NOT NULL,
  `ModuleSequence` int(11) DEFAULT NULL,
  `FontIcon` varchar(50) DEFAULT NULL,
  `IsComponent` char(1) DEFAULT 'N',
  `IsDefaultSystemController` char(1) DEFAULT 'N',
  `ReferenceTableStatusID` bigint(20) DEFAULT 1 COMMENT '0=inactive, 1=active',
  `DateAdded` datetime DEFAULT current_timestamp(),
  `AddedbyUserLoginID` bigint(20) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedbyUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ModuleID`),
  KEY `FK_UserModule_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  CONSTRAINT `FK_UserModule_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `M_UserModule` */

insert  into `M_UserModule`(`ModuleID`,`ModuleName`,`ModuleController`,`ModuleDescription`,`ModuleParentID`,`ModuleSequence`,`FontIcon`,`IsComponent`,`IsDefaultSystemController`,`ReferenceTableStatusID`,`DateAdded`,`AddedbyUserLoginID`,`DateUpdated`,`UpdatedbyUserLoginID`) values 
(1,'Dashboard','Dashboard','Dashboard',0,1,'dashboard','N','N',1,'2023-08-03 07:14:04',1,NULL,NULL),
(2,'MealPlan','MealPlan','MealPlan',0,2,'user','N','N',1,'2023-08-03 07:15:37',1,NULL,NULL),
(3,'Pantry','Pantry','Pantry',0,3,'dashboard','N','N',1,'2023-08-03 07:21:36',1,NULL,NULL),
(4,'Community','Community','Community',0,4,'dashboard','N','N',1,'2023-10-20 18:40:30',1,NULL,NULL),
(5,'Profile','Profile','Profile',0,5,'user','N','N',1,'2023-10-20 18:43:31',1,NULL,NULL);

/*Table structure for table `M_UserRights` */

DROP TABLE IF EXISTS `M_UserRights`;

CREATE TABLE `M_UserRights` (
  `UserRightID` bigint(20) NOT NULL,
  `UserGroupID` bigint(20) DEFAULT NULL,
  `UserLoginID` bigint(20) DEFAULT NULL,
  `ModuleID` bigint(20) NOT NULL,
  `ReferenceTableStatusID` int(11) DEFAULT 1 COMMENT '0=inactive, 1=active look to reference table',
  `UserNotes` varchar(1000) DEFAULT NULL,
  `DateAdded` datetime DEFAULT current_timestamp(),
  `AddedByUserLoginID` int(11) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserRightID`),
  KEY `FK_UserRights_UserGroup_ID` (`UserGroupID`),
  KEY `FK_UserRights_Modules_ID` (`ModuleID`),
  KEY `FK_UserRights_UserLoginID` (`UserLoginID`),
  CONSTRAINT `FK_UserRights_ModuleID` FOREIGN KEY (`ModuleID`) REFERENCES `M_UserModule` (`ModuleID`),
  CONSTRAINT `FK_UserRights_UserGroupID` FOREIGN KEY (`UserGroupID`) REFERENCES `M_UserGroup` (`UserGroupID`),
  CONSTRAINT `FK_UserRights_UserLoginID` FOREIGN KEY (`UserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Data for the table `M_UserRights` */

insert  into `M_UserRights`(`UserRightID`,`UserGroupID`,`UserLoginID`,`ModuleID`,`ReferenceTableStatusID`,`UserNotes`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,1,NULL,1,1,NULL,'2023-08-09 19:20:44',1,NULL,NULL),
(2,1,NULL,2,1,NULL,'2023-08-09 19:20:51',1,NULL,NULL),
(3,1,NULL,3,1,NULL,'2023-08-09 19:21:02',1,NULL,NULL),
(4,4,NULL,1,1,NULL,'2023-08-21 21:01:18',1,NULL,NULL),
(5,4,NULL,2,1,NULL,'2023-08-21 21:01:27',1,NULL,NULL),
(6,4,NULL,3,1,NULL,'2023-08-21 21:01:35',1,NULL,NULL),
(7,5,NULL,1,1,NULL,'2023-08-21 21:01:41',1,NULL,NULL),
(8,5,NULL,2,1,NULL,'2023-08-21 21:01:59',1,NULL,NULL),
(9,5,NULL,3,1,NULL,'2023-08-21 21:02:04',1,NULL,NULL),
(10,5,NULL,4,1,NULL,'2023-10-20 18:41:17',1,NULL,NULL),
(11,5,NULL,5,1,NULL,'2023-10-20 18:43:54',1,NULL,NULL),
(12,1,NULL,4,1,NULL,'2023-10-22 10:49:58',1,NULL,NULL),
(13,1,NULL,5,1,NULL,'2023-10-22 10:50:09',1,NULL,NULL),
(15,4,NULL,4,1,NULL,'2023-11-06 17:27:33',1,NULL,NULL),
(16,4,NULL,5,1,NULL,'2023-11-06 17:27:58',1,NULL,NULL);

/*Table structure for table `T_Notification` */

DROP TABLE IF EXISTS `T_Notification`;

CREATE TABLE `T_Notification` (
  `NotificationID` bigint(20) NOT NULL,
  `ProfileID` bigint(20) NOT NULL,
  `NotificationText` text NOT NULL,
  `NotificationDate` date NOT NULL,
  `ReferenceTableStatusID` bigint(20) NOT NULL DEFAULT 1,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`NotificationID`),
  KEY `FK_Notification_ReferenceNotificationID` (`ReferenceTableStatusID`),
  KEY `FK_Notification_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_Notification_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  KEY `FK_Notification_ProfileID` (`ProfileID`),
  CONSTRAINT `FK_Notification_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Notification_ProfileID` FOREIGN KEY (`ProfileID`) REFERENCES `M_Profile` (`ProfileID`),
  CONSTRAINT `FK_Notification_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Notification_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `T_Notification` */

insert  into `T_Notification`(`NotificationID`,`ProfileID`,`NotificationText`,`NotificationDate`,`ReferenceTableStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,1,'You have paid successfully.','2023-11-04',1,'2023-11-04 18:02:05',1,NULL,NULL),
(2,1,'You have paid successfully.','2023-11-04',1,'2023-11-04 18:02:17',1,NULL,NULL);

/*Table structure for table `T_Pantry` */

DROP TABLE IF EXISTS `T_Pantry`;

CREATE TABLE `T_Pantry` (
  `PantryID` bigint(20) NOT NULL,
  `ExpertsID` bigint(20) DEFAULT NULL,
  `IngredientID` bigint(20) NOT NULL,
  `QuantityAvailable` bigint(20) NOT NULL,
  `ReferenceTableStatusID` bigint(20) NOT NULL DEFAULT 1,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PantryID`),
  KEY `FK_Pantry_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  KEY `FK_Pantry_IngredientID` (`IngredientID`),
  KEY `FK_Pantry_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_Pantry_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  KEY `FK_Pantry_ExpertsID` (`ExpertsID`),
  CONSTRAINT `FK_Pantry_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Pantry_ExpertsID` FOREIGN KEY (`ExpertsID`) REFERENCES `MT_Experts` (`ExpertsID`),
  CONSTRAINT `FK_Pantry_IngredientID` FOREIGN KEY (`IngredientID`) REFERENCES `M_Ingredients` (`IngredientsID`),
  CONSTRAINT `FK_Pantry_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Pantry_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_nopad_bin;

/*Data for the table `T_Pantry` */

insert  into `T_Pantry`(`PantryID`,`ExpertsID`,`IngredientID`,`QuantityAvailable`,`ReferenceTableStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,1,1,79,1,'2023-08-23 20:24:47',1,'2023-11-17 19:43:52',23),
(2,1,2,90,1,'2023-08-23 20:43:30',1,NULL,NULL),
(3,NULL,2,100,1,'2023-08-25 21:28:00',1,NULL,NULL),
(4,NULL,3,10,1,'2023-10-20 18:11:30',1,NULL,NULL);

/*Table structure for table `T_Payment` */

DROP TABLE IF EXISTS `T_Payment`;

CREATE TABLE `T_Payment` (
  `PaymentID` bigint(20) NOT NULL,
  `PaymentTypeID` bigint(20) NOT NULL,
  `CheffiesID` bigint(20) NOT NULL,
  `PaymentDetail` text NOT NULL,
  `PaymentDate` date NOT NULL,
  `ReferencePaymentStatusID` bigint(20) NOT NULL DEFAULT 11,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `FK_Payment_ChefftiesID` (`CheffiesID`),
  KEY `FK_Payment_ReferencePaymentID` (`ReferencePaymentStatusID`),
  KEY `FK_Payment_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_Payment_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  KEY `FK_Payment_PaymentTypeID` (`PaymentTypeID`),
  CONSTRAINT `FK_Payment_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Payment_CheffiesID` FOREIGN KEY (`CheffiesID`) REFERENCES `M_Cheffies` (`CheffiesID`),
  CONSTRAINT `FK_Payment_PaymentTypeID` FOREIGN KEY (`PaymentTypeID`) REFERENCES `M_PaymentType` (`ReferenceTableStatusID`),
  CONSTRAINT `FK_Payment_ReferencePaymentStatusID` FOREIGN KEY (`ReferencePaymentStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Payment_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `T_Payment` */

insert  into `T_Payment`(`PaymentID`,`PaymentTypeID`,`CheffiesID`,`PaymentDetail`,`PaymentDate`,`ReferencePaymentStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,1,1,'Paid Nov 3, 2023','2023-11-03',11,'2023-11-03 22:51:41',1,NULL,NULL),
(2,1,1,'Paid Nov 3, 2023','2023-11-03',11,'2023-11-03 22:51:49',1,NULL,NULL),
(3,1,1,'Paid Nov 3, 2023','2023-11-03',11,'2023-11-03 22:52:38',1,NULL,NULL),
(4,1,1,'Paid Nov 3, 2023','2023-11-03',11,'2023-11-03 22:52:40',1,NULL,NULL),
(5,1,1,'Paid Nov 3, 2023','2023-11-03',11,'2023-11-03 22:53:28',1,NULL,NULL),
(6,1,1,'Paid Nov 3, 2023','2023-11-03',11,'2023-11-03 22:54:16',1,NULL,NULL),
(7,1,1,'Paid Nov 4, 2023','2023-11-04',11,'2023-11-04 18:02:05',1,NULL,NULL),
(8,1,1,'Paid Nov 4, 2023','2023-11-04',11,'2023-11-04 18:02:17',1,NULL,NULL);

/*Table structure for table `T_Receipt` */

DROP TABLE IF EXISTS `T_Receipt`;

CREATE TABLE `T_Receipt` (
  `ReceiptID` bigint(20) NOT NULL,
  `PaymentID` bigint(20) DEFAULT NULL,
  `CheffiesID` bigint(20) DEFAULT NULL,
  `ReceiptDetails` text DEFAULT NULL,
  `ReceiptDate` date NOT NULL,
  `ReferenceReceiptStatusID` bigint(20) NOT NULL DEFAULT 13,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ReceiptID`),
  KEY `FK_Receipt_PaymentID` (`PaymentID`),
  KEY `FK_Receipt_ChefftiesID` (`CheffiesID`),
  KEY `FK_Receipt_ReferenceReceiptID` (`ReferenceReceiptStatusID`),
  KEY `FK_Receipt_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_Receipt_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  CONSTRAINT `FK_Receipt_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Receipt_CheffiesID` FOREIGN KEY (`CheffiesID`) REFERENCES `M_Cheffies` (`CheffiesID`),
  CONSTRAINT `FK_Receipt_PaymentID` FOREIGN KEY (`PaymentID`) REFERENCES `T_Payment` (`PaymentID`),
  CONSTRAINT `FK_Receipt_ReferenceReceiptID` FOREIGN KEY (`ReferenceReceiptStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Receipt_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `T_Receipt` */

insert  into `T_Receipt`(`ReceiptID`,`PaymentID`,`CheffiesID`,`ReceiptDetails`,`ReceiptDate`,`ReferenceReceiptStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,1,1,'Paid Nov 3, 2023','2023-11-03',13,'2023-11-03 22:51:41',1,NULL,NULL),
(2,2,1,'Paid Nov 3, 2023','2023-11-03',13,'2023-11-03 22:51:49',1,NULL,NULL),
(3,3,1,'Paid Nov 3, 2023','2023-11-03',13,'2023-11-03 22:52:38',1,NULL,NULL),
(4,4,1,'Paid Nov 3, 2023','2023-11-03',13,'2023-11-03 22:52:40',1,NULL,NULL),
(5,5,1,'Paid Nov 3, 2023','2023-11-03',13,'2023-11-03 22:53:28',1,NULL,NULL),
(6,6,1,'Paid Nov 3, 2023','2023-11-03',13,'2023-11-03 22:54:16',1,NULL,NULL),
(7,7,1,'Paid Nov 4, 2023','2023-11-04',13,'2023-11-04 18:02:05',1,NULL,NULL),
(8,8,1,'Paid Nov 4, 2023','2023-11-04',13,'2023-11-04 18:02:17',1,NULL,NULL);

/*Table structure for table `T_Recipe` */

DROP TABLE IF EXISTS `T_Recipe`;

CREATE TABLE `T_Recipe` (
  `RecipeID` bigint(20) NOT NULL,
  `ProfileID` bigint(20) DEFAULT NULL,
  `ExpertsID` bigint(20) DEFAULT NULL,
  `RestrictionsID` bigint(20) DEFAULT NULL,
  `RecipeName` text NOT NULL,
  `Description` text DEFAULT NULL,
  `CookingInstruction` text DEFAULT NULL,
  `Preparation` time DEFAULT NULL,
  `DifficultyLevel` int(11) DEFAULT NULL,
  `RecipeImage` varchar(50) DEFAULT NULL,
  `MealType` text DEFAULT NULL,
  `VidioUrl` text DEFAULT NULL,
  `ReferenceRecipeStatusID` bigint(20) NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RecipeID`),
  KEY `FK_Recipe_ReferenceRecipeStatusID` (`ReferenceRecipeStatusID`),
  KEY `FK_Recipe_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_Recipe_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  KEY `FK_Recipe_RestrictionsID` (`RestrictionsID`),
  KEY `FK_Recipe_ExpertsID` (`ExpertsID`),
  KEY `FK_Recipe_ProfileID` (`ProfileID`),
  CONSTRAINT `FK_Recipe_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Recipe_ExpertsID` FOREIGN KEY (`ExpertsID`) REFERENCES `MT_Experts` (`ExpertsID`),
  CONSTRAINT `FK_Recipe_ProfileID` FOREIGN KEY (`ProfileID`) REFERENCES `M_Profile` (`ProfileID`),
  CONSTRAINT `FK_Recipe_ReferenceRecipeStatusID` FOREIGN KEY (`ReferenceRecipeStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Recipe_RestrictionsID` FOREIGN KEY (`RestrictionsID`) REFERENCES `T_Restrictions` (`RestrictionsID`),
  CONSTRAINT `FK_Recipe_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `T_Recipe` */

insert  into `T_Recipe`(`RecipeID`,`ProfileID`,`ExpertsID`,`RestrictionsID`,`RecipeName`,`Description`,`CookingInstruction`,`Preparation`,`DifficultyLevel`,`RecipeImage`,`MealType`,`VidioUrl`,`ReferenceRecipeStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,21,1,NULL,'apple pie','it an apple pie','step 1\r\nstep 2\r\nstep 3','00:00:10',1,NULL,'Breakfast',NULL,7,'2023-08-23 20:52:06',1,NULL,NULL),
(2,21,1,NULL,'Orange Candy','Orange Candy','Step 1\r\nStep 2',NULL,4,NULL,'Lunch',NULL,7,'2023-08-23 20:58:15',1,NULL,NULL),
(3,1,1,NULL,'Tuna Tartare','A delightful and invigorating meal showcasing fresh tuna combined with zingy lime juice, complemented by the crispness of red onion and avocado.','[ \"Dice the fresh tuna into small cubes.\", \"Finely chop the red onion and avocado.\",\"Mix the tuna, red onion, and avocado in a bowl.\", \"Drizzle lime juice over the mixture and gently toss.\",\"Serve chilled and enjoy!\",]',NULL,NULL,NULL,'Breakfast',NULL,7,'2023-11-02 10:55:38',1,NULL,NULL),
(4,1,1,NULL,'Tortilla Breakfast Wrap','Taking inspiration from the classic Egg and Cheese Bread Omelet, we\'ve crafted a quick and convenient breakfast wrap that includes tortilla, eggs, spinach, cheese, and ham, all prepared effortlessly in a single skillet. It\'s your perfect on-the-go breakfast option.',NULL,NULL,NULL,NULL,'Breakfast',NULL,7,'2023-11-02 10:56:08',1,NULL,NULL),
(5,1,1,NULL,'Ramen','A comforting bowl of ramen featuring slurp-worthy noodles, a savory soy sauce-based broth, tender vegetables, and perfectly boiled eggs.','\"Boil the ramen noodles according to package instructions.\",\"In a pot, bring water to a simmer and add soy sauce for the broth.\",\"Add chopped vegetables and let them cook until tender.\",  \"Boil eggs to your desired doneness, then peel and slice them.\",  \"Assemble the ramen bowls by placing cooked noodles, vegetables, and egg slices.\",\"Ladle the hot broth over the ingredients and get ready to enjoy your homemade ramen!\",',NULL,NULL,NULL,'Dinner',NULL,7,'2023-11-02 10:56:39',1,NULL,NULL),
(6,1,1,NULL,'Golden Egg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,'2023-11-02 10:57:02',1,NULL,NULL),
(7,1,1,NULL,'Golden Egg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,'2023-11-02 10:57:39',1,NULL,NULL),
(8,1,1,NULL,'Golden Egg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,'2023-11-02 10:58:07',1,NULL,NULL),
(9,1,1,NULL,'Golden Egg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,'2023-11-02 10:58:53',1,NULL,NULL),
(10,23,NULL,4,'Corn Beef','good for diet',NULL,'10:00:00',2,NULL,NULL,NULL,7,'2023-11-17 18:28:41',23,NULL,NULL),
(11,23,NULL,NULL,'Tunaaa','Bsbsh',NULL,'00:00:10',1,NULL,NULL,NULL,7,'2023-11-17 19:43:52',23,NULL,NULL);

/*Table structure for table `T_RecipeIngredients` */

DROP TABLE IF EXISTS `T_RecipeIngredients`;

CREATE TABLE `T_RecipeIngredients` (
  `RecipeIngredientsID` bigint(20) NOT NULL,
  `RecipeID` bigint(20) DEFAULT NULL,
  `IngredientsID` bigint(20) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Measurement` varchar(50) DEFAULT NULL,
  `ReferenceRecipeStatusID` bigint(20) DEFAULT NULL,
  `DateAdded` datetime DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RecipeIngredientsID`),
  KEY `FK_RecipeIngredients_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_RecipeIngredients_IngredientsID` (`IngredientsID`),
  KEY `FK_RecipeIngredients_ReferenceRecipeStatusID` (`ReferenceRecipeStatusID`),
  KEY `FK_RecipeIngredients_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  KEY `FK_RecipeIngredients_RecipeID` (`RecipeID`),
  CONSTRAINT `FK_RecipeIngredients_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_RecipeIngredients_IngredientsID` FOREIGN KEY (`IngredientsID`) REFERENCES `M_Ingredients` (`IngredientsID`),
  CONSTRAINT `FK_RecipeIngredients_RecipeID` FOREIGN KEY (`RecipeID`) REFERENCES `T_Recipe` (`RecipeID`),
  CONSTRAINT `FK_RecipeIngredients_ReferenceRecipeStatusID` FOREIGN KEY (`ReferenceRecipeStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_RecipeIngredients_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `T_RecipeIngredients` */

insert  into `T_RecipeIngredients`(`RecipeIngredientsID`,`RecipeID`,`IngredientsID`,`Quantity`,`Measurement`,`ReferenceRecipeStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,1,1,10,'pieces',7,'2023-08-23 20:40:40',1,NULL,NULL),
(2,2,2,10,'pieces',7,'2023-08-23 20:59:37',1,NULL,NULL),
(3,3,3,1,'pcs',7,'2023-11-02 10:55:38',NULL,NULL,1),
(4,4,1,1,'pcs',7,'2023-11-02 10:56:08',NULL,NULL,1),
(5,5,1,1,'pcs',7,'2023-11-02 10:56:39',NULL,NULL,1),
(6,6,1,1,'pcs',7,'2023-11-02 10:57:02',NULL,NULL,1),
(7,7,1,1,'pcs',7,'2023-11-02 10:57:39',NULL,NULL,1),
(8,8,1,1,'pcs',7,'2023-11-02 10:58:07',NULL,NULL,1),
(9,9,1,1,'pcs',7,'2023-11-02 10:58:53',NULL,NULL,1),
(10,1,3,1,NULL,NULL,'2023-11-09 11:20:40',NULL,NULL,NULL),
(11,10,1,2,'pcs',7,'2023-11-17 18:28:41',NULL,NULL,23),
(12,11,1,2,'pcs',7,'2023-11-17 19:43:52',NULL,NULL,23);

/*Table structure for table `T_RecipeRestriction` */

DROP TABLE IF EXISTS `T_RecipeRestriction`;

CREATE TABLE `T_RecipeRestriction` (
  `RecipeRestrictionID` bigint(20) NOT NULL,
  `RecipeID` bigint(20) NOT NULL,
  `RestrictionsID` bigint(20) NOT NULL,
  `ReferenceTableStatusID` bigint(20) NOT NULL DEFAULT 1,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RecipeRestrictionID`),
  KEY `FK_RecipeRestriction_RecipeID` (`RecipeID`),
  KEY `FK_RecipeRestriction_RestrictionsID` (`RestrictionsID`),
  KEY `FK_RecipeRestriction_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  CONSTRAINT `FK_RecipeRestriction_RecipeID` FOREIGN KEY (`RecipeID`) REFERENCES `T_Recipe` (`RecipeID`),
  CONSTRAINT `FK_RecipeRestriction_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_RecipeRestriction_RestrictionsID` FOREIGN KEY (`RestrictionsID`) REFERENCES `T_Restrictions` (`RestrictionsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `T_RecipeRestriction` */

/*Table structure for table `T_Restrictions` */

DROP TABLE IF EXISTS `T_Restrictions`;

CREATE TABLE `T_Restrictions` (
  `RestrictionsID` bigint(20) NOT NULL,
  `ProfileID` bigint(20) NOT NULL,
  `HealthProblemsID` bigint(20) DEFAULT NULL,
  `ReligionID` bigint(20) DEFAULT NULL,
  `RestrictionType` varchar(20) NOT NULL,
  `ReferenceRestrictionID` bigint(20) NOT NULL DEFAULT 9,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RestrictionsID`),
  KEY `FK_Restrictions_HealthProblemsID` (`HealthProblemsID`),
  KEY `FK_Restrictions_ReligionID` (`ReligionID`),
  KEY `FK_Restrictions_ReferenceRestrictionID` (`ReferenceRestrictionID`),
  KEY `FK_Restrictions_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_Restrictions_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  KEY `FK_Restrictions_ProfileID` (`ProfileID`),
  CONSTRAINT `FK_Restrictions_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Restrictions_HealthProblemsID` FOREIGN KEY (`HealthProblemsID`) REFERENCES `M_HealthProblems` (`HealthProblemsID`),
  CONSTRAINT `FK_Restrictions_ProfileID` FOREIGN KEY (`ProfileID`) REFERENCES `M_Profile` (`ProfileID`),
  CONSTRAINT `FK_Restrictions_ReferenceRestrictionID` FOREIGN KEY (`ReferenceRestrictionID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Restrictions_ReligionID` FOREIGN KEY (`ReligionID`) REFERENCES `M_Religion` (`ReligionID`),
  CONSTRAINT `FK_Restrictions_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `T_Restrictions` */

insert  into `T_Restrictions`(`RestrictionsID`,`ProfileID`,`HealthProblemsID`,`ReligionID`,`RestrictionType`,`ReferenceRestrictionID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,22,1,1,'none',10,'2023-11-02 19:52:00',1,'2023-11-15 12:56:45',23),
(2,23,1,1,'none',9,'2023-11-06 14:43:24',1,NULL,NULL),
(3,23,1,1,'none',9,'2023-11-15 12:44:03',23,NULL,NULL),
(4,23,1,1,'none',9,'2023-11-15 12:44:07',23,NULL,NULL),
(5,23,1,1,'none',9,'2023-11-15 12:53:16',23,NULL,NULL);

/*Table structure for table `T_Subscription` */

DROP TABLE IF EXISTS `T_Subscription`;

CREATE TABLE `T_Subscription` (
  `SubscriptionID` bigint(20) NOT NULL,
  `CheffiesID` bigint(20) NOT NULL,
  `CheffiesName` varchar(100) NOT NULL,
  `PaymentDate` date NOT NULL,
  `SubscriptionEndDate` date NOT NULL,
  `ReferenceSubscriptionStatusID` bigint(20) NOT NULL DEFAULT 15,
  `ReferenceTableStatusID` bigint(20) NOT NULL DEFAULT 1,
  `DateAdded` datetime DEFAULT current_timestamp(),
  `AddedByUserLoginID` bigint(20) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdatedByUserLoginID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SubscriptionID`),
  KEY `FK_Subscription_CheffiesID` (`CheffiesID`),
  KEY `FK_Subscription_ReferenceSubscriptionStatusID` (`ReferenceSubscriptionStatusID`),
  KEY `FK_Subscription_ReferenceTableStatusID` (`ReferenceTableStatusID`),
  KEY `FK_Subscription_AddedByUserLoginID` (`AddedByUserLoginID`),
  KEY `FK_Subscription_UpdatedByUserLoginID` (`UpdatedByUserLoginID`),
  CONSTRAINT `FK_Subscription_AddedByUserLoginID` FOREIGN KEY (`AddedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`),
  CONSTRAINT `FK_Subscription_CheffiesID` FOREIGN KEY (`CheffiesID`) REFERENCES `M_Cheffies` (`CheffiesID`),
  CONSTRAINT `FK_Subscription_ReferenceSubscriptionStatusID` FOREIGN KEY (`ReferenceSubscriptionStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Subscription_ReferenceTableStatusID` FOREIGN KEY (`ReferenceTableStatusID`) REFERENCES `M_Reference` (`ReferenceID`),
  CONSTRAINT `FK_Subscription_UpdatedByUserLoginID` FOREIGN KEY (`UpdatedByUserLoginID`) REFERENCES `M_UserLogin` (`UserLoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `T_Subscription` */

insert  into `T_Subscription`(`SubscriptionID`,`CheffiesID`,`CheffiesName`,`PaymentDate`,`SubscriptionEndDate`,`ReferenceSubscriptionStatusID`,`ReferenceTableStatusID`,`DateAdded`,`AddedByUserLoginID`,`DateUpdated`,`UpdatedByUserLoginID`) values 
(1,1,'Tobe Supangan ','2023-11-03','2023-12-03',15,1,'2023-11-03 22:51:41',1,NULL,NULL),
(2,1,'Tobe Supangan ','2023-11-03','2023-12-03',15,1,'2023-11-03 22:51:49',1,NULL,NULL),
(3,1,'Tobe Supangan ','2023-11-03','2023-12-03',15,1,'2023-11-03 22:52:38',1,NULL,NULL),
(4,1,'Tobe Supangan ','2023-11-03','2023-12-03',15,1,'2023-11-03 22:52:40',1,NULL,NULL),
(5,1,'Tobe Supangan ','2023-11-03','2023-12-03',15,1,'2023-11-03 22:53:28',1,NULL,NULL),
(6,1,'Tobe Supangan ','2023-11-03','2023-12-03',15,1,'2023-11-03 22:54:16',1,NULL,NULL),
(7,1,'Tobe Supangan ','2023-11-04','2023-12-04',15,1,'2023-11-04 18:02:05',1,NULL,NULL),
(8,1,'Tobe Supangan ','2023-11-04','2023-12-04',15,1,'2023-11-04 18:02:17',1,NULL,NULL),
(9,2,'Joshua Gimao','2023-11-05','2023-11-30',15,1,'2023-11-05 16:14:22',1,NULL,NULL);

/* Function  structure for function  `fn_login` */

/*!50003 DROP FUNCTION IF EXISTS `fn_login` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_login`($UserID			bigint,	
	$UserLogin		VARCHAR(100),
	$UserPassword		VARCHAR(200),
	$Flag			INT
) RETURNS varchar(500) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
    DETERMINISTIC
BEGIN
  
  DECLARE $_Result VARCHAR(500);
  
  CASE 
	WHEN $Flag = 1 THEN
             BEGIN
			/*
				Author          : 
				Table Accessed  : 
				Description     : verify login profile
				DateCreated     : 
				Time 		: 8:43 PM
				
				Testing  : 
				select fn_login(1,null,1)
			*/     
			
			SET @_GroupIDs := (SELECT fn_usergroup($UserID ,NULL,1));   
			IF EXISTS(
					SELECT
						 `ProfileID`
					FROM (
						SELECT  DISTINCT
								 F.`ProfileID`
						FROM M_UserRights A
							JOIN  M_UserLogin C ON C.`UserLoginID` 	= A.`UserLoginID`
							JOIN  M_Profile F ON F.ProfileID	= C.ProfileID
							JOIN  M_UserModule I ON I.`ModuleID`	= A.ModuleID     
						WHERE	
									C.`UserLoginName` 		= TRIM($UserLogin)
								AND 	C.`UserLoginPassword`  		= fn_passwordgenerator(TRIM($UserPassword))														
								AND 	A.`ReferenceTableStatusID` 	= 1 -- active
								AND 	C.`ReferenceTableStatusID` 	= 1 -- active
								AND 	F.`ReferenceTableStatusID` 	= 1 -- active					
								AND 	I.`ReferenceTableStatusID` 	= 1 -- active				
							
						UNION ALL
							
						SELECT  DISTINCT
								 F.`ProfileID`
						FROM M_UserRights A
							JOIN  M_UserGroup 		G ON G.UserGroupID 		= A.UserGroupID
							JOIN  M_UserGroupMember 	H ON H.UserGroupID		= G.UserGroupID
							JOIN  M_UserLogin 		C ON C.UserLoginID 		= H.`UserLoginID`
							JOIN  M_Profile 		F ON F.ProfileID		= C.ProfileID
							JOIN  M_UserModule 		I ON I.`ModuleID` 		= A.ModuleID AND I.ModuleController IS NOT NULL
						WHERE
								FIND_IN_SET(A.UserGroupID, @_GroupIDs)
								AND	C.`UserLoginName` 		= TRIM($UserLogin)
								AND 	C.`UserLoginPassword`  		= fn_passwordgenerator(TRIM($UserPassword))														
								AND 	A.`ReferenceTableStatusID` 	= 1 -- active
								AND 	G.`ReferenceTableStatusID` 	= 1 -- active
								AND 	C.`ReferenceTableStatusID` 	= 1 -- active
								AND 	F.`ReferenceTableStatusID` 	= 1 -- active					
								AND 	I.`ReferenceTableStatusID` 	= 1 -- active				
					) AS Login LIMIT 1			
			) THEN
			   
				SET $_Result := 'Y';
			ELSE
				SET $_Result := 'N';
			END IF;
			
             END; -- end sa flag 1            
 	WHEN $Flag = 2 THEN
             BEGIN
			/*
				Author          : 
				Table Accessed  : 
				Description     : get the profileid
				DateCreated     : 
				Time 		: 8:43 PM
				
				Testing  : 
				select fn_login(1,null,2)
			*/     
		SET $_Result = (Select `ProfileID` FROM `M_UserLogin` WHERE `UserLoginID`= $UserID);
			
             END; -- end sa flag 2            
            
  END CASE;
		  	
  RETURN $_Result;
END */$$
DELIMITER ;

/* Function  structure for function  `fn_passwordgenerator` */

/*!50003 DROP FUNCTION IF EXISTS `fn_passwordgenerator` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`dzi`@`localhost` FUNCTION `fn_passwordgenerator`($passwd TEXT
) RETURNS text CHARSET latin1 COLLATE latin1_swedish_ci
BEGIN
/*Testing:
	select fn_passwordgenerator('123')
*/
  DECLARE $_salt 	TEXT;
  DECLARE $_hashcode	TEXT;
  
  SET $_salt 		= (SELECT SHA1(CONCAT('Kshdnru1*(#$dkjtnda0!@#fdght', $passwd)) AS salt);
  SET $_hashcode 	= (SELECT SHA1(CONCAT($_salt, $passwd)) AS hash_value);  
  	
  RETURN $_hashcode;
END */$$
DELIMITER ;

/* Function  structure for function  `fn_profile` */

/*!50003 DROP FUNCTION IF EXISTS `fn_profile` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_profile`($TableID			BIGINT,	
	$SearchValue		VARCHAR(100),
	$Flag			INT
) RETURNS varchar(500) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
    DETERMINISTIC
BEGIN
  
  DECLARE $_Result VARCHAR(500);
  
  CASE 
	WHEN $Flag = 1 THEN
             BEGIN
			/*
				Author          : 
				Table Accessed  : 
				Description     : display name from cheffiesid
				DateCreated     : 
				Time 		: 8:43 PM
				
				Testing  : 
				select fn_profile(1,null,1)
			*/     
			
			SET $_Result = (
				SELECT CONCAT(`ProfileFirstName`,' ',`ProfileLastName`,' ',IFNULl(`ProfileExtName`,''))
				FROM `M_Cheffies` A
				INNER JOIN `M_Profile` B ON A.`ProfileID` = B.`ProfileID`
				Where A.`CheffiesID` = $TableID
			);
			
             END; -- end sa flag 1            
  END CASE;
		  	
  RETURN $_Result;
END */$$
DELIMITER ;

/* Function  structure for function  `fn_usergroup` */

/*!50003 DROP FUNCTION IF EXISTS `fn_usergroup` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `fn_usergroup`($TableID		BIGINT,
	$SearchValue		VARCHAR(1000),
	$Flag			INT
) RETURNS varchar(500) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
    DETERMINISTIC
BEGIN
  DECLARE $_Result VARCHAR(500);
  
  CASE 
	WHEN $Flag = 1 THEN
             BEGIN
			/*
				Author          : Armando Garing II
				Table Accessed  : 
				Description     : 
				DateCreated     : Sept 09, 2022
				Time 		: 8:38 PM
				
				Testing  : 
				select fn_usergroup(1,null,1)
	
			*/             
			SET $_Result := (			
					SELECT 
					    group_concat(DISTINCT `UserGroupID` )
					FROM `M_UserGroupMember` 
					WHERE 
					  `UserLoginID`   	   	= $TableID
					AND `ReferenceTableStatusID` 	= 1 
					AND `ExpiryDate` IS NULL 
					OR (`ExpiryDate` >= NOW() 
					   AND `ReferenceTableStatusID` = 1 
					   AND `UserLoginID` = $TableID)
					order by UserGroupID asc   
			);
			
             END; -- end sa flag 1  
  END CASE;
		  	
  RETURN $_Result;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_cheffies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_cheffies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cheffies`(
	  OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_CheffiesID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_UserGroupID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ProfileID			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_ReligionID			VARCHAR(100) DEFAULT NULL;
	DECLARE $_HealthProblemsID		VARCHAR(100) DEFAULT NULL;
	DECLARE $_PantryID			VARCHAR(100) DEFAULT NULL;
	
	
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : August 20, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_cheffies(
					@ReturnIsSuccess		
					,'{
						 "CheffiesID": "1"	
						,"UserGroupID": "5"
						,"ProfileID": "1"
						,"ReligionID": "1"
						,"HealthProblemsID": "1"
						,"PantryID": "1"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'cheffies_1'; 		
			SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));	
			
			IF $_ProfileID 	= 'NULL' OR $_ProfileID	= '' THEN SET $_ProfileID := NULL; END IF;			
			
			
			 
			 SELECT 
			    M_Cheffies.CheffiesID,
			    M_Cheffies.UserGroupID,
			    M_Cheffies.ProfileID,
			    M_Cheffies.ReligionID,
			    M_Cheffies.HealthProblemsID,
			    '1'					AS 'IsSuccess'
			    ,'Success' 				AS 'Result'
			    ,$_View 				AS 'View'
			    ,M_Profile.ProfileFirstName,
			    M_Profile.ProfileLastName
			FROM M_Cheffies
			INNER JOIN M_Profile ON M_Cheffies.ProfileID = M_Profile.ProfileID
			WHERE M_Cheffies.ProfileID = $_ProfileID;
			 
		END; -- end of flag 1		
	    WHEN 2 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_cheffies(
					@ReturnIsSuccess		
					,'{
						 "Delimeter": "SP"					
						,"TransactBy": "22"						
						,"Flag": "2"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'cheffies_2'; 		
			
			IF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				
				SELECT 
					A.`CheffiesID`
					,B.`HealthCondition`
					,B.`Allergies`
					,B.`HealthCondition`
					,B.`MedicalHistory`
					,'1'					AS 'IsSuccess'
					,'Success' 				AS 'Result'
					,$_View 				AS 'View'
				FROM `M_Cheffies` A
				INNER JOIN `M_HealthProblems` B ON A.`HealthProblemsID` = B.`HealthProblemsID`
				WHERE A.`ProfileID` =fn_login($_TransactBy,NULL,NULL,2)
				AND B.`ReferenceTableStatusID` = 1;
			 END IF; 
		END; -- end of flag 2	    				
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_CheffiesID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`CheffiesID`
				,B.`ProfileID`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `M_Cheffies` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`CheffiesID` = $_CheffiesID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_community` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_community` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_community`(
	  OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_CommunityID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_CheffiesID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ExpertsID			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_Content			VARCHAR(100) DEFAULT NULL;
	DECLARE $_ContentImage			VARCHAR(100) DEFAULT NULL;
	DECLARE $_RecipeName			VARCHAR(100) DEFAULT NULL;
		
	
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : August 20, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_community(
					@ReturnIsSuccess		
					,'{
						 "CommunityID": "1"	
						,"CheffiesID": "1"
						,"ExpertsID": ""
						,"Content": ""
						,"ContentImage": ""
						,"ReferenceTableStatusID": "1"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'community_1'; 		
			-- SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));	
			
			-- IF $_ProfileID 	= 'NULL' OR $_ProfileID	= '' THEN SET $_ProfileID := NULL; END IF;			
			
			 SELECT 
				`CommunityID`
				,`CheffiesID`
				,`ExpertsID`
				,`Content`
				,`ContentImage`
				, `ReferenceTableStatusID` 
			FROM 
				`MT_Community` 
			WHERE 
				`ReferenceTableStatusID` = 1;
			 
		END; -- end of flag 1
	
	 WHEN 2 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_community(
					@ReturnIsSuccess		
					,'{
						 "RecipeName": "ap"	
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "2"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'community_2'; 		
			SET $_RecipeName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeName")));
			
			IF $_RecipeName	= 'NULL' OR $_RecipeName	= '' THEN SET $_RecipeName := NULL; END IF;				
			
				
			SELECT 	 A.`RecipeName`
				,A.`Description`
				,A.`RecipeImage`
				,A.`MealType`
				,CONCAT(B.`ProfileFirstName`,' ',`ProfileLastName`) AS Fullname
				,B.`ProfilePic`
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `T_Recipe` A
			INNER JOIN `M_Profile` B ON A.`ProfileID` = B.`ProfileID`
			WHERE A.`RecipeName` LIKE IFNULL(CONCAT('%',$_RecipeName,'%'),A.`RecipeName`)
			AND A.`ReferenceRecipeStatusID` = 7;
				    
		
		END; -- end of flag 2
	 WHEN 3 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_community(
					@ReturnIsSuccess		
					,'{
						 "RecipeName": "ap"	
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "2"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'community_3'; 		
			SET $_RecipeName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeName")));
			
			IF $_RecipeName	= 'NULL' OR $_RecipeName	= '' THEN SET $_RecipeName := NULL; END IF;				
							
			SELECT 	 A.`RecipeName`
				,A.`Description`
				,A.`RecipeImage`
				,A.`MealType`
				,CONCAT(B.`ProfileFirstName`,' ',`ProfileLastName`) AS ExpertsName
				,B.`ProfilePic`
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `T_Recipe` A
			INNER JOIN `M_Profile` B ON A.`ProfileID` = B.`ProfileID`
			INNER JOIN `MT_Community` C ON A.RecipeID = C.RecipeID
			WHERE A.`RecipeName` LIKE IFNULL(CONCAT('%',$_RecipeName,'%'),A.`RecipeName`)
			AND A.`ReferenceRecipeStatusID` = 7
			AND C.`ProfileID` = `fn_login`($_TransactBy ,null,null,2);
				    
		END; -- end of flag 3			
	    				
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_CommunityID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`CommunityID`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `MT_Community` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`CommunityID` = $_CommunityID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_experts` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_experts` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_experts`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_ExpertsID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ProfileID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_LicenseID			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_PantryID			VARCHAR(100) DEFAULT NULL;
	DECLARE $_Points			VARCHAR(100) DEFAULT NULL;
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : August 20, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_experts(
					@ReturnIsSuccess		
					,'{
						 "ProfileID": "12345"	
						,"LicenseID": "1"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'experts_1'; 		
			SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));		
			SET $_LicenseID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LicenseID")));	
			
			IF $_ProfileID 	= 'NULL' OR $_ProfileID	= '' THEN SET $_ProfileID	:= NULL; END IF;			
			IF $_LicenseID 	= 'NULL' OR $_LicenseID	= '' THEN SET $_LicenseID  	:= NULL; END IF;			
			
			IF $_ProfileID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'ProfileID is required.';												
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_ExpertsID		:= (SELECT IFNULL(MAX(`ExpertsID`), 0) + 1 FROM `MT_Experts`);
				
				INSERT INTO `MT_Experts`(
					 `ExpertsID`
					,`ProfileID`
					,`LicenseID`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_ExpertsID
					,$_ProfileID
					,$_LicenseID
					,$_TransactBy	
				    );
				    
				IF ROW_COUNT() > 0 THEN		
					IF $_Delimiter = 'SP' THEN -- return para sa SP
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 100;			
					
					ELSE			  -- return para sa model
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 103;			
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No Experts is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 1		
	    WHEN 2 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : August 20, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_experts(
					@ReturnIsSuccess		
					,'{
						 "ProfileID": "12345"	
						,"LicenseID": "1"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'experts_2'; 		
			SET $_ExpertsID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ExpertID")));	
			
			IF $_ExpertsID 	= 'NULL' OR $_ExpertsID	= '' THEN SET $_ExpertsID	:= NULL; END IF;			
			
			IF $_ExpertsID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'ExpertsID is required.';												
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				 Update MT_Experts
				 SET `ReferenceExpertsStatusID` = 6
				     ,`UpdatedByUserLogInID`  	= $_TransactBy
				     ,`DateUpdated` 		= now()
				 WHERE `ExpertsID` = $_ExpertsID;
				 
				IF ROW_COUNT() > 0 THEN		
					IF $_Delimiter = 'SP' THEN -- return para sa SP
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 100;			
					
					ELSE			  -- return para sa model
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 103;			
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No Experts is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 2	
	 WHEN 3 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : August 20, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_experts(
					@ReturnIsSuccess		
					,'{
						
						"Delimeter": "SP"					
						,"TransactBy": "10"						
						,"Flag": "3"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'experts_3'; 				
			/*
			----------------------------------------------------------------------------------
							MEAL SUGGESTIONS SIDE
			----------------------------------------------------------------------------------
			*/
			IF $_TransactBy IS NULL THEN 
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';	
			ELSE
				SELECT 
					B.`RecipeName`
					,B.`RecipeImage`
					,B.`Description`
					,B.`DateAdded`
					,'1'					AS 'IsSuccess'
					,'Success' 				AS 'Result'
					,$_View 				AS 'View'
				FROM `MT_Experts` A
				INNER JOIN `T_Recipe` B ON A.`ExpertsID` = B.`ExpertsID`
				WHERE `ReferenceRecipeStatusID` = 7
				AND A.`ProfileID` = fn_login($_TransactBy,NULL,NULL,2);	 
			END IF; 
		END; -- end of flag 3				
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_ExpertsID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`ExpertsID`
				,A.`ProfileID`
				,A.`LicenseID`
				,A.`PantryID`
				,A.`Points`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
					
					
			FROM `MT_Experts` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`ExpertsID` = $_ExpertsID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ingredients` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ingredients` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ingredients`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_IngredientsID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ingredientsName		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_Category			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_NutritionalInformation	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_ingredients(
					@ReturnIsSuccess		
					,'{
						 "IngredientsName": "Onion"	
						,"Category": "Spicy"
						,"NutritionalInformation": "Vitamins"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'ingredients_1'; 		
			SET $_IngredientsName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.IngredientsName")));
			SET $_Category := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Category")));	
			SET $_NutritionalInformation := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.NutritionalInformation")));	
			
			IF $_IngredientsName 	= 'NULL' OR $_IngredientsName		= '' THEN SET $_IngredientsName	:= NULL; END IF;
			IF $_Category	= 'NULL' OR $_Category	= '' THEN SET $_Category	:= NULL; END IF;		
			IF $_NutritionalInformation	= 'NULL' OR $_NutritionalInformation	= '' THEN SET $_NutritionalInformation	:= NULL; END IF;				
			
			IF $_IngredientsName IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'IngredientsName is required.';
			ELSEIF $_Category IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'Category is required.';												
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_IngredientsID		:= (SELECT IFNULL(MAX(`IngredientsID`), 0) + 1 FROM `M_Ingredients`);
				
				INSERT INTO `M_Ingredients`(
					 `IngredientsID`
					,`IngredientsName`
					,`Category`
					,`NutritionalInformation`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_IngredientsID
					,$_IngredientsName
					,$_Category
					,$_NutritionalInformation
					,$_TransactBy	
				    );
				    
				IF ROW_COUNT() > 0 THEN		
					IF $_Delimiter = 'SP' THEN -- return para sa SP
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 100;			
					
					ELSE			  -- return para sa model
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 103;			
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No Ingredients is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 1		
	    WHEN 2 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_ingredients(
					@ReturnIsSuccess		
					,'{
						 "IngredientsName": "Onion"	
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "2"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'ingredients_2'; 		
			SET $_IngredientsName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.IngredientsName")));
			
			IF $_IngredientsName 	= 'NULL' OR $_IngredientsName	= '' THEN SET $_IngredientsName	:= NULL; END IF;				
			
			IF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				
				SET @_ProfileID = fn_login($_TransactBy,NULL,NULL,2);
				IF EXISTS(SELECT `CheffiesID` FROM `M_Cheffies` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
					
					SELECT   C.`IngredientsID`
						,C.`IngredientsName`
						,'No'					AS 'IsExperts'
						,@_ProfileID				AS 'ProfileID'
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM `M_Ingredients` C 
					WHERE C.`IngredientsName` LIKE IFNULL(CONCAT('%',$_IngredientsName,'%'),C.`IngredientsName`)
					AND C.`ReferenceTableStatusID` = 1;
					
				ELSEIF EXISTS(SELECT `ExpertsID` FROM `MT_Experts` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
				
					SELECT   B.`IngredientID`
						,C.`IngredientsName`
						,B.`QuantityAvailable`
						,A.`ProfileID`
						,'Yes'					AS 'IsExperts'
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM `MT_Experts` A
					INNER JOIN `T_Pantry` B ON A.`ExpertsID` = B.`ExpertsID`
					INNER JOIN `M_Ingredients` C ON B.`IngredientID` = C.`IngredientsID`
					WHERE A.`ProfileID` = fn_login($_TransactBy,NULL,NULL,2)
					AND C.`IngredientsName` LIKE IFNULL(CONCAT('%',$_IngredientsName,'%'),C.`IngredientsName`)
					AND C.`ReferenceTableStatusID` = 1
					AND B.`ReferenceTableStatusID` = 1;
				 END IF;  
			 END IF;
		END; -- end of flag 2	
	    WHEN 3 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_ingredients(
					@ReturnIsSuccess		
					,'{
						 "IngredientsName": "Onion"	
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "3"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'ingredients_3'; 		
			SET $_IngredientsName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.IngredientsName")));
			
			IF $_IngredientsName 	= 'NULL' OR $_IngredientsName		= '' THEN SET $_IngredientsName	:= NULL; END IF;				
			
			IF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET @_ProfileID = fn_login($_TransactBy,NULL,NULL,2);
				IF EXISTS(SELECT `CheffiesID` FROM `M_Cheffies` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
					
					SELECT   E.`RecipeID`
						,E.`RecipeName`
						,C.`IngredientsName`
						,E.`CookingInstruction`
						,E.`Description`
						,E.`RecipeImage`
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM  `M_Ingredients` C 
					INNER JOIN `T_RecipeIngredients` D ON C.`IngredientsID` = D.`IngredientsID`
					INNER JOIN `T_Recipe` E ON D.`RecipeID` = E.`RecipeID`
					WHERE C.`IngredientsName` LIKE IFNULL(CONCAT('%',$_IngredientsName,'%'),C.`IngredientsName`)
					AND C.`ReferenceTableStatusID` = 1;
					
				ELSEIF EXISTS(SELECT `ExpertsID` FROM `MT_Experts` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
				
					SELECT   E.`RecipeID`
						,E.`RecipeName`
						,C.`IngredientsName`
						,E.`CookingInstruction`
						,E.`Description`
						,E.`RecipeImage`
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM `MT_Experts` A
					INNER JOIN `T_Pantry` B ON A.`ExpertsID` = B.`ExpertsID`
					INNER JOIN `M_Ingredients` C ON B.`IngredientID` = C.`IngredientsID`
					INNER JOIN `T_RecipeIngredients` D ON C.`IngredientsID` = D.`IngredientsID`
					INNER JOIN `T_Recipe` E ON D.`RecipeID` = E.`RecipeID`
					WHERE A.`ProfileID` = fn_login($_TransactBy,NULL,NULL,2)
					AND C.`IngredientsName` LIKE IFNULL(CONCAT('%',$_IngredientsName,'%'),C.`IngredientsName`)
					AND C.`ReferenceTableStatusID` = 1
					AND B.`ReferenceTableStatusID` = 1;
				 END IF; 
			 END IF;
		END; -- end of flag 3		
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_IngredientsID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`IngredientsID`
				,A.`IngredientsName`
				,A.`Category`
				,A.`NutritionalInformation`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
					
					
			FROM `M_Ingredients` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`IngredientsID` = $_IngredientsID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_license` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_license` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_license`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_LicenseID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_LicenseType			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_Certificates			VARCHAR(100) DEFAULT NULL;
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : August 20, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_license(
					@ReturnIsSuccess		
					,'{
						 "LicenseType": "12345"	
						,"Certiificate": ""
						,"Delimert": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'license_1'; 		
			SET $_LicenseType := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LicenseType")));		
			SET $_Certificates := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Certificates")));	
			
			IF $_LicenseType 	= 'NULL' OR $_LicenseType	= '' THEN SET $_LicenseType	:= NULL; END IF;			
			IF $_Certificates 	= 'NULL' OR $_Certificates	= '' THEN SET $_Certificates  	:= NULL; END IF;			
			
			IF $_LicenseType IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'LicenseType is required.';												
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_LicenseID		:= (SELECT IFNULL(MAX(`LicenseID`), 0) + 1 FROM `M_License`);
				
				INSERT INTO `M_License`(
					 `LicenseID`
					,`LicenseType`
					,`Certificates`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_LicenseID
					,$_LicenseType
					,$_Certificates
					,$_TransactBy	
				    );
				    
				IF ROW_COUNT() > 0 THEN		
					IF $_Delimiter = 'SP' THEN -- return para sa SP
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 100;			
					
					ELSE			  -- return para sa model
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 103;			
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No License is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 1						
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_LicenseID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`LicenseID`
				,A.`LicenseType`
				,A.`Certificates`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
					
					
			FROM `M_License` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`LicenseID` = $_LicenseID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_mealplan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_mealplan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mealplan`(
	  OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_MealPlanID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ProfileID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_RecipeID			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_MealType			VARCHAR(100) DEFAULT NULL;
	DECLARE $_MealPlanDate		VARCHAR(100) DEFAULT NULL;
	
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
		WHEN 1 THEN 
			 BEGIN
				/*
					Author		: 
					Table Accessed  : 
					Description     :  Insert New meal plan
					DateCreated     : Nov 15, 2022
					Time 		:
					
					Module used:		
							
					CALL sp_mealplan(@ReturnIsSuccess, 
									 '{"RecipeID": "1", 
										  "MealType": "Lunch", 
										  "MealDate": "2023-01-01 ", 
										  "TransactBy": 23, 
										  "Flag": 1 
									}'
							)
						
				*/
				
				
				SET $_View 		:= 'mealplan_1'; 		
				SET $_RecipeID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeID")));	
				SET $_MealType  := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.MealType")));	
				SET $_MealPlanDate := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Date")));	
					
				IF $_RecipeID	= 'NULL' OR $_RecipeID	= '' THEN SET $_RecipeID := NULL; END IF;
				IF $_MealType	= 'NULL' OR $_MealType	= '' THEN SET $_MealType := NULL; END IF;
				IF $_MealPlanDate	= 'NULL' OR $_MealPlanDate	= '' THEN SET $_MealPlanDate := NULL; END IF;		
				
				SET $_ProfileID = fn_login($_TransactBy,NULL,NULL,2);
				
				IF $_TransactBy IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';	
				ELSEIF $_RecipeID IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'RecipeID is required.';			
				ELSEIF $_MealType IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'MealType is required.';				
				ELSEIF $_MealPlanDate IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'MealDate is required.';
				ELSEIF EXISTS(SELECT RecipeID FROM MT_MealPlan 
						WHERE ProfileID = $_ProfileID AND  RecipeID = $_RecipeID 
						AND MealPlanDate = $_MealPlanDate
						AND `ReferenceTableStatusID` NOT IN (2)) THEN
					signal SQLSTATE '45000' SET message_text = 'Recipe is already exist.';
				ELSE
					SET $_MealPlanID	:= (SELECT IFNULL(MAX(`MealPlanID`), 0) + 1 FROM  `MT_MealPlan`);
					
					
					INSERT INTO `MT_MealPlan`(
						 `MealPlanID`
						,`ProfileID`
						,`RecipeID`
						,`MealType`
						,`MealPlanDate`
						,`AddedbyUserLoginID`
					    )VALUE(
						 $_MealPlanID
						,$_ProfileID
						,$_RecipeID
						,$_MealType
						,$_MealPlanDate
						,$_TransactBy	
					    );
					    
					IF ROW_COUNT() > 0 THEN
					
						IF $_Delimiter = 'SP' THEN -- return para sa SP
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 100;			
						
						ELSE			  -- return para sa model
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 103;			
						END IF;	
								
					ELSE
						signal SQLSTATE '45000' SET message_text = 'No mealplan is inserted.';	
					END IF;
				
				END IF;
				 
			END; -- end of flag 1
		WHEN 2 THEN 
			 BEGIN
				/*
					Author		: 
					Table Accessed  : 
					Description     :  Update mealplan 
					DateCreated     : Nov 15, 2022
					Time 		:
					
					Module used:		
							
					CALL sp_mealplan(@ReturnIsSuccess, 
									 '{"MealPlanID": "1", 
										  "TransactBy": 23, 
										  "Flag": 2
									}'
							)
						
				*/
				
				
				SET $_View 		:= 'mealplan_2'; 		
				SET $_MealPlanID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.MealPlanID")));	
					
				IF $_MealPlanID	= 'NULL' OR $_MealPlanID	= '' THEN SET $_MealPlanID := NULL; END IF;	
				
				
				IF $_TransactBy IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';	
				ELSEIF $_MealPlanID IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = '_MealPlanID is required.';	
				ELSE
					UPDATE `MT_MealPlan`
					SET `ReferenceTableStatusID` = 2
					      ,`UpdatedByUserLoginID` = $_TransactBy
					      ,`DateUpdated` = NOW()
					WHERE `MealPlanID` = $_MealPlanID ;
					    
					IF ROW_COUNT() > 0 THEN
					
						IF $_Delimiter = 'SP' THEN -- return para sa SP
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 100;			
						
						ELSE			  -- return para sa model
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 103;			
						END IF;	
								
					ELSE
						signal SQLSTATE '45000' SET message_text = 'No mealplan is inserted.';	
					END IF;
				
				END IF;
				 
			END; -- end of flag 2	
	    WHEN 3 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_mealplan(
					@ReturnIsSuccess		
					,'{
						 "Date": "2023-11-02"
						,"ProfileID": "22"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "3"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'mealplan_3'; 		
			SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));	
			SET $_MealPlanDate := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Date")));	
			
			IF $_ProfileID 	= 'NULL' OR $_ProfileID		= '' THEN SET $_ProfileID	:= NULL; END IF;		
			IF $_MealPlanDate	= 'NULL' OR $_MealPlanDate	= '' THEN SET $_MealPlanDate	:= NULL; END IF;				
			
			IF $_ProfileID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'ProfileID is required.';	
			ELSEIF $_MealPlanDate IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'MealPlanDate is required.';											
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SELECT 
					A.`RecipeID`
					,B.`RecipeImage`
					,B.`RecipeName`
					,A.`MealPlanDate`
					,A.`MealType`
					,A.`MealPlanID`
					,CONCAT(C.`ProfileFirstName`,' ' ,C.`ProfileLastName`) AS 'ExpertsName'	
					,'1'					AS 'IsSuccess'
					,'Success' 				AS 'Result'
					,$_View 				AS 'View'
				FROM `MT_MealPlan` A
				INNER JOIN `T_Recipe` B ON A.RecipeID = B.RecipeID
				INNER JOIN `M_Profile` C ON C.ProfileID = B.ProfileID
				WHERE A.ProfileID = $_ProfileID AND A.MealPlanDate = $_MealPlanDate
				AND A.`ReferenceTableStatusID` = 1
				AND B.`ReferenceRecipeStatusID` = 7;
			 END IF;
		END; -- end of flag 3		
		 END CASE;
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_MealPlanID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`RecipeID`
				,A.`RecipeName`
				,A.`ExpertsID`
				,A.`ProfileID`
				,A.`Description`
				,A.`CookingInstruction`
				,A.`Preparation`
				,A.`DifficultyLevel`
				,A.`RecipeImage`
				,A.`MealType`
				,A.`VidioUrl`		
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `T_Recipe` A
			INNER JOIN `MT_MealPlan` B ON A.`RecipeID` = B.`RecipeID`
			WHERE B.`MealPlanID` = $_MealPlanID;
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_navigation` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_navigation` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_navigation`(
           OUT $ReturnIsSuccess		BIGINT  -- For SP Calling
	  ,$JSON			LONGTEXT
)
BEGIN
	DECLARE $_ModuleParentID		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_UserLoginID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	
	/*standard variables start*/	
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  	DEFAULT NULL;
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);	
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT;
	DECLARE $_TransactBy  		  	VARCHAR(10)  	DEFAULT NULL;
	DECLARE $_View				VARCHAR(50);
	DECLARE $_Flag				VARCHAR(50)	DEFAULT NULL;	
	/*standard variables end*/
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	END;	
	
	SET autocommit 		   := 0;
	SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimeter")));
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;
	/*Do not remove default common parameter end*/
		
	CASE $_Flag
	     WHEN 1 THEN 
		BEGIN
			/*
				Description     : select
		
				Module Used:
				
				CALL sp_navigation(
						   @ReturnIsSuccess		
							  ,'{
								 "ModuleParentID": "0"
								,"UserLoginID": "1"
								,"Flag": "1"
							    }'
				);
			*/
			SET $_View 		:= 'navigation_1';
			SET $_ModuleParentID 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ModuleParentID")));
			SET $_UserLoginID 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLoginID")));			
			
			IF $_ModuleParentID 	= 'NULL' OR $_ModuleParentID = '' THEN SET $_ModuleParentID := NULL; END IF;
			IF $_UserLoginID 	= 'NULL' OR $_UserLoginID    = '' THEN SET $_UserLoginID    := NULL; END IF;
			
			
			IF $_ModuleParentID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'ModuleParentID is required.';
			ELSEIF $_UserLoginID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'UserLoginID is required.';				
			ELSE
				SET @_GroupIDs := (SELECT fn_usergroup($_UserLoginID ,NULL,1));
				
				SELECT 
							
					DISTINCT
					 ModuleID
					,ModuleName
					,ModuleController
					,ModuleDescription
					,ModuleParentID
					,ModuleSequence
					,FontIcon
					,IsComponent
					,ModuleSubMenu	
				FROM (
					 SELECT  DISTINCT
						 A.ModuleID
						,A.ModuleName
						,A.ModuleController
						,A.ModuleDescription
						,A.ModuleParentID
						,A.ModuleSequence
						,A.FontIcon
						,A.IsComponent
						,IFNULL((SELECT 1 FROM M_UserModule Z WHERE A.`ModuleID` = Z.`ModuleParentID` AND `ReferenceTableStatusID`=1 LIMIT 1 ), 0) AS 'ModuleSubMenu'		
						 
					 FROM `M_UserModule`	A
					 JOIN `M_UserRights` 	B ON B.`ModuleID` 	= A.`ModuleID`
					 JOIN `M_UserLogin`	C ON C.`UserLoginID`	= B.`UserLoginID`
					 WHERE
						    A.ModuleParentID 		= $_ModuleParentID
						AND B.`UserLoginID` 		= $_UserLoginID
						AND A.ReferenceTableStatusID 	= 1
						AND B.ReferenceTableStatusID 	= 1
						AND C.ReferenceTableStatusID 	= 1
					 
					UNION ALL	
					 
					 SELECT  DISTINCT
						 A.ModuleID
						,A.ModuleName
						,A.ModuleController
						,A.ModuleDescription
						,A.ModuleParentID
						,A.ModuleSequence
						,A.FontIcon
						,A.IsComponent 
						,IFNULL((SELECT 1 FROM M_UserModule Z WHERE A.`ModuleID` = Z.`ModuleParentID` AND `ReferenceTableStatusID`=1 LIMIT 1 ), 0) AS 'SubMenu'
					 FROM `M_UserModule`		A
					 JOIN `M_UserRights` 		B ON B.`ModuleID` 	= A.`ModuleID`
					 JOIN `M_UserGroup` 		C ON C.`UserGroupID` 	= B.`UserGroupID`
					 JOIN `M_UserGroupMember`	F ON F.`UserGroupID` 	= C.`UserGroupID`
					 WHERE
						FIND_IN_SET(B.UserGroupID, @_GroupIDs)
						AND A.ModuleParentID 		= $_ModuleParentID				
						AND A.ReferenceTableStatusID 	= 1			
						AND B.ReferenceTableStatusID 	= 1
				) AS Navigation
				ORDER BY ModuleSequence;					
			END IF;			
		
		END; -- end of flag 1
	END CASE;  
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_notification` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_notification` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_notification`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_NotificationID		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_NotificationText		TEXT  DEFAULT NULL;
	DECLARE $_NotificationDate		VARCHAR(100)  DEFAULT NULL;
	DECLARE $_ReferenceNotificationID	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_notification(
					@ReturnIsSuccess		
					,'{
						 "Text": "Successfully Paid"	
						,"Date": "2023-01-01"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'notification_1'; 		
			SET $_NotificationText := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Text")));
			SET $_NotificationDate := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Date")));
			
			IF $_NotificationText 	= 'NULL' OR $_NotificationText	= '' THEN SET $_NotificationText	:= NULL; END IF;
			IF $_NotificationDate	= 'NULL' OR $_NotificationDate	= '' THEN SET $_NotificationDate	:= NULL; END IF;			
			
			IF $_NotificationText IS NULL  THEN
				signal SQLSTATE '45000' SET message_text = 'Text is required.';											
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_NotificationID		:= (SELECT IFNULL(MAX(`NotificationID`), 0) + 1 FROM `T_Notification`);
				
				INSERT INTO `T_Notification`(
					 `NotificationID`
					,`ProfileID`
					,`NotificationText`
					,`NotificationDate`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_NotificationID
					,`fn_login`($_TransactBy ,NULL,NULL,2)
					,$_NotificationText
					,$_NotificationDate
					,$_TransactBy	
				    );
				    
				IF ROW_COUNT() > 0 THEN		
					IF $_Delimiter = 'SP' THEN -- return para sa SP
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 100;			
					
					ELSE			  -- return para sa model
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 103;			
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No Experts is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 1
	 WHEN 2 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_notification(
					@ReturnIsSuccess		
					,'{
						 "Delimeter": ""					
						,"TransactBy": "1"						
						,"Flag": "2"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'notification_1'; 						
							
			SELECT
				 A.`NotificationID`
				,A.`NotificationText`
				,A.`NotificationDate`
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `T_Notification` A
			WHERE
				A.`ProfileID` = `fn_login`($_TransactBy ,NULL,NULL,2)
			    AND	A.`ReferenceTableStatusID` = 1; 			
				    
		END; -- end of flag 2					
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_NotificationID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`NotificationID`
				,A.`NotificationText`
				,A.`NotificationDate`
				,B.`ReferenceLongDescription` 		AS 'Status'				
				,A.`ReferenceTableStatusID`		AS 'StatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `T_Notification` A
				JOIN M_Reference B ON B.ReferenceID = A.`ReferenceTableStatusID`
			WHERE
				 A.`NotificationID` = $_NotificationID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_pantry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_pantry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pantry`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_PantryID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ExpertsID			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_IngredientID			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_QuantityAvailable		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_pantry(
					@ReturnIsSuccess		
					,'{
						 "ExpertsID": "1"	
						,"IngredientID": "3"
						,"QuantityAvailable": "30"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'pantry_1'; 		
			SET $_ExpertsID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ExpertsID")));
			SET $_IngredientID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.IngredientID")));	
			SET $_QuantityAvailable := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.QuantityAvailable")));	
			
			IF $_ExpertsID 	= 'NULL' OR $_ExpertsID		= '' THEN SET $_ExpertsID	:= NULL; END IF;
			IF $_IngredientID	= 'NULL' OR $_IngredientID	= '' THEN SET $_IngredientID	:= NULL; END IF;		
			IF $_QuantityAvailable	= 'NULL' OR $_QuantityAvailable	= '' THEN SET $_QuantityAvailable	:= NULL; END IF;				
			
			IF $_ExpertsID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'ExpertsID is required.';
			ELSEIF $_IngredientID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'IngredientID is required.';	
			ELSEIF $_QuantityAvailable IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'QuantityAvailable is required.';											
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_PantryID		:= (SELECT IFNULL(MAX(`PantryID`), 0) + 1 FROM `T_Pantry`);
				
				INSERT INTO `T_Pantry`(
					 `PantryID`
					,`ExpertsID`
					,`IngredientID`
					,`QuantityAvailable`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_PantryID
					,$_ExpertsID
					,$_IngredientID
					,$_QuantityAvailable
					,$_TransactBy	
				    );
				    
				IF ROW_COUNT() > 0 THEN		
					IF $_Delimiter = 'SP' THEN -- return para sa SP
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 100;			
					
					ELSE			  -- return para sa model
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 103;			
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No Experts is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 1					
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_PantryID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`PantryID`
				,A.`ExpertsID`
				,A.`IngredientID`
				,A.`QuantityAvailable`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
					
					
			FROM `T_Pantry` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`PantryID` = $_PantryID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_payment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_payment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_payment`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN 
	DECLARE $_PaymentID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_PaymentTypeID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ExpertsID			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_CheffiesID			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_PaymentDetail			TEXT  DEFAULT NULL;
	DECLARE $_PaymentDate			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_NotificationID		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ReferencePaymentStatusID	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ReceiptID			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_SubscriptionID		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		:
				
				Module used:		
						
				CALL sp_payment(
					@ReturnIsSuccess		
					,'{
						 "PaymentTypeID": "1"	
						,"CheffiesID": "1"
						,"Delimiter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'payment_1'; 		
			SET $_PaymentTypeID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.PaymentTypeID")));
			SET $_CheffiesID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.CheffiesID")));
			-- SET $_PaymentDetail := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.PaymentDetail")));
			-- SET $_PaymentDate := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.PaymentDate")));
			
			IF $_PaymentTypeID 	= 'NULL' OR $_PaymentTypeID	= '' THEN SET $_PaymentTypeID	:= NULL; END IF;	
			IF $_CheffiesID	= 'NULL' OR $_CheffiesID	= '' THEN SET $_CheffiesID	:= NULL; END IF;	
			-- IF $_PaymentDetail	= 'NULL' OR $_PaymentDetail	= '' THEN SET $_PaymentDetail	:= NULL; END IF;	
			-- IF $_PaymentDate	= 'NULL' OR $_PaymentDate	= '' THEN SET $_PaymentDate	:= NULL; END IF;	
			
			IF $_PaymentTypeID IS NULL  THEN
				signal SQLSTATE '45000' SET message_text = 'PaymentTypeID is required.';												
			ELSEIF $_CheffiesID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'CheffiesID is required.';												
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_PaymentID		:= (SELECT IFNULL(MAX(`PaymentID`), 0) + 1 FROM `T_Payment`);
				
				INSERT INTO `T_Payment`(
					 `PaymentID`
					,`PaymentTypeID`
					,`CheffiesID`
					,`PaymentDetail`
					,`PaymentDate`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_PaymentID
					,$_PaymentTypeID
					,$_CheffiesID
					,CONCAT('Paid ',DATE_FORMAT(CAST(NOW() AS DATE),'%b %e, %Y') ) -- $_PaymentDetail
					,DATE(now())
					,$_TransactBy	
				    );
				    
				IF ROW_COUNT() > 0 THEN		
				
					-- insert recipt
					SET $_ReceiptID		:= (SELECT IFNULL(MAX(`ReceiptID`), 0) + 1 FROM `T_Receipt`);
					
					INSERT INTO `T_Receipt`(
						 `ReceiptID`
						,`PaymentID`
						,`CheffiesID`
						,`ReceiptDetails`
						,`ReceiptDate`
						,`AddedbyUserLoginID`
					)VALUE(
						 $_ReceiptID
						,$_PaymentID
						,$_CheffiesID
						,CONCAT('Paid ',DATE_FORMAT(CAST(NOW() AS DATE),'%b %e, %Y') )
						,DATE(NOW())
						,$_TransactBy	
					);
					IF ROW_COUNT() > 0 THEN 	
						-- insert subscription
						SET $_SubscriptionID	:= (SELECT IFNULL(MAX(`SubscriptionID`), 0) + 1 FROM `T_Subscription`);
					
						INSERT INTO `T_Subscription`(
							 `SubscriptionID`
							,`CheffiesID`
							,`CheffiesName`
							,`PaymentDate`
							,`SubscriptionEndDate`
							,`AddedbyUserLoginID`
						)VALUE(
							 $_SubscriptionID
							,$_CheffiesID
							,`fn_profile`($_CheffiesID,NULL,1)
							,DATE(NOW())
							,DATE_ADD(DATE(NOW()), INTERVAL +1 MONTH)
							,$_TransactBy	
						);
						IF ROW_COUNT() > 0 THEN 
							-- insert notification
							SET $_NotificationID	:= (SELECT IFNULL(MAX(`NotificationID`), 0) + 1 FROM `T_Notification`);
						
							INSERT INTO `T_Notification`(
								 `NotificationID`
								,`ProfileID`
								,`NotificationText`
								,`NotificationDate`
								,`AddedbyUserLoginID`
							)VALUE(
								 $_NotificationID
								,`fn_login`($_TransactBy ,NULL,null,2)
								,'You have paid successfully.'
								,DATE(NOW())
								,$_TransactBy	
							);
							IF ROW_COUNT() > 0 THEN 
								IF $_Delimiter = 'SP' THEN -- return para sa SP
									SET $_ErrorMsg 	  := 'Success';
									SET $_ErrorNumber := 100;			
								
								ELSE			  -- return para sa model
									SET $_ErrorMsg 	  := 'Success';
									SET $_ErrorNumber := 103;			
								END IF;
							ELSE
								signal SQLSTATE '45000' SET message_text = 'No notification is inserted.';
							END IF;
						ELSE
							signal SQLSTATE '45000' SET message_text = 'No subscription is inserted.';
						END IF;
					ELSE
						signal SQLSTATE '45000' SET message_text = 'No Receipt is inserted.';
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No Payments is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 1					
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_PaymentID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`PaymentID`
				,A.`PaymentTypeID`
				,A.`CheffiesID`
				,A.`PaymentDetail`
				,A.`PaymentDate`
				,B.`ReferenceLongDescription` 		AS 'Status'				
				,A.`ReferencePaymentStatusID`		AS 'StatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `T_Payment` A
				JOIN M_Reference B ON B.ReferenceID = A.`ReferencePaymentStatusID`
			WHERE
				 A.`PaymentID` = $_PaymentID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_profile` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_profile` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_profile`(
           OUT $ReturnIsSuccess	BIGINT  
	  ,$JSON		LONGTEXT 
)
BEGIN
	DECLARE $_ProfileID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ProfileFirstName		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileMiddleName		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileLastName		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileExtName		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ProfileBirthdate		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileAddress		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileContactNo		VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfilePic			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ProfileEmail			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ReferenceGenderID		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Username			VARCHAR(100) DEFAULT NULL;
	DECLARE $_Password			VARCHAR(200) DEFAULT NULL;
	
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimeter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		SET @full_error = @text;
		SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  
		ROLLBACK;
	END;	
	
	SET autocommit 		   := 0;
	SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimeter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimeter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimeter	  	    	= 'NULL' OR $_Delimeter   	      = '' THEN SET $_Delimeter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/
		
	CASE $_Flag														
	     WHEN 1 THEN 
		BEGIN
			/*
				Author          : 	
				Description     : EXPERTS SIGN UP
				DateCreated     : 
				Time 		: 
			
				Module Used:
				
				CALL sp_profile(
					   @ReturnIsSuccess		
					  ,'{
						 "FirstName": "Jundel"
						,"MiddleName": ""
						,"LastName": "Zoilo"
						,"ExtName": ""
						,"Birthdate": "1981-07-09"
						,"GenderID": "4"
						,"Address": "Santiago San Francisco"
						,"ContactNo": "09989129540"
						,"Pic": ""
						,"Email": "zarnalen@gmail.com"
						,"Password": "arna-arna"
						,"TransactBy": "2" 
						,"Flag":"2"
					    }' 	
				);
			*/
				
			SET $_View 			:= 'profile_1';	
			SET $_ProfileFirstName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.FirstName")));
			SET $_ProfileMiddleName		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.MiddleName")));			
			SET $_ProfileLastName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LastName")));			
			SET $_ProfileExtName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ExtName")));			
			SET $_ProfileBirthdate 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Birthdate")));
			SET $_ReferenceGenderID 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.GenderID")));
			SET $_ProfileAddress 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Address")));	
			SET $_ProfileContactNo 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ContactNo")));
			SET $_ProfilePic 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Pic")));
			SET $_ProfileEmail 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Email")));		
			SET $_Password 			:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Password")));	
			SET @_LicenseType 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LicenseType")));	
			SET @_Certificates 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Certificates")));			
			
			IF $_ProfileFirstName 		= 'NULL' OR $_ProfileFirstName		= '' THEN SET $_ProfileFirstName    	:= NULL; END IF;			
			IF $_ProfileMiddleName 		= 'NULL' OR $_ProfileMiddleName		= '' THEN SET $_ProfileMiddleName     	:= NULL; END IF;
			IF $_ProfileLastName 		= 'NULL' OR $_ProfileLastName		= '' THEN SET $_ProfileLastName     	:= NULL; END IF;
			IF $_ProfileExtName 		= 'NULL' OR $_ProfileExtName		= '' THEN SET $_ProfileExtName     	:= NULL; END IF;									
			IF $_ProfileBirthdate 		= 'NULL' OR $_ProfileBirthdate		= '' THEN SET $_ProfileBirthdate    	:= NULL; END IF;
			IF $_ReferenceGenderID 		= 'NULL' OR $_ReferenceGenderID		= '' THEN SET $_ReferenceGenderID   	:= NULL; END IF;			
			IF $_Password 			= 'NULL' OR $_Password			= '' THEN SET $_Password 		:= NULL; END IF;				
			IF $_ProfileAddress		= 'NULL' OR $_ProfileAddress		= '' THEN SET $_ProfileAddress 		:= NULL; END IF;				
			IF $_ProfileContactNo		= 'NULL' OR $_ProfileContactNo		= '' THEN SET $_ProfileContactNo 	:= NULL; END IF;				
			IF $_ProfilePic			= 'NULL' OR $_ProfilePic		= '' THEN SET $_ProfilePic 		:= NULL; END IF;				
			IF $_ProfileEmail		= 'NULL' OR $_ProfileEmail		= '' THEN SET $_ProfileEmail 		:= NULL; END IF;		
			IF @_LicenseType 		IS NULL OR @_LicenseType		= '' THEN SET @_LicenseType  		:= 'NULL'; END IF;	
			IF @_Certificates 		IS NULL OR @_Certificates		= '' THEN SET @_Certificates  		:= 'NULL'; END IF;									
		
			IF EXISTS(
				SELECT ProfileID
				FROM M_Profile 
				WHERE 
					ProfileFirstName = $_ProfileFirstName 
					AND ProfileLastName = $_ProfileLastName 
					AND ProfileBirthdate = $_ProfileBirthdate
			) THEN
				SET $_ProfileID = (
					SELECT ProfileID
					FROM M_Profile 
					WHERE 
						ProfileFirstName = $_ProfileFirstName 
						AND ProfileLastName = $_ProfileLastName 
						AND ProfileBirthdate = $_ProfileBirthdate 		
				);
				SET $_ErrorMsg    := 'Profile already exist';
				IF $_Delimeter = 'SP' THEN 
				      SET $_ErrorNumber := 100;        -- return  para sa SP
				ELSE						
				      SET $_ErrorNumber := 106;						
				END IF;			
			ELSE	
				IF $_ProfileFirstName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'FirstName is required.';	
				ELSEIF $_ProfileLastName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'LastName is required.';					
				ELSEIF $_ProfileBirthdate IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Birthdate is required.';	
				ELSEIF $_ProfileEmail IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Email is required.';	
				ELSEIF $_Password IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Password is required.';	
				ELSEIF $_TransactBy IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';					
				ELSE 
				
					SET $_ProfileID  := (SELECT IFNULL(MAX(`ProfileID`), 0) + 1 FROM `M_Profile`);
					
					SET $_Username := $_ProfileEmail;
					
					INSERT INTO `M_Profile`(
						 `ProfileID`
						,`ProfileFirstName`
						,`ProfileMiddleName`
						,`ProfileLastName`
						,`ProfileExtName`
						,`ProfileBirthdate`
						,`ReferenceGenderID`
						,`ProfileAddress`
						,`ProfileContactNo`
						,`ProfilePic`
						,`ProfileEmail`
						,`AddedbyUserLogInID`
					) VALUES (
						 $_ProfileID
						,$_ProfileFirstName
						,$_ProfileMiddleName
						,$_ProfileLastName
						,$_ProfileExtName
						,$_ProfileBirthdate
						,$_ReferenceGenderID
						,$_ProfileAddress
						,$_ProfileContactNo
						,$_ProfilePic
						,$_ProfileEmail						
						,$_TransactBy
					);	
					
					IF ROW_COUNT() > 0 THEN
						-- insert license
						SET @_DelimiterData := CONCAT('{
										 "LicenseType": "',@_LicenseType,'"
										,"Certificates": "',@_Certificates,'"
										,"Delimiter": "SP"						
										,"TransactBy": "1"						
										,"Flag": "1"
									    }');
						CALL sp_license(
									   @LicenseID		
									  ,@_DelimiterData 	
						);
						IF @LicenseID	 != 0 THEN
							-- insert experts
							SET @_DelimiterData := CONCAT('{
											 "ProfileID": "',$_ProfileID,'"
											,"LicenseID": "',@LicenseID,'"
											,"Delimiter": "SP"						
											,"TransactBy": "1"						
											,"Flag": "1"
										    }');
							CALL sp_experts(
										   @ExpertsID		
										  ,@_DelimiterData 	
							);	
							IF IFNULL(@ExpertsID,0)	 != 0 THEN
								SET @_DelimiterData := CONCAT('{
												 "UserLoginPassword": "',$_Password,'"
												,"ProfileID": "',$_ProfileID,'"		
												,"UserName": "',$_Username,'"	
												,"Delimiter": "SP"						
												,"TransactBy": "1"						
												,"Flag": "2"
											    }');
								CALL sp_userlogin(
											   @UserLoginID		
											  ,@_DelimiterData 	
								);
								IF @UserLoginID	 != 0 THEN
									SET @_UserGroupID =( 
												SELECT 
													`UserGroupID` 
												FROM `M_UserGroup`
												WHERE  `UserGroupCode` = 'EXP'
											);
									
									SET @_DelimiterData := CONCAT('{
													 "EffectiveDate": "',DATE(NOW()),'"
													,"UserGroupID": "',@_UserGroupID,'"
													,"UserLoginID": "',@UserLoginID,'"
													,"Delimiter": "SP"						
													,"TransactBy": "',$_TransactBy	,'"						
													,"Flag": "1"
												    }');
									CALL sp_usergroupmember(
												   @UserGroupMemberID		
												  ,@_DelimiterData 	
									);
									IF @UserGroupMemberID != 0 THEN
										SET $_ErrorMsg    := 'Success on insert.';
										IF $_Delimeter = 'SP' THEN 
										      SET $_ErrorNumber := 100;        -- return  para sa SP
										ELSE						
										      SET $_ErrorNumber := 103;						
										END IF;						
									ELSE
										signal SQLSTATE '45000' SET message_text = 'Error on sp_usergroupmember insert';
									END IF;									
								ELSE
									signal SQLSTATE '45000' SET message_text = 'Error on userlogin insert';		
								END IF;
							ELSE
								signal SQLSTATE '45000' SET message_text = 'Error on Experts insert'; 
							END IF;
						ELSE 
							signal SQLSTATE '45000' SET message_text = 'Error on License insert'; 
						END IF;				
					ELSE
						signal SQLSTATE '45000' SET message_text = 'Error on profile insert';     						
					END IF;	
					
				END IF;
			END IF;				
		END; -- end of flag 1		
	     WHEN 2 THEN 
		BEGIN
			/*
				Author          : 	
				Description     : CHEFFIES SIGN UP
				DateCreated     : 
				Time 		: 
			
				Module Used:
				
				CALL sp_profile(
					   @ReturnIsSuccess		
					  ,'{
						 "FirstName": "Jundel"
						,"MiddleName": ""
						,"LastName": "Zoilo"
						,"ExtName": ""
						,"Birthdate": "1981-07-09"
						,"GenderID": "4"
						,"Address": "Santiago San Francisco"
						,"ContactNo": "09989129540"
						,"Pic": ""
						,"Email": "zarnalen@gmail.com"
						,"Password": "arna-arna"
						,"TransactBy": "2" 
						,"Flag":"2"
					    }' 	
				);
			*/
				
			SET $_View 			:= 'profile_2';	
			SET $_ProfileFirstName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.FirstName")));
			SET $_ProfileMiddleName		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.MiddleName")));			
			SET $_ProfileLastName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LastName")));			
			SET $_ProfileExtName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ExtName")));			
			SET $_ProfileBirthdate 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Birthdate")));
			SET $_ReferenceGenderID 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.GenderID")));
			SET $_ProfileAddress 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Address")));	
			SET $_ProfileContactNo 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ContactNo")));
			SET $_ProfilePic 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Pic")));
			SET $_ProfileEmail 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Email")));		
			SET $_Password 			:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Password")));	
			SET @_ReligionType 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReligionType")));			
			
			IF $_ProfileFirstName 		= 'NULL' OR $_ProfileFirstName		= '' THEN SET $_ProfileFirstName    	:= NULL; END IF;			
			IF $_ProfileMiddleName 		= 'NULL' OR $_ProfileMiddleName		= '' THEN SET $_ProfileMiddleName     	:= NULL; END IF;
			IF $_ProfileLastName 		= 'NULL' OR $_ProfileLastName		= '' THEN SET $_ProfileLastName     	:= NULL; END IF;
			IF $_ProfileExtName 		= 'NULL' OR $_ProfileExtName		= '' THEN SET $_ProfileExtName     	:= NULL; END IF;									
			IF $_ProfileBirthdate 		= 'NULL' OR $_ProfileBirthdate		= '' THEN SET $_ProfileBirthdate    	:= NULL; END IF;
			IF $_ReferenceGenderID 		= 'NULL' OR $_ReferenceGenderID		= '' THEN SET $_ReferenceGenderID   	:= NULL; END IF;			
			IF $_Password 			= 'NULL' OR $_Password			= '' THEN SET $_Password 		:= NULL; END IF;				
			IF $_ProfileAddress		= 'NULL' OR $_ProfileAddress		= '' THEN SET $_ProfileAddress 		:= NULL; END IF;				
			IF $_ProfileContactNo		= 'NULL' OR $_ProfileContactNo		= '' THEN SET $_ProfileContactNo 	:= NULL; END IF;				
			IF $_ProfilePic			= 'NULL' OR $_ProfilePic		= '' THEN SET $_ProfilePic 		:= NULL; END IF;				
			IF $_ProfileEmail		= 'NULL' OR $_ProfileEmail		= '' THEN SET $_ProfileEmail 		:= NULL; END IF;		
			IF @_ReligionType 		IS NULL OR @_ReligionType		= '' THEN SET @_ReligionType  		:= 'NULL'; END IF;	
			
			IF EXISTS(
				SELECT ProfileID
				FROM M_Profile 
				WHERE 
					ProfileFirstName = $_ProfileFirstName 
					AND ProfileLastName = $_ProfileLastName 
					AND ProfileBirthdate = $_ProfileBirthdate
			) THEN
				SET $_ProfileID = (
					SELECT ProfileID
					FROM M_Profile 
					WHERE 
						ProfileFirstName = $_ProfileFirstName 
						AND ProfileLastName = $_ProfileLastName 
						AND ProfileBirthdate = $_ProfileBirthdate 		
				);
				SET $_ErrorMsg    := 'Profile already exist';
				IF $_Delimeter = 'SP' THEN 
				      SET $_ErrorNumber := 100;        -- return  para sa SP
				ELSE						
				      SET $_ErrorNumber := 106;						
				END IF;			
			ELSE	
				IF $_ProfileFirstName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'FirstName is required.';	
				ELSEIF $_ProfileLastName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'LastName is required.';					
				ELSEIF $_ProfileBirthdate IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Birthdate is required.';	
				ELSEIF $_ProfileEmail IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Email is required.';	
				ELSEIF $_Password IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Password is required.';	
			        ELSEIF $_TransactBy IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';			
				ELSE 
				
					SET $_ProfileID  := (SELECT IFNULL(MAX(`ProfileID`), 0) + 1 FROM `M_Profile`);
					
					SET $_Username := $_ProfileEmail;
					
					INSERT INTO `M_Profile`(
						 `ProfileID`
						,`ProfileFirstName`
						,`ProfileMiddleName`
						,`ProfileLastName`
						,`ProfileExtName`
						,`ProfileBirthdate`
						,`ReferenceGenderID`
						,`ProfileAddress`
						,`ProfileContactNo`
						,`ProfilePic`
						,`ProfileEmail`
						,`AddedbyUserLogInID`
					) VALUES (
						 $_ProfileID
						,$_ProfileFirstName
						,$_ProfileMiddleName
						,$_ProfileLastName
						,$_ProfileExtName
						,$_ProfileBirthdate
						,$_ReferenceGenderID
						,$_ProfileAddress
						,$_ProfileContactNo
						,$_ProfilePic
						,$_ProfileEmail						
						,$_TransactBy
					);	
					
					IF ROW_COUNT() > 0 THEN
						-- insert license
						SET @_DelimiterData := CONCAT('{
										 "ReligionType": "',@_ReligionType,'"
										,"Delimiter": "SP"						
										,"TransactBy": "1"						
										,"Flag": "1"
									    }');
						CALL sp_religion(
									   @ReligionID		
									  ,@_DelimiterData 	
						);
						
						
						IF @ReligionID	 != 0 THEN
							-- insert userlogin
							SET @_DelimiterData := CONCAT('{
											 "UserLoginPassword": "',$_Password,'"
											,"ProfileID": "',$_ProfileID,'"		
											,"UserName": "',$_Username,'"	
											,"Delimiter": "SP"						
											,"TransactBy": "1"						
											,"Flag": "2"
										    }');
							CALL sp_userlogin(
										   @UserLoginID		
										  ,@_DelimiterData 	
							);
							IF @UserLoginID	 != 0 THEN
								SET @_UserGroupID =( 
											SELECT 
												`UserGroupID` 
											FROM `M_UserGroup`
											WHERE  `UserGroupCode` = 'CHF'
										);
								
								SET @_DelimiterData := CONCAT('{
												 "EffectiveDate": "',DATE(NOW()),'"
												,"UserGroupID": "',@_UserGroupID,'"
												,"UserLoginID": "',@UserLoginID,'"
												,"Delimiter": "SP"						
												,"TransactBy": "',$_TransactBy	,'"					
												,"Flag": "1"
											    }');
								CALL sp_usergroupmember(
											   @UserGroupMemberID		
											  ,@_DelimiterData 	
								);
								IF @UserGroupMemberID != 0 THEN
									SET $_ErrorMsg    := 'Success on insert.';
									IF $_Delimeter = 'SP' THEN 
									      SET $_ErrorNumber := 100;        -- return  para sa SP
									ELSE						
									      SET $_ErrorNumber := 103;						
									END IF;						
								ELSE
									signal SQLSTATE '45000' SET message_text = 'Error on sp_usergroupmember insert';
								END IF;									
							ELSE
								signal SQLSTATE '45000' SET message_text = 'Error on userlogin insert';		
							END IF;
						ELSE 
							signal SQLSTATE '45000' SET message_text = 'Error on Religion insert'; 
						END IF;				
					ELSE
						signal SQLSTATE '45000' SET message_text = 'Error on profile insert';     						
					END IF;	
					
				END IF;
			END IF;				
		END; -- end of flag 2	
	     WHEN 3 THEN 
		BEGIN
			/*
				Author          : 	
				Description     : profile settings for cheffies and experts
				DateCreated     : 
				Time 		: 
			
				Module Used:
				
				CALL sp_profile(
					   @ReturnIsSuccess		
					  ,'{
						"TransactBy": "2" 
						,"Flag":"3"
					    }' 	
				);
			*/
				
			SET $_View 			:= 'profile_3';	
			IF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'Userlogin is required';	         
			ELSE
				SET @_ProfileID = fn_login($_TransactBy,NULL,NULL,2);
				
				IF EXISTS(SELECT `CheffiesID` FROM `M_Cheffies` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
					SELECT 
						A.`ProfileID`
						,CONCAT(B.`ProfileFirstName`, B.`ProfileLastName`,' ',IFNULL(B.`ProfileExtName`,'')) AS 'Name'
						,B.`ProfilePic`				AS 'ProfilePic'
						,CASE WHEN D.`SubscriptionID` IS NULL THEN '' ELSE 'Premium' END   AS 'Subscription'
						,C.`UserLoginName`			AS 'UserName'
						,C.`UserLoginPassword`			AS 'Password'
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM `M_Cheffies` A
					INNER JOIN `M_Profile` B ON A.`ProfileID` = B.`ProfileID`
					INNER JOIN `M_UserLogin` C ON A.`ProfileID` = C.`ProfileID`
					LEFT JOIN `T_Subscription` D ON A.`CheffiesID` = D.`CheffiesID` AND D.`ReferenceSubscriptionStatusID` 
					WHERE C.`ProfileID` = @_ProfileID
					AND A.`ReferenceTableStatusID` = 1;
				ELSEIF EXISTS(SELECT `ExpertsID` FROM `MT_Experts` WHERE `ProfileID` = @_ProfileID AND `ReferenceTableStatusID` = 1) THEN
					
					SELECT CONCAT(`ProfileFirstName`,' ',`ProfileLastName`) AS Fullname
						,C.`LicenseType` 			AS Expertise
						,A.`ProfileID`
						,A.`ProfilePic`				AS 'ProfilePic'
						,'1'					AS 'IsSuccess'
						,'Success' 				AS 'Result'
						,$_View 				AS 'View'
					FROM `M_Profile` A
					JOIN `MT_Experts` B ON B.`ProfileID` = A.`ProfileID`
					JOIN `M_License` C ON C.`LicenseID` = B.`LicenseID`
					WHERE B.`ReferenceExpertsStatusID` = 6
					AND A.`ProfileID` = @_ProfileID;	 
				ELSE
					signal SQLSTATE '45000' SET message_text = 'Profile does not exist';
				END IF;
			
			END IF;
		END; -- end flag 3
	     WHEN 4 THEN 
		BEGIN
			/*
				Author          : 	
				Description     : Update profile
				DateCreated     : 
				Time 		: 
			
				Module Used:
				
				CALL sp_profile(
					   @ReturnIsSuccess		
					  ,'{
						 "FirstName": "Jundel"
						,"MiddleName": ""
						,"LastName": "Zoilo"
						,"ExtName": ""
						,"Birthdate": "1981-07-09"
						,"GenderID": "4"
						,"Address": "Santiago San Francisco"
						,"ContactNo": "09989129540"
						,"Pic": ""
						,"Email": "zarnalen@gmail.com"
						,"Password": "arna-arna"
						,"ProfileID": "arna-arna"
						,"TransactBy": "2" 
						,"Flag":"4"
					    }' 	
				);
			*/
				
			SET $_View 			:= 'profile_4';	
			SET $_ProfileID 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));
			SET $_ProfileFirstName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.FirstName")));
			SET $_ProfileMiddleName		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.MiddleName")));			
			SET $_ProfileLastName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LastName")));			
			SET $_ProfileExtName 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ExtName")));			
			SET $_ProfileBirthdate 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Birthdate")));
			SET $_ReferenceGenderID 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.GenderID")));
			SET $_ProfileAddress 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Address")));	
			SET $_ProfileContactNo 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ContactNo")));
			SET $_ProfilePic 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Pic")));
			SET $_ProfileEmail 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Email")));		
			SET $_Password 			:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Password")));	
			SET @_LicenseType 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.LicenseType")));	
			SET @_Certificates 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Certificates")));			
			
			IF $_ProfileID 			= 'NULL' OR $_ProfileID			= '' THEN SET $_ProfileID    		:= NULL; END IF;
			IF $_ProfileFirstName 		= 'NULL' OR $_ProfileFirstName		= '' THEN SET $_ProfileFirstName    	:= NULL; END IF;			
			IF $_ProfileMiddleName 		= 'NULL' OR $_ProfileMiddleName		= '' THEN SET $_ProfileMiddleName     	:= NULL; END IF;
			IF $_ProfileLastName 		= 'NULL' OR $_ProfileLastName		= '' THEN SET $_ProfileLastName     	:= NULL; END IF;
			IF $_ProfileExtName 		= 'NULL' OR $_ProfileExtName		= '' THEN SET $_ProfileExtName     	:= NULL; END IF;									
			IF $_ProfileBirthdate 		= 'NULL' OR $_ProfileBirthdate		= '' THEN SET $_ProfileBirthdate    	:= NULL; END IF;
			IF $_ReferenceGenderID 		= 'NULL' OR $_ReferenceGenderID		= '' THEN SET $_ReferenceGenderID   	:= NULL; END IF;			
			IF $_Password 			= 'NULL' OR $_Password			= '' THEN SET $_Password 		:= NULL; END IF;				
			IF $_ProfileAddress		= 'NULL' OR $_ProfileAddress		= '' THEN SET $_ProfileAddress 		:= NULL; END IF;				
			IF $_ProfileContactNo		= 'NULL' OR $_ProfileContactNo		= '' THEN SET $_ProfileContactNo 	:= NULL; END IF;				
			IF $_ProfilePic			= 'NULL' OR $_ProfilePic		= '' THEN SET $_ProfilePic 		:= NULL; END IF;				
			IF $_ProfileEmail		= 'NULL' OR $_ProfileEmail		= '' THEN SET $_ProfileEmail 		:= NULL; END IF;		
			IF @_LicenseType 		IS NULL OR @_LicenseType		= '' THEN SET @_LicenseType  		:= 'NULL'; END IF;	
			IF @_Certificates 		IS NULL OR @_Certificates		= '' THEN SET @_Certificates  		:= 'NULL'; END IF;									
		
			IF $_ProfileID  IS NULL THEN SET $_ProfileID = fn_login($_TransactBy,NULL,NULL,2); END IF;
			IF EXISTS(
				SELECT ProfileID
				FROM M_Profile 
				WHERE 
					ProfileFirstName = $_ProfileFirstName 
					AND ProfileLastName = $_ProfileLastName 
					AND ProfileBirthdate = $_ProfileBirthdate
					AND ProfileID NOT IN ( $_ProfileID)
			) THEN
				SET $_ProfileID = (
					SELECT ProfileID
					FROM M_Profile 
					WHERE 
						ProfileFirstName = $_ProfileFirstName 
						AND ProfileLastName = $_ProfileLastName 
						AND ProfileBirthdate = $_ProfileBirthdate 
						AND ProfileID NOT IN ( $_ProfileID)		
				);
				SET $_ErrorMsg    := 'Profile already exist';
				IF $_Delimeter = 'SP' THEN 
				      SET $_ErrorNumber := 100;        -- return  para sa SP
				ELSE						
				      SET $_ErrorNumber := 106;						
				END IF;			
			ELSE	
				IF $_ProfileFirstName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'FirstName is required.';	
				ELSEIF $_ProfileLastName IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'LastName is required.';					
				ELSEIF $_ProfileBirthdate IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'Birthdate is required.';
				ELSEIF $_TransactBy IS NULL THEN
					signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';					
				ELSE 
				
					UPDATE `M_Profile`
					SET	 `ProfileFirstName` = IFNULL($_ProfileFirstName,ProfileFirstName)
						,`ProfileMiddleName` = $_ProfileMiddleName
						,`ProfileLastName` = IFNULL($_ProfileLastName,ProfileLastName)
						,`ProfileExtName` = $_ProfileExtName
						,`ProfileBirthdate` = IFNULL($_ProfileBirthdate,ProfileBirthdate)
						,`ReferenceGenderID` = IFNULL($_ReferenceGenderID,ReferenceGenderID)
						,`ProfileAddress` = IFNULL($_ProfileAddress,ProfileAddress)
						,`ProfileContactNo` = IFNULL($_ProfileContactNo,ProfileContactNo)
						,`ProfilePic` = IFNULL($_ProfilePic,ProfilePic)
						,`UpdatedbyUserLoginID` = $_TransactBy
						,`DateUpdated` = NOW()
					WHERE ProfileID = $_ProfileID;
					IF ROW_COUNT() > 0 THEN
						SET $_ErrorMsg    := 'Success on Update.';
						IF $_Delimeter = 'SP' THEN 
						      SET $_ErrorNumber := 100;        -- return  para sa SP
						ELSE						
						      SET $_ErrorNumber := 103;						
						END IF;										
					ELSE
						signal SQLSTATE '45000' SET message_text = 'Error on profile update';     						
					END IF;	
					
				END IF;
			END IF;				
		END; -- end of flag 4			
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'Flag is required.';	         
	END CASE;  
	
	/*CATCH PARA SA MGA RETURNS START*/
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_ProfileID;
	     WHEN 101   THEN -- error return for SP
	        SET autocommit         := 3;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      3       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
	        BEGIN
			SET autocommit := 1;
			
			SELECT 
				 `ProfileID`
				,`ProfileFirstName`
				,`ProfileMiddleName`
				,`ProfileLastName`
				,`ProfileExtName`
				,`ProfileBirthdate`
				,`ReferenceGenderID`
				,`ReferenceTableStatusID`					
				,'1' 			AS 'IsSuccess'
				,$_ErrorMsg 		AS 'Result' 
				,$_View 		AS 'View'
			FROM `M_Profile`    
			WHERE
				 `ProfileID` = $_ProfileID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     WHEN 106  THEN
	        BEGIN
			SET autocommit := 1;
			
			SELECT 
				 `ProfileID`
				,`ProfileFirstName`
				,`ProfileMiddleName`
				,`ProfileLastName`
				,`ProfileExtName`
				,`ProfileBirthdate`
				,`ReferenceGenderID`
				,`ReferenceTableStatusID`					
				,2 			AS 'IsSuccess'
				,$_ErrorMsg 		AS 'Result' 
				,$_View 		AS 'View'
			FROM `M_Profile`    
			WHERE
				 `ProfileID` = $_ProfileID;	        
		END;		
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_recipe` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_recipe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recipe`(
	  OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_RecipeID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_RestrictionsID		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_RecipeName			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_Description			VARCHAR(100) DEFAULT NULL;
	DECLARE $_CookingInstruction		VARCHAR(100) DEFAULT NULL;
	DECLARE $_Preparation			VARCHAR(100) DEFAULT NULL;
	DECLARE $_DifficultyLevel		VARCHAR(100) DEFAULT NULL;
	DECLARE $_RecipeImage			VARCHAR(100) DEFAULT NULL;
	DECLARE $_MealType			VARCHAR(100) DEFAULT NULL;
	DECLARE $_VidioUrl			VARCHAR(100) DEFAULT NULL;
	DECLARE $_ReferenceRecipeStatusID	VARCHAR(100) DEFAULT NULL;
	DECLARE $_ProfileID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_IngredientsID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Quantity			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Measurement			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_RecipeIngredientsID		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ExpertID			VARCHAR(10)  DEFAULT NULL;
	
	
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
		WHEN 1 THEN 
			 BEGIN
				/*
					Author		: 
					Table Accessed  : 
					Description     :  
					DateCreated     : August 20, 2023
					Time 		:
					
					Module used:		
							
					CALL sp_recipe(
						@ReturnIsSuccess		
						,'{
							 "ProfileID": "12345"	
							,"LicenseID": "1"
							,"Delimeter": "SP"					
							,"TransactBy": "1"						
							,"Flag": "1"
							}' 	
						);
				*/
				
				
				SET $_View 		:= 'recipe_1'; 		
				-- SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));	
				
				-- IF $_ProfileID 	= 'NULL' OR $_ProfileID	= '' THEN SET $_ProfileID := NULL; END IF;			
				
				 SELECT 
					 `RecipeID`
					,`RecipeImage`
					,`RecipeName`
					,`MealType`
					,`Description`
					,`CookingInstruction`
					,`Preparation`
					,`DifficultyLevel`
					,`VidioUrl`
					,'1'					AS 'IsSuccess'
					,'Success' 				AS 'Result'
					,$_View 				AS 'View'
				 FROM `T_Recipe` 
				 WHERE `ReferenceRecipeStatusID`= 7;
				 
			END; -- end of flag 1		
		WHEN 2 THEN 
			 BEGIN
				/*
					Author		: 
					Table Accessed  : 
					Description     :  
					DateCreated     : Nov.1, 2023
					Time 		:
					
					Module used:		
							
					CALL sp_recipe(@ReturnIsSuccess, '{
									  "RecipeName": "Tuna Flakes", 
									  "CookingInstruction": "testing ", 
									  "Description": "good for diet", 
									  "RecipeImage": "", 
									  "RestrictionsID": "1", 
									  "Preparation": "10:00:00", 
									  "DifficultyLevel": "2", 
									  "MealType": "Breakfast", 
									  "VidioUrl": "testlink", 
									  "TransactBy": 23, 
									  "Flag": 2, 
									  "SPName": "recipe",
									  "Detail":[{
										"IngredientsID":"1"	
										,"Quantity":"2" 	
										,"Measurement":"pcs" 	
									  }]
								}'
							)
						
				*/
				
				
				SET $_View 		:= 'recipe_2'; 		
				SET $_RecipeName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeName")));	
				SET $_RestrictionsID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RestrictionID")));	
				SET $_Description := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Description")));	
				SET $_CookingInstruction := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Instruction")));	
				SET $_Preparation := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Preparation")));	
				SET $_DifficultyLevel := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.DifficultyLevel")));	
				SET $_RecipeImage := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeImage")));	
				SET $_VidioUrl := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.VedioUrl")));	
				SET $_ExpertID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ExpertID")));	
				SET @_Detail := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Detail")));
					
				
				IF $_RecipeName	= 'NULL' OR $_RecipeName	= '' THEN SET $_RecipeName := NULL; END IF;
				IF $_RestrictionsID	= 'NULL' OR $_RestrictionsID	= '' THEN SET $_RestrictionsID := NULL; END IF;
				IF $_Description	= 'NULL' OR $_Description	= '' THEN SET $_Description := NULL; END IF;
				IF $_CookingInstruction	= 'NULL' OR $_CookingInstruction	= '' THEN SET $_CookingInstruction := NULL; END IF;
				IF $_Preparation	= 'NULL' OR $_Preparation	= '' THEN SET $_Preparation := NULL; END IF;
				IF $_DifficultyLevel	= 'NULL' OR $_DifficultyLevel	= '' THEN SET $_DifficultyLevel := NULL; END IF;
				IF $_RecipeImage	= 'NULL' OR $_RecipeImage	= '' THEN SET $_RecipeImage := NULL; END IF;
				IF $_VidioUrl	= 'NULL' OR $_VidioUrl	= '' THEN SET $_VidioUrl := NULL; END IF;	
				IF $_ExpertID	= 'NULL' OR $_ExpertID	= '' THEN SET $_ExpertID := NULL; END IF;	
				IF @_Detail	= 'NULL' OR @_Detail	= '' THEN SET @_Detail:=  NULL; END IF;			
				
				
				IF $_TransactBy IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';	
				ELSEIF $_RecipeName IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'RecipeName is required.';			
				ELSE
					SET $_RecipeID	:= (SELECT IFNULL(MAX(`RecipeID`), 0) + 1 FROM `T_Recipe`);
					SET $_ProfileID = fn_login($_TransactBy,NULL,NULL,2);
					
					INSERT INTO `T_Recipe`(
						 `RecipeID`
						,`ProfileID`
						,`ExpertsID`
						,`RestrictionsID`
						,`RecipeName`
						,`Description`
						,`CookingInstruction`
						,`Preparation`
						,`DifficultyLevel`
						,`RecipeImage`
						,`MealType`
						,`VidioUrl`
						,`ReferenceRecipeStatusID`
						,`AddedbyUserLoginID`
					    )VALUE(
						 $_RecipeID
						,$_ProfileID
						,$_ExpertID
						,$_RestrictionsID
						,$_RecipeName
						,$_Description
						,$_CookingInstruction
						,$_Preparation
						,$_DifficultyLevel
						,$_RecipeImage
						,$_MealType
						,$_VidioUrl
						,7
						,$_TransactBy	
					    );
					    
					IF ROW_COUNT() > 0 THEN
					
						SET @_Data = JSON_EXTRACT($JSON,'$.Detail');
						SET @_DataLength = JSON_LENGTH(@_Data);
						SET @row_count = 0;
						SET @i = 0;
						
						WHILE @i < (@_DataLength) DO
						
							SET $_IngredientsID 	= JSON_UNQUOTE(JSON_EXTRACT(@_Data,CONCAT('$[',@i,'].id')));
							SET $_Quantity 	= JSON_UNQUOTE(JSON_EXTRACT(@_Data,CONCAT('$[',@i,'].quantity')));
							SET $_Measurement	= JSON_UNQUOTE(JSON_EXTRACT(@_Data,CONCAT('$[',@i,'].measurement'))); 
								
							IF $_IngredientsID 	= 'NULL' OR $_IngredientsID  	= '' THEN SET $_IngredientsID 	= NULL; END IF;	
							IF $_Quantity 	= 'NULL' OR $_Quantity  	= '' THEN SET $_Quantity = NULL; END IF;	
							IF $_Measurement 	= 'NULL' OR $_Measurement  	= '' THEN SET $_Measurement 	= NULL; END IF;
							SET @_AvailableQty = (SELECT `QuantityAvailable` FROM `T_Pantry` WHERE `IngredientID` = $_IngredientsID );
						
							IF $_IngredientsID IS NULL THEN
								signal SQLSTATE '45000' SET message_text  	= 'IngredientsID is required.';
							ELSEIF $_Quantity IS NULL THEN
								signal SQLSTATE '45000' SET message_text  	= 'Quantity is required.';
							ELSEIF @_AvailableQty IS NULL THEN
								signal SQLSTATE '45000' SET message_text  	= 'Your available quantity is is not enoughh.';		
							ELSEIF $_Measurement IS NULL THEN
								signal SQLSTATE '45000' SET message_text  	= 'Measurement is required.';				
							ELSE 
								
								SET $_RecipeIngredientsID = (SELECT IFNULL(MAX(RecipeIngredientsID),0) + 1  FROM `T_RecipeIngredients`);
								
								INSERT INTO `T_RecipeIngredients`(
									 `RecipeIngredientsID`
									,`RecipeID`
									,`IngredientsID`
									,`Quantity`
									,`Measurement`
									,`ReferenceRecipeStatusID`
									,`UpdatedByUserLoginID`
								)VALUES(
									 $_RecipeIngredientsID
									,$_RecipeID
									,$_IngredientsID
									,$_Quantity
									,$_Measurement
									,7
									,$_TransactBy 
								);
								IF ROW_COUNT() > 0 THEN
									-- less the quantity of ingredients in pantry
									UPDATE `T_Pantry` 
									SET `QuantityAvailable` = `QuantityAvailable` - $_Quantity
									    ,`DateUpdated` 	= NOW()
									    ,`UpdatedByUserLoginID` = $_TransactBy 
									WHERE `IngredientID` = $_IngredientsID;
									
									IF ROW_COUNT() > 0 THEN
									
										SET @row_count = @row_count + 1;
									ELSE
										SET @i= @_DataLength + 1;
									END IF;
								ELSE
									SET @i= @_DataLength + 1;
								END IF;
									
							END IF;
							SET @i= @i + 1;
						END WHILE;	
						IF @row_count = (@_DataLength) THEN
							IF $_Delimiter = 'SP' THEN -- return para sa SP
								SET $_ErrorMsg 	  := 'Success';
								SET $_ErrorNumber := 100;			
							
							ELSE			  -- return para sa model
								SET $_ErrorMsg 	  := 'Success';
								SET $_ErrorNumber := 103;			
							END IF;
						ELSE
							signal SQLSTATE '45000' SET message_text = 'No recipe is inserted.';	
						END IF;		
								
					ELSE
						signal SQLSTATE '45000' SET message_text = 'No recipe is inserted.';	
					END IF;
				
				END IF;
				 
			END; -- end of flag 2
		
		WHEN 3 THEN 
			BEGIN
				/*
					Author		: Tobey Van Oliver Supangan
					Table Accessed  : 
					Description     : Dashboard Page
					DateCreated     : 11/02/23
					Time 		: 06:34PM
					
					Module used:		
							
					CALL sp_recipe(
						@ReturnIsSuccess		
						,'{
							 "RecipeName": "ap"	
							,"Delimeter": "SP"					
							,"TransactBy": "1"						
							,"Flag": "3"
							}' 	
						);
				*/
			SET $_View 		:= 'recipe_3'; 		
			SET $_RecipeName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RecipeName")));
			IF $_RecipeName	= 'NULL' OR $_RecipeName	= '' THEN SET $_RecipeName := NULL; END IF;		
					
			IF $_RecipeName IS NULL THEN 
				signal SQLSTATE '45000' SET message_text = 'RecipeName is required.';
			ELSE
				
				SELECT 
					A.`RecipeImage`
					,A.`RecipeName`
					,A.`MealType`
					,CONCAT(B.`ProfileFirstName`,' ',B.`ProfileLastName`) AS Fullname
					,'1'					AS 'IsSuccess'
					,'Success' 				AS 'Result'
					,$_View 				AS 'View'
				FROM `T_Recipe` A
				INNER JOIN `M_Profile` B ON A.`ProfileID` = B.`ProfileID`
				WHERE A.`RecipeName` LIKE IFNULL(CONCAT('%',$_RecipeName,'%'),A.`RecipeName`)
				AND `ReferenceRecipeStatusID` = 7;
				    
			END IF;
		END; -- end of flag 3
		WHEN 4 THEN
			BEGIN
				DROP TABLE IF EXISTS ingredients;
				
				CREATE TEMPORARY TABLE ingredients (
					ingredientsid BIGINT
				);
				
				SET $_View := 'recipe_4';
			    
				-- Use $_IngredientsID to store the comma-separated string
				SET $_IngredientsID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON, "$.IngredientsID")));
				
				IF $_IngredientsID = 'NULL' OR $_IngredientsID = '' THEN SET $_IngredientsID = NULL; END IF;
				
				IF $_IngredientsID IS NOT NULL THEN
				
					-- Split the $_IngredientsID string into a temporary table
					CREATE TEMPORARY TABLE IF NOT EXISTS temp_ingredients_ids (ingredients_id BIGINT);
					SET @sql = CONCAT('INSERT INTO temp_ingredients_ids (ingredients_id) VALUES (', REPLACE($_IngredientsID, ',', '), ('), ')');
					PREPARE stmt FROM @sql;
					EXECUTE stmt;
					DEALLOCATE PREPARE stmt;
					-- Select the records based on IngredientsID
					INSERT INTO ingredients (ingredientsid)
					SELECT ingredients_id FROM temp_ingredients_ids;
					
					-- Clean up the temporary table
					DROP TEMPORARY TABLE IF EXISTS temp_ingredients_ids;
					
				ELSE
					SIGNAL SQLSTATE '45000' SET message_text = 'IngredientsID is required.';
				END IF;
			    
				IF EXISTS (SELECT ingredientsid FROM ingredients) THEN
					SELECT
							A.`RecipeImage`
							,A.`RecipeName`
							,A.`MealType`
							,A.`Description`
							,A.`CookingInstruction`
							,A.`Preparation`
							,A.`DifficultyLevel`
							,A.`VidioUrl`
							,CONCAT(B.`ProfileFirstName`, ' ', B.`ProfileLastName`) AS Fullname
							,'1' AS 'IsSuccess'
							,'Success' AS 'Result'
							,$_View AS 'View'
					FROM `T_Recipe` A
					INNER JOIN `M_Profile` B ON A.`ProfileID` = B.`ProfileID`
					INNER JOIN `T_RecipeIngredients` C ON A.`RecipeID` = C.`RecipeID`
					WHERE C.`IngredientsID` IN (SELECT ingredientsid FROM ingredients)
					AND A.`ReferenceRecipeStatusID` = 7;
					SET $_ErrorNumber = 105;
				ELSE
					SIGNAL SQLSTATE '45000' SET message_text = 'No Record Found.';
				END IF;
			END; 		-- end of flag 4
			
		 END CASE;
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_RecipeID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`RecipeID`
				,A.`RecipeName`
				,A.`ExpertsID`
				,A.`ProfileID`
				,A.`Description`
				,A.`CookingInstruction`
				,A.`Preparation`
				,A.`DifficultyLevel`
				,A.`RecipeImage`
				,A.`MealType`
				,A.`VidioUrl`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceRecipeStatusID`		AS 'RecipeStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
			FROM `T_Recipe` A
				JOIN M_Reference B ON B.ReferenceID = A.`ReferenceRecipeStatusID`
			WHERE
				 A.`RecipeID` = $_RecipeID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_religion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_religion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_religion`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_ReligionID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ReligionType			VARCHAR(50)  DEFAULT NULL;
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : August 20, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_religion(
					@ReturnIsSuccess		
					,'{
						 "ProfileID": "12345"	
						,"LicenseID": "1"
						,"Delimeter": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'religion_1'; 		
			SET $_ReligionType := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReligionType")));		
			
			IF $_ReligionType 	= 'NULL' OR $_ReligionType	= '' THEN SET $_ReligionType	:= NULL; END IF;			
			
			IF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_ReligionID		:= (SELECT IFNULL(MAX(`ReligionID`), 0) + 1 FROM `M_Religion`);
				
				INSERT INTO `M_Religion`(
					 `ReligionID`
					,`ReligionType`
					,`AddedbyUserLoginID`
				    )VALUE(
					 $_ReligionID
					,$_ReligionType
					,$_TransactBy	
				    );
				    
				IF ROW_COUNT() > 0 THEN		
					IF $_Delimiter = 'SP' THEN -- return para sa SP
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 100;			
					
					ELSE			  -- return para sa model
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 103;			
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'No Experts is inserted.';	
				END IF;
			 END IF;
		END; -- end of flag 1						
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_ReligionID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`ReligionID`
				,A.`ReligionType`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
					
			FROM `M_Religion` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`ReligionID` = $_ReligionID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_restrictions` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_restrictions` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_restrictions`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_RestrictionsID		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ProfileID			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_HealthProblemsID		VARCHAR(100) DEFAULT NULL;
	DECLARE $_ReligionID			VARCHAR(20)  DEFAULT NULL;
	DECLARE $_RestrictionType		VARCHAR(100) DEFAULT NULL;
	DECLARE $_ReferenceRestrictionID	VARCHAR(100) DEFAULT NULL;
	
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : Nov 2, 2023
				Time 		:
				
				Module used:		
						
				CALL sp_restrictions(
					@ReturnIsSuccess		
					,'{
						 "LicenseType": "12345"	
						,"Certiificate": ""
						,"Delimert": "SP"					
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'restrictions_1'; 					
			
			IF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SELECT 
					A.`RestrictionsID`
					,B.`HealthCondition`
					,B.`MedicalHistory`
					,C.`ReligionType`
					,A.`RestrictionType`
					,A.`ProfileID`
					,'1'					AS 'IsSuccess'
					,'Success' 				AS 'Result'
					,$_View 				AS 'View'
				FROM `T_Restrictions` A
				INNER JOIN `M_HealthProblems` B ON A.`HealthProblemsID` = B.`HealthProblemsID`
				LEFT JOIN `M_Religion` C ON A.`ReligionID` = C.`ReligionID`
				WHERE A.`ProfileID` = fn_login($_TransactBy,NULL,NULL,2)
				AND A.`ReferenceRestrictionID` = 9
				AND B.`ReferenceTableStatusID` = 1;
			 END IF;
		END; -- end of flag 1		
		WHEN 2 THEN 
			 BEGIN
				/*
					Author		: 
					Table Accessed  : 
					Description     :  Insert New Restrictions
					DateCreated     : Nov 15, 2022
					Time 		:
					
					Module used:		
							
					CALL sp_restrictions(@ReturnIsSuccess, 
									 '{"ProfileID": "1", 
										  "HealthProblemsID": "1", 
										  "ReligionID": "1 ", 
										  "RestrictionType": "none", 
										  "TransactBy": 23, 
										  "Flag": 2 
									}'
							)
						
				*/
				
				
				SET $_View 		:= 'restrictions_2'; 		
				SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));	
				SET $_HealthProblemsID  := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.HealthProblemsID")));	
				SET $_ReligionID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReligionID")));	
				SET $_RestrictionType := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RestrictionType")));	
					
				IF $_ProfileID	= 'NULL' OR $_ProfileID	= '' THEN SET $_ProfileID := NULL; END IF;
				IF $_HealthProblemsID	= 'NULL' OR $_HealthProblemsID	= '' THEN SET $_HealthProblemsID := NULL; END IF;
				IF $_ReligionID	= 'NULL' OR $_ReligionID	= '' THEN SET $_ReligionID := NULL; END IF;		
				IF $_RestrictionType	= 'NULL' OR $_RestrictionType	= '' THEN SET $_RestrictionType := NULL; END IF;		
				
				
				IF $_TransactBy IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';	
				ELSEIF $_ProfileID IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'ProfileID is required.';			
				ELSEIF $_HealthProblemsID IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'HealthProblemsID is required.';				
				ELSEIF $_ReligionID IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'ReligionID is required.';			
				ELSE
					SET $_RestrictionsID	:= (SELECT IFNULL(MAX(`RestrictionsID`), 0) + 1 FROM  `T_Restrictions`);
					SET $_ProfileID = fn_login($_TransactBy,NULL,NULL,2);
					
					INSERT INTO `T_Restrictions`(
						`RestrictionsID`
						,`ProfileID`
						,`HealthProblemsID`
						,`ReligionID`
						,`RestrictionType`
						,`AddedbyUserLoginID`
					    )VALUE(
						 $_RestrictionsID
						,$_ProfileID
						,$_HealthProblemsID
						,$_ReligionID
						,$_RestrictionType
						,$_TransactBy	
					    );
					    
					IF ROW_COUNT() > 0 THEN
					
						IF $_Delimiter = 'SP' THEN -- return para sa SP
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 100;			
						
						ELSE			  -- return para sa model
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 103;			
						END IF;	
								
					ELSE
						signal SQLSTATE '45000' SET message_text = 'No mealplan is inserted.';	
					END IF;
				
				END IF;
				 
			END; -- end of flag 2		
		WHEN 3 THEN 
			 BEGIN
				/*
					Author		: 
					Table Accessed  : 
					Description     :  Remove from list
					DateCreated     : Nov 15, 2022
					Time 		:
					
					Module used:		
							
					CALL sp_restrictions(@ReturnIsSuccess, 
									 '{"RestrictionsID": "1", 
										  "TransactBy": 23, 
										  "Flag": 3
									}'
							)
						
				*/
				
				
				SET $_View 		:= 'restrictions_3'; 		
				SET $_RestrictionsID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.RestrictionsID")));	
					
				IF $_RestrictionsID	= 'NULL' OR $_RestrictionsID	= '' THEN SET $_RestrictionsID := NULL; END IF;
				IF $_HealthProblemsID	= 'NULL' OR $_HealthProblemsID	= '' THEN SET $_HealthProblemsID := NULL; END IF;
				IF $_ReligionID	= 'NULL' OR $_ReligionID	= '' THEN SET $_ReligionID := NULL; END IF;		
				IF $_RestrictionType	= 'NULL' OR $_RestrictionType	= '' THEN SET $_RestrictionType := NULL; END IF;		
				
				
				IF $_TransactBy IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';	
				ELSEIF $_RestrictionsID IS NULL THEN 
					signal SQLSTATE '45000' SET message_text = 'ProfileID is required.';					
				ELSE
					Update `T_Restrictions` 
						SET `ReferenceRestrictionID` = 10
							,`DateUpdated` = now()
							,`UpdatedByUserLoginID` = $_TransactBy
					WHERE `RestrictionsID` = $_RestrictionsID;
					
					IF ROW_COUNT() > 0 THEN
					
						IF $_Delimiter = 'SP' THEN -- return para sa SP
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 100;			
						
						ELSE			  -- return para sa model
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 103;			
						END IF;	
								
					ELSE
						signal SQLSTATE '45000' SET message_text = 'No mealplan is inserted.';	
					END IF;
				
				END IF;
				 
			END; -- end of flag 3							
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_RestrictionsID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			Select 
					A.`RestrictionsID`
					,A.`ProfileID`
					,`fn_profile`(A.`ProfileID`,null,1)     AS 'Name'
					,A.`HealthProblemsID`
					,B.`HealthCondition`
					,B.`Allergies`
					,B.`MedicalHistory`
					,C.`ReligionType`
					,A.`ReligionID`
					,A.`RestrictionType`
					,'1'					AS 'IsSuccess'
					,'Success' 				AS 'Result'
					,$_View 				AS 'View'
			FROM `T_Restrictions` A
			INNER JOIN `M_HealthProblems` B ON A.`HealthProblemsID` = B.`HealthProblemsID`
			INNER JOIN `M_Religion` C ON A.`ReligionID` = C.`ReligionID`
			WHERE A.`RestrictionsID` = $_RestrictionsID;
				        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_usergroupmember` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_usergroupmember` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usergroupmember`(
           OUT $ReturnIsSuccess		BIGINT  -- For SP Calling
	  ,$JSON			LONGTEXT
)
BEGIN
	DECLARE $_UserGroupMemberID		VARCHAR(10)  DEFAULT NULL;
	DECLARE $_UserGroupID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_UserLoginID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_EffectiveDate 		VARCHAR(30)  DEFAULT NULL;
	DECLARE $_ExpiryDate			VARCHAR(30)  DEFAULT NULL;
	
	/*standard variables start*/	
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	/*standard variables end*/
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	END;	
	
	SET autocommit 		   := 0;
	SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;
	/*Do not remove default common parameter end*/
		
	CASE $_Flag
	    WHEN 1 THEN 
		BEGIN
			/*
				Author          : 
				Table Accessed  : 
				Description     :  
				DateCreated     : 
				Time 		: 
				
				Module Used:
				
				CALL sp_usergroupmember(
					   @ReturnIsSuccess
					  ,'{
						 "ProfileName": "Armando"
						,"Flag": "1"
					    }' 	
				);
				
			*/
			SET $_View 	     	:= 'usergroupmember_1';
			SET @_EffectiveDate 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.EffectiveDate")));				
			SET @_UserGroupID 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserGroupID")));	
			SET $_UserLoginID 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLoginID")));
			
			IF @_EffectiveDate 	= 'NULL' OR @_EffectiveDate	= '' THEN SET @_EffectiveDate 	  := NULL; END IF;
			IF @_UserGroupID 	= 'NULL' OR @_UserGroupID 	= '' THEN SET @_UserGroupID   		:= NULL; END IF;
			IF $_UserLoginID 	= 'NULL' OR $_UserLoginID 	= '' THEN SET $_UserLoginID 	  := NULL; END IF;
				 
			IF EXISTS(SELECT 1 FROM M_UserGroupMember
					WHERE `UserGroupID` = $_UserGroupID
					  AND `UserLoginID` = $_UserLoginID)THEN
				signal SQLSTATE '45000' SET message_text = 'User Group Member is already exist in the record.';
			END IF;	
				
			SET $_UserGroupMemberID := (SELECT IFNULL(MAX(`UserGroupMemberID`), 0) + 1 FROM M_UserGroupMember);
			
			INSERT INTO M_UserGroupMember(
			
				 `UserGroupMemberID`
				,`UserGroupID`
				,`UserLoginID`
				,`EffectiveDate`
				,`AddedbyUserLoginID`
			    )
			 VALUE
			    (	  
				 $_UserGroupMemberID
				,@_UserGroupID
				,$_UserLoginID
				,@_EffectiveDate
				,$_TransactBy	
			    );
			    
			IF ROW_COUNT() > 0 THEN		
				IF $_Delimiter = 'SP' THEN
					SET $_ErrorMsg    := 'Success on inserted';
					SET $_ErrorNumber := 100; -- return para sa sp				
				ELSE 
					SET $_ErrorMsg    := 'Success on inserted';
					SET $_ErrorNumber := 103; -- return para sa model					
				END IF;
			ELSE
				signal SQLSTATE '45000' SET message_text = 'Error on insert';				
			END IF;				  
			
		END; -- end of flag 1	
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';	
	END CASE;  
	/*CATCH PARA SA MGA RETURNS START*/
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_UserGroupMemberID;
	     WHEN 101   THEN -- error return for SP
	        SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
	        BEGIN
			SET autocommit := 1;
			
			SELECT 
			  A.UserGroupMemberID,
			  A.UserGroupID,
			  A.UserLoginID,
			  A.EffectiveDate,
			  A.ExpiryDate,
			  A.ReferenceTableStatusID		AS 'TableStatusID',
			  F.ReferenceLongDescription		AS 'TableStatus',
			  B.UserGroupName,
			  C.UserLoginName,
			  C.UserLoginPassword,
			  D.UserMainGroupID,
			  D.UserMainGroupName,
			  UPPER(CONCAT(CONCAT(TRIM(E.`ProfileFirstName`),' ',IFNULL(TRIM(E.`ProfileMiddleName`),'')),CONCAT(' ',TRIM(E.`ProfileLastName`),' ',IFNULL(TRIM(E.`ProfileExtName`),'')))) AS 'ProfileName',
			  E.ProfileFirstName,
			  E.ProfileMiddleName,
			  E.ProfileLastName,
			  E.ProfileExtName
			FROM M_UserGroupMember			A
			  INNER JOIN M_UserGroup		B ON B.UserGroupID 	= A.UserGroupID
			  INNER JOIN M_UserLogin		C ON C.UserLoginID	= A.UserLoginID
			  INNER JOIN M_UserMainGroup		D ON D.UserMainGroupID	= B.UserMainGroupID		  
			  INNER JOIN M_Profile			E ON E.ProfileID 	= C.ProfileID
			  INNER JOIN M_Reference		F ON F.ReferenceID	= A.ReferenceTableStatusID
			WHERE 
			      A.`UserGroupMemberID` = $_UserGroupMemberID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	       
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_userlogin` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_userlogin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_userlogin`(
	 OUT $ReturnIsSuccess	BIGINT  -- For SP Calling
	  ,$JSON		LONGTEXT
)
BEGIN
	DECLARE $_UserLoginID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ProfileID			VARCHAR(10)  DEFAULT NULL;
	DECLARE $_UserLoginName			VARCHAR(100) DEFAULT NULL;
	DECLARE $_UserLoginPassword		VARCHAR(100) DEFAULT NULL;
	DECLARE $_UserLoginPW_LastChanged	VARCHAR(50)  DEFAULT NULL;	
	DECLARE $_UserLoginForce_PW_Change	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_ReferenceTableStatusID  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Delimiter 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_TransactBy  		  	VARCHAR(10)  DEFAULT NULL;
	DECLARE $_Flag 	 	  	  	VARCHAR(50)  DEFAULT NULL;
	DECLARE $_View 	 	  	  	VARCHAR(50);
	DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
	DECLARE $_DelimiterData		  	LONGTEXT;
	DECLARE $_ErrorNumber	 	  	INT; 
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	 BEGIN
	  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	  SET @full_error = @text;
	  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
	  ROLLBACK;
	 END;	
	
	 SET autocommit 		   := 0;
	 SET max_sp_recursion_depth := 255;
	
	/*Do not remove default common parameter start*/
	SET $_ReferenceTableStatusID  	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ReferenceTableStatusID")));	
	SET $_Delimiter  		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimiter")));	
	SET $_TransactBy 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.TransactBy")));	
	SET $_Flag 	 		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag")));	
	
	IF $_ReferenceTableStatusID 	= 'NULL' OR $_ReferenceTableStatusID  = '' THEN SET $_ReferenceTableStatusID = NULL; END IF;	
	IF $_Delimiter	  	    	= 'NULL' OR $_Delimiter   	      = '' THEN SET $_Delimiter  	     = NULL; END IF;			
	IF $_TransactBy   	    	= 'NULL' OR $_TransactBy  	      = '' THEN SET $_TransactBy 	     = NULL; END IF;			
	IF $_Flag 	  	    	= 'NULL' OR $_Flag 	    	      = '' THEN SET $_Flag       	     = NULL; END IF;			
	/*Do not remove default common parameter end*/		
		
	 CASE $_Flag
	    WHEN 1 THEN 
		 BEGIN
			/*
			Author		:
			Description     : display logins
			DateCreated     :
			Time 		: 8:00PM
			
			Module used:		
					
				
			CALL sp_userlogin(
				@ReturnIsSuccess		
				,'{
				      "ProfileID": "1"
				     ,"Flag": "1"
				  }' 	
				);
			*/
			
			SET $_View 	 := 'userlogin_1';
			SET @_ProfileID  := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));				
			
			IF @_ProfileID   = 'NULL' OR @_ProfileID = '' THEN SET @_ProfileID := NULL; END IF;
			
			SET @_ExpertID = (SELECT `ExpertsID` FROM `MT_Experts` WHERE `ProfileID` = @_ProfileID);
			SET @_ExpertStatusID = (SELECT `ReferenceExpertsStatusID` FROM `MT_Experts` WHERE `ExpertsID` = @_ExpertID);
				
			IF @_ProfileID IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'ProfileID is required.';	
			ELSEIF IFNULL(@_ExpertID,0) > 0 AND @_ExpertStatusID = 5 THEN -- verified
				signal SQLSTATE '45000' SET message_text = 'Please wait as our admin is still verifying your certificate.';										
			ELSE
				SELECT 
					 A.`UserLoginID`
					,A.ProfileID 
					,A.`UserLoginName`
					,CONCAT(B.`ProfileFirstName`, ' ',B.`ProfileLastName`)
										AS 'Fullname'
					,'1' 					AS 'IsSuccess'
					,' Success' 				AS 'Result' 
					,$_View 				AS 'View'
				
				FROM `M_UserLogin` A
					JOIN M_Profile B ON B.ProfileID = A.ProfileID
				WHERE
					    A.ProfileID = @_ProfileID
					AND A.`ReferenceTableStatusID` = 1
					 
				ORDER BY A.`UserLoginName` ASC;
				
				IF $_Delimiter 		 = 'SP' THEN 
				      SET $_ErrorNumber := 104;        -- return  para sa SP
				ELSE						
				      SET $_ErrorNumber := 105;						
				END IF;			
			END IF;
							 
		END; -- end of flag 1
	    WHEN 2 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : August 20, 2023
				Time 		: 7:33 PM
				
				Module used:		
						
				CALL sp_userlogin(
					@ReturnIsSuccess		
					,'{
						 "UserLoginID": "5"
						,"UserLoginPassword": "12345"						
						,"TransactBy": "1"						
						,"Flag": "1"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'userlogin_2'; 		
			SET $_UserLoginPassword := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLoginPassword")));		
			SET $_ProfileID := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.ProfileID")));		
			SET $_UserLoginName := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserName")));	
		
			
			IF $_UserLoginPassword 	= 'NULL' OR $_UserLoginPassword	= '' THEN SET $_UserLoginPassword	:= NULL; END IF;			
			IF $_ProfileID 	= 'NULL' OR $_ProfileID	= '' THEN SET $_ProfileID  	:= NULL; END IF;			
			IF $_UserLoginName 	= 'NULL' OR $_UserLoginName	= '' THEN SET $_UserLoginName  	:= NULL; END IF;
			
			IF $_UserLoginPassword IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'UserLoginPassword is required.';												
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET $_UserLoginID 	:= (SELECT IFNULL(MAX(`UserLoginID`), 0) + 1 FROM M_UserLogin);
				SET @_HashPass    	:= (SELECT fn_passwordgenerator( CONCAT('DYN', $_UserLoginPassword) ));
				
				IF NOT EXISTS(SELECT 1 FROM M_UserLogin WHERE TRIM(UserLoginName) = TRIM($_UserLoginName)) THEN	
					INSERT INTO M_UserLogin(
						 `UserLoginID`
						,`ProfileID`
						,`UserLoginName`
						,`UserLoginPassword`
						,`AddedbyUserLoginID`
					    )VALUE(
						 $_UserLoginID
						,$_ProfileID
						,$_UserLoginName
						,@_HashPass
						,$_TransactBy	
					    );
					    
					IF ROW_COUNT() > 0 THEN		
						IF $_Delimiter = 'SP' THEN -- return para sa SP
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 100;			
						
						ELSE			  -- return para sa model
							SET $_ErrorMsg 	  := 'Success';
							SET $_ErrorNumber := 103;			
						END IF;
					ELSE
						signal SQLSTATE '45000' SET message_text = 'No User Login is inserted.';	
					END IF;			
				ELSE 
					signal SQLSTATE '45000' SET message_text = 'UserLogin is already exist';		      		
				END IF;
			 END IF;
		END; -- end of flag 2		
	    WHEN 3 THEN 
		 BEGIN
			/*
				Author		: 
				Table Accessed  : 
				Description     :  
				DateCreated     : Nov 2, 2023
				Time 		: 7:13 PM
				
				Module used:		
						
				CALL sp_userlogin(
					@ReturnIsSuccess		
					,'{
						 "UserLoginID": "5"
						,"UserLoginPassword": "12345"						
						,"TransactBy": "1"						
						,"Flag": "3"
						}' 	
					);
			*/
			
			
			SET $_View 		:= 'userlogin_2'; 		
			SET $_UserLoginPassword := TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLoginPassword")));
		
			
			IF $_UserLoginPassword 	= 'NULL' OR $_UserLoginPassword	= '' THEN SET $_UserLoginPassword	:= NULL; END IF;			
			
			IF $_UserLoginPassword IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'UserLoginPassword is required.';											
			ELSEIF $_TransactBy IS NULL THEN
				signal SQLSTATE '45000' SET message_text = 'TransactBy is required.';								
			ELSE 
				SET @_HashPass    	:= (SELECT fn_passwordgenerator( CONCAT('DYN', $_UserLoginPassword) ));
				SET $_UserLoginID  = $_TransactBy;
				
				UPDATE M_UserLogin
				SET `UserLoginPassword`   = @_HashPass 
				     ,`UpdatedbyUserLoginID` = $_TransactBy
				     ,`DateUpdated` = now()
				Where UserLoginID = $_UserLoginID;
				IF ROW_COUNT() > 0 THEN		
					IF $_Delimiter = 'SP' THEN -- return para sa SP
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 100;			
					ELSE			  -- return para sa model
						SET $_ErrorMsg 	  := 'Success';
						SET $_ErrorNumber := 103;			
					END IF;
				ELSE
					signal SQLSTATE '45000' SET message_text = 'The password change was not successful.';	
				END IF;	
			 END IF;
		END; -- end of flag 3	
	    ELSE
			signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	 END CASE;
	
	
	/* CATCH PARA SA MGA RETURNS START */
	CASE $_ErrorNumber
	     WHEN 100   THEN -- sp return success
		SET autocommit 	       := 0;
		SET $ReturnIsSuccess   := $_UserLoginID;
	     WHEN 101   THEN -- error return for SP
		SET autocommit         := 0;
		SET $ReturnIsSuccess   := 0;
	     WHEN 102  THEN -- error return for model 
		SET autocommit 	       := 0;
		SELECT
		      0       		AS 'IsSuccess'
		     ,$_ErrorMsg    	AS 'Result';
		ROLLBACK;
	     WHEN 103  THEN
		BEGIN
			SET autocommit := 1;
			
			SELECT
				 A.`UserLoginID`
				,A.`ProfileID`
				,A.`UserLoginName`
				,A.`UserLoginPassword`
				,A.`UserLoginPW_LastChanged`
				,A.`UserLoginForce_PW_Change`
				,B.`ReferenceLongDescription` 		AS 'TableStatus'				
				,A.`ReferenceTableStatusID`		AS 'TableStatusID'
				,'1'					AS 'IsSuccess'
				,'Success' 				AS 'Result'
				,$_View 				AS 'View'
					
					
			FROM `M_UserLogin` A
				JOIN M_Reference B ON B.ReferenceID = A.ReferenceTableStatusID
			WHERE
				 A.`UserLoginID` = $_UserLoginID;	        
		END;
	     WHEN 104  THEN -- return for select within the sp
		SET autocommit := 0;
	     WHEN 105  THEN -- return for select where the query is coming from model
		SET autocommit := 1;
	     ELSE
		signal SQLSTATE '45000' SET message_text = 'ErrorNumber is required.';	         
	END CASE;  
	/*CATCH PARA SA MGA RETURNS END*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_verifylogin` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_verifylogin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_verifylogin`(
           OUT $ReturnIsSuccess		BIGINT  -- For SP Calling
	  ,$JSON			LONGTEXT
)
BEGIN
DECLARE $_UserID 	   		INT DEFAULT 0;
DECLARE $_UserLogIP        		VARCHAR(500) DEFAULT NULL;
DECLARE $_UserLogLocalIP       		VARCHAR(500) DEFAULT NULL;
DECLARE $_UserLogHost        		VARCHAR(500) DEFAULT NULL;
DECLARE $_UserLogin 	 	  	VARCHAR(50) DEFAULT NULL;
DECLARE $_UserPassword 	  	  	VARCHAR(50) DEFAULT NULL;
DECLARE $_Flag 	 	  	  	VARCHAR(50);
DECLARE $_Delimeter 	  	  	VARCHAR(50) DEFAULT NULL;
DECLARE $_DelimiterData		  	LONGTEXT;
DECLARE $_View 	 	  	  	VARCHAR(50);
DECLARE $_ErrorMsg 	 	  	VARCHAR(1000);
DECLARE $_ErrorNumber	 	  	INT; 	
DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
  SET @full_error = @text;
  SELECT '0' AS 'IsSuccess', @full_error AS 'Result';
  ROLLBACK;
END;
	SET autocommit := 0;
	SET max_sp_recursion_depth := 255;
	
	SET $_Delimeter  := JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Delimeter"));	
	SET $_Flag 	 := JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.Flag"));	
	
	
	CASE $_Flag
	    WHEN 1 THEN 
		BEGIN
			/*
				Author          : Armando Garing Ii	
				Table Accessed  : 
				Description     : for pos login
				DateCreated     : April 23 2021
				Time 		: 1:00PM
			
				Module Used:
				select fn_login(1,'demo','DYNqwerty',1)
				CALL sp_verifylogin(
							   @ReturnIsSuccess		
							  ,'{
								 "UserLogin": "zunakis@gmail.com"
								,"UserPassword": "DYNqwerty"
								,"UserLogIP": "1.1.1.1"
								,"TransactBy": "1"
								,"Flag": "1"
							    }' 	
				);
				
								
				
			*/
			SET $_View 		:= 'verifylogin_1';
			SET $_UserLogin		:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLogin")));
			SET $_UserPassword	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserPassword")));
			SET $_UserLogIP   	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLogIP")));
			SET $_UserLogHost 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLogHost")));
			SET $_UserLogLocalIP 	:= TRIM(JSON_UNQUOTE(JSON_EXTRACT($JSON,"$.UserLogLocalIP")));																			
	
			IF $_UserLogin IS NULL OR $_UserLogin = 'NULL' OR $_UserLogin = '' THEN
				signal SQLSTATE '45000' SET message_text = 'Username is required.';	
			ELSEIF $_UserPassword IS NULL OR $_UserPassword = 'NULL' OR $_UserPassword = '' THEN
				signal SQLSTATE '45000' SET message_text = 'Password is required.';					
			ELSE 
				SET @_UserLogin := TRIM($_UserLogin);
				SET @_Password := fn_passwordgenerator(TRIM($_UserPassword));			
				SET $_UserID := (SELECT 
							`UserLoginID` 
						FROM `M_UserLogin` 
						WHERE 
							    UserLoginName     	   = @_UserLogin
							AND UserLoginPassword 	   = @_Password
							AND ReferenceTableStatusID = 1 -- active
							LIMIT 1);
				
				SET @_ProfileID = (SELECT `ProfileID` FROM `M_UserLogin` WHERE `UserLoginID` = $_UserID);
				SET @_ExpertID = (SELECT `ExpertsID` FROM `MT_Experts` WHERE `ProfileID` = @_ProfileID);
				SET @_ExpertStatusID = (SELECT `ReferenceExpertsStatusID` FROM `MT_Experts` WHERE `ExpertsID` = @_ExpertID);
				
				IF @_ExpertID IS NOT NULL AND @_ExpertStatusID = 5 THEN -- verified
					signal SQLSTATE '45000' SET message_text = 'Please wait as our admin is still verifying your certificate.';										
				ELSEIF fn_login($_UserID,$_UserLogin,$_UserPassword,1) = 'Y' THEN
								
					SET autocommit := 1;
					SET @_GroupIDs := (SELECT fn_usergroup($_UserID ,NULL,1));
					
					SELECT
						 
						 `ProfileID`
						,`ProfileFirstName`
						,`ProfileLastName`
						,`ProfileMiddleName`
						,`ProfileExtName`
						,`ProfileBirthdate`
						,`ProfilePic` AS 'ProfilePicUrl'
						,`UserLoginID`
						,`UserLoginName`
						,`ModuleController`
						,'1' 			AS 'IsSuccess'
						,'Success' 		AS 'Result'				
					FROM (
						SELECT  DISTINCT
								 F.`ProfileID`
								,F.`ProfileFirstName`
								,F.`ProfileLastName`
								,F.`ProfileMiddleName`
								,F.`ProfileExtName`
								,F.`ProfileBirthdate`
								,F.`ProfilePic`
								,C.`UserLoginID`	
								,C.`UserLoginName`		
								,I.`ModuleController`
						FROM M_UserRights		A
							JOIN  M_UserLogin 		C ON C.`UserLoginID` 	= A.`UserLoginID`
							JOIN  M_Profile 		F ON F.ProfileID	= C.ProfileID
							JOIN  M_UserModule 		I ON I.`ModuleID`	= A.ModuleID     
						WHERE	
									C.`UserLoginName` 		= @_UserLogin
								AND 	C.`UserLoginPassword`  		= @_Password
								AND 	A.`ReferenceTableStatusID` 	= 1 -- active
								AND 	C.`ReferenceTableStatusID` 	= 1 -- active
								AND 	F.`ReferenceTableStatusID` 	= 1 -- active					
								AND 	I.`ReferenceTableStatusID` 	= 1 -- active														
				
							
						UNION ALL
							
						SELECT  DISTINCT
								 F.`ProfileID`
								,F.`ProfileFirstName`
								,F.`ProfileLastName`
								,F.`ProfileMiddleName`
								,F.`ProfileExtName`
								,F.`ProfileBirthdate`
								,F.`ProfilePic`
								,C.`UserLoginID`	
								,C.`UserLoginName`		
								,I.`ModuleController`
				
						FROM M_UserRights			A
							JOIN  M_UserGroup 		G ON G.UserGroupID 		= A.UserGroupID
							JOIN  M_UserGroupMember 	H ON H.UserGroupID		= G.UserGroupID
							JOIN  M_UserLogin 		C ON C.UserLoginID 		= H.`UserLoginID`
							JOIN  M_Profile 		F ON F.ProfileID		= C.ProfileID
							JOIN  M_UserModule 		I ON I.`ModuleID` 		= A.ModuleID AND I.ModuleController IS NOT NULL
						WHERE
								FIND_IN_SET(A.UserGroupID, @_GroupIDs)
								AND	C.`UserLoginName` 		= @_UserLogin
								AND 	C.`UserLoginPassword`  		= @_Password
								AND 	A.`ReferenceTableStatusID` 	= 1 -- active
								AND 	G.`ReferenceTableStatusID` 	= 1 -- active
								AND 	H.`ReferenceTableStatusID` 	= 1 -- active				
								AND 	C.`ReferenceTableStatusID` 	= 1 -- active
								AND 	F.`ReferenceTableStatusID` 	= 1 -- active					
								AND 	I.`ReferenceTableStatusID` 	= 1 -- active				
							
					) AS Login LIMIT 1;				
									
				ELSE
					SELECT 
						 '0'		  AS 'IsSuccess'
						,'user not found' AS 'Result';						
				END IF;				
			END IF;
		END; -- end sa $Flag 1			    
	    ELSE
		signal SQLSTATE '45000' SET message_text = 'Flag is required.';
	END CASE; 
	
	
		
 
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
