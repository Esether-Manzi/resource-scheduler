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

 Date: 13/03/2025 15:44:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for priority
-- ----------------------------
DROP TABLE IF EXISTS `priority`;
CREATE TABLE `priority` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `priority_level` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of queue
-- ----------------------------
BEGIN;
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (1, 'CD', 1, 1, 'Cash Deposit', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (2, 'CD', 2, 1, 'Cash Deposit', NULL, 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (3, 'CD', 3, 1, 'Cash Deposit', NULL, 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (4, 'CD', 4, 1, 'Cash Deposit', NULL, 4, 1, 1, NULL, '2025-03-09 16:47:02', NULL, NULL);
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (5, 'CD', 5, 1, 'Cash Deposit', NULL, 5, 1, 1, NULL, '2025-03-09 19:48:58', NULL, NULL);
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (6, 'CD', 6, 1, 'Cash Deposit', NULL, 6, 1, 1, NULL, '2025-03-10 20:16:42', NULL, NULL);
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (7, 'CD', 7, 1, 'Cash Deposit', NULL, 7, 1, 1, NULL, '2025-03-10 20:34:50', NULL, NULL);
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (8, 'CD', 8, 1, 'Cash Deposit', NULL, 8, 1, 1, NULL, '2025-03-10 20:35:47', NULL, NULL);
INSERT INTO `queue` (`id`, `prefix`, `surfix`, `priority`, `service`, `period`, `queue_position`, `status`, `flag`, `teller`, `time_in`, `time_called`, `time_finished`) VALUES (9, 'CD', 9, 3, 'Cash Deposit', NULL, 9, 1, 1, NULL, '2025-03-10 20:59:34', NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

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
