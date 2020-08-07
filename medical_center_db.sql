/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.26-log : Database - medical_center_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`medical_center_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `medical_center_db`;

/*Table structure for table `bulk_billing` */

DROP TABLE IF EXISTS `bulk_billing`;

CREATE TABLE `bulk_billing` (
  `bulk_billing_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_number` int(11) DEFAULT NULL,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` int(11) DEFAULT NULL,
  `medicare_reference_number` varchar(255) DEFAULT NULL,
  `consultation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bulk_billing_id`),
  KEY `consultation_id` (`consultation_id`),
  CONSTRAINT `bulk_billing_ibfk_1` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bulk_billing` */

/*Table structure for table `consultation` */

DROP TABLE IF EXISTS `consultation`;

CREATE TABLE `consultation` (
  `consultation_id` int(11) NOT NULL AUTO_INCREMENT,
  `consultation_number` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `symptoms` varchar(255) DEFAULT NULL,
  `special_remarks` varchar(255) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`consultation_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `consultation_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `consultation` */

/*Table structure for table `consultation_bill` */

DROP TABLE IF EXISTS `consultation_bill`;

CREATE TABLE `consultation_bill` (
  `consultation_bill` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`consultation_bill`),
  KEY `payment_method_id` (`payment_method_id`),
  CONSTRAINT `consultation_bill_ibfk_1` FOREIGN KEY (`payment_method_id`) REFERENCES `method_payment` (`payment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `consultation_bill` */

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_number` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `doctor` */

/*Table structure for table `method_payment` */

DROP TABLE IF EXISTS `method_payment`;

CREATE TABLE `method_payment` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `method_payment` */

/*Table structure for table `patient` */

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `medicare_number` varchar(255) DEFAULT NULL,
  `private_health_cover_number` varchar(255) DEFAULT NULL,
  `health_cover_company` varchar(255) DEFAULT NULL,
  `telephone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `patient` */

/*Table structure for table `prescriptions` */

DROP TABLE IF EXISTS `prescriptions`;

CREATE TABLE `prescriptions` (
  `prescriptions_id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(255) DEFAULT NULL,
  `dosage` varchar(255) DEFAULT NULL,
  `number_of_repeats` int(11) DEFAULT NULL,
  `special_
instructions` varchar(255) DEFAULT NULL,
  `consultation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`prescriptions_id`),
  KEY `consultation_id` (`consultation_id`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `prescriptions` */

/*Table structure for table `qualification` */

DROP TABLE IF EXISTS `qualification`;

CREATE TABLE `qualification` (
  `qualification_id` int(11) NOT NULL AUTO_INCREMENT,
  `qualification` varchar(255) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`qualification_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `qualification_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qualification` */

/*Table structure for table `referral` */

DROP TABLE IF EXISTS `referral`;

CREATE TABLE `referral` (
  `referral_id` int(11) NOT NULL AUTO_INCREMENT,
  `procedure_name` varchar(255) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `referred_practitioner` varchar(255) DEFAULT NULL,
  `referral_choice` varchar(255) DEFAULT NULL,
  `consltation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`referral_id`),
  KEY `consltation_id` (`consltation_id`),
  CONSTRAINT `referral_ibfk_1` FOREIGN KEY (`consltation_id`) REFERENCES `consultation` (`consultation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `referral` */

/*Table structure for table `specialization` */

DROP TABLE IF EXISTS `specialization`;

CREATE TABLE `specialization` (
  `specialization_id` int(11) NOT NULL AUTO_INCREMENT,
  `specialization` varchar(255) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`specialization_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `specialization_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `specialization` */

/*Table structure for table `up_front_payment` */

DROP TABLE IF EXISTS `up_front_payment`;

CREATE TABLE `up_front_payment` (
  `up_front_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_number` int(11) DEFAULT NULL,
  `payment_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` int(11) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `consultation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`up_front_payment_id`),
  KEY `consultation_id` (`consultation_id`),
  CONSTRAINT `up_front_payment_ibfk_1` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `up_front_payment` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
