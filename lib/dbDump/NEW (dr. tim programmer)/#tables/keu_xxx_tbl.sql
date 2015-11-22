/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-11-22 09:48:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_anggarantahunan
-- ----------------------------
DROP TABLE IF EXISTS `keu_anggarantahunan`;
CREATE TABLE `keu_anggarantahunan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(11) NOT NULL,
  `hargasatuan` decimal(14,0) NOT NULL DEFAULT '0',
  `tahunajaran` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `detilanggaran` (`detilanggaran`) USING BTREE,
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  CONSTRAINT `keu_anggarantahunan_ibfk_1` FOREIGN KEY (`detilanggaran`) REFERENCES `keu_detilanggaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tahunajaranFK4` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_anggarantahunan
-- ----------------------------
INSERT INTO `keu_anggarantahunan` VALUES ('9', '6', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('10', '6', '3000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('11', '6', '22000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('18', '9', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('19', '9', '18000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('20', '9', '20000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('21', '10', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('22', '10', '1000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('23', '10', '2000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('24', '11', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('25', '11', '6000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('26', '11', '4500', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('27', '12', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('28', '12', '0', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('29', '12', '2000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('30', '13', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('31', '13', '0', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('32', '13', '110000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('33', '14', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('34', '14', '400000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('35', '14', '500000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('36', '15', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('37', '15', '4500000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('38', '15', '0', '12');

-- ----------------------------
-- Table structure for keu_brg
-- ----------------------------
DROP TABLE IF EXISTS `keu_brg`;
CREATE TABLE `keu_brg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompokbrg` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `satuan` varchar(10) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_brg
-- ----------------------------
INSERT INTO `keu_brg` VALUES ('1', '1', 'ELKO001', 'Macbook pro 15 inch', '14', 'unit', '2014-01-11', '');
INSERT INTO `keu_brg` VALUES ('2', '4', 'KEMTR0001', 'Supra X 125', '3', '', '2014-01-11', '');

-- ----------------------------
-- Table structure for keu_budget
-- ----------------------------
DROP TABLE IF EXISTS `keu_budget`;
CREATE TABLE `keu_budget` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  `departemen` int(11) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_budget
-- ----------------------------
INSERT INTO `keu_budget` VALUES ('1', '1', 'Alat Penganggaran', '10000000', '', '1');
INSERT INTO `keu_budget` VALUES ('2', '1', 'anggaran', '2000000', '', '1');
INSERT INTO `keu_budget` VALUES ('3', '1', 'Angaran Lagi', '100000', '', '1');

-- ----------------------------
-- Table structure for keu_buktitransaksi
-- ----------------------------
DROP TABLE IF EXISTS `keu_buktitransaksi`;
CREATE TABLE `keu_buktitransaksi` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `buktitransaksi` varchar(50) NOT NULL,
  `keterangan` text,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_buktitransaksi
-- ----------------------------
INSERT INTO `keu_buktitransaksi` VALUES ('1', 'MMJ', 'xx xx Jurnal');
INSERT INTO `keu_buktitransaksi` VALUES ('2', 'BKM', 'Bukti Kas Masuk');
INSERT INTO `keu_buktitransaksi` VALUES ('3', 'BKK', 'Bukti Kas Keluar');
INSERT INTO `keu_buktitransaksi` VALUES ('4', 'BBM', 'Bukti Bank Masuk');
INSERT INTO `keu_buktitransaksi` VALUES ('5', 'BBK', 'Bukti Bank Keluar');

-- ----------------------------
-- Table structure for keu_detilanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilanggaran`;
CREATE TABLE `keu_detilanggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kategorianggaran` int(11) NOT NULL,
  `detilanggaran` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `kategorianggaran` (`kategorianggaran`),
  KEY `detilanggaran` (`detilanggaran`),
  CONSTRAINT `kategorianggaranFK` FOREIGN KEY (`kategorianggaran`) REFERENCES `keu_kategorianggaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilanggaran
-- ----------------------------
INSERT INTO `keu_detilanggaran` VALUES ('6', '15', 'Kertas HVS', 'untuk printing dokumen dll');
INSERT INTO `keu_detilanggaran` VALUES ('9', '17', 'beras', 'cadangan beras ');
INSERT INTO `keu_detilanggaran` VALUES ('10', '15', 'spidol', 'spidol papan tulis');
INSERT INTO `keu_detilanggaran` VALUES ('11', '15', 'map A4 coklat', 'tempat berkas');
INSERT INTO `keu_detilanggaran` VALUES ('12', '18', 'korek api', '');
INSERT INTO `keu_detilanggaran` VALUES ('13', '18', 'gas LPG', '');
INSERT INTO `keu_detilanggaran` VALUES ('14', '19', 'tagihan PDAM suko primary', '');
INSERT INTO `keu_detilanggaran` VALUES ('15', '20', 'service Komputer', '');

-- ----------------------------
-- Table structure for keu_detilrekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilrekening`;
CREATE TABLE `keu_detilrekening` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kategorirekening` int(11) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `kategorirekeningFK` (`kategorirekening`),
  CONSTRAINT `kategorirekeningFK` FOREIGN KEY (`kategorirekening`) REFERENCES `keu_kategorirekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilrekening
