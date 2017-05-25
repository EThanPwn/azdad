-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2017 at 04:51 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gta5_gamemode_freeroam`
--
CREATE DATABASE IF NOT EXISTS `gta5_gamemode_freeroam` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gta5_gamemode_freeroam`;

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses` (
  `id` int(11) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '0',
  `owner` varchar(255) NOT NULL DEFAULT '0',
  `price` int(255) NOT NULL DEFAULT '0',
  `income` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crews`
--

CREATE TABLE `crews` (
  `owner` varchar(255) CHARACTER SET utf8 NOT NULL,
  `members` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `invitations` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `flags` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `level` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `personalvehicles`
--

CREATE TABLE `personalvehicles` (
  `id` int(11) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `vehicle` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `colorp` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `colors` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `auto_upgrade` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `robbables`
--

CREATE TABLE `robbables` (
  `id` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `jackpot` int(200) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `banned` int(255) DEFAULT NULL,
  `admin` int(255) DEFAULT NULL,
  `money` int(255) DEFAULT NULL,
  `kills` int(255) DEFAULT '0',
  `deaths` int(255) DEFAULT '0',
  `personalvehicle` varchar(50) DEFAULT '',
  `pv_price` int(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personalvehicles`
--
ALTER TABLE `personalvehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `robbables`
--
ALTER TABLE `robbables`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `businesses`
--
ALTER TABLE `businesses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `personalvehicles`
--
ALTER TABLE `personalvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `robbables`
--
ALTER TABLE `robbables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
