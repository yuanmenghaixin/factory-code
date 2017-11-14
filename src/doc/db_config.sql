/*
Navicat MySQL Data Transfer

Source Server         : mes
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : factorydb

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-11-14 09:16:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for db_config
-- ----------------------------
DROP TABLE IF EXISTS `db_config`;
CREATE TABLE `db_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dbType` varchar(20) DEFAULT NULL COMMENT '数据库类型',
  `ip` varchar(100) DEFAULT NULL COMMENT 'ip地址',
  `port` int(11) DEFAULT NULL,
  `dbName` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `linkName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
