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

 Date: 14/03/2025 20:54:11
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
  `date_registered` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` (`id`, `fullname`, `username`, `password`, `priority`, `date_registered`) VALUES (1, 'Kobumanzi Esether', 'esether', '12345', 'Cash Deposit', '2025-03-13 17:12:40');
COMMIT;

-- ----------------------------
-- Table structure for priority
-- ----------------------------
DROP TABLE IF EXISTS `priority`;
CREATE TABLE `priority` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `priority_level` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of priority
-- ----------------------------
BEGIN;
INSERT INTO `priority` (`id`, `name`, `priority_level`) VALUES (1, 'VIP', 1);
INSERT INTO `priority` (`id`, `name`, `priority_level`) VALUES (2, 'Coporate', 2);
INSERT INTO `priority` (`id`, `name`, `priority_level`) VALUES (3, 'Normal', 3);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of queue
-- ----------------------------
BEGIN;
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (4, 'CD', 4, 1, 'Cash Deposit', NULL, 4, 3, 1, 1, '2025-03-09 16:47:02', '2025-03-14 14:47:17', '2025-03-14 14:47:31');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (5, 'CD', 5, 1, 'Cash Deposit', NULL, 5, 3, 1, 1, '2025-03-09 19:48:58', '2025-03-14 14:47:31', '2025-03-14 14:47:32');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (6, 'CD', 6, 1, 'Cash Deposit', NULL, 6, 3, 1, 1, '2025-03-10 20:16:42', '2025-03-14 14:47:32', '2025-03-14 14:47:33');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (7, 'CD', 7, 1, 'Cash Deposit', NULL, 7, 3, 1, 1, '2025-03-10 20:34:50', '2025-03-14 14:47:33', '2025-03-14 14:47:55');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (8, 'CD', 8, 1, 'Cash Deposit', NULL, 8, 3, 1, 1, '2025-03-10 20:35:47', '2025-03-14 14:47:55', '2025-03-14 14:56:05');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (9, 'CD', 9, 3, 'Cash Deposit', NULL, 9, 3, 1, 1, '2025-03-10 20:59:34', '2025-03-14 14:56:05', '2025-03-14 14:56:34');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (10, 'CD', 10, 1, 'Cash Deposit', NULL, 10, 3, 1, 1, '2025-03-14 14:02:57', '2025-03-14 14:56:34', '2025-03-14 15:18:46');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (11, 'CD', 11, 1, 'Cash Deposit', NULL, 11, 3, NULL, 1, '2025-03-14 14:49:38', '2025-03-14 15:18:46', '2025-03-14 15:18:50');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (12, 'CD', 12, 1, 'Cash Deposit', NULL, 12, 3, NULL, 1, '2025-03-14 14:52:15', '2025-03-14 15:18:50', '2025-03-14 15:18:50');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (13, 'CD', 13, 1, 'Cash Deposit', NULL, 13, 3, 1, 1, '2025-03-14 14:53:22', '2025-03-14 15:34:53', '2025-03-14 15:34:54');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (14, 'CD', 14, 1, 'Cash Deposit', NULL, 14, 3, 1, 1, '2025-03-14 14:53:49', '2025-03-14 15:34:54', '2025-03-14 15:34:55');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (15, 'CD', 15, 1, 'Cash Deposit', NULL, 15, 3, 1, 1, '2025-03-14 14:53:55', '2025-03-14 15:34:55', '2025-03-14 15:34:57');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (16, 'CW', 1, 2, 'Cash Withdraw', NULL, 16, 3, NULL, 1, '2025-03-14 15:15:36', '2025-03-14 15:34:57', '2025-03-14 15:35:03');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (17, 'CKD', 1, 3, 'Check Deposit', NULL, 1, 3, NULL, 1, '2025-03-14 19:51:25', '2025-03-14 20:03:30', '2025-03-14 20:04:35');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (18, 'CD', 16, 1, 'Cash Deposit', NULL, 2, 3, NULL, 1, '2025-03-14 19:54:01', '2025-03-14 20:01:18', '2025-03-14 20:03:30');
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (19, 'CW', 2, 2, 'Cash Withdraw', NULL, 3, 2, NULL, 1, '2025-03-14 19:56:51', '2025-03-14 20:04:35', NULL);
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (20, 'CKD', 2, 3, 'Check Deposit', NULL, 4, 1, NULL, NULL, '2025-03-14 19:57:05', NULL, NULL);
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (21, 'FX', 1, 1, 'Forex', NULL, 5, 1, NULL, NULL, '2025-03-14 19:57:12', NULL, NULL);
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
INSERT INTO `services` (`id`, `service`, `time`) VALUES (6, 'Forex', 10);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
