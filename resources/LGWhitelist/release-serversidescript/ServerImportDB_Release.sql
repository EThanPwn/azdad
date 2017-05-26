-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.54 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5167
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for c2cjlogin
DROP DATABASE IF EXISTS `c2cjlogin`;
CREATE DATABASE IF NOT EXISTS `c2cjlogin` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `c2cjlogin`;

-- Dumping structure for table c2cjlogin.admins
DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `ip` varchar(255) DEFAULT NULL,
  `steamid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table c2cjlogin.adminsnew
DROP TABLE IF EXISTS `adminsnew`;
CREATE TABLE IF NOT EXISTS `adminsnew` (
  `ip` varchar(255) DEFAULT NULL,
  `steamid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table c2cjlogin.banned
DROP TABLE IF EXISTS `banned`;
CREATE TABLE IF NOT EXISTS `banned` (
  `ip` text NOT NULL,
  `steamid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table c2cjlogin.bannedgtan
DROP TABLE IF EXISTS `bannedgtan`;
CREATE TABLE IF NOT EXISTS `bannedgtan` (
  `ip` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table c2cjlogin.cops
DROP TABLE IF EXISTS `cops`;
CREATE TABLE IF NOT EXISTS `cops` (
  `ip` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table c2cjlogin.copsmdt
DROP TABLE IF EXISTS `copsmdt`;
CREATE TABLE IF NOT EXISTS `copsmdt` (
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table c2cjlogin.criminaldb
DROP TABLE IF EXISTS `criminaldb`;
CREATE TABLE IF NOT EXISTS `criminaldb` (
  `randomid` int(11) DEFAULT NULL,
  `playername` varchar(255) DEFAULT NULL,
  `prioroffenses` varchar(255) DEFAULT NULL,
  `wanted` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table c2cjlogin.whitelist
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE IF NOT EXISTS `whitelist` (
  `ip` varchar(50) DEFAULT NULL,
  `steamid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table c2cjlogin.whitelistgtan
DROP TABLE IF EXISTS `whitelistgtan`;
CREATE TABLE IF NOT EXISTS `whitelistgtan` (
  `ip` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `steamid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
