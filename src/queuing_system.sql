/*
 Navicat Premium Dump SQL

 Source Server         : MySQL Local tito
 Source Server Type    : MySQL
 Source Server Version : 90001 (9.0.1)
 Source Host           : localhost:3306
 Source Schema         : queuing_system

 Target Server Type    : MySQL
 Target Server Version : 90001 (9.0.1)
 File Encoding         : 65001

 Date: 25/03/2025 01:02:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `served` int DEFAULT NULL,
  `threshold` int DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` (`id`, `fullname`, `username`, `password`, `priority`, `status`, `served`, `threshold`, `date_registered`) VALUES (1, 'Kobumanzi Esether', 'esether', '12345', 'Cash Deposit', 1, 7, 9, '2025-03-13 17:12:40');
INSERT INTO `admin` (`id`, `fullname`, `username`, `password`, `priority`, `status`, `served`, `threshold`, `date_registered`) VALUES (2, 'Nakalembe Sarah', 'sarah', '12345', 'Cash Withdraw', 1, 7, 9, '2025-03-20 15:42:41');
INSERT INTO `admin` (`id`, `fullname`, `username`, `password`, `priority`, `status`, `served`, `threshold`, `date_registered`) VALUES (3, 'Derek Tibbeingana', 'derek', '12345', 'Check Deposit', 2, 9, 9, '2025-03-20 15:55:41');
COMMIT;

-- ----------------------------
-- Table structure for queue
-- ----------------------------
DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prefix` varchar(255) DEFAULT NULL,
  `surfix` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `period` int DEFAULT NULL,
  `queue_position` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `flag` int DEFAULT NULL,
  `teller` int DEFAULT NULL,
  `time_in` timestamp NULL DEFAULT NULL,
  `time_called` timestamp NULL DEFAULT NULL,
  `time_finished` timestamp NULL DEFAULT NULL,
  `waiting_time` time DEFAULT NULL,
  `service_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of queue
-- ----------------------------
BEGIN;
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (44, 'CD', 1, 3, 'Cash Deposit', 7, 1, 3, 1, 1, '2025-03-23 17:11:41', '2025-03-23 18:05:01', '2025-03-23 18:05:04', '00:53:20', '00:00:03');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (45, 'CKD', 1, 1, 'Check Deposit', 10, 2, 3, NULL, 3, '2025-03-23 17:11:47', '2025-03-23 17:14:49', '2025-03-23 17:29:28', '00:03:02', '00:14:39');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (46, 'CW', 1, 2, 'Cash Withdraw', 5, 3, 3, NULL, 1, '2025-03-23 17:11:51', '2025-03-23 17:30:42', '2025-03-23 18:05:01', '00:18:51', '00:34:19');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (47, 'CD', 2, 3, 'Cash Deposit', 7, 4, 3, 1, 1, '2025-03-23 17:11:55', '2025-03-23 18:05:04', '2025-03-23 18:05:28', '00:53:09', '00:00:24');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (48, 'EFT', 1, 1, 'Electronic Funds Transfer', 15, 5, 3, NULL, 1, '2025-03-23 17:12:01', '2025-03-23 17:15:58', '2025-03-23 17:30:42', '00:03:57', '00:14:44');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (49, 'CD', 3, 1, 'Cash Deposit', 7, 6, 3, NULL, 3, '2025-03-23 17:12:05', '2025-03-23 17:29:28', '2025-03-23 18:06:12', '00:17:23', '00:36:44');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (50, 'CW', 2, 3, 'Cash Withdraw', 5, 7, 3, NULL, 2, '2025-03-23 17:12:07', '2025-03-23 17:31:35', '2025-03-23 17:32:08', '00:19:28', '00:00:33');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (51, 'WU', 1, 3, 'Western Union', 15, 8, 3, 1, 3, '2025-03-23 17:12:10', '2025-03-23 18:06:12', '2025-03-23 18:06:40', '00:54:02', '00:00:28');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (52, 'CD', 4, 3, 'Cash Deposit', 7, 9, 3, 1, 3, '2025-03-23 17:12:13', '2025-03-23 18:06:40', '2025-03-23 18:07:16', '00:54:27', '00:00:36');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (53, 'CD', 5, 3, 'Cash Deposit', 7, 10, 3, 1, 2, '2025-03-23 17:12:17', '2025-03-23 18:07:52', '2025-03-23 18:07:53', '00:55:35', '00:00:01');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (54, 'CD', 6, 3, 'Cash Deposit', 7, 11, 3, 1, 2, '2025-03-23 17:14:05', '2025-03-23 18:07:53', '2025-03-23 18:07:54', '00:53:48', '00:00:01');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (55, 'CD', 7, 3, 'Cash Deposit', 7, 12, 3, 1, 2, '2025-03-23 17:14:11', '2025-03-23 18:09:59', '2025-03-23 18:19:09', '00:55:48', '00:09:10');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (56, 'CW', 3, 3, 'Cash Withdraw', 5, 13, 3, NULL, 2, '2025-03-23 17:14:15', '2025-03-23 17:32:08', '2025-03-23 18:07:52', '00:17:53', '00:35:44');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (58, 'CD', 8, 3, 'Cash Deposit', 7, 1, 3, NULL, 1, '2025-03-23 18:20:02', '2025-03-23 18:22:06', '2025-03-23 18:22:07', '00:02:04', '00:00:01');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (59, 'CW', 4, 3, 'Cash Withdraw', 5, 2, 3, NULL, 3, '2025-03-23 18:20:06', '2025-03-23 18:21:27', '2025-03-23 18:21:30', '00:01:21', '00:00:03');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (60, 'CW', 5, 2, 'Cash Withdraw', 5, 1, 3, NULL, 1, '2025-03-23 18:22:38', '2025-03-23 18:22:55', '2025-03-23 18:22:57', '00:00:17', '00:00:02');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (61, 'CD', 9, 3, 'Cash Deposit', 7, 1, 3, NULL, 2, '2025-03-23 18:24:38', '2025-03-23 18:26:44', '2025-03-23 18:26:45', '00:02:06', '00:00:01');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (62, 'CW', 6, 3, 'Cash Withdraw', 5, 2, 3, NULL, 3, '2025-03-23 18:24:43', '2025-03-23 18:25:48', '2025-03-23 18:26:03', '00:01:05', '00:00:15');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (63, 'CD', 10, 2, 'Cash Deposit', 7, 1, 3, NULL, 2, '2025-03-23 18:27:00', '2025-03-23 18:27:20', '2025-03-23 18:28:32', '00:00:20', '00:01:12');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (64, 'CD', 11, 3, 'Cash Deposit', 7, 1, 3, NULL, 1, '2025-03-25 00:36:46', '2025-03-25 00:36:51', '2025-03-25 00:37:12', '00:00:05', '00:00:21');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (65, 'CD', 12, 3, 'Cash Deposit', 7, 1, 3, NULL, 3, '2025-03-25 00:55:56', '2025-03-25 00:56:30', '2025-03-25 00:56:32', '00:00:34', '00:00:02');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (66, 'CD', 13, 2, 'Cash Deposit', 7, 2, 3, NULL, 3, '2025-03-25 00:56:00', '2025-03-25 00:56:26', '2025-03-25 00:56:30', '00:00:26', '00:00:04');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`, `waiting_time`, `service_time`) VALUES (67, 'CW', 7, 1, 'Cash Withdraw', 5, 3, 3, NULL, 3, '2025-03-25 00:56:06', '2025-03-25 00:56:15', '2025-03-25 00:56:26', '00:00:09', '00:00:11');
COMMIT;

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service` varchar(255) DEFAULT NULL,
  `time` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of services
-- ----------------------------
BEGIN;
INSERT INTO `services` (`id`, `service`, `time`) VALUES (1, 'Cash Deposit', 7);
INSERT INTO `services` (`id`, `service`, `time`) VALUES (2, 'Cash Withdraw', 5);
INSERT INTO `services` (`id`, `service`, `time`) VALUES (3, 'Check Deposit', 10);
INSERT INTO `services` (`id`, `service`, `time`) VALUES (4, 'Electronic Funds Transfer', 15);
INSERT INTO `services` (`id`, `service`, `time`) VALUES (5, 'western Union', 15);
INSERT INTO `services` (`id`, `service`, `time`) VALUES (6, 'Forex', 5);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
