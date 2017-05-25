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
-- Database: `gta5_gamemode_freeroam` (mtn gta5_gamemode_essential)
--
CREATE DATABASE IF NOT EXISTS `gta5_gamemode_essential` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gta5_gamemode_essential`;

-- --------------------------------------------------------

--
-- Table structure for table `businesses`


-- --------------------------------------------------------

--
-- Table structure for table `crews`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `businesses`
--

--
-- Indexes for table `personalvehicles`
--
ALTER TABLE `personalvehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `robbables`
--

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `businesses`
--

-- AUTO_INCREMENT for table `personalvehicles`
--
ALTER TABLE `personalvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `robbables`

