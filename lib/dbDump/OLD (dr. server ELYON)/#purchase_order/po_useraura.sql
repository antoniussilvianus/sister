﻿# Host: localhost  (Version: 5.5.27)
# Date: 2015-06-17 00:18:35
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "po_useraura"
#

DROP TABLE IF EXISTS `po_useraura`;
CREATE TABLE `po_useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator','Payroll','HRD') NOT NULL DEFAULT 'Administrator',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `biodata` text NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

#
# Data for table "po_useraura"
#

/*!40000 ALTER TABLE `po_useraura` DISABLE KEYS */;
INSERT INTO `po_useraura` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','admin@elyon.sch.id','af0675a9e843c6c8f78163a9118efc78.jpg','Administrator','aktif',1,'2015-05-12 09:15:46','2010-08-27 00:00:00','2034-08-27 00:00:00','<p><b>none</b></p>'),(28,'superadmin','b11d5ece6353d17f85c5ad30e0a02360','rekysda@gmail.com','','Administrator','aktif',1,'2015-03-21 23:05:28','0000-00-00 00:00:00','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `po_useraura` ENABLE KEYS */;