-- ----------------------------
INSERT INTO `keu_detilrekening` VALUES ('1', '1', '111101', 'KAS KECIL ', '');
INSERT INTO `keu_detilrekening` VALUES ('2', '1', '111102', 'KAS SATELIT', '');
INSERT INTO `keu_detilrekening` VALUES ('3', '1', '111103', 'KAS KERTAJAYA', 'ok');
INSERT INTO `keu_detilrekening` VALUES ('4', '1', '111104', 'KAS RUNGKUT', '');
INSERT INTO `keu_detilrekening` VALUES ('5', '1', '111199', 'KAS DALAM PERJALANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('6', '2', '111201', 'BCA AC NO. 5560060001', '');
INSERT INTO `keu_detilrekening` VALUES ('7', '2', '111202', 'BANK EKONOMI AC NO. 3031861275', '');
INSERT INTO `keu_detilrekening` VALUES ('8', '2', '111203', 'BCA AC NO. 4683800000', '');
INSERT INTO `keu_detilrekening` VALUES ('9', '2', '111204', 'DEPOSITO EKONOMI', '');
INSERT INTO `keu_detilrekening` VALUES ('10', '2', '111205', 'BANK MAYAPADA AC NO.201.300.17.000', '');
INSERT INTO `keu_detilrekening` VALUES ('11', '2', '111206', 'CIMB-NIAGA AC NO.216.01.00543.00.5 (dh.LIPPOBANK)', '');
INSERT INTO `keu_detilrekening` VALUES ('12', '2', '111207', 'DEPOSITO MAYAPADA/PANIN/CIMB', '');
INSERT INTO `keu_detilrekening` VALUES ('13', '2', '111208', 'DEPOSITO PANINBANK', '');
INSERT INTO `keu_detilrekening` VALUES ('14', '2', '111209', 'PANINBANK AC NO.448.50.8888.7', '');
INSERT INTO `keu_detilrekening` VALUES ('15', '2', '111210', 'MANDARI AC NO. 1420088800098', '');
INSERT INTO `keu_detilrekening` VALUES ('16', '2', '111211', 'BANK BCA 8290960101', '');
INSERT INTO `keu_detilrekening` VALUES ('17', '2', '111299', 'BANK DALAM PERJALANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('18', '3', '111900', 'AYAT SILANG KAS DAN BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('19', '3', '112100', 'TABUNGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('20', '3', '112200', 'DEPOSITO BERJANGKA', '-\r\n');
INSERT INTO `keu_detilrekening` VALUES ('21', '3', '112300', 'SURAT-SURAT BERHARGA', '');
INSERT INTO `keu_detilrekening` VALUES ('22', '3', '113100', 'PIUTANG USAHA', '');
INSERT INTO `keu_detilrekening` VALUES ('23', '3', '113200', 'PIUTANG YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('24', '3', '113300', 'PIUTANG CEK/GIRO MUNDUR', '');
INSERT INTO `keu_detilrekening` VALUES ('25', '3', '113400', 'CADANGAN PIUTANG RAGU-RAGU', '');
INSERT INTO `keu_detilrekening` VALUES ('26', '3', '113500', 'PIUTANG DIREKSI', '');
INSERT INTO `keu_detilrekening` VALUES ('27', '3', '113600', 'PIUTANG KARYAWAN', '');
INSERT INTO `keu_detilrekening` VALUES ('28', '3', '113700', 'PIUTANG PIHAK III', '');
INSERT INTO `keu_detilrekening` VALUES ('29', '3', '113999', 'PIUTANG LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('30', '3', '114100', 'UANG MUKA PEMBELIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('31', '3', '114901', 'TANAH', '');
INSERT INTO `keu_detilrekening` VALUES ('32', '3', '114902', 'KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('33', '3', '114903', 'MESIN DAN PERALATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('34', '3', '114904', 'BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('35', '3', '114905', 'INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('36', '3', '114906', 'UANG MUKA PERJALANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('37', '3', '114999', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('38', '3', '116121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('39', '3', '116122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('40', '3', '116123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('41', '3', '116125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening` VALUES ('42', '3', '116126', 'PPH PASAL 26', '');
INSERT INTO `keu_detilrekening` VALUES ('43', '3', '116151', 'PPN MASUKAN YANG SUDAH DIKREDITKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('44', '3', '116152', 'PPN MASUKAN YANG BELUM DIKREDITKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('45', '3', '116201', 'ASURANSI', '');
INSERT INTO `keu_detilrekening` VALUES ('46', '3', '116202', 'SEWA', '');
INSERT INTO `keu_detilrekening` VALUES ('47', '3', '116203', 'BUNGA LEASING', '');
INSERT INTO `keu_detilrekening` VALUES ('48', '3', '116204', 'ONGKOS ANGKUT', '');
INSERT INTO `keu_detilrekening` VALUES ('49', '3', '116299', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('50', '3', '121000', 'PENYERTAAN DALAM SURAT BERHARGA', '');
INSERT INTO `keu_detilrekening` VALUES ('51', '3', '122000', 'PENYERTAAN DALAM AKTIVA TETAP', '');
INSERT INTO `keu_detilrekening` VALUES ('52', '3', '123000', 'PENYERTAAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('53', '3', '141100', 'TANAH KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('54', '3', '141251', 'PRASARANA JALAN', '');
INSERT INTO `keu_detilrekening` VALUES ('55', '3', '141252', 'PRASARANA SALURAN AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('56', '3', '141253', 'PRASARANA TAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('57', '3', '141301', 'INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('58', '3', '141302', 'INSTALASI AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('59', '3', '141303', 'INSTALASI TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('60', '3', '141401', 'MESIN-MESIN', '');
INSERT INTO `keu_detilrekening` VALUES ('61', '3', '141451', 'MESIN-MESIN LEASING', '');
INSERT INTO `keu_detilrekening` VALUES ('62', '3', '141501', 'KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('63', '3', '141551', 'KENDARAAN LEASING KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('64', '3', '141601', 'INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('65', '3', '145201', 'AKUM. PENY. BANGUNAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('66', '3', '145202', 'AKUM. PENY. BANGUNAN KANTIN', '');
INSERT INTO `keu_detilrekening` VALUES ('67', '3', '145203', 'AKUM. PENY. BANGUNAN MESS', '');
INSERT INTO `keu_detilrekening` VALUES ('68', '3', '145251', 'AKUM. PENY. PRASARANA JALAN', '');
INSERT INTO `keu_detilrekening` VALUES ('69', '3', '145252', 'AKUM. PENY. PRASARANA SALURAN AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('70', '3', '145253', 'AKUM. PENY. PRASARANA TAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('71', '3', '145301', 'AKUM. PENY. INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('72', '3', '145302', 'AKUM. PENY. INSTALASI AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('73', '3', '145303', 'AKUM. PENY. INSTALASI TELPON', '');
INSERT INTO `keu_detilrekening` VALUES ('74', '3', '145401', 'AKUM. PENY. KENDARAAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('75', '3', '145451', 'AKUM. PENY. KENDARAAN LEASING KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('76', '3', '145501', 'AKUM. PENY. INVENTARIS KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('77', '3', '145502', 'AKUM. PENY. INVENTARIS KANTIN', '');
INSERT INTO `keu_detilrekening` VALUES ('78', '3', '151000', 'GOODWILL', '');
INSERT INTO `keu_detilrekening` VALUES ('79', '3', '152000', 'HAK PATEN', '');
INSERT INTO `keu_detilrekening` VALUES ('80', '3', '153000', 'LISENSI', '');
INSERT INTO `keu_detilrekening` VALUES ('81', '3', '154000', 'AKTIVA TIDAK BERWUJUD LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('82', '3', '161101', 'BIAYA PENDIRIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('83', '3', '161102', 'GAJI, TUNJANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('84', '3', '161103', 'BIAYA PERJALANAN DINAS', '');
INSERT INTO `keu_detilrekening` VALUES ('85', '3', '161104', 'ALAT TULIS & KEPERLUAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('86', '3', '161105', 'IJIN, LEGAL DAN PROFESIONAL FEE', '');
INSERT INTO `keu_detilrekening` VALUES ('87', '3', '161106', 'ENTERTAINMENT,REPRESEN,SUMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('88', '3', '161107', 'TELEPON, FAX, TELEGRAM, KIRIM SURAT', '');
INSERT INTO `keu_detilrekening` VALUES ('89', '3', '161108', 'BENSIN, PARKIR, TOL', '');
INSERT INTO `keu_detilrekening` VALUES ('90', '3', '161109', 'BIAYA ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('91', '3', '161110', 'BAHAN PENOLONG', '');
INSERT INTO `keu_detilrekening` VALUES ('92', '3', '161111', 'BIAYA IKLAN', '');
INSERT INTO `keu_detilrekening` VALUES ('93', '3', '161112', 'PAJAK-PAJAK', '');
INSERT INTO `keu_detilrekening` VALUES ('94', '3', '161113', 'REKENING LISTRIK, AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('95', '3', '161114', 'BIAYA STNK, BBN, DLL', '');
INSERT INTO `keu_detilrekening` VALUES ('96', '3', '161115', 'BUNGA, FEE, PROVISI BANK, DLL', '');
INSERT INTO `keu_detilrekening` VALUES ('97', '3', '161116', 'BIAYA PERESMIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('98', '3', '161117', 'BIAYA BAHAN BAKAR', '');
INSERT INTO `keu_detilrekening` VALUES ('99', '3', '161118', 'REPARASI & PEMELIHARAAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('100', '3', '161119', 'TRAINING, SEMINAR, TEST, DLL', '');
INSERT INTO `keu_detilrekening` VALUES ('101', '3', '161120', 'BIAYA MAKAN DAN MINUM', '');
INSERT INTO `keu_detilrekening` VALUES ('102', '3', '161121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('103', '3', '161122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('104', '3', '161123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('105', '3', '161124', 'REPARASI & PEMELIHARAAN KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('106', '3', '161125', 'REPARASI & PEMELIHARAAN MESS', '');
INSERT INTO `keu_detilrekening` VALUES ('107', '3', '161126', 'REPARASI & PEMELIHARAAN TANKI', '');
INSERT INTO `keu_detilrekening` VALUES ('108', '3', '161127', 'BIAYA PENGURUSAN LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('109', '3', '161128', 'REPARASI & PEMELIHARAAN BOTOL', '');
INSERT INTO `keu_detilrekening` VALUES ('110', '3', '161129', 'BIAYA SEWA GEDUNG', '');
INSERT INTO `keu_detilrekening` VALUES ('111', '3', '161130', 'BIAYA BUNGA LEASING', '');
INSERT INTO `keu_detilrekening` VALUES ('112', '3', '161143', 'SELISIH KURS', '');
INSERT INTO `keu_detilrekening` VALUES ('113', '3', '161144', 'BIAYA BUNGA PINJAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('114', '3', '161145', 'IURAN DAN ASURANSI', '');
INSERT INTO `keu_detilrekening` VALUES ('115', '3', '161146', 'BIAYA KEAMANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('116', '3', '161148', 'BIAYA PRA-OPERASI LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('117', '3', '161151', 'PENDAPATAN JASA GIRO', '');
INSERT INTO `keu_detilrekening` VALUES ('118', '3', '161152', 'PENDAPATAN BUNGA DEPOSITO', '');
INSERT INTO `keu_detilrekening` VALUES ('119', '3', '161153', 'PENDAPATAN BUNGA BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('120', '3', '161154', 'PENDAPATAN BUNGA PIHAK III', '');
INSERT INTO `keu_detilrekening` VALUES ('121', '3', '161199', 'PENDAPATAN PRA-OPERASI LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('122', '3', '161500', 'AKUM.AMORTISASI BIAYA PRA-OPERASI', '');
INSERT INTO `keu_detilrekening` VALUES ('123', '3', '162100', 'UANG JAMINAN LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('124', '3', '162200', 'UANG JAMINAN TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('125', '3', '163000', 'BIAYA YANG DITANGGUHKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('126', '3', '164000', 'BUNGA DALAM MASA KONSTRUKSI (IDC)', '');
INSERT INTO `keu_detilrekening` VALUES ('127', '3', '165201', 'BANGUNAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('128', '3', '165301', 'INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('129', '3', '165302', 'INSTALASI AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('130', '3', '165303', 'INSTALASI TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('131', '3', '166000', 'BIAYA PENELITIAN DAN PENGEMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('132', '3', '169000', 'AKTIVA LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('133', '4', '211101', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('134', '4', '211201', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('135', '4', '211501', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('136', '4', '211601', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('137', '4', '212100', 'HUTANG USAHA', '');
INSERT INTO `keu_detilrekening` VALUES ('138', '4', '212200', 'HUTANG YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('139', '4', '212300', 'HUTANG CEK/BILYET GIRO MUNDUR', '');
INSERT INTO `keu_detilrekening` VALUES ('140', '4', '212901', 'HUTANG PIHAK KETIGA', '');
INSERT INTO `keu_detilrekening` VALUES ('141', '4', '212902', 'HUTANG PERSEDIAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('142', '4', '212903', 'HUTANG KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('143', '4', '212904', 'HUTANG BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('144', '4', '212905', 'HUTANG INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('145', '4', '212906', 'HUTANG VOUCHER', '');
INSERT INTO `keu_detilrekening` VALUES ('146', '4', '212907', 'HUTANG KPD GKA ELYON', '');
INSERT INTO `keu_detilrekening` VALUES ('147', '4', '212999', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('148', '4', '213100', 'UANG MUKA PENJUALAN', '');
INSERT INTO `keu_detilrekening` VALUES ('149', '4', '213900', 'UANG MUKA LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('150', '4', '214104', 'PPH PASAL 4 AYAT 2', '');
INSERT INTO `keu_detilrekening` VALUES ('151', '4', '214121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('152', '4', '214122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('153', '4', '214123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('154', '4', '214125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening` VALUES ('155', '4', '214126', 'PPH PASAL 26', '');
INSERT INTO `keu_detilrekening` VALUES ('156', '4', '214129', 'PPH PASAL 29', '');
INSERT INTO `keu_detilrekening` VALUES ('157', '4', '214151', 'PPN KELUARAN YANG SUDAH DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('158', '4', '214152', 'PPN KELUARAN YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('159', '4', '214201', 'BUNGA', '');
INSERT INTO `keu_detilrekening` VALUES ('160', '4', '214202', 'SEWA', '');
INSERT INTO `keu_detilrekening` VALUES ('161', '4', '214203', 'GAJI DAN HONOR', '');
INSERT INTO `keu_detilrekening` VALUES ('162', '4', '214204', 'MAKAN DAN LEMBUR', '');
INSERT INTO `keu_detilrekening` VALUES ('163', '4', '214205', 'LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('164', '4', '214206', 'TUNJANGAN TRANSPORT-MAINTENANCE', '');
INSERT INTO `keu_detilrekening` VALUES ('165', '4', '214207', 'TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('166', '4', '214208', 'SURAT KABAR/MAJALAH', '');
INSERT INTO `keu_detilrekening` VALUES ('167', '4', '214209', 'KOMISI', '');
INSERT INTO `keu_detilrekening` VALUES ('168', '4', '214210', 'BIAYA ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('169', '4', '214211', 'PAJAK WAPU/WAJIB PUNGUT', '');
INSERT INTO `keu_detilrekening` VALUES ('170', '4', '214212', 'JAMSOSTEK', '');
INSERT INTO `keu_detilrekening` VALUES ('171', '4', '214213', 'PREMI DISTRIBUSI', '');
INSERT INTO `keu_detilrekening` VALUES ('172', '4', '214214', 'ONGKOS ANGKUT', '');
INSERT INTO `keu_detilrekening` VALUES ('173', '4', '214299', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('174', '4', '215121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('175', '4', '215122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('176', '4', '215123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('177', '4', '215125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening` VALUES ('178', '4', '215201', 'PPN KELUARAN', '');
INSERT INTO `keu_detilrekening` VALUES ('179', '4', '215202', 'PPN EKS KEPPRES', '');
INSERT INTO `keu_detilrekening` VALUES ('180', '4', '216101', 'HUTANG LEASING KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('181', '4', '219101', 'HUTANG DEVIDEN', '');
INSERT INTO `keu_detilrekening` VALUES ('182', '4', '219199', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('183', '4', '221101', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('184', '4', '221201', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('185', '4', '22210', 'HUTANG LEASING KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('186', '4', '223000', 'HUTANG PADA PEMEGANG SAHAM', '');
INSERT INTO `keu_detilrekening` VALUES ('187', '4', '230000', 'HUTANG LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('188', '4', '240000', 'HUTANG YG. DISUBORDINASI', '');
INSERT INTO `keu_detilrekening` VALUES ('189', '4', '250000', 'KEWAJIBAN BERSYARAT', '');
INSERT INTO `keu_detilrekening` VALUES ('190', '5', '311101', 'TIDAK TERIKAT', '');
INSERT INTO `keu_detilrekening` VALUES ('191', '5', '312101', 'TEMPORER...........', '');
INSERT INTO `keu_detilrekening` VALUES ('192', '5', '312201', 'PERMANEN......', '');
INSERT INTO `keu_detilrekening` VALUES ('193', '6', '411101', 'DANA DARI DONATUR', '');
INSERT INTO `keu_detilrekening` VALUES ('194', '6', '411102', 'DPP (DANA PEMBANGUNAN & PENGEMBANGAN)', '');
INSERT INTO `keu_detilrekening` VALUES ('195', '6', '411103', 'DANA JOINING', '');
INSERT INTO `keu_detilrekening` VALUES ('196', '6', '411104', 'DPP SUKARELA (DANA PEMBANGUNAN & PENGEMBANGAN)', '');
INSERT INTO `keu_detilrekening` VALUES ('197', '6', '411105', 'DANA STUDENT EXCHANGE', '');
INSERT INTO `keu_detilrekening` VALUES ('198', '6', '411201', 'SUMBANGAN TERIKAT TEMPORER', '');
INSERT INTO `keu_detilrekening` VALUES ('199', '6', '411202', 'SUMBANGAN TERIKAT PERMANEN', '');
INSERT INTO `keu_detilrekening` VALUES ('200', '6', '412101', 'PENJUALAN FORMULIR + PSIKOTES', '');
INSERT INTO `keu_detilrekening` VALUES ('201', '6', '412102', 'UANG KEG. EKSTRAKURIKULER', '');
INSERT INTO `keu_detilrekening` VALUES ('202', '6', '412103', 'UANG PENDAFTARAN ULANG', '');
INSERT INTO `keu_detilrekening` VALUES ('203', '6', '412104', 'UANG SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('204', '6', '412105', 'PENDAPATAN PENJUALAN SERAGAM', '');
INSERT INTO `keu_detilrekening` VALUES ('205', '6', '412106', 'PENDAPATAN PENJUALAN BUKU', '');
INSERT INTO `keu_detilrekening` VALUES ('206', '6', '412107', 'PENDAPATAN PENJUALAN CD/VCD/DVD', '');
INSERT INTO `keu_detilrekening` VALUES ('207', '6', '412108', 'PENDAPATAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('208', '6', '412109', 'PENDAPATAN LUNCH', '');
INSERT INTO `keu_detilrekening` VALUES ('209', '6', '412110', 'PENDAPATAN STATIONERY DAN HANDOUT, MATERIAL FEE', '');
INSERT INTO `keu_detilrekening` VALUES ('210', '6', '412111', 'DENDA KETERLAMBATAN BAYAR UANG SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('211', '6', '412112', 'PENDAPATAN CHECK POINT', '');
INSERT INTO `keu_detilrekening` VALUES ('212', '6', '412113', 'PENDAPATAN UJIAN HSK', '');
INSERT INTO `keu_detilrekening` VALUES ('213', '6', '412114', 'PENDAPATAN DAY CARE', '');
INSERT INTO `keu_detilrekening` VALUES ('214', '6', '421101', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG', '');
INSERT INTO `keu_detilrekening` VALUES ('215', '6', '421102', 'PENGHASILAN INVESTASI TIDAK TERIKAT LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('216', '6', '421103', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG ', '');
INSERT INTO `keu_detilrekening` VALUES ('217', '6', '421201', 'PENGHASILAN INVESTASI TERIKAT TEMPORER', '');
INSERT INTO `keu_detilrekening` VALUES ('218', '6', '421202', 'PENGHASILAN INVESTASI TERIKAT PERMANEN', '');
INSERT INTO `keu_detilrekening` VALUES ('219', '7', '511101', 'GAJI', '');
INSERT INTO `keu_detilrekening` VALUES ('220', '7', '511102', 'HONOR', '');
INSERT INTO `keu_detilrekening` VALUES ('221', '7', '511103', 'LEMBUR', '');
INSERT INTO `keu_detilrekening` VALUES ('222', '7', '511104', 'PESANGON', '');
INSERT INTO `keu_detilrekening` VALUES ('223', '7', '511105', 'UANG MAKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('224', '7', '511106', 'BONUS', '');
INSERT INTO `keu_detilrekening` VALUES ('225', '7', '511107', 'TUNJANGAN HARI RAYA', '');
INSERT INTO `keu_detilrekening` VALUES ('226', '7', '511108', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('227', '7', '511109', 'KESEJAHTERAAN KARYAWAN', '');
INSERT INTO `keu_detilrekening` VALUES ('228', '7', '511110', 'JAMINAN KECELAKAAN KERJA ( JKK )', '');
INSERT INTO `keu_detilrekening` VALUES ('229', '7', '511111', 'JAMINAN KEMATIAN ( JKM )', '');
INSERT INTO `keu_detilrekening` VALUES ('230', '7', '511112', 'JAMINAN HARI TUA ( JHT )', '');
INSERT INTO `keu_detilrekening` VALUES ('231', '7', '511113', 'JAMINAN PEMELIHARAAN KESEHATAN (JPK)', '');
INSERT INTO `keu_detilrekening` VALUES ('232', '7', '511114', 'TUNJANGAN DANA PENSIUN', '');
INSERT INTO `keu_detilrekening` VALUES ('233', '7', '511115', 'TUNJANGAN KESEHATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('234', '7', '511116', 'TUNJANGAN TRANSPORT', '');
INSERT INTO `keu_detilrekening` VALUES ('235', '7', '511117', 'JAMSOSTEK', '');
INSERT INTO `keu_detilrekening` VALUES ('236', '7', '511119', 'PREMI ', '');
INSERT INTO `keu_detilrekening` VALUES ('237', '7', '511199', 'TUNJANGAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('238', '7', '512101', 'BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA', '');
INSERT INTO `keu_detilrekening` VALUES ('239', '7', '512102', 'BI.BAHAN PERB. & PEMELIHARAAN KEND.', '');
INSERT INTO `keu_detilrekening` VALUES ('240', '7', '512103', 'BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('241', '7', '512199', 'BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('242', '7', '512201', 'PENYUSUTAN BANGUNAN & PRASARANA', '');
INSERT INTO `keu_detilrekening` VALUES ('243', '7', '512202', 'PENYUSUTAN KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('244', '7', '512203', 'PENYUSUTAN INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('245', '7', '512204', 'PENYUSUTAN INSTALASI', '');
INSERT INTO `keu_detilrekening` VALUES ('246', '7', '512301', 'TRANSPORTASI ( BENSIN, TIKET )', '');
INSERT INTO `keu_detilrekening` VALUES ('247', '7', '512302', 'MAKANAN & MINUMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('248', '7', '512303', 'PENGINAPAN', '');
INSERT INTO `keu_detilrekening` VALUES ('249', '7', '512304', 'UANG SAKU', '');
INSERT INTO `keu_detilrekening` VALUES ('250', '7', '512399', 'LAIN-LAIN ( PARKIR, TOL )', '');
INSERT INTO `keu_detilrekening` VALUES ('251', '7', '512401', 'SEWA BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('252', '7', '512402', 'SEWA KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('253', '7', '512403', 'SEWA INVENTARIS KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('254', '7', '512451', 'ASURANSI BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('255', '7', '512452', 'ASURANSI KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('256', '7', '512453', 'ASURANSI INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('257', '7', '512501', 'TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('258', '7', '512502', 'TELEX', '');
INSERT INTO `keu_detilrekening` VALUES ('259', '7', '512503', 'TELEGRAM', '');
INSERT INTO `keu_detilrekening` VALUES ('260', '7', '512504', 'INTERLOKAL NON TELEPON INTERN', '');
INSERT INTO `keu_detilrekening` VALUES ('261', '7', '512505', 'FACSIMILE', '');
INSERT INTO `keu_detilrekening` VALUES ('262', '7', '512599', 'LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('263', '7', '512601', 'AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('264', '7', '512602', 'LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('265', '7', '512603', 'ALAT-ALAT LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('266', '7', '512701', 'AKUNTAN', '');
INSERT INTO `keu_detilrekening` VALUES ('267', '7', '512702', 'NOTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('268', '7', '512703', 'KONSULTAN', '');
INSERT INTO `keu_detilrekening` VALUES ('269', '7', '512704', 'MANAGEMENT FEE', '');
INSERT INTO `keu_detilrekening` VALUES ('270', '7', '512801', 'ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('271', '7', '512802', 'BUKU CEK / BG', '');
INSERT INTO `keu_detilrekening` VALUES ('272', '7', '512803', 'TRANSFER, KIRIM UANG , INKASO', '');
INSERT INTO `keu_detilrekening` VALUES ('273', '7', '512804', 'PAJAK BUNGA BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('274', '7', '512901', 'BIAYA ADMINISTRASI KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('275', '7', '512902', 'BIAYA BUNGA ANGSURAN KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('276', '7', '512903', 'BIAYA BUNGA KREDIT BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('277', '7', '513101', 'ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('278', '7', '513102', 'PERANGKO, MATERAI, KIRIM SURAT', '');
INSERT INTO `keu_detilrekening` VALUES ('279', '7', '513103', 'FOTOCOPY/LAMINATING/CETAK FOTO', '');
INSERT INTO `keu_detilrekening` VALUES ('280', '7', '513104', 'ALAT - ALAT PENGAJARAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('281', '7', '513105', 'PERLENGKAPAN KELAS', '');
INSERT INTO `keu_detilrekening` VALUES ('282', '7', '513106', 'JASA PEMBELAJARAN', '');
INSERT INTO `keu_detilrekening` VALUES ('283', '7', '513201', 'PERIJINAN', '');
INSERT INTO `keu_detilrekening` VALUES ('284', '7', '513202', 'PAJAK - PAJAK DAERAH,PBB', '');
INSERT INTO `keu_detilrekening` VALUES ('285', '7', '513203', 'STNK', '');
INSERT INTO `keu_detilrekening` VALUES ('286', '7', '513211', 'RETRIBUSI SAMPAH', '');
INSERT INTO `keu_detilrekening` VALUES ('287', '7', '513301', 'SUMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('288', '7', '513302', 'ENTERTAINMENT', '');
INSERT INTO `keu_detilrekening` VALUES ('289', '7', '513303', 'JAMUAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('290', '7', '513401', 'KEAMANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('291', '7', '513501', 'PENDAFTARAN', '');
INSERT INTO `keu_detilrekening` VALUES ('292', '7', '513502', 'IURAN', '');
INSERT INTO `keu_detilrekening` VALUES ('293', '7', '513601', 'BIAYA PENGOBATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('294', '7', '513701', 'MAKANAN DAN MINUMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('295', '7', '513702', 'BAHAN BAKAR DAN PARKIR/TRANSPORT', '');
INSERT INTO `keu_detilrekening` VALUES ('296', '7', '513703', 'SERAGAM ', '');
INSERT INTO `keu_detilrekening` VALUES ('297', '7', '513704', 'SEWA DISPENSER', '');
INSERT INTO `keu_detilrekening` VALUES ('298', '7', '513705', 'OLAH RAGA DAN KESENIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('299', '7', '513706', 'BIAYA TRAINING, SEMINAR DAN STUDI BANDING', '');
INSERT INTO `keu_detilrekening` VALUES ('300', '7', '513707', 'BUKU, VCD', '');
INSERT INTO `keu_detilrekening` VALUES ('301', '7', '513708', 'ATRIBUT SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('302', '7', '513709', 'BIAYA PSIKOTES', '');
INSERT INTO `keu_detilrekening` VALUES ('303', '7', '513710', 'BIAYA ADVERTENSI ( IKLAN )', '');
INSERT INTO `keu_detilrekening` VALUES ('304', '7', '513711', 'BIAYA STUDY TOUR', '');
INSERT INTO `keu_detilrekening` VALUES ('305', '7', '513712', 'BIAYA PERLOMBAAN & PERAYAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('306', '7', '513713', 'STIKER U/ MURID', '');
INSERT INTO `keu_detilrekening` VALUES ('307', '7', '513714', 'BIAYA TES KESEHATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('308', '7', '513715', 'BIAYA KOMISI PENGEMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('309', '7', '513716', 'BIAYA PAMERAN', '');
INSERT INTO `keu_detilrekening` VALUES ('310', '7', '513799', 'LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('311', '7', '513801', 'KANTIN', '');
INSERT INTO `keu_detilrekening` VALUES ('312', '7', '513802', 'DAPUR', '');
INSERT INTO `keu_detilrekening` VALUES ('313', '7', '513803', 'BIAYA KEBERSIHAN', '');
INSERT INTO `keu_detilrekening` VALUES ('314', '7', '513804', 'BIAYA KEPERLUAN KEBUN/TAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('315', '7', '513805', 'JASA CLEANING SERVICE', '');
INSERT INTO `keu_detilrekening` VALUES ('316', '7', '513806', '', '');
INSERT INTO `keu_detilrekening` VALUES ('317', '7', '513807', 'BIAYA MESS', '');
INSERT INTO `keu_detilrekening` VALUES ('318', '7', '513901', 'SELAMATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('319', '7', '513902', 'BIAYA PENGURUSAN SURAT LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('320', '7', '513903', 'DENDA PAJAK', '');
INSERT INTO `keu_detilrekening` VALUES ('321', '7', '513904', 'KOREKSI TAHUN LALU', '');
INSERT INTO `keu_detilrekening` VALUES ('322', '7', '513998', 'LAIN - LAIN (SELISIH KURS)', '');
INSERT INTO `keu_detilrekening` VALUES ('323', '7', '513999', 'LAIN - LAIN (SELISIH KAS)', '');
INSERT INTO `keu_detilrekening` VALUES ('324', '7', '514001', 'TRANSPORT', '');
INSERT INTO `keu_detilrekening` VALUES ('325', '7', '514002', 'MAKAN & MINUM (RAPAT)', '');
INSERT INTO `keu_detilrekening` VALUES ('326', '7', '514099', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('327', '7', '514101', 'BUKU', '');
INSERT INTO `keu_detilrekening` VALUES ('328', '7', '514102', 'VCD', '');
INSERT INTO `keu_detilrekening` VALUES ('329', '7', '514103', 'SERAGAM ', '');
INSERT INTO `keu_detilrekening` VALUES ('330', '7', '514104', 'ATRIBUT SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('331', '7', '514105', 'BIAYA PSIKOTES', '');
INSERT INTO `keu_detilrekening` VALUES ('332', '7', '514106', 'BIAYA STUDY TOUR/FIELD TRIP', '');
INSERT INTO `keu_detilrekening` VALUES ('333', '7', '514107', 'BIAYA PERLOMBAAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('334', '7', '514108', 'EKSTRAKURIKULER', '');
INSERT INTO `keu_detilrekening` VALUES ('335', '7', '514109', 'BIAYA STUDENT EXCHANGE', '');
INSERT INTO `keu_detilrekening` VALUES ('336', '7', '514110', 'BIAYA CHECK POINT', '');
INSERT INTO `keu_detilrekening` VALUES ('337', '7', '514199', 'LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('343', '2', '9999', 'uuuu', 'jjj');
INSERT INTO `keu_detilrekening` VALUES ('344', '2', '9999', 'uuuu', 'jjj');
INSERT INTO `keu_detilrekening` VALUES ('345', '2', '9999', 'uuuu', 'jjj');
INSERT INTO `keu_detilrekening` VALUES ('346', '6', '411106', 'Formulir', '');

-- ----------------------------
-- Table structure for keu_detilrekening_copy
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilrekening_copy`;
CREATE TABLE `keu_detilrekening_copy` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kategorirekening` int(11) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `kategorirekeningFK` (`kategorirekening`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilrekening_copy
-- ----------------------------
INSERT INTO `keu_detilrekening_copy` VALUES ('1', '1', '111101', 'KAS KECIL ', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('2', '1', '111102', 'KAS SATELIT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('3', '1', '111103', 'KAS KERTAJAYA', 'ok');
INSERT INTO `keu_detilrekening_copy` VALUES ('4', '1', '111104', 'KAS RUNGKUT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('5', '1', '111199', 'KAS DALAM PERJALANAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('6', '2', '111201', 'BCA AC NO. 5560060001', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('7', '2', '111202', 'BANK EKONOMI AC NO. 3031861275', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('8', '2', '111203', 'BCA AC NO. 4683800000', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('9', '2', '111204', 'DEPOSITO EKONOMI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('10', '2', '111205', 'BANK MAYAPADA AC NO.201.300.17.000', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('11', '2', '111206', 'CIMB-NIAGA AC NO.216.01.00543.00.5 (dh.LIPPOBANK)', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('12', '2', '111207', 'DEPOSITO MAYAPADA/PANIN/CIMB', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('13', '2', '111208', 'DEPOSITO PANINBANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('14', '2', '111209', 'PANINBANK AC NO.448.50.8888.7', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('15', '2', '111210', 'MANDARI AC NO. 1420088800098', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('16', '2', '111211', 'BANK BCA 8290960101', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('17', '2', '111299', 'BANK DALAM PERJALANAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('18', '3', '111900', 'AYAT SILANG KAS DAN BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('19', '3', '112100', 'TABUNGAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('20', '3', '112200', 'DEPOSITO BERJANGKA', '-\r\n');
INSERT INTO `keu_detilrekening_copy` VALUES ('21', '3', '112300', 'SURAT-SURAT BERHARGA', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('22', '3', '113100', 'PIUTANG USAHA', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('23', '3', '113200', 'PIUTANG YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('24', '3', '113300', 'PIUTANG CEK/GIRO MUNDUR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('25', '3', '113400', 'CADANGAN PIUTANG RAGU-RAGU', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('26', '3', '113500', 'PIUTANG DIREKSI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('27', '3', '113600', 'PIUTANG KARYAWAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('28', '3', '113700', 'PIUTANG PIHAK III', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('29', '3', '113999', 'PIUTANG LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('30', '3', '114100', 'UANG MUKA PEMBELIAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('31', '3', '114901', 'TANAH', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('32', '3', '114902', 'KENDARAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('33', '3', '114903', 'MESIN DAN PERALATAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('34', '3', '114904', 'BANGUNAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('35', '3', '114905', 'INVENTARIS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('36', '3', '114906', 'UANG MUKA PERJALANAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('37', '3', '114999', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('38', '3', '116121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('39', '3', '116122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('40', '3', '116123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('41', '3', '116125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('42', '3', '116126', 'PPH PASAL 26', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('43', '3', '116151', 'PPN MASUKAN YANG SUDAH DIKREDITKAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('44', '3', '116152', 'PPN MASUKAN YANG BELUM DIKREDITKAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('45', '3', '116201', 'ASURANSI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('46', '3', '116202', 'SEWA', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('47', '3', '116203', 'BUNGA LEASING', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('48', '3', '116204', 'ONGKOS ANGKUT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('49', '3', '116299', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('50', '3', '121000', 'PENYERTAAN DALAM SURAT BERHARGA', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('51', '3', '122000', 'PENYERTAAN DALAM AKTIVA TETAP', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('52', '3', '123000', 'PENYERTAAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('53', '3', '141100', 'TANAH KANTOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('54', '3', '141251', 'PRASARANA JALAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('55', '3', '141252', 'PRASARANA SALURAN AIR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('56', '3', '141253', 'PRASARANA TAMAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('57', '3', '141301', 'INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('58', '3', '141302', 'INSTALASI AIR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('59', '3', '141303', 'INSTALASI TELEPON', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('60', '3', '141401', 'MESIN-MESIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('61', '3', '141451', 'MESIN-MESIN LEASING', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('62', '3', '141501', 'KENDARAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('63', '3', '141551', 'KENDARAAN LEASING KANTOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('64', '3', '141601', 'INVENTARIS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('65', '3', '145201', 'AKUM. PENY. BANGUNAN KANTOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('66', '3', '145202', 'AKUM. PENY. BANGUNAN KANTIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('67', '3', '145203', 'AKUM. PENY. BANGUNAN MESS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('68', '3', '145251', 'AKUM. PENY. PRASARANA JALAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('69', '3', '145252', 'AKUM. PENY. PRASARANA SALURAN AIR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('70', '3', '145253', 'AKUM. PENY. PRASARANA TAMAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('71', '3', '145301', 'AKUM. PENY. INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('72', '3', '145302', 'AKUM. PENY. INSTALASI AIR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('73', '3', '145303', 'AKUM. PENY. INSTALASI TELPON', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('74', '3', '145401', 'AKUM. PENY. KENDARAAN KANTOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('75', '3', '145451', 'AKUM. PENY. KENDARAAN LEASING KANTOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('76', '3', '145501', 'AKUM. PENY. INVENTARIS KANTOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('77', '3', '145502', 'AKUM. PENY. INVENTARIS KANTIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('78', '3', '151000', 'GOODWILL', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('79', '3', '152000', 'HAK PATEN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('80', '3', '153000', 'LISENSI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('81', '3', '154000', 'AKTIVA TIDAK BERWUJUD LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('82', '3', '161101', 'BIAYA PENDIRIAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('83', '3', '161102', 'GAJI, TUNJANGAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('84', '3', '161103', 'BIAYA PERJALANAN DINAS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('85', '3', '161104', 'ALAT TULIS & KEPERLUAN KANTOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('86', '3', '161105', 'IJIN, LEGAL DAN PROFESIONAL FEE', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('87', '3', '161106', 'ENTERTAINMENT,REPRESEN,SUMBANGAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('88', '3', '161107', 'TELEPON, FAX, TELEGRAM, KIRIM SURAT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('89', '3', '161108', 'BENSIN, PARKIR, TOL', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('90', '3', '161109', 'BIAYA ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('91', '3', '161110', 'BAHAN PENOLONG', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('92', '3', '161111', 'BIAYA IKLAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('93', '3', '161112', 'PAJAK-PAJAK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('94', '3', '161113', 'REKENING LISTRIK, AIR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('95', '3', '161114', 'BIAYA STNK, BBN, DLL', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('96', '3', '161115', 'BUNGA, FEE, PROVISI BANK, DLL', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('97', '3', '161116', 'BIAYA PERESMIAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('98', '3', '161117', 'BIAYA BAHAN BAKAR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('99', '3', '161118', 'REPARASI & PEMELIHARAAN KANTOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('100', '3', '161119', 'TRAINING, SEMINAR, TEST, DLL', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('101', '3', '161120', 'BIAYA MAKAN DAN MINUM', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('102', '3', '161121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('103', '3', '161122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('104', '3', '161123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('105', '3', '161124', 'REPARASI & PEMELIHARAAN KENDARAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('106', '3', '161125', 'REPARASI & PEMELIHARAAN MESS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('107', '3', '161126', 'REPARASI & PEMELIHARAAN TANKI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('108', '3', '161127', 'BIAYA PENGURUSAN LISTRIK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('109', '3', '161128', 'REPARASI & PEMELIHARAAN BOTOL', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('110', '3', '161129', 'BIAYA SEWA GEDUNG', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('111', '3', '161130', 'BIAYA BUNGA LEASING', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('112', '3', '161143', 'SELISIH KURS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('113', '3', '161144', 'BIAYA BUNGA PINJAMAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('114', '3', '161145', 'IURAN DAN ASURANSI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('115', '3', '161146', 'BIAYA KEAMANAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('116', '3', '161148', 'BIAYA PRA-OPERASI LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('117', '3', '161151', 'PENDAPATAN JASA GIRO', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('118', '3', '161152', 'PENDAPATAN BUNGA DEPOSITO', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('119', '3', '161153', 'PENDAPATAN BUNGA BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('120', '3', '161154', 'PENDAPATAN BUNGA PIHAK III', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('121', '3', '161199', 'PENDAPATAN PRA-OPERASI LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('122', '3', '161500', 'AKUM.AMORTISASI BIAYA PRA-OPERASI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('123', '3', '162100', 'UANG JAMINAN LISTRIK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('124', '3', '162200', 'UANG JAMINAN TELEPON', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('125', '3', '163000', 'BIAYA YANG DITANGGUHKAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('126', '3', '164000', 'BUNGA DALAM MASA KONSTRUKSI (IDC)', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('127', '3', '165201', 'BANGUNAN ', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('128', '3', '165301', 'INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('129', '3', '165302', 'INSTALASI AIR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('130', '3', '165303', 'INSTALASI TELEPON', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('131', '3', '166000', 'BIAYA PENELITIAN DAN PENGEMBANGAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('132', '3', '169000', 'AKTIVA LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('133', '4', '211101', 'BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('134', '4', '211201', 'BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('135', '4', '211501', 'BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('136', '4', '211601', 'BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('137', '4', '212100', 'HUTANG USAHA', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('138', '4', '212200', 'HUTANG YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('139', '4', '212300', 'HUTANG CEK/BILYET GIRO MUNDUR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('140', '4', '212901', 'HUTANG PIHAK KETIGA', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('141', '4', '212902', 'HUTANG PERSEDIAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('142', '4', '212903', 'HUTANG KENDARAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('143', '4', '212904', 'HUTANG BANGUNAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('144', '4', '212905', 'HUTANG INVENTARIS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('145', '4', '212906', 'HUTANG VOUCHER', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('146', '4', '212907', 'HUTANG KPD GKA ELYON', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('147', '4', '212999', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('148', '4', '213100', 'UANG MUKA PENJUALAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('149', '4', '213900', 'UANG MUKA LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('150', '4', '214104', 'PPH PASAL 4 AYAT 2', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('151', '4', '214121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('152', '4', '214122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('153', '4', '214123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('154', '4', '214125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('155', '4', '214126', 'PPH PASAL 26', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('156', '4', '214129', 'PPH PASAL 29', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('157', '4', '214151', 'PPN KELUARAN YANG SUDAH DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('158', '4', '214152', 'PPN KELUARAN YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('159', '4', '214201', 'BUNGA', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('160', '4', '214202', 'SEWA', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('161', '4', '214203', 'GAJI DAN HONOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('162', '4', '214204', 'MAKAN DAN LEMBUR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('163', '4', '214205', 'LISTRIK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('164', '4', '214206', 'TUNJANGAN TRANSPORT-MAINTENANCE', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('165', '4', '214207', 'TELEPON', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('166', '4', '214208', 'SURAT KABAR/MAJALAH', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('167', '4', '214209', 'KOMISI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('168', '4', '214210', 'BIAYA ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('169', '4', '214211', 'PAJAK WAPU/WAJIB PUNGUT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('170', '4', '214212', 'JAMSOSTEK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('171', '4', '214213', 'PREMI DISTRIBUSI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('172', '4', '214214', 'ONGKOS ANGKUT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('173', '4', '214299', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('174', '4', '215121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('175', '4', '215122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('176', '4', '215123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('177', '4', '215125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('178', '4', '215201', 'PPN KELUARAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('179', '4', '215202', 'PPN EKS KEPPRES', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('180', '4', '216101', 'HUTANG LEASING KENDARAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('181', '4', '219101', 'HUTANG DEVIDEN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('182', '4', '219199', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('183', '4', '221101', 'BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('184', '4', '221201', 'BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('185', '4', '22210', 'HUTANG LEASING KENDARAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('186', '4', '223000', 'HUTANG PADA PEMEGANG SAHAM', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('187', '4', '230000', 'HUTANG LAIN - LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('188', '4', '240000', 'HUTANG YG. DISUBORDINASI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('189', '4', '250000', 'KEWAJIBAN BERSYARAT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('190', '5', '311101', 'TIDAK TERIKAT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('191', '5', '312101', 'TEMPORER...........', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('192', '5', '312201', 'PERMANEN......', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('193', '6', '411101', 'DANA DARI DONATUR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('194', '6', '411102', 'DPP (DANA PEMBANGUNAN & PENGEMBANGAN)', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('195', '6', '411103', 'DANA JOINING', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('196', '6', '411104', 'DPP SUKARELA (DANA PEMBANGUNAN & PENGEMBANGAN)', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('197', '6', '411105', 'DANA STUDENT EXCHANGE', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('198', '6', '411201', 'SUMBANGAN TERIKAT TEMPORER', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('199', '6', '411202', 'SUMBANGAN TERIKAT PERMANEN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('200', '6', '412101', 'PENJUALAN FORMULIR + PSIKOTES', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('201', '6', '412102', 'UANG KEG. EKSTRAKURIKULER', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('202', '6', '412103', 'UANG PENDAFTARAN ULANG', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('203', '6', '412104', 'UANG SEKOLAH', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('204', '6', '412105', 'PENDAPATAN PENJUALAN SERAGAM', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('205', '6', '412106', 'PENDAPATAN PENJUALAN BUKU', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('206', '6', '412107', 'PENDAPATAN PENJUALAN CD/VCD/DVD', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('207', '6', '412108', 'PENDAPATAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('208', '6', '412109', 'PENDAPATAN LUNCH', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('209', '6', '412110', 'PENDAPATAN STATIONERY DAN HANDOUT, MATERIAL FEE', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('210', '6', '412111', 'DENDA KETERLAMBATAN BAYAR UANG SEKOLAH', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('211', '6', '412112', 'PENDAPATAN CHECK POINT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('212', '6', '412113', 'PENDAPATAN UJIAN HSK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('213', '6', '412114', 'PENDAPATAN DAY CARE', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('214', '6', '421101', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('215', '6', '421102', 'PENGHASILAN INVESTASI TIDAK TERIKAT LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('216', '6', '421103', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG ', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('217', '6', '421201', 'PENGHASILAN INVESTASI TERIKAT TEMPORER', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('218', '6', '421202', 'PENGHASILAN INVESTASI TERIKAT PERMANEN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('219', '7', '511101', 'GAJI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('220', '7', '511102', 'HONOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('221', '7', '511103', 'LEMBUR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('222', '7', '511104', 'PESANGON', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('223', '7', '511105', 'UANG MAKAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('224', '7', '511106', 'BONUS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('225', '7', '511107', 'TUNJANGAN HARI RAYA', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('226', '7', '511108', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('227', '7', '511109', 'KESEJAHTERAAN KARYAWAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('228', '7', '511110', 'JAMINAN KECELAKAAN KERJA ( JKK )', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('229', '7', '511111', 'JAMINAN KEMATIAN ( JKM )', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('230', '7', '511112', 'JAMINAN HARI TUA ( JHT )', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('231', '7', '511113', 'JAMINAN PEMELIHARAAN KESEHATAN (JPK)', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('232', '7', '511114', 'TUNJANGAN DANA PENSIUN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('233', '7', '511115', 'TUNJANGAN KESEHATAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('234', '7', '511116', 'TUNJANGAN TRANSPORT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('235', '7', '511117', 'JAMSOSTEK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('236', '7', '511119', 'PREMI ', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('237', '7', '511199', 'TUNJANGAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('238', '7', '512101', 'BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('239', '7', '512102', 'BI.BAHAN PERB. & PEMELIHARAAN KEND.', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('240', '7', '512103', 'BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('241', '7', '512199', 'BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('242', '7', '512201', 'PENYUSUTAN BANGUNAN & PRASARANA', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('243', '7', '512202', 'PENYUSUTAN KENDARAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('244', '7', '512203', 'PENYUSUTAN INVENTARIS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('245', '7', '512204', 'PENYUSUTAN INSTALASI', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('246', '7', '512301', 'TRANSPORTASI ( BENSIN, TIKET )', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('247', '7', '512302', 'MAKANAN & MINUMAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('248', '7', '512303', 'PENGINAPAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('249', '7', '512304', 'UANG SAKU', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('250', '7', '512399', 'LAIN-LAIN ( PARKIR, TOL )', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('251', '7', '512401', 'SEWA BANGUNAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('252', '7', '512402', 'SEWA KENDARAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('253', '7', '512403', 'SEWA INVENTARIS KANTOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('254', '7', '512451', 'ASURANSI BANGUNAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('255', '7', '512452', 'ASURANSI KENDARAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('256', '7', '512453', 'ASURANSI INVENTARIS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('257', '7', '512501', 'TELEPON', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('258', '7', '512502', 'TELEX', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('259', '7', '512503', 'TELEGRAM', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('260', '7', '512504', 'INTERLOKAL NON TELEPON INTERN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('261', '7', '512505', 'FACSIMILE', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('262', '7', '512599', 'LAIN - LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('263', '7', '512601', 'AIR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('264', '7', '512602', 'LISTRIK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('265', '7', '512603', 'ALAT-ALAT LISTRIK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('266', '7', '512701', 'AKUNTAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('267', '7', '512702', 'NOTARIS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('268', '7', '512703', 'KONSULTAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('269', '7', '512704', 'MANAGEMENT FEE', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('270', '7', '512801', 'ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('271', '7', '512802', 'BUKU CEK / BG', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('272', '7', '512803', 'TRANSFER, KIRIM UANG , INKASO', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('273', '7', '512804', 'PAJAK BUNGA BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('274', '7', '512901', 'BIAYA ADMINISTRASI KENDARAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('275', '7', '512902', 'BIAYA BUNGA ANGSURAN KENDARAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('276', '7', '512903', 'BIAYA BUNGA KREDIT BANK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('277', '7', '513101', 'ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('278', '7', '513102', 'PERANGKO, MATERAI, KIRIM SURAT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('279', '7', '513103', 'FOTOCOPY/LAMINATING/CETAK FOTO', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('280', '7', '513104', 'ALAT - ALAT PENGAJARAN ', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('281', '7', '513105', 'PERLENGKAPAN KELAS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('282', '7', '513106', 'JASA PEMBELAJARAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('283', '7', '513201', 'PERIJINAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('284', '7', '513202', 'PAJAK - PAJAK DAERAH,PBB', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('285', '7', '513203', 'STNK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('286', '7', '513211', 'RETRIBUSI SAMPAH', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('287', '7', '513301', 'SUMBANGAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('288', '7', '513302', 'ENTERTAINMENT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('289', '7', '513303', 'JAMUAN ', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('290', '7', '513401', 'KEAMANAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('291', '7', '513501', 'PENDAFTARAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('292', '7', '513502', 'IURAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('293', '7', '513601', 'BIAYA PENGOBATAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('294', '7', '513701', 'MAKANAN DAN MINUMAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('295', '7', '513702', 'BAHAN BAKAR DAN PARKIR/TRANSPORT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('296', '7', '513703', 'SERAGAM ', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('297', '7', '513704', 'SEWA DISPENSER', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('298', '7', '513705', 'OLAH RAGA DAN KESENIAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('299', '7', '513706', 'BIAYA TRAINING, SEMINAR DAN STUDI BANDING', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('300', '7', '513707', 'BUKU, VCD', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('301', '7', '513708', 'ATRIBUT SEKOLAH', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('302', '7', '513709', 'BIAYA PSIKOTES', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('303', '7', '513710', 'BIAYA ADVERTENSI ( IKLAN )', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('304', '7', '513711', 'BIAYA STUDY TOUR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('305', '7', '513712', 'BIAYA PERLOMBAAN & PERAYAAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('306', '7', '513713', 'STIKER U/ MURID', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('307', '7', '513714', 'BIAYA TES KESEHATAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('308', '7', '513715', 'BIAYA KOMISI PENGEMBANGAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('309', '7', '513716', 'BIAYA PAMERAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('310', '7', '513799', 'LAIN - LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('311', '7', '513801', 'KANTIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('312', '7', '513802', 'DAPUR', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('313', '7', '513803', 'BIAYA KEBERSIHAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('314', '7', '513804', 'BIAYA KEPERLUAN KEBUN/TAMAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('315', '7', '513805', 'JASA CLEANING SERVICE', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('316', '7', '513806', '', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('317', '7', '513807', 'BIAYA MESS', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('318', '7', '513901', 'SELAMATAN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('319', '7', '513902', 'BIAYA PENGURUSAN SURAT LAIN - LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('320', '7', '513903', 'DENDA PAJAK', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('321', '7', '513904', 'KOREKSI TAHUN LALU', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('322', '7', '513998', 'LAIN - LAIN (SELISIH KURS)', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('323', '7', '513999', 'LAIN - LAIN (SELISIH KAS)', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('324', '7', '514001', 'TRANSPORT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('325', '7', '514002', 'MAKAN & MINUM (RAPAT)', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('326', '7', '514099', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('327', '7', '514101', 'BUKU', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('328', '7', '514102', 'VCD', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('329', '7', '514103', 'SERAGAM ', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('330', '7', '514104', 'ATRIBUT SEKOLAH', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('331', '7', '514105', 'BIAYA PSIKOTES', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('332', '7', '514106', 'BIAYA STUDY TOUR/FIELD TRIP', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('333', '7', '514107', 'BIAYA PERLOMBAAN ', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('334', '7', '514108', 'EKSTRAKURIKULER', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('335', '7', '514109', 'BIAYA STUDENT EXCHANGE', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('336', '7', '514110', 'BIAYA CHECK POINT', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('337', '7', '514199', 'LAIN - LAIN', '');
INSERT INTO `keu_detilrekening_copy` VALUES ('343', '2', '9999', 'uuuu', 'jjj');
INSERT INTO `keu_detilrekening_copy` VALUES ('344', '2', '9999', 'uuuu', 'jjj');
INSERT INTO `keu_detilrekening_copy` VALUES ('345', '2', '9999', 'uuuu', 'jjj');

-- ----------------------------
-- Table structure for keu_detilrekeningbiaya
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilrekeningbiaya`;
CREATE TABLE `keu_detilrekeningbiaya` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `rekeningbiaya` int(11) NOT NULL,
  `detilrekening` int(11) NOT NULL,
  `jenisrekening` enum('d','k') DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `detilrekening` (`detilrekening`) USING BTREE,
  KEY `rekeningbiaya` (`rekeningbiaya`) USING BTREE,
  CONSTRAINT `detilrekeningFK3` FOREIGN KEY (`detilrekening`) REFERENCES `keu_detilrekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rekeningbiayaFK` FOREIGN KEY (`rekeningbiaya`) REFERENCES `keu_rekeningbiaya` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilrekeningbiaya
-- ----------------------------
INSERT INTO `keu_detilrekeningbiaya` VALUES ('7', '12', '194', 'k');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('11', '11', '194', 'k');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('13', '2', '14', 'd');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('14', '2', '194', 'k');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('16', '11', '14', 'd');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('17', '3', '200', 'k');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('19', '30', '195', 'k');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('20', '30', '2', 'd');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('21', '21', '203', 'k');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('22', '21', '2', 'd');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('24', '12', '1', 'd');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('25', '3', '6', 'd');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('26', '20', '2', 'd');
INSERT INTO `keu_detilrekeningbiaya` VALUES ('27', '20', '203', 'k');

-- ----------------------------
-- Table structure for keu_detjenistransaksi
-- ----------------------------
DROP TABLE IF EXISTS `keu_detjenistransaksi`;
CREATE TABLE `keu_detjenistransaksi` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenistransaksi` int(11) NOT NULL,
  `kategoritransaksi` int(11) NOT NULL,
  `buktitransaksi` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `jenistransaksi` (`jenistransaksi`) USING BTREE,
  KEY `buktitransaksi` (`buktitransaksi`) USING BTREE,
  KEY `kategoritransaksi` (`kategoritransaksi`) USING BTREE,
  CONSTRAINT `buktitransaksiFK` FOREIGN KEY (`buktitransaksi`) REFERENCES `keu_buktitransaksi` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jenistransaksiFK` FOREIGN KEY (`jenistransaksi`) REFERENCES `keu_jenistransaksi` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kategoritransaksiFK` FOREIGN KEY (`kategoritransaksi`) REFERENCES `keu_kategoritransaksi` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detjenistransaksi
-- ----------------------------
INSERT INTO `keu_detjenistransaksi` VALUES ('1', '2', '3', '2');
INSERT INTO `keu_detjenistransaksi` VALUES ('2', '2', '2', '3');
INSERT INTO `keu_detjenistransaksi` VALUES ('3', '2', '1', '4');
INSERT INTO `keu_detjenistransaksi` VALUES ('4', '3', '4', '3');
INSERT INTO `keu_detjenistransaksi` VALUES ('5', '3', '2', '5');
INSERT INTO `keu_detjenistransaksi` VALUES ('6', '3', '1', '3');
INSERT INTO `keu_detjenistransaksi` VALUES ('7', '1', '5', '1');

-- ----------------------------
-- Table structure for keu_grupbrg
-- ----------------------------
DROP TABLE IF EXISTS `keu_grupbrg`;
CREATE TABLE `keu_grupbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_grupbrg
-- ----------------------------
INSERT INTO `keu_grupbrg` VALUES ('1', 'Elektronika', '');
INSERT INTO `keu_grupbrg` VALUES ('2', 'Kendaraan', '');
INSERT INTO `keu_grupbrg` VALUES ('3', 'Alat Tulis', '');

-- ----------------------------
-- Table structure for keu_jenislaporan
-- ----------------------------
DROP TABLE IF EXISTS `keu_jenislaporan`;
CREATE TABLE `keu_jenislaporan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` enum('in','out') NOT NULL DEFAULT 'in',
  `kategori` enum('o','n') NOT NULL DEFAULT 'o',
  `rekening` int(11) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jenislaporan
-- ----------------------------
INSERT INTO `keu_jenislaporan` VALUES ('7', 'in', 'o', '203');
INSERT INTO `keu_jenislaporan` VALUES ('8', 'in', 'o', '195');
INSERT INTO `keu_jenislaporan` VALUES ('9', 'in', 'o', '210');
INSERT INTO `keu_jenislaporan` VALUES ('10', 'in', 'o', '119');
INSERT INTO `keu_jenislaporan` VALUES ('11', 'in', 'n', '194');
INSERT INTO `keu_jenislaporan` VALUES ('12', 'out', 'o', '219');
INSERT INTO `keu_jenislaporan` VALUES ('13', 'out', 'o', '30');
INSERT INTO `keu_jenislaporan` VALUES ('14', 'out', 'o', '54');

-- ----------------------------
-- Table structure for keu_jenisreport
-- ----------------------------
DROP TABLE IF EXISTS `keu_jenisreport`;
CREATE TABLE `keu_jenisreport` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenisreport` varchar(50) NOT NULL,
  `keterangan` text,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jenisreport
-- ----------------------------
INSERT INTO `keu_jenisreport` VALUES ('1', 'neraca', null);
INSERT INTO `keu_jenisreport` VALUES ('2', 'labarugi', null);

-- ----------------------------
-- Table structure for keu_jenistransaksi
-- ----------------------------
DROP TABLE IF EXISTS `keu_jenistransaksi`;
CREATE TABLE `keu_jenistransaksi` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenistransaksi` varchar(50) NOT NULL,
  `kode` varchar(5) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jenistransaksi
-- ----------------------------
INSERT INTO `keu_jenistransaksi` VALUES ('1', 'jurnal', 'ju');
INSERT INTO `keu_jenistransaksi` VALUES ('2', 'pemasukan', 'in');
INSERT INTO `keu_jenistransaksi` VALUES ('3', 'pengeluaran', 'out');

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
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jurnal
-- ----------------------------
INSERT INTO `keu_jurnal` VALUES ('203', '138', '193', '300000', 'k', '2015-11-19 07:11:22');
INSERT INTO `keu_jurnal` VALUES ('204', '138', '1', '300000', 'd', '2015-11-19 07:11:22');
INSERT INTO `keu_jurnal` VALUES ('205', '139', '263', '100000', 'd', '2015-11-19 07:13:08');
INSERT INTO `keu_jurnal` VALUES ('206', '139', '4', '100000', 'k', '2015-11-19 07:13:08');
INSERT INTO `keu_jurnal` VALUES ('207', '140', '14', '300000', 'd', '2015-11-19 07:18:29');
INSERT INTO `keu_jurnal` VALUES ('208', '140', '194', '300000', 'k', '2015-11-19 07:18:29');
INSERT INTO `keu_jurnal` VALUES ('209', '141', '35', '4500000', 'd', '2015-11-19 10:34:37');
INSERT INTO `keu_jurnal` VALUES ('210', '141', '4', '4500000', 'k', '2015-11-19 10:34:38');
INSERT INTO `keu_jurnal` VALUES ('211', '142', '1', '20000', 'k', '2015-11-19 10:35:57');
INSERT INTO `keu_jurnal` VALUES ('212', '142', '83', '20000', 'd', '2015-11-19 10:35:57');
INSERT INTO `keu_jurnal` VALUES ('213', '143', '4', '35000', 'd', '2015-11-19 10:37:05');
INSERT INTO `keu_jurnal` VALUES ('214', '143', '198', '35000', 'k', '2015-11-19 10:37:05');

-- ----------------------------
-- Table structure for keu_kategorianggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorianggaran`;
CREATE TABLE `keu_kategorianggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `departemen` int(11) NOT NULL,
  `tingkat` int(11) NOT NULL,
  `detilrekening` int(11) NOT NULL,
  `kategorianggaran` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `tingkat` (`tingkat`) USING BTREE,
  KEY `detilrekening` (`detilrekening`) USING BTREE,
  KEY `departemen` (`departemen`) USING BTREE,
  CONSTRAINT `departemenFK4` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detilrekeningFK` FOREIGN KEY (`detilrekening`) REFERENCES `keu_detilrekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tingkatFK` FOREIGN KEY (`tingkat`) REFERENCES `aka_tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorianggaran
-- ----------------------------
INSERT INTO `keu_kategorianggaran` VALUES ('15', '1', '1', '277', 'ATK', 'alat tulis kantor');
INSERT INTO `keu_kategorianggaran` VALUES ('16', '3', '1', '91', 'Logistik', 'ok');
INSERT INTO `keu_kategorianggaran` VALUES ('17', '1', '1', '247', 'makanan', '');
INSERT INTO `keu_kategorianggaran` VALUES ('18', '1', '6', '312', 'alat dapur', '');
INSERT INTO `keu_kategorianggaran` VALUES ('19', '2', '6', '263', 'tagihan rekening AIR ', '');
INSERT INTO `keu_kategorianggaran` VALUES ('20', '2', '6', '35', 'biaya maintenance elektronik', '');

-- ----------------------------
-- Table structure for keu_kategorirek
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorirek`;
CREATE TABLE `keu_kategorirek` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorirek
-- ----------------------------
INSERT INTO `keu_kategorirek` VALUES ('1', '1', 'KAS');
INSERT INTO `keu_kategorirek` VALUES ('2', '1', 'BANK');
INSERT INTO `keu_kategorirek` VALUES ('3', '1', 'AKTIVA');
INSERT INTO `keu_kategorirek` VALUES ('4', '2', 'KEWAJIBAN');
INSERT INTO `keu_kategorirek` VALUES ('5', '3', 'MODAL');
INSERT INTO `keu_kategorirek` VALUES ('6', '4', 'PENDAPATAN');
INSERT INTO `keu_kategorirek` VALUES ('7', '5', 'BIAYA');

-- ----------------------------
-- Table structure for keu_kategorirekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorirekening`;
CREATE TABLE `keu_kategorirekening` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  `jenis` enum('d','k') NOT NULL,
  `jenistambah` enum('d','k') NOT NULL,
  `jeniskurang` enum('d','k') NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorirekening
-- ----------------------------
INSERT INTO `keu_kategorirekening` VALUES ('1', '1', 'KAS', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('2', '1', 'BANK', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('3', '1', 'AKTIVA', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('4', '2', 'KEWAJIBAN', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('5', '3', 'MODAL', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('6', '4', 'PENDAPATAN', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('7', '5', 'BIAYA', 'd', 'd', 'k');

-- ----------------------------
-- Table structure for keu_kategoritransaksi
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategoritransaksi`;
CREATE TABLE `keu_kategoritransaksi` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kategoritransaksi` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategoritransaksi
-- ----------------------------
INSERT INTO `keu_kategoritransaksi` VALUES ('1', 'kas');
INSERT INTO `keu_kategoritransaksi` VALUES ('2', 'bank');
INSERT INTO `keu_kategoritransaksi` VALUES ('3', 'siswa');
INSERT INTO `keu_kategoritransaksi` VALUES ('4', 'barang');
INSERT INTO `keu_kategoritransaksi` VALUES ('5', 'umum');

-- ----------------------------
-- Table structure for keu_kelompokbrg
-- ----------------------------
DROP TABLE IF EXISTS `keu_kelompokbrg`;
CREATE TABLE `keu_kelompokbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grupbrg` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kelompokbrg
-- ----------------------------
INSERT INTO `keu_kelompokbrg` VALUES ('1', '1', 'Komputer');
INSERT INTO `keu_kelompokbrg` VALUES ('2', '1', 'Proyektor');
INSERT INTO `keu_kelompokbrg` VALUES ('3', '2', 'Mobil');
INSERT INTO `keu_kelompokbrg` VALUES ('4', '2', 'Motor');
INSERT INTO `keu_kelompokbrg` VALUES ('5', '2', 'Sepeda');
INSERT INTO `keu_kelompokbrg` VALUES ('6', '3', 'bulpoin');

-- ----------------------------
-- Table structure for keu_modul
-- ----------------------------
DROP TABLE IF EXISTS `keu_modul`;
CREATE TABLE `keu_modul` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reftipe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `rek1` int(10) unsigned NOT NULL,
  `rek2` int(10) unsigned NOT NULL,
  `rek3` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_modul
-- ----------------------------
INSERT INTO `keu_modul` VALUES ('2', '3', '2', '2', 'Pendaftaran Tahun Ajaran 2014-2015', '14', '0', '0', '0', '0', '');
INSERT INTO `keu_modul` VALUES ('3', '3', '2', '2', 'Pendaftaran Tahun Ajaran 2014-2015', '6', '194', '0', '0', '0', 'Kaitlynn Tiffany');
INSERT INTO `keu_modul` VALUES ('4', '1', '3', '3', 'Uang pangkal angkatan 2013', '6', '194', '29', '0', '0', 'DPP');
INSERT INTO `keu_modul` VALUES ('5', '1', '1', '1', 'Uang sekolah tahun ajaran 2014-2015 (Aktif)', '1', '203', '29', '0', '0', '');
INSERT INTO `keu_modul` VALUES ('6', '1', '3', '8', 'Uang pangkal angkatan 2016', '3', '4', '3', '0', '0', '');
INSERT INTO `keu_modul` VALUES ('7', '1', '3', '2', 'Uang pangkal angkatan 2014', '1', '1', '1', '0', '0', 'ok');

-- ----------------------------
-- Table structure for keu_nominalanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_nominalanggaran`;
CREATE TABLE `keu_nominalanggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `anggarantahunan` int(11) NOT NULL,
  `bulan` int(2) NOT NULL,
  `jml` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `anggarantahunan` (`anggarantahunan`) USING BTREE,
  CONSTRAINT `anggarantahunanFK` FOREIGN KEY (`anggarantahunan`) REFERENCES `keu_anggarantahunan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_nominalanggaran
-- ----------------------------
INSERT INTO `keu_nominalanggaran` VALUES ('61', '9', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('62', '9', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('63', '9', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('64', '9', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('65', '9', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('66', '9', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('67', '9', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('68', '9', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('69', '9', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('70', '9', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('71', '9', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('72', '9', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('73', '10', '1', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('74', '10', '2', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('75', '10', '3', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('76', '10', '4', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('77', '10', '5', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('78', '10', '6', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('79', '10', '7', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('80', '10', '8', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('81', '10', '9', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('82', '10', '10', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('83', '10', '11', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('84', '10', '12', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('85', '11', '1', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('86', '11', '2', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('87', '11', '3', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('88', '11', '4', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('89', '11', '5', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('90', '11', '6', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('91', '11', '7', '7');
INSERT INTO `keu_nominalanggaran` VALUES ('92', '11', '8', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('93', '11', '9', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('94', '11', '10', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('95', '11', '11', '55');
INSERT INTO `keu_nominalanggaran` VALUES ('96', '11', '12', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('169', '18', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('170', '18', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('171', '18', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('172', '18', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('173', '18', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('174', '18', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('175', '18', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('176', '18', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('177', '18', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('178', '18', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('179', '18', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('180', '18', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('181', '19', '1', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('182', '19', '2', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('183', '19', '3', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('184', '19', '4', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('185', '19', '5', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('186', '19', '6', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('187', '19', '7', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('188', '19', '8', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('189', '19', '9', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('190', '19', '10', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('191', '19', '11', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('192', '19', '12', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('193', '20', '1', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('194', '20', '2', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('195', '20', '3', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('196', '20', '4', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('197', '20', '5', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('198', '20', '6', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('199', '20', '7', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('200', '20', '8', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('201', '20', '9', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('202', '20', '10', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('203', '20', '11', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('204', '20', '12', '50');
INSERT INTO `keu_nominalanggaran` VALUES ('205', '21', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('206', '21', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('207', '21', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('208', '21', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('209', '21', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('210', '21', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('211', '21', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('212', '21', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('213', '21', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('214', '21', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('215', '21', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('216', '21', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('217', '22', '1', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('218', '22', '2', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('219', '22', '3', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('220', '22', '4', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('221', '22', '5', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('222', '22', '6', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('223', '22', '7', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('224', '22', '8', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('225', '22', '9', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('226', '22', '10', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('227', '22', '11', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('228', '22', '12', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('229', '23', '1', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('230', '23', '2', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('231', '23', '3', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('232', '23', '4', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('233', '23', '5', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('234', '23', '6', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('235', '23', '7', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('236', '23', '8', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('237', '23', '9', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('238', '23', '10', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('239', '23', '11', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('240', '23', '12', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('241', '24', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('242', '24', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('243', '24', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('244', '24', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('245', '24', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('246', '24', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('247', '24', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('248', '24', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('249', '24', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('250', '24', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('251', '24', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('252', '24', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('253', '25', '1', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('254', '25', '2', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('255', '25', '3', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('256', '25', '4', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('257', '25', '5', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('258', '25', '6', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('259', '25', '7', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('260', '25', '8', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('261', '25', '9', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('262', '25', '10', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('263', '25', '11', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('264', '25', '12', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('265', '26', '1', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('266', '26', '2', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('267', '26', '3', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('268', '26', '4', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('269', '26', '5', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('270', '26', '6', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('271', '26', '7', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('272', '26', '8', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('273', '26', '9', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('274', '26', '10', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('275', '26', '11', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('276', '26', '12', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('277', '27', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('278', '27', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('279', '27', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('280', '27', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('281', '27', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('282', '27', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('283', '27', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('284', '27', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('285', '27', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('286', '27', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('287', '27', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('288', '27', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('289', '28', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('290', '28', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('291', '28', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('292', '28', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('293', '28', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('294', '28', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('295', '28', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('296', '28', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('297', '28', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('298', '28', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('299', '28', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('300', '28', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('301', '29', '1', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('302', '29', '2', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('303', '29', '3', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('304', '29', '4', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('305', '29', '5', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('306', '29', '6', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('307', '29', '7', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('308', '29', '8', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('309', '29', '9', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('310', '29', '10', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('311', '29', '11', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('312', '29', '12', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('313', '30', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('314', '30', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('315', '30', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('316', '30', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('317', '30', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('318', '30', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('319', '30', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('320', '30', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('321', '30', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('322', '30', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('323', '30', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('324', '30', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('325', '31', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('326', '31', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('327', '31', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('328', '31', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('329', '31', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('330', '31', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('331', '31', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('332', '31', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('333', '31', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('334', '31', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('335', '31', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('336', '31', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('337', '32', '1', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('338', '32', '2', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('339', '32', '3', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('340', '32', '4', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('341', '32', '5', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('342', '32', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('343', '32', '7', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('344', '32', '8', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('345', '32', '9', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('346', '32', '10', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('347', '32', '11', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('348', '32', '12', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('349', '33', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('350', '33', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('351', '33', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('352', '33', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('353', '33', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('354', '33', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('355', '33', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('356', '33', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('357', '33', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('358', '33', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('359', '33', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('360', '33', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('361', '34', '1', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('362', '34', '2', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('363', '34', '3', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('364', '34', '4', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('365', '34', '5', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('366', '34', '6', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('367', '34', '7', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('368', '34', '8', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('369', '34', '9', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('370', '34', '10', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('371', '34', '11', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('372', '34', '12', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('373', '35', '1', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('374', '35', '2', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('375', '35', '3', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('376', '35', '4', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('377', '35', '5', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('378', '35', '6', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('379', '35', '7', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('380', '35', '8', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('381', '35', '9', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('382', '35', '10', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('383', '35', '11', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('384', '35', '12', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('385', '36', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('386', '36', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('387', '36', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('388', '36', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('389', '36', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('390', '36', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('391', '36', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('392', '36', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('393', '36', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('394', '36', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('395', '36', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('396', '36', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('397', '37', '1', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('398', '37', '2', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('399', '37', '3', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('400', '37', '4', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('401', '37', '5', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('402', '37', '6', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('403', '37', '7', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('404', '37', '8', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('405', '37', '9', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('406', '37', '10', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('407', '37', '11', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('408', '37', '12', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('409', '38', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('410', '38', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('411', '38', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('412', '38', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('413', '38', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('414', '38', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('415', '38', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('416', '38', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('417', '38', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('418', '38', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('419', '38', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('420', '38', '12', '0');

-- ----------------------------
-- Table structure for keu_pembayaran_copy
-- ----------------------------
DROP TABLE IF EXISTS `keu_pembayaran_copy`;
CREATE TABLE `keu_pembayaran_copy` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswabiaya` int(11) NOT NULL,
  `nominal` decimal(14,0) NOT NULL DEFAULT '0',
  `viabayar2` int(11) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `idkwitansi` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`replid`),
  KEY `siswabiaya` (`siswabiaya`) USING BTREE,
  KEY `viabayar2` (`viabayar2`) USING BTREE,
  CONSTRAINT `keu_pembayaran_copy_ibfk_1` FOREIGN KEY (`siswabiaya`) REFERENCES `psb_siswabiaya` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `keu_pembayaran_copy_ibfk_2` FOREIGN KEY (`viabayar2`) REFERENCES `keu_viabayar` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_pembayaran_copy
-- ----------------------------
INSERT INTO `keu_pembayaran_copy` VALUES ('5', '654', '100000', '3', '2015-11-01', '1', '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for keu_pemutihanpenerimaansiswa
-- ----------------------------
DROP TABLE IF EXISTS `keu_pemutihanpenerimaansiswa`;
CREATE TABLE `keu_pemutihanpenerimaansiswa` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `siswa` int(11) NOT NULL,
  `karyawan` int(11) NOT NULL,
  `nomom` varchar(20) NOT NULL,
  `tglmom` date DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `siswa` (`siswa`) USING BTREE,
  KEY `karyawan` (`karyawan`) USING BTREE,
  CONSTRAINT `karyawanFK` FOREIGN KEY (`karyawan`) REFERENCES `hrd_karyawan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `siswaFK3` FOREIGN KEY (`siswa`) REFERENCES `psb_siswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_pemutihanpenerimaansiswa
-- ----------------------------

-- ----------------------------
-- Table structure for keu_penerimaan
-- ----------------------------
DROP TABLE IF EXISTS `keu_penerimaan`;
CREATE TABLE `keu_penerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reftipe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_penerimaan
-- ----------------------------

-- ----------------------------
-- Table structure for keu_penerimaanbrg
-- ----------------------------
DROP TABLE IF EXISTS `keu_penerimaanbrg`;
CREATE TABLE `keu_penerimaanbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomerbukti` varchar(100) NOT NULL,
  `kodebrg` varchar(50) NOT NULL,
  `namabrg` varchar(100) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `satuan` varchar(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_penerimaanbrg
-- ----------------------------
INSERT INTO `keu_penerimaanbrg` VALUES ('1', 'AAA', 'ELKO001', '', '2', 'unit', '0');
INSERT INTO `keu_penerimaanbrg` VALUES ('2', 'BBB', '101', '', '1', 'unit', '20000');
INSERT INTO `keu_penerimaanbrg` VALUES ('3', 'AA001', 'ELKO001', 'Macbook pro 15 inch', '2', 'unit', '12000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('4', 'BB101', 'KEMTR0001', 'Supra X 125', '1', 'unit', '15000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('5', 'AS989', 'ELKO001', 'Macbook pro 15 inch', '1', 'unit', '12000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('6', 'ASD123', 'KEMTR0001', 'Supra X 125', '1', 'unit', '18000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('7', 'ASDW123', 'ELKO001', 'Macbook pro 15 inch', '1', 'unit', '12000000');

-- ----------------------------
-- Table structure for keu_penerimaansiswa
-- ----------------------------
DROP TABLE IF EXISTS `keu_penerimaansiswa`;
CREATE TABLE `keu_penerimaansiswa` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswabiaya` int(11) NOT NULL,
  `nominal` decimal(14,0) NOT NULL DEFAULT '0',
  `viabayar2` int(11) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `idkwitansi` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`replid`),
  KEY `siswabiaya` (`siswabiaya`) USING BTREE,
  KEY `viabayar2` (`viabayar2`) USING BTREE,
  CONSTRAINT `siswabiayaFK2` FOREIGN KEY (`siswabiaya`) REFERENCES `psb_siswabiaya` (`replid`) ON UPDATE CASCADE,
  CONSTRAINT `viabayarFK3` FOREIGN KEY (`viabayar2`) REFERENCES `keu_viabayar` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_penerimaansiswa
-- ----------------------------
INSERT INTO `keu_penerimaansiswa` VALUES ('5', '683', '300000', '2', '2015-11-19', '1', '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for keu_rekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_rekening`;
CREATE TABLE `keu_rekening` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategorirek` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_rekening
-- ----------------------------
INSERT INTO `keu_rekening` VALUES ('1', '1', '111101', 'KAS KECIL ', null, '');
INSERT INTO `keu_rekening` VALUES ('2', '1', '111102', 'KAS SATELIT', null, '');
INSERT INTO `keu_rekening` VALUES ('3', '1', '111103', 'KAS KERTAJAYA', null, '');
INSERT INTO `keu_rekening` VALUES ('4', '1', '111104', 'KAS RUNGKUT', null, '');
INSERT INTO `keu_rekening` VALUES ('5', '1', '111199', 'KAS DALAM PERJALANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('6', '2', '111201', 'BCA AC NO. 5560060001', null, '');
INSERT INTO `keu_rekening` VALUES ('7', '2', '111202', 'BANK EKONOMI AC NO. 3031861275', null, '');
INSERT INTO `keu_rekening` VALUES ('8', '2', '111203', 'BCA AC NO. 4683800000', null, '');
INSERT INTO `keu_rekening` VALUES ('9', '2', '111204', 'DEPOSITO EKONOMI', null, '');
INSERT INTO `keu_rekening` VALUES ('10', '2', '111205', 'BANK MAYAPADA AC NO.201.300.17.000', null, '');
INSERT INTO `keu_rekening` VALUES ('11', '2', '111206', 'CIMB-NIAGA AC NO.216.01.00543.00.5 (dh.LIPPOBANK)', null, '');
INSERT INTO `keu_rekening` VALUES ('12', '2', '111207', 'DEPOSITO MAYAPADA/PANIN/CIMB', null, '');
INSERT INTO `keu_rekening` VALUES ('13', '2', '111208', 'DEPOSITO PANINBANK', null, '');
INSERT INTO `keu_rekening` VALUES ('14', '2', '111209', 'PANINBANK AC NO.448.50.8888.7', null, '');
INSERT INTO `keu_rekening` VALUES ('15', '2', '111210', 'MANDARI AC NO. 1420088800098', null, '');
INSERT INTO `keu_rekening` VALUES ('16', '2', '111211', 'BANK BCA 8290960101', null, '');
INSERT INTO `keu_rekening` VALUES ('17', '2', '111299', 'BANK DALAM PERJALANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('18', '3', '111900', 'AYAT SILANG KAS DAN BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('19', '3', '112100', 'TABUNGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('20', '3', '112200', 'DEPOSITO BERJANGKA', null, '');
INSERT INTO `keu_rekening` VALUES ('21', '3', '112300', 'SURAT-SURAT BERHARGA', null, '');
INSERT INTO `keu_rekening` VALUES ('22', '3', '113100', 'PIUTANG USAHA', null, '');
INSERT INTO `keu_rekening` VALUES ('23', '3', '113200', 'PIUTANG YANG BELUM DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('24', '3', '113300', 'PIUTANG CEK/GIRO MUNDUR', null, '');
INSERT INTO `keu_rekening` VALUES ('25', '3', '113400', 'CADANGAN PIUTANG RAGU-RAGU', null, '');
INSERT INTO `keu_rekening` VALUES ('26', '3', '113500', 'PIUTANG DIREKSI', null, '');
INSERT INTO `keu_rekening` VALUES ('27', '3', '113600', 'PIUTANG KARYAWAN', null, '');
INSERT INTO `keu_rekening` VALUES ('28', '3', '113700', 'PIUTANG PIHAK III', null, '');
INSERT INTO `keu_rekening` VALUES ('29', '3', '113999', 'PIUTANG LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('30', '3', '114100', 'UANG MUKA PEMBELIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('31', '3', '114901', 'TANAH', null, '');
INSERT INTO `keu_rekening` VALUES ('32', '3', '114902', 'KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('33', '3', '114903', 'MESIN DAN PERALATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('34', '3', '114904', 'BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('35', '3', '114905', 'INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('36', '3', '114906', 'UANG MUKA PERJALANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('37', '3', '114999', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('38', '3', '116121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('39', '3', '116122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('40', '3', '116123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('41', '3', '116125', 'PPH PASAL 25', null, '');
INSERT INTO `keu_rekening` VALUES ('42', '3', '116126', 'PPH PASAL 26', null, '');
INSERT INTO `keu_rekening` VALUES ('43', '3', '116151', 'PPN MASUKAN YANG SUDAH DIKREDITKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('44', '3', '116152', 'PPN MASUKAN YANG BELUM DIKREDITKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('45', '3', '116201', 'ASURANSI', null, '');
INSERT INTO `keu_rekening` VALUES ('46', '3', '116202', 'SEWA', null, '');
INSERT INTO `keu_rekening` VALUES ('47', '3', '116203', 'BUNGA LEASING', null, '');
INSERT INTO `keu_rekening` VALUES ('48', '3', '116204', 'ONGKOS ANGKUT', null, '');
INSERT INTO `keu_rekening` VALUES ('49', '3', '116299', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('50', '3', '121000', 'PENYERTAAN DALAM SURAT BERHARGA', null, '');
INSERT INTO `keu_rekening` VALUES ('51', '3', '122000', 'PENYERTAAN DALAM AKTIVA TETAP', null, '');
INSERT INTO `keu_rekening` VALUES ('52', '3', '123000', 'PENYERTAAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('53', '3', '141100', 'TANAH KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('54', '3', '141251', 'PRASARANA JALAN', null, '');
INSERT INTO `keu_rekening` VALUES ('55', '3', '141252', 'PRASARANA SALURAN AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('56', '3', '141253', 'PRASARANA TAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('57', '3', '141301', 'INSTALASI LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('58', '3', '141302', 'INSTALASI AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('59', '3', '141303', 'INSTALASI TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('60', '3', '141401', 'MESIN-MESIN', null, '');
INSERT INTO `keu_rekening` VALUES ('61', '3', '141451', 'MESIN-MESIN LEASING', null, '');
INSERT INTO `keu_rekening` VALUES ('62', '3', '141501', 'KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('63', '3', '141551', 'KENDARAAN LEASING KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('64', '3', '141601', 'INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('65', '3', '145201', 'AKUM. PENY. BANGUNAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('66', '3', '145202', 'AKUM. PENY. BANGUNAN KANTIN', null, '');
INSERT INTO `keu_rekening` VALUES ('67', '3', '145203', 'AKUM. PENY. BANGUNAN MESS', null, '');
INSERT INTO `keu_rekening` VALUES ('68', '3', '145251', 'AKUM. PENY. PRASARANA JALAN', null, '');
INSERT INTO `keu_rekening` VALUES ('69', '3', '145252', 'AKUM. PENY. PRASARANA SALURAN AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('70', '3', '145253', 'AKUM. PENY. PRASARANA TAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('71', '3', '145301', 'AKUM. PENY. INSTALASI LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('72', '3', '145302', 'AKUM. PENY. INSTALASI AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('73', '3', '145303', 'AKUM. PENY. INSTALASI TELPON', null, '');
INSERT INTO `keu_rekening` VALUES ('74', '3', '145401', 'AKUM. PENY. KENDARAAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('75', '3', '145451', 'AKUM. PENY. KENDARAAN LEASING KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('76', '3', '145501', 'AKUM. PENY. INVENTARIS KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('77', '3', '145502', 'AKUM. PENY. INVENTARIS KANTIN', null, '');
INSERT INTO `keu_rekening` VALUES ('78', '3', '151000', 'GOODWILL', null, '');
INSERT INTO `keu_rekening` VALUES ('79', '3', '152000', 'HAK PATEN', null, '');
INSERT INTO `keu_rekening` VALUES ('80', '3', '153000', 'LISENSI', null, '');
INSERT INTO `keu_rekening` VALUES ('81', '3', '154000', 'AKTIVA TIDAK BERWUJUD LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('82', '3', '161101', 'BIAYA PENDIRIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('83', '3', '161102', 'GAJI, TUNJANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('84', '3', '161103', 'BIAYA PERJALANAN DINAS', null, '');
INSERT INTO `keu_rekening` VALUES ('85', '3', '161104', 'ALAT TULIS & KEPERLUAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('86', '3', '161105', 'IJIN, LEGAL DAN PROFESIONAL FEE', null, '');
INSERT INTO `keu_rekening` VALUES ('87', '3', '161106', 'ENTERTAINMENT,REPRESEN,SUMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('88', '3', '161107', 'TELEPON, FAX, TELEGRAM, KIRIM SURAT', null, '');
INSERT INTO `keu_rekening` VALUES ('89', '3', '161108', 'BENSIN, PARKIR, TOL', null, '');
INSERT INTO `keu_rekening` VALUES ('90', '3', '161109', 'BIAYA ADMINISTRASI BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('91', '3', '161110', 'BAHAN PENOLONG', null, '');
INSERT INTO `keu_rekening` VALUES ('92', '3', '161111', 'BIAYA IKLAN', null, '');
INSERT INTO `keu_rekening` VALUES ('93', '3', '161112', 'PAJAK-PAJAK', null, '');
INSERT INTO `keu_rekening` VALUES ('94', '3', '161113', 'REKENING LISTRIK, AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('95', '3', '161114', 'BIAYA STNK, BBN, DLL', null, '');
INSERT INTO `keu_rekening` VALUES ('96', '3', '161115', 'BUNGA, FEE, PROVISI BANK, DLL', null, '');
INSERT INTO `keu_rekening` VALUES ('97', '3', '161116', 'BIAYA PERESMIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('98', '3', '161117', 'BIAYA BAHAN BAKAR', null, '');
INSERT INTO `keu_rekening` VALUES ('99', '3', '161118', 'REPARASI & PEMELIHARAAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('100', '3', '161119', 'TRAINING, SEMINAR, TEST, DLL', null, '');
INSERT INTO `keu_rekening` VALUES ('101', '3', '161120', 'BIAYA MAKAN DAN MINUM', null, '');
INSERT INTO `keu_rekening` VALUES ('102', '3', '161121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('103', '3', '161122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('104', '3', '161123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('105', '3', '161124', 'REPARASI & PEMELIHARAAN KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('106', '3', '161125', 'REPARASI & PEMELIHARAAN MESS', null, '');
INSERT INTO `keu_rekening` VALUES ('107', '3', '161126', 'REPARASI & PEMELIHARAAN TANKI', null, '');
INSERT INTO `keu_rekening` VALUES ('108', '3', '161127', 'BIAYA PENGURUSAN LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('109', '3', '161128', 'REPARASI & PEMELIHARAAN BOTOL', null, '');
INSERT INTO `keu_rekening` VALUES ('110', '3', '161129', 'BIAYA SEWA GEDUNG', null, '');
INSERT INTO `keu_rekening` VALUES ('111', '3', '161130', 'BIAYA BUNGA LEASING', null, '');
INSERT INTO `keu_rekening` VALUES ('112', '3', '161143', 'SELISIH KURS', null, '');
INSERT INTO `keu_rekening` VALUES ('113', '3', '161144', 'BIAYA BUNGA PINJAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('114', '3', '161145', 'IURAN DAN ASURANSI', null, '');
INSERT INTO `keu_rekening` VALUES ('115', '3', '161146', 'BIAYA KEAMANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('116', '3', '161148', 'BIAYA PRA-OPERASI LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('117', '3', '161151', 'PENDAPATAN JASA GIRO', null, '');
INSERT INTO `keu_rekening` VALUES ('118', '3', '161152', 'PENDAPATAN BUNGA DEPOSITO', null, '');
INSERT INTO `keu_rekening` VALUES ('119', '3', '161153', 'PENDAPATAN BUNGA BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('120', '3', '161154', 'PENDAPATAN BUNGA PIHAK III', null, '');
INSERT INTO `keu_rekening` VALUES ('121', '3', '161199', 'PENDAPATAN PRA-OPERASI LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('122', '3', '161500', 'AKUM.AMORTISASI BIAYA PRA-OPERASI', null, '');
INSERT INTO `keu_rekening` VALUES ('123', '3', '162100', 'UANG JAMINAN LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('124', '3', '162200', 'UANG JAMINAN TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('125', '3', '163000', 'BIAYA YANG DITANGGUHKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('126', '3', '164000', 'BUNGA DALAM MASA KONSTRUKSI (IDC)', null, '');
INSERT INTO `keu_rekening` VALUES ('127', '3', '165201', 'BANGUNAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('128', '3', '165301', 'INSTALASI LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('129', '3', '165302', 'INSTALASI AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('130', '3', '165303', 'INSTALASI TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('131', '3', '166000', 'BIAYA PENELITIAN DAN PENGEMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('132', '3', '169000', 'AKTIVA LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('133', '4', '211101', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('134', '4', '211201', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('135', '4', '211501', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('136', '4', '211601', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('137', '4', '212100', 'HUTANG USAHA', null, '');
INSERT INTO `keu_rekening` VALUES ('138', '4', '212200', 'HUTANG YANG BELUM DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('139', '4', '212300', 'HUTANG CEK/BILYET GIRO MUNDUR', null, '');
INSERT INTO `keu_rekening` VALUES ('140', '4', '212901', 'HUTANG PIHAK KETIGA', null, '');
INSERT INTO `keu_rekening` VALUES ('141', '4', '212902', 'HUTANG PERSEDIAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('142', '4', '212903', 'HUTANG KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('143', '4', '212904', 'HUTANG BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('144', '4', '212905', 'HUTANG INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('145', '4', '212906', 'HUTANG VOUCHER', null, '');
INSERT INTO `keu_rekening` VALUES ('146', '4', '212907', 'HUTANG KPD GKA ELYON', null, '');
INSERT INTO `keu_rekening` VALUES ('147', '4', '212999', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('148', '4', '213100', 'UANG MUKA PENJUALAN', null, '');
INSERT INTO `keu_rekening` VALUES ('149', '4', '213900', 'UANG MUKA LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('150', '4', '214104', 'PPH PASAL 4 AYAT 2', null, '');
INSERT INTO `keu_rekening` VALUES ('151', '4', '214121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('152', '4', '214122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('153', '4', '214123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('154', '4', '214125', 'PPH PASAL 25', null, '');
INSERT INTO `keu_rekening` VALUES ('155', '4', '214126', 'PPH PASAL 26', null, '');
INSERT INTO `keu_rekening` VALUES ('156', '4', '214129', 'PPH PASAL 29', null, '');
INSERT INTO `keu_rekening` VALUES ('157', '4', '214151', 'PPN KELUARAN YANG SUDAH DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('158', '4', '214152', 'PPN KELUARAN YANG BELUM DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('159', '4', '214201', 'BUNGA', null, '');
INSERT INTO `keu_rekening` VALUES ('160', '4', '214202', 'SEWA', null, '');
INSERT INTO `keu_rekening` VALUES ('161', '4', '214203', 'GAJI DAN HONOR', null, '');
INSERT INTO `keu_rekening` VALUES ('162', '4', '214204', 'MAKAN DAN LEMBUR', null, '');
INSERT INTO `keu_rekening` VALUES ('163', '4', '214205', 'LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('164', '4', '214206', 'TUNJANGAN TRANSPORT-MAINTENANCE', null, '');
INSERT INTO `keu_rekening` VALUES ('165', '4', '214207', 'TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('166', '4', '214208', 'SURAT KABAR/MAJALAH', null, '');
INSERT INTO `keu_rekening` VALUES ('167', '4', '214209', 'KOMISI', null, '');
INSERT INTO `keu_rekening` VALUES ('168', '4', '214210', 'BIAYA ADMINISTRASI BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('169', '4', '214211', 'PAJAK WAPU/WAJIB PUNGUT', null, '');
INSERT INTO `keu_rekening` VALUES ('170', '4', '214212', 'JAMSOSTEK', null, '');
INSERT INTO `keu_rekening` VALUES ('171', '4', '214213', 'PREMI DISTRIBUSI', null, '');
INSERT INTO `keu_rekening` VALUES ('172', '4', '214214', 'ONGKOS ANGKUT', null, '');
INSERT INTO `keu_rekening` VALUES ('173', '4', '214299', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('174', '4', '215121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('175', '4', '215122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('176', '4', '215123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('177', '4', '215125', 'PPH PASAL 25', null, '');
INSERT INTO `keu_rekening` VALUES ('178', '4', '215201', 'PPN KELUARAN', null, '');
INSERT INTO `keu_rekening` VALUES ('179', '4', '215202', 'PPN EKS KEPPRES', null, '');
INSERT INTO `keu_rekening` VALUES ('180', '4', '216101', 'HUTANG LEASING KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('181', '4', '219101', 'HUTANG DEVIDEN', null, '');
INSERT INTO `keu_rekening` VALUES ('182', '4', '219199', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('183', '4', '221101', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('184', '4', '221201', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('185', '4', '22210', 'HUTANG LEASING KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('186', '4', '223000', 'HUTANG PADA PEMEGANG SAHAM', null, '');
INSERT INTO `keu_rekening` VALUES ('187', '4', '230000', 'HUTANG LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('188', '4', '240000', 'HUTANG YG. DISUBORDINASI', null, '');
INSERT INTO `keu_rekening` VALUES ('189', '4', '250000', 'KEWAJIBAN BERSYARAT', null, '');
INSERT INTO `keu_rekening` VALUES ('190', '5', '311101', 'TIDAK TERIKAT', null, '');
INSERT INTO `keu_rekening` VALUES ('191', '5', '312101', 'TEMPORER...........', null, '');
INSERT INTO `keu_rekening` VALUES ('192', '5', '312201', 'PERMANEN......', null, '');
INSERT INTO `keu_rekening` VALUES ('193', '6', '411101', 'DANA DARI DONATUR', null, '');
INSERT INTO `keu_rekening` VALUES ('194', '6', '411102', 'DPP (DANA PEMBANGUNAN & PENGEMBANGAN)', null, '');
INSERT INTO `keu_rekening` VALUES ('195', '6', '411103', 'DANA JOINING', null, '');
INSERT INTO `keu_rekening` VALUES ('196', '6', '411104', 'DPP SUKARELA (DANA PEMBANGUNAN & PENGEMBANGAN)', null, '');
INSERT INTO `keu_rekening` VALUES ('197', '6', '411105', 'DANA STUDENT EXCHANGE', null, '');
INSERT INTO `keu_rekening` VALUES ('198', '6', '411201', 'SUMBANGAN TERIKAT TEMPORER', null, '');
INSERT INTO `keu_rekening` VALUES ('199', '6', '411202', 'SUMBANGAN TERIKAT PERMANEN', null, '');
INSERT INTO `keu_rekening` VALUES ('200', '6', '412101', 'PENJUALAN FORMULIR + PSIKOTES', null, '');
INSERT INTO `keu_rekening` VALUES ('201', '6', '412102', 'UANG KEG. EKSTRAKURIKULER', null, '');
INSERT INTO `keu_rekening` VALUES ('202', '6', '412103', 'UANG PENDAFTARAN ULANG', null, '');
INSERT INTO `keu_rekening` VALUES ('203', '6', '412104', 'UANG SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('204', '6', '412105', 'PENDAPATAN PENJUALAN SERAGAM', null, '');
INSERT INTO `keu_rekening` VALUES ('205', '6', '412106', 'PENDAPATAN PENJUALAN BUKU', null, '');
INSERT INTO `keu_rekening` VALUES ('206', '6', '412107', 'PENDAPATAN PENJUALAN CD/VCD/DVD', null, '');
INSERT INTO `keu_rekening` VALUES ('207', '6', '412108', 'PENDAPATAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('208', '6', '412109', 'PENDAPATAN LUNCH', null, '');
INSERT INTO `keu_rekening` VALUES ('209', '6', '412110', 'PENDAPATAN STATIONERY DAN HANDOUT, MATERIAL FEE', null, '');
INSERT INTO `keu_rekening` VALUES ('210', '6', '412111', 'DENDA KETERLAMBATAN BAYAR UANG SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('211', '6', '412112', 'PENDAPATAN CHECK POINT', null, '');
INSERT INTO `keu_rekening` VALUES ('212', '6', '412113', 'PENDAPATAN UJIAN HSK', null, '');
INSERT INTO `keu_rekening` VALUES ('213', '6', '412114', 'PENDAPATAN DAY CARE', null, '');
INSERT INTO `keu_rekening` VALUES ('214', '6', '421101', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG', null, '');
INSERT INTO `keu_rekening` VALUES ('215', '6', '421102', 'PENGHASILAN INVESTASI TIDAK TERIKAT LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('216', '6', '421103', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG ', null, '');
INSERT INTO `keu_rekening` VALUES ('217', '6', '421201', 'PENGHASILAN INVESTASI TERIKAT TEMPORER', null, '');
INSERT INTO `keu_rekening` VALUES ('218', '6', '421202', 'PENGHASILAN INVESTASI TERIKAT PERMANEN', null, '');
INSERT INTO `keu_rekening` VALUES ('219', '7', '511101', 'GAJI', null, '');
INSERT INTO `keu_rekening` VALUES ('220', '7', '511102', 'HONOR', null, '');
INSERT INTO `keu_rekening` VALUES ('221', '7', '511103', 'LEMBUR', null, '');
INSERT INTO `keu_rekening` VALUES ('222', '7', '511104', 'PESANGON', null, '');
INSERT INTO `keu_rekening` VALUES ('223', '7', '511105', 'UANG MAKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('224', '7', '511106', 'BONUS', null, '');
INSERT INTO `keu_rekening` VALUES ('225', '7', '511107', 'TUNJANGAN HARI RAYA', null, '');
INSERT INTO `keu_rekening` VALUES ('226', '7', '511108', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('227', '7', '511109', 'KESEJAHTERAAN KARYAWAN', null, '');
INSERT INTO `keu_rekening` VALUES ('228', '7', '511110', 'JAMINAN KECELAKAAN KERJA ( JKK )', null, '');
INSERT INTO `keu_rekening` VALUES ('229', '7', '511111', 'JAMINAN KEMATIAN ( JKM )', null, '');
INSERT INTO `keu_rekening` VALUES ('230', '7', '511112', 'JAMINAN HARI TUA ( JHT )', null, '');
INSERT INTO `keu_rekening` VALUES ('231', '7', '511113', 'JAMINAN PEMELIHARAAN KESEHATAN (JPK)', null, '');
INSERT INTO `keu_rekening` VALUES ('232', '7', '511114', 'TUNJANGAN DANA PENSIUN', null, '');
INSERT INTO `keu_rekening` VALUES ('233', '7', '511115', 'TUNJANGAN KESEHATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('234', '7', '511116', 'TUNJANGAN TRANSPORT', null, '');
INSERT INTO `keu_rekening` VALUES ('235', '7', '511117', 'JAMSOSTEK', null, '');
INSERT INTO `keu_rekening` VALUES ('236', '7', '511119', 'PREMI ', null, '');
INSERT INTO `keu_rekening` VALUES ('237', '7', '511199', 'TUNJANGAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('238', '7', '512101', 'BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA', null, '');
INSERT INTO `keu_rekening` VALUES ('239', '7', '512102', 'BI.BAHAN PERB. & PEMELIHARAAN KEND.', null, '');
INSERT INTO `keu_rekening` VALUES ('240', '7', '512103', 'BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('241', '7', '512199', 'BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('242', '7', '512201', 'PENYUSUTAN BANGUNAN & PRASARANA', null, '');
INSERT INTO `keu_rekening` VALUES ('243', '7', '512202', 'PENYUSUTAN KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('244', '7', '512203', 'PENYUSUTAN INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('245', '7', '512204', 'PENYUSUTAN INSTALASI', null, '');
INSERT INTO `keu_rekening` VALUES ('246', '7', '512301', 'TRANSPORTASI ( BENSIN, TIKET )', null, '');
INSERT INTO `keu_rekening` VALUES ('247', '7', '512302', 'MAKANAN & MINUMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('248', '7', '512303', 'PENGINAPAN', null, '');
INSERT INTO `keu_rekening` VALUES ('249', '7', '512304', 'UANG SAKU', null, '');
INSERT INTO `keu_rekening` VALUES ('250', '7', '512399', 'LAIN-LAIN ( PARKIR, TOL )', null, '');
INSERT INTO `keu_rekening` VALUES ('251', '7', '512401', 'SEWA BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('252', '7', '512402', 'SEWA KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('253', '7', '512403', 'SEWA INVENTARIS KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('254', '7', '512451', 'ASURANSI BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('255', '7', '512452', 'ASURANSI KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('256', '7', '512453', 'ASURANSI INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('257', '7', '512501', 'TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('258', '7', '512502', 'TELEX', null, '');
INSERT INTO `keu_rekening` VALUES ('259', '7', '512503', 'TELEGRAM', null, '');
INSERT INTO `keu_rekening` VALUES ('260', '7', '512504', 'INTERLOKAL NON TELEPON INTERN', null, '');
INSERT INTO `keu_rekening` VALUES ('261', '7', '512505', 'FACSIMILE', null, '');
INSERT INTO `keu_rekening` VALUES ('262', '7', '512599', 'LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('263', '7', '512601', 'AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('264', '7', '512602', 'LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('265', '7', '512603', 'ALAT-ALAT LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('266', '7', '512701', 'AKUNTAN', null, '');
INSERT INTO `keu_rekening` VALUES ('267', '7', '512702', 'NOTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('268', '7', '512703', 'KONSULTAN', null, '');
INSERT INTO `keu_rekening` VALUES ('269', '7', '512704', 'MANAGEMENT FEE', null, '');
INSERT INTO `keu_rekening` VALUES ('270', '7', '512801', 'ADMINISTRASI BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('271', '7', '512802', 'BUKU CEK / BG', null, '');
INSERT INTO `keu_rekening` VALUES ('272', '7', '512803', 'TRANSFER, KIRIM UANG , INKASO', null, '');
INSERT INTO `keu_rekening` VALUES ('273', '7', '512804', 'PAJAK BUNGA BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('274', '7', '512901', 'BIAYA ADMINISTRASI KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('275', '7', '512902', 'BIAYA BUNGA ANGSURAN KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('276', '7', '512903', 'BIAYA BUNGA KREDIT BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('277', '7', '513101', 'ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('278', '7', '513102', 'PERANGKO, MATERAI, KIRIM SURAT', null, '');
INSERT INTO `keu_rekening` VALUES ('279', '7', '513103', 'FOTOCOPY/LAMINATING/CETAK FOTO', null, '');
INSERT INTO `keu_rekening` VALUES ('280', '7', '513104', 'ALAT - ALAT PENGAJARAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('281', '7', '513105', 'PERLENGKAPAN KELAS', null, '');
INSERT INTO `keu_rekening` VALUES ('282', '7', '513106', 'JASA PEMBELAJARAN', null, '');
INSERT INTO `keu_rekening` VALUES ('283', '7', '513201', 'PERIJINAN', null, '');
INSERT INTO `keu_rekening` VALUES ('284', '7', '513202', 'PAJAK - PAJAK DAERAH,PBB', null, '');
INSERT INTO `keu_rekening` VALUES ('285', '7', '513203', 'STNK', null, '');
INSERT INTO `keu_rekening` VALUES ('286', '7', '513211', 'RETRIBUSI SAMPAH', null, '');
INSERT INTO `keu_rekening` VALUES ('287', '7', '513301', 'SUMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('288', '7', '513302', 'ENTERTAINMENT', null, '');
INSERT INTO `keu_rekening` VALUES ('289', '7', '513303', 'JAMUAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('290', '7', '513401', 'KEAMANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('291', '7', '513501', 'PENDAFTARAN', null, '');
INSERT INTO `keu_rekening` VALUES ('292', '7', '513502', 'IURAN', null, '');
INSERT INTO `keu_rekening` VALUES ('293', '7', '513601', 'BIAYA PENGOBATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('294', '7', '513701', 'MAKANAN DAN MINUMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('295', '7', '513702', 'BAHAN BAKAR DAN PARKIR/TRANSPORT', null, '');
INSERT INTO `keu_rekening` VALUES ('296', '7', '513703', 'SERAGAM ', null, '');
INSERT INTO `keu_rekening` VALUES ('297', '7', '513704', 'SEWA DISPENSER', null, '');
INSERT INTO `keu_rekening` VALUES ('298', '7', '513705', 'OLAH RAGA DAN KESENIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('299', '7', '513706', 'BIAYA TRAINING, SEMINAR DAN STUDI BANDING', null, '');
INSERT INTO `keu_rekening` VALUES ('300', '7', '513707', 'BUKU, VCD', null, '');
INSERT INTO `keu_rekening` VALUES ('301', '7', '513708', 'ATRIBUT SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('302', '7', '513709', 'BIAYA PSIKOTES', null, '');
INSERT INTO `keu_rekening` VALUES ('303', '7', '513710', 'BIAYA ADVERTENSI ( IKLAN )', null, '');
INSERT INTO `keu_rekening` VALUES ('304', '7', '513711', 'BIAYA STUDY TOUR', null, '');
INSERT INTO `keu_rekening` VALUES ('305', '7', '513712', 'BIAYA PERLOMBAAN & PERAYAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('306', '7', '513713', 'STIKER U/ MURID', null, '');
INSERT INTO `keu_rekening` VALUES ('307', '7', '513714', 'BIAYA TES KESEHATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('308', '7', '513715', 'BIAYA KOMISI PENGEMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('309', '7', '513716', 'BIAYA PAMERAN', null, '');
INSERT INTO `keu_rekening` VALUES ('310', '7', '513799', 'LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('311', '7', '513801', 'KANTIN', null, '');
INSERT INTO `keu_rekening` VALUES ('312', '7', '513802', 'DAPUR', null, '');
INSERT INTO `keu_rekening` VALUES ('313', '7', '513803', 'BIAYA KEBERSIHAN', null, '');
INSERT INTO `keu_rekening` VALUES ('314', '7', '513804', 'BIAYA KEPERLUAN KEBUN/TAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('315', '7', '513805', 'JASA CLEANING SERVICE', null, '');
INSERT INTO `keu_rekening` VALUES ('316', '7', '513806', '', null, '');
INSERT INTO `keu_rekening` VALUES ('317', '7', '513807', 'BIAYA MESS', null, '');
INSERT INTO `keu_rekening` VALUES ('318', '7', '513901', 'SELAMATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('319', '7', '513902', 'BIAYA PENGURUSAN SURAT LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('320', '7', '513903', 'DENDA PAJAK', null, '');
INSERT INTO `keu_rekening` VALUES ('321', '7', '513904', 'KOREKSI TAHUN LALU', null, '');
INSERT INTO `keu_rekening` VALUES ('322', '7', '513998', 'LAIN - LAIN (SELISIH KURS)', null, '');
INSERT INTO `keu_rekening` VALUES ('323', '7', '513999', 'LAIN - LAIN (SELISIH KAS)', null, '');
INSERT INTO `keu_rekening` VALUES ('324', '7', '514001', 'TRANSPORT', null, '');
INSERT INTO `keu_rekening` VALUES ('325', '7', '514002', 'MAKAN & MINUM (RAPAT)', null, '');
INSERT INTO `keu_rekening` VALUES ('326', '7', '514099', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('327', '7', '514101', 'BUKU', null, '');
INSERT INTO `keu_rekening` VALUES ('328', '7', '514102', 'VCD', null, '');
INSERT INTO `keu_rekening` VALUES ('329', '7', '514103', 'SERAGAM ', null, '');
INSERT INTO `keu_rekening` VALUES ('330', '7', '514104', 'ATRIBUT SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('331', '7', '514105', 'BIAYA PSIKOTES', null, '');
INSERT INTO `keu_rekening` VALUES ('332', '7', '514106', 'BIAYA STUDY TOUR/FIELD TRIP', null, '');
INSERT INTO `keu_rekening` VALUES ('333', '7', '514107', 'BIAYA PERLOMBAAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('334', '7', '514108', 'EKSTRAKURIKULER', null, '');
INSERT INTO `keu_rekening` VALUES ('335', '7', '514109', 'BIAYA STUDENT EXCHANGE', null, '');
INSERT INTO `keu_rekening` VALUES ('336', '7', '514110', 'BIAYA CHECK POINT', null, '');
INSERT INTO `keu_rekening` VALUES ('337', '7', '514199', 'LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('340', '1', '111109', 'test rekening dua x', '5500000', 'keterangan tes dua');

-- ----------------------------
-- Table structure for keu_rekeningbiaya
-- ----------------------------
DROP TABLE IF EXISTS `keu_rekeningbiaya`;
CREATE TABLE `keu_rekeningbiaya` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `biaya` int(11) NOT NULL,
  `departemen` int(11) NOT NULL,
  `tahunajaran` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `biaya` (`biaya`) USING BTREE,
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  KEY `departemen` (`departemen`) USING BTREE,
  CONSTRAINT `biayaFK2` FOREIGN KEY (`biaya`) REFERENCES `psb_biaya` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `departemenFK2` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tahunajaranFK7` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_rekeningbiaya
-- ----------------------------
INSERT INTO `keu_rekeningbiaya` VALUES ('1', '3', '1', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('2', '3', '1', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('3', '3', '1', '12');
INSERT INTO `keu_rekeningbiaya` VALUES ('4', '3', '2', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('5', '3', '2', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('6', '3', '2', '12');
INSERT INTO `keu_rekeningbiaya` VALUES ('7', '3', '3', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('8', '3', '3', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('9', '3', '3', '12');
INSERT INTO `keu_rekeningbiaya` VALUES ('10', '4', '1', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('11', '4', '1', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('12', '4', '1', '12');
INSERT INTO `keu_rekeningbiaya` VALUES ('13', '4', '2', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('14', '4', '2', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('15', '4', '2', '12');
INSERT INTO `keu_rekeningbiaya` VALUES ('16', '4', '3', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('17', '4', '3', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('18', '4', '3', '12');
INSERT INTO `keu_rekeningbiaya` VALUES ('19', '7', '1', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('20', '7', '1', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('21', '7', '1', '12');
INSERT INTO `keu_rekeningbiaya` VALUES ('22', '7', '2', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('23', '7', '2', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('24', '7', '2', '12');
INSERT INTO `keu_rekeningbiaya` VALUES ('25', '7', '3', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('26', '7', '3', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('27', '7', '3', '12');
INSERT INTO `keu_rekeningbiaya` VALUES ('28', '8', '1', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('29', '8', '1', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('30', '8', '1', '12');
INSERT INTO `keu_rekeningbiaya` VALUES ('31', '8', '2', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('32', '8', '2', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('33', '8', '2', '12');
INSERT INTO `keu_rekeningbiaya` VALUES ('34', '8', '3', '3');
INSERT INTO `keu_rekeningbiaya` VALUES ('35', '8', '3', '5');
INSERT INTO `keu_rekeningbiaya` VALUES ('36', '8', '3', '12');

-- ----------------------------
-- Table structure for keu_saldorekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_saldorekening`;
CREATE TABLE `keu_saldorekening` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilrekening` int(11) NOT NULL,
  `tahunajaran` int(11) NOT NULL,
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  `nominal2` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  KEY `detilrekening` (`detilrekening`) USING BTREE,
  CONSTRAINT `detilrekeningFK1` FOREIGN KEY (`detilrekening`) REFERENCES `keu_detilrekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tahunajaranFK6` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2207 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_saldorekening
-- ----------------------------
INSERT INTO `keu_saldorekening` VALUES ('1184', '1', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1185', '1', '5', '1000000', '1000000');
INSERT INTO `keu_saldorekening` VALUES ('1186', '1', '12', '10000', '846875');
INSERT INTO `keu_saldorekening` VALUES ('1187', '2', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1188', '2', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1189', '2', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1190', '3', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1191', '3', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1192', '3', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1193', '4', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1194', '4', '5', '30000000', '30000000');
INSERT INTO `keu_saldorekening` VALUES ('1195', '4', '12', '1000000', '1000000');
INSERT INTO `keu_saldorekening` VALUES ('1196', '5', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1197', '5', '5', '10000', '-390000');
INSERT INTO `keu_saldorekening` VALUES ('1198', '5', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1199', '6', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1200', '6', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1201', '6', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1202', '7', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1203', '7', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1204', '7', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1205', '8', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1206', '8', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1207', '8', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1208', '9', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1209', '9', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1210', '9', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1211', '10', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1212', '10', '5', '10000', '410000');
INSERT INTO `keu_saldorekening` VALUES ('1213', '10', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1214', '11', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1215', '11', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1216', '11', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1217', '12', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1218', '12', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1219', '12', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1220', '13', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1221', '13', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1222', '13', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1223', '14', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1224', '14', '5', '5000000', '5700000');
INSERT INTO `keu_saldorekening` VALUES ('1225', '14', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1226', '15', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1227', '15', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1228', '15', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1229', '16', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1230', '16', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1231', '16', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1232', '17', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1233', '17', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1234', '17', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1235', '18', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1236', '18', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1237', '18', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1238', '19', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1239', '19', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1240', '19', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1241', '20', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1242', '20', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1243', '20', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1244', '21', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1245', '21', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1246', '21', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1247', '22', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1248', '22', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1249', '22', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1250', '23', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1251', '23', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1252', '23', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1253', '24', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1254', '24', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1255', '24', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1256', '25', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1257', '25', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1258', '25', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1259', '26', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1260', '26', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1261', '26', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1262', '27', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1263', '27', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1264', '27', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1265', '28', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1266', '28', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1267', '28', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1268', '29', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1269', '29', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1270', '29', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1271', '30', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1272', '30', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1273', '30', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1274', '31', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1275', '31', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1276', '31', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1277', '32', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1278', '32', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1279', '32', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1280', '33', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1281', '33', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1282', '33', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1283', '34', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1284', '34', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1285', '34', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1286', '35', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1287', '35', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1288', '35', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1289', '36', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1290', '36', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1291', '36', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1292', '37', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1293', '37', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1294', '37', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1295', '38', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1296', '38', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1297', '38', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1298', '39', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1299', '39', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1300', '39', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1301', '40', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1302', '40', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1303', '40', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1304', '41', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1305', '41', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1306', '41', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1307', '42', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1308', '42', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1309', '42', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1310', '43', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1311', '43', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1312', '43', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1313', '44', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1314', '44', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1315', '44', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1316', '45', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1317', '45', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1318', '45', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1319', '46', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1320', '46', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1321', '46', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1322', '47', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1323', '47', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1324', '47', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1325', '48', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1326', '48', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1327', '48', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1328', '49', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1329', '49', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1330', '49', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1331', '50', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1332', '50', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1333', '50', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1334', '51', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1335', '51', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1336', '51', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1337', '52', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1338', '52', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1339', '52', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1340', '53', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1341', '53', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1342', '53', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1343', '54', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1344', '54', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1345', '54', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1346', '55', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1347', '55', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1348', '55', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1349', '56', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1350', '56', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1351', '56', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1352', '57', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1353', '57', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1354', '57', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1355', '58', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1356', '58', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1357', '58', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1358', '59', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1359', '59', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1360', '59', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1361', '60', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1362', '60', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1363', '60', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1364', '61', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1365', '61', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1366', '61', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1367', '62', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1368', '62', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1369', '62', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1370', '63', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1371', '63', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1372', '63', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1373', '64', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1374', '64', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1375', '64', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1376', '65', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1377', '65', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1378', '65', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1379', '66', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1380', '66', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1381', '66', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1382', '67', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1383', '67', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1384', '67', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1385', '68', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1386', '68', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1387', '68', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1388', '69', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1389', '69', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1390', '69', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1391', '70', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1392', '70', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1393', '70', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1394', '71', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1395', '71', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1396', '71', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1397', '72', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1398', '72', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1399', '72', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1400', '73', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1401', '73', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1402', '73', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1403', '74', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1404', '74', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1405', '74', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1406', '75', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1407', '75', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1408', '75', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1409', '76', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1410', '76', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1411', '76', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1412', '77', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1413', '77', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1414', '77', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1415', '78', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1416', '78', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1417', '78', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1418', '79', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1419', '79', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1420', '79', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1421', '80', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1422', '80', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1423', '80', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1424', '81', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1425', '81', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1426', '81', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1427', '82', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1428', '82', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1429', '82', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1430', '83', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1431', '83', '5', '10000000', '10000000');
INSERT INTO `keu_saldorekening` VALUES ('1432', '83', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1433', '84', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1434', '84', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1435', '84', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1436', '85', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1437', '85', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1438', '85', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1439', '86', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1440', '86', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1441', '86', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1442', '87', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1443', '87', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1444', '87', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1445', '88', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1446', '88', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1447', '88', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1448', '89', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1449', '89', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1450', '89', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1451', '90', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1452', '90', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1453', '90', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1454', '91', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1455', '91', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1456', '91', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1457', '92', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1458', '92', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1459', '92', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1460', '93', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1461', '93', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1462', '93', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1463', '94', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1464', '94', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1465', '94', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1466', '95', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1467', '95', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1468', '95', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1469', '96', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1470', '96', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1471', '96', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1472', '97', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1473', '97', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1474', '97', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1475', '98', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1476', '98', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1477', '98', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1478', '99', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1479', '99', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1480', '99', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1481', '100', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1482', '100', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1483', '100', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1484', '101', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1485', '101', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1486', '101', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1487', '102', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1488', '102', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1489', '102', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1490', '103', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1491', '103', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1492', '103', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1493', '104', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1494', '104', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1495', '104', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1496', '105', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1497', '105', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1498', '105', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1499', '106', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1500', '106', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1501', '106', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1502', '107', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1503', '107', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1504', '107', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1505', '108', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1506', '108', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1507', '108', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1508', '109', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1509', '109', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1510', '109', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1511', '110', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1512', '110', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1513', '110', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1514', '111', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1515', '111', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1516', '111', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1517', '112', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1518', '112', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1519', '112', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1520', '113', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1521', '113', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1522', '113', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1523', '114', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1524', '114', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1525', '114', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1526', '115', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1527', '115', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1528', '115', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1529', '116', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1530', '116', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1531', '116', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1532', '117', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1533', '117', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1534', '117', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1535', '118', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1536', '118', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1537', '118', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1538', '119', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1539', '119', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1540', '119', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1541', '120', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1542', '120', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1543', '120', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1544', '121', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1545', '121', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1546', '121', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1547', '122', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1548', '122', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1549', '122', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1550', '123', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1551', '123', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1552', '123', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1553', '124', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1554', '124', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1555', '124', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1556', '125', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1557', '125', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1558', '125', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1559', '126', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1560', '126', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1561', '126', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1562', '127', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1563', '127', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1564', '127', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1565', '128', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1566', '128', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1567', '128', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1568', '129', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1569', '129', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1570', '129', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1571', '130', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1572', '130', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1573', '130', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1574', '131', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1575', '131', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1576', '131', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1577', '132', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1578', '132', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1579', '132', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1580', '133', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1581', '133', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1582', '133', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1583', '134', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1584', '134', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1585', '134', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1586', '135', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1587', '135', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1588', '135', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1589', '136', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1590', '136', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1591', '136', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1592', '137', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1593', '137', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1594', '137', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1595', '138', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1596', '138', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1597', '138', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1598', '139', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1599', '139', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1600', '139', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1601', '140', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1602', '140', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1603', '140', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1604', '141', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1605', '141', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1606', '141', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1607', '142', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1608', '142', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1609', '142', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1610', '143', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1611', '143', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1612', '143', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1613', '144', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1614', '144', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1615', '144', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1616', '145', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1617', '145', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1618', '145', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1619', '146', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1620', '146', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1621', '146', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1622', '147', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1623', '147', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1624', '147', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1625', '148', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1626', '148', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1627', '148', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1628', '149', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1629', '149', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1630', '149', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1631', '150', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1632', '150', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1633', '150', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1634', '151', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1635', '151', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1636', '151', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1637', '152', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1638', '152', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1639', '152', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1640', '153', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1641', '153', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1642', '153', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1643', '154', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1644', '154', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1645', '154', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1646', '155', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1647', '155', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1648', '155', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1649', '156', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1650', '156', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1651', '156', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1652', '157', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1653', '157', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1654', '157', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1655', '158', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1656', '158', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1657', '158', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1658', '159', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1659', '159', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1660', '159', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1661', '160', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1662', '160', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1663', '160', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1664', '161', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1665', '161', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1666', '161', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1667', '162', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1668', '162', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1669', '162', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1670', '163', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1671', '163', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1672', '163', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1673', '164', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1674', '164', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1675', '164', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1676', '165', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1677', '165', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1678', '165', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1679', '166', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1680', '166', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1681', '166', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1682', '167', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1683', '167', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1684', '167', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1685', '168', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1686', '168', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1687', '168', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1688', '169', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1689', '169', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1690', '169', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1691', '170', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1692', '170', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1693', '170', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1694', '171', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1695', '171', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1696', '171', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1697', '172', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1698', '172', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1699', '172', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1700', '173', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1701', '173', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1702', '173', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1703', '174', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1704', '174', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1705', '174', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1706', '175', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1707', '175', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1708', '175', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1709', '176', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1710', '176', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1711', '176', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1712', '177', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1713', '177', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1714', '177', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1715', '178', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1716', '178', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1717', '178', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1718', '179', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1719', '179', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1720', '179', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1721', '180', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1722', '180', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1723', '180', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1724', '181', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1725', '181', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1726', '181', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1727', '182', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1728', '182', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1729', '182', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1730', '183', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1731', '183', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1732', '183', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1733', '184', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1734', '184', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1735', '184', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1736', '185', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1737', '185', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1738', '185', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1739', '186', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1740', '186', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1741', '186', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1742', '187', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1743', '187', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1744', '187', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1745', '188', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1746', '188', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1747', '188', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1748', '189', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1749', '189', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1750', '189', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1751', '190', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1752', '190', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1753', '190', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1754', '191', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1755', '191', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1756', '191', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1757', '192', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1758', '192', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1759', '192', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1760', '193', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1761', '193', '5', '1000000', '1000000');
INSERT INTO `keu_saldorekening` VALUES ('1762', '193', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1763', '194', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1764', '194', '5', '5000000', '5700000');
INSERT INTO `keu_saldorekening` VALUES ('1765', '194', '12', '10000', '846875');
INSERT INTO `keu_saldorekening` VALUES ('1766', '195', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1767', '195', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1768', '195', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1769', '196', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1770', '196', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1771', '196', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1772', '197', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1773', '197', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1774', '197', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1775', '198', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1776', '198', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1777', '198', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1778', '199', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1779', '199', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1780', '199', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1781', '200', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1782', '200', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1783', '200', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1784', '201', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1785', '201', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1786', '201', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1787', '202', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1788', '202', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1789', '202', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1790', '203', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1791', '203', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1792', '203', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1793', '204', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1794', '204', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1795', '204', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1796', '205', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1797', '205', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1798', '205', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1799', '206', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1800', '206', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1801', '206', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1802', '207', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1803', '207', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1804', '207', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1805', '208', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1806', '208', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1807', '208', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1808', '209', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1809', '209', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1810', '209', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1811', '210', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1812', '210', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1813', '210', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1814', '211', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1815', '211', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1816', '211', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1817', '212', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1818', '212', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1819', '212', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1820', '213', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1821', '213', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1822', '213', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1823', '214', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1824', '214', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1825', '214', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1826', '215', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1827', '215', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1828', '215', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1829', '216', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1830', '216', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1831', '216', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1832', '217', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1833', '217', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1834', '217', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1835', '218', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1836', '218', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1837', '218', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1838', '219', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1839', '219', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1840', '219', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1841', '220', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1842', '220', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1843', '220', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1844', '221', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1845', '221', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1846', '221', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1847', '222', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1848', '222', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1849', '222', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1850', '223', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1851', '223', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1852', '223', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1853', '224', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1854', '224', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1855', '224', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1856', '225', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1857', '225', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1858', '225', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1859', '226', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1860', '226', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1861', '226', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1862', '227', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1863', '227', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1864', '227', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1865', '228', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1866', '228', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1867', '228', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1868', '229', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1869', '229', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1870', '229', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1871', '230', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1872', '230', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1873', '230', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1874', '231', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1875', '231', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1876', '231', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1877', '232', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1878', '232', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1879', '232', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1880', '233', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1881', '233', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1882', '233', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1883', '234', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1884', '234', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1885', '234', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1886', '235', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1887', '235', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1888', '235', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1889', '236', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1890', '236', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1891', '236', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1892', '237', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1893', '237', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1894', '237', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1895', '238', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1896', '238', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1897', '238', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1898', '239', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1899', '239', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1900', '239', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1901', '240', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1902', '240', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1903', '240', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1904', '241', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1905', '241', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1906', '241', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1907', '242', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1908', '242', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1909', '242', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1910', '243', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1911', '243', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1912', '243', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1913', '244', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1914', '244', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1915', '244', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1916', '245', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1917', '245', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1918', '245', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1919', '246', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1920', '246', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1921', '246', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1922', '247', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1923', '247', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1924', '247', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1925', '248', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1926', '248', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1927', '248', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1928', '249', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1929', '249', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1930', '249', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1931', '250', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1932', '250', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1933', '250', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1934', '251', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1935', '251', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1936', '251', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1937', '252', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1938', '252', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1939', '252', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1940', '253', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1941', '253', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1942', '253', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1943', '254', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1944', '254', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1945', '254', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1946', '255', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1947', '255', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1948', '255', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1949', '256', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1950', '256', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1951', '256', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1952', '257', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1953', '257', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1954', '257', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1955', '258', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1956', '258', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1957', '258', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1958', '259', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1959', '259', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1960', '259', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1961', '260', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1962', '260', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1963', '260', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1964', '261', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1965', '261', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1966', '261', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1967', '262', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1968', '262', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1969', '262', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1970', '263', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1971', '263', '5', '1000000', '1000000');
INSERT INTO `keu_saldorekening` VALUES ('1972', '263', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1973', '264', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1974', '264', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1975', '264', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1976', '265', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1977', '265', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1978', '265', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1979', '266', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1980', '266', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1981', '266', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1982', '267', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1983', '267', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1984', '267', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1985', '268', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1986', '268', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1987', '268', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1988', '269', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1989', '269', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1990', '269', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1991', '270', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1992', '270', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1993', '270', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1994', '271', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1995', '271', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1996', '271', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1997', '272', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1998', '272', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('1999', '272', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2000', '273', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2001', '273', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2002', '273', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2003', '274', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2004', '274', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2005', '274', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2006', '275', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2007', '275', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2008', '275', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2009', '276', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2010', '276', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2011', '276', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2012', '277', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2013', '277', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2014', '277', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2015', '278', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2016', '278', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2017', '278', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2018', '279', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2019', '279', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2020', '279', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2021', '280', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2022', '280', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2023', '280', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2024', '281', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2025', '281', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2026', '281', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2027', '282', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2028', '282', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2029', '282', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2030', '283', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2031', '283', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2032', '283', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2033', '284', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2034', '284', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2035', '284', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2036', '285', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2037', '285', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2038', '285', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2039', '286', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2040', '286', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2041', '286', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2042', '287', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2043', '287', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2044', '287', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2045', '288', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2046', '288', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2047', '288', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2048', '289', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2049', '289', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2050', '289', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2051', '290', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2052', '290', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2053', '290', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2054', '291', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2055', '291', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2056', '291', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2057', '292', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2058', '292', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2059', '292', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2060', '293', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2061', '293', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2062', '293', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2063', '294', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2064', '294', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2065', '294', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2066', '295', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2067', '295', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2068', '295', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2069', '296', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2070', '296', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2071', '296', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2072', '297', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2073', '297', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2074', '297', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2075', '298', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2076', '298', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2077', '298', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2078', '299', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2079', '299', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2080', '299', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2081', '300', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2082', '300', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2083', '300', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2084', '301', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2085', '301', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2086', '301', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2087', '302', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2088', '302', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2089', '302', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2090', '303', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2091', '303', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2092', '303', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2093', '304', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2094', '304', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2095', '304', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2096', '305', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2097', '305', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2098', '305', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2099', '306', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2100', '306', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2101', '306', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2102', '307', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2103', '307', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2104', '307', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2105', '308', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2106', '308', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2107', '308', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2108', '309', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2109', '309', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2110', '309', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2111', '310', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2112', '310', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2113', '310', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2114', '311', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2115', '311', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2116', '311', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2117', '312', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2118', '312', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2119', '312', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2120', '313', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2121', '313', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2122', '313', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2123', '314', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2124', '314', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2125', '314', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2126', '315', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2127', '315', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2128', '315', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2129', '316', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2130', '316', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2131', '316', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2132', '317', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2133', '317', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2134', '317', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2135', '318', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2136', '318', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2137', '318', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2138', '319', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2139', '319', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2140', '319', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2141', '320', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2142', '320', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2143', '320', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2144', '321', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2145', '321', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2146', '321', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2147', '322', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2148', '322', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2149', '322', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2150', '323', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2151', '323', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2152', '323', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2153', '324', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2154', '324', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2155', '324', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2156', '325', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2157', '325', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2158', '325', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2159', '326', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2160', '326', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2161', '326', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2162', '327', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2163', '327', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2164', '327', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2165', '328', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2166', '328', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2167', '328', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2168', '329', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2169', '329', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2170', '329', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2171', '330', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2172', '330', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2173', '330', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2174', '331', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2175', '331', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2176', '331', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2177', '332', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2178', '332', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2179', '332', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2180', '333', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2181', '333', '5', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2182', '333', '12', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2183', '334', '3', '10000', '10000');
INSERT INTO `keu_saldorekening` VALUES ('2184', '334', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2185', '334', '12', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2186', '335', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2187', '335', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2188', '335', '12', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2189', '336', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2190', '336', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2191', '336', '12', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2192', '337', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2193', '337', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2194', '337', '12', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2195', '343', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2196', '343', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2197', '343', '12', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2198', '344', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2199', '344', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2200', '344', '12', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2201', '345', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2202', '345', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2203', '345', '12', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2204', '346', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2205', '346', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('2206', '346', '12', '0', '0');

-- ----------------------------
-- Table structure for keu_saldorekening_copy
-- ----------------------------
DROP TABLE IF EXISTS `keu_saldorekening_copy`;
CREATE TABLE `keu_saldorekening_copy` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilrekening` int(11) NOT NULL,
  `tahunajaran` int(11) NOT NULL,
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  `nominal2` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  KEY `detilrekening` (`detilrekening`) USING BTREE,
  CONSTRAINT `keu_saldorekening_copy_ibfk_1` FOREIGN KEY (`detilrekening`) REFERENCES `keu_detilrekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `keu_saldorekening_copy_ibfk_2` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1175 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_saldorekening_copy
-- ----------------------------
INSERT INTO `keu_saldorekening_copy` VALUES ('1173', '351', '3', '0', '0');
INSERT INTO `keu_saldorekening_copy` VALUES ('1174', '351', '5', '0', '0');

-- ----------------------------
-- Table structure for keu_subjenisreport
-- ----------------------------
DROP TABLE IF EXISTS `keu_subjenisreport`;
CREATE TABLE `keu_subjenisreport` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenisreport` int(11) NOT NULL,
  `kategorirekening` int(11) NOT NULL,
  `posisi` enum('l','r') DEFAULT 'l',
  PRIMARY KEY (`replid`),
  KEY `jenisreport` (`jenisreport`) USING BTREE,
  KEY `kategorirekening` (`kategorirekening`) USING BTREE,
  CONSTRAINT `jenisreportFK` FOREIGN KEY (`jenisreport`) REFERENCES `keu_jenisreport` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kategorirekeningFK8` FOREIGN KEY (`kategorirekening`) REFERENCES `keu_kategorirekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_subjenisreport
-- ----------------------------
INSERT INTO `keu_subjenisreport` VALUES ('1', '1', '1', 'l');
INSERT INTO `keu_subjenisreport` VALUES ('2', '1', '2', 'l');
INSERT INTO `keu_subjenisreport` VALUES ('3', '1', '3', 'l');
INSERT INTO `keu_subjenisreport` VALUES ('4', '1', '4', 'r');
INSERT INTO `keu_subjenisreport` VALUES ('7', '1', '5', 'r');
INSERT INTO `keu_subjenisreport` VALUES ('8', '2', '6', 'l');
INSERT INTO `keu_subjenisreport` VALUES ('13', '2', '7', 'r');

-- ----------------------------
-- Table structure for keu_subpemutihanpenerimaansiswa
-- ----------------------------
DROP TABLE IF EXISTS `keu_subpemutihanpenerimaansiswa`;
CREATE TABLE `keu_subpemutihanpenerimaansiswa` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `pemutihanpenerimaansiswa` int(11) NOT NULL,
  `siswabiaya` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `pemutihanpenerimaansiswa` (`pemutihanpenerimaansiswa`) USING BTREE,
  KEY `siswabiaya` (`siswabiaya`) USING BTREE,
  CONSTRAINT `pemutihanpenerimaansiswaFK` FOREIGN KEY (`pemutihanpenerimaansiswa`) REFERENCES `keu_pemutihanpenerimaansiswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `siswabiayaFK3` FOREIGN KEY (`siswabiaya`) REFERENCES `psb_siswabiaya` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_subpemutihanpenerimaansiswa
-- ----------------------------

-- ----------------------------
-- Table structure for keu_tahunbuku
-- ----------------------------
DROP TABLE IF EXISTS `keu_tahunbuku`;
CREATE TABLE `keu_tahunbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `kode` varchar(20) NOT NULL,
  `saldoawal` decimal(10,0) NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_tahunbuku
-- ----------------------------
INSERT INTO `keu_tahunbuku` VALUES ('1', '2014', '2015-01-01', '0000-00-00', '', '649100', '1', 'Kas Satelit');
INSERT INTO `keu_tahunbuku` VALUES ('5', '2015', '2014-10-23', '0000-00-00', '', '0', '0', 'tes');

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
  PRIMARY KEY (`replid`),
  KEY `detjenistransaksi` (`detjenistransaksi`) USING BTREE,
  CONSTRAINT `detjenistransaksiFK` FOREIGN KEY (`detjenistransaksi`) REFERENCES `keu_detjenistransaksi` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_transaksi
-- ----------------------------
INSERT INTO `keu_transaksi` VALUES ('138', '1', '', '2015-11-02', 'Penerimaan dari donatur', '0', '3', '0', null);
INSERT INTO `keu_transaksi` VALUES ('139', '2', '', '2015-11-05', 'bayar PDAM', '34', '6', '0', null);
INSERT INTO `keu_transaksi` VALUES ('140', '3', '', '2015-11-19', 'Pembayaran Formulir siswa <br> Nama : jacklyn anastasha<br> Kelas :Toddler - 1A', '0', '1', '5', null);
INSERT INTO `keu_transaksi` VALUES ('141', '4', '', '2015-11-19', 'komputer', '37', '6', '0', 'sar');
INSERT INTO `keu_transaksi` VALUES ('142', '7', '', '2015-11-19', 'bayar gaji pegawai', '0', '7', '0', null);
INSERT INTO `keu_transaksi` VALUES ('143', '6', '', '2015-11-19', 'sumbangan xxx', '0', '7', '0', null);

-- ----------------------------
-- Table structure for keu_viabayar
-- ----------------------------
DROP TABLE IF EXISTS `keu_viabayar`;
CREATE TABLE `keu_viabayar` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `viabayar` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_viabayar
-- ----------------------------
INSERT INTO `keu_viabayar` VALUES ('1', 'Kartu Kredit', 'pembayaran via kartu kredit, misal : paypal, CC bank ABC, dll');
INSERT INTO `keu_viabayar` VALUES ('2', 'Kartu Debit ', 'pembayaran melalui debt card . misal : ATM/debt card BCA, dll');
INSERT INTO `keu_viabayar` VALUES ('3', 'Transfer Bank', 'pembayaran via tranfer antar sejenis/beda bank');
INSERT INTO `keu_viabayar` VALUES ('5', 'Uang Tunai', 'bayar uang dengan uang cash');


