/*
Navicat MySQL Data Transfer

Source Server         : mes
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : factorydb

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-11-14 09:16:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `configName` varchar(60) DEFAULT NULL,
  `projectPath` varchar(200) DEFAULT NULL,
  `packageName` varchar(60) DEFAULT NULL,
  `pagePath` varchar(200) DEFAULT NULL,
  `relativePath` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
