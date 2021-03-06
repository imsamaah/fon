/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 10.1.13-MariaDB : Database - fib_route
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fib_route` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fib_route`;

/*Table structure for table `olt` */

DROP TABLE IF EXISTS `olt`;

CREATE TABLE `olt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `olt` */

insert  into `olt`(`id`,`name`) values (1,'DHO-HUAWEI OLT 1'),(2,'S2-HUAWEI OLT 1');

/*Table structure for table `olt_card` */

DROP TABLE IF EXISTS `olt_card`;

CREATE TABLE `olt_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `olt_id` int(11) DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `olt_card` */

insert  into `olt_card`(`id`,`olt_id`,`card_number`) values (1,1,'0'),(2,1,'1'),(3,1,'2'),(4,1,'3'),(5,1,'4'),(6,1,'5'),(7,1,'6'),(11,1,'7'),(12,2,'0'),(13,2,'1'),(14,2,'2'),(15,2,'3'),(16,2,'4'),(17,2,'5'),(18,2,'6'),(19,2,'7');

/*Table structure for table `olt_card_port` */

DROP TABLE IF EXISTS `olt_card_port`;

CREATE TABLE `olt_card_port` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `olt_card_id` int(11) DEFAULT NULL,
  `port` varchar(20) DEFAULT NULL,
  `bandwidth` varchar(100) DEFAULT NULL,
  `max_cust` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `olt_card_port` */

insert  into `olt_card_port`(`id`,`olt_card_id`,`port`,`bandwidth`,`max_cust`) values (1,1,'1','1G',3),(2,1,'2','100M',44),(3,1,'3','1G',100),(4,1,'4','1G',56),(5,1,'5','0.5G',40),(6,1,'6','30M',33),(7,1,'7','90M',32),(8,1,'8','1G',78);

/*Table structure for table `olt_splitter` */

DROP TABLE IF EXISTS `olt_splitter`;

CREATE TABLE `olt_splitter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `olt_splitter` */

/*Table structure for table `plant_items` */

DROP TABLE IF EXISTS `plant_items`;

CREATE TABLE `plant_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `plant_items` */

insert  into `plant_items`(`id`,`plant_name`) values (1,'OLT'),(2,'RACK'),(3,'ODF'),(4,'CAB'),(5,'DP');

/*Table structure for table `rack` */

DROP TABLE IF EXISTS `rack`;

CREATE TABLE `rack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `max_odf` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `rack` */

insert  into `rack`(`id`,`name`,`max_odf`) values (1,'S2 Sun Sea Rack 1',7),(2,'S6 Sun Sea Rack 1',8);

/*Table structure for table `rack_odf` */

DROP TABLE IF EXISTS `rack_odf`;

CREATE TABLE `rack_odf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rack_id` int(11) DEFAULT NULL,
  `odf_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `rack_odf` */

insert  into `rack_odf`(`id`,`rack_id`,`odf_number`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4);

/*Table structure for table `rack_odf_panel` */

DROP TABLE IF EXISTS `rack_odf_panel`;

CREATE TABLE `rack_odf_panel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rack_odf_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `rack_odf_panel` */

insert  into `rack_odf_panel`(`id`,`rack_odf_id`,`name`) values (1,1,'A'),(2,1,'B'),(3,1,'C'),(4,1,'D'),(5,1,'E'),(6,1,'F');

/*Table structure for table `rack_odf_panel_ports` */

DROP TABLE IF EXISTS `rack_odf_panel_ports`;

CREATE TABLE `rack_odf_panel_ports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rack_odf_panel_id` int(11) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `rack_odf_panel_ports` */

insert  into `rack_odf_panel_ports`(`id`,`rack_odf_panel_id`,`port`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,8),(8,1,9),(9,1,10),(10,1,11),(11,1,12);

/*Table structure for table `routes` */

DROP TABLE IF EXISTS `routes`;

CREATE TABLE `routes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `route_number` varchar(255) DEFAULT NULL,
  `olt` int(11) DEFAULT NULL,
  `olt_card` int(11) DEFAULT NULL,
  `olt_card_port` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `routes` */

insert  into `routes`(`id`,`route_number`,`olt`,`olt_card`,`olt_card_port`,`updated_at`,`created_at`) values (3,'OSJgk0Q56AMBtUw',1,1,2,'2016-06-27 19:03:42','2016-06-27 19:03:42');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
