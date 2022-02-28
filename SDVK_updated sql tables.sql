-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 28, 2022 at 11:17 AM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SDVK`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdl_proficiency_level`
--

CREATE TABLE `mdl_proficiency_level` (
  `id` int NOT NULL,
  `proficiency_level` varchar(64) NOT NULL,
  `minimum_range` int DEFAULT NULL,
  `maximum_range` int DEFAULT NULL,
  `createdby` bigint DEFAULT NULL,
  `modifiedby` bigint DEFAULT NULL,
  `createddate` bigint DEFAULT NULL,
  `modifieddate` bigint DEFAULT NULL,
  `modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_usergoal`
--

CREATE TABLE `mdl_usergoal` (
  `id` int NOT NULL,
  `userid` int NOT NULL,
  `no_of_course` int NOT NULL,
  `day_hours` int NOT NULL,
  `week_hours` int NOT NULL,
  `createdby` int DEFAULT NULL,
  `modifiedby` int DEFAULT NULL,
  `createddate` bigint DEFAULT NULL,
  `modifieddate` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_usergoalnotification`
--

CREATE TABLE `mdl_usergoalnotification` (
  `id` bigint NOT NULL,
  `userid` int DEFAULT NULL,
  `notification_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `senddate` bigint DEFAULT NULL,
  `sendtime` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_proficiency_level`
--

CREATE TABLE `mdl_user_proficiency_level` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `type` varchar(50) NOT NULL,
  `skill_id` int NOT NULL,
  `proficiency_id` int DEFAULT NULL,
  `point` float NOT NULL DEFAULT '0',
  `createddate` bigint DEFAULT NULL,
  `modifieddate` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mdl_proficiency_level`
--
ALTER TABLE `mdl_proficiency_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_usergoal`
--
ALTER TABLE `mdl_usergoal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_usergoalnotification`
--
ALTER TABLE `mdl_usergoalnotification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_user_proficiency_level`
--
ALTER TABLE `mdl_user_proficiency_level`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mdl_proficiency_level`
--
ALTER TABLE `mdl_proficiency_level`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_usergoal`
--
ALTER TABLE `mdl_usergoal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_usergoalnotification`
--
ALTER TABLE `mdl_usergoalnotification`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_user_proficiency_level`
--
ALTER TABLE `mdl_user_proficiency_level`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
