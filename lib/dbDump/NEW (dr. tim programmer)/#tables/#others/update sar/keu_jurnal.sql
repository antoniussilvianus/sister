/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-12-17 08:50:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_jurnal
-- ----------------------------
DROP TABLE IF EXISTS `keu_jurnal`;
CREATE TABLE `keu_jurnal` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `transaksi` int(11) NOT NULL,
  `detilrekening` int(11) NOT NULL,
  `nominal` decimal(14,0) NOT NULL DEFAULT '0',
  `jenisrekening` enum('d','k') NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `transaksi` (`transaksi`) USING BTREE,
  KEY `detilrekening` (`detilrekening`) USING BTREE,
  CONSTRAINT `detilrekeningFK2` FOREIGN KEY (`detilrekening`) REFERENCES `keu_detilrekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaksiFK` FOREIGN KEY (`transaksi`) REFERENCES `keu_transaksi` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jurnal
-- ----------------------------
INSERT INTO `keu_jurnal` VALUES ('362', '218', '194', '14000000', 'k', '2015-12-15 02:07:33');
INSERT INTO `keu_jurnal` VALUES ('363', '218', '14', '14000000', 'd', '2015-12-15 02:07:33');
INSERT INTO `keu_jurnal` VALUES ('370', '222', '277', '30000', 'd', '2015-12-15 02:30:45');
INSERT INTO `keu_jurnal` VALUES ('371', '222', '1', '30000', 'k', '2015-12-15 02:30:46');
INSERT INTO `keu_jurnal` VALUES ('372', '223', '247', '50000', 'd', '2015-12-17 02:42:08');
INSERT INTO `keu_jurnal` VALUES ('373', '223', '1', '50000', 'k', '2015-12-17 02:42:08');
INSERT INTO `keu_jurnal` VALUES ('374', '224', '312', '900000', 'd', '2015-12-17 08:31:03');
INSERT INTO `keu_jurnal` VALUES ('375', '224', '2', '900000', 'k', '2015-12-17 08:31:04');
