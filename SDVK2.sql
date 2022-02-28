-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2021 at 05:51 PM
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
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

CREATE TABLE `mdl_mnetservice_enrol_courses` (
  `id` bigint NOT NULL,
  `hostid` bigint NOT NULL,
  `remoteid` bigint NOT NULL,
  `categoryid` bigint NOT NULL,
  `categoryname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `sortorder` bigint NOT NULL DEFAULT '0',
  `fullname` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `summaryformat` smallint DEFAULT '0',
  `startdate` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  `rolename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Caches the information fetched via XML-RPC about courses on ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE `mdl_mnetservice_enrol_enrolments` (
  `id` bigint NOT NULL,
  `hostid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `remotecourseid` bigint NOT NULL,
  `rolename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `enroltime` bigint NOT NULL DEFAULT '0',
  `enroltype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Caches the information about enrolments of our local users i' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

CREATE TABLE `mdl_mnet_host` (
  `id` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `public_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `public_key_expires` bigint NOT NULL DEFAULT '0',
  `transport` tinyint NOT NULL DEFAULT '0',
  `portno` mediumint NOT NULL DEFAULT '0',
  `last_connect_time` bigint NOT NULL DEFAULT '0',
  `last_log_id` bigint NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `applicationid` bigint NOT NULL DEFAULT '1',
  `sslverification` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Information about the local and remote hosts for RPC' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`, `sslverification`) VALUES
(1, 0, 'http://localhost/WDR', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

CREATE TABLE `mdl_mnet_host2service` (
  `id` bigint NOT NULL,
  `hostid` bigint NOT NULL DEFAULT '0',
  `serviceid` bigint NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Information about the services for a given host' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

CREATE TABLE `mdl_mnet_log` (
  `id` bigint NOT NULL,
  `hostid` bigint NOT NULL DEFAULT '0',
  `remoteid` bigint NOT NULL DEFAULT '0',
  `time` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `course` bigint NOT NULL DEFAULT '0',
  `coursename` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `cmid` bigint NOT NULL DEFAULT '0',
  `action` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Store session data from users migrating to other sites' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

CREATE TABLE `mdl_mnet_remote_rpc` (
  `id` bigint NOT NULL,
  `functionname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table describes functions that might be called remotely' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

CREATE TABLE `mdl_mnet_remote_service2rpc` (
  `id` bigint NOT NULL,
  `serviceid` bigint NOT NULL DEFAULT '0',
  `rpcid` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Group functions or methods under a service' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

CREATE TABLE `mdl_mnet_rpc` (
  `id` bigint NOT NULL,
  `functionname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `profile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `classname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Functions or methods that we may publish or subscribe to' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:37:\"The unique ID provided by remotehost.\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"User Agent string.\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:44:\"$userdata Array of user info for remote host\";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:35:\"SHA1 hash of user agent to look for\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"A plaintext report of what has happened\";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user\'s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\nf1          - the content of the default 100x100px image\nf1_mimetype - the mimetype of the f1 file\nf2          - the content of the 35x35px variant of the image\nf2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:18:\"The id of the user\";}}s:6:\"return\";a:2:{s:4:\"type\";s:11:\"false|array\";s:11:\"description\";s:84:\"false if user not found, empty array if no picture exists, array with data otherwise\";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:14:\"The theme info\";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:12:\"The username\";}i:1;a:3:{s:4:\"name\";s:7:\"courses\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:75:\"Assoc array of courses following the structure of mnetservice_enrol_courses\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:0:\"\";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:35:\"SHA1 hash of user agent to look for\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:15:\"True on success\";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for \'All hosts\', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:11:\"empty array\";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"userdata\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:43:\"user details {@see mnet_fields_to_import()}\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"our local course id\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:69:\"true if the enrolment has been successful, throws exception otherwise\";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can\'t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"of the remote user\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"of our local course\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:71:\"true if the unenrolment has been successful, throws exception otherwise\";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:16:\"ID of our course\";}i:1;a:3:{s:4:\"name\";s:5:\"roles\";s:4:\"type\";s:12:\"string|array\";s:11:\"description\";s:58:\"comma separated list of role shortnames (or array of them)\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:56:\"the token recieved previously during send_content_intent\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

CREATE TABLE `mdl_mnet_service` (
  `id` bigint NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `description` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A service is a group of functions' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

CREATE TABLE `mdl_mnet_service2rpc` (
  `id` bigint NOT NULL,
  `serviceid` bigint NOT NULL DEFAULT '0',
  `rpcid` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Group functions or methods under a service' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

CREATE TABLE `mdl_mnet_session` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `mnethostid` bigint NOT NULL DEFAULT '0',
  `useragent` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint NOT NULL DEFAULT '0',
  `session_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `expires` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Store session data from users migrating to other sites' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

CREATE TABLE `mdl_mnet_sso_access_control` (
  `id` bigint NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'allow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Users by host permitted (or not) to login from a remote prov' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

CREATE TABLE `mdl_modules` (
  `id` bigint NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `cron` bigint NOT NULL DEFAULT '0',
  `lastcron` bigint NOT NULL DEFAULT '0',
  `search` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='modules available in the site' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 0, 0, '', 1),
(2, 'assignment', 60, 0, '', 0),
(3, 'book', 0, 0, '', 1),
(4, 'chat', 0, 0, '', 1),
(5, 'choice', 0, 0, '', 1),
(6, 'data', 0, 0, '', 1),
(7, 'feedback', 0, 0, '', 1),
(8, 'folder', 0, 0, '', 1),
(9, 'forum', 0, 0, '', 1),
(10, 'glossary', 0, 0, '', 1),
(11, 'h5pactivity', 0, 0, '', 1),
(12, 'imscp', 0, 0, '', 1),
(13, 'label', 0, 0, '', 1),
(14, 'lesson', 0, 0, '', 1),
(15, 'lti', 0, 0, '', 1),
(16, 'page', 0, 0, '', 1),
(17, 'quiz', 0, 0, '', 1),
(18, 'resource', 0, 0, '', 1),
(19, 'scorm', 0, 0, '', 1),
(20, 'survey', 0, 0, '', 1),
(21, 'url', 0, 0, '', 1),
(22, 'wiki', 0, 0, '', 1),
(23, 'workshop', 0, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

CREATE TABLE `mdl_my_pages` (
  `id` bigint NOT NULL,
  `userid` bigint DEFAULT '0',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Extra user pages for the My Moodle system' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0),
(4, 3, '__default', 0, 0),
(6, 4, '__default', 0, 0),
(9, 9, '__default', 0, 0),
(10, 5, '__default', 0, 0),
(11, 10, '__default', 0, 0),
(12, 2, '__default', 0, 0),
(13, 11, '__default', 0, 0),
(17, 2, '__default', 1, 0),
(19, 14, '__default', 0, 0),
(20, 13, '__default', 1, 0),
(21, 3, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_notifications`
--

CREATE TABLE `mdl_notifications` (
  `id` bigint NOT NULL,
  `useridfrom` bigint NOT NULL,
  `useridto` bigint NOT NULL,
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `fullmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `fullmessageformat` tinyint(1) NOT NULL DEFAULT '0',
  `fullmessagehtml` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `smallmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `eventtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contexturl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `contexturlname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `timeread` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `customdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores all notifications' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_access_token`
--

CREATE TABLE `mdl_oauth2_access_token` (
  `id` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `issuerid` bigint NOT NULL,
  `token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expires` bigint NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores access tokens for system accounts in order to be able' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_endpoint`
--

CREATE TABLE `mdl_oauth2_endpoint` (
  `id` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `issuerid` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Describes the named endpoint for an oauth2 service.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_issuer`
--

CREATE TABLE `mdl_oauth2_issuer` (
  `id` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `baseurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `clientid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `clientsecret` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `loginscopes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `loginscopesoffline` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `loginparams` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `loginparamsoffline` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alloweddomains` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scopessupported` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `showonloginpage` tinyint NOT NULL DEFAULT '1',
  `basicauth` tinyint NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL,
  `requireconfirmation` tinyint NOT NULL DEFAULT '1',
  `servicetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `loginpagename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Details for an oauth 2 connect identity issuer.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_refresh_token`
--

CREATE TABLE `mdl_oauth2_refresh_token` (
  `id` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `issuerid` bigint NOT NULL,
  `token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scopehash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores refresh tokens which can be exchanged for access toke' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_system_account`
--

CREATE TABLE `mdl_oauth2_system_account` (
  `id` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `issuerid` bigint NOT NULL,
  `refreshtoken` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grantedscopes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `username` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stored details used to get an access token as a system user ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_user_field_mapping`
--

CREATE TABLE `mdl_oauth2_user_field_mapping` (
  `id` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `issuerid` bigint NOT NULL,
  `externalfield` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `internalfield` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Mapping of oauth user fields to moodle fields.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

CREATE TABLE `mdl_page` (
  `id` bigint NOT NULL,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `contentformat` smallint NOT NULL DEFAULT '0',
  `legacyfiles` smallint NOT NULL DEFAULT '0',
  `legacyfileslast` bigint DEFAULT NULL,
  `display` smallint NOT NULL DEFAULT '0',
  `displayoptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `revision` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Each record is one page and its config data' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_paygw_paypal`
--

CREATE TABLE `mdl_paygw_paypal` (
  `id` bigint NOT NULL,
  `paymentid` bigint NOT NULL,
  `pp_orderid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'The ID of the order in PayPal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores PayPal related information' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_payments`
--

CREATE TABLE `mdl_payments` (
  `id` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `paymentarea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `accountid` bigint NOT NULL,
  `gateway` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores information about payments' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_payment_accounts`
--

CREATE TABLE `mdl_payment_accounts` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contextid` bigint NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Payment accounts' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_payment_gateways`
--

CREATE TABLE `mdl_payment_gateways` (
  `id` bigint NOT NULL,
  `accountid` bigint NOT NULL,
  `gateway` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Configuration for one gateway for one payment account' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

CREATE TABLE `mdl_portfolio_instance` (
  `id` bigint NOT NULL,
  `plugin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='base table (not including config data) for instances of port' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

CREATE TABLE `mdl_portfolio_instance_config` (
  `id` bigint NOT NULL,
  `instance` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='config for portfolio plugin instances' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

CREATE TABLE `mdl_portfolio_instance_user` (
  `id` bigint NOT NULL,
  `instance` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='user data for portfolio instances.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

CREATE TABLE `mdl_portfolio_log` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `time` bigint NOT NULL,
  `portfolio` bigint NOT NULL,
  `caller_class` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `caller_component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `caller_sha1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `tempdataid` bigint NOT NULL DEFAULT '0',
  `returnurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='log of portfolio transfers (used to later check for duplicat' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

CREATE TABLE `mdl_portfolio_mahara_queue` (
  `id` bigint NOT NULL,
  `transferid` bigint NOT NULL,
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='maps mahara tokens to transfer ids' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

CREATE TABLE `mdl_portfolio_tempdata` (
  `id` bigint NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `expirytime` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `instance` bigint DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='stores temporary data for portfolio exports. the id of this ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

CREATE TABLE `mdl_post` (
  `id` bigint NOT NULL,
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL DEFAULT '0',
  `courseid` bigint NOT NULL DEFAULT '0',
  `groupid` bigint NOT NULL DEFAULT '0',
  `moduleid` bigint NOT NULL DEFAULT '0',
  `coursemoduleid` bigint NOT NULL DEFAULT '0',
  `subject` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `uniquehash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `rating` bigint NOT NULL DEFAULT '0',
  `format` bigint NOT NULL DEFAULT '0',
  `summaryformat` tinyint NOT NULL DEFAULT '0',
  `attachment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `publishstate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint NOT NULL DEFAULT '0',
  `created` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Generic post table to hold data blog entries etc in differen' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_proficiency_level`
--

CREATE TABLE `mdl_proficiency_level` (
  `id` int NOT NULL,
  `proficiency_level` varchar(64) NOT NULL,
  `modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mdl_proficiency_level`
--

INSERT INTO `mdl_proficiency_level` (`id`, `proficiency_level`, `modify`, `deleted`) VALUES
(1, 'None', '2021-11-26 10:29:11', '1'),
(2, 'Awareness', '2021-11-26 10:29:11', '1'),
(3, 'Knowledge', '2021-11-26 10:29:11', '1'),
(4, 'Skilled', '2021-11-26 10:29:11', '1'),
(5, 'Mastery', '2021-11-26 10:29:11', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

CREATE TABLE `mdl_profiling` (
  `id` bigint NOT NULL,
  `runid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `totalexecutiontime` bigint NOT NULL,
  `totalcputime` bigint NOT NULL,
  `totalcalls` bigint NOT NULL,
  `totalmemory` bigint NOT NULL,
  `runreference` tinyint NOT NULL DEFAULT '0',
  `runcomment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores the results of all the profiling runs' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext`
--

CREATE TABLE `mdl_qtype_ddimageortext` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Defines drag and drop (text or images onto a background imag' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext_drags`
--

CREATE TABLE `mdl_qtype_ddimageortext_drags` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `no` bigint NOT NULL DEFAULT '0',
  `draggroup` bigint NOT NULL DEFAULT '0',
  `infinite` smallint NOT NULL DEFAULT '0',
  `label` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Images to drag. Actual file names are not stored here we use' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext_drops`
--

CREATE TABLE `mdl_qtype_ddimageortext_drops` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `no` bigint NOT NULL DEFAULT '0',
  `xleft` bigint NOT NULL DEFAULT '0',
  `ytop` bigint NOT NULL DEFAULT '0',
  `choice` bigint NOT NULL DEFAULT '0',
  `label` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Drop boxes' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker`
--

CREATE TABLE `mdl_qtype_ddmarker` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0',
  `showmisplaced` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Defines drag and drop (text or images onto a background imag' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker_drags`
--

CREATE TABLE `mdl_qtype_ddmarker_drags` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `no` bigint NOT NULL DEFAULT '0',
  `label` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `infinite` smallint NOT NULL DEFAULT '0',
  `noofdrags` bigint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Labels for markers to drag.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker_drops`
--

CREATE TABLE `mdl_qtype_ddmarker_drops` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `no` bigint NOT NULL DEFAULT '0',
  `shape` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `choice` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='drop regions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

CREATE TABLE `mdl_qtype_essay_options` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL,
  `responseformat` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'editor',
  `responserequired` tinyint NOT NULL DEFAULT '1',
  `responsefieldlines` smallint NOT NULL DEFAULT '15',
  `minwordlimit` bigint DEFAULT NULL,
  `maxwordlimit` bigint DEFAULT NULL,
  `attachments` smallint NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint NOT NULL DEFAULT '0',
  `graderinfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `graderinfoformat` smallint NOT NULL DEFAULT '0',
  `responsetemplate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `responsetemplateformat` smallint NOT NULL DEFAULT '0',
  `maxbytes` bigint NOT NULL DEFAULT '0',
  `filetypeslist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Extra options for essay questions.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_options`
--

CREATE TABLE `mdl_qtype_match_options` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Defines the question-type specific options for matching ques' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

CREATE TABLE `mdl_qtype_match_subquestions` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `questiontext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `questiontextformat` tinyint NOT NULL DEFAULT '0',
  `answertext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The subquestions that make up a matching question' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

CREATE TABLE `mdl_qtype_multichoice_options` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `layout` smallint NOT NULL DEFAULT '0',
  `single` smallint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0',
  `showstandardinstruction` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Options for multiple choice questions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_randomsamatch_options`
--

CREATE TABLE `mdl_qtype_randomsamatch_options` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `choose` bigint NOT NULL DEFAULT '4',
  `subcats` tinyint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Info about a random short-answer matching question' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

CREATE TABLE `mdl_qtype_shortanswer_options` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `usecase` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Options for short answer questions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question`
--

CREATE TABLE `mdl_question` (
  `id` bigint NOT NULL,
  `category` bigint NOT NULL DEFAULT '0',
  `parent` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `questiontext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `questiontextformat` tinyint NOT NULL DEFAULT '0',
  `generalfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `generalfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `length` bigint NOT NULL DEFAULT '1',
  `stamp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `createdby` bigint DEFAULT NULL,
  `modifiedby` bigint DEFAULT NULL,
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The questions themselves' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_question`
--

INSERT INTO `mdl_question` (`id`, `category`, `parent`, `name`, `questiontext`, `questiontextformat`, `generalfeedback`, `generalfeedbackformat`, `defaultmark`, `penalty`, `qtype`, `length`, `stamp`, `version`, `hidden`, `timecreated`, `timemodified`, `createdby`, `modifiedby`, `idnumber`) VALUES
(1, 4, 0, 'Do you know to motivate your student in different ways', '<p dir=\"ltr\" style=\"text-align: left;\">Do you know to motivate your student in different ways<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105055106+0S85wD', '175.111.182.35+211105055118+DJiNK2', 0, 1636091466, 1636091478, 2, 2, NULL),
(2, 4, 0, 'Do you take feedback well?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you take feedback well?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105055216+mgl8UO', '175.111.182.35+211105055216+oDgwDP', 0, 1636091536, 1636091536, 2, 2, NULL),
(3, 4, 0, 'Do you give feedback to your studens often?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you take feedback well<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105055351+F9cEH2', '175.111.182.35+211105055351+UNsDXc', 0, 1636091631, 1636091631, 2, 2, NULL),
(4, 4, 0, 'Do you hold yourself and other  accountable?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you hold yourself and other accountable?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105055536+xIu2Ax', '175.111.182.35+211105055536+qWUHnV', 0, 1636091736, 1636091736, 2, 2, NULL),
(5, 4, 0, 'Do you have a good decision making process?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you have a good decision making process?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105055711+bmdh8l', '175.111.182.35+211105055711+a51TyC', 0, 1636091831, 1636091831, 2, 2, NULL),
(6, 4, 0, 'Do you process strong communication skills?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you process strong communication skills<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105055816+9ZSKWh', '175.111.182.35+211105055816+RkkYH8', 0, 1636091896, 1636091896, 2, 2, NULL),
(7, 4, 0, 'Sun is shine', '<p dir=\"ltr\" style=\"text-align: left;\">Sun is shine<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105061021+L3z90j', '175.111.182.35+211105061021+QDQmD9', 0, 1636092621, 1636092621, 2, 2, NULL),
(8, 4, 0, 'Rose is red', '<p dir=\"ltr\" style=\"text-align: left;\">Rose is red<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105061101+2an6R5', '175.111.182.35+211105061101+DfpWag', 0, 1636092661, 1636092661, 2, 2, NULL),
(9, 4, 0, 'Sky is blue', '<p dir=\"ltr\" style=\"text-align: left;\">Sky is blue<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105061152+ZxLnDU', '175.111.182.35+211105061152+w4iGcV', 0, 1636092712, 1636092712, 2, 2, NULL),
(10, 4, 0, 'Amerika is callded also US?', '<p dir=\"ltr\" style=\"text-align: left;\">Amerika is callded also US?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105061258+l8XVjI', '175.111.182.35+211105061258+7nli8L', 0, 1636092778, 1636092778, 2, 2, NULL),
(11, 4, 0, 'sunflower is red?', '<p dir=\"ltr\" style=\"text-align: left;\">sunflower is red?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105061341+dbYFV7', '175.111.182.35+211105061341+jWJwgy', 0, 1636092821, 1636092821, 2, 2, NULL),
(12, 14, 0, 'Do you know to motivate your student in different ways?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you know to motivate your student in different ways<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105104943+eIGOG0', '175.111.182.35+211105104943+37mxrU', 0, 1636109383, 1636109383, 2, 2, NULL),
(13, 14, 0, 'Do you take feedback well?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you take feedback well?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105105016+dFPXHX', '175.111.182.35+211105105016+4cTziv', 0, 1636109416, 1636109416, 2, 2, NULL),
(14, 14, 0, 'Do you hold yourself and other accountable?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you hold yourself and other accountable?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105105119+OpdbKf', '175.111.182.35+211105105119+26BxH4', 0, 1636109479, 1636109479, 2, 2, NULL),
(15, 14, 0, 'Do you have a good decision making process?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you have a good decision making process?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105105313+Clp8Gc', '175.111.182.35+211105105313+Fxu9Iu', 0, 1636109593, 1636109593, 2, 2, NULL),
(16, 14, 0, 'Do you process strong communication skills?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you process strong communication skills?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105105350+XiFOb3', '175.111.182.35+211105105350+xMDoT0', 0, 1636109630, 1636109630, 2, 2, NULL),
(17, 14, 0, 'Do you give feedback to your students often', '<p dir=\"ltr\" style=\"text-align: left;\">Do you give feedback to your students often<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105110030+zbdWLK', '175.111.182.35+211105110030+QPzkHK', 0, 1636110030, 1636110030, 2, 2, NULL),
(18, 14, 0, 'Do you know to motivate your student in different ways', '<p dir=\"ltr\" style=\"text-align: left;\">Do you know to motivate your student in different ways<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105111639+713PBx', '175.111.182.35+211105111639+DJugI9', 0, 1636110999, 1636110999, 2, 2, NULL),
(19, 14, 0, 'Do you take feedback well?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you take feedback well?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105111715+yWbCTQ', '175.111.182.35+211105111715+pYyz63', 0, 1636111035, 1636111035, 2, 2, NULL),
(20, 14, 0, 'Do you hold yourself and other accountable?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you hold yourself and other accountable?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105111925+4tAFew', '175.111.182.35+211105111925+YCiPlr', 0, 1636111165, 1636111165, 2, 2, NULL),
(21, 14, 0, 'Do you have a good decision making process?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you have a good decision making process?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105112001+zP7IA6', '175.111.182.35+211105112001+3zoNv3', 0, 1636111201, 1636111201, 2, 2, NULL),
(22, 14, 0, 'Do you process strong communication skills?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you process strong communication skills?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105112042+1bJxgI', '175.111.182.35+211105112042+YCkMi4', 0, 1636111242, 1636111242, 2, 2, NULL),
(23, 14, 0, 'Do you give feedback to your students often', '<p dir=\"ltr\" style=\"text-align: left;\">Do you give feedback to your students often<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105112129+mQYn73', '175.111.182.35+211105112129+Yw8Lzq', 0, 1636111289, 1636111289, 2, 2, NULL),
(24, 14, 0, 'Do you know to motivate your student in different ways', '<p dir=\"ltr\" style=\"text-align: left;\">Do you know to motivate your student in different ways<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105112932+a7L3gm', '175.111.182.35+211105112932+ZK579A', 0, 1636111772, 1636111772, 2, 2, NULL),
(25, 14, 0, 'Do you take feedback well?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you take feedback well?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105113020+cQctea', '175.111.182.35+211105113020+DBmtqq', 0, 1636111820, 1636111820, 2, 2, NULL),
(26, 14, 0, 'Do you hold yourself and other accountable?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you hold yourself and other accountable?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105113055+faCad1', '175.111.182.35+211105113055+Ih3bLW', 0, 1636111855, 1636111855, 2, 2, NULL),
(27, 14, 0, 'Do you have a good decision making process?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you have a good decision making process?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105113125+scL5DB', '175.111.182.35+211105113125+RhIgYE', 0, 1636111885, 1636111885, 2, 2, NULL),
(28, 14, 0, 'Do you process strong communication skills?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you process strong communication skills?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105113201+HIwj7k', '175.111.182.35+211105113201+nUO7L9', 0, 1636111921, 1636111921, 2, 2, NULL),
(29, 14, 0, 'Do you give feedback to your students often', '<p dir=\"ltr\" style=\"text-align: left;\">Do you give feedback to your students often<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105113311+WRH8Mt', '175.111.182.35+211105113311+cDHitJ', 0, 1636111991, 1636111991, 2, 2, NULL),
(30, 14, 0, 'Do you know to motivate your student in different ways', '<p dir=\"ltr\" style=\"text-align: left;\">Do you know to motivate your student in different ways<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105113759+jpz9Lu', '175.111.182.35+211105113759+31mocL', 0, 1636112279, 1636112279, 2, 2, NULL),
(31, 14, 0, 'Do you take feedback well?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you take feedback well?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105113836+xo02ZX', '175.111.182.35+211105113836+ZbTFRs', 0, 1636112316, 1636112316, 2, 2, NULL),
(32, 14, 0, 'Do you hold yourself and other accountable?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you hold yourself and other accountable?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105113915+gd5YoX', '175.111.182.35+211105113915+WRLD4B', 0, 1636112355, 1636112355, 2, 2, NULL),
(33, 14, 0, 'Do you have a good decision making process?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you have a good decision making process?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105114013+anrYRz', '175.111.182.35+211105114013+GVP2UB', 0, 1636112413, 1636112413, 2, 2, NULL),
(34, 14, 0, 'Do you process strong communication skills?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you process strong communication skills?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105114109+v1BYAh', '175.111.182.35+211105114109+1t0ecj', 0, 1636112469, 1636112469, 2, 2, NULL),
(35, 14, 0, 'Do you know to motivate your student in different ways', '<p dir=\"ltr\" style=\"text-align: left;\">Do you know to motivate your student in different ways<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105114333+ggRt9V', '175.111.182.35+211105114333+EzBF9V', 0, 1636112613, 1636112613, 2, 2, NULL),
(36, 14, 0, 'Do you take feedback well?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you take feedback well?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105114415+xpEOJz', '175.111.182.35+211105114415+qGYz0N', 0, 1636112655, 1636112655, 2, 2, NULL),
(37, 14, 0, 'Do you hold yourself and other accountable?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you hold yourself and other accountable?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105114526+v4cnik', '175.111.182.35+211105114559+3O1Aii', 0, 1636112726, 1636112759, 2, 2, NULL),
(38, 14, 0, 'Do you have a good decision making process?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you have a good decision making process?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105114645+e4kcsA', '175.111.182.35+211105114645+c2HHGO', 0, 1636112805, 1636112805, 2, 2, NULL),
(39, 14, 0, 'Do you process strong communication skills?', '<p dir=\"ltr\" style=\"text-align: left;\">Do you process strong communication skills?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105114731+dJOwOW', '175.111.182.35+211105114731+TZKsdz', 0, 1636112851, 1636112851, 2, 2, NULL),
(40, 14, 0, 'Do you give feedback to your students often', '<p dir=\"ltr\" style=\"text-align: left;\">Do you give feedback to your students often<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105114815+elEBX5', '175.111.182.35+211105114815+v6BdhI', 0, 1636112895, 1636112895, 2, 2, NULL),
(41, 14, 0, 'css?', '<p dir=\"ltr\" style=\"text-align: left;\">css?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105115219+5sxaCp', '175.111.182.35+211105115219+RAYk2i', 0, 1636113139, 1636113139, 2, 2, NULL),
(42, 14, 0, 'html?', '<p dir=\"ltr\" style=\"text-align: left;\">html?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105115245+6zTXpV', '175.111.182.35+211105115245+bfEPIa', 0, 1636113165, 1636113165, 2, 2, NULL),
(43, 14, 0, 'javascript?', '<p dir=\"ltr\" style=\"text-align: left;\">javascript?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211105115316+KV1hq3', '175.111.182.35+211105115316+Og5Chb', 0, 1636113196, 1636113196, 2, 2, NULL),
(44, 14, 0, 'abcd?', '<p dir=\"ltr\" style=\"text-align: left;\">abcd?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211108082529+pXBINy', '175.111.182.35+211108082530+QouI0m', 0, 1636359929, 1636359929, 2, 2, NULL),
(45, 14, 0, 'xyz', '<p dir=\"ltr\" style=\"text-align: left;\">xyz<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211108082605+ACtc3e', '175.111.182.35+211108082605+0xI3sJ', 0, 1636359965, 1636359965, 2, 2, NULL),
(46, 14, 0, 'php is pre-proccessor?', '<p dir=\"ltr\" style=\"text-align: left;\">php is pre-proccessor?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211108103500+BQd4yS', '175.111.182.35+211108103500+nOXKB0', 0, 1636367700, 1636367700, 2, 2, NULL),
(47, 14, 0, 'php is technology?', '<p dir=\"ltr\" style=\"text-align: left;\">php is technology?<br></p>', 1, '', 1, '1.0000000', '1.0000000', 'truefalse', 1, '175.111.182.35+211108103530+ebJg6T', '175.111.182.35+211108103530+SfGJT7', 0, 1636367730, 1636367730, 2, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_answers`
--

CREATE TABLE `mdl_question_answers` (
  `id` bigint NOT NULL,
  `question` bigint NOT NULL DEFAULT '0',
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answerformat` tinyint NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `feedbackformat` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Answers, with a fractional grade (0-1) and feedback' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_question_answers`
--

INSERT INTO `mdl_question_answers` (`id`, `question`, `answer`, `answerformat`, `fraction`, `feedback`, `feedbackformat`) VALUES
(1, 1, 'True', 0, '0.0000000', '', 1),
(2, 1, 'False', 0, '1.0000000', '', 1),
(3, 2, 'True', 0, '1.0000000', '', 1),
(4, 2, 'False', 0, '0.0000000', '', 1),
(5, 3, 'True', 0, '0.0000000', '', 1),
(6, 3, 'False', 0, '1.0000000', '', 1),
(7, 4, 'True', 0, '1.0000000', '', 1),
(8, 4, 'False', 0, '0.0000000', '', 1),
(9, 5, 'True', 0, '0.0000000', '', 1),
(10, 5, 'False', 0, '1.0000000', '', 1),
(11, 6, 'True', 0, '1.0000000', '', 1),
(12, 6, 'False', 0, '0.0000000', '', 1),
(13, 7, 'True', 0, '1.0000000', '', 1),
(14, 7, 'False', 0, '0.0000000', '', 1),
(15, 8, 'True', 0, '0.0000000', '', 1),
(16, 8, 'False', 0, '1.0000000', '', 1),
(17, 9, 'True', 0, '1.0000000', '', 1),
(18, 9, 'False', 0, '0.0000000', '', 1),
(19, 10, 'True', 0, '0.0000000', '', 1),
(20, 10, 'False', 0, '1.0000000', '', 1),
(21, 11, 'True', 0, '0.0000000', '', 1),
(22, 11, 'False', 0, '1.0000000', '', 1),
(23, 12, 'True', 0, '0.0000000', '', 1),
(24, 12, 'False', 0, '1.0000000', '', 1),
(25, 13, 'True', 0, '1.0000000', '', 1),
(26, 13, 'False', 0, '0.0000000', '', 1),
(27, 14, 'True', 0, '1.0000000', '', 1),
(28, 14, 'False', 0, '0.0000000', '', 1),
(29, 15, 'True', 0, '0.0000000', '', 1),
(30, 15, 'False', 0, '1.0000000', '', 1),
(31, 16, 'True', 0, '1.0000000', '', 1),
(32, 16, 'False', 0, '0.0000000', '', 1),
(33, 17, 'True', 0, '0.0000000', '', 1),
(34, 17, 'False', 0, '1.0000000', '', 1),
(35, 18, 'True', 0, '1.0000000', '', 1),
(36, 18, 'False', 0, '0.0000000', '', 1),
(37, 19, 'True', 0, '1.0000000', '', 1),
(38, 19, 'False', 0, '0.0000000', '', 1),
(39, 20, 'True', 0, '1.0000000', '', 1),
(40, 20, 'False', 0, '0.0000000', '', 1),
(41, 21, 'True', 0, '0.0000000', '', 1),
(42, 21, 'False', 0, '1.0000000', '', 1),
(43, 22, 'True', 0, '1.0000000', '', 1),
(44, 22, 'False', 0, '0.0000000', '', 1),
(45, 23, 'True', 0, '0.0000000', '', 1),
(46, 23, 'False', 0, '1.0000000', '', 1),
(47, 24, 'True', 0, '1.0000000', '', 1),
(48, 24, 'False', 0, '0.0000000', '', 1),
(49, 25, 'True', 0, '1.0000000', '', 1),
(50, 25, 'False', 0, '0.0000000', '', 1),
(51, 26, 'True', 0, '1.0000000', '', 1),
(52, 26, 'False', 0, '0.0000000', '', 1),
(53, 27, 'True', 0, '0.0000000', '', 1),
(54, 27, 'False', 0, '1.0000000', '', 1),
(55, 28, 'True', 0, '0.0000000', '', 1),
(56, 28, 'False', 0, '1.0000000', '', 1),
(57, 29, 'True', 0, '1.0000000', '', 1),
(58, 29, 'False', 0, '0.0000000', '', 1),
(59, 30, 'True', 0, '1.0000000', '', 1),
(60, 30, 'False', 0, '0.0000000', '', 1),
(61, 31, 'True', 0, '0.0000000', '', 1),
(62, 31, 'False', 0, '1.0000000', '', 1),
(63, 32, 'True', 0, '0.0000000', '', 1),
(64, 32, 'False', 0, '1.0000000', '', 1),
(65, 33, 'True', 0, '1.0000000', '', 1),
(66, 33, 'False', 0, '0.0000000', '', 1),
(67, 34, 'True', 0, '0.0000000', '', 1),
(68, 34, 'False', 0, '1.0000000', '', 1),
(69, 35, 'True', 0, '1.0000000', '', 1),
(70, 35, 'False', 0, '0.0000000', '', 1),
(71, 36, 'True', 0, '0.0000000', '', 1),
(72, 36, 'False', 0, '1.0000000', '', 1),
(73, 37, 'True', 0, '1.0000000', '', 1),
(74, 37, 'False', 0, '0.0000000', '', 1),
(75, 38, 'True', 0, '1.0000000', '', 1),
(76, 38, 'False', 0, '0.0000000', '', 1),
(77, 39, 'True', 0, '0.0000000', '', 1),
(78, 39, 'False', 0, '1.0000000', '', 1),
(79, 40, 'True', 0, '1.0000000', '', 1),
(80, 40, 'False', 0, '0.0000000', '', 1),
(81, 41, 'True', 0, '1.0000000', '', 1),
(82, 41, 'False', 0, '0.0000000', '', 1),
(83, 42, 'True', 0, '1.0000000', '', 1),
(84, 42, 'False', 0, '0.0000000', '', 1),
(85, 43, 'True', 0, '1.0000000', '', 1),
(86, 43, 'False', 0, '0.0000000', '', 1),
(87, 44, 'True', 0, '1.0000000', '', 1),
(88, 44, 'False', 0, '0.0000000', '', 1),
(89, 45, 'True', 0, '0.0000000', '', 1),
(90, 45, 'False', 0, '1.0000000', '', 1),
(91, 46, 'True', 0, '1.0000000', '', 1),
(92, 46, 'False', 0, '0.0000000', '', 1),
(93, 47, 'True', 0, '0.0000000', '', 1),
(94, 47, 'False', 0, '1.0000000', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempts`
--

CREATE TABLE `mdl_question_attempts` (
  `id` bigint NOT NULL,
  `questionusageid` bigint NOT NULL,
  `slot` bigint NOT NULL,
  `behaviour` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `questionid` bigint NOT NULL,
  `variant` bigint NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `rightanswer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `responsesummary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Each row here corresponds to an attempt at one question, as ' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_question_attempts`
--

INSERT INTO `mdl_question_attempts` (`id`, `questionusageid`, `slot`, `behaviour`, `questionid`, `variant`, `maxmark`, `minfraction`, `maxfraction`, `flagged`, `questionsummary`, `rightanswer`, `responsesummary`, `timemodified`) VALUES
(7, 2, 1, 'deferredfeedback', 1, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', NULL, 1636109392),
(8, 2, 2, 'deferredfeedback', 2, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', NULL, 1636111044),
(9, 2, 3, 'deferredfeedback', 3, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well\n\n', 'False', NULL, 1636111006),
(10, 2, 4, 'deferredfeedback', 4, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', NULL, 1636109569),
(11, 2, 5, 'deferredfeedback', 5, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', NULL, 1636109599),
(12, 2, 6, 'deferredfeedback', 6, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills\n\n', 'True', NULL, 1636109678),
(13, 3, 1, 'deferredfeedback', 7, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Sun is shine\n\n', 'True', NULL, 1636111078),
(14, 3, 2, 'deferredfeedback', 8, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Rose is red\n\n', 'False', NULL, 1636111078),
(15, 3, 3, 'deferredfeedback', 9, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Sky is blue\n\n', 'True', NULL, 1636111078),
(16, 3, 4, 'deferredfeedback', 10, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Amerika is callded also US?\n\n', 'False', NULL, 1636111078),
(17, 3, 5, 'deferredfeedback', 11, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'sunflower is red?\n\n', 'False', NULL, 1636111078),
(18, 4, 1, 'deferredfeedback', 12, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', NULL, 1636199616),
(19, 4, 2, 'deferredfeedback', 13, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', NULL, 1636199619),
(20, 4, 3, 'deferredfeedback', 14, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', NULL, 1636199622),
(21, 4, 4, 'deferredfeedback', 15, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', NULL, 1636199627),
(22, 4, 5, 'deferredfeedback', 16, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'True', NULL, 1636195609),
(23, 4, 6, 'deferredfeedback', 17, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'False', NULL, 1636195696),
(24, 5, 1, 'deferredfeedback', 18, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'True', NULL, 1636188052),
(25, 5, 2, 'deferredfeedback', 19, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', NULL, 1636188052),
(26, 5, 3, 'deferredfeedback', 20, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', NULL, 1636188052),
(27, 5, 4, 'deferredfeedback', 21, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', NULL, 1636188052),
(28, 5, 5, 'deferredfeedback', 22, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'True', NULL, 1636188052),
(29, 5, 6, 'deferredfeedback', 23, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'False', NULL, 1636188052),
(30, 6, 1, 'deferredfeedback', 24, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'True', NULL, 1636188405),
(31, 6, 2, 'deferredfeedback', 25, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', NULL, 1636188405),
(32, 6, 3, 'deferredfeedback', 26, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', NULL, 1636188405),
(33, 6, 4, 'deferredfeedback', 27, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', NULL, 1636188405),
(34, 6, 5, 'deferredfeedback', 28, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'False', NULL, 1636188405),
(35, 6, 6, 'deferredfeedback', 29, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'True', NULL, 1636188405),
(36, 7, 1, 'deferredfeedback', 41, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'css?\n\n', 'True', NULL, 1636188473),
(37, 7, 2, 'deferredfeedback', 42, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'html?\n\n', 'True', NULL, 1636188473),
(38, 7, 3, 'deferredfeedback', 43, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'javascript?\n\n', 'True', NULL, 1636188473),
(39, 8, 1, 'deferredfeedback', 35, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'True', NULL, 1636188505),
(40, 8, 2, 'deferredfeedback', 36, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'False', NULL, 1636188505),
(41, 8, 3, 'deferredfeedback', 37, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', NULL, 1636188505),
(42, 8, 4, 'deferredfeedback', 38, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'True', NULL, 1636188505),
(43, 8, 5, 'deferredfeedback', 39, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'False', NULL, 1636188505),
(44, 8, 6, 'deferredfeedback', 40, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'True', NULL, 1636188505),
(45, 9, 1, 'deferredfeedback', 12, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', 'True', 1636368605),
(46, 9, 2, 'deferredfeedback', 13, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', 'False', 1636368605),
(47, 9, 3, 'deferredfeedback', 14, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', NULL, 1636368605),
(48, 9, 4, 'deferredfeedback', 15, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', NULL, 1636368605),
(49, 9, 5, 'deferredfeedback', 16, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'True', NULL, 1636368605),
(50, 9, 6, 'deferredfeedback', 17, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'False', NULL, 1636368605),
(51, 10, 1, 'deferredfeedback', 18, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'True', 'True', 1636200562),
(52, 10, 2, 'deferredfeedback', 19, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', NULL, 1636200562),
(53, 10, 3, 'deferredfeedback', 20, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', 'False', 1636200562),
(54, 10, 4, 'deferredfeedback', 21, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', 'True', 1636200562),
(55, 10, 5, 'deferredfeedback', 22, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'True', 'False', 1636200562),
(56, 10, 6, 'deferredfeedback', 23, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'False', 'True', 1636200562),
(57, 11, 1, 'deferredfeedback', 18, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'True', 'True', 1636200726),
(58, 11, 2, 'deferredfeedback', 19, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', 'True', 1636200726),
(59, 11, 3, 'deferredfeedback', 20, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', 'True', 1636200726),
(60, 11, 4, 'deferredfeedback', 21, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', 'True', 1636200726),
(61, 11, 5, 'deferredfeedback', 22, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'True', 'True', 1636200726),
(62, 11, 6, 'deferredfeedback', 23, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'False', 'True', 1636200726),
(63, 12, 1, 'deferredfeedback', 18, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'True', 'True', 1637908197),
(64, 12, 2, 'deferredfeedback', 19, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', 'True', 1637908197),
(65, 12, 3, 'deferredfeedback', 20, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', 'False', 1637908197),
(66, 12, 4, 'deferredfeedback', 21, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', 'True', 1637908197),
(67, 12, 5, 'deferredfeedback', 22, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'True', 'False', 1637908197),
(68, 12, 6, 'deferredfeedback', 23, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'False', 'False', 1637908197),
(69, 13, 1, 'deferredfeedback', 1, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', 'True', 1636200868),
(70, 13, 2, 'deferredfeedback', 2, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', 'True', 1636200868),
(71, 13, 3, 'deferredfeedback', 3, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well\n\n', 'False', 'True', 1636200868),
(72, 13, 4, 'deferredfeedback', 4, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', 'True', 1636200868),
(73, 13, 5, 'deferredfeedback', 5, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', 'True', 1636200868),
(74, 13, 6, 'deferredfeedback', 6, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills\n\n', 'True', 'True', 1636200868),
(75, 14, 1, 'deferredfeedback', 24, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'True', 'True', 1637908288),
(76, 14, 2, 'deferredfeedback', 25, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', 'True', 1637908288),
(77, 14, 3, 'deferredfeedback', 26, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', 'True', 1637908288),
(78, 14, 4, 'deferredfeedback', 27, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', 'False', 1637908288),
(79, 14, 5, 'deferredfeedback', 28, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'False', 'True', 1637908288),
(80, 14, 6, 'deferredfeedback', 29, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'True', 'False', 1637908288),
(81, 15, 1, 'deferredfeedback', 35, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'True', NULL, 1636201059),
(82, 15, 2, 'deferredfeedback', 36, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'False', NULL, 1636201059),
(83, 15, 3, 'deferredfeedback', 37, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', NULL, 1636201059),
(84, 15, 4, 'deferredfeedback', 38, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'True', NULL, 1636201059),
(85, 15, 5, 'deferredfeedback', 39, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'False', NULL, 1636201059),
(86, 15, 6, 'deferredfeedback', 40, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'True', NULL, 1636201059),
(87, 16, 1, 'deferredfeedback', 30, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'True', NULL, 1636201794),
(88, 16, 2, 'deferredfeedback', 31, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'False', NULL, 1636201794),
(89, 16, 3, 'deferredfeedback', 32, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'False', NULL, 1636201794),
(90, 16, 4, 'deferredfeedback', 33, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'True', NULL, 1636201794),
(91, 16, 5, 'deferredfeedback', 34, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'False', NULL, 1636201794),
(92, 17, 1, 'deferredfeedback', 46, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'php is pre-proccessor?\n\n', 'True', 'True', 1636368162),
(93, 17, 2, 'deferredfeedback', 47, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'php is technology?\n\n', 'False', 'True', 1636368162),
(94, 18, 1, 'deferredfeedback', 46, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'php is pre-proccessor?\n\n', 'True', NULL, 1636368181),
(95, 18, 2, 'deferredfeedback', 47, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'php is technology?\n\n', 'False', NULL, 1636368181),
(96, 19, 1, 'deferredfeedback', 12, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', 'True', 1637125702),
(97, 19, 2, 'deferredfeedback', 13, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', 'False', 1637125702),
(98, 19, 3, 'deferredfeedback', 14, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', 'True', 1637125702),
(99, 19, 4, 'deferredfeedback', 15, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', 'True', 1637125702),
(100, 19, 5, 'deferredfeedback', 16, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'True', 'False', 1637125702),
(101, 19, 6, 'deferredfeedback', 17, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'False', 'True', 1637125702),
(102, 20, 1, 'deferredfeedback', 12, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', NULL, 1637749333),
(103, 20, 2, 'deferredfeedback', 13, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', NULL, 1637749333),
(104, 20, 3, 'deferredfeedback', 14, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', NULL, 1637749333),
(105, 20, 4, 'deferredfeedback', 15, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', NULL, 1637749333),
(106, 20, 5, 'deferredfeedback', 16, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'True', NULL, 1637749333),
(107, 20, 6, 'deferredfeedback', 17, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'False', NULL, 1637749333),
(108, 21, 1, 'deferredfeedback', 12, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', 'True', 1637908087),
(109, 21, 2, 'deferredfeedback', 13, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', 'False', 1637908087),
(110, 21, 3, 'deferredfeedback', 14, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', 'True', 1637908087),
(111, 21, 4, 'deferredfeedback', 15, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', 'False', 1637908087),
(112, 21, 5, 'deferredfeedback', 16, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills?\n\n', 'True', 'True', 1637908087),
(113, 21, 6, 'deferredfeedback', 17, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you give feedback to your students often\n\n', 'False', 'False', 1637908087),
(114, 22, 1, 'deferredfeedback', 1, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', 'True', 1638170729),
(115, 22, 2, 'deferredfeedback', 2, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', 'False', 1638170729),
(116, 22, 3, 'deferredfeedback', 3, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well\n\n', 'False', 'True', 1638170729),
(117, 22, 4, 'deferredfeedback', 4, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', 'True', 1638170729),
(118, 22, 5, 'deferredfeedback', 5, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', 'False', 1638170729),
(119, 22, 6, 'deferredfeedback', 6, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills\n\n', 'True', 'True', 1638170729),
(120, 23, 1, 'deferredfeedback', 1, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', 'True', 1638185171),
(121, 23, 2, 'deferredfeedback', 2, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', 'True', 1638185171),
(122, 23, 3, 'deferredfeedback', 3, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well\n\n', 'False', 'True', 1638185171),
(123, 23, 4, 'deferredfeedback', 4, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', 'False', 1638185171),
(124, 23, 5, 'deferredfeedback', 5, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', 'True', 1638185171),
(125, 23, 6, 'deferredfeedback', 6, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills\n\n', 'True', 'True', 1638185171),
(126, 24, 1, 'deferredfeedback', 7, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Sun is shine\n\n', 'True', 'True', 1638171249),
(127, 24, 2, 'deferredfeedback', 8, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Rose is red\n\n', 'False', 'True', 1638171249),
(128, 24, 3, 'deferredfeedback', 9, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Sky is blue\n\n', 'True', 'True', 1638171249),
(129, 24, 4, 'deferredfeedback', 10, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Amerika is callded also US?\n\n', 'False', 'True', 1638171249),
(130, 24, 5, 'deferredfeedback', 11, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'sunflower is red?\n\n', 'False', 'False', 1638171249),
(131, 25, 1, 'deferredfeedback', 7, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Sun is shine\n\n', 'True', 'True', 1638171443),
(132, 25, 2, 'deferredfeedback', 8, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Rose is red\n\n', 'False', 'False', 1638171443),
(133, 25, 3, 'deferredfeedback', 9, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Sky is blue\n\n', 'True', 'True', 1638171443),
(134, 25, 4, 'deferredfeedback', 10, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Amerika is callded also US?\n\n', 'False', 'False', 1638171443),
(135, 25, 5, 'deferredfeedback', 11, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'sunflower is red?\n\n', 'False', 'False', 1638171443),
(136, 26, 1, 'deferredfeedback', 1, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', 'True', 1638185451),
(137, 26, 2, 'deferredfeedback', 2, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', NULL, 1638185451),
(138, 26, 3, 'deferredfeedback', 3, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well\n\n', 'False', NULL, 1638185451),
(139, 26, 4, 'deferredfeedback', 4, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', NULL, 1638185451),
(140, 26, 5, 'deferredfeedback', 5, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', NULL, 1638185451),
(141, 26, 6, 'deferredfeedback', 6, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills\n\n', 'True', NULL, 1638185451),
(142, 27, 1, 'deferredfeedback', 1, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', 'True', 1638185597),
(143, 27, 2, 'deferredfeedback', 2, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', 'False', 1638185597),
(144, 27, 3, 'deferredfeedback', 3, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well\n\n', 'False', 'True', 1638185597),
(145, 27, 4, 'deferredfeedback', 4, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', 'False', 1638185597),
(146, 27, 5, 'deferredfeedback', 5, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', 'True', 1638185597),
(147, 27, 6, 'deferredfeedback', 6, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills\n\n', 'True', 'True', 1638185597),
(148, 28, 1, 'deferredfeedback', 1, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you know to motivate your student in different ways\n\n', 'False', 'False', 1638185670),
(149, 28, 2, 'deferredfeedback', 2, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well?\n\n', 'True', 'True', 1638185670),
(150, 28, 3, 'deferredfeedback', 3, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you take feedback well\n\n', 'False', 'False', 1638185670),
(151, 28, 4, 'deferredfeedback', 4, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you hold yourself and other accountable?\n\n', 'True', 'True', 1638185670),
(152, 28, 5, 'deferredfeedback', 5, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you have a good decision making process?\n\n', 'False', 'False', 1638185670),
(153, 28, 6, 'deferredfeedback', 6, 1, '1.0000000', '0.0000000', '1.0000000', 0, 'Do you process strong communication skills\n\n', 'True', 'False', 1638185670);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_steps`
--

CREATE TABLE `mdl_question_attempt_steps` (
  `id` bigint NOT NULL,
  `questionattemptid` bigint NOT NULL,
  `sequencenumber` bigint NOT NULL,
  `state` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `userid` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores one step in in a question attempt. As well as the dat' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_question_attempt_steps`
--

INSERT INTO `mdl_question_attempt_steps` (`id`, `questionattemptid`, `sequencenumber`, `state`, `fraction`, `timecreated`, `userid`) VALUES
(19, 7, 0, 'todo', NULL, 1636092307, 2),
(20, 8, 0, 'todo', NULL, 1636092307, 2),
(21, 9, 0, 'todo', NULL, 1636092307, 2),
(22, 10, 0, 'todo', NULL, 1636092307, 2),
(23, 11, 0, 'todo', NULL, 1636092307, 2),
(24, 12, 0, 'todo', NULL, 1636092307, 2),
(25, 13, 0, 'todo', NULL, 1636111078, 2),
(26, 14, 0, 'todo', NULL, 1636111078, 2),
(27, 15, 0, 'todo', NULL, 1636111078, 2),
(28, 16, 0, 'todo', NULL, 1636111078, 2),
(29, 17, 0, 'todo', NULL, 1636111078, 2),
(30, 18, 0, 'todo', NULL, 1636111105, 2),
(31, 19, 0, 'todo', NULL, 1636111105, 2),
(32, 20, 0, 'todo', NULL, 1636111105, 2),
(33, 21, 0, 'todo', NULL, 1636111105, 2),
(34, 22, 0, 'todo', NULL, 1636111105, 2),
(35, 23, 0, 'todo', NULL, 1636111105, 2),
(36, 24, 0, 'todo', NULL, 1636188051, 2),
(37, 25, 0, 'todo', NULL, 1636188051, 2),
(38, 26, 0, 'todo', NULL, 1636188051, 2),
(39, 27, 0, 'todo', NULL, 1636188051, 2),
(40, 28, 0, 'todo', NULL, 1636188051, 2),
(41, 29, 0, 'todo', NULL, 1636188051, 2),
(42, 30, 0, 'todo', NULL, 1636188405, 2),
(43, 31, 0, 'todo', NULL, 1636188405, 2),
(44, 32, 0, 'todo', NULL, 1636188405, 2),
(45, 33, 0, 'todo', NULL, 1636188405, 2),
(46, 34, 0, 'todo', NULL, 1636188405, 2),
(47, 35, 0, 'todo', NULL, 1636188405, 2),
(48, 36, 0, 'todo', NULL, 1636188473, 2),
(49, 37, 0, 'todo', NULL, 1636188473, 2),
(50, 38, 0, 'todo', NULL, 1636188473, 2),
(51, 39, 0, 'todo', NULL, 1636188505, 2),
(52, 40, 0, 'todo', NULL, 1636188505, 2),
(53, 41, 0, 'todo', NULL, 1636188505, 2),
(54, 42, 0, 'todo', NULL, 1636188505, 2),
(55, 43, 0, 'todo', NULL, 1636188505, 2),
(56, 44, 0, 'todo', NULL, 1636188505, 2),
(57, 45, 0, 'todo', NULL, 1636190778, 13),
(58, 46, 0, 'todo', NULL, 1636190778, 13),
(59, 47, 0, 'todo', NULL, 1636190778, 13),
(60, 48, 0, 'todo', NULL, 1636190778, 13),
(61, 49, 0, 'todo', NULL, 1636190778, 13),
(62, 50, 0, 'todo', NULL, 1636190778, 13),
(63, 45, 1, 'complete', NULL, 1636199888, 13),
(64, 46, 1, 'complete', NULL, 1636199896, 13),
(65, 51, 0, 'todo', NULL, 1636200113, 13),
(66, 52, 0, 'todo', NULL, 1636200113, 13),
(67, 53, 0, 'todo', NULL, 1636200113, 13),
(68, 54, 0, 'todo', NULL, 1636200113, 13),
(69, 55, 0, 'todo', NULL, 1636200113, 13),
(70, 56, 0, 'todo', NULL, 1636200113, 13),
(71, 51, 1, 'complete', NULL, 1636200368, 13),
(72, 53, 1, 'complete', NULL, 1636200500, 13),
(73, 54, 1, 'complete', NULL, 1636200512, 13),
(74, 55, 1, 'complete', NULL, 1636200522, 13),
(75, 56, 1, 'complete', NULL, 1636200532, 13),
(76, 56, 2, 'complete', NULL, 1636200550, 13),
(77, 51, 2, 'gradedright', '1.0000000', 1636200562, 13),
(78, 52, 1, 'gaveup', NULL, 1636200562, 13),
(79, 53, 2, 'gradedwrong', '0.0000000', 1636200562, 13),
(80, 54, 2, 'gradedwrong', '0.0000000', 1636200562, 13),
(81, 55, 2, 'gradedwrong', '0.0000000', 1636200562, 13),
(82, 56, 3, 'gradedwrong', '0.0000000', 1636200562, 13),
(83, 57, 0, 'todo', NULL, 1636200598, 13),
(84, 58, 0, 'todo', NULL, 1636200598, 13),
(85, 59, 0, 'todo', NULL, 1636200598, 13),
(86, 60, 0, 'todo', NULL, 1636200598, 13),
(87, 61, 0, 'todo', NULL, 1636200598, 13),
(88, 62, 0, 'todo', NULL, 1636200598, 13),
(89, 57, 1, 'complete', NULL, 1636200643, 13),
(90, 58, 1, 'complete', NULL, 1636200650, 13),
(91, 59, 1, 'complete', NULL, 1636200683, 13),
(92, 60, 1, 'complete', NULL, 1636200697, 13),
(93, 61, 1, 'complete', NULL, 1636200705, 13),
(94, 62, 1, 'complete', NULL, 1636200717, 13),
(95, 57, 2, 'gradedright', '1.0000000', 1636200726, 13),
(96, 58, 2, 'gradedright', '1.0000000', 1636200726, 13),
(97, 59, 2, 'gradedright', '1.0000000', 1636200726, 13),
(98, 60, 2, 'gradedwrong', '0.0000000', 1636200726, 13),
(99, 61, 2, 'gradedright', '1.0000000', 1636200726, 13),
(100, 62, 2, 'gradedwrong', '0.0000000', 1636200726, 13),
(101, 63, 0, 'todo', NULL, 1636200745, 13),
(102, 64, 0, 'todo', NULL, 1636200745, 13),
(103, 65, 0, 'todo', NULL, 1636200745, 13),
(104, 66, 0, 'todo', NULL, 1636200745, 13),
(105, 67, 0, 'todo', NULL, 1636200745, 13),
(106, 68, 0, 'todo', NULL, 1636200745, 13),
(107, 69, 0, 'todo', NULL, 1636200776, 13),
(108, 70, 0, 'todo', NULL, 1636200776, 13),
(109, 71, 0, 'todo', NULL, 1636200776, 13),
(110, 72, 0, 'todo', NULL, 1636200776, 13),
(111, 73, 0, 'todo', NULL, 1636200776, 13),
(112, 74, 0, 'todo', NULL, 1636200776, 13),
(113, 69, 1, 'complete', NULL, 1636200808, 13),
(114, 70, 1, 'complete', NULL, 1636200822, 13),
(115, 71, 1, 'complete', NULL, 1636200829, 13),
(116, 72, 1, 'complete', NULL, 1636200840, 13),
(117, 73, 1, 'complete', NULL, 1636200853, 13),
(118, 74, 1, 'complete', NULL, 1636200861, 13),
(119, 69, 2, 'gradedwrong', '0.0000000', 1636200868, 13),
(120, 70, 2, 'gradedright', '1.0000000', 1636200868, 13),
(121, 71, 2, 'gradedwrong', '0.0000000', 1636200868, 13),
(122, 72, 2, 'gradedright', '1.0000000', 1636200868, 13),
(123, 73, 2, 'gradedwrong', '0.0000000', 1636200868, 13),
(124, 74, 2, 'gradedright', '1.0000000', 1636200868, 13),
(125, 75, 0, 'todo', NULL, 1636200949, 13),
(126, 76, 0, 'todo', NULL, 1636200949, 13),
(127, 77, 0, 'todo', NULL, 1636200949, 13),
(128, 78, 0, 'todo', NULL, 1636200949, 13),
(129, 79, 0, 'todo', NULL, 1636200949, 13),
(130, 80, 0, 'todo', NULL, 1636200949, 13),
(131, 81, 0, 'todo', NULL, 1636201059, 13),
(132, 82, 0, 'todo', NULL, 1636201059, 13),
(133, 83, 0, 'todo', NULL, 1636201059, 13),
(134, 84, 0, 'todo', NULL, 1636201059, 13),
(135, 85, 0, 'todo', NULL, 1636201059, 13),
(136, 86, 0, 'todo', NULL, 1636201059, 13),
(137, 87, 0, 'todo', NULL, 1636201794, 13),
(138, 88, 0, 'todo', NULL, 1636201794, 13),
(139, 89, 0, 'todo', NULL, 1636201794, 13),
(140, 90, 0, 'todo', NULL, 1636201794, 13),
(141, 91, 0, 'todo', NULL, 1636201794, 13),
(142, 92, 0, 'todo', NULL, 1636367741, 13),
(143, 93, 0, 'todo', NULL, 1636367741, 13),
(144, 93, 1, 'complete', NULL, 1636368139, 13),
(145, 92, 1, 'complete', NULL, 1636368154, 13),
(146, 92, 2, 'gradedright', '1.0000000', 1636368162, 13),
(147, 93, 2, 'gradedwrong', '0.0000000', 1636368162, 13),
(148, 94, 0, 'todo', NULL, 1636368181, 13),
(149, 95, 0, 'todo', NULL, 1636368181, 13),
(150, 45, 2, 'gradedwrong', '0.0000000', 1636368604, 13),
(151, 46, 2, 'gradedwrong', '0.0000000', 1636368604, 13),
(152, 47, 1, 'gaveup', NULL, 1636368604, 13),
(153, 48, 1, 'gaveup', NULL, 1636368604, 13),
(154, 49, 1, 'gaveup', NULL, 1636368604, 13),
(155, 50, 1, 'gaveup', NULL, 1636368604, 13),
(156, 96, 0, 'todo', NULL, 1637125647, 13),
(157, 97, 0, 'todo', NULL, 1637125647, 13),
(158, 98, 0, 'todo', NULL, 1637125647, 13),
(159, 99, 0, 'todo', NULL, 1637125647, 13),
(160, 100, 0, 'todo', NULL, 1637125647, 13),
(161, 101, 0, 'todo', NULL, 1637125647, 13),
(162, 96, 1, 'complete', NULL, 1637125665, 13),
(163, 97, 1, 'complete', NULL, 1637125671, 13),
(164, 98, 1, 'complete', NULL, 1637125678, 13),
(165, 99, 1, 'complete', NULL, 1637125682, 13),
(166, 100, 1, 'complete', NULL, 1637125688, 13),
(167, 101, 1, 'complete', NULL, 1637125694, 13),
(168, 96, 2, 'gradedwrong', '0.0000000', 1637125702, 13),
(169, 97, 2, 'gradedwrong', '0.0000000', 1637125702, 13),
(170, 98, 2, 'gradedright', '1.0000000', 1637125702, 13),
(171, 99, 2, 'gradedwrong', '0.0000000', 1637125702, 13),
(172, 100, 2, 'gradedwrong', '0.0000000', 1637125702, 13),
(173, 101, 2, 'gradedwrong', '0.0000000', 1637125702, 13),
(174, 102, 0, 'todo', NULL, 1637749293, 13),
(175, 103, 0, 'todo', NULL, 1637749293, 13),
(176, 104, 0, 'todo', NULL, 1637749293, 13),
(177, 105, 0, 'todo', NULL, 1637749293, 13),
(178, 106, 0, 'todo', NULL, 1637749293, 13),
(179, 107, 0, 'todo', NULL, 1637749293, 13),
(180, 102, 1, 'gaveup', NULL, 1637749333, 13),
(181, 103, 1, 'gaveup', NULL, 1637749333, 13),
(182, 104, 1, 'gaveup', NULL, 1637749333, 13),
(183, 105, 1, 'gaveup', NULL, 1637749333, 13),
(184, 106, 1, 'gaveup', NULL, 1637749333, 13),
(185, 107, 1, 'gaveup', NULL, 1637749333, 13),
(186, 108, 0, 'todo', NULL, 1637908049, 13),
(187, 109, 0, 'todo', NULL, 1637908049, 13),
(188, 110, 0, 'todo', NULL, 1637908049, 13),
(189, 111, 0, 'todo', NULL, 1637908049, 13),
(190, 112, 0, 'todo', NULL, 1637908049, 13),
(191, 113, 0, 'todo', NULL, 1637908049, 13),
(192, 108, 1, 'complete', NULL, 1637908057, 13),
(193, 109, 1, 'complete', NULL, 1637908061, 13),
(194, 110, 1, 'complete', NULL, 1637908068, 13),
(195, 111, 1, 'complete', NULL, 1637908072, 13),
(196, 112, 1, 'complete', NULL, 1637908077, 13),
(197, 113, 1, 'complete', NULL, 1637908081, 13),
(198, 108, 2, 'gradedwrong', '0.0000000', 1637908087, 13),
(199, 109, 2, 'gradedwrong', '0.0000000', 1637908087, 13),
(200, 110, 2, 'gradedright', '1.0000000', 1637908087, 13),
(201, 111, 2, 'gradedright', '1.0000000', 1637908087, 13),
(202, 112, 2, 'gradedright', '1.0000000', 1637908087, 13),
(203, 113, 2, 'gradedright', '1.0000000', 1637908087, 13),
(204, 63, 1, 'complete', NULL, 1637908170, 13),
(205, 64, 1, 'complete', NULL, 1637908173, 13),
(206, 65, 1, 'complete', NULL, 1637908177, 13),
(207, 66, 1, 'complete', NULL, 1637908181, 13),
(208, 67, 1, 'complete', NULL, 1637908185, 13),
(209, 68, 1, 'complete', NULL, 1637908188, 13),
(210, 63, 2, 'gradedright', '1.0000000', 1637908197, 13),
(211, 64, 2, 'gradedright', '1.0000000', 1637908197, 13),
(212, 65, 2, 'gradedwrong', '0.0000000', 1637908197, 13),
(213, 66, 2, 'gradedwrong', '0.0000000', 1637908197, 13),
(214, 67, 2, 'gradedwrong', '0.0000000', 1637908197, 13),
(215, 68, 2, 'gradedright', '1.0000000', 1637908197, 13),
(216, 75, 1, 'complete', NULL, 1637908254, 13),
(217, 76, 1, 'complete', NULL, 1637908263, 13),
(218, 77, 1, 'complete', NULL, 1637908267, 13),
(219, 78, 1, 'complete', NULL, 1637908274, 13),
(220, 79, 1, 'complete', NULL, 1637908280, 13),
(221, 80, 1, 'complete', NULL, 1637908282, 13),
(222, 75, 2, 'gradedright', '1.0000000', 1637908288, 13),
(223, 76, 2, 'gradedright', '1.0000000', 1637908288, 13),
(224, 77, 2, 'gradedright', '1.0000000', 1637908288, 13),
(225, 78, 2, 'gradedright', '1.0000000', 1637908288, 13),
(226, 79, 2, 'gradedwrong', '0.0000000', 1637908288, 13),
(227, 80, 2, 'gradedwrong', '0.0000000', 1637908288, 13),
(228, 114, 0, 'todo', NULL, 1638170601, 13),
(229, 115, 0, 'todo', NULL, 1638170601, 13),
(230, 116, 0, 'todo', NULL, 1638170601, 13),
(231, 117, 0, 'todo', NULL, 1638170601, 13),
(232, 118, 0, 'todo', NULL, 1638170601, 13),
(233, 119, 0, 'todo', NULL, 1638170601, 13),
(234, 114, 1, 'complete', NULL, 1638170685, 13),
(235, 115, 1, 'complete', NULL, 1638170690, 13),
(236, 116, 1, 'complete', NULL, 1638170696, 13),
(237, 117, 1, 'complete', NULL, 1638170701, 13),
(238, 118, 1, 'complete', NULL, 1638170706, 13),
(239, 119, 1, 'complete', NULL, 1638170711, 13),
(240, 114, 2, 'gradedwrong', '0.0000000', 1638170729, 13),
(241, 115, 2, 'gradedwrong', '0.0000000', 1638170729, 13),
(242, 116, 2, 'gradedwrong', '0.0000000', 1638170729, 13),
(243, 117, 2, 'gradedright', '1.0000000', 1638170729, 13),
(244, 118, 2, 'gradedright', '1.0000000', 1638170729, 13),
(245, 119, 2, 'gradedright', '1.0000000', 1638170729, 13),
(246, 120, 0, 'todo', NULL, 1638171179, 13),
(247, 121, 0, 'todo', NULL, 1638171179, 13),
(248, 122, 0, 'todo', NULL, 1638171179, 13),
(249, 123, 0, 'todo', NULL, 1638171179, 13),
(250, 124, 0, 'todo', NULL, 1638171179, 13),
(251, 125, 0, 'todo', NULL, 1638171179, 13),
(252, 126, 0, 'todo', NULL, 1638171205, 13),
(253, 127, 0, 'todo', NULL, 1638171205, 13),
(254, 128, 0, 'todo', NULL, 1638171205, 13),
(255, 129, 0, 'todo', NULL, 1638171205, 13),
(256, 130, 0, 'todo', NULL, 1638171205, 13),
(257, 126, 1, 'complete', NULL, 1638171216, 13),
(258, 127, 1, 'complete', NULL, 1638171221, 13),
(259, 128, 1, 'complete', NULL, 1638171226, 13),
(260, 129, 1, 'complete', NULL, 1638171235, 13),
(261, 130, 1, 'complete', NULL, 1638171243, 13),
(262, 126, 2, 'gradedright', '1.0000000', 1638171249, 13),
(263, 127, 2, 'gradedwrong', '0.0000000', 1638171249, 13),
(264, 128, 2, 'gradedright', '1.0000000', 1638171249, 13),
(265, 129, 2, 'gradedwrong', '0.0000000', 1638171249, 13),
(266, 130, 2, 'gradedright', '1.0000000', 1638171249, 13),
(267, 131, 0, 'todo', NULL, 1638171408, 13),
(268, 132, 0, 'todo', NULL, 1638171408, 13),
(269, 133, 0, 'todo', NULL, 1638171408, 13),
(270, 134, 0, 'todo', NULL, 1638171408, 13),
(271, 135, 0, 'todo', NULL, 1638171408, 13),
(272, 131, 1, 'complete', NULL, 1638171412, 13),
(273, 132, 1, 'complete', NULL, 1638171419, 13),
(274, 133, 1, 'complete', NULL, 1638171424, 13),
(275, 134, 1, 'complete', NULL, 1638171428, 13),
(276, 135, 1, 'complete', NULL, 1638171438, 13),
(277, 131, 2, 'gradedright', '1.0000000', 1638171443, 13),
(278, 132, 2, 'gradedright', '1.0000000', 1638171443, 13),
(279, 133, 2, 'gradedright', '1.0000000', 1638171443, 13),
(280, 134, 2, 'gradedright', '1.0000000', 1638171443, 13),
(281, 135, 2, 'gradedright', '1.0000000', 1638171443, 13),
(282, 120, 1, 'complete', NULL, 1638185123, 13),
(283, 122, 1, 'complete', NULL, 1638185132, 13),
(284, 123, 1, 'complete', NULL, 1638185138, 13),
(285, 124, 1, 'complete', NULL, 1638185143, 13),
(286, 121, 1, 'complete', NULL, 1638185153, 13),
(287, 125, 1, 'complete', NULL, 1638185167, 13),
(288, 120, 2, 'gradedwrong', '0.0000000', 1638185171, 13),
(289, 121, 2, 'gradedright', '1.0000000', 1638185171, 13),
(290, 122, 2, 'gradedwrong', '0.0000000', 1638185171, 13),
(291, 123, 2, 'gradedwrong', '0.0000000', 1638185171, 13),
(292, 124, 2, 'gradedwrong', '0.0000000', 1638185171, 13),
(293, 125, 2, 'gradedright', '1.0000000', 1638185171, 13),
(294, 136, 0, 'todo', NULL, 1638185402, 13),
(295, 137, 0, 'todo', NULL, 1638185402, 13),
(296, 138, 0, 'todo', NULL, 1638185402, 13),
(297, 139, 0, 'todo', NULL, 1638185402, 13),
(298, 140, 0, 'todo', NULL, 1638185402, 13),
(299, 141, 0, 'todo', NULL, 1638185402, 13),
(300, 136, 1, 'complete', NULL, 1638185409, 13),
(301, 136, 2, 'gradedwrong', '0.0000000', 1638185451, 13),
(302, 137, 1, 'gaveup', NULL, 1638185451, 13),
(303, 138, 1, 'gaveup', NULL, 1638185451, 13),
(304, 139, 1, 'gaveup', NULL, 1638185451, 13),
(305, 140, 1, 'gaveup', NULL, 1638185451, 13),
(306, 141, 1, 'gaveup', NULL, 1638185451, 13),
(307, 142, 0, 'todo', NULL, 1638185562, 13),
(308, 143, 0, 'todo', NULL, 1638185562, 13),
(309, 144, 0, 'todo', NULL, 1638185562, 13),
(310, 145, 0, 'todo', NULL, 1638185562, 13),
(311, 146, 0, 'todo', NULL, 1638185562, 13),
(312, 147, 0, 'todo', NULL, 1638185562, 13),
(313, 142, 1, 'complete', NULL, 1638185571, 13),
(314, 143, 1, 'complete', NULL, 1638185575, 13),
(315, 144, 1, 'complete', NULL, 1638185579, 13),
(316, 145, 1, 'complete', NULL, 1638185584, 13),
(317, 146, 1, 'complete', NULL, 1638185588, 13),
(318, 147, 1, 'complete', NULL, 1638185593, 13),
(319, 142, 2, 'gradedwrong', '0.0000000', 1638185597, 13),
(320, 143, 2, 'gradedwrong', '0.0000000', 1638185597, 13),
(321, 144, 2, 'gradedwrong', '0.0000000', 1638185597, 13),
(322, 145, 2, 'gradedwrong', '0.0000000', 1638185597, 13),
(323, 146, 2, 'gradedwrong', '0.0000000', 1638185597, 13),
(324, 147, 2, 'gradedright', '1.0000000', 1638185597, 13),
(325, 148, 0, 'todo', NULL, 1638185632, 13),
(326, 149, 0, 'todo', NULL, 1638185632, 13),
(327, 150, 0, 'todo', NULL, 1638185632, 13),
(328, 151, 0, 'todo', NULL, 1638185632, 13),
(329, 152, 0, 'todo', NULL, 1638185632, 13),
(330, 153, 0, 'todo', NULL, 1638185632, 13),
(331, 148, 1, 'complete', NULL, 1638185637, 13),
(332, 149, 1, 'complete', NULL, 1638185644, 13),
(333, 150, 1, 'complete', NULL, 1638185650, 13),
(334, 151, 1, 'complete', NULL, 1638185654, 13),
(335, 152, 1, 'complete', NULL, 1638185657, 13),
(336, 153, 1, 'complete', NULL, 1638185666, 13),
(337, 148, 2, 'gradedright', '1.0000000', 1638185670, 13),
(338, 149, 2, 'gradedright', '1.0000000', 1638185670, 13),
(339, 150, 2, 'gradedright', '1.0000000', 1638185670, 13),
(340, 151, 2, 'gradedright', '1.0000000', 1638185670, 13),
(341, 152, 2, 'gradedright', '1.0000000', 1638185670, 13),
(342, 153, 2, 'gradedwrong', '0.0000000', 1638185670, 13);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_step_data`
--

CREATE TABLE `mdl_question_attempt_step_data` (
  `id` bigint NOT NULL,
  `attemptstepid` bigint NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Each question_attempt_step has an associative array of the d' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_question_attempt_step_data`
--

INSERT INTO `mdl_question_attempt_step_data` (`id`, `attemptstepid`, `name`, `value`) VALUES
(13, 63, 'answer', '1'),
(14, 64, 'answer', '0'),
(15, 71, 'answer', '1'),
(16, 72, 'answer', '0'),
(17, 73, 'answer', '1'),
(18, 74, 'answer', '0'),
(19, 75, 'answer', '0'),
(20, 76, 'answer', '1'),
(21, 77, '-finish', '1'),
(22, 78, '-finish', '1'),
(23, 79, '-finish', '1'),
(24, 80, '-finish', '1'),
(25, 81, '-finish', '1'),
(26, 82, '-finish', '1'),
(27, 89, 'answer', '1'),
(28, 90, 'answer', '1'),
(29, 91, 'answer', '1'),
(30, 92, 'answer', '1'),
(31, 93, 'answer', '1'),
(32, 94, 'answer', '1'),
(33, 95, '-finish', '1'),
(34, 96, '-finish', '1'),
(35, 97, '-finish', '1'),
(36, 98, '-finish', '1'),
(37, 99, '-finish', '1'),
(38, 100, '-finish', '1'),
(39, 113, 'answer', '1'),
(40, 114, 'answer', '1'),
(41, 115, 'answer', '1'),
(42, 116, 'answer', '1'),
(43, 117, 'answer', '1'),
(44, 118, 'answer', '1'),
(45, 119, '-finish', '1'),
(46, 120, '-finish', '1'),
(47, 121, '-finish', '1'),
(48, 122, '-finish', '1'),
(49, 123, '-finish', '1'),
(50, 124, '-finish', '1'),
(51, 144, 'answer', '1'),
(52, 145, 'answer', '1'),
(53, 146, '-finish', '1'),
(54, 147, '-finish', '1'),
(55, 150, '-finish', '1'),
(56, 151, '-finish', '1'),
(57, 152, '-finish', '1'),
(58, 153, '-finish', '1'),
(59, 154, '-finish', '1'),
(60, 155, '-finish', '1'),
(61, 162, 'answer', '1'),
(62, 163, 'answer', '0'),
(63, 164, 'answer', '1'),
(64, 165, 'answer', '1'),
(65, 166, 'answer', '0'),
(66, 167, 'answer', '1'),
(67, 168, '-finish', '1'),
(68, 169, '-finish', '1'),
(69, 170, '-finish', '1'),
(70, 171, '-finish', '1'),
(71, 172, '-finish', '1'),
(72, 173, '-finish', '1'),
(73, 180, '-finish', '1'),
(74, 181, '-finish', '1'),
(75, 182, '-finish', '1'),
(76, 183, '-finish', '1'),
(77, 184, '-finish', '1'),
(78, 185, '-finish', '1'),
(79, 192, 'answer', '1'),
(80, 193, 'answer', '0'),
(81, 194, 'answer', '1'),
(82, 195, 'answer', '0'),
(83, 196, 'answer', '1'),
(84, 197, 'answer', '0'),
(85, 198, '-finish', '1'),
(86, 199, '-finish', '1'),
(87, 200, '-finish', '1'),
(88, 201, '-finish', '1'),
(89, 202, '-finish', '1'),
(90, 203, '-finish', '1'),
(91, 204, 'answer', '1'),
(92, 205, 'answer', '1'),
(93, 206, 'answer', '0'),
(94, 207, 'answer', '1'),
(95, 208, 'answer', '0'),
(96, 209, 'answer', '0'),
(97, 210, '-finish', '1'),
(98, 211, '-finish', '1'),
(99, 212, '-finish', '1'),
(100, 213, '-finish', '1'),
(101, 214, '-finish', '1'),
(102, 215, '-finish', '1'),
(103, 216, 'answer', '1'),
(104, 217, 'answer', '1'),
(105, 218, 'answer', '1'),
(106, 219, 'answer', '0'),
(107, 220, 'answer', '1'),
(108, 221, 'answer', '0'),
(109, 222, '-finish', '1'),
(110, 223, '-finish', '1'),
(111, 224, '-finish', '1'),
(112, 225, '-finish', '1'),
(113, 226, '-finish', '1'),
(114, 227, '-finish', '1'),
(115, 234, 'answer', '1'),
(116, 235, 'answer', '0'),
(117, 236, 'answer', '1'),
(118, 237, 'answer', '1'),
(119, 238, 'answer', '0'),
(120, 239, 'answer', '1'),
(121, 240, '-finish', '1'),
(122, 241, '-finish', '1'),
(123, 242, '-finish', '1'),
(124, 243, '-finish', '1'),
(125, 244, '-finish', '1'),
(126, 245, '-finish', '1'),
(127, 257, 'answer', '1'),
(128, 258, 'answer', '1'),
(129, 259, 'answer', '1'),
(130, 260, 'answer', '1'),
(131, 261, 'answer', '0'),
(132, 262, '-finish', '1'),
(133, 263, '-finish', '1'),
(134, 264, '-finish', '1'),
(135, 265, '-finish', '1'),
(136, 266, '-finish', '1'),
(137, 272, 'answer', '1'),
(138, 273, 'answer', '0'),
(139, 274, 'answer', '1'),
(140, 275, 'answer', '0'),
(141, 276, 'answer', '0'),
(142, 277, '-finish', '1'),
(143, 278, '-finish', '1'),
(144, 279, '-finish', '1'),
(145, 280, '-finish', '1'),
(146, 281, '-finish', '1'),
(147, 282, 'answer', '1'),
(148, 283, 'answer', '1'),
(149, 284, 'answer', '0'),
(150, 285, 'answer', '1'),
(151, 286, 'answer', '1'),
(152, 287, 'answer', '1'),
(153, 288, '-finish', '1'),
(154, 289, '-finish', '1'),
(155, 290, '-finish', '1'),
(156, 291, '-finish', '1'),
(157, 292, '-finish', '1'),
(158, 293, '-finish', '1'),
(159, 300, 'answer', '1'),
(160, 301, '-finish', '1'),
(161, 302, '-finish', '1'),
(162, 303, '-finish', '1'),
(163, 304, '-finish', '1'),
(164, 305, '-finish', '1'),
(165, 306, '-finish', '1'),
(166, 313, 'answer', '1'),
(167, 314, 'answer', '0'),
(168, 315, 'answer', '1'),
(169, 316, 'answer', '0'),
(170, 317, 'answer', '1'),
(171, 318, 'answer', '1'),
(172, 319, '-finish', '1'),
(173, 320, '-finish', '1'),
(174, 321, '-finish', '1'),
(175, 322, '-finish', '1'),
(176, 323, '-finish', '1'),
(177, 324, '-finish', '1'),
(178, 331, 'answer', '0'),
(179, 332, 'answer', '1'),
(180, 333, 'answer', '0'),
(181, 334, 'answer', '1'),
(182, 335, 'answer', '0'),
(183, 336, 'answer', '0'),
(184, 337, '-finish', '1'),
(185, 338, '-finish', '1'),
(186, 339, '-finish', '1'),
(187, 340, '-finish', '1'),
(188, 341, '-finish', '1'),
(189, 342, '-finish', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated`
--

CREATE TABLE `mdl_question_calculated` (
  `id` bigint NOT NULL,
  `question` bigint NOT NULL DEFAULT '0',
  `answer` bigint NOT NULL DEFAULT '0',
  `tolerance` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint NOT NULL DEFAULT '1',
  `correctanswerlength` bigint NOT NULL DEFAULT '2',
  `correctanswerformat` bigint NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Options for questions of type calculated' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated_options`
--

CREATE TABLE `mdl_question_calculated_options` (
  `id` bigint NOT NULL,
  `question` bigint NOT NULL DEFAULT '0',
  `synchronize` tinyint NOT NULL DEFAULT '0',
  `single` smallint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '0',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Options for questions of type calculated' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_categories`
--

CREATE TABLE `mdl_question_categories` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `contextid` bigint NOT NULL DEFAULT '0',
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `infoformat` tinyint NOT NULL DEFAULT '0',
  `stamp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `parent` bigint NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL DEFAULT '999',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Categories are for grouping questions' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_question_categories`
--

INSERT INTO `mdl_question_categories` (`id`, `name`, `contextid`, `info`, `infoformat`, `stamp`, `parent`, `sortorder`, `idnumber`) VALUES
(1, 'top', 43, '', 0, '175.111.182.35+211105054417+Af1anj', 0, 0, NULL),
(2, 'Default for test1', 43, 'The default category for questions shared in context \'test1\'.', 0, '175.111.182.35+211105054417+8UuCxc', 1, 999, NULL),
(3, 'top', 19, '', 0, '175.111.182.35+211105054418+CPdDs9', 0, 0, NULL),
(4, 'Default for test course', 19, 'The default category for questions shared in context \'test course\'.', 0, '175.111.182.35+211105054418+q0JIlK', 3, 999, NULL),
(5, 'top', 8, '', 0, '175.111.182.35+211105054418+k6X7BD', 0, 0, NULL),
(6, 'Default for Leadership', 8, 'The default category for questions shared in context \'Leadership\'.', 0, '175.111.182.35+211105054418+ceqU0h', 5, 999, NULL),
(7, 'top', 1, '', 0, '175.111.182.35+211105054418+DDmwXa', 0, 0, NULL),
(8, 'Default for System', 1, 'The default category for questions shared in context \'System\'.', 0, '175.111.182.35+211105054418+fXCCNG', 7, 999, NULL),
(9, 'top', 44, '', 0, '175.111.182.35+211105060917+QkofSc', 0, 0, NULL),
(10, 'Default for test2', 44, 'The default category for questions shared in context \'test2\'.', 0, '175.111.182.35+211105060917+plCtpi', 9, 999, NULL),
(11, 'top', 49, '', 0, '175.111.182.35+211105104619+DFSb5c', 0, 0, NULL),
(12, 'Default for test1', 49, 'The default category for questions shared in context \'test1\'.', 0, '175.111.182.35+211105104619+aHuYHC', 11, 999, NULL),
(13, 'top', 47, '', 0, '175.111.182.35+211105104620+IB47Do', 0, 0, NULL),
(14, 'Default for Leadership', 47, 'The default category for questions shared in context \'Leadership\'.', 0, '175.111.182.35+211105104620+BzmG5g', 13, 999, NULL),
(15, 'top', 50, '', 0, '175.111.182.35+211105111602+udcyi6', 0, 0, NULL),
(16, 'Default for Knowledge of Subject Area', 50, 'The default category for questions shared in context \'Knowledge of Subject Area\'.', 0, '175.111.182.35+211105111602+i5AYy8', 15, 999, NULL),
(17, 'top', 51, '', 0, '175.111.182.35+211105112843+krkzkX', 0, 0, NULL),
(18, 'Default for Classroom Management', 51, 'The default category for questions shared in context \'Classroom Management\'.', 0, '175.111.182.35+211105112843+aLddC1', 17, 999, NULL),
(19, 'top', 52, '', 0, '175.111.182.35+211105113721+gNSWcI', 0, 0, NULL),
(20, 'Default for Facilitation and Engagement', 52, 'The default category for questions shared in context \'Facilitation and Engagement\'.', 0, '175.111.182.35+211105113721+dOAEM3', 19, 999, NULL),
(21, 'top', 53, '', 0, '175.111.182.35+211105114217+EyqSk1', 0, 0, NULL),
(22, 'Default for Assessment And Coaching', 53, 'The default category for questions shared in context \'Assessment And Coaching\'.', 0, '175.111.182.35+211105114217+CpoYuE', 21, 999, NULL),
(23, 'top', 54, '', 0, '175.111.182.35+211105115003+9yAXrY', 0, 0, NULL),
(24, 'Default for CS', 54, 'The default category for questions shared in context \'CS\'.', 0, '175.111.182.35+211105115003+1Z7Qgm', 23, 999, NULL),
(25, 'top', 55, '', 0, '175.111.182.35+211105115426+V1vsqr', 0, 0, NULL),
(26, 'Default for PHP', 55, 'The default category for questions shared in context \'PHP\'.', 0, '175.111.182.35+211105115426+t2QYHd', 25, 999, NULL),
(27, 'top', 56, '', 0, '175.111.182.35+211108082454+D6K2En', 0, 0, NULL),
(28, 'Default for EE', 56, 'The default category for questions shared in context \'EE\'.', 0, '175.111.182.35+211108082454+pKDKzs', 27, 999, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_datasets`
--

CREATE TABLE `mdl_question_datasets` (
  `id` bigint NOT NULL,
  `question` bigint NOT NULL DEFAULT '0',
  `datasetdefinition` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Many-many relation between questions and dataset definitions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_definitions`
--

CREATE TABLE `mdl_question_dataset_definitions` (
  `id` bigint NOT NULL,
  `category` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `type` bigint NOT NULL DEFAULT '0',
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `itemcount` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Organises and stores properties for dataset items' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_items`
--

CREATE TABLE `mdl_question_dataset_items` (
  `id` bigint NOT NULL,
  `definition` bigint NOT NULL DEFAULT '0',
  `itemnumber` bigint NOT NULL DEFAULT '0',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Individual dataset items' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_ddwtos`
--

CREATE TABLE `mdl_question_ddwtos` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Defines drag and drop (words into sentences) questions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_gapselect`
--

CREATE TABLE `mdl_question_gapselect` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Defines select missing words questions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_hints`
--

CREATE TABLE `mdl_question_hints` (
  `id` bigint NOT NULL,
  `questionid` bigint NOT NULL,
  `hint` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hintformat` smallint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores the the part of the question definition that gives di' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multianswer`
--

CREATE TABLE `mdl_question_multianswer` (
  `id` bigint NOT NULL,
  `question` bigint NOT NULL DEFAULT '0',
  `sequence` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Options for multianswer questions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical`
--

CREATE TABLE `mdl_question_numerical` (
  `id` bigint NOT NULL,
  `question` bigint NOT NULL DEFAULT '0',
  `answer` bigint NOT NULL DEFAULT '0',
  `tolerance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Options for numerical questions.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_options`
--

CREATE TABLE `mdl_question_numerical_options` (
  `id` bigint NOT NULL,
  `question` bigint NOT NULL DEFAULT '0',
  `showunits` smallint NOT NULL DEFAULT '0',
  `unitsleft` smallint NOT NULL DEFAULT '0',
  `unitgradingtype` smallint NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Options for questions of type numerical This table is also u' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_units`
--

CREATE TABLE `mdl_question_numerical_units` (
  `id` bigint NOT NULL,
  `question` bigint NOT NULL DEFAULT '0',
  `multiplier` decimal(38,19) NOT NULL DEFAULT '1.0000000000000000000',
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Optional unit options for numerical questions. This table is' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_analysis`
--

CREATE TABLE `mdl_question_response_analysis` (
  `id` bigint NOT NULL,
  `hashcode` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `whichtries` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timemodified` bigint NOT NULL,
  `questionid` bigint NOT NULL,
  `variant` bigint DEFAULT NULL,
  `subqid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `credit` decimal(15,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Analysis of student responses given to questions.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_count`
--

CREATE TABLE `mdl_question_response_count` (
  `id` bigint NOT NULL,
  `analysisid` bigint NOT NULL,
  `try` bigint NOT NULL,
  `rcount` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Count for each responses for each try at a question.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_statistics`
--

CREATE TABLE `mdl_question_statistics` (
  `id` bigint NOT NULL,
  `hashcode` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timemodified` bigint NOT NULL,
  `questionid` bigint NOT NULL,
  `slot` bigint DEFAULT NULL,
  `subquestion` smallint NOT NULL,
  `variant` bigint DEFAULT NULL,
  `s` bigint NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Statistics for individual questions used in an activity.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_truefalse`
--

CREATE TABLE `mdl_question_truefalse` (
  `id` bigint NOT NULL,
  `question` bigint NOT NULL DEFAULT '0',
  `trueanswer` bigint NOT NULL DEFAULT '0',
  `falseanswer` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Options for True-False questions' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_question_truefalse`
--

INSERT INTO `mdl_question_truefalse` (`id`, `question`, `trueanswer`, `falseanswer`) VALUES
(1, 1, 1, 2),
(2, 2, 3, 4),
(3, 3, 5, 6),
(4, 4, 7, 8),
(5, 5, 9, 10),
(6, 6, 11, 12),
(7, 7, 13, 14),
(8, 8, 15, 16),
(9, 9, 17, 18),
(10, 10, 19, 20),
(11, 11, 21, 22),
(12, 12, 23, 24),
(13, 13, 25, 26),
(14, 14, 27, 28),
(15, 15, 29, 30),
(16, 16, 31, 32),
(17, 17, 33, 34),
(18, 18, 35, 36),
(19, 19, 37, 38),
(20, 20, 39, 40),
(21, 21, 41, 42),
(22, 22, 43, 44),
(23, 23, 45, 46),
(24, 24, 47, 48),
(25, 25, 49, 50),
(26, 26, 51, 52),
(27, 27, 53, 54),
(28, 28, 55, 56),
(29, 29, 57, 58),
(30, 30, 59, 60),
(31, 31, 61, 62),
(32, 32, 63, 64),
(33, 33, 65, 66),
(34, 34, 67, 68),
(35, 35, 69, 70),
(36, 36, 71, 72),
(37, 37, 73, 74),
(38, 38, 75, 76),
(39, 39, 77, 78),
(40, 40, 79, 80),
(41, 41, 81, 82),
(42, 42, 83, 84),
(43, 43, 85, 86),
(44, 44, 87, 88),
(45, 45, 89, 90),
(46, 46, 91, 92),
(47, 47, 93, 94);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_usages`
--

CREATE TABLE `mdl_question_usages` (
  `id` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table''s main purpose it to assign a unique id to each a' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_question_usages`
--

INSERT INTO `mdl_question_usages` (`id`, `contextid`, `component`, `preferredbehaviour`) VALUES
(2, 43, 'mod_quiz', 'deferredfeedback'),
(3, 44, 'mod_quiz', 'deferredfeedback'),
(4, 49, 'mod_quiz', 'deferredfeedback'),
(5, 50, 'mod_quiz', 'deferredfeedback'),
(6, 51, 'mod_quiz', 'deferredfeedback'),
(7, 54, 'mod_quiz', 'deferredfeedback'),
(8, 53, 'mod_quiz', 'deferredfeedback'),
(9, 49, 'mod_quiz', 'deferredfeedback'),
(10, 50, 'mod_quiz', 'deferredfeedback'),
(11, 50, 'mod_quiz', 'deferredfeedback'),
(12, 50, 'mod_quiz', 'deferredfeedback'),
(13, 43, 'mod_quiz', 'deferredfeedback'),
(14, 51, 'mod_quiz', 'deferredfeedback'),
(15, 53, 'mod_quiz', 'deferredfeedback'),
(16, 52, 'mod_quiz', 'deferredfeedback'),
(17, 55, 'mod_quiz', 'deferredfeedback'),
(18, 55, 'mod_quiz', 'deferredfeedback'),
(19, 49, 'mod_quiz', 'deferredfeedback'),
(20, 49, 'mod_quiz', 'deferredfeedback'),
(21, 49, 'mod_quiz', 'deferredfeedback'),
(22, 43, 'mod_quiz', 'deferredfeedback'),
(23, 43, 'mod_quiz', 'deferredfeedback'),
(24, 44, 'mod_quiz', 'deferredfeedback'),
(25, 44, 'mod_quiz', 'deferredfeedback'),
(26, 43, 'mod_quiz', 'deferredfeedback'),
(27, 43, 'mod_quiz', 'deferredfeedback'),
(28, 43, 'mod_quiz', 'deferredfeedback');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz`
--

CREATE TABLE `mdl_quiz` (
  `id` bigint NOT NULL,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `introformat` smallint NOT NULL DEFAULT '0',
  `timeopen` bigint NOT NULL DEFAULT '0',
  `timeclose` bigint NOT NULL DEFAULT '0',
  `timelimit` bigint NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `canredoquestions` smallint NOT NULL DEFAULT '0',
  `attempts` mediumint NOT NULL DEFAULT '0',
  `attemptonlast` smallint NOT NULL DEFAULT '0',
  `grademethod` smallint NOT NULL DEFAULT '1',
  `decimalpoints` smallint NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint NOT NULL DEFAULT '0',
  `reviewmarks` mediumint NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint NOT NULL DEFAULT '0',
  `questionsperpage` bigint NOT NULL DEFAULT '0',
  `navmethod` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'free',
  `shuffleanswers` smallint NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `delay1` bigint NOT NULL DEFAULT '0',
  `delay2` bigint NOT NULL DEFAULT '0',
  `showuserpicture` smallint NOT NULL DEFAULT '0',
  `showblocks` smallint NOT NULL DEFAULT '0',
  `completionattemptsexhausted` tinyint(1) DEFAULT '0',
  `completionpass` tinyint(1) DEFAULT '0',
  `completionminattempts` bigint NOT NULL DEFAULT '0',
  `allowofflineattempts` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The settings for each quiz.' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_quiz`
--

INSERT INTO `mdl_quiz` (`id`, `course`, `name`, `intro`, `introformat`, `timeopen`, `timeclose`, `timelimit`, `overduehandling`, `graceperiod`, `preferredbehaviour`, `canredoquestions`, `attempts`, `attemptonlast`, `grademethod`, `decimalpoints`, `questiondecimalpoints`, `reviewattempt`, `reviewcorrectness`, `reviewmarks`, `reviewspecificfeedback`, `reviewgeneralfeedback`, `reviewrightanswer`, `reviewoverallfeedback`, `questionsperpage`, `navmethod`, `shuffleanswers`, `sumgrades`, `grade`, `timecreated`, `timemodified`, `password`, `subnet`, `browsersecurity`, `delay1`, `delay2`, `showuserpicture`, `showblocks`, `completionattemptsexhausted`, `completionpass`, `completionminattempts`, `allowofflineattempts`) VALUES
(1, 4, 'test1', '<p dir=\"ltr\" style=\"text-align: left;\">Test1<br></p>', 1, 1636090920, 1667626920, 0, 'autosubmit', 0, 'deferredfeedback', 0, 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 'free', 1, '6.00000', '10.00000', 1636091036, 1636091036, '', '', '-', 0, 0, 0, 0, 0, 0, 0, 0),
(2, 4, 'test2', '<p dir=\"ltr\" style=\"text-align: left;\">test2<br></p>', 1, 1636092480, 1667628480, 0, 'autosubmit', 0, 'deferredfeedback', 0, 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 'free', 1, '5.00000', '10.00000', 1636092548, 1636092548, '', '', '-', 0, 0, 0, 0, 0, 0, 0, 0),
(3, 3, 'test1', '<p dir=\"ltr\" style=\"text-align: left;\">test1<br></p>', 1, 1636093440, 1667629440, 0, 'autosubmit', 0, 'deferredfeedback', 0, 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 'free', 1, '0.00000', '10.00000', 1636093645, 1636093645, '', '', '-', 0, 0, 0, 0, 0, 0, 0, 0),
(4, 5, 'quiz1', '<p dir=\"ltr\" style=\"text-align: left;\">test1<br></p>', 1, 1636109040, 1667645040, 0, 'autosubmit', 0, 'deferredfeedback', 0, 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 'free', 1, '6.00000', '10.00000', 1636109172, 1637656570, '', '', '-', 0, 0, 0, 0, 0, 0, 0, 0),
(5, 5, 'quiz2', '<p dir=\"ltr\" style=\"text-align: left;\">Knowledge of Subject Area<br></p>', 1, 1636110840, 1667646840, 0, 'autosubmit', 0, 'deferredfeedback', 0, 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 'free', 1, '6.00000', '10.00000', 1636110940, 1637656582, '', '', '-', 0, 0, 0, 0, 0, 0, 0, 0),
(6, 5, 'quiz3', '<p dir=\"ltr\" style=\"text-align: left;\">Classroom Management<br></p>', 1, 1636111620, 1667647620, 0, 'autosubmit', 0, 'deferredfeedback', 0, 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 'free', 1, '6.00000', '10.00000', 1636111719, 1637656590, '', '', '-', 0, 0, 0, 0, 0, 0, 0, 0),
(12, 4, 'test3', '<p dir=\"ltr\" style=\"text-align: left;\">test3<br></p>', 1, 1637820120, 1669356120, 0, 'autosubmit', 0, 'deferredfeedback', 0, 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 'free', 1, '0.00000', '10.00000', 1637820247, 1637820247, '', '', '-', 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quizaccess_seb_quizsettings`
--

CREATE TABLE `mdl_quizaccess_seb_quizsettings` (
  `id` bigint NOT NULL,
  `quizid` bigint NOT NULL,
  `cmid` bigint NOT NULL,
  `templateid` bigint NOT NULL,
  `requiresafeexambrowser` tinyint(1) NOT NULL,
  `showsebtaskbar` tinyint(1) DEFAULT NULL,
  `showwificontrol` tinyint(1) DEFAULT NULL,
  `showreloadbutton` tinyint(1) DEFAULT NULL,
  `showtime` tinyint(1) DEFAULT NULL,
  `showkeyboardlayout` tinyint(1) DEFAULT NULL,
  `allowuserquitseb` tinyint(1) DEFAULT NULL,
  `quitpassword` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `linkquitseb` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `userconfirmquit` tinyint(1) DEFAULT NULL,
  `enableaudiocontrol` tinyint(1) DEFAULT NULL,
  `muteonstartup` tinyint(1) DEFAULT NULL,
  `allowspellchecking` tinyint(1) DEFAULT NULL,
  `allowreloadinexam` tinyint(1) DEFAULT NULL,
  `activateurlfiltering` tinyint(1) DEFAULT NULL,
  `filterembeddedcontent` tinyint(1) DEFAULT NULL,
  `expressionsallowed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `regexallowed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `expressionsblocked` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `regexblocked` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `allowedbrowserexamkeys` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `showsebdownloadlink` tinyint(1) DEFAULT NULL,
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores the quiz level Safe Exam Browser configuration.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quizaccess_seb_template`
--

CREATE TABLE `mdl_quizaccess_seb_template` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `sortorder` bigint NOT NULL,
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Templates for Safe Exam Browser configuration.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_attempts`
--

CREATE TABLE `mdl_quiz_attempts` (
  `id` bigint NOT NULL,
  `quiz` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `attempt` mediumint NOT NULL DEFAULT '0',
  `uniqueid` bigint NOT NULL DEFAULT '0',
  `layout` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `currentpage` bigint NOT NULL DEFAULT '0',
  `preview` smallint NOT NULL DEFAULT '0',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'inprogress',
  `timestart` bigint NOT NULL DEFAULT '0',
  `timefinish` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `timemodifiedoffline` bigint NOT NULL DEFAULT '0',
  `timecheckstate` bigint DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores users attempts at quizzes.' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_quiz_attempts`
--

INSERT INTO `mdl_quiz_attempts` (`id`, `quiz`, `userid`, `attempt`, `uniqueid`, `layout`, `currentpage`, `preview`, `state`, `timestart`, `timefinish`, `timemodified`, `timemodifiedoffline`, `timecheckstate`, `sumgrades`) VALUES
(2, 1, 2, 1, 2, '1,0,2,0,3,0,4,0,5,0,6,0', 2, 1, 'inprogress', 1636092307, 0, 1636111044, 0, NULL, NULL),
(3, 2, 2, 1, 3, '1,0,2,0,3,0,4,0,5,0', 0, 1, 'inprogress', 1636111078, 0, 1636111078, 0, NULL, NULL),
(4, 4, 2, 1, 4, '1,0,2,0,3,0,4,0,5,0,6,0', 4, 1, 'inprogress', 1636111105, 0, 1636199627, 0, NULL, NULL),
(5, 5, 2, 1, 5, '1,0,2,0,3,0,4,0,5,0,6,0', 0, 1, 'inprogress', 1636188051, 0, 1636188051, 0, NULL, NULL),
(6, 6, 2, 1, 6, '1,0,2,0,3,0,4,0,5,0,6,0', 0, 1, 'inprogress', 1636188405, 0, 1636188405, 0, NULL, NULL),
(7, 9, 2, 1, 7, '1,0,2,0,3,0', 0, 1, 'inprogress', 1636188473, 0, 1636188473, 0, NULL, NULL),
(8, 8, 2, 1, 8, '1,0,2,0,3,0,4,0,5,0,6,0', 0, 1, 'inprogress', 1636188505, 0, 1636188505, 0, NULL, NULL),
(9, 4, 13, 1, 9, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1636190778, 1636368604, 1636368604, 0, NULL, '0.00000'),
(10, 5, 13, 1, 10, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1636200113, 1636200562, 1636200562, 0, NULL, '1.00000'),
(11, 5, 13, 2, 11, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1636200598, 1636200726, 1636200726, 0, NULL, '4.00000'),
(12, 5, 13, 3, 12, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1636200745, 1637908197, 1637908197, 0, NULL, '3.00000'),
(13, 1, 13, 1, 13, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1636200776, 1636200868, 1636200868, 0, NULL, '3.00000'),
(14, 6, 13, 1, 14, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1636200949, 1637908288, 1637908288, 0, NULL, '4.00000'),
(15, 8, 13, 1, 15, '1,0,2,0,3,0,4,0,5,0,6,0', 0, 0, 'inprogress', 1636201059, 0, 1636201059, 0, 1667648460, NULL),
(16, 7, 13, 1, 16, '1,0,2,0,3,0,4,0,5,0', 0, 0, 'inprogress', 1636201794, 0, 1636201794, 0, 1667648100, NULL),
(17, 10, 13, 1, 17, '1,0,2,0', 1, 0, 'finished', 1636367741, 1636368162, 1636368162, 0, NULL, '1.00000'),
(18, 10, 13, 2, 18, '1,0,2,0', 0, 0, 'inprogress', 1636368181, 0, 1636368181, 0, 1667649180, NULL),
(19, 4, 13, 2, 19, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1637125647, 1637125702, 1637125702, 0, NULL, '1.00000'),
(20, 4, 13, 3, 20, '1,0,2,0,3,0,4,0,5,0,6,0', 0, 0, 'finished', 1637749293, 1637749333, 1637749333, 0, NULL, '0.00000'),
(21, 4, 13, 4, 21, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1637908049, 1637908087, 1637908087, 0, NULL, '4.00000'),
(22, 1, 13, 2, 22, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1638170601, 1638170729, 1638170729, 0, NULL, '3.00000'),
(23, 1, 13, 3, 23, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1638171179, 1638185171, 1638185171, 0, NULL, '2.00000'),
(24, 2, 13, 1, 24, '1,0,2,0,3,0,4,0,5,0', 4, 0, 'finished', 1638171205, 1638171249, 1638171249, 0, NULL, '3.00000'),
(25, 2, 13, 2, 25, '1,0,2,0,3,0,4,0,5,0', 4, 0, 'finished', 1638171408, 1638171443, 1638171443, 0, NULL, '5.00000'),
(26, 1, 13, 4, 26, '1,0,2,0,3,0,4,0,5,0,6,0', 1, 0, 'finished', 1638185402, 1638185451, 1638185451, 0, NULL, '0.00000'),
(27, 1, 13, 5, 27, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1638185562, 1638185597, 1638185597, 0, NULL, '1.00000'),
(28, 1, 13, 6, 28, '1,0,2,0,3,0,4,0,5,0,6,0', 5, 0, 'finished', 1638185632, 1638185670, 1638185670, 0, NULL, '5.00000');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_feedback`
--

CREATE TABLE `mdl_quiz_feedback` (
  `id` bigint NOT NULL,
  `quizid` bigint NOT NULL DEFAULT '0',
  `feedbacktext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `feedbacktextformat` tinyint NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Feedback given to students based on which grade band their o' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_quiz_feedback`
--

INSERT INTO `mdl_quiz_feedback` (`id`, `quizid`, `feedbacktext`, `feedbacktextformat`, `mingrade`, `maxgrade`) VALUES
(1, 1, '', 1, '0.00000', '11.00000'),
(2, 2, '', 1, '0.00000', '11.00000'),
(3, 3, '', 1, '0.00000', '11.00000'),
(4, 4, '', 1, '0.00000', '11.00000'),
(5, 5, '', 1, '0.00000', '11.00000'),
(6, 6, '', 1, '0.00000', '11.00000'),
(7, 7, '', 1, '0.00000', '11.00000'),
(8, 8, '', 1, '0.00000', '11.00000'),
(9, 9, '', 1, '0.00000', '11.00000'),
(10, 10, '', 1, '0.00000', '11.00000'),
(11, 11, '', 1, '0.00000', '11.00000'),
(12, 12, '', 1, '0.00000', '11.00000');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_grades`
--

CREATE TABLE `mdl_quiz_grades` (
  `id` bigint NOT NULL,
  `quiz` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores the overall grade for each user on the quiz, based on' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_quiz_grades`
--

INSERT INTO `mdl_quiz_grades` (`id`, `quiz`, `userid`, `grade`, `timemodified`) VALUES
(1, 5, 13, '4.00000', 1637908197),
(4, 4, 13, '6.00000', 1637908087),
(5, 6, 13, '8.00000', 1637908288),
(7, 1, 13, '8.33333', 1638185670);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_marks`
--

CREATE TABLE `mdl_quiz_marks` (
  `id` int NOT NULL,
  `proficiency_level_id` int NOT NULL,
  `marks` int NOT NULL,
  `deleted` enum('1','0') NOT NULL DEFAULT '1',
  `modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mdl_quiz_marks`
--

INSERT INTO `mdl_quiz_marks` (`id`, `proficiency_level_id`, `marks`, `deleted`, `modify`) VALUES
(1, 2, 40, '1', '2021-11-26 10:38:15'),
(2, 3, 60, '1', '2021-11-26 10:38:15'),
(3, 4, 80, '1', '2021-11-26 10:38:15'),
(4, 5, 100, '1', '2021-11-26 10:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overrides`
--

CREATE TABLE `mdl_quiz_overrides` (
  `id` bigint NOT NULL,
  `quiz` bigint NOT NULL DEFAULT '0',
  `groupid` bigint DEFAULT NULL,
  `userid` bigint DEFAULT NULL,
  `timeopen` bigint DEFAULT NULL,
  `timeclose` bigint DEFAULT NULL,
  `timelimit` bigint DEFAULT NULL,
  `attempts` mediumint DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The overrides to quiz settings on a per-user and per-group b' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

CREATE TABLE `mdl_quiz_overview_regrades` (
  `id` bigint NOT NULL,
  `questionusageid` bigint NOT NULL,
  `slot` bigint NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint NOT NULL,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table records which question attempts need regrading an' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_reports`
--

CREATE TABLE `mdl_quiz_reports` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `displayorder` bigint NOT NULL,
  `capability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lists all the installed quiz reports and their display order' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'grading', 6000, 'mod/quiz:grade'),
(2, 'overview', 10000, NULL),
(3, 'responses', 9000, NULL),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_sections`
--

CREATE TABLE `mdl_quiz_sections` (
  `id` bigint NOT NULL,
  `quizid` bigint NOT NULL,
  `firstslot` bigint NOT NULL,
  `heading` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shufflequestions` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores sections of a quiz with section name (heading), from ' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_quiz_sections`
--

INSERT INTO `mdl_quiz_sections` (`id`, `quizid`, `firstslot`, `heading`, `shufflequestions`) VALUES
(1, 1, 1, '', 0),
(2, 2, 1, '', 0),
(3, 3, 1, '', 0),
(4, 4, 1, '', 0),
(5, 5, 1, '', 0),
(6, 6, 1, '', 0),
(7, 7, 1, '', 0),
(8, 8, 1, '', 0),
(9, 9, 1, '', 0),
(10, 10, 1, '', 0),
(11, 11, 1, '', 0),
(12, 12, 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_slots`
--

CREATE TABLE `mdl_quiz_slots` (
  `id` bigint NOT NULL,
  `slot` bigint NOT NULL,
  `quizid` bigint NOT NULL DEFAULT '0',
  `page` bigint NOT NULL,
  `requireprevious` smallint NOT NULL DEFAULT '0',
  `questionid` bigint NOT NULL DEFAULT '0',
  `questioncategoryid` bigint DEFAULT NULL,
  `includingsubcategories` smallint DEFAULT NULL,
  `maxmark` decimal(12,7) NOT NULL DEFAULT '0.0000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores the question used in a quiz, with the order, and for ' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_quiz_slots`
--

INSERT INTO `mdl_quiz_slots` (`id`, `slot`, `quizid`, `page`, `requireprevious`, `questionid`, `questioncategoryid`, `includingsubcategories`, `maxmark`) VALUES
(1, 1, 1, 1, 0, 1, NULL, NULL, '1.0000000'),
(2, 2, 1, 2, 0, 2, NULL, NULL, '1.0000000'),
(3, 3, 1, 3, 0, 3, NULL, NULL, '1.0000000'),
(4, 4, 1, 4, 0, 4, NULL, NULL, '1.0000000'),
(5, 5, 1, 5, 0, 5, NULL, NULL, '1.0000000'),
(6, 6, 1, 6, 0, 6, NULL, NULL, '1.0000000'),
(7, 1, 2, 1, 0, 7, NULL, NULL, '1.0000000'),
(8, 2, 2, 2, 0, 8, NULL, NULL, '1.0000000'),
(9, 3, 2, 3, 0, 9, NULL, NULL, '1.0000000'),
(10, 4, 2, 4, 0, 10, NULL, NULL, '1.0000000'),
(11, 5, 2, 5, 0, 11, NULL, NULL, '1.0000000'),
(12, 1, 4, 1, 0, 12, NULL, NULL, '1.0000000'),
(13, 2, 4, 2, 0, 13, NULL, NULL, '1.0000000'),
(14, 3, 4, 3, 0, 14, NULL, NULL, '1.0000000'),
(15, 4, 4, 4, 0, 15, NULL, NULL, '1.0000000'),
(16, 5, 4, 5, 0, 16, NULL, NULL, '1.0000000'),
(17, 6, 4, 6, 0, 17, NULL, NULL, '1.0000000'),
(18, 1, 5, 1, 0, 18, NULL, NULL, '1.0000000'),
(19, 2, 5, 2, 0, 19, NULL, NULL, '1.0000000'),
(20, 3, 5, 3, 0, 20, NULL, NULL, '1.0000000'),
(21, 4, 5, 4, 0, 21, NULL, NULL, '1.0000000'),
(22, 5, 5, 5, 0, 22, NULL, NULL, '1.0000000'),
(23, 6, 5, 6, 0, 23, NULL, NULL, '1.0000000'),
(24, 1, 6, 1, 0, 24, NULL, NULL, '1.0000000'),
(25, 2, 6, 2, 0, 25, NULL, NULL, '1.0000000'),
(26, 3, 6, 3, 0, 26, NULL, NULL, '1.0000000'),
(27, 4, 6, 4, 0, 27, NULL, NULL, '1.0000000'),
(28, 5, 6, 5, 0, 28, NULL, NULL, '1.0000000'),
(29, 6, 6, 6, 0, 29, NULL, NULL, '1.0000000'),
(30, 1, 7, 1, 0, 30, NULL, NULL, '1.0000000'),
(31, 2, 7, 2, 0, 31, NULL, NULL, '1.0000000'),
(32, 3, 7, 3, 0, 32, NULL, NULL, '1.0000000'),
(33, 4, 7, 4, 0, 33, NULL, NULL, '1.0000000'),
(34, 5, 7, 5, 0, 34, NULL, NULL, '1.0000000'),
(35, 1, 8, 1, 0, 35, NULL, NULL, '1.0000000'),
(36, 2, 8, 2, 0, 36, NULL, NULL, '1.0000000'),
(37, 3, 8, 3, 0, 37, NULL, NULL, '1.0000000'),
(38, 4, 8, 4, 0, 38, NULL, NULL, '1.0000000'),
(39, 5, 8, 5, 0, 39, NULL, NULL, '1.0000000'),
(40, 6, 8, 6, 0, 40, NULL, NULL, '1.0000000'),
(41, 1, 9, 1, 0, 41, NULL, NULL, '1.0000000'),
(42, 2, 9, 2, 0, 42, NULL, NULL, '1.0000000'),
(43, 3, 9, 3, 0, 43, NULL, NULL, '1.0000000'),
(44, 1, 11, 1, 0, 44, NULL, NULL, '1.0000000'),
(45, 2, 11, 2, 0, 45, NULL, NULL, '1.0000000'),
(46, 1, 10, 1, 0, 46, NULL, NULL, '1.0000000'),
(47, 2, 10, 2, 0, 47, NULL, NULL, '1.0000000');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_slot_tags`
--

CREATE TABLE `mdl_quiz_slot_tags` (
  `id` bigint NOT NULL,
  `slotid` bigint DEFAULT NULL,
  `tagid` bigint DEFAULT NULL,
  `tagname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores data about the tags that a question must have so that' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_statistics`
--

CREATE TABLE `mdl_quiz_statistics` (
  `id` bigint NOT NULL,
  `hashcode` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `whichattempts` smallint NOT NULL,
  `timemodified` bigint NOT NULL,
  `firstattemptscount` bigint NOT NULL,
  `highestattemptscount` bigint NOT NULL,
  `lastattemptscount` bigint NOT NULL,
  `allattemptscount` bigint NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='table to cache results from analysis done in statistics repo' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_rating`
--

CREATE TABLE `mdl_rating` (
  `id` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `scaleid` bigint NOT NULL,
  `rating` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='moodle ratings' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_registration_hubs`
--

CREATE TABLE `mdl_registration_hubs` (
  `id` bigint NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='hub where the site is registered on with their associated to' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository`
--

CREATE TABLE `mdl_repository` (
  `id` bigint NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table contains one entry for every configured external ' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'areafiles', 1, 1),
(2, 'contentbank', 1, 2),
(3, 'local', 1, 3),
(4, 'recent', 1, 4),
(5, 'upload', 1, 5),
(6, 'url', 1, 6),
(7, 'user', 1, 7),
(8, 'wikimedia', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instances`
--

CREATE TABLE `mdl_repository_instances` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `typeid` bigint NOT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `contextid` bigint NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table contains one entry for every configured external ' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1634825285, 1634825285, 0),
(2, '', 2, 0, 1, NULL, NULL, 1634825289, 1634825289, 0),
(3, '', 3, 0, 1, NULL, NULL, 1634825310, 1634825310, 0),
(4, '', 4, 0, 1, NULL, NULL, 1634825321, 1634825321, 0),
(5, '', 5, 0, 1, NULL, NULL, 1634825326, 1634825326, 0),
(6, '', 6, 0, 1, NULL, NULL, 1634825329, 1634825329, 0),
(7, '', 7, 0, 1, NULL, NULL, 1634825332, 1634825332, 0),
(8, '', 8, 0, 1, NULL, NULL, 1634825337, 1634825337, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instance_config`
--

CREATE TABLE `mdl_repository_instance_config` (
  `id` bigint NOT NULL,
  `instanceid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The config for intances' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_onedrive_access`
--

CREATE TABLE `mdl_repository_onedrive_access` (
  `id` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `permissionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `itemid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='List of temporary access grants.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource`
--

CREATE TABLE `mdl_resource` (
  `id` bigint NOT NULL,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `tobemigrated` smallint NOT NULL DEFAULT '0',
  `legacyfiles` smallint NOT NULL DEFAULT '0',
  `legacyfileslast` bigint DEFAULT NULL,
  `display` smallint NOT NULL DEFAULT '0',
  `displayoptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `filterfiles` smallint NOT NULL DEFAULT '0',
  `revision` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Each record is one resource and its config data' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource_old`
--

CREATE TABLE `mdl_resource_old` (
  `id` bigint NOT NULL,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `alltext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `popup` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `oldid` bigint NOT NULL,
  `cmid` bigint DEFAULT NULL,
  `newmodule` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `newid` bigint DEFAULT NULL,
  `migrated` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='backup of all old resource instances from 1.9' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role`
--

CREATE TABLE `mdl_role` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sortorder` bigint NOT NULL DEFAULT '0',
  `archetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='moodle roles' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, '', 'manager', '', 1, 'manager'),
(2, '', 'coursecreator', '', 2, 'coursecreator'),
(3, '', 'editingteacher', '', 3, 'editingteacher'),
(4, '', 'teacher', '', 4, 'teacher'),
(5, '', 'student', '', 5, 'student'),
(6, '', 'guest', '', 6, 'guest'),
(7, '', 'user', '', 7, 'user'),
(8, '', 'frontpage', '', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_assign`
--

CREATE TABLE `mdl_role_allow_assign` (
  `id` bigint NOT NULL,
  `roleid` bigint NOT NULL DEFAULT '0',
  `allowassign` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='this defines what role can assign what role' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_override`
--

CREATE TABLE `mdl_role_allow_override` (
  `id` bigint NOT NULL,
  `roleid` bigint NOT NULL DEFAULT '0',
  `allowoverride` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='this defines what role can override what role' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_switch`
--

CREATE TABLE `mdl_role_allow_switch` (
  `id` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  `allowswitch` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table stores which which other roles a user is allowed ' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_view`
--

CREATE TABLE `mdl_role_allow_view` (
  `id` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  `allowview` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table stores which which other roles a user is allowed ' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_role_allow_view`
--

INSERT INTO `mdl_role_allow_view` (`id`, `roleid`, `allowview`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 2, 2),
(10, 2, 3),
(11, 2, 4),
(12, 2, 5),
(13, 3, 2),
(14, 3, 3),
(15, 3, 4),
(16, 3, 5),
(17, 4, 2),
(18, 4, 3),
(19, 4, 4),
(20, 4, 5),
(21, 5, 2),
(22, 5, 3),
(23, 5, 4),
(24, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_assignments`
--

CREATE TABLE `mdl_role_assignments` (
  `id` bigint NOT NULL,
  `roleid` bigint NOT NULL DEFAULT '0',
  `contextid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `modifierid` bigint NOT NULL DEFAULT '0',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='assigning roles in different context' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_role_assignments`
--

INSERT INTO `mdl_role_assignments` (`id`, `roleid`, `contextid`, `userid`, `timemodified`, `modifierid`, `component`, `itemid`, `sortorder`) VALUES
(1, 5, 10, 3, 1634985157, 2, '', 0, 0),
(2, 3, 10, 4, 1634985714, 2, '', 0, 0),
(8, 5, 19, 13, 1638169934, 13, '', 0, 0),
(9, 5, 47, 13, 1638169982, 13, '', 0, 0),
(10, 5, 16, 13, 1638339848, 2, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_capabilities`
--

CREATE TABLE `mdl_role_capabilities` (
  `id` bigint NOT NULL,
  `contextid` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `capability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `permission` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `modifierid` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='permission has to be signed, overriding a capability for a p' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:configview', 1, 1634823252, 0),
(2, 1, 2, 'moodle/site:configview', 1, 1634823253, 0),
(3, 1, 1, 'moodle/site:readallmessages', 1, 1634823253, 0),
(4, 1, 3, 'moodle/site:readallmessages', 1, 1634823253, 0),
(5, 1, 1, 'moodle/site:manageallmessaging', 1, 1634823253, 0),
(6, 1, 1, 'moodle/site:deleteanymessage', 1, 1634823254, 0),
(7, 1, 1, 'moodle/site:sendmessage', 1, 1634823254, 0),
(8, 1, 7, 'moodle/site:sendmessage', 1, 1634823255, 0),
(9, 1, 7, 'moodle/site:senderrormessage', 1, 1634823255, 0),
(10, 1, 7, 'moodle/site:deleteownmessage', 1, 1634823255, 0),
(11, 1, 1, 'moodle/site:approvecourse', 1, 1634823256, 0),
(12, 1, 3, 'moodle/backup:backupcourse', 1, 1634823256, 0),
(13, 1, 1, 'moodle/backup:backupcourse', 1, 1634823256, 0),
(14, 1, 3, 'moodle/backup:backupsection', 1, 1634823257, 0),
(15, 1, 1, 'moodle/backup:backupsection', 1, 1634823257, 0),
(16, 1, 3, 'moodle/backup:backupactivity', 1, 1634823257, 0),
(17, 1, 1, 'moodle/backup:backupactivity', 1, 1634823257, 0),
(18, 1, 3, 'moodle/backup:backuptargetimport', 1, 1634823258, 0),
(19, 1, 1, 'moodle/backup:backuptargetimport', 1, 1634823258, 0),
(20, 1, 3, 'moodle/backup:downloadfile', 1, 1634823258, 0),
(21, 1, 1, 'moodle/backup:downloadfile', 1, 1634823258, 0),
(22, 1, 3, 'moodle/backup:configure', 1, 1634823259, 0),
(23, 1, 1, 'moodle/backup:configure', 1, 1634823259, 0),
(24, 1, 1, 'moodle/backup:userinfo', 1, 1634823259, 0),
(25, 1, 1, 'moodle/backup:anonymise', 1, 1634823260, 0),
(26, 1, 3, 'moodle/restore:restorecourse', 1, 1634823260, 0),
(27, 1, 1, 'moodle/restore:restorecourse', 1, 1634823260, 0),
(28, 1, 3, 'moodle/restore:restoresection', 1, 1634823260, 0),
(29, 1, 1, 'moodle/restore:restoresection', 1, 1634823261, 0),
(30, 1, 3, 'moodle/restore:restoreactivity', 1, 1634823261, 0),
(31, 1, 1, 'moodle/restore:restoreactivity', 1, 1634823261, 0),
(32, 1, 3, 'moodle/restore:viewautomatedfilearea', 1, 1634823261, 0),
(33, 1, 1, 'moodle/restore:viewautomatedfilearea', 1, 1634823262, 0),
(34, 1, 3, 'moodle/restore:restoretargetimport', 1, 1634823262, 0),
(35, 1, 1, 'moodle/restore:restoretargetimport', 1, 1634823262, 0),
(36, 1, 3, 'moodle/restore:uploadfile', 1, 1634823263, 0),
(37, 1, 1, 'moodle/restore:uploadfile', 1, 1634823263, 0),
(38, 1, 3, 'moodle/restore:configure', 1, 1634823263, 0),
(39, 1, 1, 'moodle/restore:configure', 1, 1634823263, 0),
(40, 1, 2, 'moodle/restore:rolldates', 1, 1634823264, 0),
(41, 1, 1, 'moodle/restore:rolldates', 1, 1634823264, 0),
(42, 1, 1, 'moodle/restore:userinfo', 1, 1634823265, 0),
(43, 1, 1, 'moodle/restore:createuser', 1, 1634823265, 0),
(44, 1, 3, 'moodle/site:manageblocks', 1, 1634823266, 0),
(45, 1, 1, 'moodle/site:manageblocks', 1, 1634823266, 0),
(46, 1, 3, 'moodle/site:accessallgroups', 1, 1634823266, 0),
(47, 1, 1, 'moodle/site:accessallgroups', 1, 1634823267, 0),
(48, 1, 1, 'moodle/site:viewanonymousevents', 1, 1634823267, 0),
(49, 1, 4, 'moodle/site:viewfullnames', 1, 1634823267, 0),
(50, 1, 3, 'moodle/site:viewfullnames', 1, 1634823268, 0),
(51, 1, 1, 'moodle/site:viewfullnames', 1, 1634823268, 0),
(52, 1, 4, 'moodle/site:viewuseridentity', 1, 1634823268, 0),
(53, 1, 3, 'moodle/site:viewuseridentity', 1, 1634823268, 0),
(54, 1, 1, 'moodle/site:viewuseridentity', 1, 1634823269, 0),
(55, 1, 4, 'moodle/site:viewreports', 1, 1634823269, 0),
(56, 1, 3, 'moodle/site:viewreports', 1, 1634823269, 0),
(57, 1, 1, 'moodle/site:viewreports', 1, 1634823269, 0),
(58, 1, 3, 'moodle/site:trustcontent', 1, 1634823270, 0),
(59, 1, 1, 'moodle/site:trustcontent', 1, 1634823270, 0),
(60, 1, 1, 'moodle/site:uploadusers', 1, 1634823271, 0),
(61, 1, 3, 'moodle/filter:manage', 1, 1634823271, 0),
(62, 1, 1, 'moodle/filter:manage', 1, 1634823271, 0),
(63, 1, 1, 'moodle/user:create', 1, 1634823272, 0),
(64, 1, 1, 'moodle/user:delete', 1, 1634823272, 0),
(65, 1, 1, 'moodle/user:update', 1, 1634823273, 0),
(66, 1, 6, 'moodle/user:viewdetails', 1, 1634823273, 0),
(67, 1, 5, 'moodle/user:viewdetails', 1, 1634823273, 0),
(68, 1, 4, 'moodle/user:viewdetails', 1, 1634823274, 0),
(69, 1, 3, 'moodle/user:viewdetails', 1, 1634823274, 0),
(70, 1, 1, 'moodle/user:viewdetails', 1, 1634823274, 0),
(71, 1, 1, 'moodle/user:viewalldetails', 1, 1634823274, 0),
(72, 1, 1, 'moodle/user:viewlastip', 1, 1634823275, 0),
(73, 1, 4, 'moodle/user:viewhiddendetails', 1, 1634823275, 0),
(74, 1, 3, 'moodle/user:viewhiddendetails', 1, 1634823275, 0),
(75, 1, 1, 'moodle/user:viewhiddendetails', 1, 1634823275, 0),
(76, 1, 1, 'moodle/user:loginas', 1, 1634823276, 0),
(77, 1, 1, 'moodle/user:managesyspages', 1, 1634823276, 0),
(78, 1, 7, 'moodle/user:manageownblocks', 1, 1634823277, 0),
(79, 1, 7, 'moodle/user:manageownfiles', 1, 1634823277, 0),
(80, 1, 1, 'moodle/my:configsyspages', 1, 1634823278, 0),
(81, 1, 3, 'moodle/role:assign', 1, 1634823278, 0),
(82, 1, 1, 'moodle/role:assign', 1, 1634823278, 0),
(83, 1, 4, 'moodle/role:review', 1, 1634823279, 0),
(84, 1, 3, 'moodle/role:review', 1, 1634823279, 0),
(85, 1, 1, 'moodle/role:review', 1, 1634823279, 0),
(86, 1, 1, 'moodle/role:override', 1, 1634823279, 0),
(87, 1, 3, 'moodle/role:safeoverride', 1, 1634823280, 0),
(88, 1, 1, 'moodle/role:manage', 1, 1634823280, 0),
(89, 1, 3, 'moodle/role:switchroles', 1, 1634823281, 0),
(90, 1, 1, 'moodle/role:switchroles', 1, 1634823281, 0),
(91, 1, 1, 'moodle/category:manage', 1, 1634823281, 0),
(92, 1, 6, 'moodle/category:viewcourselist', 1, 1634823281, 0),
(93, 1, 7, 'moodle/category:viewcourselist', 1, 1634823282, 0),
(94, 1, 2, 'moodle/category:viewhiddencategories', 1, 1634823282, 0),
(95, 1, 1, 'moodle/category:viewhiddencategories', 1, 1634823282, 0),
(96, 1, 1, 'moodle/cohort:manage', 1, 1634823282, 0),
(97, 1, 1, 'moodle/cohort:assign', 1, 1634823283, 0),
(98, 1, 3, 'moodle/cohort:view', 1, 1634823283, 0),
(99, 1, 1, 'moodle/cohort:view', 1, 1634823284, 0),
(100, 1, 2, 'moodle/course:create', 1, 1634823284, 0),
(101, 1, 1, 'moodle/course:create', 1, 1634823284, 0),
(102, 1, 3, 'moodle/course:creategroupconversations', 1, 1634823285, 0),
(103, 1, 1, 'moodle/course:creategroupconversations', 1, 1634823285, 0),
(104, 1, 1, 'moodle/course:delete', 1, 1634823285, 0),
(105, 1, 3, 'moodle/course:update', 1, 1634823286, 0),
(106, 1, 1, 'moodle/course:update', 1, 1634823286, 0),
(107, 1, 1, 'moodle/course:view', 1, 1634823287, 0),
(108, 1, 3, 'moodle/course:enrolreview', 1, 1634823287, 0),
(109, 1, 1, 'moodle/course:enrolreview', 1, 1634823287, 0),
(110, 1, 3, 'moodle/course:enrolconfig', 1, 1634823288, 0),
(111, 1, 1, 'moodle/course:enrolconfig', 1, 1634823288, 0),
(112, 1, 3, 'moodle/course:reviewotherusers', 1, 1634823289, 0),
(113, 1, 1, 'moodle/course:reviewotherusers', 1, 1634823289, 0),
(114, 1, 4, 'moodle/course:bulkmessaging', 1, 1634823289, 0),
(115, 1, 3, 'moodle/course:bulkmessaging', 1, 1634823289, 0),
(116, 1, 1, 'moodle/course:bulkmessaging', 1, 1634823290, 0),
(117, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1634823290, 0),
(118, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1634823290, 0),
(119, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1634823291, 0),
(120, 1, 2, 'moodle/course:viewhiddencourses', 1, 1634823291, 0),
(121, 1, 4, 'moodle/course:viewhiddencourses', 1, 1634823291, 0),
(122, 1, 3, 'moodle/course:viewhiddencourses', 1, 1634823291, 0),
(123, 1, 1, 'moodle/course:viewhiddencourses', 1, 1634823292, 0),
(124, 1, 3, 'moodle/course:visibility', 1, 1634823292, 0),
(125, 1, 1, 'moodle/course:visibility', 1, 1634823292, 0),
(126, 1, 3, 'moodle/course:managefiles', 1, 1634823293, 0),
(127, 1, 1, 'moodle/course:managefiles', 1, 1634823293, 0),
(128, 1, 1, 'moodle/course:ignoreavailabilityrestrictions', 1, 1634823293, 0),
(129, 1, 2, 'moodle/course:ignoreavailabilityrestrictions', 1, 1634823293, 0),
(130, 1, 3, 'moodle/course:ignoreavailabilityrestrictions', 1, 1634823293, 0),
(131, 1, 4, 'moodle/course:ignoreavailabilityrestrictions', 1, 1634823294, 0),
(132, 1, 3, 'moodle/course:manageactivities', 1, 1634823294, 0),
(133, 1, 1, 'moodle/course:manageactivities', 1, 1634823295, 0),
(134, 1, 3, 'moodle/course:activityvisibility', 1, 1634823295, 0),
(135, 1, 1, 'moodle/course:activityvisibility', 1, 1634823295, 0),
(136, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1634823295, 0),
(137, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1634823296, 0),
(138, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1634823296, 0),
(139, 1, 5, 'moodle/course:viewparticipants', 1, 1634823296, 0),
(140, 1, 4, 'moodle/course:viewparticipants', 1, 1634823296, 0),
(141, 1, 3, 'moodle/course:viewparticipants', 1, 1634823297, 0),
(142, 1, 1, 'moodle/course:viewparticipants', 1, 1634823297, 0),
(143, 1, 3, 'moodle/course:changefullname', 1, 1634823297, 0),
(144, 1, 1, 'moodle/course:changefullname', 1, 1634823297, 0),
(145, 1, 3, 'moodle/course:changeshortname', 1, 1634823298, 0),
(146, 1, 1, 'moodle/course:changeshortname', 1, 1634823298, 0),
(147, 1, 1, 'moodle/course:changelockedcustomfields', 1, 1634823298, 0),
(148, 1, 3, 'moodle/course:renameroles', 1, 1634823299, 0),
(149, 1, 1, 'moodle/course:renameroles', 1, 1634823299, 0),
(150, 1, 3, 'moodle/course:changeidnumber', 1, 1634823299, 0),
(151, 1, 1, 'moodle/course:changeidnumber', 1, 1634823300, 0),
(152, 1, 3, 'moodle/course:changecategory', 1, 1634823300, 0),
(153, 1, 1, 'moodle/course:changecategory', 1, 1634823300, 0),
(154, 1, 3, 'moodle/course:changesummary', 1, 1634823301, 0),
(155, 1, 1, 'moodle/course:changesummary', 1, 1634823301, 0),
(156, 1, 3, 'moodle/course:setforcedlanguage', 1, 1634823301, 0),
(157, 1, 1, 'moodle/course:setforcedlanguage', 1, 1634823302, 0),
(158, 1, 1, 'moodle/site:viewparticipants', 1, 1634823302, 0),
(159, 1, 5, 'moodle/course:isincompletionreports', 1, 1634823302, 0),
(160, 1, 5, 'moodle/course:viewscales', 1, 1634823303, 0),
(161, 1, 4, 'moodle/course:viewscales', 1, 1634823303, 0),
(162, 1, 3, 'moodle/course:viewscales', 1, 1634823303, 0),
(163, 1, 1, 'moodle/course:viewscales', 1, 1634823303, 0),
(164, 1, 3, 'moodle/course:managescales', 1, 1634823304, 0),
(165, 1, 1, 'moodle/course:managescales', 1, 1634823304, 0),
(166, 1, 3, 'moodle/course:managegroups', 1, 1634823304, 0),
(167, 1, 1, 'moodle/course:managegroups', 1, 1634823305, 0),
(168, 1, 3, 'moodle/course:reset', 1, 1634823305, 0),
(169, 1, 1, 'moodle/course:reset', 1, 1634823305, 0),
(170, 1, 3, 'moodle/course:viewsuspendedusers', 1, 1634823306, 0),
(171, 1, 1, 'moodle/course:viewsuspendedusers', 1, 1634823306, 0),
(172, 1, 1, 'moodle/course:tag', 1, 1634823307, 0),
(173, 1, 3, 'moodle/course:tag', 1, 1634823307, 0),
(174, 1, 6, 'moodle/blog:view', 1, 1634823308, 0),
(175, 1, 7, 'moodle/blog:view', 1, 1634823308, 0),
(176, 1, 5, 'moodle/blog:view', 1, 1634823308, 0),
(177, 1, 4, 'moodle/blog:view', 1, 1634823308, 0),
(178, 1, 3, 'moodle/blog:view', 1, 1634823308, 0),
(179, 1, 1, 'moodle/blog:view', 1, 1634823309, 0),
(180, 1, 6, 'moodle/blog:search', 1, 1634823309, 0),
(181, 1, 7, 'moodle/blog:search', 1, 1634823309, 0),
(182, 1, 5, 'moodle/blog:search', 1, 1634823310, 0),
(183, 1, 4, 'moodle/blog:search', 1, 1634823310, 0),
(184, 1, 3, 'moodle/blog:search', 1, 1634823310, 0),
(185, 1, 1, 'moodle/blog:search', 1, 1634823310, 0),
(186, 1, 1, 'moodle/blog:viewdrafts', 1, 1634823311, 0),
(187, 1, 7, 'moodle/blog:create', 1, 1634823311, 0),
(188, 1, 1, 'moodle/blog:create', 1, 1634823311, 0),
(189, 1, 4, 'moodle/blog:manageentries', 1, 1634823312, 0),
(190, 1, 3, 'moodle/blog:manageentries', 1, 1634823312, 0),
(191, 1, 1, 'moodle/blog:manageentries', 1, 1634823312, 0),
(192, 1, 5, 'moodle/blog:manageexternal', 1, 1634823312, 0),
(193, 1, 7, 'moodle/blog:manageexternal', 1, 1634823313, 0),
(194, 1, 4, 'moodle/blog:manageexternal', 1, 1634823313, 0),
(195, 1, 3, 'moodle/blog:manageexternal', 1, 1634823313, 0),
(196, 1, 1, 'moodle/blog:manageexternal', 1, 1634823313, 0),
(197, 1, 7, 'moodle/calendar:manageownentries', 1, 1634823313, 0),
(198, 1, 1, 'moodle/calendar:manageownentries', 1, 1634823314, 0),
(199, 1, 4, 'moodle/calendar:managegroupentries', 1, 1634823314, 0),
(200, 1, 3, 'moodle/calendar:managegroupentries', 1, 1634823314, 0),
(201, 1, 1, 'moodle/calendar:managegroupentries', 1, 1634823314, 0),
(202, 1, 4, 'moodle/calendar:manageentries', 1, 1634823315, 0),
(203, 1, 3, 'moodle/calendar:manageentries', 1, 1634823315, 0),
(204, 1, 1, 'moodle/calendar:manageentries', 1, 1634823315, 0),
(205, 1, 1, 'moodle/user:editprofile', 1, 1634823315, 0),
(206, 1, 6, 'moodle/user:editownprofile', -1000, 1634823316, 0),
(207, 1, 7, 'moodle/user:editownprofile', 1, 1634823316, 0),
(208, 1, 1, 'moodle/user:editownprofile', 1, 1634823316, 0),
(209, 1, 6, 'moodle/user:changeownpassword', -1000, 1634823317, 0),
(210, 1, 7, 'moodle/user:changeownpassword', 1, 1634823317, 0),
(211, 1, 1, 'moodle/user:changeownpassword', 1, 1634823317, 0),
(212, 1, 5, 'moodle/user:readuserposts', 1, 1634823317, 0),
(213, 1, 4, 'moodle/user:readuserposts', 1, 1634823318, 0),
(214, 1, 3, 'moodle/user:readuserposts', 1, 1634823318, 0),
(215, 1, 1, 'moodle/user:readuserposts', 1, 1634823318, 0),
(216, 1, 5, 'moodle/user:readuserblogs', 1, 1634823318, 0),
(217, 1, 4, 'moodle/user:readuserblogs', 1, 1634823318, 0),
(218, 1, 3, 'moodle/user:readuserblogs', 1, 1634823319, 0),
(219, 1, 1, 'moodle/user:readuserblogs', 1, 1634823319, 0),
(220, 1, 1, 'moodle/user:editmessageprofile', 1, 1634823319, 0),
(221, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1634823319, 0),
(222, 1, 7, 'moodle/user:editownmessageprofile', 1, 1634823320, 0),
(223, 1, 1, 'moodle/user:editownmessageprofile', 1, 1634823320, 0),
(224, 1, 3, 'moodle/question:managecategory', 1, 1634823320, 0),
(225, 1, 1, 'moodle/question:managecategory', 1, 1634823320, 0),
(226, 1, 3, 'moodle/question:add', 1, 1634823321, 0),
(227, 1, 1, 'moodle/question:add', 1, 1634823321, 0),
(228, 1, 3, 'moodle/question:editmine', 1, 1634823321, 0),
(229, 1, 1, 'moodle/question:editmine', 1, 1634823322, 0),
(230, 1, 3, 'moodle/question:editall', 1, 1634823322, 0),
(231, 1, 1, 'moodle/question:editall', 1, 1634823322, 0),
(232, 1, 3, 'moodle/question:viewmine', 1, 1634823323, 0),
(233, 1, 1, 'moodle/question:viewmine', 1, 1634823323, 0),
(234, 1, 3, 'moodle/question:viewall', 1, 1634823323, 0),
(235, 1, 1, 'moodle/question:viewall', 1, 1634823323, 0),
(236, 1, 3, 'moodle/question:usemine', 1, 1634823324, 0),
(237, 1, 1, 'moodle/question:usemine', 1, 1634823324, 0),
(238, 1, 3, 'moodle/question:useall', 1, 1634823324, 0),
(239, 1, 1, 'moodle/question:useall', 1, 1634823324, 0),
(240, 1, 3, 'moodle/question:movemine', 1, 1634823325, 0),
(241, 1, 1, 'moodle/question:movemine', 1, 1634823325, 0),
(242, 1, 3, 'moodle/question:moveall', 1, 1634823326, 0),
(243, 1, 1, 'moodle/question:moveall', 1, 1634823326, 0),
(244, 1, 1, 'moodle/question:config', 1, 1634823326, 0),
(245, 1, 5, 'moodle/question:flag', 1, 1634823326, 0),
(246, 1, 4, 'moodle/question:flag', 1, 1634823327, 0),
(247, 1, 3, 'moodle/question:flag', 1, 1634823327, 0),
(248, 1, 1, 'moodle/question:flag', 1, 1634823327, 0),
(249, 1, 3, 'moodle/question:tagmine', 1, 1634823327, 0),
(250, 1, 1, 'moodle/question:tagmine', 1, 1634823328, 0),
(251, 1, 3, 'moodle/question:tagall', 1, 1634823328, 0),
(252, 1, 1, 'moodle/question:tagall', 1, 1634823328, 0),
(253, 1, 4, 'moodle/site:doclinks', 1, 1634823329, 0),
(254, 1, 3, 'moodle/site:doclinks', 1, 1634823329, 0),
(255, 1, 1, 'moodle/site:doclinks', 1, 1634823329, 0),
(256, 1, 3, 'moodle/course:sectionvisibility', 1, 1634823329, 0),
(257, 1, 1, 'moodle/course:sectionvisibility', 1, 1634823330, 0),
(258, 1, 3, 'moodle/course:useremail', 1, 1634823330, 0),
(259, 1, 1, 'moodle/course:useremail', 1, 1634823330, 0),
(260, 1, 3, 'moodle/course:viewhiddensections', 1, 1634823331, 0),
(261, 1, 1, 'moodle/course:viewhiddensections', 1, 1634823331, 0),
(262, 1, 3, 'moodle/course:setcurrentsection', 1, 1634823331, 0),
(263, 1, 1, 'moodle/course:setcurrentsection', 1, 1634823332, 0),
(264, 1, 3, 'moodle/course:movesections', 1, 1634823332, 0),
(265, 1, 1, 'moodle/course:movesections', 1, 1634823332, 0),
(266, 1, 4, 'moodle/grade:viewall', 1, 1634823333, 0),
(267, 1, 3, 'moodle/grade:viewall', 1, 1634823333, 0),
(268, 1, 1, 'moodle/grade:viewall', 1, 1634823333, 0),
(269, 1, 5, 'moodle/grade:view', 1, 1634823334, 0),
(270, 1, 4, 'moodle/grade:viewhidden', 1, 1634823334, 0),
(271, 1, 3, 'moodle/grade:viewhidden', 1, 1634823334, 0),
(272, 1, 1, 'moodle/grade:viewhidden', 1, 1634823334, 0),
(273, 1, 3, 'moodle/grade:import', 1, 1634823335, 0),
(274, 1, 1, 'moodle/grade:import', 1, 1634823335, 0),
(275, 1, 4, 'moodle/grade:export', 1, 1634823335, 0),
(276, 1, 3, 'moodle/grade:export', 1, 1634823336, 0),
(277, 1, 1, 'moodle/grade:export', 1, 1634823336, 0),
(278, 1, 3, 'moodle/grade:manage', 1, 1634823336, 0),
(279, 1, 1, 'moodle/grade:manage', 1, 1634823337, 0),
(280, 1, 3, 'moodle/grade:edit', 1, 1634823337, 0),
(281, 1, 1, 'moodle/grade:edit', 1, 1634823337, 0),
(282, 1, 3, 'moodle/grade:managegradingforms', 1, 1634823338, 0),
(283, 1, 1, 'moodle/grade:managegradingforms', 1, 1634823338, 0),
(284, 1, 1, 'moodle/grade:sharegradingforms', 1, 1634823338, 0),
(285, 1, 1, 'moodle/grade:managesharedforms', 1, 1634823338, 0),
(286, 1, 3, 'moodle/grade:manageoutcomes', 1, 1634823339, 0),
(287, 1, 1, 'moodle/grade:manageoutcomes', 1, 1634823339, 0),
(288, 1, 3, 'moodle/grade:manageletters', 1, 1634823339, 0),
(289, 1, 1, 'moodle/grade:manageletters', 1, 1634823340, 0),
(290, 1, 3, 'moodle/grade:hide', 1, 1634823340, 0),
(291, 1, 1, 'moodle/grade:hide', 1, 1634823340, 0),
(292, 1, 3, 'moodle/grade:lock', 1, 1634823341, 0),
(293, 1, 1, 'moodle/grade:lock', 1, 1634823341, 0),
(294, 1, 3, 'moodle/grade:unlock', 1, 1634823341, 0),
(295, 1, 1, 'moodle/grade:unlock', 1, 1634823341, 0),
(296, 1, 7, 'moodle/my:manageblocks', 1, 1634823342, 0),
(297, 1, 4, 'moodle/notes:view', 1, 1634823342, 0),
(298, 1, 3, 'moodle/notes:view', 1, 1634823342, 0),
(299, 1, 1, 'moodle/notes:view', 1, 1634823342, 0),
(300, 1, 4, 'moodle/notes:manage', 1, 1634823343, 0),
(301, 1, 3, 'moodle/notes:manage', 1, 1634823343, 0),
(302, 1, 1, 'moodle/notes:manage', 1, 1634823343, 0),
(303, 1, 1, 'moodle/tag:manage', 1, 1634823344, 0),
(304, 1, 1, 'moodle/tag:edit', 1, 1634823344, 0),
(305, 1, 7, 'moodle/tag:flag', 1, 1634823344, 0),
(306, 1, 4, 'moodle/tag:editblocks', 1, 1634823345, 0),
(307, 1, 3, 'moodle/tag:editblocks', 1, 1634823345, 0),
(308, 1, 1, 'moodle/tag:editblocks', 1, 1634823345, 0),
(309, 1, 6, 'moodle/block:view', 1, 1634823345, 0),
(310, 1, 7, 'moodle/block:view', 1, 1634823346, 0),
(311, 1, 5, 'moodle/block:view', 1, 1634823346, 0),
(312, 1, 4, 'moodle/block:view', 1, 1634823346, 0),
(313, 1, 3, 'moodle/block:view', 1, 1634823346, 0),
(314, 1, 3, 'moodle/block:edit', 1, 1634823347, 0),
(315, 1, 1, 'moodle/block:edit', 1, 1634823347, 0),
(316, 1, 7, 'moodle/portfolio:export', 1, 1634823347, 0),
(317, 1, 5, 'moodle/portfolio:export', 1, 1634823347, 0),
(318, 1, 4, 'moodle/portfolio:export', 1, 1634823347, 0),
(319, 1, 3, 'moodle/portfolio:export', 1, 1634823348, 0),
(320, 1, 8, 'moodle/comment:view', 1, 1634823348, 0),
(321, 1, 6, 'moodle/comment:view', 1, 1634823348, 0),
(322, 1, 7, 'moodle/comment:view', 1, 1634823348, 0),
(323, 1, 5, 'moodle/comment:view', 1, 1634823349, 0),
(324, 1, 4, 'moodle/comment:view', 1, 1634823349, 0),
(325, 1, 3, 'moodle/comment:view', 1, 1634823349, 0),
(326, 1, 1, 'moodle/comment:view', 1, 1634823349, 0),
(327, 1, 7, 'moodle/comment:post', 1, 1634823349, 0),
(328, 1, 5, 'moodle/comment:post', 1, 1634823350, 0),
(329, 1, 4, 'moodle/comment:post', 1, 1634823350, 0),
(330, 1, 3, 'moodle/comment:post', 1, 1634823350, 0),
(331, 1, 1, 'moodle/comment:post', 1, 1634823350, 0),
(332, 1, 3, 'moodle/comment:delete', 1, 1634823350, 0),
(333, 1, 1, 'moodle/comment:delete', 1, 1634823351, 0),
(334, 1, 1, 'moodle/webservice:createtoken', 1, 1634823351, 0),
(335, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1634823352, 0),
(336, 1, 7, 'moodle/rating:view', 1, 1634823352, 0),
(337, 1, 5, 'moodle/rating:view', 1, 1634823352, 0),
(338, 1, 4, 'moodle/rating:view', 1, 1634823352, 0),
(339, 1, 3, 'moodle/rating:view', 1, 1634823352, 0),
(340, 1, 1, 'moodle/rating:view', 1, 1634823353, 0),
(341, 1, 7, 'moodle/rating:viewany', 1, 1634823353, 0),
(342, 1, 5, 'moodle/rating:viewany', 1, 1634823353, 0),
(343, 1, 4, 'moodle/rating:viewany', 1, 1634823353, 0),
(344, 1, 3, 'moodle/rating:viewany', 1, 1634823353, 0),
(345, 1, 1, 'moodle/rating:viewany', 1, 1634823353, 0),
(346, 1, 7, 'moodle/rating:viewall', 1, 1634823354, 0),
(347, 1, 5, 'moodle/rating:viewall', 1, 1634823354, 0),
(348, 1, 4, 'moodle/rating:viewall', 1, 1634823354, 0),
(349, 1, 3, 'moodle/rating:viewall', 1, 1634823354, 0),
(350, 1, 1, 'moodle/rating:viewall', 1, 1634823354, 0),
(351, 1, 7, 'moodle/rating:rate', 1, 1634823355, 0),
(352, 1, 5, 'moodle/rating:rate', 1, 1634823355, 0),
(353, 1, 4, 'moodle/rating:rate', 1, 1634823355, 0),
(354, 1, 3, 'moodle/rating:rate', 1, 1634823355, 0),
(355, 1, 1, 'moodle/rating:rate', 1, 1634823355, 0),
(356, 1, 4, 'moodle/course:markcomplete', 1, 1634823356, 0),
(357, 1, 3, 'moodle/course:markcomplete', 1, 1634823356, 0),
(358, 1, 1, 'moodle/course:markcomplete', 1, 1634823356, 0),
(359, 1, 4, 'moodle/course:overridecompletion', 1, 1634823356, 0),
(360, 1, 3, 'moodle/course:overridecompletion', 1, 1634823357, 0),
(361, 1, 1, 'moodle/course:overridecompletion', 1, 1634823357, 0),
(362, 1, 1, 'moodle/badges:manageglobalsettings', 1, 1634823357, 0),
(363, 1, 7, 'moodle/badges:viewbadges', 1, 1634823357, 0),
(364, 1, 7, 'moodle/badges:manageownbadges', 1, 1634823358, 0),
(365, 1, 7, 'moodle/badges:viewotherbadges', 1, 1634823358, 0),
(366, 1, 7, 'moodle/badges:earnbadge', 1, 1634823358, 0),
(367, 1, 1, 'moodle/badges:createbadge', 1, 1634823359, 0),
(368, 1, 3, 'moodle/badges:createbadge', 1, 1634823359, 0),
(369, 1, 1, 'moodle/badges:deletebadge', 1, 1634823359, 0),
(370, 1, 3, 'moodle/badges:deletebadge', 1, 1634823359, 0),
(371, 1, 1, 'moodle/badges:configuredetails', 1, 1634823360, 0),
(372, 1, 3, 'moodle/badges:configuredetails', 1, 1634823360, 0),
(373, 1, 1, 'moodle/badges:configurecriteria', 1, 1634823360, 0),
(374, 1, 3, 'moodle/badges:configurecriteria', 1, 1634823360, 0),
(375, 1, 1, 'moodle/badges:configuremessages', 1, 1634823361, 0),
(376, 1, 3, 'moodle/badges:configuremessages', 1, 1634823361, 0),
(377, 1, 1, 'moodle/badges:awardbadge', 1, 1634823361, 0),
(378, 1, 4, 'moodle/badges:awardbadge', 1, 1634823361, 0),
(379, 1, 3, 'moodle/badges:awardbadge', 1, 1634823361, 0),
(380, 1, 1, 'moodle/badges:revokebadge', 1, 1634823362, 0),
(381, 1, 4, 'moodle/badges:revokebadge', 1, 1634823362, 0),
(382, 1, 3, 'moodle/badges:revokebadge', 1, 1634823362, 0),
(383, 1, 1, 'moodle/badges:viewawarded', 1, 1634823362, 0),
(384, 1, 4, 'moodle/badges:viewawarded', 1, 1634823363, 0),
(385, 1, 3, 'moodle/badges:viewawarded', 1, 1634823363, 0),
(386, 1, 6, 'moodle/search:query', 1, 1634823363, 0),
(387, 1, 7, 'moodle/search:query', 1, 1634823363, 0),
(388, 1, 5, 'moodle/search:query', 1, 1634823364, 0),
(389, 1, 4, 'moodle/search:query', 1, 1634823364, 0),
(390, 1, 3, 'moodle/search:query', 1, 1634823364, 0),
(391, 1, 1, 'moodle/search:query', 1, 1634823364, 0),
(392, 1, 1, 'moodle/competency:competencymanage', 1, 1634823365, 0),
(393, 1, 7, 'moodle/competency:competencyview', 1, 1634823365, 0),
(394, 1, 3, 'moodle/competency:competencygrade', 1, 1634823365, 0),
(395, 1, 4, 'moodle/competency:competencygrade', 1, 1634823365, 0),
(396, 1, 1, 'moodle/competency:competencygrade', 1, 1634823365, 0),
(397, 1, 3, 'moodle/competency:coursecompetencymanage', 1, 1634823366, 0),
(398, 1, 1, 'moodle/competency:coursecompetencymanage', 1, 1634823366, 0),
(399, 1, 1, 'moodle/competency:coursecompetencyconfigure', 1, 1634823366, 0),
(400, 1, 5, 'moodle/competency:coursecompetencygradable', 1, 1634823366, 0),
(401, 1, 7, 'moodle/competency:coursecompetencyview', 1, 1634823367, 0),
(402, 1, 1, 'moodle/competency:planmanage', 1, 1634823367, 0),
(403, 1, 1, 'moodle/competency:planmanagedraft', 1, 1634823368, 0),
(404, 1, 1, 'moodle/competency:planview', 1, 1634823368, 0),
(405, 1, 1, 'moodle/competency:planviewdraft', 1, 1634823368, 0),
(406, 1, 7, 'moodle/competency:planviewown', 1, 1634823369, 0),
(407, 1, 1, 'moodle/competency:planrequestreview', 1, 1634823369, 0),
(408, 1, 7, 'moodle/competency:planrequestreviewown', 1, 1634823370, 0),
(409, 1, 1, 'moodle/competency:planreview', 1, 1634823370, 0),
(410, 1, 1, 'moodle/competency:plancomment', 1, 1634823370, 0),
(411, 1, 7, 'moodle/competency:plancommentown', 1, 1634823370, 0),
(412, 1, 1, 'moodle/competency:usercompetencyview', 1, 1634823371, 0),
(413, 1, 3, 'moodle/competency:usercompetencyview', 1, 1634823371, 0),
(414, 1, 4, 'moodle/competency:usercompetencyview', 1, 1634823371, 0),
(415, 1, 1, 'moodle/competency:usercompetencyrequestreview', 1, 1634823372, 0),
(416, 1, 7, 'moodle/competency:usercompetencyrequestreviewown', 1, 1634823372, 0),
(417, 1, 1, 'moodle/competency:usercompetencyreview', 1, 1634823372, 0),
(418, 1, 1, 'moodle/competency:usercompetencycomment', 1, 1634823373, 0),
(419, 1, 7, 'moodle/competency:usercompetencycommentown', 1, 1634823373, 0),
(420, 1, 1, 'moodle/competency:templatemanage', 1, 1634823373, 0),
(421, 1, 4, 'moodle/analytics:listinsights', 1, 1634823374, 0),
(422, 1, 3, 'moodle/analytics:listinsights', 1, 1634823374, 0),
(423, 1, 1, 'moodle/analytics:listinsights', 1, 1634823374, 0),
(424, 1, 1, 'moodle/analytics:managemodels', 1, 1634823374, 0),
(425, 1, 1, 'moodle/competency:templateview', 1, 1634823375, 0),
(426, 1, 1, 'moodle/competency:userevidencemanage', 1, 1634823375, 0),
(427, 1, 7, 'moodle/competency:userevidencemanageown', 1, 1634823376, 0),
(428, 1, 1, 'moodle/competency:userevidenceview', 1, 1634823376, 0),
(429, 1, 4, 'moodle/site:messageanyuser', 1, 1634823377, 0),
(430, 1, 3, 'moodle/site:messageanyuser', 1, 1634823377, 0),
(431, 1, 1, 'moodle/site:messageanyuser', 1, 1634823377, 0),
(432, 1, 7, 'moodle/course:togglecompletion', 1, 1634823377, 0),
(433, 1, 7, 'moodle/analytics:listowninsights', 1, 1634823378, 0),
(434, 1, 3, 'moodle/h5p:setdisplayoptions', 1, 1634823378, 0),
(435, 1, 1, 'moodle/h5p:deploy', 1, 1634823379, 0),
(436, 1, 3, 'moodle/h5p:deploy', 1, 1634823379, 0),
(437, 1, 1, 'moodle/h5p:updatelibraries', 1, 1634823379, 0),
(438, 1, 1, 'moodle/course:recommendactivity', 1, 1634823380, 0),
(439, 1, 1, 'moodle/contentbank:access', 1, 1634823380, 0),
(440, 1, 2, 'moodle/contentbank:access', 1, 1634823380, 0),
(441, 1, 3, 'moodle/contentbank:access', 1, 1634823380, 0),
(442, 1, 1, 'moodle/contentbank:upload', 1, 1634823381, 0),
(443, 1, 2, 'moodle/contentbank:upload', 1, 1634823381, 0),
(444, 1, 3, 'moodle/contentbank:upload', 1, 1634823381, 0),
(445, 1, 1, 'moodle/contentbank:deleteanycontent', 1, 1634823382, 0),
(446, 1, 2, 'moodle/contentbank:deleteanycontent', 1, 1634823382, 0),
(447, 1, 7, 'moodle/contentbank:deleteowncontent', 1, 1634823382, 0),
(448, 1, 1, 'moodle/contentbank:manageanycontent', 1, 1634823382, 0),
(449, 1, 2, 'moodle/contentbank:manageanycontent', 1, 1634823383, 0),
(450, 1, 1, 'moodle/contentbank:manageowncontent', 1, 1634823383, 0),
(451, 1, 2, 'moodle/contentbank:manageowncontent', 1, 1634823383, 0),
(452, 1, 3, 'moodle/contentbank:manageowncontent', 1, 1634823383, 0),
(453, 1, 1, 'moodle/contentbank:useeditor', 1, 1634823384, 0),
(454, 1, 2, 'moodle/contentbank:useeditor', 1, 1634823384, 0),
(455, 1, 3, 'moodle/contentbank:useeditor', 1, 1634823384, 0),
(456, 1, 1, 'moodle/contentbank:downloadcontent', 1, 1634823384, 0),
(457, 1, 2, 'moodle/contentbank:downloadcontent', 1, 1634823385, 0),
(458, 1, 3, 'moodle/contentbank:downloadcontent', 1, 1634823385, 0),
(459, 1, 5, 'moodle/course:downloadcoursecontent', 1, 1634823385, 0),
(460, 1, 4, 'moodle/course:downloadcoursecontent', 1, 1634823385, 0),
(461, 1, 3, 'moodle/course:downloadcoursecontent', 1, 1634823386, 0),
(462, 1, 1, 'moodle/course:downloadcoursecontent', 1, 1634823386, 0),
(463, 1, 3, 'moodle/course:configuredownloadcontent', 1, 1634823386, 0),
(464, 1, 1, 'moodle/course:configuredownloadcontent', 1, 1634823386, 0),
(465, 1, 1, 'moodle/contentbank:viewunlistedcontent', 1, 1634823387, 0),
(466, 1, 2, 'moodle/contentbank:viewunlistedcontent', 1, 1634823387, 0),
(467, 1, 6, 'mod/assign:view', 1, 1634823776, 0),
(468, 1, 5, 'mod/assign:view', 1, 1634823776, 0),
(469, 1, 4, 'mod/assign:view', 1, 1634823776, 0),
(470, 1, 3, 'mod/assign:view', 1, 1634823776, 0),
(471, 1, 1, 'mod/assign:view', 1, 1634823777, 0),
(472, 1, 5, 'mod/assign:submit', 1, 1634823777, 0),
(473, 1, 4, 'mod/assign:grade', 1, 1634823777, 0),
(474, 1, 3, 'mod/assign:grade', 1, 1634823778, 0),
(475, 1, 1, 'mod/assign:grade', 1, 1634823778, 0),
(476, 1, 4, 'mod/assign:exportownsubmission', 1, 1634823778, 0),
(477, 1, 3, 'mod/assign:exportownsubmission', 1, 1634823779, 0),
(478, 1, 1, 'mod/assign:exportownsubmission', 1, 1634823779, 0),
(479, 1, 5, 'mod/assign:exportownsubmission', 1, 1634823779, 0),
(480, 1, 3, 'mod/assign:addinstance', 1, 1634823779, 0),
(481, 1, 1, 'mod/assign:addinstance', 1, 1634823779, 0),
(482, 1, 4, 'mod/assign:grantextension', 1, 1634823780, 0),
(483, 1, 3, 'mod/assign:grantextension', 1, 1634823780, 0),
(484, 1, 1, 'mod/assign:grantextension', 1, 1634823780, 0),
(485, 1, 3, 'mod/assign:revealidentities', 1, 1634823781, 0),
(486, 1, 1, 'mod/assign:revealidentities', 1, 1634823781, 0),
(487, 1, 3, 'mod/assign:reviewgrades', 1, 1634823781, 0),
(488, 1, 1, 'mod/assign:reviewgrades', 1, 1634823781, 0),
(489, 1, 3, 'mod/assign:releasegrades', 1, 1634823782, 0),
(490, 1, 1, 'mod/assign:releasegrades', 1, 1634823782, 0),
(491, 1, 3, 'mod/assign:managegrades', 1, 1634823782, 0),
(492, 1, 1, 'mod/assign:managegrades', 1, 1634823782, 0),
(493, 1, 3, 'mod/assign:manageallocations', 1, 1634823783, 0),
(494, 1, 1, 'mod/assign:manageallocations', 1, 1634823783, 0),
(495, 1, 3, 'mod/assign:viewgrades', 1, 1634823783, 0),
(496, 1, 1, 'mod/assign:viewgrades', 1, 1634823784, 0),
(497, 1, 4, 'mod/assign:viewgrades', 1, 1634823784, 0),
(498, 1, 1, 'mod/assign:viewblinddetails', 1, 1634823784, 0),
(499, 1, 4, 'mod/assign:receivegradernotifications', 1, 1634823785, 0),
(500, 1, 3, 'mod/assign:receivegradernotifications', 1, 1634823785, 0),
(501, 1, 1, 'mod/assign:receivegradernotifications', 1, 1634823785, 0),
(502, 1, 3, 'mod/assign:manageoverrides', 1, 1634823785, 0),
(503, 1, 1, 'mod/assign:manageoverrides', 1, 1634823785, 0),
(504, 1, 4, 'mod/assign:showhiddengrader', 1, 1634823786, 0),
(505, 1, 3, 'mod/assign:showhiddengrader', 1, 1634823786, 0),
(506, 1, 1, 'mod/assign:showhiddengrader', 1, 1634823786, 0),
(507, 1, 5, 'mod/assign:viewownsubmissionsummary', 1, 1634823786, 0),
(508, 1, 6, 'mod/assignment:view', 1, 1634823802, 0),
(509, 1, 5, 'mod/assignment:view', 1, 1634823802, 0),
(510, 1, 4, 'mod/assignment:view', 1, 1634823802, 0),
(511, 1, 3, 'mod/assignment:view', 1, 1634823802, 0),
(512, 1, 1, 'mod/assignment:view', 1, 1634823803, 0),
(513, 1, 3, 'mod/assignment:addinstance', 1, 1634823803, 0),
(514, 1, 1, 'mod/assignment:addinstance', 1, 1634823803, 0),
(515, 1, 5, 'mod/assignment:submit', 1, 1634823803, 0),
(516, 1, 4, 'mod/assignment:grade', 1, 1634823804, 0),
(517, 1, 3, 'mod/assignment:grade', 1, 1634823804, 0),
(518, 1, 1, 'mod/assignment:grade', 1, 1634823804, 0),
(519, 1, 4, 'mod/assignment:exportownsubmission', 1, 1634823805, 0),
(520, 1, 3, 'mod/assignment:exportownsubmission', 1, 1634823805, 0),
(521, 1, 1, 'mod/assignment:exportownsubmission', 1, 1634823805, 0),
(522, 1, 5, 'mod/assignment:exportownsubmission', 1, 1634823805, 0),
(523, 1, 3, 'mod/book:addinstance', 1, 1634823811, 0),
(524, 1, 1, 'mod/book:addinstance', 1, 1634823811, 0),
(525, 1, 6, 'mod/book:read', 1, 1634823811, 0),
(526, 1, 8, 'mod/book:read', 1, 1634823811, 0),
(527, 1, 5, 'mod/book:read', 1, 1634823811, 0),
(528, 1, 4, 'mod/book:read', 1, 1634823812, 0),
(529, 1, 3, 'mod/book:read', 1, 1634823812, 0),
(530, 1, 1, 'mod/book:read', 1, 1634823812, 0),
(531, 1, 4, 'mod/book:viewhiddenchapters', 1, 1634823812, 0),
(532, 1, 3, 'mod/book:viewhiddenchapters', 1, 1634823812, 0),
(533, 1, 1, 'mod/book:viewhiddenchapters', 1, 1634823813, 0),
(534, 1, 3, 'mod/book:edit', 1, 1634823813, 0),
(535, 1, 1, 'mod/book:edit', 1, 1634823813, 0),
(536, 1, 3, 'mod/chat:addinstance', 1, 1634823824, 0),
(537, 1, 1, 'mod/chat:addinstance', 1, 1634823824, 0),
(538, 1, 5, 'mod/chat:chat', 1, 1634823825, 0),
(539, 1, 4, 'mod/chat:chat', 1, 1634823825, 0),
(540, 1, 3, 'mod/chat:chat', 1, 1634823825, 0),
(541, 1, 1, 'mod/chat:chat', 1, 1634823825, 0),
(542, 1, 5, 'mod/chat:readlog', 1, 1634823825, 0),
(543, 1, 4, 'mod/chat:readlog', 1, 1634823826, 0),
(544, 1, 3, 'mod/chat:readlog', 1, 1634823826, 0),
(545, 1, 1, 'mod/chat:readlog', 1, 1634823826, 0),
(546, 1, 4, 'mod/chat:deletelog', 1, 1634823826, 0),
(547, 1, 3, 'mod/chat:deletelog', 1, 1634823827, 0),
(548, 1, 1, 'mod/chat:deletelog', 1, 1634823827, 0),
(549, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1634823827, 0),
(550, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1634823827, 0),
(551, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1634823828, 0),
(552, 1, 4, 'mod/chat:exportsession', 1, 1634823828, 0),
(553, 1, 3, 'mod/chat:exportsession', 1, 1634823828, 0),
(554, 1, 1, 'mod/chat:exportsession', 1, 1634823828, 0),
(555, 1, 7, 'mod/chat:view', 1, 1634823829, 0),
(556, 1, 6, 'mod/chat:view', 1, 1634823829, 0),
(557, 1, 3, 'mod/choice:addinstance', 1, 1634823838, 0),
(558, 1, 1, 'mod/choice:addinstance', 1, 1634823838, 0),
(559, 1, 5, 'mod/choice:choose', 1, 1634823838, 0),
(560, 1, 4, 'mod/choice:choose', 1, 1634823838, 0),
(561, 1, 3, 'mod/choice:choose', 1, 1634823839, 0),
(562, 1, 4, 'mod/choice:readresponses', 1, 1634823839, 0),
(563, 1, 3, 'mod/choice:readresponses', 1, 1634823839, 0),
(564, 1, 1, 'mod/choice:readresponses', 1, 1634823839, 0),
(565, 1, 4, 'mod/choice:deleteresponses', 1, 1634823840, 0),
(566, 1, 3, 'mod/choice:deleteresponses', 1, 1634823840, 0),
(567, 1, 1, 'mod/choice:deleteresponses', 1, 1634823840, 0),
(568, 1, 4, 'mod/choice:downloadresponses', 1, 1634823840, 0),
(569, 1, 3, 'mod/choice:downloadresponses', 1, 1634823841, 0),
(570, 1, 1, 'mod/choice:downloadresponses', 1, 1634823841, 0),
(571, 1, 7, 'mod/choice:view', 1, 1634823841, 0),
(572, 1, 6, 'mod/choice:view', 1, 1634823842, 0),
(573, 1, 3, 'mod/data:addinstance', 1, 1634823851, 0),
(574, 1, 1, 'mod/data:addinstance', 1, 1634823851, 0),
(575, 1, 8, 'mod/data:viewentry', 1, 1634823851, 0),
(576, 1, 6, 'mod/data:viewentry', 1, 1634823852, 0),
(577, 1, 5, 'mod/data:viewentry', 1, 1634823852, 0),
(578, 1, 4, 'mod/data:viewentry', 1, 1634823852, 0),
(579, 1, 3, 'mod/data:viewentry', 1, 1634823852, 0),
(580, 1, 1, 'mod/data:viewentry', 1, 1634823853, 0),
(581, 1, 5, 'mod/data:writeentry', 1, 1634823853, 0),
(582, 1, 4, 'mod/data:writeentry', 1, 1634823853, 0),
(583, 1, 3, 'mod/data:writeentry', 1, 1634823853, 0),
(584, 1, 1, 'mod/data:writeentry', 1, 1634823853, 0),
(585, 1, 5, 'mod/data:comment', 1, 1634823854, 0),
(586, 1, 4, 'mod/data:comment', 1, 1634823854, 0),
(587, 1, 3, 'mod/data:comment', 1, 1634823854, 0),
(588, 1, 1, 'mod/data:comment', 1, 1634823855, 0),
(589, 1, 4, 'mod/data:rate', 1, 1634823855, 0),
(590, 1, 3, 'mod/data:rate', 1, 1634823855, 0),
(591, 1, 1, 'mod/data:rate', 1, 1634823855, 0),
(592, 1, 4, 'mod/data:viewrating', 1, 1634823856, 0),
(593, 1, 3, 'mod/data:viewrating', 1, 1634823856, 0),
(594, 1, 1, 'mod/data:viewrating', 1, 1634823856, 0),
(595, 1, 4, 'mod/data:viewanyrating', 1, 1634823856, 0),
(596, 1, 3, 'mod/data:viewanyrating', 1, 1634823856, 0),
(597, 1, 1, 'mod/data:viewanyrating', 1, 1634823856, 0),
(598, 1, 4, 'mod/data:viewallratings', 1, 1634823857, 0),
(599, 1, 3, 'mod/data:viewallratings', 1, 1634823857, 0),
(600, 1, 1, 'mod/data:viewallratings', 1, 1634823857, 0),
(601, 1, 4, 'mod/data:approve', 1, 1634823857, 0),
(602, 1, 3, 'mod/data:approve', 1, 1634823857, 0),
(603, 1, 1, 'mod/data:approve', 1, 1634823858, 0),
(604, 1, 4, 'mod/data:manageentries', 1, 1634823858, 0),
(605, 1, 3, 'mod/data:manageentries', 1, 1634823858, 0),
(606, 1, 1, 'mod/data:manageentries', 1, 1634823858, 0),
(607, 1, 4, 'mod/data:managecomments', 1, 1634823859, 0),
(608, 1, 3, 'mod/data:managecomments', 1, 1634823859, 0),
(609, 1, 1, 'mod/data:managecomments', 1, 1634823859, 0),
(610, 1, 3, 'mod/data:managetemplates', 1, 1634823859, 0),
(611, 1, 1, 'mod/data:managetemplates', 1, 1634823860, 0),
(612, 1, 4, 'mod/data:viewalluserpresets', 1, 1634823860, 0),
(613, 1, 3, 'mod/data:viewalluserpresets', 1, 1634823860, 0),
(614, 1, 1, 'mod/data:viewalluserpresets', 1, 1634823860, 0),
(615, 1, 1, 'mod/data:manageuserpresets', 1, 1634823861, 0),
(616, 1, 1, 'mod/data:exportentry', 1, 1634823861, 0),
(617, 1, 4, 'mod/data:exportentry', 1, 1634823861, 0),
(618, 1, 3, 'mod/data:exportentry', 1, 1634823862, 0),
(619, 1, 1, 'mod/data:exportownentry', 1, 1634823862, 0),
(620, 1, 4, 'mod/data:exportownentry', 1, 1634823862, 0),
(621, 1, 3, 'mod/data:exportownentry', 1, 1634823862, 0),
(622, 1, 5, 'mod/data:exportownentry', 1, 1634823862, 0),
(623, 1, 1, 'mod/data:exportallentries', 1, 1634823863, 0),
(624, 1, 4, 'mod/data:exportallentries', 1, 1634823863, 0),
(625, 1, 3, 'mod/data:exportallentries', 1, 1634823863, 0),
(626, 1, 1, 'mod/data:exportuserinfo', 1, 1634823864, 0),
(627, 1, 4, 'mod/data:exportuserinfo', 1, 1634823864, 0),
(628, 1, 3, 'mod/data:exportuserinfo', 1, 1634823864, 0),
(629, 1, 6, 'mod/data:view', 1, 1634823864, 0),
(630, 1, 5, 'mod/data:view', 1, 1634823865, 0),
(631, 1, 4, 'mod/data:view', 1, 1634823865, 0),
(632, 1, 3, 'mod/data:view', 1, 1634823865, 0),
(633, 1, 1, 'mod/data:view', 1, 1634823865, 0),
(634, 1, 3, 'mod/feedback:addinstance', 1, 1634823884, 0),
(635, 1, 1, 'mod/feedback:addinstance', 1, 1634823884, 0),
(636, 1, 6, 'mod/feedback:view', 1, 1634823885, 0),
(637, 1, 8, 'mod/feedback:view', 1, 1634823885, 0),
(638, 1, 5, 'mod/feedback:view', 1, 1634823885, 0),
(639, 1, 4, 'mod/feedback:view', 1, 1634823885, 0),
(640, 1, 3, 'mod/feedback:view', 1, 1634823886, 0),
(641, 1, 1, 'mod/feedback:view', 1, 1634823886, 0),
(642, 1, 8, 'mod/feedback:complete', 1, 1634823886, 0),
(643, 1, 5, 'mod/feedback:complete', 1, 1634823886, 0),
(644, 1, 5, 'mod/feedback:viewanalysepage', 1, 1634823887, 0),
(645, 1, 3, 'mod/feedback:viewanalysepage', 1, 1634823887, 0),
(646, 1, 1, 'mod/feedback:viewanalysepage', 1, 1634823887, 0),
(647, 1, 3, 'mod/feedback:deletesubmissions', 1, 1634823888, 0),
(648, 1, 1, 'mod/feedback:deletesubmissions', 1, 1634823888, 0),
(649, 1, 1, 'mod/feedback:mapcourse', 1, 1634823888, 0),
(650, 1, 3, 'mod/feedback:edititems', 1, 1634823888, 0),
(651, 1, 1, 'mod/feedback:edititems', 1, 1634823889, 0),
(652, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1634823889, 0),
(653, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1634823889, 0),
(654, 1, 3, 'mod/feedback:createpublictemplate', 1, 1634823889, 0),
(655, 1, 1, 'mod/feedback:createpublictemplate', 1, 1634823890, 0),
(656, 1, 3, 'mod/feedback:deletetemplate', 1, 1634823890, 0),
(657, 1, 1, 'mod/feedback:deletetemplate', 1, 1634823890, 0),
(658, 1, 4, 'mod/feedback:viewreports', 1, 1634823891, 0),
(659, 1, 3, 'mod/feedback:viewreports', 1, 1634823891, 0),
(660, 1, 1, 'mod/feedback:viewreports', 1, 1634823891, 0),
(661, 1, 4, 'mod/feedback:receivemail', 1, 1634823891, 0),
(662, 1, 3, 'mod/feedback:receivemail', 1, 1634823892, 0),
(663, 1, 3, 'mod/folder:addinstance', 1, 1634823899, 0),
(664, 1, 1, 'mod/folder:addinstance', 1, 1634823899, 0),
(665, 1, 6, 'mod/folder:view', 1, 1634823900, 0),
(666, 1, 7, 'mod/folder:view', 1, 1634823900, 0),
(667, 1, 3, 'mod/folder:managefiles', 1, 1634823900, 0),
(668, 1, 3, 'mod/forum:addinstance', 1, 1634823924, 0),
(669, 1, 1, 'mod/forum:addinstance', 1, 1634823924, 0),
(670, 1, 8, 'mod/forum:viewdiscussion', 1, 1634823925, 0),
(671, 1, 6, 'mod/forum:viewdiscussion', 1, 1634823925, 0),
(672, 1, 5, 'mod/forum:viewdiscussion', 1, 1634823925, 0),
(673, 1, 4, 'mod/forum:viewdiscussion', 1, 1634823925, 0),
(674, 1, 3, 'mod/forum:viewdiscussion', 1, 1634823926, 0),
(675, 1, 1, 'mod/forum:viewdiscussion', 1, 1634823926, 0),
(676, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1634823926, 0),
(677, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1634823926, 0),
(678, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1634823926, 0),
(679, 1, 5, 'mod/forum:startdiscussion', 1, 1634823927, 0),
(680, 1, 4, 'mod/forum:startdiscussion', 1, 1634823927, 0),
(681, 1, 3, 'mod/forum:startdiscussion', 1, 1634823927, 0),
(682, 1, 1, 'mod/forum:startdiscussion', 1, 1634823927, 0),
(683, 1, 5, 'mod/forum:replypost', 1, 1634823928, 0),
(684, 1, 4, 'mod/forum:replypost', 1, 1634823928, 0),
(685, 1, 3, 'mod/forum:replypost', 1, 1634823928, 0),
(686, 1, 1, 'mod/forum:replypost', 1, 1634823928, 0),
(687, 1, 4, 'mod/forum:addnews', 1, 1634823929, 0),
(688, 1, 3, 'mod/forum:addnews', 1, 1634823929, 0),
(689, 1, 1, 'mod/forum:addnews', 1, 1634823929, 0),
(690, 1, 4, 'mod/forum:replynews', 1, 1634823929, 0),
(691, 1, 3, 'mod/forum:replynews', 1, 1634823929, 0),
(692, 1, 1, 'mod/forum:replynews', 1, 1634823930, 0),
(693, 1, 5, 'mod/forum:viewrating', 1, 1634823930, 0),
(694, 1, 4, 'mod/forum:viewrating', 1, 1634823930, 0),
(695, 1, 3, 'mod/forum:viewrating', 1, 1634823930, 0),
(696, 1, 1, 'mod/forum:viewrating', 1, 1634823930, 0),
(697, 1, 4, 'mod/forum:viewanyrating', 1, 1634823931, 0),
(698, 1, 3, 'mod/forum:viewanyrating', 1, 1634823931, 0),
(699, 1, 1, 'mod/forum:viewanyrating', 1, 1634823931, 0),
(700, 1, 4, 'mod/forum:viewallratings', 1, 1634823931, 0),
(701, 1, 3, 'mod/forum:viewallratings', 1, 1634823932, 0),
(702, 1, 1, 'mod/forum:viewallratings', 1, 1634823932, 0),
(703, 1, 4, 'mod/forum:rate', 1, 1634823932, 0),
(704, 1, 3, 'mod/forum:rate', 1, 1634823933, 0),
(705, 1, 1, 'mod/forum:rate', 1, 1634823933, 0),
(706, 1, 4, 'mod/forum:postprivatereply', 1, 1634823933, 0),
(707, 1, 3, 'mod/forum:postprivatereply', 1, 1634823933, 0),
(708, 1, 1, 'mod/forum:postprivatereply', 1, 1634823933, 0),
(709, 1, 4, 'mod/forum:readprivatereplies', 1, 1634823934, 0),
(710, 1, 3, 'mod/forum:readprivatereplies', 1, 1634823934, 0),
(711, 1, 1, 'mod/forum:readprivatereplies', 1, 1634823934, 0),
(712, 1, 5, 'mod/forum:createattachment', 1, 1634823935, 0),
(713, 1, 4, 'mod/forum:createattachment', 1, 1634823935, 0),
(714, 1, 3, 'mod/forum:createattachment', 1, 1634823935, 0),
(715, 1, 1, 'mod/forum:createattachment', 1, 1634823935, 0),
(716, 1, 5, 'mod/forum:deleteownpost', 1, 1634823935, 0),
(717, 1, 4, 'mod/forum:deleteownpost', 1, 1634823936, 0),
(718, 1, 3, 'mod/forum:deleteownpost', 1, 1634823936, 0),
(719, 1, 1, 'mod/forum:deleteownpost', 1, 1634823936, 0),
(720, 1, 4, 'mod/forum:deleteanypost', 1, 1634823936, 0),
(721, 1, 3, 'mod/forum:deleteanypost', 1, 1634823937, 0),
(722, 1, 1, 'mod/forum:deleteanypost', 1, 1634823937, 0),
(723, 1, 4, 'mod/forum:splitdiscussions', 1, 1634823937, 0),
(724, 1, 3, 'mod/forum:splitdiscussions', 1, 1634823937, 0),
(725, 1, 1, 'mod/forum:splitdiscussions', 1, 1634823937, 0),
(726, 1, 4, 'mod/forum:movediscussions', 1, 1634823938, 0),
(727, 1, 3, 'mod/forum:movediscussions', 1, 1634823938, 0),
(728, 1, 1, 'mod/forum:movediscussions', 1, 1634823938, 0),
(729, 1, 4, 'mod/forum:pindiscussions', 1, 1634823938, 0),
(730, 1, 3, 'mod/forum:pindiscussions', 1, 1634823939, 0),
(731, 1, 1, 'mod/forum:pindiscussions', 1, 1634823939, 0),
(732, 1, 4, 'mod/forum:editanypost', 1, 1634823939, 0),
(733, 1, 3, 'mod/forum:editanypost', 1, 1634823939, 0),
(734, 1, 1, 'mod/forum:editanypost', 1, 1634823939, 0),
(735, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1634823940, 0),
(736, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1634823940, 0),
(737, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1634823940, 0),
(738, 1, 4, 'mod/forum:viewsubscribers', 1, 1634823940, 0),
(739, 1, 3, 'mod/forum:viewsubscribers', 1, 1634823940, 0),
(740, 1, 1, 'mod/forum:viewsubscribers', 1, 1634823941, 0),
(741, 1, 4, 'mod/forum:managesubscriptions', 1, 1634823941, 0),
(742, 1, 3, 'mod/forum:managesubscriptions', 1, 1634823941, 0),
(743, 1, 1, 'mod/forum:managesubscriptions', 1, 1634823941, 0),
(744, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1634823941, 0),
(745, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1634823942, 0),
(746, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1634823942, 0),
(747, 1, 4, 'mod/forum:exportdiscussion', 1, 1634823942, 0),
(748, 1, 3, 'mod/forum:exportdiscussion', 1, 1634823942, 0),
(749, 1, 1, 'mod/forum:exportdiscussion', 1, 1634823943, 0),
(750, 1, 4, 'mod/forum:exportforum', 1, 1634823943, 0),
(751, 1, 3, 'mod/forum:exportforum', 1, 1634823943, 0),
(752, 1, 1, 'mod/forum:exportforum', 1, 1634823943, 0),
(753, 1, 4, 'mod/forum:exportpost', 1, 1634823944, 0),
(754, 1, 3, 'mod/forum:exportpost', 1, 1634823944, 0),
(755, 1, 1, 'mod/forum:exportpost', 1, 1634823944, 0),
(756, 1, 4, 'mod/forum:exportownpost', 1, 1634823944, 0),
(757, 1, 3, 'mod/forum:exportownpost', 1, 1634823945, 0),
(758, 1, 1, 'mod/forum:exportownpost', 1, 1634823945, 0),
(759, 1, 5, 'mod/forum:exportownpost', 1, 1634823945, 0),
(760, 1, 4, 'mod/forum:addquestion', 1, 1634823946, 0),
(761, 1, 3, 'mod/forum:addquestion', 1, 1634823946, 0),
(762, 1, 1, 'mod/forum:addquestion', 1, 1634823946, 0),
(763, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1634823946, 0),
(764, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1634823946, 0),
(765, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1634823947, 0),
(766, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1634823947, 0),
(767, 1, 4, 'mod/forum:canposttomygroups', 1, 1634823947, 0),
(768, 1, 3, 'mod/forum:canposttomygroups', 1, 1634823947, 0),
(769, 1, 1, 'mod/forum:canposttomygroups', 1, 1634823947, 0),
(770, 1, 4, 'mod/forum:canoverridediscussionlock', 1, 1634823948, 0),
(771, 1, 3, 'mod/forum:canoverridediscussionlock', 1, 1634823948, 0),
(772, 1, 1, 'mod/forum:canoverridediscussionlock', 1, 1634823948, 0),
(773, 1, 4, 'mod/forum:canoverridecutoff', 1, 1634823948, 0),
(774, 1, 3, 'mod/forum:canoverridecutoff', 1, 1634823948, 0),
(775, 1, 1, 'mod/forum:canoverridecutoff', 1, 1634823949, 0),
(776, 1, 7, 'mod/forum:cantogglefavourite', 1, 1634823949, 0),
(777, 1, 4, 'mod/forum:grade', 1, 1634823949, 0),
(778, 1, 3, 'mod/forum:grade', 1, 1634823950, 0),
(779, 1, 1, 'mod/forum:grade', 1, 1634823950, 0),
(780, 1, 3, 'mod/glossary:addinstance', 1, 1634823967, 0),
(781, 1, 1, 'mod/glossary:addinstance', 1, 1634823967, 0),
(782, 1, 8, 'mod/glossary:view', 1, 1634823968, 0),
(783, 1, 6, 'mod/glossary:view', 1, 1634823968, 0),
(784, 1, 5, 'mod/glossary:view', 1, 1634823968, 0),
(785, 1, 4, 'mod/glossary:view', 1, 1634823968, 0),
(786, 1, 3, 'mod/glossary:view', 1, 1634823969, 0),
(787, 1, 1, 'mod/glossary:view', 1, 1634823969, 0),
(788, 1, 5, 'mod/glossary:write', 1, 1634823969, 0),
(789, 1, 4, 'mod/glossary:write', 1, 1634823969, 0),
(790, 1, 3, 'mod/glossary:write', 1, 1634823969, 0),
(791, 1, 1, 'mod/glossary:write', 1, 1634823970, 0),
(792, 1, 4, 'mod/glossary:manageentries', 1, 1634823970, 0),
(793, 1, 3, 'mod/glossary:manageentries', 1, 1634823970, 0),
(794, 1, 1, 'mod/glossary:manageentries', 1, 1634823970, 0),
(795, 1, 4, 'mod/glossary:managecategories', 1, 1634823971, 0),
(796, 1, 3, 'mod/glossary:managecategories', 1, 1634823971, 0),
(797, 1, 1, 'mod/glossary:managecategories', 1, 1634823971, 0),
(798, 1, 5, 'mod/glossary:comment', 1, 1634823971, 0),
(799, 1, 4, 'mod/glossary:comment', 1, 1634823972, 0),
(800, 1, 3, 'mod/glossary:comment', 1, 1634823972, 0),
(801, 1, 1, 'mod/glossary:comment', 1, 1634823972, 0),
(802, 1, 4, 'mod/glossary:managecomments', 1, 1634823972, 0),
(803, 1, 3, 'mod/glossary:managecomments', 1, 1634823972, 0),
(804, 1, 1, 'mod/glossary:managecomments', 1, 1634823972, 0),
(805, 1, 4, 'mod/glossary:import', 1, 1634823973, 0),
(806, 1, 3, 'mod/glossary:import', 1, 1634823973, 0),
(807, 1, 1, 'mod/glossary:import', 1, 1634823973, 0),
(808, 1, 4, 'mod/glossary:export', 1, 1634823974, 0),
(809, 1, 3, 'mod/glossary:export', 1, 1634823974, 0),
(810, 1, 1, 'mod/glossary:export', 1, 1634823974, 0),
(811, 1, 4, 'mod/glossary:approve', 1, 1634823974, 0),
(812, 1, 3, 'mod/glossary:approve', 1, 1634823975, 0),
(813, 1, 1, 'mod/glossary:approve', 1, 1634823975, 0),
(814, 1, 4, 'mod/glossary:rate', 1, 1634823975, 0),
(815, 1, 3, 'mod/glossary:rate', 1, 1634823975, 0),
(816, 1, 1, 'mod/glossary:rate', 1, 1634823976, 0),
(817, 1, 4, 'mod/glossary:viewrating', 1, 1634823976, 0),
(818, 1, 3, 'mod/glossary:viewrating', 1, 1634823976, 0),
(819, 1, 1, 'mod/glossary:viewrating', 1, 1634823976, 0),
(820, 1, 4, 'mod/glossary:viewanyrating', 1, 1634823977, 0),
(821, 1, 3, 'mod/glossary:viewanyrating', 1, 1634823977, 0),
(822, 1, 1, 'mod/glossary:viewanyrating', 1, 1634823977, 0),
(823, 1, 4, 'mod/glossary:viewallratings', 1, 1634823977, 0),
(824, 1, 3, 'mod/glossary:viewallratings', 1, 1634823978, 0),
(825, 1, 1, 'mod/glossary:viewallratings', 1, 1634823978, 0),
(826, 1, 4, 'mod/glossary:exportentry', 1, 1634823978, 0),
(827, 1, 3, 'mod/glossary:exportentry', 1, 1634823978, 0),
(828, 1, 1, 'mod/glossary:exportentry', 1, 1634823979, 0),
(829, 1, 4, 'mod/glossary:exportownentry', 1, 1634823979, 0),
(830, 1, 3, 'mod/glossary:exportownentry', 1, 1634823979, 0),
(831, 1, 1, 'mod/glossary:exportownentry', 1, 1634823979, 0),
(832, 1, 5, 'mod/glossary:exportownentry', 1, 1634823979, 0),
(833, 1, 6, 'mod/h5pactivity:view', 1, 1634823991, 0),
(834, 1, 5, 'mod/h5pactivity:view', 1, 1634823991, 0),
(835, 1, 4, 'mod/h5pactivity:view', 1, 1634823991, 0),
(836, 1, 3, 'mod/h5pactivity:view', 1, 1634823991, 0),
(837, 1, 1, 'mod/h5pactivity:view', 1, 1634823992, 0),
(838, 1, 3, 'mod/h5pactivity:addinstance', 1, 1634823992, 0),
(839, 1, 1, 'mod/h5pactivity:addinstance', 1, 1634823992, 0),
(840, 1, 5, 'mod/h5pactivity:submit', 1, 1634823992, 0),
(841, 1, 3, 'mod/h5pactivity:reviewattempts', 1, 1634823993, 0),
(842, 1, 1, 'mod/h5pactivity:reviewattempts', 1, 1634823993, 0),
(843, 1, 6, 'mod/imscp:view', 1, 1634823997, 0),
(844, 1, 7, 'mod/imscp:view', 1, 1634823997, 0),
(845, 1, 3, 'mod/imscp:addinstance', 1, 1634823998, 0),
(846, 1, 1, 'mod/imscp:addinstance', 1, 1634823998, 0),
(847, 1, 3, 'mod/label:addinstance', 1, 1634824003, 0),
(848, 1, 1, 'mod/label:addinstance', 1, 1634824003, 0),
(849, 1, 7, 'mod/label:view', 1, 1634824003, 0),
(850, 1, 6, 'mod/label:view', 1, 1634824003, 0),
(851, 1, 3, 'mod/lesson:addinstance', 1, 1634824019, 0),
(852, 1, 1, 'mod/lesson:addinstance', 1, 1634824020, 0),
(853, 1, 3, 'mod/lesson:edit', 1, 1634824020, 0),
(854, 1, 1, 'mod/lesson:edit', 1, 1634824020, 0),
(855, 1, 4, 'mod/lesson:grade', 1, 1634824021, 0),
(856, 1, 3, 'mod/lesson:grade', 1, 1634824021, 0),
(857, 1, 1, 'mod/lesson:grade', 1, 1634824021, 0),
(858, 1, 4, 'mod/lesson:viewreports', 1, 1634824021, 0),
(859, 1, 3, 'mod/lesson:viewreports', 1, 1634824022, 0),
(860, 1, 1, 'mod/lesson:viewreports', 1, 1634824022, 0),
(861, 1, 4, 'mod/lesson:manage', 1, 1634824022, 0),
(862, 1, 3, 'mod/lesson:manage', 1, 1634824022, 0),
(863, 1, 1, 'mod/lesson:manage', 1, 1634824023, 0),
(864, 1, 3, 'mod/lesson:manageoverrides', 1, 1634824023, 0),
(865, 1, 1, 'mod/lesson:manageoverrides', 1, 1634824023, 0),
(866, 1, 7, 'mod/lesson:view', 1, 1634824024, 0),
(867, 1, 6, 'mod/lesson:view', 1, 1634824024, 0),
(868, 1, 5, 'mod/lti:view', 1, 1634824042, 0),
(869, 1, 4, 'mod/lti:view', 1, 1634824042, 0),
(870, 1, 3, 'mod/lti:view', 1, 1634824042, 0),
(871, 1, 1, 'mod/lti:view', 1, 1634824042, 0),
(872, 1, 3, 'mod/lti:addinstance', 1, 1634824043, 0),
(873, 1, 1, 'mod/lti:addinstance', 1, 1634824043, 0),
(874, 1, 4, 'mod/lti:manage', 1, 1634824044, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(875, 1, 3, 'mod/lti:manage', 1, 1634824044, 0),
(876, 1, 1, 'mod/lti:manage', 1, 1634824044, 0),
(877, 1, 3, 'mod/lti:addcoursetool', 1, 1634824045, 0),
(878, 1, 1, 'mod/lti:addcoursetool', 1, 1634824045, 0),
(879, 1, 3, 'mod/lti:addpreconfiguredinstance', 1, 1634824045, 0),
(880, 1, 1, 'mod/lti:addpreconfiguredinstance', 1, 1634824045, 0),
(881, 1, 3, 'mod/lti:addmanualinstance', 1, 1634824046, 0),
(882, 1, 1, 'mod/lti:addmanualinstance', 1, 1634824046, 0),
(883, 1, 3, 'mod/lti:requesttooladd', 1, 1634824046, 0),
(884, 1, 1, 'mod/lti:requesttooladd', 1, 1634824046, 0),
(885, 1, 6, 'mod/page:view', 1, 1634824053, 0),
(886, 1, 7, 'mod/page:view', 1, 1634824053, 0),
(887, 1, 3, 'mod/page:addinstance', 1, 1634824053, 0),
(888, 1, 1, 'mod/page:addinstance', 1, 1634824054, 0),
(889, 1, 6, 'mod/quiz:view', 1, 1634824072, 0),
(890, 1, 5, 'mod/quiz:view', 1, 1634824073, 0),
(891, 1, 4, 'mod/quiz:view', 1, 1634824073, 0),
(892, 1, 3, 'mod/quiz:view', 1, 1634824073, 0),
(893, 1, 1, 'mod/quiz:view', 1, 1634824073, 0),
(894, 1, 3, 'mod/quiz:addinstance', 1, 1634824073, 0),
(895, 1, 1, 'mod/quiz:addinstance', 1, 1634824074, 0),
(896, 1, 5, 'mod/quiz:attempt', 1, 1634824074, 0),
(897, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1634824074, 0),
(898, 1, 3, 'mod/quiz:manage', 1, 1634824075, 0),
(899, 1, 1, 'mod/quiz:manage', 1, 1634824075, 0),
(900, 1, 3, 'mod/quiz:manageoverrides', 1, 1634824076, 0),
(901, 1, 1, 'mod/quiz:manageoverrides', 1, 1634824076, 0),
(902, 1, 4, 'mod/quiz:viewoverrides', 1, 1634824076, 0),
(903, 1, 3, 'mod/quiz:viewoverrides', 1, 1634824076, 0),
(904, 1, 1, 'mod/quiz:viewoverrides', 1, 1634824076, 0),
(905, 1, 4, 'mod/quiz:preview', 1, 1634824077, 0),
(906, 1, 3, 'mod/quiz:preview', 1, 1634824077, 0),
(907, 1, 1, 'mod/quiz:preview', 1, 1634824077, 0),
(908, 1, 4, 'mod/quiz:grade', 1, 1634824078, 0),
(909, 1, 3, 'mod/quiz:grade', 1, 1634824078, 0),
(910, 1, 1, 'mod/quiz:grade', 1, 1634824078, 0),
(911, 1, 4, 'mod/quiz:regrade', 1, 1634824078, 0),
(912, 1, 3, 'mod/quiz:regrade', 1, 1634824078, 0),
(913, 1, 1, 'mod/quiz:regrade', 1, 1634824079, 0),
(914, 1, 4, 'mod/quiz:viewreports', 1, 1634824079, 0),
(915, 1, 3, 'mod/quiz:viewreports', 1, 1634824079, 0),
(916, 1, 1, 'mod/quiz:viewreports', 1, 1634824079, 0),
(917, 1, 3, 'mod/quiz:deleteattempts', 1, 1634824080, 0),
(918, 1, 1, 'mod/quiz:deleteattempts', 1, 1634824080, 0),
(919, 1, 6, 'mod/resource:view', 1, 1634824093, 0),
(920, 1, 7, 'mod/resource:view', 1, 1634824093, 0),
(921, 1, 3, 'mod/resource:addinstance', 1, 1634824093, 0),
(922, 1, 1, 'mod/resource:addinstance', 1, 1634824093, 0),
(923, 1, 3, 'mod/scorm:addinstance', 1, 1634824115, 0),
(924, 1, 1, 'mod/scorm:addinstance', 1, 1634824115, 0),
(925, 1, 4, 'mod/scorm:viewreport', 1, 1634824115, 0),
(926, 1, 3, 'mod/scorm:viewreport', 1, 1634824116, 0),
(927, 1, 1, 'mod/scorm:viewreport', 1, 1634824116, 0),
(928, 1, 5, 'mod/scorm:skipview', 1, 1634824116, 0),
(929, 1, 5, 'mod/scorm:savetrack', 1, 1634824117, 0),
(930, 1, 4, 'mod/scorm:savetrack', 1, 1634824117, 0),
(931, 1, 3, 'mod/scorm:savetrack', 1, 1634824117, 0),
(932, 1, 1, 'mod/scorm:savetrack', 1, 1634824117, 0),
(933, 1, 5, 'mod/scorm:viewscores', 1, 1634824117, 0),
(934, 1, 4, 'mod/scorm:viewscores', 1, 1634824118, 0),
(935, 1, 3, 'mod/scorm:viewscores', 1, 1634824118, 0),
(936, 1, 1, 'mod/scorm:viewscores', 1, 1634824118, 0),
(937, 1, 4, 'mod/scorm:deleteresponses', 1, 1634824118, 0),
(938, 1, 3, 'mod/scorm:deleteresponses', 1, 1634824118, 0),
(939, 1, 1, 'mod/scorm:deleteresponses', 1, 1634824119, 0),
(940, 1, 3, 'mod/survey:addinstance', 1, 1634824144, 0),
(941, 1, 1, 'mod/survey:addinstance', 1, 1634824144, 0),
(942, 1, 5, 'mod/survey:participate', 1, 1634824144, 0),
(943, 1, 4, 'mod/survey:participate', 1, 1634824145, 0),
(944, 1, 3, 'mod/survey:participate', 1, 1634824145, 0),
(945, 1, 1, 'mod/survey:participate', 1, 1634824145, 0),
(946, 1, 4, 'mod/survey:readresponses', 1, 1634824145, 0),
(947, 1, 3, 'mod/survey:readresponses', 1, 1634824145, 0),
(948, 1, 1, 'mod/survey:readresponses', 1, 1634824146, 0),
(949, 1, 4, 'mod/survey:download', 1, 1634824146, 0),
(950, 1, 3, 'mod/survey:download', 1, 1634824146, 0),
(951, 1, 1, 'mod/survey:download', 1, 1634824146, 0),
(952, 1, 6, 'mod/url:view', 1, 1634824153, 0),
(953, 1, 7, 'mod/url:view', 1, 1634824153, 0),
(954, 1, 3, 'mod/url:addinstance', 1, 1634824153, 0),
(955, 1, 1, 'mod/url:addinstance', 1, 1634824153, 0),
(956, 1, 3, 'mod/wiki:addinstance', 1, 1634824165, 0),
(957, 1, 1, 'mod/wiki:addinstance', 1, 1634824165, 0),
(958, 1, 6, 'mod/wiki:viewpage', 1, 1634824165, 0),
(959, 1, 8, 'mod/wiki:viewpage', 1, 1634824166, 0),
(960, 1, 5, 'mod/wiki:viewpage', 1, 1634824166, 0),
(961, 1, 4, 'mod/wiki:viewpage', 1, 1634824166, 0),
(962, 1, 3, 'mod/wiki:viewpage', 1, 1634824166, 0),
(963, 1, 1, 'mod/wiki:viewpage', 1, 1634824166, 0),
(964, 1, 5, 'mod/wiki:editpage', 1, 1634824167, 0),
(965, 1, 4, 'mod/wiki:editpage', 1, 1634824167, 0),
(966, 1, 3, 'mod/wiki:editpage', 1, 1634824167, 0),
(967, 1, 1, 'mod/wiki:editpage', 1, 1634824167, 0),
(968, 1, 5, 'mod/wiki:createpage', 1, 1634824168, 0),
(969, 1, 4, 'mod/wiki:createpage', 1, 1634824168, 0),
(970, 1, 3, 'mod/wiki:createpage', 1, 1634824168, 0),
(971, 1, 1, 'mod/wiki:createpage', 1, 1634824168, 0),
(972, 1, 5, 'mod/wiki:viewcomment', 1, 1634824168, 0),
(973, 1, 4, 'mod/wiki:viewcomment', 1, 1634824169, 0),
(974, 1, 3, 'mod/wiki:viewcomment', 1, 1634824169, 0),
(975, 1, 1, 'mod/wiki:viewcomment', 1, 1634824169, 0),
(976, 1, 5, 'mod/wiki:editcomment', 1, 1634824169, 0),
(977, 1, 4, 'mod/wiki:editcomment', 1, 1634824170, 0),
(978, 1, 3, 'mod/wiki:editcomment', 1, 1634824170, 0),
(979, 1, 1, 'mod/wiki:editcomment', 1, 1634824170, 0),
(980, 1, 4, 'mod/wiki:managecomment', 1, 1634824170, 0),
(981, 1, 3, 'mod/wiki:managecomment', 1, 1634824171, 0),
(982, 1, 1, 'mod/wiki:managecomment', 1, 1634824171, 0),
(983, 1, 4, 'mod/wiki:managefiles', 1, 1634824171, 0),
(984, 1, 3, 'mod/wiki:managefiles', 1, 1634824171, 0),
(985, 1, 1, 'mod/wiki:managefiles', 1, 1634824172, 0),
(986, 1, 4, 'mod/wiki:overridelock', 1, 1634824172, 0),
(987, 1, 3, 'mod/wiki:overridelock', 1, 1634824172, 0),
(988, 1, 1, 'mod/wiki:overridelock', 1, 1634824172, 0),
(989, 1, 4, 'mod/wiki:managewiki', 1, 1634824173, 0),
(990, 1, 3, 'mod/wiki:managewiki', 1, 1634824173, 0),
(991, 1, 1, 'mod/wiki:managewiki', 1, 1634824173, 0),
(992, 1, 6, 'mod/workshop:view', 1, 1634824185, 0),
(993, 1, 5, 'mod/workshop:view', 1, 1634824185, 0),
(994, 1, 4, 'mod/workshop:view', 1, 1634824185, 0),
(995, 1, 3, 'mod/workshop:view', 1, 1634824186, 0),
(996, 1, 1, 'mod/workshop:view', 1, 1634824186, 0),
(997, 1, 3, 'mod/workshop:addinstance', 1, 1634824186, 0),
(998, 1, 1, 'mod/workshop:addinstance', 1, 1634824186, 0),
(999, 1, 4, 'mod/workshop:switchphase', 1, 1634824187, 0),
(1000, 1, 3, 'mod/workshop:switchphase', 1, 1634824187, 0),
(1001, 1, 1, 'mod/workshop:switchphase', 1, 1634824187, 0),
(1002, 1, 3, 'mod/workshop:editdimensions', 1, 1634824187, 0),
(1003, 1, 1, 'mod/workshop:editdimensions', 1, 1634824188, 0),
(1004, 1, 5, 'mod/workshop:submit', 1, 1634824188, 0),
(1005, 1, 5, 'mod/workshop:peerassess', 1, 1634824188, 0),
(1006, 1, 4, 'mod/workshop:manageexamples', 1, 1634824189, 0),
(1007, 1, 3, 'mod/workshop:manageexamples', 1, 1634824189, 0),
(1008, 1, 1, 'mod/workshop:manageexamples', 1, 1634824189, 0),
(1009, 1, 4, 'mod/workshop:allocate', 1, 1634824190, 0),
(1010, 1, 3, 'mod/workshop:allocate', 1, 1634824190, 0),
(1011, 1, 1, 'mod/workshop:allocate', 1, 1634824190, 0),
(1012, 1, 4, 'mod/workshop:publishsubmissions', 1, 1634824190, 0),
(1013, 1, 3, 'mod/workshop:publishsubmissions', 1, 1634824191, 0),
(1014, 1, 1, 'mod/workshop:publishsubmissions', 1, 1634824191, 0),
(1015, 1, 5, 'mod/workshop:viewauthornames', 1, 1634824191, 0),
(1016, 1, 4, 'mod/workshop:viewauthornames', 1, 1634824191, 0),
(1017, 1, 3, 'mod/workshop:viewauthornames', 1, 1634824192, 0),
(1018, 1, 1, 'mod/workshop:viewauthornames', 1, 1634824192, 0),
(1019, 1, 4, 'mod/workshop:viewreviewernames', 1, 1634824192, 0),
(1020, 1, 3, 'mod/workshop:viewreviewernames', 1, 1634824192, 0),
(1021, 1, 1, 'mod/workshop:viewreviewernames', 1, 1634824192, 0),
(1022, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1634824193, 0),
(1023, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1634824193, 0),
(1024, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1634824193, 0),
(1025, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1634824194, 0),
(1026, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1634824194, 0),
(1027, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1634824194, 0),
(1028, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1634824194, 0),
(1029, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1634824195, 0),
(1030, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1634824195, 0),
(1031, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1634824195, 0),
(1032, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1634824195, 0),
(1033, 1, 4, 'mod/workshop:viewallassessments', 1, 1634824196, 0),
(1034, 1, 3, 'mod/workshop:viewallassessments', 1, 1634824196, 0),
(1035, 1, 1, 'mod/workshop:viewallassessments', 1, 1634824196, 0),
(1036, 1, 4, 'mod/workshop:overridegrades', 1, 1634824197, 0),
(1037, 1, 3, 'mod/workshop:overridegrades', 1, 1634824197, 0),
(1038, 1, 1, 'mod/workshop:overridegrades', 1, 1634824197, 0),
(1039, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1634824197, 0),
(1040, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1634824198, 0),
(1041, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1634824198, 0),
(1042, 1, 4, 'mod/workshop:deletesubmissions', 1, 1634824198, 0),
(1043, 1, 3, 'mod/workshop:deletesubmissions', 1, 1634824198, 0),
(1044, 1, 1, 'mod/workshop:deletesubmissions', 1, 1634824198, 0),
(1045, 1, 1, 'mod/workshop:exportsubmissions', 1, 1634824199, 0),
(1046, 1, 4, 'mod/workshop:exportsubmissions', 1, 1634824199, 0),
(1047, 1, 3, 'mod/workshop:exportsubmissions', 1, 1634824199, 0),
(1048, 1, 5, 'mod/workshop:exportsubmissions', 1, 1634824199, 0),
(1049, 1, 7, 'auth/oauth2:managelinkedlogins', 1, 1634824230, 0),
(1050, 1, 1, 'enrol/category:config', 1, 1634824241, 0),
(1051, 1, 3, 'enrol/category:config', 1, 1634824242, 0),
(1052, 1, 3, 'enrol/cohort:config', 1, 1634824243, 0),
(1053, 1, 1, 'enrol/cohort:config', 1, 1634824243, 0),
(1054, 1, 1, 'enrol/cohort:unenrol', 1, 1634824244, 0),
(1055, 1, 1, 'enrol/database:unenrol', 1, 1634824246, 0),
(1056, 1, 1, 'enrol/database:config', 1, 1634824246, 0),
(1057, 1, 3, 'enrol/database:config', 1, 1634824246, 0),
(1058, 1, 1, 'enrol/fee:config', 1, 1634824248, 0),
(1059, 1, 1, 'enrol/fee:manage', 1, 1634824248, 0),
(1060, 1, 3, 'enrol/fee:manage', 1, 1634824248, 0),
(1061, 1, 1, 'enrol/fee:unenrol', 1, 1634824248, 0),
(1062, 1, 1, 'enrol/guest:config', 1, 1634824256, 0),
(1063, 1, 3, 'enrol/guest:config', 1, 1634824256, 0),
(1064, 1, 1, 'enrol/imsenterprise:config', 1, 1634824258, 0),
(1065, 1, 3, 'enrol/imsenterprise:config', 1, 1634824258, 0),
(1066, 1, 1, 'enrol/ldap:manage', 1, 1634824261, 0),
(1067, 1, 1, 'enrol/lti:config', 1, 1634824278, 0),
(1068, 1, 3, 'enrol/lti:config', 1, 1634824278, 0),
(1069, 1, 1, 'enrol/lti:unenrol', 1, 1634824279, 0),
(1070, 1, 3, 'enrol/lti:unenrol', 1, 1634824279, 0),
(1071, 1, 1, 'enrol/manual:config', 1, 1634824282, 0),
(1072, 1, 1, 'enrol/manual:enrol', 1, 1634824282, 0),
(1073, 1, 3, 'enrol/manual:enrol', 1, 1634824282, 0),
(1074, 1, 1, 'enrol/manual:manage', 1, 1634824282, 0),
(1075, 1, 3, 'enrol/manual:manage', 1, 1634824283, 0),
(1076, 1, 1, 'enrol/manual:unenrol', 1, 1634824283, 0),
(1077, 1, 3, 'enrol/manual:unenrol', 1, 1634824283, 0),
(1078, 1, 1, 'enrol/meta:config', 1, 1634824286, 0),
(1079, 1, 3, 'enrol/meta:config', 1, 1634824286, 0),
(1080, 1, 1, 'enrol/meta:selectaslinked', 1, 1634824286, 0),
(1081, 1, 1, 'enrol/meta:unenrol', 1, 1634824287, 0),
(1082, 1, 1, 'enrol/mnet:config', 1, 1634824288, 0),
(1083, 1, 3, 'enrol/mnet:config', 1, 1634824288, 0),
(1084, 1, 1, 'enrol/paypal:config', 1, 1634824296, 0),
(1085, 1, 1, 'enrol/paypal:manage', 1, 1634824296, 0),
(1086, 1, 3, 'enrol/paypal:manage', 1, 1634824297, 0),
(1087, 1, 1, 'enrol/paypal:unenrol', 1, 1634824297, 0),
(1088, 1, 3, 'enrol/self:config', 1, 1634824300, 0),
(1089, 1, 1, 'enrol/self:config', 1, 1634824300, 0),
(1090, 1, 3, 'enrol/self:manage', 1, 1634824300, 0),
(1091, 1, 1, 'enrol/self:manage', 1, 1634824300, 0),
(1092, 1, 5, 'enrol/self:unenrolself', 1, 1634824301, 0),
(1093, 1, 3, 'enrol/self:unenrol', 1, 1634824301, 0),
(1094, 1, 1, 'enrol/self:unenrol', 1, 1634824302, 0),
(1095, 1, 7, 'enrol/self:enrolself', 1, 1634824302, 0),
(1096, 1, 7, 'message/airnotifier:managedevice', 1, 1634824306, 0),
(1097, 1, 3, 'block/accessreview:addinstance', 1, 1634824321, 0),
(1098, 1, 1, 'block/accessreview:addinstance', 1, 1634824321, 0),
(1099, 1, 3, 'block/accessreview:view', 1, 1634824321, 0),
(1100, 1, 1, 'block/accessreview:view', 1, 1634824322, 0),
(1101, 1, 3, 'block/activity_modules:addinstance', 1, 1634824324, 0),
(1102, 1, 1, 'block/activity_modules:addinstance', 1, 1634824324, 0),
(1103, 1, 3, 'block/activity_results:addinstance', 1, 1634824326, 0),
(1104, 1, 1, 'block/activity_results:addinstance', 1, 1634824326, 0),
(1105, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1634824328, 0),
(1106, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1634824328, 0),
(1107, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1634824329, 0),
(1108, 1, 3, 'block/badges:addinstance', 1, 1634824330, 0),
(1109, 1, 1, 'block/badges:addinstance', 1, 1634824331, 0),
(1110, 1, 7, 'block/badges:myaddinstance', 1, 1634824331, 0),
(1111, 1, 3, 'block/blog_recent:addinstance', 1, 1634824333, 0),
(1112, 1, 1, 'block/blog_recent:addinstance', 1, 1634824333, 0),
(1113, 1, 3, 'block/blog_tags:addinstance', 1, 1634824335, 0),
(1114, 1, 1, 'block/blog_tags:addinstance', 1, 1634824335, 0),
(1115, 1, 7, 'block/calendar_month:myaddinstance', 1, 1634824337, 0),
(1116, 1, 3, 'block/calendar_month:addinstance', 1, 1634824338, 0),
(1117, 1, 1, 'block/calendar_month:addinstance', 1, 1634824338, 0),
(1118, 1, 7, 'block/comments:myaddinstance', 1, 1634825066, 0),
(1119, 1, 3, 'block/comments:addinstance', 1, 1634825066, 0),
(1120, 1, 1, 'block/comments:addinstance', 1, 1634825066, 0),
(1121, 1, 3, 'block/completionstatus:addinstance', 1, 1634825068, 0),
(1122, 1, 1, 'block/completionstatus:addinstance', 1, 1634825068, 0),
(1123, 1, 7, 'block/course_list:myaddinstance', 1, 1634825070, 0),
(1124, 1, 3, 'block/course_list:addinstance', 1, 1634825070, 0),
(1125, 1, 1, 'block/course_list:addinstance', 1, 1634825070, 0),
(1126, 1, 3, 'block/course_summary:addinstance', 1, 1634825072, 0),
(1127, 1, 1, 'block/course_summary:addinstance', 1, 1634825072, 0),
(1128, 1, 7, 'block/globalsearch:myaddinstance', 1, 1634825073, 0),
(1129, 1, 3, 'block/globalsearch:addinstance', 1, 1634825073, 0),
(1130, 1, 1, 'block/globalsearch:addinstance', 1, 1634825074, 0),
(1131, 1, 7, 'block/glossary_random:myaddinstance', 1, 1634825075, 0),
(1132, 1, 3, 'block/glossary_random:addinstance', 1, 1634825075, 0),
(1133, 1, 1, 'block/glossary_random:addinstance', 1, 1634825076, 0),
(1134, 1, 7, 'block/html:myaddinstance', 1, 1634825077, 0),
(1135, 1, 3, 'block/html:addinstance', 1, 1634825077, 0),
(1136, 1, 1, 'block/html:addinstance', 1, 1634825078, 0),
(1137, 1, 3, 'block/login:addinstance', 1, 1634825080, 0),
(1138, 1, 1, 'block/login:addinstance', 1, 1634825080, 0),
(1139, 1, 3, 'block/lp:addinstance', 1, 1634825081, 0),
(1140, 1, 1, 'block/lp:addinstance', 1, 1634825081, 0),
(1141, 1, 7, 'block/lp:myaddinstance', 1, 1634825081, 0),
(1142, 1, 7, 'block/mentees:myaddinstance', 1, 1634825083, 0),
(1143, 1, 3, 'block/mentees:addinstance', 1, 1634825083, 0),
(1144, 1, 1, 'block/mentees:addinstance', 1, 1634825083, 0),
(1145, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1634825085, 0),
(1146, 1, 3, 'block/mnet_hosts:addinstance', 1, 1634825085, 0),
(1147, 1, 1, 'block/mnet_hosts:addinstance', 1, 1634825086, 0),
(1148, 1, 7, 'block/myprofile:myaddinstance', 1, 1634825087, 0),
(1149, 1, 3, 'block/myprofile:addinstance', 1, 1634825087, 0),
(1150, 1, 1, 'block/myprofile:addinstance', 1, 1634825088, 0),
(1151, 1, 7, 'block/navigation:myaddinstance', 1, 1634825089, 0),
(1152, 1, 3, 'block/navigation:addinstance', 1, 1634825089, 0),
(1153, 1, 1, 'block/navigation:addinstance', 1, 1634825090, 0),
(1154, 1, 7, 'block/private_files:myaddinstance', 1, 1634825091, 0),
(1155, 1, 3, 'block/private_files:addinstance', 1, 1634825091, 0),
(1156, 1, 1, 'block/private_files:addinstance', 1, 1634825091, 0),
(1157, 1, 3, 'block/recent_activity:addinstance', 1, 1634825094, 0),
(1158, 1, 1, 'block/recent_activity:addinstance', 1, 1634825094, 0),
(1159, 1, 7, 'block/recent_activity:viewaddupdatemodule', 1, 1634825094, 0),
(1160, 1, 7, 'block/recent_activity:viewdeletemodule', 1, 1634825095, 0),
(1161, 1, 7, 'block/recentlyaccesseditems:myaddinstance', 1, 1634825098, 0),
(1162, 1, 7, 'block/rss_client:myaddinstance', 1, 1634825101, 0),
(1163, 1, 3, 'block/rss_client:addinstance', 1, 1634825101, 0),
(1164, 1, 1, 'block/rss_client:addinstance', 1, 1634825102, 0),
(1165, 1, 4, 'block/rss_client:manageownfeeds', 1, 1634825102, 0),
(1166, 1, 3, 'block/rss_client:manageownfeeds', 1, 1634825102, 0),
(1167, 1, 1, 'block/rss_client:manageownfeeds', 1, 1634825102, 0),
(1168, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1634825103, 0),
(1169, 1, 3, 'block/search_forums:addinstance', 1, 1634825104, 0),
(1170, 1, 1, 'block/search_forums:addinstance', 1, 1634825104, 0),
(1171, 1, 3, 'block/selfcompletion:addinstance', 1, 1634825106, 0),
(1172, 1, 1, 'block/selfcompletion:addinstance', 1, 1634825106, 0),
(1173, 1, 3, 'block/site_main_menu:addinstance', 1, 1634825107, 0),
(1174, 1, 1, 'block/site_main_menu:addinstance', 1, 1634825108, 0),
(1175, 1, 7, 'block/starredcourses:myaddinstance', 1, 1634825109, 0),
(1176, 1, 3, 'block/tag_youtube:addinstance', 1, 1634825112, 0),
(1177, 1, 1, 'block/tag_youtube:addinstance', 1, 1634825113, 0),
(1178, 1, 4, 'report/completion:view', 1, 1634825201, 0),
(1179, 1, 3, 'report/completion:view', 1, 1634825201, 0),
(1180, 1, 1, 'report/completion:view', 1, 1634825201, 0),
(1181, 1, 4, 'report/courseoverview:view', 1, 1634825204, 0),
(1182, 1, 3, 'report/courseoverview:view', 1, 1634825205, 0),
(1183, 1, 1, 'report/courseoverview:view', 1, 1634825205, 0),
(1184, 1, 4, 'report/log:view', 1, 1634825212, 0),
(1185, 1, 3, 'report/log:view', 1, 1634825212, 0),
(1186, 1, 1, 'report/log:view', 1, 1634825212, 0),
(1187, 1, 4, 'report/log:viewtoday', 1, 1634825212, 0),
(1188, 1, 3, 'report/log:viewtoday', 1, 1634825213, 0),
(1189, 1, 1, 'report/log:viewtoday', 1, 1634825213, 0),
(1190, 1, 4, 'report/loglive:view', 1, 1634825215, 0),
(1191, 1, 3, 'report/loglive:view', 1, 1634825215, 0),
(1192, 1, 1, 'report/loglive:view', 1, 1634825215, 0),
(1193, 1, 4, 'report/outline:view', 1, 1634825217, 0),
(1194, 1, 3, 'report/outline:view', 1, 1634825217, 0),
(1195, 1, 1, 'report/outline:view', 1, 1634825217, 0),
(1196, 1, 4, 'report/outline:viewuserreport', 1, 1634825218, 0),
(1197, 1, 3, 'report/outline:viewuserreport', 1, 1634825218, 0),
(1198, 1, 1, 'report/outline:viewuserreport', 1, 1634825218, 0),
(1199, 1, 4, 'report/participation:view', 1, 1634825220, 0),
(1200, 1, 3, 'report/participation:view', 1, 1634825220, 0),
(1201, 1, 1, 'report/participation:view', 1, 1634825220, 0),
(1202, 1, 1, 'report/performance:view', 1, 1634825222, 0),
(1203, 1, 4, 'report/progress:view', 1, 1634825224, 0),
(1204, 1, 3, 'report/progress:view', 1, 1634825224, 0),
(1205, 1, 1, 'report/progress:view', 1, 1634825224, 0),
(1206, 1, 1, 'report/security:view', 1, 1634825228, 0),
(1207, 1, 4, 'report/stats:view', 1, 1634825230, 0),
(1208, 1, 3, 'report/stats:view', 1, 1634825230, 0),
(1209, 1, 1, 'report/stats:view', 1, 1634825230, 0),
(1210, 1, 1, 'report/status:view', 1, 1634825232, 0),
(1211, 1, 6, 'report/usersessions:manageownsessions', -1000, 1634825233, 0),
(1212, 1, 7, 'report/usersessions:manageownsessions', 1, 1634825234, 0),
(1213, 1, 1, 'report/usersessions:manageownsessions', 1, 1634825234, 0),
(1214, 1, 4, 'gradeexport/ods:view', 1, 1634825235, 0),
(1215, 1, 3, 'gradeexport/ods:view', 1, 1634825236, 0),
(1216, 1, 1, 'gradeexport/ods:view', 1, 1634825236, 0),
(1217, 1, 1, 'gradeexport/ods:publish', 1, 1634825236, 0),
(1218, 1, 4, 'gradeexport/txt:view', 1, 1634825238, 0),
(1219, 1, 3, 'gradeexport/txt:view', 1, 1634825238, 0),
(1220, 1, 1, 'gradeexport/txt:view', 1, 1634825238, 0),
(1221, 1, 1, 'gradeexport/txt:publish', 1, 1634825238, 0),
(1222, 1, 4, 'gradeexport/xls:view', 1, 1634825240, 0),
(1223, 1, 3, 'gradeexport/xls:view', 1, 1634825240, 0),
(1224, 1, 1, 'gradeexport/xls:view', 1, 1634825240, 0),
(1225, 1, 1, 'gradeexport/xls:publish', 1, 1634825241, 0),
(1226, 1, 4, 'gradeexport/xml:view', 1, 1634825242, 0),
(1227, 1, 3, 'gradeexport/xml:view', 1, 1634825242, 0),
(1228, 1, 1, 'gradeexport/xml:view', 1, 1634825243, 0),
(1229, 1, 1, 'gradeexport/xml:publish', 1, 1634825243, 0),
(1230, 1, 3, 'gradeimport/csv:view', 1, 1634825245, 0),
(1231, 1, 1, 'gradeimport/csv:view', 1, 1634825245, 0),
(1232, 1, 3, 'gradeimport/direct:view', 1, 1634825246, 0),
(1233, 1, 1, 'gradeimport/direct:view', 1, 1634825247, 0),
(1234, 1, 3, 'gradeimport/xml:view', 1, 1634825248, 0),
(1235, 1, 1, 'gradeimport/xml:view', 1, 1634825248, 0),
(1236, 1, 1, 'gradeimport/xml:publish', 1, 1634825249, 0),
(1237, 1, 4, 'gradereport/grader:view', 1, 1634825250, 0),
(1238, 1, 3, 'gradereport/grader:view', 1, 1634825250, 0),
(1239, 1, 1, 'gradereport/grader:view', 1, 1634825250, 0),
(1240, 1, 4, 'gradereport/history:view', 1, 1634825252, 0),
(1241, 1, 3, 'gradereport/history:view', 1, 1634825252, 0),
(1242, 1, 1, 'gradereport/history:view', 1, 1634825252, 0),
(1243, 1, 4, 'gradereport/outcomes:view', 1, 1634825254, 0),
(1244, 1, 3, 'gradereport/outcomes:view', 1, 1634825254, 0),
(1245, 1, 1, 'gradereport/outcomes:view', 1, 1634825254, 0),
(1246, 1, 7, 'gradereport/overview:view', 1, 1634825256, 0),
(1247, 1, 3, 'gradereport/singleview:view', 1, 1634825258, 0),
(1248, 1, 1, 'gradereport/singleview:view', 1, 1634825258, 0),
(1249, 1, 5, 'gradereport/user:view', 1, 1634825259, 0),
(1250, 1, 4, 'gradereport/user:view', 1, 1634825260, 0),
(1251, 1, 3, 'gradereport/user:view', 1, 1634825260, 0),
(1252, 1, 1, 'gradereport/user:view', 1, 1634825260, 0),
(1253, 1, 7, 'repository/areafiles:view', 1, 1634825285, 0),
(1254, 1, 7, 'repository/boxnet:view', 1, 1634825287, 0),
(1255, 1, 2, 'repository/contentbank:view', 1, 1634825290, 0),
(1256, 1, 3, 'repository/contentbank:view', 1, 1634825290, 0),
(1257, 1, 1, 'repository/contentbank:view', 1, 1634825290, 0),
(1258, 1, 2, 'repository/contentbank:accesscoursecontent', 1, 1634825291, 0),
(1259, 1, 3, 'repository/contentbank:accesscoursecontent', 1, 1634825291, 0),
(1260, 1, 1, 'repository/contentbank:accesscoursecontent', 1, 1634825291, 0),
(1261, 1, 2, 'repository/contentbank:accesscoursecategorycontent', 1, 1634825292, 0),
(1262, 1, 1, 'repository/contentbank:accesscoursecategorycontent', 1, 1634825292, 0),
(1263, 1, 7, 'repository/contentbank:accessgeneralcontent', 1, 1634825292, 0),
(1264, 1, 2, 'repository/coursefiles:view', 1, 1634825294, 0),
(1265, 1, 4, 'repository/coursefiles:view', 1, 1634825294, 0),
(1266, 1, 3, 'repository/coursefiles:view', 1, 1634825295, 0),
(1267, 1, 1, 'repository/coursefiles:view', 1, 1634825295, 0),
(1268, 1, 7, 'repository/dropbox:view', 1, 1634825297, 0),
(1269, 1, 7, 'repository/equella:view', 1, 1634825299, 0),
(1270, 1, 2, 'repository/filesystem:view', 1, 1634825301, 0),
(1271, 1, 4, 'repository/filesystem:view', 1, 1634825301, 0),
(1272, 1, 3, 'repository/filesystem:view', 1, 1634825301, 0),
(1273, 1, 1, 'repository/filesystem:view', 1, 1634825302, 0),
(1274, 1, 7, 'repository/flickr:view', 1, 1634825304, 0),
(1275, 1, 7, 'repository/flickr_public:view', 1, 1634825306, 0),
(1276, 1, 7, 'repository/googledocs:view', 1, 1634825308, 0),
(1277, 1, 2, 'repository/local:view', 1, 1634825311, 0),
(1278, 1, 4, 'repository/local:view', 1, 1634825311, 0),
(1279, 1, 3, 'repository/local:view', 1, 1634825311, 0),
(1280, 1, 1, 'repository/local:view', 1, 1634825311, 0),
(1281, 1, 7, 'repository/merlot:view', 1, 1634825313, 0),
(1282, 1, 7, 'repository/nextcloud:view', 1, 1634825315, 0),
(1283, 1, 7, 'repository/onedrive:view', 1, 1634825317, 0),
(1284, 1, 7, 'repository/picasa:view', 1, 1634825319, 0),
(1285, 1, 7, 'repository/recent:view', 1, 1634825322, 0),
(1286, 1, 7, 'repository/s3:view', 1, 1634825323, 0),
(1287, 1, 7, 'repository/skydrive:view', 1, 1634825324, 0),
(1288, 1, 7, 'repository/upload:view', 1, 1634825327, 0),
(1289, 1, 7, 'repository/url:view', 1, 1634825330, 0),
(1290, 1, 7, 'repository/user:view', 1, 1634825333, 0),
(1291, 1, 2, 'repository/webdav:view', 1, 1634825334, 0),
(1292, 1, 4, 'repository/webdav:view', 1, 1634825334, 0),
(1293, 1, 3, 'repository/webdav:view', 1, 1634825334, 0),
(1294, 1, 1, 'repository/webdav:view', 1, 1634825335, 0),
(1295, 1, 7, 'repository/wikimedia:view', 1, 1634825337, 0),
(1296, 1, 7, 'repository/youtube:view', 1, 1634825339, 0),
(1297, 1, 4, 'tool/brickfield:viewcoursetools', 1, 1634825566, 0),
(1298, 1, 3, 'tool/brickfield:viewcoursetools', 1, 1634825566, 0),
(1299, 1, 1, 'tool/brickfield:viewcoursetools', 1, 1634825566, 0),
(1300, 1, 1, 'tool/brickfield:viewsystemtools', 1, 1634825566, 0),
(1301, 1, 1, 'tool/customlang:view', 1, 1634825578, 0),
(1302, 1, 1, 'tool/customlang:edit', 1, 1634825578, 0),
(1303, 1, 1, 'tool/customlang:export', 1, 1634825578, 0),
(1304, 1, 7, 'tool/dataprivacy:downloadownrequest', 1, 1634825591, 0),
(1305, 1, 7, 'tool/dataprivacy:requestdelete', 1, 1634825592, 0),
(1306, 1, 1, 'tool/lpmigrate:frameworksmigrate', 1, 1634825618, 0),
(1307, 1, 4, 'tool/monitor:subscribe', 1, 1634825630, 0),
(1308, 1, 3, 'tool/monitor:subscribe', 1, 1634825630, 0),
(1309, 1, 1, 'tool/monitor:subscribe', 1, 1634825630, 0),
(1310, 1, 4, 'tool/monitor:managerules', 1, 1634825631, 0),
(1311, 1, 3, 'tool/monitor:managerules', 1, 1634825631, 0),
(1312, 1, 1, 'tool/monitor:managerules', 1, 1634825631, 0),
(1313, 1, 1, 'tool/monitor:managetool', 1, 1634825631, 0),
(1314, 1, 7, 'tool/policy:accept', 1, 1634825643, 0),
(1315, 1, 1, 'tool/policy:managedocs', 1, 1634825643, 0),
(1316, 1, 1, 'tool/policy:viewacceptances', 1, 1634825644, 0),
(1317, 1, 3, 'tool/recyclebin:deleteitems', 1, 1634825651, 0),
(1318, 1, 1, 'tool/recyclebin:deleteitems', 1, 1634825651, 0),
(1319, 1, 3, 'tool/recyclebin:restoreitems', 1, 1634825652, 0),
(1320, 1, 1, 'tool/recyclebin:restoreitems', 1, 1634825652, 0),
(1321, 1, 4, 'tool/recyclebin:viewitems', 1, 1634825652, 0),
(1322, 1, 3, 'tool/recyclebin:viewitems', 1, 1634825652, 0),
(1323, 1, 1, 'tool/recyclebin:viewitems', 1, 1634825653, 0),
(1324, 1, 1, 'tool/uploaduser:uploaduserpictures', 1, 1634825663, 0),
(1325, 1, 1, 'tool/usertours:managetours', 1, 1634825674, 0),
(1326, 1, 1, 'contenttype/h5p:access', 1, 1634825691, 0),
(1327, 1, 2, 'contenttype/h5p:access', 1, 1634825691, 0),
(1328, 1, 3, 'contenttype/h5p:access', 1, 1634825691, 0),
(1329, 1, 1, 'contenttype/h5p:upload', 1, 1634825692, 0),
(1330, 1, 2, 'contenttype/h5p:upload', 1, 1634825692, 0),
(1331, 1, 3, 'contenttype/h5p:upload', 1, 1634825692, 0),
(1332, 1, 1, 'contenttype/h5p:useeditor', 1, 1634825692, 0),
(1333, 1, 2, 'contenttype/h5p:useeditor', 1, 1634825693, 0),
(1334, 1, 3, 'contenttype/h5p:useeditor', 1, 1634825693, 0),
(1335, 1, 3, 'booktool/importhtml:import', 1, 1634825740, 0),
(1336, 1, 1, 'booktool/importhtml:import', 1, 1634825740, 0),
(1337, 1, 6, 'booktool/print:print', 1, 1634825741, 0),
(1338, 1, 8, 'booktool/print:print', 1, 1634825742, 0),
(1339, 1, 5, 'booktool/print:print', 1, 1634825742, 0),
(1340, 1, 4, 'booktool/print:print', 1, 1634825742, 0),
(1341, 1, 3, 'booktool/print:print', 1, 1634825742, 0),
(1342, 1, 1, 'booktool/print:print', 1, 1634825742, 0),
(1343, 1, 4, 'forumreport/summary:view', 1, 1634825760, 0),
(1344, 1, 3, 'forumreport/summary:view', 1, 1634825760, 0),
(1345, 1, 1, 'forumreport/summary:view', 1, 1634825761, 0),
(1346, 1, 4, 'forumreport/summary:viewall', 1, 1634825761, 0),
(1347, 1, 3, 'forumreport/summary:viewall', 1, 1634825761, 0),
(1348, 1, 1, 'forumreport/summary:viewall', 1, 1634825762, 0),
(1349, 1, 4, 'quiz/grading:viewstudentnames', 1, 1634825773, 0),
(1350, 1, 3, 'quiz/grading:viewstudentnames', 1, 1634825773, 0),
(1351, 1, 1, 'quiz/grading:viewstudentnames', 1, 1634825773, 0),
(1352, 1, 4, 'quiz/grading:viewidnumber', 1, 1634825774, 0),
(1353, 1, 3, 'quiz/grading:viewidnumber', 1, 1634825774, 0),
(1354, 1, 1, 'quiz/grading:viewidnumber', 1, 1634825774, 0),
(1355, 1, 4, 'quiz/statistics:view', 1, 1634825783, 0),
(1356, 1, 3, 'quiz/statistics:view', 1, 1634825783, 0),
(1357, 1, 1, 'quiz/statistics:view', 1, 1634825783, 0),
(1358, 1, 1, 'quizaccess/seb:managetemplates', 1, 1634825796, 0),
(1359, 1, 1, 'quizaccess/seb:bypassseb', 1, 1634825796, 0),
(1360, 1, 3, 'quizaccess/seb:bypassseb', 1, 1634825796, 0),
(1361, 1, 1, 'quizaccess/seb:manage_seb_requiresafeexambrowser', 1, 1634825797, 0),
(1362, 1, 3, 'quizaccess/seb:manage_seb_requiresafeexambrowser', 1, 1634825797, 0),
(1363, 1, 1, 'quizaccess/seb:manage_seb_templateid', 1, 1634825797, 0),
(1364, 1, 3, 'quizaccess/seb:manage_seb_templateid', 1, 1634825798, 0),
(1365, 1, 1, 'quizaccess/seb:manage_filemanager_sebconfigfile', 1, 1634825798, 0),
(1366, 1, 3, 'quizaccess/seb:manage_filemanager_sebconfigfile', 1, 1634825798, 0),
(1367, 1, 1, 'quizaccess/seb:manage_seb_showsebdownloadlink', 1, 1634825799, 0),
(1368, 1, 3, 'quizaccess/seb:manage_seb_showsebdownloadlink', 1, 1634825800, 0),
(1369, 1, 1, 'quizaccess/seb:manage_seb_allowedbrowserexamkeys', 1, 1634825800, 0),
(1370, 1, 3, 'quizaccess/seb:manage_seb_allowedbrowserexamkeys', 1, 1634825800, 0),
(1371, 1, 1, 'quizaccess/seb:manage_seb_linkquitseb', 1, 1634825801, 0),
(1372, 1, 3, 'quizaccess/seb:manage_seb_linkquitseb', 1, 1634825801, 0),
(1373, 1, 1, 'quizaccess/seb:manage_seb_userconfirmquit', 1, 1634825801, 0),
(1374, 1, 3, 'quizaccess/seb:manage_seb_userconfirmquit', 1, 1634825802, 0),
(1375, 1, 1, 'quizaccess/seb:manage_seb_allowuserquitseb', 1, 1634825802, 0),
(1376, 1, 3, 'quizaccess/seb:manage_seb_allowuserquitseb', 1, 1634825803, 0),
(1377, 1, 1, 'quizaccess/seb:manage_seb_quitpassword', 1, 1634825803, 0),
(1378, 1, 3, 'quizaccess/seb:manage_seb_quitpassword', 1, 1634825803, 0),
(1379, 1, 1, 'quizaccess/seb:manage_seb_allowreloadinexam', 1, 1634825804, 0),
(1380, 1, 3, 'quizaccess/seb:manage_seb_allowreloadinexam', 1, 1634825804, 0),
(1381, 1, 1, 'quizaccess/seb:manage_seb_showsebtaskbar', 1, 1634825804, 0),
(1382, 1, 3, 'quizaccess/seb:manage_seb_showsebtaskbar', 1, 1634825804, 0),
(1383, 1, 1, 'quizaccess/seb:manage_seb_showreloadbutton', 1, 1634825805, 0),
(1384, 1, 3, 'quizaccess/seb:manage_seb_showreloadbutton', 1, 1634825805, 0),
(1385, 1, 1, 'quizaccess/seb:manage_seb_showtime', 1, 1634825806, 0),
(1386, 1, 3, 'quizaccess/seb:manage_seb_showtime', 1, 1634825806, 0),
(1387, 1, 1, 'quizaccess/seb:manage_seb_showkeyboardlayout', 1, 1634825806, 0),
(1388, 1, 3, 'quizaccess/seb:manage_seb_showkeyboardlayout', 1, 1634825806, 0),
(1389, 1, 1, 'quizaccess/seb:manage_seb_showwificontrol', 1, 1634825807, 0),
(1390, 1, 3, 'quizaccess/seb:manage_seb_showwificontrol', 1, 1634825807, 0),
(1391, 1, 1, 'quizaccess/seb:manage_seb_enableaudiocontrol', 1, 1634825807, 0),
(1392, 1, 3, 'quizaccess/seb:manage_seb_enableaudiocontrol', 1, 1634825808, 0),
(1393, 1, 1, 'quizaccess/seb:manage_seb_muteonstartup', 1, 1634825808, 0),
(1394, 1, 3, 'quizaccess/seb:manage_seb_muteonstartup', 1, 1634825808, 0),
(1395, 1, 1, 'quizaccess/seb:manage_seb_allowspellchecking', 1, 1634825809, 0),
(1396, 1, 3, 'quizaccess/seb:manage_seb_allowspellchecking', 1, 1634825809, 0),
(1397, 1, 1, 'quizaccess/seb:manage_seb_activateurlfiltering', 1, 1634825809, 0),
(1398, 1, 3, 'quizaccess/seb:manage_seb_activateurlfiltering', 1, 1634825810, 0),
(1399, 1, 1, 'quizaccess/seb:manage_seb_filterembeddedcontent', 1, 1634825810, 0),
(1400, 1, 3, 'quizaccess/seb:manage_seb_filterembeddedcontent', 1, 1634825810, 0),
(1401, 1, 1, 'quizaccess/seb:manage_seb_expressionsallowed', 1, 1634825811, 0),
(1402, 1, 3, 'quizaccess/seb:manage_seb_expressionsallowed', 1, 1634825811, 0),
(1403, 1, 1, 'quizaccess/seb:manage_seb_regexallowed', 1, 1634825811, 0),
(1404, 1, 3, 'quizaccess/seb:manage_seb_regexallowed', 1, 1634825811, 0),
(1405, 1, 1, 'quizaccess/seb:manage_seb_expressionsblocked', 1, 1634825812, 0),
(1406, 1, 3, 'quizaccess/seb:manage_seb_expressionsblocked', 1, 1634825812, 0),
(1407, 1, 1, 'quizaccess/seb:manage_seb_regexblocked', 1, 1634825812, 0),
(1408, 1, 3, 'quizaccess/seb:manage_seb_regexblocked', 1, 1634825813, 0),
(1409, 1, 3, 'atto/h5p:addembed', 1, 1634825860, 0),
(1410, 1, 7, 'atto/recordrtc:recordaudio', 1, 1634825872, 0),
(1411, 1, 7, 'atto/recordrtc:recordvideo', 1, 1634825873, 0),
(1412, 8, 5, 'moodle/category:viewcourselist', 1, 1634988749, 2),
(1413, 8, 3, 'moodle/category:viewcourselist', 1, 1634988770, 2),
(1414, 13, 5, 'moodle/category:viewcourselist', 1, 1634988896, 2),
(1415, 13, 3, 'moodle/category:viewcourselist', 1, 1634988946, 2),
(1416, 14, 5, 'moodle/category:viewcourselist', 1, 1634989169, 2),
(1417, 14, 3, 'moodle/category:viewcourselist', 1, 1634989180, 2),
(1418, 15, 5, 'moodle/category:viewcourselist', 1, 1634989251, 2),
(1419, 15, 3, 'moodle/category:viewcourselist', 1, 1634989305, 2),
(1420, 1, 7, 'block/skill_list:myaddinstance', 1, 1635331586, 2),
(1421, 1, 3, 'block/skill_list:addinstance', 1, 1635331588, 2),
(1422, 1, 1, 'block/skill_list:addinstance', 1, 1635331588, 2),
(1424, 8, 4, 'mod/quiz:viewreports', -1, 1636197728, 2),
(1425, 8, 5, 'moodle/role:assign', 1, 1636197772, 2),
(1426, 8, 5, 'mod/quiz:viewreports', -1, 1636198153, 2),
(1427, 8, 5, 'mod/quiz:regrade', -1, 1636198384, 2),
(1428, 8, 5, 'mod/quiz:preview', -1, 1636198376, 2),
(1429, 8, 4, 'mod/quiz:viewoverrides', -1, 1636199189, 2),
(1430, 8, 5, 'mod/quiz:viewoverrides', 1, 1636199193, 2),
(1432, 8, 5, 'mod/quiz:manageoverrides', -1, 1636199356, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_context_levels`
--

CREATE TABLE `mdl_role_context_levels` (
  `id` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  `contextlevel` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lists which roles can be assigned at which context levels. T' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_names`
--

CREATE TABLE `mdl_role_names` (
  `id` bigint NOT NULL,
  `roleid` bigint NOT NULL DEFAULT '0',
  `contextid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='role names in native strings' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_role_names`
--

INSERT INTO `mdl_role_names` (`id`, `roleid`, `contextid`, `name`) VALUES
(1, 5, 47, 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale`
--

CREATE TABLE `mdl_scale` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `scale` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Defines grading scales' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_scale`
--

INSERT INTO `mdl_scale` (`id`, `courseid`, `userid`, `name`, `scale`, `description`, `descriptionformat`, `timemodified`) VALUES
(1, 0, 0, 'Separate and Connected ways of knowing', 'Mostly separate knowing,Separate and connected,Mostly connected knowing', 'The scale based on the theory of separate and connected knowing. This theory describes two different ways that we can evaluate and learn about the things we see and hear.<ul><li><strong>Separate knowers</strong> remain as objective as possible without including feelings and emotions. In a discussion with other people, they like to defend their own ideas, using logic to find holes in opponent\'s ideas.</li><li><strong>Connected knowers</strong> are more sensitive to other people. They are skilled at empathy and tend to listen and ask questions until they feel they can connect and \"understand things from their point of view\". They learn by trying to share the experiences that led to the knowledge they find in other people.</li></ul>', 0, 1634823403),
(2, 0, 0, 'Default competence scale', 'Not yet competent,Competent', 'A binary rating scale that provides no further information beyond whether someone has demonstrated proficiency or not.', 0, 1634823404);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale_history`
--

CREATE TABLE `mdl_scale_history` (
  `id` bigint NOT NULL,
  `action` bigint NOT NULL DEFAULT '0',
  `oldid` bigint NOT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `loggeduser` bigint DEFAULT NULL,
  `courseid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `scale` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='History table' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm`
--

CREATE TABLE `mdl_scorm` (
  `id` bigint NOT NULL,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `introformat` smallint NOT NULL DEFAULT '0',
  `version` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint NOT NULL DEFAULT '0',
  `whatgrade` bigint NOT NULL DEFAULT '0',
  `maxattempt` bigint NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '0',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `masteryoverride` tinyint(1) NOT NULL DEFAULT '1',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '0',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `md5hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `revision` bigint NOT NULL DEFAULT '0',
  `launch` bigint NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint DEFAULT '-100',
  `navpositiontop` bigint DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `width` bigint NOT NULL DEFAULT '100',
  `height` bigint NOT NULL DEFAULT '600',
  `timeopen` bigint NOT NULL DEFAULT '0',
  `timeclose` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` bigint DEFAULT NULL,
  `completionstatusallscos` tinyint(1) DEFAULT NULL,
  `displayactivityname` smallint NOT NULL DEFAULT '1',
  `autocommit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='each table is one SCORM module and its configuration' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_aicc_session`
--

CREATE TABLE `mdl_scorm_aicc_session` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `scormid` bigint NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `scoid` bigint DEFAULT '0',
  `scormmode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `scormstatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `attempt` bigint DEFAULT NULL,
  `lessonstatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sessiontime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Used by AICC HACP to store session information' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes`
--

CREATE TABLE `mdl_scorm_scoes` (
  `id` bigint NOT NULL,
  `scorm` bigint NOT NULL DEFAULT '0',
  `manifest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `launch` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `scormtype` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `sortorder` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='each SCO part of the SCORM module' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_data`
--

CREATE TABLE `mdl_scorm_scoes_data` (
  `id` bigint NOT NULL,
  `scoid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains variable data get from packages' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_track`
--

CREATE TABLE `mdl_scorm_scoes_track` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `scormid` bigint NOT NULL DEFAULT '0',
  `scoid` bigint NOT NULL DEFAULT '0',
  `attempt` bigint NOT NULL DEFAULT '1',
  `element` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='to track SCOes' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

CREATE TABLE `mdl_scorm_seq_mapinfo` (
  `id` bigint NOT NULL,
  `scoid` bigint NOT NULL DEFAULT '0',
  `objectiveid` bigint NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='SCORM2004 objective mapinfo description' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_objective`
--

CREATE TABLE `mdl_scorm_seq_objective` (
  `id` bigint NOT NULL,
  `scoid` bigint NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='SCORM2004 objective description' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

CREATE TABLE `mdl_scorm_seq_rolluprule` (
  `id` bigint NOT NULL,
  `scoid` bigint NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `minimumcount` bigint NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='SCORM2004 sequencing rule' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE `mdl_scorm_seq_rolluprulecond` (
  `id` bigint NOT NULL,
  `scoid` bigint NOT NULL DEFAULT '0',
  `rollupruleid` bigint NOT NULL DEFAULT '0',
  `operator` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='SCORM2004 sequencing rule' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

CREATE TABLE `mdl_scorm_seq_rulecond` (
  `id` bigint NOT NULL,
  `scoid` bigint NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'always'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='SCORM2004 rule condition' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

CREATE TABLE `mdl_scorm_seq_ruleconds` (
  `id` bigint NOT NULL,
  `scoid` bigint NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint NOT NULL DEFAULT '0',
  `action` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='SCORM2004 rule conditions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_search_index_requests`
--

CREATE TABLE `mdl_search_index_requests` (
  `id` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `searcharea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timerequested` bigint NOT NULL,
  `partialarea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `partialtime` bigint NOT NULL,
  `indexpriority` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Records requests for (re)indexing of specific contexts. Entr' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_search_simpledb_index`
--

CREATE TABLE `mdl_search_simpledb_index` (
  `id` bigint NOT NULL,
  `docid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `contextid` bigint NOT NULL,
  `areaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL,
  `courseid` bigint NOT NULL,
  `owneruserid` bigint DEFAULT NULL,
  `modified` bigint NOT NULL,
  `userid` bigint DEFAULT NULL,
  `description1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `description2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='search_simpledb table containing the index data.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_sessions`
--

CREATE TABLE `mdl_sessions` (
  `id` bigint NOT NULL,
  `state` bigint NOT NULL DEFAULT '0',
  `sid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL,
  `sessdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `firstip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lastip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Database based session storage - now recommended' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(157, 0, 'cp1suba1161t0pumm7aj75taje', 0, NULL, 1635916297, 1635916371, '122.177.69.208', '122.177.69.208'),
(161, 0, 'q214mftmiem2i8fuci5n3br733', 2, NULL, 1635917507, 1635945538, '122.177.69.208', '175.111.182.34'),
(163, 0, 'jfdk41f7clt3abpjj4oqn9590t', 13, NULL, 1635921393, 1635939138, '175.111.182.34', '175.111.182.34'),
(164, 0, 'jnmp0m4vlaefhqju0u85i4gvpv', 0, NULL, 1635932319, 1635932319, '175.111.182.34', '175.111.182.34'),
(165, 0, 'e9vnit5t1db7gs2t9nonfhb2to', 0, NULL, 1635932319, 1635932319, '175.111.182.34', '175.111.182.34'),
(166, 0, '3kbbsefg1mfd0368fmdf2c2tlg', 0, NULL, 1635932510, 1635932510, '175.111.182.34', '175.111.182.34'),
(167, 0, 'cg6k9jrgopi4pifbejh08g2vnp', 0, NULL, 1635938190, 1635938190, '175.111.182.34', '175.111.182.34'),
(168, 0, 'kqd85p6nilt7dd6bt6ajjl3amd', 0, NULL, 1635940245, 1635940245, '175.111.182.34', '175.111.182.34'),
(172, 0, 'geueru7u2limhtoct7qd6p0jd3', 13, NULL, 1636088082, 1636110497, '122.177.69.208', '175.111.182.34'),
(173, 0, 'jhnlikikj6nlh7sts16bh1o4rf', 0, NULL, 1636114949, 1636114949, '52.114.32.212', '52.114.32.212'),
(176, 0, 'tfgkuignonpntli18r0a28hdj5', 0, NULL, 1636181212, 1636181212, '122.177.71.17', '122.177.71.17'),
(177, 0, '183b0bgq47sg9da3qkdsrr5890', 0, NULL, 1636181305, 1636181305, '122.177.71.17', '122.177.71.17'),
(179, 0, 'ihpjej1pfvcib4jbn8qtb5ehof', 13, NULL, 1636185758, 1636205909, '122.177.71.17', '122.177.71.17'),
(180, 0, 'ruci53slmbgoc495ngecokh1ok', 0, NULL, 1636188903, 1636188903, '52.114.32.212', '52.114.32.212'),
(181, 0, 'ru4vqfkh1atd906o19efg8d0j7', 0, NULL, 1636188903, 1636188903, '52.114.32.212', '52.114.32.212'),
(182, 0, '3bgkv7a9o53p5isu8t5puvpjb1', 0, NULL, 1636191224, 1636191224, '52.114.32.212', '52.114.32.212'),
(185, 0, 'dombq2e8fp0cvoe1eplll7bujk', 0, NULL, 1636201947, 1636201947, '52.114.32.212', '52.114.32.212'),
(186, 0, 'tmcvj5rm2g1j9iiuubremslhn7', 0, NULL, 1636206109, 1636206109, '52.114.14.71', '52.114.14.71'),
(187, 0, '2490bc7ifa3h5f1rnlubd6egp0', 0, NULL, 1636206109, 1636206109, '52.114.14.71', '52.114.14.71'),
(188, 0, '361u0s8f7m8gtssctt2ppp9ic3', 0, NULL, 1636346945, 1636346945, '175.111.182.34', '175.111.182.34'),
(192, 0, 'gon9ab4h12cuqjd7bgbq6g0o3s', 13, NULL, 1636347152, 1636379268, '175.111.182.34', '175.111.182.34'),
(193, 0, '3d7jhp0qotav58d0idnh6792ln', 0, NULL, 1636358616, 1636358616, '175.111.182.34', '175.111.182.34'),
(194, 0, 'moo6njgrdj6ubcbfufgfs2leq9', 0, NULL, 1636369716, 1636369716, '175.111.182.34', '175.111.182.34'),
(195, 0, 'h6ikbipkgiuq2s2vla08nhsm2i', 0, NULL, 1636369716, 1636369716, '175.111.182.34', '175.111.182.34'),
(196, 0, '41rpu8mpams4i3cl3f7otebje2', 0, NULL, 1636379412, 1636379412, '52.114.14.71', '52.114.14.71'),
(197, 0, '7tfp1acknlivqq0vlbc2vk6dpo', 0, NULL, 1636379412, 1636379412, '52.114.14.71', '52.114.14.71'),
(201, 0, 'go9sdmmm3fta45asrg9lvcdosc', 13, NULL, 1636442538, 1636456191, '175.111.182.34', '175.111.182.34'),
(202, 0, 'pekhv62te7cahlkp91rq40bmpd', 0, NULL, 1636445037, 1636445037, '175.111.182.34', '175.111.182.34'),
(203, 0, 'ca848m7h4m8dq4h6t114g4g3sq', 0, NULL, 1636458738, 1636458738, '175.111.182.34', '175.111.182.34'),
(204, 0, '8007espv96qirkea4nvs1n4col', 0, NULL, 1636519623, 1636519623, '175.111.182.34', '175.111.182.34'),
(206, 0, '6p711ssds461tjl9elu5hs1iop', 2, NULL, 1636519721, 1636551186, '175.111.182.34', '175.111.182.34'),
(208, 0, 'q1jirnaf4pmd8g2hqftia9jaka', 13, NULL, 1636519786, 1636550718, '175.111.182.34', '175.111.182.34'),
(210, 0, 'pdvtj8hrjhio3ah0nk29seh5k4', 2, NULL, 1636606936, 1636634993, '122.177.71.17', '175.111.182.34'),
(212, 0, 'tmg4o239eevjv768pp83hh7hjk', 13, NULL, 1636607094, 1636617916, '122.177.71.17', '175.111.182.34'),
(213, 0, '4be5vt1uahnjpsum1ub9kfb37o', 0, NULL, 1636608802, 1636608802, '175.111.182.34', '175.111.182.34'),
(214, 0, 'q314et8h8lgff216tuac7t1lrl', 0, NULL, 1636608827, 1636608827, '175.111.182.34', '175.111.182.34'),
(215, 0, 'd0sioj88kjpm1angqpnhbj1led', 0, NULL, 1636614075, 1636614078, '223.225.75.230', '223.225.75.230'),
(216, 0, 'olr3ljo570noqq3ug55242je03', 0, NULL, 1636625602, 1636625602, '175.111.182.34', '175.111.182.34'),
(217, 0, '4f0l5iie68fhm0v5fvc4ccu52l', 0, NULL, 1636625603, 1636625603, '175.111.182.34', '175.111.182.34'),
(218, 0, 'unr2rrb130lfjb9eur4v7tt5oc', 0, NULL, 1636631490, 1636631490, '175.111.182.34', '175.111.182.34'),
(220, 0, '47p8a3bf8b3f923ila9n3pktk4', 2, NULL, 1636635824, 1636638712, '175.111.182.34', '175.111.182.34'),
(222, 0, 'eorp1idc53inqmtht7vjk9fh5e', 2, NULL, 1636778972, 1636810545, '175.111.182.34', '175.111.182.34'),
(224, 0, 'nbpq2mqd893pbfd40hv63256fi', 2, NULL, 1636952145, 1636980723, '175.111.182.34', '122.177.74.21'),
(226, 0, 'ulip6eqalprapdl9c084jsvb19', 2, NULL, 1636968420, 1636968421, '122.177.74.21', '122.177.74.21'),
(227, 0, 'lsdjh1srrkh0e0edcmdonahb1v', 0, NULL, 1636977880, 1636977880, '122.177.74.21', '122.177.74.21'),
(228, 0, 'gc774da62uueif7hlslhco6osa', 0, NULL, 1636977884, 1636977884, '122.177.74.21', '122.177.74.21'),
(230, 0, 't0nga43f005qpmkjqfvru2lj1u', 2, NULL, 1637038983, 1637069411, '122.177.73.7', '122.177.73.7'),
(231, 0, 'to826558q5h4d2q9qsm3kctj6o', 0, NULL, 1637039674, 1637064980, '119.82.86.250', '59.144.171.90'),
(232, 0, 'd51feu9j8c01gjfghl6ju1jm2g', 0, NULL, 1637067472, 1637067472, '122.177.73.7', '122.177.73.7'),
(233, 0, 'oggdpho23via03ll0oijfpbc05', 0, NULL, 1637067477, 1637067477, '122.177.73.7', '122.177.73.7'),
(237, 0, '4ombfk4i8rn91d2rm5rh22a6km', 13, NULL, 1637125257, 1637125922, '175.111.182.34', '175.111.182.34'),
(239, 0, '6uonmdpkhbsmiq493o3tgebst6', 2, NULL, 1637131914, 1637156079, '175.111.182.34', '175.111.182.34'),
(240, 0, 'rp3511ug45sgjarflpesq0f873', 0, NULL, 1637151782, 1637151782, '52.114.32.212', '52.114.32.212'),
(242, 0, '4dvbik5u421jk1vpjcrv19oau3', 2, NULL, 1637211605, 1637249558, '175.111.182.34', '175.111.182.34'),
(244, 0, 'n6pr824qeg81ff1thmgodm7aq1', 13, NULL, 1637223256, 1637223257, '175.111.182.34', '175.111.182.34'),
(246, 0, '47m8k0th84jnf7h2otafgkcsav', 2, NULL, 1637297160, 1637329073, '175.111.182.34', '223.233.66.222'),
(248, 0, '8s6g67avf9hdfr3uqj538kil67', 2, NULL, 1637384232, 1637414679, '175.111.182.34', '175.111.182.34'),
(249, 0, '34ve7cdk5f0v3h25v675v4nkvc', 0, NULL, 1637409685, 1637409685, '175.111.182.34', '175.111.182.34'),
(250, 0, 'vi9878i03kgisrnh4nojqu255l', 0, NULL, 1637409686, 1637409686, '175.111.182.34', '175.111.182.34'),
(252, 0, 'jvbvlu9aft2b7le4lebtv9ova8', 2, NULL, 1637560612, 1637589841, '223.233.67.93', '122.177.69.46'),
(253, 0, 'qhq09akn23o2u56ktd4l7sfneo', 0, NULL, 1637585565, 1637585565, '122.177.69.46', '122.177.69.46'),
(254, 0, '5asveoq1beg97tm4g4ucs3760c', 0, NULL, 1637585568, 1637585568, '122.177.69.46', '122.177.69.46'),
(256, 0, 'tl2bc2jpvpsj69ppmbi5ebf1uc', 2, NULL, 1637645405, 1637665936, '122.177.69.46', '122.177.69.46'),
(257, 0, 'jb028qsuoqvga1nqb77nu7klre', 0, NULL, 1637646349, 1637646349, '122.177.69.46', '122.177.69.46'),
(259, 0, '1nve8eq8soofup0fjspufb11l8', 13, NULL, 1637659048, 1637664364, '122.177.69.46', '122.177.69.46'),
(261, 0, 'b8mhtj7bebab4kpsi4voptnght', 2, NULL, 1637729112, 1637760646, '175.111.182.34', '122.177.69.80'),
(262, 0, '9og5hrcd44nil3mfohbmj8mjme', 0, NULL, 1637729627, 1637729627, '175.111.182.34', '175.111.182.34'),
(264, 0, 'pk8vt075i5meko855qtts1801s', 13, NULL, 1637731889, 1637760305, '175.111.182.34', '122.177.69.80'),
(266, 0, 'tjo4kddo7h6f9fmh384jgib9t4', 2, NULL, 1637815946, 1637847026, '122.177.66.214', '175.111.182.34'),
(267, 0, 'd97jah3u8o3c64d7t55mssgp7k', 0, NULL, 1637816203, 1637816203, '122.177.66.214', '122.177.66.214'),
(268, 0, 'buln44j8o3nvs62ihl6rr192gu', 0, NULL, 1637816206, 1637816206, '122.177.66.214', '122.177.66.214'),
(269, 0, '2ntbu96fb8209cu9avdujqlnlt', 0, NULL, 1637822203, 1637822203, '122.177.66.214', '122.177.66.214'),
(270, 0, 'vsi59sudkn03tc3bnfrk6jd6nk', 0, NULL, 1637822206, 1637822206, '122.177.66.214', '122.177.66.214'),
(272, 0, 'le4kb6domm8lj2ed4gnuk60bao', 13, NULL, 1637823321, 1637828604, '122.177.66.214', '122.177.66.214'),
(273, 0, 'qc4bnrb7rhq1nlm99dranad32h', 0, NULL, 1637844271, 1637844271, '175.111.182.34', '175.111.182.34'),
(274, 0, '86027qi178gjiutjdlrth7q0lu', 0, NULL, 1637844272, 1637844272, '175.111.182.34', '175.111.182.34'),
(275, 0, '6g1jgr5pmhhtgjmft804mk7u9b', 0, NULL, 1637844992, 1637844992, '175.111.182.34', '175.111.182.34'),
(277, 0, 'm7i0a7hja16kkd1pn3o98kfl56', 2, NULL, 1637904405, 1637933697, '175.111.182.34', '175.111.182.34'),
(279, 0, '0sef1vgr328s4v0q119teldmjb', 13, NULL, 1637907893, 1637930470, '175.111.182.34', '175.111.182.34'),
(281, 0, '2at5857rtssaflc3lvh52m2uac', 2, NULL, 1638161409, 1638190497, '175.111.182.34', '175.111.182.34'),
(283, 0, 'f0i30dudpjp8n5k6kmn44733or', 13, NULL, 1638161519, 1638192468, '175.111.182.34', '175.111.182.34'),
(284, 0, '9saidlbg0uf56p0c15ajlpndl1', 0, NULL, 1638177856, 1638177856, '175.111.182.34', '175.111.182.34'),
(285, 0, '6j3idfrao5e045rg2dgkq4322t', 0, NULL, 1638177857, 1638177857, '175.111.182.34', '175.111.182.34'),
(286, 0, 'e85tjj35l1nope7mgoh83vbojk', 0, NULL, 1638177961, 1638177961, '175.111.182.34', '175.111.182.34'),
(288, 0, '4cl2u9dbko24m0f8f4klh8mg2p', 2, NULL, 1638249128, 1638278359, '175.111.182.34', '175.111.182.34'),
(290, 0, 'eku19ertn1i55mif3i994pjgso', 13, NULL, 1638249296, 1638279466, '175.111.182.34', '175.111.182.34'),
(291, 0, 'gl5t98j87h9lkgbn54ks5sbkrf', 0, NULL, 1638252240, 1638252240, '175.111.182.34', '175.111.182.34'),
(292, 0, '0nlopb4bbtdgbp1dobec3vapnu', 0, NULL, 1638252240, 1638252240, '175.111.182.34', '175.111.182.34'),
(293, 0, 'sfv8k48m3dd3rsq14risut8j1a', 0, NULL, 1638254900, 1638254900, '175.111.182.34', '175.111.182.34'),
(294, 0, 'tma3lifkojci9pf8574ejvbh44', 0, NULL, 1638260726, 1638260726, '175.111.182.34', '175.111.182.34'),
(295, 0, 'f78sfhlb13n4lm862kpiqe27qs', 0, NULL, 1638260728, 1638260728, '175.111.182.34', '175.111.182.34'),
(296, 0, '3902lldqc7dbspff1i4e8s5b6v', 0, NULL, 1638267621, 1638267621, '175.111.182.34', '175.111.182.34'),
(297, 0, '6ceen4brf5fn7m6hsl38vtnc0r', 0, NULL, 1638267622, 1638267622, '175.111.182.34', '175.111.182.34'),
(298, 0, '7103n52kqgagu9753kj55h51fq', 0, NULL, 1638270794, 1638270794, '175.111.182.34', '175.111.182.34'),
(299, 0, 'nasc89q5loj7pddbe6va7g6p94', 0, NULL, 1638272932, 1638272932, '175.111.182.34', '175.111.182.34'),
(301, 0, 'qrfupd0r1n2v0fel2co2i1lqqt', 0, NULL, 1638290618, 1638290626, '223.196.78.4', '223.196.78.4'),
(306, 0, '3kbgk1lgjh9buepmu5duj3mscn', 2, NULL, 1638334224, 1638360833, '175.111.182.34', '175.111.182.34'),
(308, 0, '70d2gme0m5fga74dfn3bkock6d', 13, NULL, 1638334710, 1638342156, '175.111.182.34', '175.111.182.34'),
(309, 0, 'pbkt2vlf0ve9gshrlqetpb3ujf', 0, NULL, 1638336362, 1638336362, '175.111.182.34', '175.111.182.34'),
(310, 0, 'n06bmle6dmr97n2avr54dsrq6k', 0, NULL, 1638336362, 1638336362, '175.111.182.34', '175.111.182.34'),
(316, 0, 'bmd20itm8o4upjjc72dthhdknn', 2, NULL, 1638343985, 1638344007, '152.57.204.146', '152.57.204.146'),
(317, 0, 'umsu70cvme81j7pbkp4tae59lf', 0, NULL, 1638355488, 1638355488, '175.111.182.34', '175.111.182.34'),
(318, 0, 'c7chphm6nq3tp42e6vq1na0dns', 0, NULL, 1638355863, 1638355863, '175.111.182.34', '175.111.182.34'),
(319, 0, 'j1c5sraaa1tc9qe3gr6a11clj2', 0, NULL, 1638360894, 1638360894, '52.114.14.71', '52.114.14.71');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_skill`
--

CREATE TABLE `mdl_skill` (
  `id` int NOT NULL,
  `skill` varchar(100) NOT NULL,
  `status` enum('active','deactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mdl_skill`
--

INSERT INTO `mdl_skill` (`id`, `skill`, `status`) VALUES
(1, 'Leadership', 'active'),
(2, 'Knowledge of Subject Area', 'active'),
(3, 'Classroom Management', 'active'),
(4, 'Facilitation and Engagement', 'active'),
(5, 'Assessment And Coaching', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_skill_proficiency_level`
--

CREATE TABLE `mdl_skill_proficiency_level` (
  `id` int NOT NULL,
  `assign_skill_id` int NOT NULL,
  `skill_id` int NOT NULL,
  `sub_skill_id` int NOT NULL,
  `proficiency_level` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `deleted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mdl_skill_proficiency_level`
--

INSERT INTO `mdl_skill_proficiency_level` (`id`, `assign_skill_id`, `skill_id`, `sub_skill_id`, `proficiency_level`, `deleted`, `modify`) VALUES
(1, 1, 1, 1, 'Awareness', '2021-11-25 06:31:11', '2021-11-25 06:31:11'),
(2, 1, 1, 2, 'Knowledge', '2021-11-25 06:31:11', '2021-11-25 06:31:11'),
(3, 1, 1, 3, 'Skilled', '2021-11-25 06:31:11', '2021-11-25 06:31:11'),
(4, 2, 2, 9, 'Skilled', '2021-11-25 06:32:17', '2021-11-25 06:32:17'),
(5, 2, 2, 10, 'Mastery', '2021-11-25 06:32:17', '2021-11-25 06:32:17'),
(6, 2, 2, 11, 'Awareness', '2021-11-25 06:32:17', '2021-11-25 06:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_skill_quiz_mapping`
--

CREATE TABLE `mdl_skill_quiz_mapping` (
  `id` int NOT NULL,
  `course_id` int NOT NULL,
  `skill_id` int NOT NULL,
  `sub_skill_id` int NOT NULL,
  `quiz_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mdl_skill_quiz_mapping`
--

INSERT INTO `mdl_skill_quiz_mapping` (`id`, `course_id`, `skill_id`, `sub_skill_id`, `quiz_id`) VALUES
(4, 5, 2, 9, 7),
(5, 5, 2, 10, 8),
(6, 5, 2, 11, 10),
(7, 5, 1, 1, 4),
(8, 5, 1, 2, 5),
(9, 5, 1, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_skill_weightage`
--

CREATE TABLE `mdl_skill_weightage` (
  `id` int NOT NULL,
  `skill_proficiency` varchar(64) NOT NULL,
  `skill_id` int NOT NULL,
  `default_course` int NOT NULL,
  `deleted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mdl_skill_weightage`
--

INSERT INTO `mdl_skill_weightage` (`id`, `skill_proficiency`, `skill_id`, `default_course`, `deleted`, `modify`) VALUES
(3, 'Mastery', 1, 5, '2021-11-18 10:51:04', '2021-11-18 10:51:04'),
(9, 'Mastery', 2, 4, '2021-11-25 05:56:44', '2021-11-25 05:56:44'),
(10, 'Knowledge', 1, 5, '2021-11-30 09:29:18', '2021-11-30 09:29:18'),
(11, 'Knowledge', 2, 4, '2021-11-30 09:29:44', '2021-11-30 09:29:44'),
(12, 'Skilled', 2, 4, '2021-11-30 09:40:06', '2021-11-30 09:40:06'),
(13, 'Skilled', 1, 5, '2021-11-30 09:43:13', '2021-11-30 09:43:13');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_skill_weightage_meta`
--

CREATE TABLE `mdl_skill_weightage_meta` (
  `id` int NOT NULL,
  `skill_id` int NOT NULL,
  `skill_weightage_id` int NOT NULL,
  `sub_skill_id` int NOT NULL,
  `sub_skill_proficiency` varchar(62) NOT NULL,
  `deleted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mdl_skill_weightage_meta`
--

INSERT INTO `mdl_skill_weightage_meta` (`id`, `skill_id`, `skill_weightage_id`, `sub_skill_id`, `sub_skill_proficiency`, `deleted`, `modify`) VALUES
(7, 1, 3, 1, 'Mastery', '2021-11-18 10:51:04', '2021-11-18 10:51:04'),
(8, 1, 3, 2, 'Awareness', '2021-11-18 10:51:04', '2021-11-18 10:51:04'),
(9, 1, 3, 3, 'Skilled', '2021-11-18 10:51:04', '2021-11-18 10:51:04'),
(25, 2, 9, 9, 'Mastery', '2021-11-25 05:56:44', '2021-11-25 05:56:44'),
(26, 2, 9, 10, 'Awareness', '2021-11-25 05:56:44', '2021-11-25 05:56:44'),
(27, 2, 9, 11, 'Knowledge', '2021-11-25 05:56:44', '2021-11-25 05:56:44'),
(28, 1, 10, 1, 'Knowledge', '2021-11-30 09:29:18', '2021-11-30 09:29:18'),
(29, 1, 10, 2, 'Skilled', '2021-11-30 09:29:18', '2021-11-30 09:29:18'),
(30, 1, 10, 3, 'Mastery', '2021-11-30 09:29:19', '2021-11-30 09:29:19'),
(31, 2, 11, 9, 'Knowledge', '2021-11-30 09:29:44', '2021-11-30 09:29:44'),
(32, 2, 11, 10, 'Skilled', '2021-11-30 09:29:44', '2021-11-30 09:29:44'),
(33, 2, 11, 11, 'Mastery', '2021-11-30 09:29:44', '2021-11-30 09:29:44'),
(34, 2, 12, 9, 'Skilled', '2021-11-30 09:40:07', '2021-11-30 09:40:07'),
(35, 2, 12, 10, 'Mastery', '2021-11-30 09:40:07', '2021-11-30 09:40:07'),
(36, 2, 12, 11, 'Awareness', '2021-11-30 09:40:07', '2021-11-30 09:40:07'),
(37, 1, 13, 1, 'Skilled', '2021-11-30 09:43:13', '2021-11-30 09:43:13'),
(38, 1, 13, 2, 'Mastery', '2021-11-30 09:43:13', '2021-11-30 09:43:13'),
(39, 1, 13, 3, 'Awareness', '2021-11-30 09:43:13', '2021-11-30 09:43:13');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_daily`
--

CREATE TABLE `mdl_stats_daily` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint NOT NULL DEFAULT '0',
  `stat2` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='to accumulate daily stats' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_monthly`
--

CREATE TABLE `mdl_stats_monthly` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint NOT NULL DEFAULT '0',
  `stat2` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='To accumulate monthly stats' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_daily`
--

CREATE TABLE `mdl_stats_user_daily` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `statsreads` bigint NOT NULL DEFAULT '0',
  `statswrites` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='To accumulate daily stats per course/user' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_monthly`
--

CREATE TABLE `mdl_stats_user_monthly` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `statsreads` bigint NOT NULL DEFAULT '0',
  `statswrites` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='To accumulate monthly stats per course/user' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_weekly`
--

CREATE TABLE `mdl_stats_user_weekly` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `statsreads` bigint NOT NULL DEFAULT '0',
  `statswrites` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='To accumulate weekly stats per course/user' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_weekly`
--

CREATE TABLE `mdl_stats_weekly` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint NOT NULL DEFAULT '0',
  `stat2` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='To accumulate weekly stats' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_sub_skill`
--

CREATE TABLE `mdl_sub_skill` (
  `id` int NOT NULL,
  `skill_id` int NOT NULL,
  `sub_skills` varchar(100) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mdl_sub_skill`
--

INSERT INTO `mdl_sub_skill` (`id`, `skill_id`, `sub_skills`, `status`) VALUES
(1, 1, 'Creativity', '1'),
(2, 1, 'Team building', '1'),
(3, 1, 'Problem-solving', '1'),
(4, 6, 'abcd', '1'),
(5, 6, 'xyz', '1'),
(6, 7, 'fgh', '1'),
(7, 7, 'abcd', '1'),
(8, 10, 'CII', '1'),
(9, 2, ' Creativity', '1'),
(10, 2, 'Team building', '1'),
(11, 2, 'Problem-solving', '1'),
(18, 3, 'Creativity', '1'),
(19, 3, 'Team building', '1'),
(20, 3, ' Problem-solving', '1'),
(21, 4, 'Creativity', '1'),
(22, 4, 'Team building', '1'),
(23, 4, 'Problem-solving', '1'),
(24, 5, 'Creativity', '1'),
(25, 5, 'Team building', '1'),
(26, 5, 'Problem-solving', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey`
--

CREATE TABLE `mdl_survey` (
  `id` bigint NOT NULL,
  `course` bigint NOT NULL DEFAULT '0',
  `template` bigint NOT NULL DEFAULT '0',
  `days` mediumint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `introformat` smallint NOT NULL DEFAULT '0',
  `questions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Each record is one SURVEY module with its configuration' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`, `completionsubmit`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44', 0),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44', 0),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44', 0),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68', 0),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_analysis`
--

CREATE TABLE `mdl_survey_analysis` (
  `id` bigint NOT NULL,
  `survey` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='text about each survey submission' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_answers`
--

CREATE TABLE `mdl_survey_answers` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `survey` bigint NOT NULL DEFAULT '0',
  `question` bigint NOT NULL DEFAULT '0',
  `time` bigint NOT NULL DEFAULT '0',
  `answer1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answer2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='the answers to each questions filled by the users' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_questions`
--

CREATE TABLE `mdl_survey_questions` (
  `id` bigint NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `multi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `intro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `type` smallint NOT NULL DEFAULT '0',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='the questions conforming one survey' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag`
--

CREATE TABLE `mdl_tag` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `tagcollid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `isstandard` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  `flag` smallint DEFAULT '0',
  `timemodified` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tag table - this generic table will replace the old "tags" t' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_area`
--

CREATE TABLE `mdl_tag_area` (
  `id` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `itemtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `tagcollid` bigint NOT NULL,
  `callback` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `callbackfile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `showstandard` tinyint(1) NOT NULL DEFAULT '0',
  `multiplecontexts` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Defines various tag areas, one area is identified by compone' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_tag_area`
--

INSERT INTO `mdl_tag_area` (`id`, `component`, `itemtype`, `enabled`, `tagcollid`, `callback`, `callbackfile`, `showstandard`, `multiplecontexts`) VALUES
(1, 'core', 'user', 1, 1, 'user_get_tagged_users', '/user/lib.php', 2, 0),
(2, 'core', 'course', 1, 1, 'course_get_tagged_courses', '/course/lib.php', 0, 0),
(3, 'core_question', 'question', 1, 1, NULL, NULL, 0, 1),
(4, 'core', 'post', 1, 1, 'blog_get_tagged_posts', '/blog/lib.php', 0, 0),
(5, 'core', 'blog_external', 1, 1, NULL, NULL, 0, 0),
(6, 'core', 'course_modules', 1, 1, 'course_get_tagged_course_modules', '/course/lib.php', 0, 0),
(7, 'mod_book', 'book_chapters', 1, 1, 'mod_book_get_tagged_chapters', '/mod/book/locallib.php', 0, 0),
(8, 'mod_data', 'data_records', 1, 1, 'mod_data_get_tagged_records', '/mod/data/locallib.php', 0, 0),
(9, 'mod_forum', 'forum_posts', 1, 1, 'mod_forum_get_tagged_posts', '/mod/forum/locallib.php', 0, 0),
(10, 'mod_glossary', 'glossary_entries', 1, 1, 'mod_glossary_get_tagged_entries', '/mod/glossary/locallib.php', 0, 0),
(11, 'mod_wiki', 'wiki_pages', 1, 1, 'mod_wiki_get_tagged_pages', '/mod/wiki/locallib.php', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_coll`
--

CREATE TABLE `mdl_tag_coll` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isdefault` tinyint NOT NULL DEFAULT '0',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sortorder` mediumint NOT NULL DEFAULT '0',
  `searchable` tinyint NOT NULL DEFAULT '1',
  `customurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Defines different set of tags' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_tag_coll`
--

INSERT INTO `mdl_tag_coll` (`id`, `name`, `isdefault`, `component`, `sortorder`, `searchable`, `customurl`) VALUES
(1, NULL, 1, NULL, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_correlation`
--

CREATE TABLE `mdl_tag_correlation` (
  `id` bigint NOT NULL,
  `tagid` bigint NOT NULL,
  `correlatedtags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The rationale for the ''tag_correlation'' table is performance' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_instance`
--

CREATE TABLE `mdl_tag_instance` (
  `id` bigint NOT NULL,
  `tagid` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `itemtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `contextid` bigint DEFAULT NULL,
  `tiuserid` bigint NOT NULL DEFAULT '0',
  `ordering` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tag_instance table holds the information of associations bet' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_task_adhoc`
--

CREATE TABLE `mdl_task_adhoc` (
  `id` bigint NOT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `classname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `nextruntime` bigint NOT NULL,
  `faildelay` bigint DEFAULT NULL,
  `customdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `userid` bigint DEFAULT NULL,
  `blocking` tinyint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timestarted` bigint DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pid` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='List of adhoc tasks waiting to run.' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_task_adhoc`
--

INSERT INTO `mdl_task_adhoc` (`id`, `component`, `classname`, `nextruntime`, `faildelay`, `customdata`, `userid`, `blocking`, `timecreated`, `timestarted`, `hostname`, `pid`) VALUES
(1, '', '\\core_course\\task\\course_delete_modules', 1637820006, 0, '{\"cms\":[{\"id\":\"15\",\"course\":\"5\",\"module\":\"17\",\"instance\":\"11\",\"section\":\"18\",\"idnumber\":\"\",\"added\":\"1636359885\",\"score\":\"0\",\"indent\":\"0\",\"visible\":\"1\",\"visibleoncoursepage\":\"1\",\"visibleold\":\"1\",\"groupmode\":\"0\",\"groupingid\":\"0\",\"completion\":\"1\",\"completiongradeitemnumber\":null,\"completionview\":\"0\",\"completionexpected\":\"0\",\"showdescription\":\"0\",\"availability\":null,\"deletioninprogress\":\"1\"}],\"userid\":\"2\",\"realuserid\":\"2\"}', NULL, 0, 1637820007, NULL, NULL, NULL),
(2, '', '\\core_course\\task\\course_delete_modules', 1637820013, 0, '{\"cms\":[{\"id\":\"14\",\"course\":\"5\",\"module\":\"17\",\"instance\":\"10\",\"section\":\"18\",\"idnumber\":\"\",\"added\":\"1636113261\",\"score\":\"0\",\"indent\":\"0\",\"visible\":\"1\",\"visibleoncoursepage\":\"1\",\"visibleold\":\"1\",\"groupmode\":\"0\",\"groupingid\":\"0\",\"completion\":\"1\",\"completiongradeitemnumber\":null,\"completionview\":\"0\",\"completionexpected\":\"0\",\"showdescription\":\"0\",\"availability\":null,\"deletioninprogress\":\"1\"}],\"userid\":\"2\",\"realuserid\":\"2\"}', NULL, 0, 1637820014, NULL, NULL, NULL),
(3, '', '\\core_course\\task\\course_delete_modules', 1637820018, 0, '{\"cms\":[{\"id\":\"13\",\"course\":\"5\",\"module\":\"17\",\"instance\":\"9\",\"section\":\"18\",\"idnumber\":\"\",\"added\":\"1636112997\",\"score\":\"0\",\"indent\":\"0\",\"visible\":\"1\",\"visibleoncoursepage\":\"1\",\"visibleold\":\"1\",\"groupmode\":\"0\",\"groupingid\":\"0\",\"completion\":\"1\",\"completiongradeitemnumber\":null,\"completionview\":\"0\",\"completionexpected\":\"0\",\"showdescription\":\"0\",\"availability\":null,\"deletioninprogress\":\"1\"}],\"userid\":\"2\",\"realuserid\":\"2\"}', NULL, 0, 1637820019, NULL, NULL, NULL),
(4, '', '\\core_course\\task\\course_delete_modules', 1637820031, 0, '{\"cms\":[{\"id\":\"12\",\"course\":\"5\",\"module\":\"17\",\"instance\":\"8\",\"section\":\"18\",\"idnumber\":\"\",\"added\":\"1636112532\",\"score\":\"0\",\"indent\":\"0\",\"visible\":\"1\",\"visibleoncoursepage\":\"1\",\"visibleold\":\"1\",\"groupmode\":\"0\",\"groupingid\":\"0\",\"completion\":\"1\",\"completiongradeitemnumber\":null,\"completionview\":\"0\",\"completionexpected\":\"0\",\"showdescription\":\"0\",\"availability\":null,\"deletioninprogress\":\"1\"}],\"userid\":\"2\",\"realuserid\":\"2\"}', NULL, 0, 1637820032, NULL, NULL, NULL),
(5, '', '\\core_course\\task\\course_delete_modules', 1637820040, 0, '{\"cms\":[{\"id\":\"11\",\"course\":\"5\",\"module\":\"17\",\"instance\":\"7\",\"section\":\"18\",\"idnumber\":\"\",\"added\":\"1636112233\",\"score\":\"0\",\"indent\":\"0\",\"visible\":\"1\",\"visibleoncoursepage\":\"1\",\"visibleold\":\"1\",\"groupmode\":\"0\",\"groupingid\":\"0\",\"completion\":\"1\",\"completiongradeitemnumber\":null,\"completionview\":\"0\",\"completionexpected\":\"0\",\"showdescription\":\"0\",\"availability\":null,\"deletioninprogress\":\"1\"}],\"userid\":\"2\",\"realuserid\":\"2\"}', NULL, 0, 1637820041, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_task_log`
--

CREATE TABLE `mdl_task_log` (
  `id` bigint NOT NULL,
  `type` smallint NOT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `classname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL,
  `timestart` decimal(20,10) NOT NULL,
  `timeend` decimal(20,10) NOT NULL,
  `dbreads` bigint NOT NULL,
  `dbwrites` bigint NOT NULL,
  `result` tinyint NOT NULL,
  `output` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pid` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The log table for all tasks' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_task_scheduled`
--

CREATE TABLE `mdl_task_scheduled` (
  `id` bigint NOT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `classname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `lastruntime` bigint DEFAULT NULL,
  `nextruntime` bigint DEFAULT NULL,
  `blocking` tinyint NOT NULL DEFAULT '0',
  `minute` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `hour` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `day` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `month` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `dayofweek` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `faildelay` bigint DEFAULT NULL,
  `customised` tinyint NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `timestarted` bigint DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pid` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='List of scheduled tasks to be run by cron.' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_task_scheduled`
--

INSERT INTO `mdl_task_scheduled` (`id`, `component`, `classname`, `lastruntime`, `nextruntime`, `blocking`, `minute`, `hour`, `day`, `month`, `dayofweek`, `faildelay`, `customised`, `disabled`, `timestarted`, `hostname`, `pid`) VALUES
(1, 'moodle', '\\core\\task\\session_cleanup_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(2, 'moodle', '\\core\\task\\delete_unconfirmed_users_task', 0, 1634826600, 0, '0', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(3, 'moodle', '\\core\\task\\delete_incomplete_users_task', 0, 1634826900, 0, '5', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(4, 'moodle', '\\core\\task\\backup_cleanup_task', 0, 1634823600, 0, '10', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(5, 'moodle', '\\core\\task\\tag_cron_task', 0, 1634853060, 0, '21', '3', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(6, 'moodle', '\\core\\task\\context_cleanup_task', 0, 1634824500, 0, '25', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(7, 'moodle', '\\core\\task\\cache_cleanup_task', 0, 1634824800, 0, '30', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(8, 'moodle', '\\core\\task\\messaging_cleanup_task', 0, 1634825100, 0, '35', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(9, 'moodle', '\\core\\task\\send_new_user_passwords_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(10, 'moodle', '\\core\\task\\send_failed_login_notifications_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(11, 'moodle', '\\core\\task\\create_contexts_task', 0, 1634841000, 1, '0', '0', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(12, 'moodle', '\\core\\task\\legacy_plugin_cron_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(13, 'moodle', '\\core\\task\\grade_cron_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(14, 'moodle', '\\core\\task\\grade_history_cleanup_task', 0, 1634841480, 0, '*', '0', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(15, 'moodle', '\\core\\task\\completion_regular_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(16, 'moodle', '\\core\\task\\completion_daily_task', 0, 1634902680, 0, '8', '17', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(17, 'moodle', '\\core\\task\\portfolio_cron_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(18, 'moodle', '\\core\\task\\plagiarism_cron_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(19, 'moodle', '\\core\\task\\calendar_cron_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(20, 'moodle', '\\core\\task\\blog_cron_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(21, 'moodle', '\\core\\task\\question_preview_cleanup_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(22, 'moodle', '\\core\\task\\question_stats_cleanup_task', 0, 1634823480, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(23, 'moodle', '\\core\\task\\registration_cron_task', 0, 1634959800, 0, '0', '9', '*', '*', '6', 0, 0, 0, NULL, NULL, NULL),
(24, 'moodle', '\\core\\task\\check_for_updates_task', 0, 1634826600, 0, '0', '*/2', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(25, 'moodle', '\\core\\task\\cache_cron_task', 0, 1634826000, 0, '50', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(26, 'moodle', '\\core\\task\\automated_backup_task', 0, 1634826000, 0, '50', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(27, 'moodle', '\\core\\task\\badges_cron_task', 0, 1634823600, 0, '*/5', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(28, 'moodle', '\\core\\task\\badges_message_task', 0, 1634823600, 0, '*/5', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(29, 'moodle', '\\core\\task\\file_temp_cleanup_task', 0, 1634844300, 0, '55', '*/6', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(30, 'moodle', '\\core\\task\\file_trash_cleanup_task', 0, 1634844300, 0, '55', '*/6', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(31, 'moodle', '\\core\\task\\search_index_task', 0, 1634824800, 0, '*/30', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(32, 'moodle', '\\core\\task\\search_optimize_task', 0, 1634841900, 0, '15', '*/12', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(33, 'moodle', '\\core\\task\\stats_cron_task', 0, 1634841000, 0, '0', '0', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(34, 'moodle', '\\core\\task\\password_reset_cleanup_task', 0, 1634841000, 0, '0', '*/6', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(35, 'moodle', '\\core\\task\\complete_plans_task', 0, 1634823480, 0, '8', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(36, 'moodle', '\\core\\task\\sync_plans_from_template_cohorts_task', 0, 1634824140, 0, '19', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(37, 'moodle', '\\core_files\\task\\conversion_cleanup_task', 0, 1634848740, 0, '9', '2', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(38, 'moodle', '\\core\\oauth2\\refresh_system_tokens_task', 0, 1634824800, 0, '30', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(39, 'moodle', '\\core\\task\\analytics_cleanup_task', 0, 1634825520, 0, '42', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(40, 'moodle', '\\core\\task\\task_log_cleanup_task', 0, 1634848680, 0, '8', '2', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(41, 'moodle', '\\core\\task\\h5p_get_content_types_task', 0, 1635717060, 0, '21', '3', '1', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(42, 'moodle', '\\core\\task\\h5p_clean_orphaned_records_task', 0, 1634841060, 0, '1', '0', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(43, 'moodle', '\\core\\task\\antivirus_cleanup_task', 0, 1634841780, 0, '13', '0', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(44, 'qtype_random', '\\qtype_random\\task\\remove_unused_questions', 0, 1634826600, 0, '0', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(45, 'mod_assign', '\\mod_assign\\task\\cron_task', 0, 1634823840, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(46, 'mod_chat', '\\mod_chat\\task\\cron_task', 0, 1634823900, 0, '*/5', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(47, 'mod_forum', '\\mod_forum\\task\\cron_task', 0, 1634823960, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(48, 'mod_lti', '\\mod_lti\\task\\clean_access_tokens', 0, 1634831220, 0, '17', '21', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(49, 'mod_quiz', '\\mod_quiz\\task\\update_overdue_attempts', 0, 1634824140, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(50, 'mod_quiz', '\\mod_quiz\\task\\legacy_quiz_reports_cron', 0, 1634824140, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(51, 'mod_quiz', '\\mod_quiz\\task\\legacy_quiz_accessrules_cron', 0, 1634824140, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(52, 'mod_scorm', '\\mod_scorm\\task\\cron_task', 0, 1634824200, 0, '*/5', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(53, 'mod_workshop', '\\mod_workshop\\task\\cron_task', 0, 1634824260, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(54, 'mod_workshop', '\\mod_workshop\\task\\legacy_workshop_allocation_cron', 0, 1634824260, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(55, 'auth_cas', '\\auth_cas\\task\\sync_task', 0, 1634841000, 0, '0', '0', '*', '*', '*', 0, 0, 1, NULL, NULL, NULL),
(56, 'auth_db', '\\auth_db\\task\\sync_users', 0, 1634899200, 0, '10', '16', '*', '*', '*', 0, 0, 1, NULL, NULL, NULL),
(57, 'auth_ldap', '\\auth_ldap\\task\\sync_roles', 0, 1634841000, 0, '0', '0', '*', '*', '*', 0, 0, 1, NULL, NULL, NULL),
(58, 'auth_ldap', '\\auth_ldap\\task\\sync_task', 0, 1634841000, 0, '0', '0', '*', '*', '*', 0, 0, 1, NULL, NULL, NULL),
(59, 'auth_mnet', '\\auth_mnet\\task\\cron_task', 0, 1634824260, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(60, 'enrol_category', '\\enrol_category\\task\\enrol_category_sync', 0, 1634824260, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(61, 'enrol_cohort', '\\enrol_cohort\\task\\enrol_cohort_sync', 0, 1634826960, 0, '6', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(62, 'enrol_database', '\\enrol_database\\task\\sync_enrolments', 0, 1634866920, 0, '12', '7', '*', '*', '*', 0, 0, 1, NULL, NULL, NULL),
(63, 'enrol_flatfile', '\\enrol_flatfile\\task\\flatfile_sync_task', 0, 1634827500, 0, '15', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(64, 'enrol_imsenterprise', '\\enrol_imsenterprise\\task\\cron_task', 0, 1634827200, 0, '10', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(65, 'enrol_ldap', '\\enrol_ldap\\task\\sync_enrolments', 0, 1634874180, 0, '13', '9', '*', '*', '*', 0, 0, 1, NULL, NULL, NULL),
(66, 'enrol_lti', '\\enrol_lti\\task\\sync_grades', 0, 1634824800, 0, '*/30', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(67, 'enrol_lti', '\\enrol_lti\\task\\sync_members', 0, 1634824800, 0, '*/30', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(68, 'enrol_manual', '\\enrol_manual\\task\\sync_enrolments', 0, 1634824800, 0, '*/10', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(69, 'enrol_manual', '\\enrol_manual\\task\\send_expiry_notifications', 0, 1634824800, 0, '*/10', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(70, 'enrol_meta', '\\enrol_meta\\task\\enrol_meta_sync', 0, 1634827140, 0, '9', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(71, 'enrol_paypal', '\\enrol_paypal\\task\\process_expirations', 0, 1634824320, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(72, 'enrol_self', '\\enrol_self\\task\\sync_enrolments', 0, 1634824800, 0, '*/10', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(73, 'enrol_self', '\\enrol_self\\task\\send_expiry_notifications', 0, 1634824800, 0, '*/10', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(74, 'message_email', '\\message_email\\task\\send_email_task', 0, 1634833800, 0, '0', '22', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(75, 'block_recent_activity', '\\block_recent_activity\\task\\cleanup', 0, 1634867340, 0, '19', '7', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(76, 'block_rss_client', '\\block_rss_client\\task\\refreshfeeds', 0, 1634825400, 0, '*/5', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(77, 'editor_atto', '\\editor_atto\\task\\autosave_cleanup_task', 0, 1635211980, 0, '3', '7', '*', '*', '2', 0, 0, 0, NULL, NULL, NULL),
(78, 'repository_dropbox', '\\repository_dropbox\\task\\cron_task', 0, 1634825340, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(79, 'repository_filesystem', '\\repository_filesystem\\task\\cron_task', 0, 1634825340, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(80, 'repository_onedrive', '\\repository_onedrive\\remove_temp_access_task', 0, 1634892600, 0, '20', '14', '*', '*', '5', 0, 0, 0, NULL, NULL, NULL),
(81, 'tool_analytics', '\\tool_analytics\\task\\train_models', 0, 1634826600, 0, '0', '20', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(82, 'tool_analytics', '\\tool_analytics\\task\\predict_models', 0, 1634869800, 0, '0', '8', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(83, 'tool_brickfield', '\\tool_brickfield\\task\\bulk_process_courses', 0, 1634825700, 0, '*/5', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(84, 'tool_brickfield', '\\tool_brickfield\\task\\bulk_process_caches', 0, 1634825700, 0, '*/5', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(85, 'tool_brickfield', '\\tool_brickfield\\task\\checkid_validation', 0, 1634873700, 0, '05', '9', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(86, 'tool_brickfield', '\\tool_brickfield\\task\\update_summarydata', 0, 1634844000, 0, '50', '0', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(87, 'tool_brickfield', '\\tool_brickfield\\task\\process_analysis_requests', 0, 1634825700, 0, '*/5', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(88, 'tool_cohortroles', '\\tool_cohortroles\\task\\cohort_role_sync', 0, 1634827680, 0, '18', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(89, 'tool_dataprivacy', '\\tool_dataprivacy\\task\\expired_retention_period', 0, 1634869800, 0, '0', '8', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(90, 'tool_dataprivacy', '\\tool_dataprivacy\\task\\delete_expired_contexts', 0, 1634887800, 0, '0', '13', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(91, 'tool_dataprivacy', '\\tool_dataprivacy\\task\\delete_expired_requests', 0, 1634852280, 0, '8', '3', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(92, 'tool_dataprivacy', '\\tool_dataprivacy\\task\\delete_existing_deleted_users', 0, 1634888040, 0, '4', '13', '*', '*', '*', 0, 0, 1, NULL, NULL, NULL),
(93, 'tool_langimport', '\\tool_langimport\\task\\update_langpacks_task', 0, 1634856660, 0, '21', '4', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(94, 'tool_messageinbound', '\\tool_messageinbound\\task\\pickup_task', 0, 1634825640, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(95, 'tool_messageinbound', '\\tool_messageinbound\\task\\cleanup_task', 0, 1634847900, 0, '55', '1', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(96, 'tool_monitor', '\\tool_monitor\\task\\clean_events', 0, 1634825640, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(97, 'tool_monitor', '\\tool_monitor\\task\\check_subscriptions', 0, 1634834820, 0, '17', '22', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(98, 'tool_recyclebin', '\\tool_recyclebin\\task\\cleanup_course_bin', 0, 1634826600, 0, '*/30', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(99, 'tool_recyclebin', '\\tool_recyclebin\\task\\cleanup_category_bin', 0, 1634826600, 0, '*/30', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(100, 'assignfeedback_editpdf', '\\assignfeedback_editpdf\\task\\convert_submissions', 0, 1634826600, 0, '*/15', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(101, 'ltiservice_gradebookservices', '\\ltiservice_gradebookservices\\task\\cleanup_task', 0, 1634891580, 0, '3', '14', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(102, 'quiz_statistics', '\\quiz_statistics\\task\\quiz_statistics_cleanup', 0, 1634827140, 0, '9', '*/5', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(103, 'workshopallocation_scheduled', '\\workshopallocation_scheduled\\task\\cron_task', 0, 1634825880, 0, '*', '*', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(104, 'logstore_legacy', '\\logstore_legacy\\task\\cleanup_task', 0, 1634860380, 0, '23', '5', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL),
(105, 'logstore_standard', '\\logstore_standard\\task\\cleanup_task', 0, 1634855460, 0, '1', '4', '*', '*', '*', 0, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_brickfield_areas`
--

CREATE TABLE `mdl_tool_brickfield_areas` (
  `id` bigint NOT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  `contextid` bigint DEFAULT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tablename` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fieldorarea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `itemid` bigint DEFAULT NULL,
  `filename` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reftable` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `refid` bigint DEFAULT NULL,
  `cmid` bigint DEFAULT NULL,
  `courseid` bigint DEFAULT NULL,
  `categoryid` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Areas that have been checked for accessibility problems' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_brickfield_cache_acts`
--

CREATE TABLE `mdl_tool_brickfield_cache_acts` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `totalactivities` bigint DEFAULT NULL,
  `failedactivities` bigint DEFAULT NULL,
  `passedactivities` bigint DEFAULT NULL,
  `errorcount` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains accessibility summary information per activity.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_brickfield_cache_check`
--

CREATE TABLE `mdl_tool_brickfield_cache_check` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `checkid` bigint DEFAULT NULL,
  `checkcount` bigint DEFAULT NULL,
  `errorcount` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains accessibility summary information per check.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_brickfield_checks`
--

CREATE TABLE `mdl_tool_brickfield_checks` (
  `id` bigint NOT NULL,
  `checktype` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shortname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `checkgroup` bigint DEFAULT '0',
  `status` smallint NOT NULL,
  `severity` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Checks details' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_tool_brickfield_checks`
--

INSERT INTO `mdl_tool_brickfield_checks` (`id`, `checktype`, `shortname`, `checkgroup`, `status`, `severity`) VALUES
(1, 'full', 'a_links_dont_open_new_window', 4, 1, 1),
(2, 'full', 'a_must_contain_text', 4, 1, 1),
(3, 'full', 'area_dont_open_new_window', 4, 1, 1),
(4, 'full', 'area_has_alt_value', 4, 1, 1),
(5, 'full', 'a_suspicious_link_text', 4, 1, 1),
(6, 'full', 'basefont_is_not_used', 7, 1, 1),
(7, 'full', 'blink_is_not_used', 7, 1, 1),
(8, 'full', 'bold_is_not_used', 7, 1, 1),
(9, 'full', 'content_too_long', 7, 1, 1),
(10, 'full', 'css_text_has_contrast', 7, 1, 1),
(11, 'full', 'embed_has_associated_no_embed', 7, 1, 1),
(12, 'full', 'header_h3', 3, 1, 1),
(13, 'full', 'headers_have_text', 3, 1, 1),
(14, 'full', 'i_is_not_used', 7, 1, 1),
(15, 'full', 'img_alt_is_different', 2, 1, 1),
(16, 'full', 'img_alt_is_too_long', 2, 1, 1),
(17, 'full', 'img_alt_not_empty_in_anchor', 2, 1, 1),
(18, 'full', 'img_alt_not_place_holder', 2, 1, 1),
(19, 'full', 'img_has_alt', 2, 1, 1),
(20, 'full', 'img_with_map_has_use_map', 2, 1, 1),
(21, 'full', 'legend_text_not_empty', 7, 1, 1),
(22, 'full', 'marquee_is_not_used', 7, 1, 1),
(23, 'full', 'no_headings', 3, 1, 1),
(24, 'full', 'object_must_have_embed', 5, 1, 1),
(25, 'full', 'object_must_have_title', 5, 1, 1),
(26, 'full', 'object_must_have_valid_title', 5, 1, 1),
(27, 'full', 'strike_is_not_used', 7, 1, 1),
(28, 'full', 'table_data_should_have_th', 6, 1, 1),
(29, 'full', 'table_summary_does_not_duplicate_caption', 6, 1, 1),
(30, 'full', 'table_td_should_not_merge', 6, 1, 1),
(31, 'full', 'table_th_should_have_scope', 6, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_brickfield_content`
--

CREATE TABLE `mdl_tool_brickfield_content` (
  `id` bigint NOT NULL,
  `areaid` bigint NOT NULL,
  `contenthash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `iscurrent` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL,
  `timechecked` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Content of an area at a particular time (recognised by a has' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_brickfield_errors`
--

CREATE TABLE `mdl_tool_brickfield_errors` (
  `id` bigint NOT NULL,
  `resultid` bigint NOT NULL,
  `linenumber` bigint NOT NULL DEFAULT '0',
  `errordata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `htmlcode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Errors during the accessibility checks' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_brickfield_process`
--

CREATE TABLE `mdl_tool_brickfield_process` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `item` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contextid` bigint DEFAULT NULL,
  `innercontextid` bigint DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL,
  `timecompleted` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Queued records to initiate new processing of specific target' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_brickfield_results`
--

CREATE TABLE `mdl_tool_brickfield_results` (
  `id` bigint NOT NULL,
  `contentid` bigint DEFAULT NULL,
  `checkid` bigint NOT NULL,
  `errorcount` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Results of the accessibility checks' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_brickfield_schedule`
--

CREATE TABLE `mdl_tool_brickfield_schedule` (
  `id` bigint NOT NULL,
  `contextlevel` bigint NOT NULL DEFAULT '50',
  `instanceid` bigint NOT NULL,
  `contextid` bigint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `timeanalyzed` bigint DEFAULT '0',
  `timemodified` bigint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Keeps the per course content analysis schedule.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_brickfield_summary`
--

CREATE TABLE `mdl_tool_brickfield_summary` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activities` bigint DEFAULT NULL,
  `activitiespassed` bigint DEFAULT NULL,
  `activitiesfailed` bigint DEFAULT NULL,
  `errorschecktype1` bigint DEFAULT NULL,
  `errorschecktype2` bigint DEFAULT NULL,
  `errorschecktype3` bigint DEFAULT NULL,
  `errorschecktype4` bigint DEFAULT NULL,
  `errorschecktype5` bigint DEFAULT NULL,
  `errorschecktype6` bigint DEFAULT NULL,
  `errorschecktype7` bigint DEFAULT NULL,
  `failedchecktype1` bigint DEFAULT NULL,
  `failedchecktype2` bigint DEFAULT NULL,
  `failedchecktype3` bigint DEFAULT NULL,
  `failedchecktype4` bigint DEFAULT NULL,
  `failedchecktype5` bigint DEFAULT NULL,
  `failedchecktype6` bigint DEFAULT NULL,
  `failedchecktype7` bigint DEFAULT NULL,
  `percentchecktype1` bigint DEFAULT NULL,
  `percentchecktype2` bigint DEFAULT NULL,
  `percentchecktype3` bigint DEFAULT NULL,
  `percentchecktype4` bigint DEFAULT NULL,
  `percentchecktype5` bigint DEFAULT NULL,
  `percentchecktype6` bigint DEFAULT NULL,
  `percentchecktype7` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains accessibility check results summary information.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_cohortroles`
--

CREATE TABLE `mdl_tool_cohortroles` (
  `id` bigint NOT NULL,
  `cohortid` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Mapping of users to cohort role assignments.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang`
--

CREATE TABLE `mdl_tool_customlang` (
  `id` bigint NOT NULL,
  `lang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `componentid` bigint NOT NULL,
  `stringid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `original` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `master` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `local` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `timemodified` bigint NOT NULL,
  `timecustomized` bigint DEFAULT NULL,
  `outdated` smallint DEFAULT '0',
  `modified` smallint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains the working checkout of all strings and their custo' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang_components`
--

CREATE TABLE `mdl_tool_customlang_components` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains the list of all installed plugins that provide thei' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_dataprivacy_category`
--

CREATE TABLE `mdl_tool_dataprivacy_category` (
  `id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `descriptionformat` tinyint(1) DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Data categories' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_dataprivacy_ctxexpired`
--

CREATE TABLE `mdl_tool_dataprivacy_ctxexpired` (
  `id` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `unexpiredroles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `expiredroles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `defaultexpired` tinyint(1) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Default comment for the table, please edit me' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_dataprivacy_ctxinstance`
--

CREATE TABLE `mdl_tool_dataprivacy_ctxinstance` (
  `id` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `purposeid` bigint DEFAULT NULL,
  `categoryid` bigint DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Default comment for the table, please edit me' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_dataprivacy_ctxlevel`
--

CREATE TABLE `mdl_tool_dataprivacy_ctxlevel` (
  `id` bigint NOT NULL,
  `contextlevel` smallint NOT NULL,
  `purposeid` bigint DEFAULT NULL,
  `categoryid` bigint DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Default comment for the table, please edit me' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_dataprivacy_purpose`
--

CREATE TABLE `mdl_tool_dataprivacy_purpose` (
  `id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `descriptionformat` tinyint(1) DEFAULT NULL,
  `lawfulbases` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sensitivedatareasons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `retentionperiod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `protected` tinyint(1) DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Data purposes' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_dataprivacy_purposerole`
--

CREATE TABLE `mdl_tool_dataprivacy_purposerole` (
  `id` bigint NOT NULL,
  `purposeid` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  `lawfulbases` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `sensitivedatareasons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `retentionperiod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `protected` tinyint(1) DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Data purpose overrides for a specific role' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_dataprivacy_request`
--

CREATE TABLE `mdl_tool_dataprivacy_request` (
  `id` bigint NOT NULL,
  `type` bigint NOT NULL DEFAULT '0',
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `commentsformat` tinyint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `requestedby` bigint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `dpo` bigint DEFAULT '0',
  `dpocomment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dpocommentformat` tinyint NOT NULL DEFAULT '0',
  `systemapproved` smallint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `creationmethod` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table for data requests' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_tool_dataprivacy_request`
--

INSERT INTO `mdl_tool_dataprivacy_request` (`id`, `type`, `comments`, `commentsformat`, `userid`, `requestedby`, `status`, `dpo`, `dpocomment`, `dpocommentformat`, `systemapproved`, `usermodified`, `timecreated`, `timemodified`, `creationmethod`) VALUES
(1, 2, 'Automatically created upon user deletion.', 2, 6, 2, 2, 0, '', 2, 0, 2, 1635241041, 1635241041, 1),
(2, 2, 'Automatically created upon user deletion.', 2, 7, 2, 2, 0, '', 2, 0, 2, 1635247046, 1635247046, 1),
(3, 2, 'Automatically created upon user deletion.', 2, 8, 2, 2, 0, '', 2, 0, 2, 1635321256, 1635321256, 1),
(4, 2, 'Automatically created upon user deletion.', 2, 9, 2, 2, 0, '', 2, 0, 2, 1635420968, 1635420968, 1),
(5, 2, 'Automatically created upon user deletion.', 2, 10, 2, 2, 0, '', 2, 0, 2, 1635420990, 1635420990, 1),
(6, 2, 'Automatically created upon user deletion.', 2, 11, 2, 2, 0, '', 2, 0, 2, 1635421000, 1635421000, 1),
(7, 2, 'Automatically created upon user deletion.', 2, 12, 2, 2, 0, '', 2, 0, 2, 1635921699, 1635921699, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_events`
--

CREATE TABLE `mdl_tool_monitor_events` (
  `id` bigint NOT NULL,
  `eventname` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `contextid` bigint NOT NULL,
  `contextlevel` bigint NOT NULL,
  `contextinstanceid` bigint NOT NULL,
  `link` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `courseid` bigint NOT NULL,
  `timecreated` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A table that keeps a log of events related to subscriptions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_history`
--

CREATE TABLE `mdl_tool_monitor_history` (
  `id` bigint NOT NULL,
  `sid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timesent` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to store history of message notifications sent' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_rules`
--

CREATE TABLE `mdl_tool_monitor_rules` (
  `id` bigint NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `descriptionformat` tinyint(1) NOT NULL,
  `name` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `plugin` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `eventname` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `template` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `templateformat` tinyint(1) NOT NULL,
  `frequency` smallint NOT NULL,
  `timewindow` mediumint NOT NULL,
  `timemodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to store rules' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_subscriptions`
--

CREATE TABLE `mdl_tool_monitor_subscriptions` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `ruleid` bigint NOT NULL,
  `cmid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `lastnotificationsent` bigint NOT NULL DEFAULT '0',
  `inactivedate` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to store user subscriptions to various rules' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_policy`
--

CREATE TABLE `mdl_tool_policy` (
  `id` bigint NOT NULL,
  `sortorder` mediumint NOT NULL DEFAULT '999',
  `currentversionid` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains the list of policy documents defined on the site.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_policy_acceptances`
--

CREATE TABLE `mdl_tool_policy_acceptances` (
  `id` bigint NOT NULL,
  `policyversionid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `lang` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `note` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tracks users accepting the policy versions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_policy_versions`
--

CREATE TABLE `mdl_tool_policy_versions` (
  `id` bigint NOT NULL,
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `type` smallint NOT NULL DEFAULT '0',
  `audience` smallint NOT NULL DEFAULT '0',
  `archived` smallint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `policyid` bigint NOT NULL,
  `agreementstyle` smallint NOT NULL DEFAULT '0',
  `optional` smallint NOT NULL DEFAULT '0',
  `revision` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `summaryformat` smallint NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contentformat` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Holds versions of the policy documents' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_recyclebin_category`
--

CREATE TABLE `mdl_tool_recyclebin_category` (
  `id` bigint NOT NULL,
  `categoryid` bigint NOT NULL,
  `shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A list of items in the category recycle bin' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_recyclebin_course`
--

CREATE TABLE `mdl_tool_recyclebin_course` (
  `id` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `section` bigint NOT NULL,
  `module` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A list of items in the course recycle bin' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_usertours_steps`
--

CREATE TABLE `mdl_tool_usertours_steps` (
  `id` bigint NOT NULL,
  `tourid` bigint NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `targettype` tinyint NOT NULL,
  `targetvalue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sortorder` bigint NOT NULL DEFAULT '0',
  `configdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Steps in an tour' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_tool_usertours_steps`
--

INSERT INTO `mdl_tool_usertours_steps` (`id`, `tourid`, `title`, `content`, `targettype`, `targetvalue`, `sortorder`, `configdata`) VALUES
(1, 1, 'tour_activityinfo_course_teacher_title,tool_usertours', 'tour_activityinfo_course_teacher_content,tool_usertours', 0, '[data-region=activity-information]', 0, '{}'),
(2, 2, 'tour_activityinfo_course_student_title,tool_usertours', 'tour_activityinfo_course_student_content,tool_usertours', 0, '[data-region=activity-information]', 0, '{}'),
(3, 3, 'tour_activityinfo_activity_teacher_title,tool_usertours', 'tour_activityinfo_activity_teacher_content,tool_usertours', 0, '[data-region=activity-information]', 0, '{}'),
(4, 4, 'tour_activityinfo_activity_student_title,tool_usertours', 'tour_activityinfo_activity_student_content,tool_usertours', 0, '[data-region=activity-information]', 0, '{}');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_usertours_tours`
--

CREATE TABLE `mdl_tool_usertours_tours` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `pathmatch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL DEFAULT '0',
  `configdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='List of tours' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_tool_usertours_tours`
--

INSERT INTO `mdl_tool_usertours_tours` (`id`, `name`, `description`, `pathmatch`, `enabled`, `sortorder`, `configdata`) VALUES
(1, 'Activity information in course homepage (Teacher)', 'A tour of the activity information for Teacher display on the course homepage', '/course/view.php%', 1, 3, '{\"placement\":\"bottom\",\"orphan\":\"0\",\"backdrop\":\"1\",\"reflex\":\"0\",\"filtervalues\":{\"accessdate\":{\"filter_accessdate\":\"tool_usertours_accountcreation\",\"filter_accessdate_range\":0,\"filter_accessdate_enabled\":\"0\"},\"category\":[],\"course\":[],\"courseformat\":[],\"role\":[\"manager\",\"teacher\",\"editingteacher\"],\"theme\":[],\"cssselector\":[\"[data-region=activity-information]\"]},\"majorupdatetime\":1620109487,\"shipped_tour\":true,\"shipped_filename\":\"311_activity_information_course_page_teacher.json\",\"shipped_version\":2}'),
(2, 'Activity information in course homepage (Student)', 'A tour of the activity information for Student display on the course homepage', '/course/view.php%', 1, 2, '{\"placement\":\"bottom\",\"orphan\":\"0\",\"backdrop\":\"1\",\"reflex\":\"0\",\"filtervalues\":{\"accessdate\":{\"filter_accessdate\":\"tool_usertours_accountcreation\",\"filter_accessdate_range\":0,\"filter_accessdate_enabled\":\"0\"},\"category\":[],\"course\":[],\"courseformat\":[],\"role\":[\"student\"],\"theme\":[],\"cssselector\":[\"[data-region=activity-information]\"]},\"majorupdatetime\":1620109487,\"shipped_tour\":true,\"shipped_filename\":\"311_activity_information_course_page_student.json\",\"shipped_version\":2}'),
(3, 'Activity information in activity page (Teacher)', 'A tour of the activity information for Teacher display on the activity page', '/mod/%/view.php%', 1, 1, '{\"placement\":\"bottom\",\"orphan\":\"0\",\"backdrop\":\"1\",\"reflex\":\"0\",\"filtervalues\":{\"accessdate\":{\"filter_accessdate\":\"tool_usertours_accountcreation\",\"filter_accessdate_range\":0,\"filter_accessdate_enabled\":\"0\"},\"category\":[],\"course\":[],\"courseformat\":[],\"role\":[\"manager\",\"teacher\",\"editingteacher\"],\"theme\":[],\"cssselector\":[\"[data-region=activity-information]\"]},\"majorupdatetime\":1620110287,\"shipped_tour\":true,\"shipped_filename\":\"311_activity_information_activity_page_teacher.json\",\"shipped_version\":2}'),
(4, 'Activity information in activity page (Student)', 'A tour of the activity information for Student display on the activity page', '/mod/%/view.php%', 1, 0, '{\"placement\":\"bottom\",\"orphan\":\"0\",\"backdrop\":\"1\",\"reflex\":\"0\",\"filtervalues\":{\"accessdate\":{\"filter_accessdate\":\"tool_usertours_accountcreation\",\"filter_accessdate_range\":0,\"filter_accessdate_enabled\":\"0\"},\"category\":[],\"course\":[],\"courseformat\":[],\"role\":[\"student\"],\"theme\":[],\"cssselector\":[\"[data-region=activity-information]\"]},\"majorupdatetime\":1620110287,\"shipped_tour\":true,\"shipped_filename\":\"311_activity_information_activity_page_student.json\",\"shipped_version\":2}');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_upgrade_log`
--

CREATE TABLE `mdl_upgrade_log` (
  `id` bigint NOT NULL,
  `type` bigint NOT NULL,
  `plugin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `targetversion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `backtrace` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `userid` bigint NOT NULL,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Upgrade logging' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2021051703.08', '2021051703.08', 'Upgrade savepoint reached', NULL, '', 0, 1634823404),
(2, 0, 'core', '2021051703.08', '2021051703.08', 'Core installed', NULL, '', 0, 1634823696),
(3, 0, 'antivirus_clamav', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823700),
(4, 0, 'antivirus_clamav', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823700),
(5, 0, 'antivirus_clamav', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823701),
(6, 0, 'availability_completion', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823701),
(7, 0, 'availability_completion', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823702),
(8, 0, 'availability_completion', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823703),
(9, 0, 'availability_date', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823703),
(10, 0, 'availability_date', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823704),
(11, 0, 'availability_date', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823705),
(12, 0, 'availability_grade', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823705),
(13, 0, 'availability_grade', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823706),
(14, 0, 'availability_grade', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823707),
(15, 0, 'availability_group', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823707),
(16, 0, 'availability_group', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823707),
(17, 0, 'availability_group', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823708),
(18, 0, 'availability_grouping', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823708),
(19, 0, 'availability_grouping', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823708),
(20, 0, 'availability_grouping', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823709),
(21, 0, 'availability_profile', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823709),
(22, 0, 'availability_profile', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823709),
(23, 0, 'availability_profile', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823710),
(24, 0, 'qtype_calculated', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823710),
(25, 0, 'qtype_calculated', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823717),
(26, 0, 'qtype_calculated', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823718),
(27, 0, 'qtype_calculatedmulti', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823718),
(28, 0, 'qtype_calculatedmulti', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823718),
(29, 0, 'qtype_calculatedmulti', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823719),
(30, 0, 'qtype_calculatedsimple', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823719),
(31, 0, 'qtype_calculatedsimple', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823719),
(32, 0, 'qtype_calculatedsimple', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823720),
(33, 0, 'qtype_ddimageortext', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823720),
(34, 0, 'qtype_ddimageortext', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823724),
(35, 0, 'qtype_ddimageortext', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823725),
(36, 0, 'qtype_ddmarker', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823725),
(37, 0, 'qtype_ddmarker', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823729),
(38, 0, 'qtype_ddmarker', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823730),
(39, 0, 'qtype_ddwtos', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823730),
(40, 0, 'qtype_ddwtos', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823732),
(41, 0, 'qtype_ddwtos', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823732),
(42, 0, 'qtype_description', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823732),
(43, 0, 'qtype_description', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823733),
(44, 0, 'qtype_description', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823733),
(45, 0, 'qtype_essay', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823733),
(46, 0, 'qtype_essay', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823735),
(47, 0, 'qtype_essay', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823736),
(48, 0, 'qtype_gapselect', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823736),
(49, 0, 'qtype_gapselect', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823738),
(50, 0, 'qtype_gapselect', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823738),
(51, 0, 'qtype_match', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823738),
(52, 0, 'qtype_match', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823742),
(53, 0, 'qtype_match', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823742),
(54, 0, 'qtype_missingtype', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823743),
(55, 0, 'qtype_missingtype', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823743),
(56, 0, 'qtype_missingtype', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823744),
(57, 0, 'qtype_multianswer', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823744),
(58, 0, 'qtype_multianswer', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823746),
(59, 0, 'qtype_multianswer', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823747),
(60, 0, 'qtype_multichoice', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823747),
(61, 0, 'qtype_multichoice', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823749),
(62, 0, 'qtype_multichoice', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823749),
(63, 0, 'qtype_numerical', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823750),
(64, 0, 'qtype_numerical', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823754),
(65, 0, 'qtype_numerical', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823755),
(66, 0, 'qtype_random', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823755),
(67, 0, 'qtype_random', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823755),
(68, 0, 'qtype_random', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823756),
(69, 0, 'qtype_randomsamatch', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823756),
(70, 0, 'qtype_randomsamatch', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823758),
(71, 0, 'qtype_randomsamatch', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823758),
(72, 0, 'qtype_shortanswer', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823758),
(73, 0, 'qtype_shortanswer', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823760),
(74, 0, 'qtype_shortanswer', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823761),
(75, 0, 'qtype_truefalse', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823761),
(76, 0, 'qtype_truefalse', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823762),
(77, 0, 'qtype_truefalse', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823763),
(78, 0, 'mod_assign', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823763),
(79, 0, 'mod_assign', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823775),
(80, 0, 'mod_assign', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823795),
(81, 0, 'mod_assignment', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823795),
(82, 0, 'mod_assignment', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823801),
(83, 0, 'mod_assignment', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823807),
(84, 0, 'mod_book', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823807),
(85, 0, 'mod_book', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823810),
(86, 0, 'mod_book', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823815),
(87, 0, 'mod_chat', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823816),
(88, 0, 'mod_chat', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823823),
(89, 0, 'mod_chat', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823832),
(90, 0, 'mod_choice', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823832),
(91, 0, 'mod_choice', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823837),
(92, 0, 'mod_choice', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823844),
(93, 0, 'mod_data', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823844),
(94, 0, 'mod_data', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823850),
(95, 0, 'mod_data', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823869),
(96, 0, 'mod_feedback', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823869),
(97, 0, 'mod_feedback', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823883),
(98, 0, 'mod_feedback', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823896),
(99, 0, 'mod_folder', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823896),
(100, 0, 'mod_folder', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823898),
(101, 0, 'mod_folder', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823902),
(102, 0, 'mod_forum', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823902),
(103, 0, 'mod_forum', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823923),
(104, 0, 'mod_forum', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823957),
(105, 0, 'mod_glossary', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823957),
(106, 0, 'mod_glossary', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823967),
(107, 0, 'mod_glossary', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823985),
(108, 0, 'mod_h5pactivity', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823985),
(109, 0, 'mod_h5pactivity', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823990),
(110, 0, 'mod_h5pactivity', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634823994),
(111, 0, 'mod_imscp', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634823995),
(112, 0, 'mod_imscp', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634823996),
(113, 0, 'mod_imscp', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824000),
(114, 0, 'mod_label', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824000),
(115, 0, 'mod_label', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824002),
(116, 0, 'mod_label', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824004),
(117, 0, 'mod_lesson', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824004),
(118, 0, 'mod_lesson', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824019),
(119, 0, 'mod_lesson', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824028),
(120, 0, 'mod_lti', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824028),
(121, 0, 'mod_lti', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824040),
(122, 0, 'mod_lti', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824050),
(123, 0, 'mod_page', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824050),
(124, 0, 'mod_page', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824052),
(125, 0, 'mod_page', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824055),
(126, 0, 'mod_quiz', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824056),
(127, 0, 'mod_quiz', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824072),
(128, 0, 'mod_quiz', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824088),
(129, 0, 'mod_resource', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824088),
(130, 0, 'mod_resource', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824092),
(131, 0, 'mod_resource', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824095),
(132, 0, 'mod_scorm', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824095),
(133, 0, 'mod_scorm', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824114),
(134, 0, 'mod_scorm', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824122),
(135, 0, 'mod_survey', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824122),
(136, 0, 'mod_survey', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824129),
(137, 0, 'mod_survey', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824149),
(138, 0, 'mod_url', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824149),
(139, 0, 'mod_url', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824152),
(140, 0, 'mod_url', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824155),
(141, 0, 'mod_wiki', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824155),
(142, 0, 'mod_wiki', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824164),
(143, 0, 'mod_wiki', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824175),
(144, 0, 'mod_workshop', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824176),
(145, 0, 'mod_workshop', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824185),
(146, 0, 'mod_workshop', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824207),
(147, 0, 'auth_cas', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824207),
(148, 0, 'auth_cas', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824207),
(149, 0, 'auth_cas', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824209),
(150, 0, 'auth_db', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824209),
(151, 0, 'auth_db', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824209),
(152, 0, 'auth_db', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824210),
(153, 0, 'auth_email', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824211),
(154, 0, 'auth_email', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824211),
(155, 0, 'auth_email', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824212),
(156, 0, 'auth_ldap', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824212),
(157, 0, 'auth_ldap', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824212),
(158, 0, 'auth_ldap', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824214),
(159, 0, 'auth_lti', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824214),
(160, 0, 'auth_lti', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824214),
(161, 0, 'auth_lti', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824215),
(162, 0, 'auth_manual', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824215),
(163, 0, 'auth_manual', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824216),
(164, 0, 'auth_manual', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824216),
(165, 0, 'auth_mnet', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824216),
(166, 0, 'auth_mnet', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824216),
(167, 0, 'auth_mnet', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824224),
(168, 0, 'auth_nologin', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824224),
(169, 0, 'auth_nologin', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824225),
(170, 0, 'auth_nologin', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824225),
(171, 0, 'auth_none', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824225),
(172, 0, 'auth_none', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824226),
(173, 0, 'auth_none', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824226),
(174, 0, 'auth_oauth2', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824226),
(175, 0, 'auth_oauth2', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824229),
(176, 0, 'auth_oauth2', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824230),
(177, 0, 'auth_shibboleth', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824231),
(178, 0, 'auth_shibboleth', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824231),
(179, 0, 'auth_shibboleth', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824232),
(180, 0, 'auth_webservice', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824232),
(181, 0, 'auth_webservice', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824233),
(182, 0, 'auth_webservice', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824233),
(183, 0, 'calendartype_gregorian', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824233),
(184, 0, 'calendartype_gregorian', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824234),
(185, 0, 'calendartype_gregorian', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824234),
(186, 0, 'customfield_checkbox', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824234),
(187, 0, 'customfield_checkbox', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824235),
(188, 0, 'customfield_checkbox', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824235),
(189, 0, 'customfield_date', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824235),
(190, 0, 'customfield_date', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824236),
(191, 0, 'customfield_date', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824236),
(192, 0, 'customfield_select', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824236),
(193, 0, 'customfield_select', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824237),
(194, 0, 'customfield_select', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824237),
(195, 0, 'customfield_text', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824237),
(196, 0, 'customfield_text', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824238),
(197, 0, 'customfield_text', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824238),
(198, 0, 'customfield_textarea', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824239),
(199, 0, 'customfield_textarea', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824239),
(200, 0, 'customfield_textarea', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824240),
(201, 0, 'enrol_category', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824240),
(202, 0, 'enrol_category', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824240),
(203, 0, 'enrol_category', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824242),
(204, 0, 'enrol_cohort', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824242),
(205, 0, 'enrol_cohort', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824243),
(206, 0, 'enrol_cohort', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824244),
(207, 0, 'enrol_database', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824245),
(208, 0, 'enrol_database', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824245),
(209, 0, 'enrol_database', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824247),
(210, 0, 'enrol_fee', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824247),
(211, 0, 'enrol_fee', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824247),
(212, 0, 'enrol_fee', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824249),
(213, 0, 'enrol_flatfile', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824249),
(214, 0, 'enrol_flatfile', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824251),
(215, 0, 'enrol_flatfile', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824255),
(216, 0, 'enrol_guest', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824255),
(217, 0, 'enrol_guest', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824255),
(218, 0, 'enrol_guest', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824257),
(219, 0, 'enrol_imsenterprise', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824257),
(220, 0, 'enrol_imsenterprise', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824257),
(221, 0, 'enrol_imsenterprise', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824259),
(222, 0, 'enrol_ldap', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824259),
(223, 0, 'enrol_ldap', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824260),
(224, 0, 'enrol_ldap', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824261),
(225, 0, 'enrol_lti', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824262),
(226, 0, 'enrol_lti', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824278),
(227, 0, 'enrol_lti', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824280),
(228, 0, 'enrol_manual', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824280),
(229, 0, 'enrol_manual', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824280),
(230, 0, 'enrol_manual', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824285),
(231, 0, 'enrol_meta', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824285),
(232, 0, 'enrol_meta', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824285),
(233, 0, 'enrol_meta', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824287),
(234, 0, 'enrol_mnet', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824287),
(235, 0, 'enrol_mnet', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824288),
(236, 0, 'enrol_mnet', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824293),
(237, 0, 'enrol_paypal', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824293),
(238, 0, 'enrol_paypal', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824295),
(239, 0, 'enrol_paypal', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824298),
(240, 0, 'enrol_self', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824298),
(241, 0, 'enrol_self', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824299),
(242, 0, 'enrol_self', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824304),
(243, 0, 'message_airnotifier', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824304),
(244, 0, 'message_airnotifier', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824306),
(245, 0, 'message_airnotifier', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824308),
(246, 0, 'message_email', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824308),
(247, 0, 'message_email', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824311),
(248, 0, 'message_email', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824312),
(249, 0, 'message_jabber', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824312),
(250, 0, 'message_jabber', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824313),
(251, 0, 'message_jabber', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824314),
(252, 0, 'message_popup', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824314),
(253, 0, 'message_popup', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824318),
(254, 0, 'message_popup', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824319),
(255, 0, 'block_accessreview', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824320),
(256, 0, 'block_accessreview', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824320),
(257, 0, 'block_accessreview', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824322),
(258, 0, 'block_activity_modules', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824323),
(259, 0, 'block_activity_modules', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824323),
(260, 0, 'block_activity_modules', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824324),
(261, 0, 'block_activity_results', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824325),
(262, 0, 'block_activity_results', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824325),
(263, 0, 'block_activity_results', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824326),
(264, 0, 'block_admin_bookmarks', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824327),
(265, 0, 'block_admin_bookmarks', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824327),
(266, 0, 'block_admin_bookmarks', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824329),
(267, 0, 'block_badges', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824329),
(268, 0, 'block_badges', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824330),
(269, 0, 'block_badges', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824332),
(270, 0, 'block_blog_recent', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824332),
(271, 0, 'block_blog_recent', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824333),
(272, 0, 'block_blog_recent', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824334),
(273, 0, 'block_blog_tags', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824334),
(274, 0, 'block_blog_tags', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824335),
(275, 0, 'block_blog_tags', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824336),
(276, 0, 'block_calendar_month', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634824336),
(277, 0, 'block_calendar_month', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634824337),
(278, 0, 'block_calendar_month', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634824338),
(279, 0, 'block_comments', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825065),
(280, 0, 'block_comments', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825065),
(281, 0, 'block_comments', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825067),
(282, 0, 'block_completionstatus', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825067),
(283, 0, 'block_completionstatus', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825068),
(284, 0, 'block_completionstatus', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825069),
(285, 0, 'block_course_list', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825069),
(286, 0, 'block_course_list', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825069),
(287, 0, 'block_course_list', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825070),
(288, 0, 'block_course_summary', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825071),
(289, 0, 'block_course_summary', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825071),
(290, 0, 'block_course_summary', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825072),
(291, 0, 'block_globalsearch', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825072),
(292, 0, 'block_globalsearch', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825073),
(293, 0, 'block_globalsearch', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825074),
(294, 0, 'block_glossary_random', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825074),
(295, 0, 'block_glossary_random', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825074),
(296, 0, 'block_glossary_random', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825076),
(297, 0, 'block_html', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825076),
(298, 0, 'block_html', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825077),
(299, 0, 'block_html', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825078),
(300, 0, 'block_login', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825078),
(301, 0, 'block_login', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825079),
(302, 0, 'block_login', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825080),
(303, 0, 'block_lp', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825080),
(304, 0, 'block_lp', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825081),
(305, 0, 'block_lp', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825082),
(306, 0, 'block_mentees', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825082),
(307, 0, 'block_mentees', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825083),
(308, 0, 'block_mentees', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825084),
(309, 0, 'block_mnet_hosts', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825084),
(310, 0, 'block_mnet_hosts', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825084),
(311, 0, 'block_mnet_hosts', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825086),
(312, 0, 'block_myprofile', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825086),
(313, 0, 'block_myprofile', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825087),
(314, 0, 'block_myprofile', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825088),
(315, 0, 'block_navigation', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825088),
(316, 0, 'block_navigation', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825089),
(317, 0, 'block_navigation', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825090),
(318, 0, 'block_private_files', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825090),
(319, 0, 'block_private_files', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825090),
(320, 0, 'block_private_files', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825092),
(321, 0, 'block_recent_activity', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825092),
(322, 0, 'block_recent_activity', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825094),
(323, 0, 'block_recent_activity', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825095),
(324, 0, 'block_recentlyaccesseditems', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825096),
(325, 0, 'block_recentlyaccesseditems', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825098),
(326, 0, 'block_recentlyaccesseditems', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825099),
(327, 0, 'block_rss_client', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825099),
(328, 0, 'block_rss_client', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825100),
(329, 0, 'block_rss_client', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825103),
(330, 0, 'block_search_forums', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825103),
(331, 0, 'block_search_forums', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825104),
(332, 0, 'block_search_forums', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825105),
(333, 0, 'block_selfcompletion', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825105),
(334, 0, 'block_selfcompletion', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825105),
(335, 0, 'block_selfcompletion', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825106),
(336, 0, 'block_site_main_menu', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825106),
(337, 0, 'block_site_main_menu', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825107),
(338, 0, 'block_site_main_menu', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825108),
(339, 0, 'block_starredcourses', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825108),
(340, 0, 'block_starredcourses', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825109),
(341, 0, 'block_starredcourses', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825110),
(342, 0, 'block_tag_youtube', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825110),
(343, 0, 'block_tag_youtube', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825111),
(344, 0, 'block_tag_youtube', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825113),
(345, 2, 'core', '2021051703.08', '2021051703.08', 'Exception: coding_exception', 'Coding error detected, it must be fixed by a programmer: Block type timeline has been disabled by the administrator.', '* line 1016 of /lib/blocklib.php: coding_exception thrown\n* line 799 of /lib/blocklib.php: call to block_manager->check_known_block_type()\n* line 893 of /lib/blocklib.php: call to block_manager->add_block()\n* line 2604 of /lib/blocklib.php: call to block_manager->add_blocks()\n* line 1121 of /lib/upgradelib.php: call to blocks_add_default_system_blocks()\n* line 578 of /lib/upgradelib.php: call to upgrade_plugins_blocks()\n* line 1929 of /lib/upgradelib.php: call to upgrade_plugins()\n* line 713 of /admin/index.php: call to upgrade_noncore()\n', 0, 1634825114),
(346, 0, 'media_html5audio', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825142),
(347, 0, 'media_html5audio', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825142),
(348, 0, 'media_html5audio', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825143),
(349, 0, 'media_html5video', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825143),
(350, 0, 'media_html5video', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825143),
(351, 0, 'media_html5video', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825144),
(352, 0, 'media_swf', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825144),
(353, 0, 'media_swf', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825144),
(354, 0, 'media_swf', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825145),
(355, 0, 'media_videojs', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825145),
(356, 0, 'media_videojs', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825145),
(357, 0, 'media_videojs', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825146),
(358, 0, 'media_vimeo', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825146),
(359, 0, 'media_vimeo', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825147),
(360, 0, 'media_vimeo', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825147),
(361, 0, 'media_youtube', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825147),
(362, 0, 'media_youtube', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825148),
(363, 0, 'media_youtube', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825148),
(364, 0, 'filter_activitynames', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825148),
(365, 0, 'filter_activitynames', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825148),
(366, 0, 'filter_activitynames', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825150),
(367, 0, 'filter_algebra', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825150),
(368, 0, 'filter_algebra', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825150),
(369, 0, 'filter_algebra', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825151),
(370, 0, 'filter_censor', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825151),
(371, 0, 'filter_censor', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825151),
(372, 0, 'filter_censor', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825152),
(373, 0, 'filter_data', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825152),
(374, 0, 'filter_data', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825152),
(375, 0, 'filter_data', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825153),
(376, 0, 'filter_displayh5p', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825153),
(377, 0, 'filter_displayh5p', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825154),
(378, 0, 'filter_displayh5p', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825155),
(379, 0, 'filter_emailprotect', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825156),
(380, 0, 'filter_emailprotect', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825156),
(381, 0, 'filter_emailprotect', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825156),
(382, 0, 'filter_emoticon', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825157),
(383, 0, 'filter_emoticon', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825157),
(384, 0, 'filter_emoticon', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825158),
(385, 0, 'filter_glossary', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825158),
(386, 0, 'filter_glossary', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825159),
(387, 0, 'filter_glossary', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825160),
(388, 0, 'filter_mathjaxloader', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825160),
(389, 0, 'filter_mathjaxloader', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825160),
(390, 0, 'filter_mathjaxloader', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825161),
(391, 0, 'filter_mediaplugin', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825161),
(392, 0, 'filter_mediaplugin', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825162),
(393, 0, 'filter_mediaplugin', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825163),
(394, 0, 'filter_multilang', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825163),
(395, 0, 'filter_multilang', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825163),
(396, 0, 'filter_multilang', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825164),
(397, 0, 'filter_tex', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825164),
(398, 0, 'filter_tex', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825164),
(399, 0, 'filter_tex', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825165),
(400, 0, 'filter_tidy', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825166),
(401, 0, 'filter_tidy', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825166),
(402, 0, 'filter_tidy', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825167),
(403, 0, 'filter_urltolink', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825167),
(404, 0, 'filter_urltolink', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825167),
(405, 0, 'filter_urltolink', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825168),
(406, 0, 'editor_atto', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825168),
(407, 0, 'editor_atto', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825170),
(408, 0, 'editor_atto', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825171),
(409, 0, 'editor_textarea', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825172),
(410, 0, 'editor_textarea', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825173),
(411, 0, 'editor_textarea', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825173),
(412, 0, 'editor_tinymce', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825174),
(413, 0, 'editor_tinymce', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825174),
(414, 0, 'editor_tinymce', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825175),
(415, 0, 'format_singleactivity', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825175),
(416, 0, 'format_singleactivity', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825175),
(417, 0, 'format_singleactivity', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825176),
(418, 0, 'format_social', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825176),
(419, 0, 'format_social', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825177),
(420, 0, 'format_social', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825177),
(421, 0, 'format_topics', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825177),
(422, 0, 'format_topics', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825178),
(423, 0, 'format_topics', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825179),
(424, 0, 'format_weeks', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825179),
(425, 0, 'format_weeks', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825179),
(426, 0, 'format_weeks', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825180),
(427, 0, 'dataformat_csv', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825181),
(428, 0, 'dataformat_csv', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825181),
(429, 0, 'dataformat_csv', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825182),
(430, 0, 'dataformat_excel', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825183),
(431, 0, 'dataformat_excel', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825183),
(432, 0, 'dataformat_excel', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825184),
(433, 0, 'dataformat_html', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825184),
(434, 0, 'dataformat_html', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825185),
(435, 0, 'dataformat_html', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825186),
(436, 0, 'dataformat_json', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825186),
(437, 0, 'dataformat_json', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825186),
(438, 0, 'dataformat_json', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825187),
(439, 0, 'dataformat_ods', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825187),
(440, 0, 'dataformat_ods', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825188),
(441, 0, 'dataformat_ods', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825188),
(442, 0, 'dataformat_pdf', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825189),
(443, 0, 'dataformat_pdf', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825189),
(444, 0, 'dataformat_pdf', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825190),
(445, 0, 'profilefield_checkbox', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825190),
(446, 0, 'profilefield_checkbox', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825190),
(447, 0, 'profilefield_checkbox', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825191),
(448, 0, 'profilefield_datetime', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825191),
(449, 0, 'profilefield_datetime', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825192),
(450, 0, 'profilefield_datetime', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825192),
(451, 0, 'profilefield_menu', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825192),
(452, 0, 'profilefield_menu', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825193),
(453, 0, 'profilefield_menu', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825193),
(454, 0, 'profilefield_social', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825193),
(455, 0, 'profilefield_social', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825194),
(456, 0, 'profilefield_social', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825194),
(457, 0, 'profilefield_text', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825195),
(458, 0, 'profilefield_text', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825195),
(459, 0, 'profilefield_text', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825196),
(460, 0, 'profilefield_textarea', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825196),
(461, 0, 'profilefield_textarea', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825196),
(462, 0, 'profilefield_textarea', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825197),
(463, 0, 'report_backups', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825197),
(464, 0, 'report_backups', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825197),
(465, 0, 'report_backups', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825198),
(466, 0, 'report_competency', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825198),
(467, 0, 'report_competency', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825198),
(468, 0, 'report_competency', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825199),
(469, 0, 'report_completion', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825199),
(470, 0, 'report_completion', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825200),
(471, 0, 'report_completion', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825202),
(472, 0, 'report_configlog', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825202),
(473, 0, 'report_configlog', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825202),
(474, 0, 'report_configlog', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825203);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(475, 0, 'report_courseoverview', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825203),
(476, 0, 'report_courseoverview', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825204),
(477, 0, 'report_courseoverview', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825205),
(478, 0, 'report_eventlist', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825205),
(479, 0, 'report_eventlist', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825206),
(480, 0, 'report_eventlist', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825207),
(481, 0, 'report_infectedfiles', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825207),
(482, 0, 'report_infectedfiles', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825207),
(483, 0, 'report_infectedfiles', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825208),
(484, 0, 'report_insights', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825208),
(485, 0, 'report_insights', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825209),
(486, 0, 'report_insights', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825210),
(487, 0, 'report_log', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825210),
(488, 0, 'report_log', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825211),
(489, 0, 'report_log', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825213),
(490, 0, 'report_loglive', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825214),
(491, 0, 'report_loglive', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825214),
(492, 0, 'report_loglive', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825216),
(493, 0, 'report_outline', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825216),
(494, 0, 'report_outline', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825216),
(495, 0, 'report_outline', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825218),
(496, 0, 'report_participation', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825219),
(497, 0, 'report_participation', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825219),
(498, 0, 'report_participation', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825221),
(499, 0, 'report_performance', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825221),
(500, 0, 'report_performance', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825221),
(501, 0, 'report_performance', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825222),
(502, 0, 'report_progress', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825223),
(503, 0, 'report_progress', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825223),
(504, 0, 'report_progress', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825225),
(505, 0, 'report_questioninstances', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825225),
(506, 0, 'report_questioninstances', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825225),
(507, 0, 'report_questioninstances', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825226),
(508, 0, 'report_security', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825226),
(509, 0, 'report_security', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825227),
(510, 0, 'report_security', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825228),
(511, 0, 'report_stats', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825228),
(512, 0, 'report_stats', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825229),
(513, 0, 'report_stats', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825231),
(514, 0, 'report_status', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825231),
(515, 0, 'report_status', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825231),
(516, 0, 'report_status', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825232),
(517, 0, 'report_usersessions', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825233),
(518, 0, 'report_usersessions', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825233),
(519, 0, 'report_usersessions', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825234),
(520, 0, 'gradeexport_ods', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825234),
(521, 0, 'gradeexport_ods', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825235),
(522, 0, 'gradeexport_ods', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825237),
(523, 0, 'gradeexport_txt', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825237),
(524, 0, 'gradeexport_txt', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825237),
(525, 0, 'gradeexport_txt', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825239),
(526, 0, 'gradeexport_xls', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825239),
(527, 0, 'gradeexport_xls', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825239),
(528, 0, 'gradeexport_xls', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825241),
(529, 0, 'gradeexport_xml', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825241),
(530, 0, 'gradeexport_xml', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825242),
(531, 0, 'gradeexport_xml', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825243),
(532, 0, 'gradeimport_csv', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825244),
(533, 0, 'gradeimport_csv', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825244),
(534, 0, 'gradeimport_csv', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825245),
(535, 0, 'gradeimport_direct', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825245),
(536, 0, 'gradeimport_direct', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825246),
(537, 0, 'gradeimport_direct', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825247),
(538, 0, 'gradeimport_xml', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825247),
(539, 0, 'gradeimport_xml', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825247),
(540, 0, 'gradeimport_xml', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825249),
(541, 0, 'gradereport_grader', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825249),
(542, 0, 'gradereport_grader', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825249),
(543, 0, 'gradereport_grader', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825251),
(544, 0, 'gradereport_history', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825251),
(545, 0, 'gradereport_history', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825251),
(546, 0, 'gradereport_history', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825253),
(547, 0, 'gradereport_outcomes', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825253),
(548, 0, 'gradereport_outcomes', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825253),
(549, 0, 'gradereport_outcomes', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825255),
(550, 0, 'gradereport_overview', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825255),
(551, 0, 'gradereport_overview', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825255),
(552, 0, 'gradereport_overview', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825257),
(553, 0, 'gradereport_singleview', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825257),
(554, 0, 'gradereport_singleview', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825257),
(555, 0, 'gradereport_singleview', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825259),
(556, 0, 'gradereport_user', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825259),
(557, 0, 'gradereport_user', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825259),
(558, 0, 'gradereport_user', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825261),
(559, 0, 'gradingform_guide', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825261),
(560, 0, 'gradingform_guide', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825265),
(561, 0, 'gradingform_guide', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825266),
(562, 0, 'gradingform_rubric', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825266),
(563, 0, 'gradingform_rubric', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825271),
(564, 0, 'gradingform_rubric', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825272),
(565, 0, 'mlbackend_php', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825272),
(566, 0, 'mlbackend_php', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825273),
(567, 0, 'mlbackend_php', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825273),
(568, 0, 'mlbackend_python', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825273),
(569, 0, 'mlbackend_python', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825274),
(570, 0, 'mlbackend_python', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825274),
(571, 0, 'mnetservice_enrol', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825275),
(572, 0, 'mnetservice_enrol', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825278),
(573, 0, 'mnetservice_enrol', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825278),
(574, 0, 'webservice_rest', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825279),
(575, 0, 'webservice_rest', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825279),
(576, 0, 'webservice_rest', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825280),
(577, 0, 'webservice_soap', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825280),
(578, 0, 'webservice_soap', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825280),
(579, 0, 'webservice_soap', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825281),
(580, 0, 'webservice_xmlrpc', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825281),
(581, 0, 'webservice_xmlrpc', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825282),
(582, 0, 'webservice_xmlrpc', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825283),
(583, 0, 'repository_areafiles', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825283),
(584, 0, 'repository_areafiles', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825283),
(585, 0, 'repository_areafiles', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825286),
(586, 0, 'repository_boxnet', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825286),
(587, 0, 'repository_boxnet', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825286),
(588, 0, 'repository_boxnet', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825287),
(589, 0, 'repository_contentbank', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825288),
(590, 0, 'repository_contentbank', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825288),
(591, 0, 'repository_contentbank', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825293),
(592, 0, 'repository_coursefiles', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825293),
(593, 0, 'repository_coursefiles', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825293),
(594, 0, 'repository_coursefiles', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825296),
(595, 0, 'repository_dropbox', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825296),
(596, 0, 'repository_dropbox', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825296),
(597, 0, 'repository_dropbox', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825298),
(598, 0, 'repository_equella', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825298),
(599, 0, 'repository_equella', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825298),
(600, 0, 'repository_equella', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825299),
(601, 0, 'repository_filesystem', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825300),
(602, 0, 'repository_filesystem', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825300),
(603, 0, 'repository_filesystem', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825302),
(604, 0, 'repository_flickr', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825303),
(605, 0, 'repository_flickr', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825303),
(606, 0, 'repository_flickr', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825304),
(607, 0, 'repository_flickr_public', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825304),
(608, 0, 'repository_flickr_public', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825305),
(609, 0, 'repository_flickr_public', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825306),
(610, 0, 'repository_googledocs', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825306),
(611, 0, 'repository_googledocs', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825307),
(612, 0, 'repository_googledocs', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825308),
(613, 0, 'repository_local', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825309),
(614, 0, 'repository_local', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825309),
(615, 0, 'repository_local', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825312),
(616, 0, 'repository_merlot', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825312),
(617, 0, 'repository_merlot', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825312),
(618, 0, 'repository_merlot', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825313),
(619, 0, 'repository_nextcloud', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825314),
(620, 0, 'repository_nextcloud', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825314),
(621, 0, 'repository_nextcloud', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825315),
(622, 0, 'repository_onedrive', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825315),
(623, 0, 'repository_onedrive', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825317),
(624, 0, 'repository_onedrive', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825318),
(625, 0, 'repository_picasa', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825318),
(626, 0, 'repository_picasa', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825318),
(627, 0, 'repository_picasa', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825319),
(628, 0, 'repository_recent', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825319),
(629, 0, 'repository_recent', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825320),
(630, 0, 'repository_recent', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825322),
(631, 0, 'repository_s3', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825322),
(632, 0, 'repository_s3', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825322),
(633, 0, 'repository_s3', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825323),
(634, 0, 'repository_skydrive', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825323),
(635, 0, 'repository_skydrive', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825324),
(636, 0, 'repository_skydrive', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825325),
(637, 0, 'repository_upload', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825325),
(638, 0, 'repository_upload', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825325),
(639, 0, 'repository_upload', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825327),
(640, 0, 'repository_url', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825328),
(641, 0, 'repository_url', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825328),
(642, 0, 'repository_url', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825330),
(643, 0, 'repository_user', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825330),
(644, 0, 'repository_user', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825331),
(645, 0, 'repository_user', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825333),
(646, 0, 'repository_webdav', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825333),
(647, 0, 'repository_webdav', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825333),
(648, 0, 'repository_webdav', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825335),
(649, 0, 'repository_wikimedia', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825335),
(650, 0, 'repository_wikimedia', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825336),
(651, 0, 'repository_wikimedia', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825338),
(652, 0, 'repository_youtube', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825338),
(653, 0, 'repository_youtube', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825338),
(654, 0, 'repository_youtube', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825340),
(655, 0, 'portfolio_boxnet', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825340),
(656, 0, 'portfolio_boxnet', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825340),
(657, 0, 'portfolio_boxnet', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825341),
(658, 0, 'portfolio_download', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825342),
(659, 0, 'portfolio_download', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825342),
(660, 0, 'portfolio_download', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825342),
(661, 0, 'portfolio_flickr', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825343),
(662, 0, 'portfolio_flickr', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825343),
(663, 0, 'portfolio_flickr', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825344),
(664, 0, 'portfolio_googledocs', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825344),
(665, 0, 'portfolio_googledocs', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825344),
(666, 0, 'portfolio_googledocs', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825345),
(667, 0, 'portfolio_mahara', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825345),
(668, 0, 'portfolio_mahara', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825347),
(669, 0, 'portfolio_mahara', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825349),
(670, 0, 'portfolio_picasa', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825349),
(671, 0, 'portfolio_picasa', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825350),
(672, 0, 'portfolio_picasa', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825350),
(673, 0, 'search_simpledb', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825351),
(674, 0, 'search_simpledb', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825352),
(675, 2, 'core', '2021051703.08', '2021051703.08', 'Exception: dml_write_exception', 'Error writing to database', '* line 489 of /lib/dml/moodle_database.php: dml_write_exception thrown\n* line 1167 of /lib/dml/mysqli_native_moodle_database.php: call to moodle_database->query_end()\n* line 51 of /search/engine/simpledb/db/install.php: call to mysqli_native_moodle_database->execute()\n* line 676 of /lib/upgradelib.php: call to xmldb_search_simpledb_install()\n* line 1929 of /lib/upgradelib.php: call to upgrade_plugins()\n* line 713 of /admin/index.php: call to upgrade_noncore()\n', 0, 1634825353),
(676, 0, 'search_solr', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825516),
(677, 0, 'search_solr', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825517),
(678, 0, 'search_solr', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825518),
(679, 0, 'qbehaviour_adaptive', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825518),
(680, 0, 'qbehaviour_adaptive', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825518),
(681, 0, 'qbehaviour_adaptive', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825519),
(682, 0, 'qbehaviour_adaptivenopenalty', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825519),
(683, 0, 'qbehaviour_adaptivenopenalty', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825519),
(684, 0, 'qbehaviour_adaptivenopenalty', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825520),
(685, 0, 'qbehaviour_deferredcbm', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825520),
(686, 0, 'qbehaviour_deferredcbm', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825520),
(687, 0, 'qbehaviour_deferredcbm', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825521),
(688, 0, 'qbehaviour_deferredfeedback', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825521),
(689, 0, 'qbehaviour_deferredfeedback', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825521),
(690, 0, 'qbehaviour_deferredfeedback', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825522),
(691, 0, 'qbehaviour_immediatecbm', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825522),
(692, 0, 'qbehaviour_immediatecbm', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825522),
(693, 0, 'qbehaviour_immediatecbm', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825523),
(694, 0, 'qbehaviour_immediatefeedback', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825523),
(695, 0, 'qbehaviour_immediatefeedback', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825523),
(696, 0, 'qbehaviour_immediatefeedback', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825524),
(697, 0, 'qbehaviour_informationitem', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825524),
(698, 0, 'qbehaviour_informationitem', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825524),
(699, 0, 'qbehaviour_informationitem', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825525),
(700, 0, 'qbehaviour_interactive', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825525),
(701, 0, 'qbehaviour_interactive', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825525),
(702, 0, 'qbehaviour_interactive', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825526),
(703, 0, 'qbehaviour_interactivecountback', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825526),
(704, 0, 'qbehaviour_interactivecountback', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825526),
(705, 0, 'qbehaviour_interactivecountback', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825527),
(706, 0, 'qbehaviour_manualgraded', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825527),
(707, 0, 'qbehaviour_manualgraded', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825527),
(708, 0, 'qbehaviour_manualgraded', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825528),
(709, 0, 'qbehaviour_missing', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825528),
(710, 0, 'qbehaviour_missing', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825529),
(711, 0, 'qbehaviour_missing', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825529),
(712, 0, 'qformat_aiken', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825529),
(713, 0, 'qformat_aiken', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825530),
(714, 0, 'qformat_aiken', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825530),
(715, 0, 'qformat_blackboard_six', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825530),
(716, 0, 'qformat_blackboard_six', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825531),
(717, 0, 'qformat_blackboard_six', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825531),
(718, 0, 'qformat_examview', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825531),
(719, 0, 'qformat_examview', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825532),
(720, 0, 'qformat_examview', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825532),
(721, 0, 'qformat_gift', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825532),
(722, 0, 'qformat_gift', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825533),
(723, 0, 'qformat_gift', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825533),
(724, 0, 'qformat_missingword', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825533),
(725, 0, 'qformat_missingword', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825534),
(726, 0, 'qformat_missingword', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825534),
(727, 0, 'qformat_multianswer', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825534),
(728, 0, 'qformat_multianswer', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825534),
(729, 0, 'qformat_multianswer', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825535),
(730, 0, 'qformat_webct', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825535),
(731, 0, 'qformat_webct', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825535),
(732, 0, 'qformat_webct', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825536),
(733, 0, 'qformat_xhtml', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825536),
(734, 0, 'qformat_xhtml', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825536),
(735, 0, 'qformat_xhtml', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825537),
(736, 0, 'qformat_xml', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825537),
(737, 0, 'qformat_xml', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825538),
(738, 0, 'qformat_xml', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825538),
(739, 0, 'tool_analytics', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825538),
(740, 0, 'tool_analytics', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825539),
(741, 0, 'tool_analytics', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825540),
(742, 0, 'tool_availabilityconditions', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825540),
(743, 0, 'tool_availabilityconditions', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825540),
(744, 0, 'tool_availabilityconditions', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825541),
(745, 0, 'tool_behat', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825541),
(746, 0, 'tool_behat', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825541),
(747, 0, 'tool_behat', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825542),
(748, 0, 'tool_brickfield', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825542),
(749, 0, 'tool_brickfield', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825559),
(750, 0, 'tool_brickfield', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825568),
(751, 0, 'tool_capability', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825568),
(752, 0, 'tool_capability', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825569),
(753, 0, 'tool_capability', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825570),
(754, 0, 'tool_cohortroles', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825570),
(755, 0, 'tool_cohortroles', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825572),
(756, 0, 'tool_cohortroles', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825573),
(757, 0, 'tool_customlang', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825573),
(758, 0, 'tool_customlang', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825576),
(759, 0, 'tool_customlang', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825579),
(760, 0, 'tool_dataprivacy', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825579),
(761, 0, 'tool_dataprivacy', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825590),
(762, 0, 'tool_dataprivacy', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825598),
(763, 0, 'tool_dbtransfer', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825598),
(764, 0, 'tool_dbtransfer', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825599),
(765, 0, 'tool_dbtransfer', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825599),
(766, 0, 'tool_filetypes', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825599),
(767, 0, 'tool_filetypes', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825599),
(768, 0, 'tool_filetypes', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825600),
(769, 0, 'tool_generator', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825600),
(770, 0, 'tool_generator', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825601),
(771, 0, 'tool_generator', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825601),
(772, 0, 'tool_health', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825602),
(773, 0, 'tool_health', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825602),
(774, 0, 'tool_health', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825603),
(775, 0, 'tool_httpsreplace', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825603),
(776, 0, 'tool_httpsreplace', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825603),
(777, 0, 'tool_httpsreplace', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825604),
(778, 0, 'tool_innodb', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825604),
(779, 0, 'tool_innodb', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825604),
(780, 0, 'tool_innodb', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825605),
(781, 0, 'tool_installaddon', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825605),
(782, 0, 'tool_installaddon', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825605),
(783, 0, 'tool_installaddon', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825606),
(784, 0, 'tool_langimport', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825606),
(785, 0, 'tool_langimport', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825607),
(786, 0, 'tool_langimport', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825608),
(787, 0, 'tool_licensemanager', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825608),
(788, 0, 'tool_licensemanager', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825608),
(789, 0, 'tool_licensemanager', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825609),
(790, 0, 'tool_log', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825609),
(791, 0, 'tool_log', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825610),
(792, 0, 'tool_log', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825611),
(793, 0, 'tool_lp', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825611),
(794, 0, 'tool_lp', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825612),
(795, 0, 'tool_lp', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825616),
(796, 0, 'tool_lpimportcsv', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825616),
(797, 0, 'tool_lpimportcsv', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825616),
(798, 0, 'tool_lpimportcsv', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825617),
(799, 0, 'tool_lpmigrate', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825617),
(800, 0, 'tool_lpmigrate', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825618),
(801, 0, 'tool_lpmigrate', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825618),
(802, 0, 'tool_messageinbound', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825619),
(803, 0, 'tool_messageinbound', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825619),
(804, 0, 'tool_messageinbound', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825621),
(805, 0, 'tool_mobile', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825621),
(806, 0, 'tool_mobile', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825622),
(807, 0, 'tool_mobile', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825624),
(808, 0, 'tool_monitor', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825624),
(809, 0, 'tool_monitor', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825630),
(810, 0, 'tool_monitor', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825632),
(811, 0, 'tool_moodlenet', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825633),
(812, 0, 'tool_moodlenet', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825633),
(813, 0, 'tool_moodlenet', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825634),
(814, 0, 'tool_multilangupgrade', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825634),
(815, 0, 'tool_multilangupgrade', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825634),
(816, 0, 'tool_multilangupgrade', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825635),
(817, 0, 'tool_oauth2', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825635),
(818, 0, 'tool_oauth2', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825635),
(819, 0, 'tool_oauth2', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825636),
(820, 0, 'tool_phpunit', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825636),
(821, 0, 'tool_phpunit', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825636),
(822, 0, 'tool_phpunit', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825637),
(823, 0, 'tool_policy', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825637),
(824, 0, 'tool_policy', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825642),
(825, 0, 'tool_policy', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825644),
(826, 0, 'tool_profiling', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825644),
(827, 0, 'tool_profiling', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825645),
(828, 0, 'tool_profiling', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825646),
(829, 0, 'tool_recyclebin', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825646),
(830, 0, 'tool_recyclebin', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825650),
(831, 0, 'tool_recyclebin', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825654),
(832, 0, 'tool_replace', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825654),
(833, 0, 'tool_replace', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825654),
(834, 0, 'tool_replace', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825655),
(835, 0, 'tool_spamcleaner', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825655),
(836, 0, 'tool_spamcleaner', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825656),
(837, 0, 'tool_spamcleaner', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825656),
(838, 0, 'tool_task', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825657),
(839, 0, 'tool_task', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825657),
(840, 0, 'tool_task', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825658),
(841, 0, 'tool_templatelibrary', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825658),
(842, 0, 'tool_templatelibrary', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825659),
(843, 0, 'tool_templatelibrary', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825660),
(844, 0, 'tool_unsuproles', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825660),
(845, 0, 'tool_unsuproles', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825660),
(846, 0, 'tool_unsuproles', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825661),
(847, 0, 'tool_uploadcourse', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825661),
(848, 0, 'tool_uploadcourse', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825662),
(849, 0, 'tool_uploadcourse', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825662),
(850, 0, 'tool_uploaduser', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825662),
(851, 0, 'tool_uploaduser', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825663),
(852, 0, 'tool_uploaduser', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825664),
(853, 0, 'tool_usertours', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825664),
(854, 0, 'tool_usertours', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825667),
(855, 0, 'tool_usertours', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825675),
(856, 0, 'tool_xmldb', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825675),
(857, 0, 'tool_xmldb', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825676),
(858, 0, 'tool_xmldb', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825677),
(859, 0, 'cachestore_apcu', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825677),
(860, 0, 'cachestore_apcu', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825677),
(861, 0, 'cachestore_apcu', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825678),
(862, 0, 'cachestore_file', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825678),
(863, 0, 'cachestore_file', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825679),
(864, 0, 'cachestore_file', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825679),
(865, 0, 'cachestore_memcached', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825679),
(866, 0, 'cachestore_memcached', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825680),
(867, 0, 'cachestore_memcached', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825680),
(868, 0, 'cachestore_mongodb', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825681),
(869, 0, 'cachestore_mongodb', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825681),
(870, 0, 'cachestore_mongodb', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825682),
(871, 0, 'cachestore_redis', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825682),
(872, 0, 'cachestore_redis', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825682),
(873, 0, 'cachestore_redis', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825683),
(874, 0, 'cachestore_session', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825683),
(875, 0, 'cachestore_session', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825683),
(876, 0, 'cachestore_session', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825684),
(877, 0, 'cachestore_static', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825684),
(878, 0, 'cachestore_static', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825685),
(879, 0, 'cachestore_static', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825685),
(880, 0, 'cachelock_file', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825685),
(881, 0, 'cachelock_file', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825686),
(882, 0, 'cachelock_file', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825686),
(883, 0, 'fileconverter_googledrive', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825687),
(884, 0, 'fileconverter_googledrive', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825687),
(885, 0, 'fileconverter_googledrive', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825688),
(886, 0, 'fileconverter_unoconv', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825688),
(887, 0, 'fileconverter_unoconv', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825688),
(888, 0, 'fileconverter_unoconv', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825689),
(889, 0, 'contenttype_h5p', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825690),
(890, 0, 'contenttype_h5p', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825690),
(891, 0, 'contenttype_h5p', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825693),
(892, 0, 'theme_boost', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825694),
(893, 0, 'theme_boost', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825694),
(894, 0, 'theme_boost', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825694),
(895, 0, 'theme_classic', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825694),
(896, 0, 'theme_classic', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825695),
(897, 0, 'theme_classic', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825695),
(898, 0, 'h5plib_v124', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825696),
(899, 0, 'h5plib_v124', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825696),
(900, 0, 'h5plib_v124', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825696),
(901, 0, 'paygw_paypal', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825697),
(902, 0, 'paygw_paypal', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825698),
(903, 0, 'paygw_paypal', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825700),
(904, 0, 'assignsubmission_comments', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825700),
(905, 0, 'assignsubmission_comments', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825700),
(906, 0, 'assignsubmission_comments', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825702),
(907, 0, 'assignsubmission_file', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825702),
(908, 0, 'assignsubmission_file', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825704),
(909, 0, 'assignsubmission_file', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825705),
(910, 0, 'assignsubmission_onlinetext', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825705),
(911, 0, 'assignsubmission_onlinetext', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825707),
(912, 0, 'assignsubmission_onlinetext', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825709),
(913, 0, 'assignfeedback_comments', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825709),
(914, 0, 'assignfeedback_comments', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825712),
(915, 0, 'assignfeedback_comments', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825714),
(916, 0, 'assignfeedback_editpdf', NULL, '2021051701', 'Starting plugin installation', NULL, '', 0, 1634825714),
(917, 0, 'assignfeedback_editpdf', '2021051701', '2021051701', 'Upgrade savepoint reached', NULL, '', 0, 1634825724),
(918, 0, 'assignfeedback_editpdf', '2021051701', '2021051701', 'Plugin installed', NULL, '', 0, 1634825727),
(919, 0, 'assignfeedback_file', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825727),
(920, 0, 'assignfeedback_file', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825730),
(921, 0, 'assignfeedback_file', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825731),
(922, 0, 'assignfeedback_offline', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825732),
(923, 0, 'assignfeedback_offline', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825732),
(924, 0, 'assignfeedback_offline', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825733),
(925, 0, 'assignment_offline', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825733),
(926, 0, 'assignment_offline', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825734),
(927, 0, 'assignment_offline', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825734),
(928, 0, 'assignment_online', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825734),
(929, 0, 'assignment_online', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825735),
(930, 0, 'assignment_online', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825735),
(931, 0, 'assignment_upload', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825735),
(932, 0, 'assignment_upload', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825735),
(933, 0, 'assignment_upload', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825736),
(934, 0, 'assignment_uploadsingle', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825736),
(935, 0, 'assignment_uploadsingle', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825737),
(936, 0, 'assignment_uploadsingle', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825737),
(937, 0, 'booktool_exportimscp', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825737),
(938, 0, 'booktool_exportimscp', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825738);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(939, 0, 'booktool_exportimscp', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825739),
(940, 0, 'booktool_importhtml', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825739),
(941, 0, 'booktool_importhtml', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825739),
(942, 0, 'booktool_importhtml', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825740),
(943, 0, 'booktool_print', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825741),
(944, 0, 'booktool_print', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825741),
(945, 0, 'booktool_print', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825743),
(946, 0, 'datafield_checkbox', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825743),
(947, 0, 'datafield_checkbox', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825744),
(948, 0, 'datafield_checkbox', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825744),
(949, 0, 'datafield_date', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825744),
(950, 0, 'datafield_date', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825745),
(951, 0, 'datafield_date', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825746),
(952, 0, 'datafield_file', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825746),
(953, 0, 'datafield_file', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825746),
(954, 0, 'datafield_file', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825747),
(955, 0, 'datafield_latlong', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825747),
(956, 0, 'datafield_latlong', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825747),
(957, 0, 'datafield_latlong', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825748),
(958, 0, 'datafield_menu', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825748),
(959, 0, 'datafield_menu', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825748),
(960, 0, 'datafield_menu', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825749),
(961, 0, 'datafield_multimenu', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825749),
(962, 0, 'datafield_multimenu', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825750),
(963, 0, 'datafield_multimenu', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825750),
(964, 0, 'datafield_number', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825750),
(965, 0, 'datafield_number', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825751),
(966, 0, 'datafield_number', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825751),
(967, 0, 'datafield_picture', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825752),
(968, 0, 'datafield_picture', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825752),
(969, 0, 'datafield_picture', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825753),
(970, 0, 'datafield_radiobutton', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825753),
(971, 0, 'datafield_radiobutton', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825753),
(972, 0, 'datafield_radiobutton', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825754),
(973, 0, 'datafield_text', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825754),
(974, 0, 'datafield_text', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825754),
(975, 0, 'datafield_text', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825755),
(976, 0, 'datafield_textarea', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825755),
(977, 0, 'datafield_textarea', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825756),
(978, 0, 'datafield_textarea', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825756),
(979, 0, 'datafield_url', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825756),
(980, 0, 'datafield_url', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825757),
(981, 0, 'datafield_url', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825758),
(982, 0, 'datapreset_imagegallery', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825758),
(983, 0, 'datapreset_imagegallery', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825759),
(984, 0, 'datapreset_imagegallery', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825759),
(985, 0, 'forumreport_summary', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825759),
(986, 0, 'forumreport_summary', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825760),
(987, 0, 'forumreport_summary', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825762),
(988, 0, 'ltiservice_basicoutcomes', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825762),
(989, 0, 'ltiservice_basicoutcomes', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825763),
(990, 0, 'ltiservice_basicoutcomes', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825763),
(991, 0, 'ltiservice_gradebookservices', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825764),
(992, 0, 'ltiservice_gradebookservices', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825765),
(993, 0, 'ltiservice_gradebookservices', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825766),
(994, 0, 'ltiservice_memberships', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825767),
(995, 0, 'ltiservice_memberships', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825767),
(996, 0, 'ltiservice_memberships', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825768),
(997, 0, 'ltiservice_profile', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825768),
(998, 0, 'ltiservice_profile', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825768),
(999, 0, 'ltiservice_profile', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825769),
(1000, 0, 'ltiservice_toolproxy', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825769),
(1001, 0, 'ltiservice_toolproxy', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825769),
(1002, 0, 'ltiservice_toolproxy', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825770),
(1003, 0, 'ltiservice_toolsettings', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825770),
(1004, 0, 'ltiservice_toolsettings', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825771),
(1005, 0, 'ltiservice_toolsettings', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825771),
(1006, 0, 'quiz_grading', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825771),
(1007, 0, 'quiz_grading', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825772),
(1008, 0, 'quiz_grading', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825775),
(1009, 0, 'quiz_overview', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825775),
(1010, 0, 'quiz_overview', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825777),
(1011, 0, 'quiz_overview', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825778),
(1012, 0, 'quiz_responses', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825779),
(1013, 0, 'quiz_responses', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825779),
(1014, 0, 'quiz_responses', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825780),
(1015, 0, 'quiz_statistics', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825780),
(1016, 0, 'quiz_statistics', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825782),
(1017, 0, 'quiz_statistics', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825784),
(1018, 0, 'quizaccess_delaybetweenattempts', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825784),
(1019, 0, 'quizaccess_delaybetweenattempts', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825784),
(1020, 0, 'quizaccess_delaybetweenattempts', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825785),
(1021, 0, 'quizaccess_ipaddress', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825785),
(1022, 0, 'quizaccess_ipaddress', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825785),
(1023, 0, 'quizaccess_ipaddress', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825786),
(1024, 0, 'quizaccess_numattempts', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825786),
(1025, 0, 'quizaccess_numattempts', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825787),
(1026, 0, 'quizaccess_numattempts', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825787),
(1027, 0, 'quizaccess_offlineattempts', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825787),
(1028, 0, 'quizaccess_offlineattempts', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825788),
(1029, 0, 'quizaccess_offlineattempts', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825788),
(1030, 0, 'quizaccess_openclosedate', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825789),
(1031, 0, 'quizaccess_openclosedate', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825789),
(1032, 0, 'quizaccess_openclosedate', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825789),
(1033, 0, 'quizaccess_password', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825790),
(1034, 0, 'quizaccess_password', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825790),
(1035, 0, 'quizaccess_password', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825790),
(1036, 0, 'quizaccess_seb', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825790),
(1037, 0, 'quizaccess_seb', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825795),
(1038, 0, 'quizaccess_seb', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825813),
(1039, 0, 'quizaccess_securewindow', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825813),
(1040, 0, 'quizaccess_securewindow', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825813),
(1041, 0, 'quizaccess_securewindow', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825814),
(1042, 0, 'quizaccess_timelimit', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825814),
(1043, 0, 'quizaccess_timelimit', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825815),
(1044, 0, 'quizaccess_timelimit', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825815),
(1045, 0, 'scormreport_basic', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825816),
(1046, 0, 'scormreport_basic', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825816),
(1047, 0, 'scormreport_basic', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825816),
(1048, 0, 'scormreport_graphs', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825817),
(1049, 0, 'scormreport_graphs', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825817),
(1050, 0, 'scormreport_graphs', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825818),
(1051, 0, 'scormreport_interactions', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825818),
(1052, 0, 'scormreport_interactions', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825819),
(1053, 0, 'scormreport_interactions', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825819),
(1054, 0, 'scormreport_objectives', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825819),
(1055, 0, 'scormreport_objectives', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825820),
(1056, 0, 'scormreport_objectives', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825820),
(1057, 0, 'workshopform_accumulative', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825820),
(1058, 0, 'workshopform_accumulative', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825822),
(1059, 0, 'workshopform_accumulative', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825823),
(1060, 0, 'workshopform_comments', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825823),
(1061, 0, 'workshopform_comments', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825825),
(1062, 0, 'workshopform_comments', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825826),
(1063, 0, 'workshopform_numerrors', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825826),
(1064, 0, 'workshopform_numerrors', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825829),
(1065, 0, 'workshopform_numerrors', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825830),
(1066, 0, 'workshopform_rubric', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825831),
(1067, 0, 'workshopform_rubric', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825836),
(1068, 0, 'workshopform_rubric', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825837),
(1069, 0, 'workshopallocation_manual', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825837),
(1070, 0, 'workshopallocation_manual', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825838),
(1071, 0, 'workshopallocation_manual', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825838),
(1072, 0, 'workshopallocation_random', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825839),
(1073, 0, 'workshopallocation_random', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825839),
(1074, 0, 'workshopallocation_random', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825839),
(1075, 0, 'workshopallocation_scheduled', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825839),
(1076, 0, 'workshopallocation_scheduled', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825841),
(1077, 0, 'workshopallocation_scheduled', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825842),
(1078, 0, 'workshopeval_best', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825842),
(1079, 0, 'workshopeval_best', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825844),
(1080, 0, 'workshopeval_best', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825845),
(1081, 0, 'atto_accessibilitychecker', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825845),
(1082, 0, 'atto_accessibilitychecker', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825845),
(1083, 0, 'atto_accessibilitychecker', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825846),
(1084, 0, 'atto_accessibilityhelper', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825846),
(1085, 0, 'atto_accessibilityhelper', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825846),
(1086, 0, 'atto_accessibilityhelper', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825847),
(1087, 0, 'atto_align', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825847),
(1088, 0, 'atto_align', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825848),
(1089, 0, 'atto_align', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825849),
(1090, 0, 'atto_backcolor', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825849),
(1091, 0, 'atto_backcolor', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825849),
(1092, 0, 'atto_backcolor', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825850),
(1093, 0, 'atto_bold', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825850),
(1094, 0, 'atto_bold', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825850),
(1095, 0, 'atto_bold', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825851),
(1096, 0, 'atto_charmap', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825851),
(1097, 0, 'atto_charmap', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825851),
(1098, 0, 'atto_charmap', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825852),
(1099, 0, 'atto_clear', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825852),
(1100, 0, 'atto_clear', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825853),
(1101, 0, 'atto_clear', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825853),
(1102, 0, 'atto_collapse', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825854),
(1103, 0, 'atto_collapse', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825854),
(1104, 0, 'atto_collapse', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825855),
(1105, 0, 'atto_emojipicker', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825855),
(1106, 0, 'atto_emojipicker', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825855),
(1107, 0, 'atto_emojipicker', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825856),
(1108, 0, 'atto_emoticon', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825856),
(1109, 0, 'atto_emoticon', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825856),
(1110, 0, 'atto_emoticon', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825857),
(1111, 0, 'atto_equation', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825857),
(1112, 0, 'atto_equation', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825857),
(1113, 0, 'atto_equation', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825858),
(1114, 0, 'atto_fontcolor', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825858),
(1115, 0, 'atto_fontcolor', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825859),
(1116, 0, 'atto_fontcolor', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825859),
(1117, 0, 'atto_h5p', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825859),
(1118, 0, 'atto_h5p', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825860),
(1119, 0, 'atto_h5p', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825860),
(1120, 0, 'atto_html', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825861),
(1121, 0, 'atto_html', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825861),
(1122, 0, 'atto_html', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825862),
(1123, 0, 'atto_image', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825862),
(1124, 0, 'atto_image', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825862),
(1125, 0, 'atto_image', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825863),
(1126, 0, 'atto_indent', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825863),
(1127, 0, 'atto_indent', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825863),
(1128, 0, 'atto_indent', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825864),
(1129, 0, 'atto_italic', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825864),
(1130, 0, 'atto_italic', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825864),
(1131, 0, 'atto_italic', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825865),
(1132, 0, 'atto_link', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825865),
(1133, 0, 'atto_link', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825866),
(1134, 0, 'atto_link', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825867),
(1135, 0, 'atto_managefiles', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825867),
(1136, 0, 'atto_managefiles', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825867),
(1137, 0, 'atto_managefiles', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825868),
(1138, 0, 'atto_media', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825868),
(1139, 0, 'atto_media', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825869),
(1140, 0, 'atto_media', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825869),
(1141, 0, 'atto_noautolink', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825869),
(1142, 0, 'atto_noautolink', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825869),
(1143, 0, 'atto_noautolink', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825870),
(1144, 0, 'atto_orderedlist', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825870),
(1145, 0, 'atto_orderedlist', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825870),
(1146, 0, 'atto_orderedlist', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825871),
(1147, 0, 'atto_recordrtc', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825871),
(1148, 0, 'atto_recordrtc', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825872),
(1149, 0, 'atto_recordrtc', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825873),
(1150, 0, 'atto_rtl', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825873),
(1151, 0, 'atto_rtl', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825874),
(1152, 0, 'atto_rtl', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825874),
(1153, 0, 'atto_strike', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825875),
(1154, 0, 'atto_strike', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825875),
(1155, 0, 'atto_strike', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825875),
(1156, 0, 'atto_subscript', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825876),
(1157, 0, 'atto_subscript', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825876),
(1158, 0, 'atto_subscript', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825877),
(1159, 0, 'atto_superscript', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825877),
(1160, 0, 'atto_superscript', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825877),
(1161, 0, 'atto_superscript', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825878),
(1162, 0, 'atto_table', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825878),
(1163, 0, 'atto_table', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825879),
(1164, 0, 'atto_table', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825879),
(1165, 0, 'atto_title', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825879),
(1166, 0, 'atto_title', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825880),
(1167, 0, 'atto_title', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825880),
(1168, 0, 'atto_underline', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825880),
(1169, 0, 'atto_underline', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825881),
(1170, 0, 'atto_underline', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825881),
(1171, 0, 'atto_undo', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825881),
(1172, 0, 'atto_undo', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825882),
(1173, 0, 'atto_undo', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825882),
(1174, 0, 'atto_unorderedlist', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825882),
(1175, 0, 'atto_unorderedlist', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825883),
(1176, 0, 'atto_unorderedlist', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825883),
(1177, 0, 'tinymce_ctrlhelp', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825884),
(1178, 0, 'tinymce_ctrlhelp', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825884),
(1179, 0, 'tinymce_ctrlhelp', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825885),
(1180, 0, 'tinymce_managefiles', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825885),
(1181, 0, 'tinymce_managefiles', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825885),
(1182, 0, 'tinymce_managefiles', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825886),
(1183, 0, 'tinymce_moodleemoticon', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825886),
(1184, 0, 'tinymce_moodleemoticon', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825886),
(1185, 0, 'tinymce_moodleemoticon', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825887),
(1186, 0, 'tinymce_moodleimage', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825887),
(1187, 0, 'tinymce_moodleimage', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825888),
(1188, 0, 'tinymce_moodleimage', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825888),
(1189, 0, 'tinymce_moodlemedia', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825888),
(1190, 0, 'tinymce_moodlemedia', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825889),
(1191, 0, 'tinymce_moodlemedia', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825889),
(1192, 0, 'tinymce_moodlenolink', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825890),
(1193, 0, 'tinymce_moodlenolink', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825890),
(1194, 0, 'tinymce_moodlenolink', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825891),
(1195, 0, 'tinymce_pdw', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825891),
(1196, 0, 'tinymce_pdw', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825891),
(1197, 0, 'tinymce_pdw', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825892),
(1198, 0, 'tinymce_spellchecker', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825892),
(1199, 0, 'tinymce_spellchecker', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825892),
(1200, 0, 'tinymce_spellchecker', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825893),
(1201, 0, 'tinymce_wrap', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825893),
(1202, 0, 'tinymce_wrap', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825894),
(1203, 0, 'tinymce_wrap', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825894),
(1204, 0, 'logstore_database', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825894),
(1205, 0, 'logstore_database', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825895),
(1206, 0, 'logstore_database', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825895),
(1207, 0, 'logstore_legacy', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825895),
(1208, 0, 'logstore_legacy', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825896),
(1209, 0, 'logstore_legacy', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825896),
(1210, 0, 'logstore_standard', NULL, '2021051700', 'Starting plugin installation', NULL, '', 0, 1634825897),
(1211, 0, 'logstore_standard', '2021051700', '2021051700', 'Upgrade savepoint reached', NULL, '', 0, 1634825899),
(1212, 0, 'logstore_standard', '2021051700', '2021051700', 'Plugin installed', NULL, '', 0, 1634825899),
(1213, 0, 'local_skill_list', NULL, '2020090300', 'Starting plugin installation', NULL, '', 2, 1635326683),
(1214, 0, 'local_skill_list', '2020090300', '2020090300', 'Upgrade savepoint reached', NULL, '', 2, 1635326684),
(1215, 0, 'local_skill_list', '2020090300', '2020090300', 'Plugin installed', NULL, '', 2, 1635326686),
(1216, 0, 'block_skill_list', NULL, '2011062800', 'Starting plugin installation', NULL, '', 2, 1635331584),
(1217, 0, 'block_skill_list', '2011062800', '2011062800', 'Upgrade savepoint reached', NULL, '', 2, 1635331585),
(1218, 0, 'block_skill_list', '2011062800', '2011062800', 'Plugin installed', NULL, '', 2, 1635331590),
(1219, 0, 'local_skills', NULL, '2020090300', 'Starting plugin installation', NULL, '', 2, 1635486872),
(1220, 0, 'local_skills', '2020090300', '2020090300', 'Upgrade savepoint reached', NULL, '', 2, 1635486873),
(1221, 0, 'local_skills', '2020090300', '2020090300', 'Plugin installed', NULL, '', 2, 1635486873);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_url`
--

CREATE TABLE `mdl_url` (
  `id` bigint NOT NULL,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `externalurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `display` smallint NOT NULL DEFAULT '0',
  `displayoptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `parameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='each record is one url resource' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user`
--

CREATE TABLE `mdl_user` (
  `id` bigint NOT NULL,
  `auth` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint NOT NULL DEFAULT '0',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `phone1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `institution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `city` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `lang` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint NOT NULL DEFAULT '0',
  `lastaccess` bigint NOT NULL DEFAULT '0',
  `lastlogin` bigint NOT NULL DEFAULT '0',
  `currentlogin` bigint NOT NULL DEFAULT '0',
  `lastip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `secret` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `picture` bigint NOT NULL DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `trustbitmask` bigint NOT NULL DEFAULT '0',
  `imagealt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lastnamephonetic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `firstnamephonetic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `middlename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alternatename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `moodlenetprofile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='One record for each person' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `calendartype`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `lastnamephonetic`, `firstnamephonetic`, `middlename`, `alternatename`, `moodlenetprofile`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '$2y$10$ljtrZ9Og9DCFArMOQbmbHeBSIKPBtQuw./a/42Lav7ks7Xf22qPO6', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, 'This user is a special user that allows read-only access to some courses.', 1, 1, 0, 2, 1, 0, 0, 1634823249, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', '$2y$10$oh39rVGz.wE7bzy1IHic9.gX7lKt6wikA.KfQdiB6Fmbs4j0YMm8u', '', 'WDr', 'SM', 'Test@ldsengineers.com', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 1634826242, 1638343985, 1638343352, 1638343985, '152.57.204.146', '', 0, '', 1, 1, 0, 1, 1, 0, 0, 1634826291, 0, NULL, '', '', '', '', ''),
(3, 'manual', 1, 0, 0, 0, 1, 'studuser1', '$2y$10$3xPn8joMIXbDEVUrtQON3ewq9LZGURrW8VY24MX/GDMINLDh2IF2S', '', 'Student1', 'surname', 'kirandeep@lds-international.in', 0, '', '', '', '', '', 'Noida', 'IN', 'en', 'gregorian', '', '99', 1634988065, 1638343825, 1638290851, 1638343825, '152.57.204.146', '', 13, '<p dir=\"ltr\" style=\"text-align: left;\">loreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsumloreum ipsum</p>', 1, 1, 0, 2, 1, 0, 1634892114, 1634892114, 0, 'Moodle Benefits', '', '', '', '', ''),
(4, 'manual', 1, 0, 0, 0, 1, 'teacheruser1', '$2y$10$lxF.fHJbzZNeyhbZHJoo8OobBDtdSboR.jrlxwTNasaoULZmXMeL6', '', 'teacher1', 'surname', 'vbnmkaur98@rediffmail.com', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 1634986582, 1635406015, 1635231862, 1635406015, '103.138.78.191', '', 0, '', 1, 1, 0, 2, 1, 0, 1634985498, 1634985574, 0, '', '', '', '', '', ''),
(5, 'manual', 1, 0, 0, 0, 1, 'sarojtest', '$2y$10$1QfUJYW.zOol3b47g4BBT.ztpN6qWSWVR1zHtC0zSswnjiHIn/JF2', '', 'saroj', 'test', 'saroj@lds-international.in', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 1, 1, 0, 2, 1, 0, 1635167448, 1635167448, 0, '', '', '', '', '', ''),
(6, 'manual', 1, 0, 1, 0, 1, 'arti@lds-international.in.1635241040', '$2y$10$Ey0xo6uuaUqwEQBiYJyxaO7fqoMu4XsJCvYtkCG012daEXSJzQ5xW', '', 'arti', 'singh', '445365ad804c1afe78ad5a5f3bd1fa83', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 1, 1, 0, 2, 1, 0, 1635235866, 1635241040, 0, '', '', '', '', '', ''),
(7, 'manual', 1, 0, 1, 0, 1, 'arti@lds-international.in.1635247046', '$2y$10$lpXePP/O6l7DsSp4p3zHM.kL9ZpAl9EH4bo20C2gkOQc9bKJAOyf6', '', 'ad', 'sfsdf', 'e2fc714c4727ee9395f324cd2e7f331f', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 1, 1, 0, 2, 1, 0, 1635241057, 1635247046, 0, '', '', '', '', '', ''),
(8, 'manual', 1, 0, 1, 0, 1, 'arti@lds-international.in.1635321256', '$2y$10$mXT/HiR4lPF1N.f2FUTKN.i6wR8CQcVTG0Ge45D.Gg/1hy2/6sbNq', '', 'sads', 'dssf', '098f6bcd4621d373cade4e832627b4f6', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 1635247326, 1635247592, 1635247326, 1635247592, '122.177.77.134', '', 0, '', 1, 1, 0, 2, 1, 0, 1635247098, 1635321256, 0, '', '', '', '', '', ''),
(9, 'manual', 1, 0, 1, 0, 1, 'arti@lds-internaltional.in.1635420968', '$2y$10$cOophZ4MjJEwfJLgzbB8JOekyLN2NLitiFoocrlBgCNscBzhng2DS', '', 'abc', 'xyz', '098f6bcd4621d373cade4e832627b4f6', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 1, 1, 0, 2, 1, 0, 1635321826, 1635420968, 0, '', '', '', '', '', ''),
(10, 'manual', 1, 0, 1, 0, 1, 'artisinghh11@gmail.com.1635420990', '$2y$10$rmZx9VGKMKNNIjyS9ZWNDuK7HaQji/QoYPch/7L1Jgt78yWMthufC', '', 'xyz', 'xyz', 'cc03e747a6afbbcbf8be7668acfebee5', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 1635410491, 1635418970, 0, 1635410491, '175.111.182.34', '', 0, '', 1, 1, 0, 2, 1, 0, 1635400312, 1635420990, 0, '', '', '', '', '', ''),
(11, 'manual', 1, 0, 1, 0, 1, 'a@gmail.com.1635421000', '$2y$10$nPdPRLxz2GaFAMzoKF4TAenTqOznnvQ/wipV6MznrRYVRT.bPmVma', '', 'abcd', 'bgd', '5d9c68c6c50ed3d02a2fcf54f63993b6', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 1, 1, 0, 2, 1, 0, 1635406248, 1635421000, 0, '', '', '', '', '', ''),
(12, 'manual', 1, 0, 1, 0, 1, 'uttam@lds-engineer.com.1635921698', '$2y$10$ofCJL8F7.AjMYH7uv70e.O.4mol8A3/gdyglahChcYjzbmwT7vaw.', '', 'test', 'test', 'cc03e747a6afbbcbf8be7668acfebee5', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 1635422124, 1635426846, 0, 1635422124, '122.177.70.41', '', 0, '', 1, 1, 0, 2, 1, 0, 1635421180, 1635921698, 0, '', '', '', '', '', ''),
(13, 'manual', 1, 0, 0, 0, 1, 'test1234', '$2y$10$sFgNHNW.dPRnS3txIeaKUO.iGWlXGFMX4CbADZpJByKy5QqCJpf72', '', 'abc', 'abc', 'artisinghh111@gmail.com', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 1635831343, 1638342156, 1638249297, 1638334710, '175.111.182.34', '', 0, '', 1, 1, 0, 2, 1, 0, 1635421731, 1635920363, 0, '', '', '', '', '', ''),
(14, 'manual', 1, 0, 0, 0, 1, 'testuser123', '$2y$10$QDB/sqUQPRlDx406/u8yHOGxPDqh1fLjCbPbRpnIvZA9CvD.BA9aC', '', 'test1', 'test2', 'test134@gmail.com', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 1, 1, 0, 2, 1, 0, 1635483680, 1635483680, 0, '', '', '', '', '', ''),
(15, 'manual', 1, 0, 0, 0, 1, 'arti123', '$2y$10$Krh3revigSHutOQwXzfhj.F9tBhFL4hSVTkOOLK420Zii957x6A9q', '', 'arti', 'singh', 'artisinghh111d@gmail.com', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 1, 1, 0, 2, 1, 0, 1635920370, 1635922345, 0, '', '', '', '', '', ''),
(16, 'manual', 1, 0, 0, 0, 1, 'uttam', '$2y$10$LksRMOwrKnc/WsntWj2bWecY4tG.0r20ym3dJ/aDHWLYMEeW23JVq', '', 'uuu', 'ttttt', 'uttam1@ldsengineers.com', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 1, 1, 0, 2, 1, 0, 1635921040, 1635921731, 0, '', '', '', '', '', ''),
(17, 'manual', 1, 0, 0, 0, 1, 'uuu', '$2y$10$Nt6qW0.ki0g1PuG8xtnZZ.uFyeY3hS5jMUZ9XEK9TcrExtwTjJF7S', '', 'uu', 'ttt', 'uttam@ldsengineers.com', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 1, 1, 0, 2, 1, 0, 1635921776, 1635921776, 0, '', '', '', '', '', ''),
(18, 'manual', 1, 0, 0, 0, 1, 'aa123', '$2y$10$YVsukBQSfkFwvtn8fdTTcuPSx3z0NInkSQLqciyt6NNsIcMgFEjHW', '', 'aa', 'ss', 'artisinghh11@gmail.com', 0, '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 1, 1, 0, 2, 1, 0, 1635922605, 1635922605, 0, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_devices`
--

CREATE TABLE `mdl_user_devices` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `appid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `model` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `platform` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `pushid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table stores user''s mobile devices information in order' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_enrolments`
--

CREATE TABLE `mdl_user_enrolments` (
  `id` bigint NOT NULL,
  `status` bigint NOT NULL DEFAULT '0',
  `enrolid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timestart` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '2147483647',
  `modifierid` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Users participating in courses (aka enrolled users) - everyb' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_user_enrolments`
--

INSERT INTO `mdl_user_enrolments` (`id`, `status`, `enrolid`, `userid`, `timestart`, `timeend`, `modifierid`, `timecreated`, `timemodified`) VALUES
(1, 0, 1, 3, 1634985099, 0, 2, 1634985156, 1634985156),
(2, 0, 1, 4, 1634985699, 0, 2, 1634985714, 1634985714),
(8, 0, 7, 13, 1638169933, 0, 13, 1638169933, 1638169933),
(9, 0, 10, 13, 1638169982, 0, 13, 1638169982, 1638169982),
(10, 0, 4, 13, 1638339799, 0, 2, 1638339848, 1638339848);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_category`
--

CREATE TABLE `mdl_user_info_category` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `sortorder` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Customisable fields categories' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_user_info_category`
--

INSERT INTO `mdl_user_info_category` (`id`, `name`, `sortorder`) VALUES
(4, 'Other field', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_data`
--

CREATE TABLE `mdl_user_info_data` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `fieldid` bigint NOT NULL DEFAULT '0',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dataformat` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Data for the customisable user fields' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_field`
--

CREATE TABLE `mdl_user_info_field` (
  `id` bigint NOT NULL,
  `shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'shortname',
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `datatype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  `categoryid` bigint NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL DEFAULT '0',
  `required` tinyint NOT NULL DEFAULT '0',
  `locked` tinyint NOT NULL DEFAULT '0',
  `visible` smallint NOT NULL DEFAULT '0',
  `forceunique` tinyint NOT NULL DEFAULT '0',
  `signup` tinyint NOT NULL DEFAULT '0',
  `defaultdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `defaultdataformat` tinyint NOT NULL DEFAULT '0',
  `param1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `param2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `param3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `param4` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `param5` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Customisable user profile fields' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_lastaccess`
--

CREATE TABLE `mdl_user_lastaccess` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `courseid` bigint NOT NULL DEFAULT '0',
  `timeaccess` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='To keep track of course page access times, used in online pa' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(1, 2, 2, 1634989328),
(2, 2, 3, 1638339828),
(3, 4, 2, 1635147609),
(4, 3, 2, 1635147567),
(5, 2, 4, 1638169885),
(6, 2, 5, 1638169966),
(11, 13, 5, 1638256673),
(12, 13, 4, 1638279407);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_history`
--

CREATE TABLE `mdl_user_password_history` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A rotating log of hashes of previously used passwords for ea' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_resets`
--

CREATE TABLE `mdl_user_password_resets` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timerequested` bigint NOT NULL,
  `timererequested` bigint NOT NULL DEFAULT '0',
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='table tracking password reset confirmation tokens' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_user_password_resets`
--

INSERT INTO `mdl_user_password_resets` (`id`, `userid`, `timerequested`, `timererequested`, `token`) VALUES
(4, 4, 1635029780, 0, 'GNbqQULE7Gx4PxipAabeQcEW7Pe1LXZP'),
(6, 3, 1635167241, 1635167706, 'L9CIho5In8CaG4MTXdnIrACxeOAneKy4'),
(7, 5, 1635167481, 0, 'yX7Jhi1I3tgRFvftytPMLKNipDvs6Wfj'),
(8, 6, 1635236371, 1635236519, '7llHbMO1jJDJ6Xs1cXgRzrCwHICb3Eed'),
(12, 13, 1635919378, 1635919457, '7q2DqFq6KFPU8tid5saNgWoCxSceNOVH'),
(13, 12, 1635919755, 0, 'aUvCZ54QC23uMuO1yoRyoVMnzuz0AKaL'),
(14, 16, 1635921074, 0, 'm8MnOLYsYDH0kFt8jp2cDJW6RDbIxEMz');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_preferences`
--

CREATE TABLE `mdl_user_preferences` (
  `id` bigint NOT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `value` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Allows modules to store arbitrary user preferences' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'core_message_migrate_data', '1'),
(2, 2, 'auth_manual_passwordupdatetime', '1634826292'),
(3, 2, 'email_bounce_count', '1'),
(4, 2, 'email_send_count', '1'),
(5, 2, 'login_failed_count_since_success', '3'),
(6, 2, 'filepicker_recentrepository', '5'),
(7, 2, 'filepicker_recentlicense', 'unknown'),
(8, 3, 'auth_forcepasswordchange', '0'),
(9, 3, 'email_bounce_count', '1'),
(10, 3, 'email_send_count', '1'),
(11, 3, 'core_message_migrate_data', '1'),
(12, 4, 'auth_forcepasswordchange', '0'),
(13, 4, 'email_bounce_count', '1'),
(14, 4, 'email_send_count', '1'),
(15, 4, 'core_message_migrate_data', '1'),
(16, 4, 'drawer-open-nav', 'true'),
(17, 2, 'drawer-open-nav', 'true'),
(18, 5, 'auth_forcepasswordchange', '0'),
(19, 5, 'email_bounce_count', '1'),
(20, 5, 'email_send_count', '2'),
(47, 13, 'auth_forcepasswordchange', '0'),
(48, 13, 'email_bounce_count', '0'),
(49, 13, 'email_send_count', '0'),
(51, 13, 'login_failed_count_since_success', '5'),
(53, 14, 'auth_forcepasswordchange', '0'),
(54, 14, 'email_bounce_count', '1'),
(55, 14, 'email_send_count', '1'),
(56, 13, 'core_message_migrate_data', '1'),
(57, 15, 'auth_forcepasswordchange', '0'),
(58, 15, 'email_bounce_count', '0'),
(59, 15, 'email_send_count', '0'),
(60, 16, 'auth_forcepasswordchange', '0'),
(61, 16, 'email_bounce_count', '0'),
(62, 16, 'email_send_count', '0'),
(63, 17, 'auth_forcepasswordchange', '0'),
(64, 17, 'email_bounce_count', '1'),
(65, 17, 'email_send_count', '1'),
(66, 18, 'auth_forcepasswordchange', '0'),
(67, 18, 'email_bounce_count', '1'),
(68, 18, 'email_send_count', '1'),
(69, 13, 'drawer-open-nav', 'true'),
(70, 2, 'qtype_truefalse_defaultmark', '1'),
(71, 2, 'qtype_truefalse_penalty', '1'),
(72, 13, 'tool_usertours_tour_completion_time_4', '1636190745'),
(73, 13, 'tool_usertours_tour_completion_time_2', '1636192721');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_private_key`
--

CREATE TABLE `mdl_user_private_key` (
  `id` bigint NOT NULL,
  `script` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL,
  `instance` bigint DEFAULT NULL,
  `iprestriction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `validuntil` bigint DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='access keys used in cookieless scripts - rss, etc.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki`
--

CREATE TABLE `mdl_wiki` (
  `id` bigint NOT NULL,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Wiki',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint NOT NULL DEFAULT '0',
  `editend` bigint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores Wiki activity configuration' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_links`
--

CREATE TABLE `mdl_wiki_links` (
  `id` bigint NOT NULL,
  `subwikiid` bigint NOT NULL DEFAULT '0',
  `frompageid` bigint NOT NULL DEFAULT '0',
  `topageid` bigint NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Page wiki links' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_locks`
--

CREATE TABLE `mdl_wiki_locks` (
  `id` bigint NOT NULL,
  `pageid` bigint NOT NULL DEFAULT '0',
  `sectionname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `lockedat` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Manages page locks' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_pages`
--

CREATE TABLE `mdl_wiki_pages` (
  `id` bigint NOT NULL,
  `subwikiid` bigint NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'title',
  `cachedcontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `timerendered` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `pageviews` bigint NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores wiki pages' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_subwikis`
--

CREATE TABLE `mdl_wiki_subwikis` (
  `id` bigint NOT NULL,
  `wikiid` bigint NOT NULL DEFAULT '0',
  `groupid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores subwiki instances' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_synonyms`
--

CREATE TABLE `mdl_wiki_synonyms` (
  `id` bigint NOT NULL,
  `subwikiid` bigint NOT NULL DEFAULT '0',
  `pageid` bigint NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Pagesynonym'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores wiki pages synonyms' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_versions`
--

CREATE TABLE `mdl_wiki_versions` (
  `id` bigint NOT NULL,
  `pageid` bigint NOT NULL DEFAULT '0',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contentformat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'creole',
  `version` mediumint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores wiki page history' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop`
--

CREATE TABLE `mdl_workshop` (
  `id` bigint NOT NULL,
  `course` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `instructauthors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `instructauthorsformat` smallint NOT NULL DEFAULT '0',
  `instructreviewers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `instructreviewersformat` smallint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL,
  `phase` smallint DEFAULT '0',
  `useexamples` tinyint DEFAULT '0',
  `usepeerassessment` tinyint DEFAULT '0',
  `useselfassessment` tinyint DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint DEFAULT '0',
  `submissiontypetext` tinyint(1) NOT NULL DEFAULT '1',
  `submissiontypefile` tinyint(1) NOT NULL DEFAULT '1',
  `nattachments` smallint DEFAULT '1',
  `submissionfiletypes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `latesubmissions` tinyint DEFAULT '0',
  `maxbytes` bigint DEFAULT '100000',
  `examplesmode` smallint DEFAULT '0',
  `submissionstart` bigint DEFAULT '0',
  `submissionend` bigint DEFAULT '0',
  `assessmentstart` bigint DEFAULT '0',
  `assessmentend` bigint DEFAULT '0',
  `phaseswitchassessment` tinyint NOT NULL DEFAULT '0',
  `conclusion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `conclusionformat` smallint NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint DEFAULT '1',
  `overallfeedbackfiles` smallint DEFAULT '0',
  `overallfeedbackfiletypes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `overallfeedbackmaxbytes` bigint DEFAULT '100000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table keeps information about the module instances and ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

CREATE TABLE `mdl_workshopallocation_scheduled` (
  `id` bigint NOT NULL,
  `workshopid` bigint NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '0',
  `submissionend` bigint NOT NULL,
  `timeallocated` bigint DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `resultstatus` bigint DEFAULT NULL,
  `resultmessage` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `resultlog` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores the allocation settings for the scheduled allocator' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

CREATE TABLE `mdl_workshopeval_best_settings` (
  `id` bigint NOT NULL,
  `workshopid` bigint NOT NULL,
  `comparison` smallint DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_accumulative`
--

CREATE TABLE `mdl_workshopform_accumulative` (
  `id` bigint NOT NULL,
  `workshopid` bigint NOT NULL,
  `sort` bigint DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `descriptionformat` smallint DEFAULT '0',
  `grade` bigint NOT NULL,
  `weight` mediumint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The assessment dimensions definitions of Accumulative gradin' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_comments`
--

CREATE TABLE `mdl_workshopform_comments` (
  `id` bigint NOT NULL,
  `workshopid` bigint NOT NULL,
  `sort` bigint DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `descriptionformat` smallint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The assessment dimensions definitions of Comments strategy f' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors`
--

CREATE TABLE `mdl_workshopform_numerrors` (
  `id` bigint NOT NULL,
  `workshopid` bigint NOT NULL,
  `sort` bigint DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `descriptionformat` smallint DEFAULT '0',
  `descriptiontrust` bigint DEFAULT NULL,
  `grade0` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `grade1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `weight` mediumint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The assessment dimensions definitions of Number of errors gr' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

CREATE TABLE `mdl_workshopform_numerrors_map` (
  `id` bigint NOT NULL,
  `workshopid` bigint NOT NULL,
  `nonegative` bigint NOT NULL,
  `grade` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This maps the number of errors to a percentual grade for sub' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric`
--

CREATE TABLE `mdl_workshopform_rubric` (
  `id` bigint NOT NULL,
  `workshopid` bigint NOT NULL,
  `sort` bigint DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `descriptionformat` smallint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The assessment dimensions definitions of Rubric grading stra' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

CREATE TABLE `mdl_workshopform_rubric_config` (
  `id` bigint NOT NULL,
  `workshopid` bigint NOT NULL,
  `layout` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'list'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Configuration table for the Rubric grading strategy' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

CREATE TABLE `mdl_workshopform_rubric_levels` (
  `id` bigint NOT NULL,
  `dimensionid` bigint NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `definitionformat` smallint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The definition of rubric rating scales' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_aggregations`
--

CREATE TABLE `mdl_workshop_aggregations` (
  `id` bigint NOT NULL,
  `workshopid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments`
--

CREATE TABLE `mdl_workshop_assessments` (
  `id` bigint NOT NULL,
  `submissionid` bigint NOT NULL,
  `reviewerid` bigint NOT NULL,
  `weight` bigint NOT NULL DEFAULT '1',
  `timecreated` bigint DEFAULT '0',
  `timemodified` bigint DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint DEFAULT NULL,
  `feedbackauthor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `feedbackauthorformat` smallint DEFAULT '0',
  `feedbackauthorattachment` smallint DEFAULT '0',
  `feedbackreviewer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `feedbackreviewerformat` smallint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Info about the made assessment and automatically calculated ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades`
--

CREATE TABLE `mdl_workshop_grades` (
  `id` bigint NOT NULL,
  `assessmentid` bigint NOT NULL,
  `strategy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `dimensionid` bigint NOT NULL,
  `grade` decimal(10,5) DEFAULT NULL,
  `peercomment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `peercommentformat` smallint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='How the reviewers filled-up the grading forms, given grades ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions`
--

CREATE TABLE `mdl_workshop_submissions` (
  `id` bigint NOT NULL,
  `workshopid` bigint NOT NULL,
  `example` tinyint DEFAULT '0',
  `authorid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `contentformat` smallint NOT NULL DEFAULT '0',
  `contenttrust` smallint NOT NULL DEFAULT '0',
  `attachment` tinyint DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint DEFAULT NULL,
  `feedbackauthor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `feedbackauthorformat` smallint DEFAULT '0',
  `timegraded` bigint DEFAULT NULL,
  `published` tinyint DEFAULT '0',
  `late` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Info about the submission and the aggregation of the grade f' ROW_FORMAT=COMPRESSED;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mdl_mnetservice_enrol_courses`
--
ALTER TABLE `mdl_mnetservice_enrol_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`);

--
-- Indexes for table `mdl_mnetservice_enrol_enrolments`
--
ALTER TABLE `mdl_mnetservice_enrol_enrolments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetenroenro_use_ix` (`userid`),
  ADD KEY `mdl_mnetenroenro_hos_ix` (`hostid`);

--
-- Indexes for table `mdl_mnet_host`
--
ALTER TABLE `mdl_mnet_host`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnethost_app_ix` (`applicationid`);

--
-- Indexes for table `mdl_mnet_host2service`
--
ALTER TABLE `mdl_mnet_host2service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_log`
--
ALTER TABLE `mdl_mnet_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`);

--
-- Indexes for table `mdl_mnet_remote_rpc`
--
ALTER TABLE `mdl_mnet_remote_rpc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_mnet_remote_service2rpc`
--
ALTER TABLE `mdl_mnet_remote_service2rpc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_rpc`
--
ALTER TABLE `mdl_mnet_rpc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`);

--
-- Indexes for table `mdl_mnet_service`
--
ALTER TABLE `mdl_mnet_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_mnet_service2rpc`
--
ALTER TABLE `mdl_mnet_service2rpc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_session`
--
ALTER TABLE `mdl_mnet_session`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`);

--
-- Indexes for table `mdl_mnet_sso_access_control`
--
ALTER TABLE `mdl_mnet_sso_access_control`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`);

--
-- Indexes for table `mdl_modules`
--
ALTER TABLE `mdl_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_modu_nam_ix` (`name`);

--
-- Indexes for table `mdl_my_pages`
--
ALTER TABLE `mdl_my_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mypage_usepri_ix` (`userid`,`private`);

--
-- Indexes for table `mdl_notifications`
--
ALTER TABLE `mdl_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_noti_use_ix` (`useridfrom`),
  ADD KEY `mdl_noti_use2_ix` (`useridto`);

--
-- Indexes for table `mdl_oauth2_access_token`
--
ALTER TABLE `mdl_oauth2_access_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_oautaccetoke_iss_uix` (`issuerid`);

--
-- Indexes for table `mdl_oauth2_endpoint`
--
ALTER TABLE `mdl_oauth2_endpoint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_oautendp_iss_ix` (`issuerid`);

--
-- Indexes for table `mdl_oauth2_issuer`
--
ALTER TABLE `mdl_oauth2_issuer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_oauth2_refresh_token`
--
ALTER TABLE `mdl_oauth2_refresh_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_oautrefrtoke_useisssco_uix` (`userid`,`issuerid`,`scopehash`),
  ADD KEY `mdl_oautrefrtoke_iss_ix` (`issuerid`),
  ADD KEY `mdl_oautrefrtoke_use_ix` (`userid`);

--
-- Indexes for table `mdl_oauth2_system_account`
--
ALTER TABLE `mdl_oauth2_system_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_oautsystacco_iss_uix` (`issuerid`);

--
-- Indexes for table `mdl_oauth2_user_field_mapping`
--
ALTER TABLE `mdl_oauth2_user_field_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_oautuserfielmapp_issin_uix` (`issuerid`,`internalfield`),
  ADD KEY `mdl_oautuserfielmapp_iss_ix` (`issuerid`);

--
-- Indexes for table `mdl_page`
--
ALTER TABLE `mdl_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_page_cou_ix` (`course`);

--
-- Indexes for table `mdl_paygw_paypal`
--
ALTER TABLE `mdl_paygw_paypal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_paygpayp_pay_uix` (`paymentid`);

--
-- Indexes for table `mdl_payments`
--
ALTER TABLE `mdl_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_paym_gat_ix` (`gateway`),
  ADD KEY `mdl_paym_compayite_ix` (`component`,`paymentarea`,`itemid`),
  ADD KEY `mdl_paym_use_ix` (`userid`),
  ADD KEY `mdl_paym_acc_ix` (`accountid`);

--
-- Indexes for table `mdl_payment_accounts`
--
ALTER TABLE `mdl_payment_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_payment_gateways`
--
ALTER TABLE `mdl_payment_gateways`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_paymgate_acc_ix` (`accountid`);

--
-- Indexes for table `mdl_portfolio_instance`
--
ALTER TABLE `mdl_portfolio_instance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_portfolio_instance_config`
--
ALTER TABLE `mdl_portfolio_instance_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portinstconf_nam_ix` (`name`),
  ADD KEY `mdl_portinstconf_ins_ix` (`instance`);

--
-- Indexes for table `mdl_portfolio_instance_user`
--
ALTER TABLE `mdl_portfolio_instance_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portinstuser_ins_ix` (`instance`),
  ADD KEY `mdl_portinstuser_use_ix` (`userid`);

--
-- Indexes for table `mdl_portfolio_log`
--
ALTER TABLE `mdl_portfolio_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portlog_use_ix` (`userid`),
  ADD KEY `mdl_portlog_por_ix` (`portfolio`);

--
-- Indexes for table `mdl_portfolio_mahara_queue`
--
ALTER TABLE `mdl_portfolio_mahara_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portmahaqueu_tok_ix` (`token`),
  ADD KEY `mdl_portmahaqueu_tra_ix` (`transferid`);

--
-- Indexes for table `mdl_portfolio_tempdata`
--
ALTER TABLE `mdl_portfolio_tempdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_porttemp_use_ix` (`userid`),
  ADD KEY `mdl_porttemp_ins_ix` (`instance`);

--
-- Indexes for table `mdl_post`
--
ALTER TABLE `mdl_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  ADD KEY `mdl_post_las_ix` (`lastmodified`),
  ADD KEY `mdl_post_mod_ix` (`module`),
  ADD KEY `mdl_post_sub_ix` (`subject`),
  ADD KEY `mdl_post_use_ix` (`usermodified`);

--
-- Indexes for table `mdl_proficiency_level`
--
ALTER TABLE `mdl_proficiency_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_profiling`
--
ALTER TABLE `mdl_profiling`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  ADD KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  ADD KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`);

--
-- Indexes for table `mdl_qtype_ddimageortext`
--
ALTER TABLE `mdl_qtype_ddimageortext`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddim_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddimageortext_drags`
--
ALTER TABLE `mdl_qtype_ddimageortext_drags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddimdrag_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddimageortext_drops`
--
ALTER TABLE `mdl_qtype_ddimageortext_drops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddimdrop_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddmarker`
--
ALTER TABLE `mdl_qtype_ddmarker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddma_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddmarker_drags`
--
ALTER TABLE `mdl_qtype_ddmarker_drags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddmadrag_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddmarker_drops`
--
ALTER TABLE `mdl_qtype_ddmarker_drops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddmadrop_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_essay_options`
--
ALTER TABLE `mdl_qtype_essay_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_match_options`
--
ALTER TABLE `mdl_qtype_match_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_match_subquestions`
--
ALTER TABLE `mdl_qtype_match_subquestions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypmatcsubq_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_multichoice_options`
--
ALTER TABLE `mdl_qtype_multichoice_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_randomsamatch_options`
--
ALTER TABLE `mdl_qtype_randomsamatch_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_shortanswer_options`
--
ALTER TABLE `mdl_qtype_shortanswer_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_question`
--
ALTER TABLE `mdl_question`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_ques_catidn_uix` (`category`,`idnumber`),
  ADD KEY `mdl_ques_qty_ix` (`qtype`),
  ADD KEY `mdl_ques_cat_ix` (`category`),
  ADD KEY `mdl_ques_par_ix` (`parent`),
  ADD KEY `mdl_ques_cre_ix` (`createdby`),
  ADD KEY `mdl_ques_mod_ix` (`modifiedby`);

--
-- Indexes for table `mdl_question_answers`
--
ALTER TABLE `mdl_question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesansw_que_ix` (`question`);

--
-- Indexes for table `mdl_question_attempts`
--
ALTER TABLE `mdl_question_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  ADD KEY `mdl_quesatte_beh_ix` (`behaviour`),
  ADD KEY `mdl_quesatte_que_ix` (`questionid`),
  ADD KEY `mdl_quesatte_que2_ix` (`questionusageid`);

--
-- Indexes for table `mdl_question_attempt_steps`
--
ALTER TABLE `mdl_question_attempt_steps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  ADD KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  ADD KEY `mdl_quesattestep_use_ix` (`userid`);

--
-- Indexes for table `mdl_question_attempt_step_data`
--
ALTER TABLE `mdl_question_attempt_step_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`);

--
-- Indexes for table `mdl_question_calculated`
--
ALTER TABLE `mdl_question_calculated`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quescalc_ans_ix` (`answer`),
  ADD KEY `mdl_quescalc_que_ix` (`question`);

--
-- Indexes for table `mdl_question_calculated_options`
--
ALTER TABLE `mdl_question_calculated_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quescalcopti_que_ix` (`question`);

--
-- Indexes for table `mdl_question_categories`
--
ALTER TABLE `mdl_question_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quescate_consta_uix` (`contextid`,`stamp`),
  ADD UNIQUE KEY `mdl_quescate_conidn_uix` (`contextid`,`idnumber`),
  ADD KEY `mdl_quescate_con_ix` (`contextid`),
  ADD KEY `mdl_quescate_par_ix` (`parent`);

--
-- Indexes for table `mdl_question_datasets`
--
ALTER TABLE `mdl_question_datasets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  ADD KEY `mdl_quesdata_que_ix` (`question`),
  ADD KEY `mdl_quesdata_dat_ix` (`datasetdefinition`);

--
-- Indexes for table `mdl_question_dataset_definitions`
--
ALTER TABLE `mdl_question_dataset_definitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesdatadefi_cat_ix` (`category`);

--
-- Indexes for table `mdl_question_dataset_items`
--
ALTER TABLE `mdl_question_dataset_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesdataitem_def_ix` (`definition`);

--
-- Indexes for table `mdl_question_ddwtos`
--
ALTER TABLE `mdl_question_ddwtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesddwt_que_ix` (`questionid`);

--
-- Indexes for table `mdl_question_gapselect`
--
ALTER TABLE `mdl_question_gapselect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesgaps_que_ix` (`questionid`);

--
-- Indexes for table `mdl_question_hints`
--
ALTER TABLE `mdl_question_hints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_queshint_que_ix` (`questionid`);

--
-- Indexes for table `mdl_question_multianswer`
--
ALTER TABLE `mdl_question_multianswer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesmult_que_ix` (`question`);

--
-- Indexes for table `mdl_question_numerical`
--
ALTER TABLE `mdl_question_numerical`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesnume_ans_ix` (`answer`),
  ADD KEY `mdl_quesnume_que_ix` (`question`);

--
-- Indexes for table `mdl_question_numerical_options`
--
ALTER TABLE `mdl_question_numerical_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesnumeopti_que_ix` (`question`);

--
-- Indexes for table `mdl_question_numerical_units`
--
ALTER TABLE `mdl_question_numerical_units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  ADD KEY `mdl_quesnumeunit_que_ix` (`question`);

--
-- Indexes for table `mdl_question_response_analysis`
--
ALTER TABLE `mdl_question_response_analysis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_question_response_count`
--
ALTER TABLE `mdl_question_response_count`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesrespcoun_ana_ix` (`analysisid`);

--
-- Indexes for table `mdl_question_statistics`
--
ALTER TABLE `mdl_question_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_question_truefalse`
--
ALTER TABLE `mdl_question_truefalse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_questrue_que_ix` (`question`);

--
-- Indexes for table `mdl_question_usages`
--
ALTER TABLE `mdl_question_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesusag_con_ix` (`contextid`);

--
-- Indexes for table `mdl_quiz`
--
ALTER TABLE `mdl_quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quiz_cou_ix` (`course`);

--
-- Indexes for table `mdl_quizaccess_seb_quizsettings`
--
ALTER TABLE `mdl_quizaccess_seb_quizsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quizsebquiz_qui_uix` (`quizid`),
  ADD UNIQUE KEY `mdl_quizsebquiz_cmi_uix` (`cmid`),
  ADD KEY `mdl_quizsebquiz_tem_ix` (`templateid`),
  ADD KEY `mdl_quizsebquiz_use_ix` (`usermodified`);

--
-- Indexes for table `mdl_quizaccess_seb_template`
--
ALTER TABLE `mdl_quizaccess_seb_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizsebtemp_use_ix` (`usermodified`);

--
-- Indexes for table `mdl_quiz_attempts`
--
ALTER TABLE `mdl_quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  ADD UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  ADD KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  ADD KEY `mdl_quizatte_qui_ix` (`quiz`),
  ADD KEY `mdl_quizatte_use_ix` (`userid`);

--
-- Indexes for table `mdl_quiz_feedback`
--
ALTER TABLE `mdl_quiz_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizfeed_qui_ix` (`quizid`);

--
-- Indexes for table `mdl_quiz_grades`
--
ALTER TABLE `mdl_quiz_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizgrad_use_ix` (`userid`),
  ADD KEY `mdl_quizgrad_qui_ix` (`quiz`);

--
-- Indexes for table `mdl_quiz_marks`
--
ALTER TABLE `mdl_quiz_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_quiz_overrides`
--
ALTER TABLE `mdl_quiz_overrides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizover_qui_ix` (`quiz`),
  ADD KEY `mdl_quizover_gro_ix` (`groupid`),
  ADD KEY `mdl_quizover_use_ix` (`userid`);

--
-- Indexes for table `mdl_quiz_overview_regrades`
--
ALTER TABLE `mdl_quiz_overview_regrades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizoverregr_queslo_ix` (`questionusageid`,`slot`);

--
-- Indexes for table `mdl_quiz_reports`
--
ALTER TABLE `mdl_quiz_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`);

--
-- Indexes for table `mdl_quiz_sections`
--
ALTER TABLE `mdl_quiz_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quizsect_quifir_uix` (`quizid`,`firstslot`),
  ADD KEY `mdl_quizsect_qui_ix` (`quizid`);

--
-- Indexes for table `mdl_quiz_slots`
--
ALTER TABLE `mdl_quiz_slots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quizslot_quislo_uix` (`quizid`,`slot`),
  ADD KEY `mdl_quizslot_qui_ix` (`quizid`),
  ADD KEY `mdl_quizslot_que_ix` (`questionid`),
  ADD KEY `mdl_quizslot_que2_ix` (`questioncategoryid`);

--
-- Indexes for table `mdl_quiz_slot_tags`
--
ALTER TABLE `mdl_quiz_slot_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizslottags_slo_ix` (`slotid`),
  ADD KEY `mdl_quizslottags_tag_ix` (`tagid`);

--
-- Indexes for table `mdl_quiz_statistics`
--
ALTER TABLE `mdl_quiz_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_rating`
--
ALTER TABLE `mdl_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  ADD KEY `mdl_rati_con_ix` (`contextid`),
  ADD KEY `mdl_rati_use_ix` (`userid`);

--
-- Indexes for table `mdl_registration_hubs`
--
ALTER TABLE `mdl_registration_hubs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_repository`
--
ALTER TABLE `mdl_repository`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_repository_instances`
--
ALTER TABLE `mdl_repository_instances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_repository_instance_config`
--
ALTER TABLE `mdl_repository_instance_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_repository_onedrive_access`
--
ALTER TABLE `mdl_repository_onedrive_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_repoonedacce_use_ix` (`usermodified`);

--
-- Indexes for table `mdl_resource`
--
ALTER TABLE `mdl_resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_reso_cou_ix` (`course`);

--
-- Indexes for table `mdl_resource_old`
--
ALTER TABLE `mdl_resource_old`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  ADD KEY `mdl_resoold_cmi_ix` (`cmid`);

--
-- Indexes for table `mdl_role`
--
ALTER TABLE `mdl_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  ADD UNIQUE KEY `mdl_role_sho_uix` (`shortname`);

--
-- Indexes for table `mdl_role_allow_assign`
--
ALTER TABLE `mdl_role_allow_assign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  ADD KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  ADD KEY `mdl_rolealloassi_all_ix` (`allowassign`);

--
-- Indexes for table `mdl_role_allow_override`
--
ALTER TABLE `mdl_role_allow_override`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  ADD KEY `mdl_rolealloover_rol_ix` (`roleid`),
  ADD KEY `mdl_rolealloover_all_ix` (`allowoverride`);

--
-- Indexes for table `mdl_role_allow_switch`
--
ALTER TABLE `mdl_role_allow_switch`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  ADD KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  ADD KEY `mdl_rolealloswit_all_ix` (`allowswitch`);

--
-- Indexes for table `mdl_role_allow_view`
--
ALTER TABLE `mdl_role_allow_view`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolealloview_rolall_uix` (`roleid`,`allowview`),
  ADD KEY `mdl_rolealloview_rol_ix` (`roleid`),
  ADD KEY `mdl_rolealloview_all_ix` (`allowview`);

--
-- Indexes for table `mdl_role_assignments`
--
ALTER TABLE `mdl_role_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_roleassi_sor_ix` (`sortorder`),
  ADD KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  ADD KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  ADD KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  ADD KEY `mdl_roleassi_rol_ix` (`roleid`),
  ADD KEY `mdl_roleassi_con_ix` (`contextid`),
  ADD KEY `mdl_roleassi_use_ix` (`userid`);

--
-- Indexes for table `mdl_role_capabilities`
--
ALTER TABLE `mdl_role_capabilities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  ADD KEY `mdl_rolecapa_rol_ix` (`roleid`),
  ADD KEY `mdl_rolecapa_con_ix` (`contextid`),
  ADD KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  ADD KEY `mdl_rolecapa_cap_ix` (`capability`);

--
-- Indexes for table `mdl_role_context_levels`
--
ALTER TABLE `mdl_role_context_levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  ADD KEY `mdl_rolecontleve_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_role_names`
--
ALTER TABLE `mdl_role_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  ADD KEY `mdl_rolename_rol_ix` (`roleid`),
  ADD KEY `mdl_rolename_con_ix` (`contextid`);

--
-- Indexes for table `mdl_scale`
--
ALTER TABLE `mdl_scale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scal_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_scale_history`
--
ALTER TABLE `mdl_scale_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scalhist_act_ix` (`action`),
  ADD KEY `mdl_scalhist_tim_ix` (`timemodified`),
  ADD KEY `mdl_scalhist_old_ix` (`oldid`),
  ADD KEY `mdl_scalhist_cou_ix` (`courseid`),
  ADD KEY `mdl_scalhist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_scorm`
--
ALTER TABLE `mdl_scorm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scor_cou_ix` (`course`);

--
-- Indexes for table `mdl_scorm_aicc_session`
--
ALTER TABLE `mdl_scorm_aicc_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  ADD KEY `mdl_scoraiccsess_use_ix` (`userid`);

--
-- Indexes for table `mdl_scorm_scoes`
--
ALTER TABLE `mdl_scorm_scoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scorscoe_sco_ix` (`scorm`);

--
-- Indexes for table `mdl_scorm_scoes_data`
--
ALTER TABLE `mdl_scorm_scoes_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scorscoedata_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_scoes_track`
--
ALTER TABLE `mdl_scorm_scoes_track`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  ADD KEY `mdl_scorscoetrac_use_ix` (`userid`),
  ADD KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  ADD KEY `mdl_scorscoetrac_sco2_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_seq_mapinfo`
--
ALTER TABLE `mdl_scorm_seq_mapinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  ADD KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  ADD KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`);

--
-- Indexes for table `mdl_scorm_seq_objective`
--
ALTER TABLE `mdl_scorm_seq_objective`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  ADD KEY `mdl_scorseqobje_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_seq_rolluprule`
--
ALTER TABLE `mdl_scorm_seq_rolluprule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  ADD KEY `mdl_scorseqroll_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_seq_rolluprulecond`
--
ALTER TABLE `mdl_scorm_seq_rolluprulecond`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  ADD KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  ADD KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`);

--
-- Indexes for table `mdl_scorm_seq_rulecond`
--
ALTER TABLE `mdl_scorm_seq_rulecond`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  ADD KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  ADD KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`);

--
-- Indexes for table `mdl_scorm_seq_ruleconds`
--
ALTER TABLE `mdl_scorm_seq_ruleconds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  ADD KEY `mdl_scorseqrule_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_search_index_requests`
--
ALTER TABLE `mdl_search_index_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_searinderequ_indtim_ix` (`indexpriority`,`timerequested`),
  ADD KEY `mdl_searinderequ_con_ix` (`contextid`);

--
-- Indexes for table `mdl_search_simpledb_index`
--
ALTER TABLE `mdl_search_simpledb_index`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_searsimpinde_doc_uix` (`docid`),
  ADD KEY `mdl_searsimpinde_owncon_ix` (`owneruserid`,`contextid`);

--
-- Indexes for table `mdl_sessions`
--
ALTER TABLE `mdl_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  ADD KEY `mdl_sess_sta_ix` (`state`),
  ADD KEY `mdl_sess_tim_ix` (`timecreated`),
  ADD KEY `mdl_sess_tim2_ix` (`timemodified`),
  ADD KEY `mdl_sess_use_ix` (`userid`);

--
-- Indexes for table `mdl_skill`
--
ALTER TABLE `mdl_skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_skill_proficiency_level`
--
ALTER TABLE `mdl_skill_proficiency_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_skill_quiz_mapping`
--
ALTER TABLE `mdl_skill_quiz_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_skill_weightage`
--
ALTER TABLE `mdl_skill_weightage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_skill_weightage_meta`
--
ALTER TABLE `mdl_skill_weightage_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_stats_daily`
--
ALTER TABLE `mdl_stats_daily`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statdail_cou_ix` (`courseid`),
  ADD KEY `mdl_statdail_tim_ix` (`timeend`),
  ADD KEY `mdl_statdail_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_stats_monthly`
--
ALTER TABLE `mdl_stats_monthly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statmont_cou_ix` (`courseid`),
  ADD KEY `mdl_statmont_tim_ix` (`timeend`),
  ADD KEY `mdl_statmont_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_stats_user_daily`
--
ALTER TABLE `mdl_stats_user_daily`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statuserdail_cou_ix` (`courseid`),
  ADD KEY `mdl_statuserdail_use_ix` (`userid`),
  ADD KEY `mdl_statuserdail_rol_ix` (`roleid`),
  ADD KEY `mdl_statuserdail_tim_ix` (`timeend`);

--
-- Indexes for table `mdl_stats_user_monthly`
--
ALTER TABLE `mdl_stats_user_monthly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statusermont_cou_ix` (`courseid`),
  ADD KEY `mdl_statusermont_use_ix` (`userid`),
  ADD KEY `mdl_statusermont_rol_ix` (`roleid`),
  ADD KEY `mdl_statusermont_tim_ix` (`timeend`);

--
-- Indexes for table `mdl_stats_user_weekly`
--
ALTER TABLE `mdl_stats_user_weekly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statuserweek_cou_ix` (`courseid`),
  ADD KEY `mdl_statuserweek_use_ix` (`userid`),
  ADD KEY `mdl_statuserweek_rol_ix` (`roleid`),
  ADD KEY `mdl_statuserweek_tim_ix` (`timeend`);

--
-- Indexes for table `mdl_stats_weekly`
--
ALTER TABLE `mdl_stats_weekly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statweek_cou_ix` (`courseid`),
  ADD KEY `mdl_statweek_tim_ix` (`timeend`),
  ADD KEY `mdl_statweek_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_sub_skill`
--
ALTER TABLE `mdl_sub_skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_survey`
--
ALTER TABLE `mdl_survey`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_surv_cou_ix` (`course`);

--
-- Indexes for table `mdl_survey_analysis`
--
ALTER TABLE `mdl_survey_analysis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_survanal_use_ix` (`userid`),
  ADD KEY `mdl_survanal_sur_ix` (`survey`);

--
-- Indexes for table `mdl_survey_answers`
--
ALTER TABLE `mdl_survey_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_survansw_use_ix` (`userid`),
  ADD KEY `mdl_survansw_sur_ix` (`survey`),
  ADD KEY `mdl_survansw_que_ix` (`question`);

--
-- Indexes for table `mdl_survey_questions`
--
ALTER TABLE `mdl_survey_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_tag`
--
ALTER TABLE `mdl_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_tag_tagnam_uix` (`tagcollid`,`name`),
  ADD KEY `mdl_tag_tagiss_ix` (`tagcollid`,`isstandard`),
  ADD KEY `mdl_tag_use_ix` (`userid`),
  ADD KEY `mdl_tag_tag_ix` (`tagcollid`);

--
-- Indexes for table `mdl_tag_area`
--
ALTER TABLE `mdl_tag_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_tagarea_comite_uix` (`component`,`itemtype`),
  ADD KEY `mdl_tagarea_tag_ix` (`tagcollid`);

--
-- Indexes for table `mdl_tag_coll`
--
ALTER TABLE `mdl_tag_coll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_tag_correlation`
--
ALTER TABLE `mdl_tag_correlation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_tagcorr_tag_ix` (`tagid`);

--
-- Indexes for table `mdl_tag_instance`
--
ALTER TABLE `mdl_tag_instance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_taginst_comiteiteconti_uix` (`component`,`itemtype`,`itemid`,`contextid`,`tiuserid`,`tagid`),
  ADD KEY `mdl_taginst_itecomtagcon_ix` (`itemtype`,`component`,`tagid`,`contextid`),
  ADD KEY `mdl_taginst_tag_ix` (`tagid`),
  ADD KEY `mdl_taginst_con_ix` (`contextid`);

--
-- Indexes for table `mdl_task_adhoc`
--
ALTER TABLE `mdl_task_adhoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_taskadho_nex_ix` (`nextruntime`),
  ADD KEY `mdl_taskadho_use_ix` (`userid`);

--
-- Indexes for table `mdl_task_log`
--
ALTER TABLE `mdl_task_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_tasklog_cla_ix` (`classname`),
  ADD KEY `mdl_tasklog_tim_ix` (`timestart`);

--
-- Indexes for table `mdl_task_scheduled`
--
ALTER TABLE `mdl_task_scheduled`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_tasksche_cla_uix` (`classname`);

--
-- Indexes for table `mdl_tool_brickfield_areas`
--
ALTER TABLE `mdl_tool_brickfield_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolbricarea_coucmi_ix` (`courseid`,`cmid`),
  ADD KEY `mdl_toolbricarea_typtabitef_ix` (`type`,`tablename`,`itemid`,`fieldorarea`),
  ADD KEY `mdl_toolbricarea_typconcomf_ix` (`type`,`contextid`,`component`,`fieldorarea`,`itemid`),
  ADD KEY `mdl_toolbricarea_refreftyp_ix` (`reftable`,`refid`,`type`),
  ADD KEY `mdl_toolbricarea_cou_ix` (`courseid`),
  ADD KEY `mdl_toolbricarea_cmi_ix` (`cmid`),
  ADD KEY `mdl_toolbricarea_cat_ix` (`categoryid`),
  ADD KEY `mdl_toolbricarea_con_ix` (`contextid`);

--
-- Indexes for table `mdl_tool_brickfield_cache_acts`
--
ALTER TABLE `mdl_tool_brickfield_cache_acts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolbriccachacts_sta_ix` (`status`),
  ADD KEY `mdl_toolbriccachacts_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_tool_brickfield_cache_check`
--
ALTER TABLE `mdl_tool_brickfield_cache_check`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolbriccachchec_sta_ix` (`status`),
  ADD KEY `mdl_toolbriccachchec_err_ix` (`errorcount`),
  ADD KEY `mdl_toolbriccachchec_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_tool_brickfield_checks`
--
ALTER TABLE `mdl_tool_brickfield_checks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolbricchec_che_ix` (`checktype`),
  ADD KEY `mdl_toolbricchec_che2_ix` (`checkgroup`),
  ADD KEY `mdl_toolbricchec_sta_ix` (`status`);

--
-- Indexes for table `mdl_tool_brickfield_content`
--
ALTER TABLE `mdl_tool_brickfield_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolbriccont_sta_ix` (`status`),
  ADD KEY `mdl_toolbriccont_iscare_ix` (`iscurrent`,`areaid`),
  ADD KEY `mdl_toolbriccont_are_ix` (`areaid`);

--
-- Indexes for table `mdl_tool_brickfield_errors`
--
ALTER TABLE `mdl_tool_brickfield_errors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolbricerro_res_ix` (`resultid`);

--
-- Indexes for table `mdl_tool_brickfield_process`
--
ALTER TABLE `mdl_tool_brickfield_process`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolbricproc_tim_ix` (`timecompleted`);

--
-- Indexes for table `mdl_tool_brickfield_results`
--
ALTER TABLE `mdl_tool_brickfield_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolbricresu_conche_ix` (`contentid`,`checkid`),
  ADD KEY `mdl_toolbricresu_con_ix` (`contentid`),
  ADD KEY `mdl_toolbricresu_che_ix` (`checkid`);

--
-- Indexes for table `mdl_tool_brickfield_schedule`
--
ALTER TABLE `mdl_tool_brickfield_schedule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_toolbricsche_conins_uix` (`contextlevel`,`instanceid`),
  ADD KEY `mdl_toolbricsche_sta_ix` (`status`);

--
-- Indexes for table `mdl_tool_brickfield_summary`
--
ALTER TABLE `mdl_tool_brickfield_summary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolbricsumm_sta_ix` (`status`),
  ADD KEY `mdl_toolbricsumm_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_tool_cohortroles`
--
ALTER TABLE `mdl_tool_cohortroles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_toolcoho_cohroluse_uix` (`cohortid`,`roleid`,`userid`);

--
-- Indexes for table `mdl_tool_customlang`
--
ALTER TABLE `mdl_tool_customlang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  ADD KEY `mdl_toolcust_com_ix` (`componentid`);

--
-- Indexes for table `mdl_tool_customlang_components`
--
ALTER TABLE `mdl_tool_customlang_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_tool_dataprivacy_category`
--
ALTER TABLE `mdl_tool_dataprivacy_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_tool_dataprivacy_ctxexpired`
--
ALTER TABLE `mdl_tool_dataprivacy_ctxexpired`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_tooldatactxe_con_uix` (`contextid`);

--
-- Indexes for table `mdl_tool_dataprivacy_ctxinstance`
--
ALTER TABLE `mdl_tool_dataprivacy_ctxinstance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_tooldatactxi_con_uix` (`contextid`),
  ADD KEY `mdl_tooldatactxi_pur_ix` (`purposeid`),
  ADD KEY `mdl_tooldatactxi_cat_ix` (`categoryid`);

--
-- Indexes for table `mdl_tool_dataprivacy_ctxlevel`
--
ALTER TABLE `mdl_tool_dataprivacy_ctxlevel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_tooldatactxl_con_uix` (`contextlevel`),
  ADD KEY `mdl_tooldatactxl_cat_ix` (`categoryid`),
  ADD KEY `mdl_tooldatactxl_pur_ix` (`purposeid`);

--
-- Indexes for table `mdl_tool_dataprivacy_purpose`
--
ALTER TABLE `mdl_tool_dataprivacy_purpose`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_tool_dataprivacy_purposerole`
--
ALTER TABLE `mdl_tool_dataprivacy_purposerole`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_tooldatapurp_purrol_uix` (`purposeid`,`roleid`),
  ADD KEY `mdl_tooldatapurp_pur_ix` (`purposeid`),
  ADD KEY `mdl_tooldatapurp_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_tool_dataprivacy_request`
--
ALTER TABLE `mdl_tool_dataprivacy_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_tooldatarequ_use_ix` (`userid`),
  ADD KEY `mdl_tooldatarequ_req_ix` (`requestedby`),
  ADD KEY `mdl_tooldatarequ_dpo_ix` (`dpo`),
  ADD KEY `mdl_tooldatarequ_use2_ix` (`usermodified`);

--
-- Indexes for table `mdl_tool_monitor_events`
--
ALTER TABLE `mdl_tool_monitor_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_tool_monitor_history`
--
ALTER TABLE `mdl_tool_monitor_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_toolmonihist_sidusetim_uix` (`sid`,`userid`,`timesent`),
  ADD KEY `mdl_toolmonihist_sid_ix` (`sid`);

--
-- Indexes for table `mdl_tool_monitor_rules`
--
ALTER TABLE `mdl_tool_monitor_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolmonirule_couuse_ix` (`courseid`,`userid`),
  ADD KEY `mdl_toolmonirule_eve_ix` (`eventname`);

--
-- Indexes for table `mdl_tool_monitor_subscriptions`
--
ALTER TABLE `mdl_tool_monitor_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolmonisubs_couuse_ix` (`courseid`,`userid`),
  ADD KEY `mdl_toolmonisubs_rul_ix` (`ruleid`);

--
-- Indexes for table `mdl_tool_policy`
--
ALTER TABLE `mdl_tool_policy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolpoli_cur_ix` (`currentversionid`);

--
-- Indexes for table `mdl_tool_policy_acceptances`
--
ALTER TABLE `mdl_tool_policy_acceptances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_toolpoliacce_poluse_uix` (`policyversionid`,`userid`),
  ADD KEY `mdl_toolpoliacce_pol_ix` (`policyversionid`),
  ADD KEY `mdl_toolpoliacce_use_ix` (`userid`),
  ADD KEY `mdl_toolpoliacce_use2_ix` (`usermodified`);

--
-- Indexes for table `mdl_tool_policy_versions`
--
ALTER TABLE `mdl_tool_policy_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolpolivers_use_ix` (`usermodified`),
  ADD KEY `mdl_toolpolivers_pol_ix` (`policyid`);

--
-- Indexes for table `mdl_tool_recyclebin_category`
--
ALTER TABLE `mdl_tool_recyclebin_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolrecycate_tim_ix` (`timecreated`),
  ADD KEY `mdl_toolrecycate_cat_ix` (`categoryid`);

--
-- Indexes for table `mdl_tool_recyclebin_course`
--
ALTER TABLE `mdl_tool_recyclebin_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_toolrecycour_tim_ix` (`timecreated`),
  ADD KEY `mdl_toolrecycour_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_tool_usertours_steps`
--
ALTER TABLE `mdl_tool_usertours_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_tooluserstep_tousor_ix` (`tourid`,`sortorder`),
  ADD KEY `mdl_tooluserstep_tou_ix` (`tourid`);

--
-- Indexes for table `mdl_tool_usertours_tours`
--
ALTER TABLE `mdl_tool_usertours_tours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_upgrade_log`
--
ALTER TABLE `mdl_upgrade_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  ADD KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  ADD KEY `mdl_upgrlog_use_ix` (`userid`);

--
-- Indexes for table `mdl_url`
--
ALTER TABLE `mdl_url`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_url_cou_ix` (`course`);

--
-- Indexes for table `mdl_user`
--
ALTER TABLE `mdl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  ADD KEY `mdl_user_del_ix` (`deleted`),
  ADD KEY `mdl_user_con_ix` (`confirmed`),
  ADD KEY `mdl_user_fir_ix` (`firstname`),
  ADD KEY `mdl_user_las_ix` (`lastname`),
  ADD KEY `mdl_user_cit_ix` (`city`),
  ADD KEY `mdl_user_cou_ix` (`country`),
  ADD KEY `mdl_user_las2_ix` (`lastaccess`),
  ADD KEY `mdl_user_ema_ix` (`email`),
  ADD KEY `mdl_user_aut_ix` (`auth`),
  ADD KEY `mdl_user_idn_ix` (`idnumber`),
  ADD KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  ADD KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  ADD KEY `mdl_user_mid_ix` (`middlename`),
  ADD KEY `mdl_user_alt_ix` (`alternatename`);

--
-- Indexes for table `mdl_user_devices`
--
ALTER TABLE `mdl_user_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  ADD KEY `mdl_userdevi_uuiuse_ix` (`uuid`,`userid`),
  ADD KEY `mdl_userdevi_use_ix` (`userid`);

--
-- Indexes for table `mdl_user_enrolments`
--
ALTER TABLE `mdl_user_enrolments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  ADD KEY `mdl_userenro_enr_ix` (`enrolid`),
  ADD KEY `mdl_userenro_use_ix` (`userid`),
  ADD KEY `mdl_userenro_mod_ix` (`modifierid`);

--
-- Indexes for table `mdl_user_info_category`
--
ALTER TABLE `mdl_user_info_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_user_info_data`
--
ALTER TABLE `mdl_user_info_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userinfodata_usefie_uix` (`userid`,`fieldid`);

--
-- Indexes for table `mdl_user_info_field`
--
ALTER TABLE `mdl_user_info_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_user_lastaccess`
--
ALTER TABLE `mdl_user_lastaccess`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  ADD KEY `mdl_userlast_use_ix` (`userid`),
  ADD KEY `mdl_userlast_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_user_password_history`
--
ALTER TABLE `mdl_user_password_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_userpasshist_use_ix` (`userid`);

--
-- Indexes for table `mdl_user_password_resets`
--
ALTER TABLE `mdl_user_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_userpassrese_use_ix` (`userid`);

--
-- Indexes for table `mdl_user_preferences`
--
ALTER TABLE `mdl_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`),
  ADD KEY `mdl_userpref_nam_ix` (`name`);

--
-- Indexes for table `mdl_user_private_key`
--
ALTER TABLE `mdl_user_private_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  ADD KEY `mdl_userprivkey_use_ix` (`userid`);

--
-- Indexes for table `mdl_wiki`
--
ALTER TABLE `mdl_wiki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_wiki_cou_ix` (`course`);

--
-- Indexes for table `mdl_wiki_links`
--
ALTER TABLE `mdl_wiki_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_wikilink_fro_ix` (`frompageid`),
  ADD KEY `mdl_wikilink_sub_ix` (`subwikiid`);

--
-- Indexes for table `mdl_wiki_locks`
--
ALTER TABLE `mdl_wiki_locks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_wiki_pages`
--
ALTER TABLE `mdl_wiki_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  ADD KEY `mdl_wikipage_sub_ix` (`subwikiid`);

--
-- Indexes for table `mdl_wiki_subwikis`
--
ALTER TABLE `mdl_wiki_subwikis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  ADD KEY `mdl_wikisubw_wik_ix` (`wikiid`);

--
-- Indexes for table `mdl_wiki_synonyms`
--
ALTER TABLE `mdl_wiki_synonyms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`);

--
-- Indexes for table `mdl_wiki_versions`
--
ALTER TABLE `mdl_wiki_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_wikivers_pag_ix` (`pageid`);

--
-- Indexes for table `mdl_workshop`
--
ALTER TABLE `mdl_workshop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_work_cou_ix` (`course`);

--
-- Indexes for table `mdl_workshopallocation_scheduled`
--
ALTER TABLE `mdl_workshopallocation_scheduled`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`);

--
-- Indexes for table `mdl_workshopeval_best_settings`
--
ALTER TABLE `mdl_workshopeval_best_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_accumulative`
--
ALTER TABLE `mdl_workshopform_accumulative`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workaccu_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_comments`
--
ALTER TABLE `mdl_workshopform_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workcomm_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_numerrors`
--
ALTER TABLE `mdl_workshopform_numerrors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_worknume_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_numerrors_map`
--
ALTER TABLE `mdl_workshopform_numerrors_map`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  ADD KEY `mdl_worknumemap_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_rubric`
--
ALTER TABLE `mdl_workshopform_rubric`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workrubr_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_rubric_config`
--
ALTER TABLE `mdl_workshopform_rubric_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_rubric_levels`
--
ALTER TABLE `mdl_workshopform_rubric_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workrubrleve_dim_ix` (`dimensionid`);

--
-- Indexes for table `mdl_workshop_aggregations`
--
ALTER TABLE `mdl_workshop_aggregations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  ADD KEY `mdl_workaggr_wor_ix` (`workshopid`),
  ADD KEY `mdl_workaggr_use_ix` (`userid`);

--
-- Indexes for table `mdl_workshop_assessments`
--
ALTER TABLE `mdl_workshop_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workasse_sub_ix` (`submissionid`),
  ADD KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  ADD KEY `mdl_workasse_rev_ix` (`reviewerid`);

--
-- Indexes for table `mdl_workshop_grades`
--
ALTER TABLE `mdl_workshop_grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  ADD KEY `mdl_workgrad_ass_ix` (`assessmentid`);

--
-- Indexes for table `mdl_workshop_submissions`
--
ALTER TABLE `mdl_workshop_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_worksubm_wor_ix` (`workshopid`),
  ADD KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  ADD KEY `mdl_worksubm_aut_ix` (`authorid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mdl_mnetservice_enrol_courses`
--
ALTER TABLE `mdl_mnetservice_enrol_courses`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_mnetservice_enrol_enrolments`
--
ALTER TABLE `mdl_mnetservice_enrol_enrolments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_mnet_host`
--
ALTER TABLE `mdl_mnet_host`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mdl_mnet_host2service`
--
ALTER TABLE `mdl_mnet_host2service`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_mnet_log`
--
ALTER TABLE `mdl_mnet_log`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_mnet_remote_rpc`
--
ALTER TABLE `mdl_mnet_remote_rpc`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `mdl_mnet_remote_service2rpc`
--
ALTER TABLE `mdl_mnet_remote_service2rpc`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `mdl_mnet_rpc`
--
ALTER TABLE `mdl_mnet_rpc`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mdl_mnet_service`
--
ALTER TABLE `mdl_mnet_service`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mdl_mnet_service2rpc`
--
ALTER TABLE `mdl_mnet_service2rpc`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mdl_mnet_session`
--
ALTER TABLE `mdl_mnet_session`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_mnet_sso_access_control`
--
ALTER TABLE `mdl_mnet_sso_access_control`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_modules`
--
ALTER TABLE `mdl_modules`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `mdl_my_pages`
--
ALTER TABLE `mdl_my_pages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `mdl_notifications`
--
ALTER TABLE `mdl_notifications`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_oauth2_access_token`
--
ALTER TABLE `mdl_oauth2_access_token`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_oauth2_endpoint`
--
ALTER TABLE `mdl_oauth2_endpoint`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_oauth2_issuer`
--
ALTER TABLE `mdl_oauth2_issuer`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_oauth2_refresh_token`
--
ALTER TABLE `mdl_oauth2_refresh_token`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_oauth2_system_account`
--
ALTER TABLE `mdl_oauth2_system_account`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_oauth2_user_field_mapping`
--
ALTER TABLE `mdl_oauth2_user_field_mapping`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_page`
--
ALTER TABLE `mdl_page`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_paygw_paypal`
--
ALTER TABLE `mdl_paygw_paypal`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_payments`
--
ALTER TABLE `mdl_payments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_payment_accounts`
--
ALTER TABLE `mdl_payment_accounts`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_payment_gateways`
--
ALTER TABLE `mdl_payment_gateways`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_portfolio_instance`
--
ALTER TABLE `mdl_portfolio_instance`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_portfolio_instance_config`
--
ALTER TABLE `mdl_portfolio_instance_config`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_portfolio_instance_user`
--
ALTER TABLE `mdl_portfolio_instance_user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_portfolio_log`
--
ALTER TABLE `mdl_portfolio_log`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_portfolio_mahara_queue`
--
ALTER TABLE `mdl_portfolio_mahara_queue`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_portfolio_tempdata`
--
ALTER TABLE `mdl_portfolio_tempdata`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_post`
--
ALTER TABLE `mdl_post`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_proficiency_level`
--
ALTER TABLE `mdl_proficiency_level`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mdl_profiling`
--
ALTER TABLE `mdl_profiling`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_ddimageortext`
--
ALTER TABLE `mdl_qtype_ddimageortext`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_ddimageortext_drags`
--
ALTER TABLE `mdl_qtype_ddimageortext_drags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_ddimageortext_drops`
--
ALTER TABLE `mdl_qtype_ddimageortext_drops`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_ddmarker`
--
ALTER TABLE `mdl_qtype_ddmarker`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_ddmarker_drags`
--
ALTER TABLE `mdl_qtype_ddmarker_drags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_ddmarker_drops`
--
ALTER TABLE `mdl_qtype_ddmarker_drops`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_essay_options`
--
ALTER TABLE `mdl_qtype_essay_options`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_match_options`
--
ALTER TABLE `mdl_qtype_match_options`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_match_subquestions`
--
ALTER TABLE `mdl_qtype_match_subquestions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_multichoice_options`
--
ALTER TABLE `mdl_qtype_multichoice_options`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_randomsamatch_options`
--
ALTER TABLE `mdl_qtype_randomsamatch_options`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_qtype_shortanswer_options`
--
ALTER TABLE `mdl_qtype_shortanswer_options`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question`
--
ALTER TABLE `mdl_question`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `mdl_question_answers`
--
ALTER TABLE `mdl_question_answers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `mdl_question_attempts`
--
ALTER TABLE `mdl_question_attempts`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `mdl_question_attempt_steps`
--
ALTER TABLE `mdl_question_attempt_steps`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `mdl_question_attempt_step_data`
--
ALTER TABLE `mdl_question_attempt_step_data`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `mdl_question_calculated`
--
ALTER TABLE `mdl_question_calculated`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_calculated_options`
--
ALTER TABLE `mdl_question_calculated_options`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_categories`
--
ALTER TABLE `mdl_question_categories`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `mdl_question_datasets`
--
ALTER TABLE `mdl_question_datasets`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_dataset_definitions`
--
ALTER TABLE `mdl_question_dataset_definitions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_dataset_items`
--
ALTER TABLE `mdl_question_dataset_items`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_ddwtos`
--
ALTER TABLE `mdl_question_ddwtos`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_gapselect`
--
ALTER TABLE `mdl_question_gapselect`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_hints`
--
ALTER TABLE `mdl_question_hints`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_multianswer`
--
ALTER TABLE `mdl_question_multianswer`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_numerical`
--
ALTER TABLE `mdl_question_numerical`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_numerical_options`
--
ALTER TABLE `mdl_question_numerical_options`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_numerical_units`
--
ALTER TABLE `mdl_question_numerical_units`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_response_analysis`
--
ALTER TABLE `mdl_question_response_analysis`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_response_count`
--
ALTER TABLE `mdl_question_response_count`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_statistics`
--
ALTER TABLE `mdl_question_statistics`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_question_truefalse`
--
ALTER TABLE `mdl_question_truefalse`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `mdl_question_usages`
--
ALTER TABLE `mdl_question_usages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `mdl_quiz`
--
ALTER TABLE `mdl_quiz`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mdl_quizaccess_seb_quizsettings`
--
ALTER TABLE `mdl_quizaccess_seb_quizsettings`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_quizaccess_seb_template`
--
ALTER TABLE `mdl_quizaccess_seb_template`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_quiz_attempts`
--
ALTER TABLE `mdl_quiz_attempts`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `mdl_quiz_feedback`
--
ALTER TABLE `mdl_quiz_feedback`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mdl_quiz_grades`
--
ALTER TABLE `mdl_quiz_grades`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mdl_quiz_marks`
--
ALTER TABLE `mdl_quiz_marks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_quiz_overrides`
--
ALTER TABLE `mdl_quiz_overrides`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_quiz_overview_regrades`
--
ALTER TABLE `mdl_quiz_overview_regrades`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_quiz_reports`
--
ALTER TABLE `mdl_quiz_reports`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mdl_quiz_sections`
--
ALTER TABLE `mdl_quiz_sections`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mdl_quiz_slots`
--
ALTER TABLE `mdl_quiz_slots`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `mdl_quiz_slot_tags`
--
ALTER TABLE `mdl_quiz_slot_tags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_quiz_statistics`
--
ALTER TABLE `mdl_quiz_statistics`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_rating`
--
ALTER TABLE `mdl_rating`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_registration_hubs`
--
ALTER TABLE `mdl_registration_hubs`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_repository`
--
ALTER TABLE `mdl_repository`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mdl_repository_instances`
--
ALTER TABLE `mdl_repository_instances`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mdl_repository_instance_config`
--
ALTER TABLE `mdl_repository_instance_config`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_repository_onedrive_access`
--
ALTER TABLE `mdl_repository_onedrive_access`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_resource`
--
ALTER TABLE `mdl_resource`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_resource_old`
--
ALTER TABLE `mdl_resource_old`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_role`
--
ALTER TABLE `mdl_role`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mdl_role_allow_assign`
--
ALTER TABLE `mdl_role_allow_assign`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mdl_role_allow_override`
--
ALTER TABLE `mdl_role_allow_override`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mdl_role_allow_switch`
--
ALTER TABLE `mdl_role_allow_switch`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mdl_role_allow_view`
--
ALTER TABLE `mdl_role_allow_view`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `mdl_role_assignments`
--
ALTER TABLE `mdl_role_assignments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mdl_role_capabilities`
--
ALTER TABLE `mdl_role_capabilities`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1435;

--
-- AUTO_INCREMENT for table `mdl_role_context_levels`
--
ALTER TABLE `mdl_role_context_levels`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mdl_role_names`
--
ALTER TABLE `mdl_role_names`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mdl_scale`
--
ALTER TABLE `mdl_scale`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mdl_scale_history`
--
ALTER TABLE `mdl_scale_history`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_scorm`
--
ALTER TABLE `mdl_scorm`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_scorm_aicc_session`
--
ALTER TABLE `mdl_scorm_aicc_session`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_scorm_scoes`
--
ALTER TABLE `mdl_scorm_scoes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_scorm_scoes_data`
--
ALTER TABLE `mdl_scorm_scoes_data`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_scorm_scoes_track`
--
ALTER TABLE `mdl_scorm_scoes_track`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_scorm_seq_mapinfo`
--
ALTER TABLE `mdl_scorm_seq_mapinfo`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_scorm_seq_objective`
--
ALTER TABLE `mdl_scorm_seq_objective`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_scorm_seq_rolluprule`
--
ALTER TABLE `mdl_scorm_seq_rolluprule`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_scorm_seq_rolluprulecond`
--
ALTER TABLE `mdl_scorm_seq_rolluprulecond`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_scorm_seq_rulecond`
--
ALTER TABLE `mdl_scorm_seq_rulecond`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_scorm_seq_ruleconds`
--
ALTER TABLE `mdl_scorm_seq_ruleconds`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_search_index_requests`
--
ALTER TABLE `mdl_search_index_requests`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_search_simpledb_index`
--
ALTER TABLE `mdl_search_simpledb_index`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_sessions`
--
ALTER TABLE `mdl_sessions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT for table `mdl_skill`
--
ALTER TABLE `mdl_skill`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mdl_skill_proficiency_level`
--
ALTER TABLE `mdl_skill_proficiency_level`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mdl_skill_quiz_mapping`
--
ALTER TABLE `mdl_skill_quiz_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mdl_skill_weightage`
--
ALTER TABLE `mdl_skill_weightage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mdl_skill_weightage_meta`
--
ALTER TABLE `mdl_skill_weightage_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `mdl_stats_daily`
--
ALTER TABLE `mdl_stats_daily`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_stats_monthly`
--
ALTER TABLE `mdl_stats_monthly`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_stats_user_daily`
--
ALTER TABLE `mdl_stats_user_daily`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_stats_user_monthly`
--
ALTER TABLE `mdl_stats_user_monthly`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_stats_user_weekly`
--
ALTER TABLE `mdl_stats_user_weekly`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_stats_weekly`
--
ALTER TABLE `mdl_stats_weekly`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_sub_skill`
--
ALTER TABLE `mdl_sub_skill`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `mdl_survey`
--
ALTER TABLE `mdl_survey`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mdl_survey_analysis`
--
ALTER TABLE `mdl_survey_analysis`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_survey_answers`
--
ALTER TABLE `mdl_survey_answers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_survey_questions`
--
ALTER TABLE `mdl_survey_questions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `mdl_tag`
--
ALTER TABLE `mdl_tag`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tag_area`
--
ALTER TABLE `mdl_tag_area`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mdl_tag_coll`
--
ALTER TABLE `mdl_tag_coll`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mdl_tag_correlation`
--
ALTER TABLE `mdl_tag_correlation`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tag_instance`
--
ALTER TABLE `mdl_tag_instance`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_task_adhoc`
--
ALTER TABLE `mdl_task_adhoc`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mdl_task_log`
--
ALTER TABLE `mdl_task_log`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_task_scheduled`
--
ALTER TABLE `mdl_task_scheduled`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `mdl_tool_brickfield_areas`
--
ALTER TABLE `mdl_tool_brickfield_areas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_brickfield_cache_acts`
--
ALTER TABLE `mdl_tool_brickfield_cache_acts`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_brickfield_cache_check`
--
ALTER TABLE `mdl_tool_brickfield_cache_check`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_brickfield_checks`
--
ALTER TABLE `mdl_tool_brickfield_checks`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `mdl_tool_brickfield_content`
--
ALTER TABLE `mdl_tool_brickfield_content`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_brickfield_errors`
--
ALTER TABLE `mdl_tool_brickfield_errors`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_brickfield_process`
--
ALTER TABLE `mdl_tool_brickfield_process`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_brickfield_results`
--
ALTER TABLE `mdl_tool_brickfield_results`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_brickfield_schedule`
--
ALTER TABLE `mdl_tool_brickfield_schedule`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_brickfield_summary`
--
ALTER TABLE `mdl_tool_brickfield_summary`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_cohortroles`
--
ALTER TABLE `mdl_tool_cohortroles`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_customlang`
--
ALTER TABLE `mdl_tool_customlang`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_customlang_components`
--
ALTER TABLE `mdl_tool_customlang_components`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_dataprivacy_category`
--
ALTER TABLE `mdl_tool_dataprivacy_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_dataprivacy_ctxexpired`
--
ALTER TABLE `mdl_tool_dataprivacy_ctxexpired`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_dataprivacy_ctxinstance`
--
ALTER TABLE `mdl_tool_dataprivacy_ctxinstance`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_dataprivacy_ctxlevel`
--
ALTER TABLE `mdl_tool_dataprivacy_ctxlevel`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_dataprivacy_purpose`
--
ALTER TABLE `mdl_tool_dataprivacy_purpose`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_dataprivacy_purposerole`
--
ALTER TABLE `mdl_tool_dataprivacy_purposerole`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_dataprivacy_request`
--
ALTER TABLE `mdl_tool_dataprivacy_request`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mdl_tool_monitor_events`
--
ALTER TABLE `mdl_tool_monitor_events`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_monitor_history`
--
ALTER TABLE `mdl_tool_monitor_history`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_monitor_rules`
--
ALTER TABLE `mdl_tool_monitor_rules`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_monitor_subscriptions`
--
ALTER TABLE `mdl_tool_monitor_subscriptions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_policy`
--
ALTER TABLE `mdl_tool_policy`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_policy_acceptances`
--
ALTER TABLE `mdl_tool_policy_acceptances`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_policy_versions`
--
ALTER TABLE `mdl_tool_policy_versions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_recyclebin_category`
--
ALTER TABLE `mdl_tool_recyclebin_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_recyclebin_course`
--
ALTER TABLE `mdl_tool_recyclebin_course`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_tool_usertours_steps`
--
ALTER TABLE `mdl_tool_usertours_steps`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mdl_tool_usertours_tours`
--
ALTER TABLE `mdl_tool_usertours_tours`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mdl_upgrade_log`
--
ALTER TABLE `mdl_upgrade_log`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1222;

--
-- AUTO_INCREMENT for table `mdl_url`
--
ALTER TABLE `mdl_url`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_user`
--
ALTER TABLE `mdl_user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `mdl_user_devices`
--
ALTER TABLE `mdl_user_devices`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_user_enrolments`
--
ALTER TABLE `mdl_user_enrolments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mdl_user_info_category`
--
ALTER TABLE `mdl_user_info_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mdl_user_info_data`
--
ALTER TABLE `mdl_user_info_data`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mdl_user_info_field`
--
ALTER TABLE `mdl_user_info_field`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mdl_user_lastaccess`
--
ALTER TABLE `mdl_user_lastaccess`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mdl_user_password_history`
--
ALTER TABLE `mdl_user_password_history`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_user_password_resets`
--
ALTER TABLE `mdl_user_password_resets`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `mdl_user_preferences`
--
ALTER TABLE `mdl_user_preferences`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `mdl_user_private_key`
--
ALTER TABLE `mdl_user_private_key`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_wiki`
--
ALTER TABLE `mdl_wiki`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_wiki_links`
--
ALTER TABLE `mdl_wiki_links`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_wiki_locks`
--
ALTER TABLE `mdl_wiki_locks`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_wiki_pages`
--
ALTER TABLE `mdl_wiki_pages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_wiki_subwikis`
--
ALTER TABLE `mdl_wiki_subwikis`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_wiki_synonyms`
--
ALTER TABLE `mdl_wiki_synonyms`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_wiki_versions`
--
ALTER TABLE `mdl_wiki_versions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshop`
--
ALTER TABLE `mdl_workshop`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshopallocation_scheduled`
--
ALTER TABLE `mdl_workshopallocation_scheduled`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshopeval_best_settings`
--
ALTER TABLE `mdl_workshopeval_best_settings`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshopform_accumulative`
--
ALTER TABLE `mdl_workshopform_accumulative`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshopform_comments`
--
ALTER TABLE `mdl_workshopform_comments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshopform_numerrors`
--
ALTER TABLE `mdl_workshopform_numerrors`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshopform_numerrors_map`
--
ALTER TABLE `mdl_workshopform_numerrors_map`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshopform_rubric`
--
ALTER TABLE `mdl_workshopform_rubric`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshopform_rubric_config`
--
ALTER TABLE `mdl_workshopform_rubric_config`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshopform_rubric_levels`
--
ALTER TABLE `mdl_workshopform_rubric_levels`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshop_aggregations`
--
ALTER TABLE `mdl_workshop_aggregations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshop_assessments`
--
ALTER TABLE `mdl_workshop_assessments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshop_grades`
--
ALTER TABLE `mdl_workshop_grades`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdl_workshop_submissions`
--
ALTER TABLE `mdl_workshop_submissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
