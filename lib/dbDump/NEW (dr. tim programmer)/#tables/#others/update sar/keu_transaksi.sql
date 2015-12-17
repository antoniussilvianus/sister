/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-12-17 08:49:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_transaksi
-- ----------------------------
DROP TABLE IF EXISTS `keu_transaksi`;
CREATE TABLE `keu_transaksi` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `idkwitansi` int(11) NOT NULL,
  `nobukti` varchar(50) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `uraian` text NOT NULL,
  `anggarantahunan` int(11) NOT NULL DEFAULT '0',
  `detjenistransaksi` int(11) NOT NULL,
  `idref` int(11) NOT NULL,
  `type` enum('sar','') DEFAULT NULL,
  `departemen` int(11) DEFAULT NULL,
  `tingkat` int(11) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `detjenistransaksi` (`detjenistransaksi`) USING BTREE,
  CONSTRAINT `detjenistransaksiFK` FOREIGN KEY (`detjenistransaksi`) REFERENCES `keu_detjenistransaksi` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_transaksi
-- ----------------------------
INSERT INTO `keu_transaksi` VALUES ('218', '1', '', '2015-11-09', 'Pembayaran DPP siswa <br> Nama : jacklyn anastasha<br> Kelas :', '0', '1', '26', null, '1', '1');
INSERT INTO `keu_transaksi` VALUES ('222', '2', '', '2015-12-15', 'kertas hvs ', '10', '6', '0', '', '1', '1');
INSERT INTO `keu_transaksi` VALUES ('223', '3', '', '2015-12-17', 'konsumsi kerja bakti sekolah', '19', '6', '0', '', '1', '1');
INSERT INTO `keu_transaksi` VALUES ('224', '4', 'INV1606150001', '2015-12-08', 'renovasi dapur umum ', '31', '4', '0', 'sar', '1', '6');
