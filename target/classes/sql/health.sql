/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : health

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-03-10 14:20:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '回答ID',
  `user` int(9) unsigned zerofill NOT NULL COMMENT '所属用户',
  `select` int(9) unsigned zerofill NOT NULL COMMENT '所属选项',
  `answer` varchar(255) NOT NULL COMMENT '回答内容',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `select` (`select`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`select`) REFERENCES `select` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for assess
-- ----------------------------
DROP TABLE IF EXISTS `assess`;
CREATE TABLE `assess` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `user` int(9) unsigned zerofill NOT NULL COMMENT '发表用户',
  `anony` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '匿名1否0',
  `rank` int(3) unsigned NOT NULL COMMENT '评分',
  `information` text COMMENT '详细内容',
  `agree` int(9) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `disagree` int(9) unsigned NOT NULL DEFAULT '0' COMMENT '反对数',
  `flag` tinyint(1) unsigned zerofill NOT NULL DEFAULT '1' COMMENT '标志位',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `assess_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for body
-- ----------------------------
DROP TABLE IF EXISTS `body`;
CREATE TABLE `body` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '身材管理表ID',
  `user` int(9) unsigned zerofill NOT NULL COMMENT '所属用户',
  `weight` double(9,2) unsigned NOT NULL COMMENT '体重',
  `goalweight` double(9,2) unsigned DEFAULT NULL COMMENT '目标体重',
  `goalweightdate` date DEFAULT NULL COMMENT '目标体重日期',
  `height` double(9,2) unsigned NOT NULL COMMENT '身高',
  `bust` double(9,2) unsigned DEFAULT NULL COMMENT '胸围',
  `waist` double(9,2) unsigned DEFAULT NULL COMMENT '腰围',
  `hip` double(9,2) unsigned DEFAULT NULL COMMENT '臀围',
  `blood` varchar(10) DEFAULT NULL COMMENT '血型',
  `pressure` varchar(10) DEFAULT NULL COMMENT '血压',
  `suger` varchar(10) DEFAULT NULL COMMENT '血糖',
  `fat` varchar(10) DEFAULT NULL COMMENT '血脂',
  `pulse` varchar(10) DEFAULT NULL COMMENT '心率',
  `lefteye` double(9,2) unsigned DEFAULT NULL COMMENT '左眼视力',
  `righteye` double(9,2) unsigned DEFAULT NULL COMMENT '右眼视力',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `body_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for disease
-- ----------------------------
DROP TABLE IF EXISTS `disease`;
CREATE TABLE `disease` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '病史id',
  `begindate` date DEFAULT NULL COMMENT '开始日期',
  `enddate` date DEFAULT NULL COMMENT '结束日期',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `information` text COMMENT '详细内容',
  `user` int(9) unsigned zerofill NOT NULL COMMENT '所属用户',
  `medicine` varchar(255) DEFAULT NULL COMMENT '服用药物',
  `hospital` int(9) unsigned zerofill DEFAULT '000000000' COMMENT '就诊医院',
  `doctor` varchar(30) DEFAULT NULL COMMENT '就诊医生',
  `flag` tinyint(1) unsigned zerofill NOT NULL COMMENT '标志位',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `hospital` (`hospital`),
  CONSTRAINT `disease_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `disease_ibfk_2` FOREIGN KEY (`hospital`) REFERENCES `hospital` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '医院id',
  `name` varchar(255) NOT NULL COMMENT '医院名',
  `place` int(9) unsigned zerofill NOT NULL COMMENT '所属地区',
  `information` text COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `place` (`place`),
  CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`place`) REFERENCES `place` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '团体ID',
  `name` varchar(255) NOT NULL COMMENT '团体名',
  `creater` int(9) unsigned zerofill NOT NULL COMMENT '团体创建者',
  `manager` int(9) unsigned zerofill DEFAULT NULL COMMENT '团体管理者',
  `flag` tinyint(1) unsigned zerofill NOT NULL DEFAULT '1' COMMENT '标志位',
  PRIMARY KEY (`id`),
  KEY `creater` (`creater`),
  KEY `manager` (`manager`),
  CONSTRAINT `organization_ibfk_1` FOREIGN KEY (`creater`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `organization_ibfk_2` FOREIGN KEY (`manager`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '问卷ID',
  `name` varchar(255) NOT NULL COMMENT '问卷名',
  `illustration` varchar(255) DEFAULT NULL COMMENT '问卷说明',
  `creater` int(9) unsigned zerofill NOT NULL COMMENT '问卷创建者',
  `manager` int(9) unsigned zerofill DEFAULT NULL COMMENT '问卷管理者',
  `createdate` date DEFAULT NULL COMMENT '创建日期',
  `begindate` date DEFAULT NULL COMMENT '开始日期',
  `enddate` date DEFAULT NULL COMMENT '结束日期',
  `flag` tinyint(1) unsigned zerofill DEFAULT NULL COMMENT '标志位',
  `organization` int(9) unsigned zerofill NOT NULL COMMENT '所属团体',
  PRIMARY KEY (`id`),
  KEY `creater` (`creater`),
  KEY `manager` (`manager`),
  KEY `organization` (`organization`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`creater`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `paper_ibfk_2` FOREIGN KEY (`manager`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `paper_ibfk_3` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for place
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '地区id',
  `name` varchar(255) NOT NULL COMMENT '地区名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '问题id',
  `name` varchar(255) NOT NULL COMMENT '问题名',
  `paper` int(9) unsigned zerofill NOT NULL COMMENT '所属问卷',
  `type` varchar(255) NOT NULL COMMENT '题型',
  `flag` tinyint(1) unsigned zerofill NOT NULL DEFAULT '1' COMMENT '是否必答1是0否',
  PRIMARY KEY (`id`),
  KEY `paper` (`paper`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`paper`) REFERENCES `paper` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '身体状况记录id',
  `user` int(9) unsigned zerofill NOT NULL COMMENT '所属用户',
  `date` date NOT NULL COMMENT '记录时间',
  `weight` double(9,2) DEFAULT NULL COMMENT '体重',
  `height` double(9,2) DEFAULT NULL COMMENT '身高',
  `bust` double(9,2) DEFAULT NULL COMMENT '胸围',
  `waist` double(9,2) DEFAULT NULL COMMENT '腰围',
  `hip` double(9,2) DEFAULT NULL COMMENT '臀围',
  `pressure` varchar(10) DEFAULT NULL COMMENT '血压',
  `suger` varchar(10) DEFAULT NULL COMMENT '血糖',
  `fat` varchar(10) DEFAULT NULL COMMENT '血脂',
  `pulse` varchar(10) DEFAULT NULL COMMENT '心率',
  `lefteye` double(9,2) unsigned DEFAULT NULL COMMENT '左眼视力',
  `righteye` double(9,2) unsigned DEFAULT NULL COMMENT '右眼视力',
  `sport` varchar(255) DEFAULT NULL COMMENT '运动情况描述',
  `food` varchar(255) DEFAULT NULL COMMENT '饮食情况描述',
  `sleep` varchar(255) DEFAULT NULL COMMENT '睡眠情况描述',
  `skin` varchar(255) DEFAULT NULL COMMENT '皮肤情况描述',
  `energy` varchar(255) DEFAULT NULL COMMENT '精力情况描述',
  `pain` varchar(255) DEFAULT NULL COMMENT '身体不适描述',
  `temperature` double(9,2) unsigned DEFAULT NULL COMMENT '体温',
  `spirit` varchar(255) DEFAULT NULL COMMENT '心理健康情况',
  `worktime` double(9,2) unsigned DEFAULT NULL COMMENT '工作/学习时间',
  `goal` varchar(255) DEFAULT NULL COMMENT '今日目标描述',
  `tips` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `record_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '回帖ID',
  `topic` int(9) unsigned zerofill NOT NULL COMMENT '所属主贴',
  `user` int(9) unsigned zerofill NOT NULL COMMENT '回帖用户',
  `content` text COMMENT '内容',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '发帖时间',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '标志位',
  PRIMARY KEY (`id`),
  KEY `topic` (`topic`),
  KEY `user` (`user`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`topic`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '行程id',
  `user` int(9) unsigned zerofill NOT NULL COMMENT '所属用户',
  `date` date DEFAULT NULL COMMENT '日期',
  `place` int(9) unsigned zerofill NOT NULL COMMENT '所及地点',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `place` (`place`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`place`) REFERENCES `place` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for select
-- ----------------------------
DROP TABLE IF EXISTS `select`;
CREATE TABLE `select` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '选项id',
  `content` varchar(255) NOT NULL COMMENT '选项内容',
  `question` int(9) unsigned zerofill NOT NULL COMMENT '所属问题',
  PRIMARY KEY (`id`),
  KEY `select_ibfk_1` (`question`),
  CONSTRAINT `select_ibfk_1` FOREIGN KEY (`question`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主贴ID',
  `creater` int(9) unsigned zerofill NOT NULL COMMENT '发帖人',
  `reply` int(9) unsigned NOT NULL DEFAULT '0' COMMENT '回复数',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '发帖时间',
  `lastreplytime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后回复时间',
  `flag` tinyint(1) unsigned zerofill NOT NULL DEFAULT '1' COMMENT '标志位',
  PRIMARY KEY (`id`),
  KEY `creater` (`creater`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`creater`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `sex` varchar(10) NOT NULL COMMENT '性别（男/女）',
  `age` int(3) unsigned NOT NULL COMMENT '年龄',
  `height` double(10,2) unsigned DEFAULT NULL COMMENT '身高',
  `weight` double(10,2) unsigned DEFAULT NULL COMMENT '体重',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `nation` varchar(30) DEFAULT NULL COMMENT '民族',
  `phone` varchar(30) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `address` varchar(100) DEFAULT NULL COMMENT '家庭地址',
  `information` varchar(255) DEFAULT NULL COMMENT '简介',
  `organization` int(9) unsigned zerofill DEFAULT NULL COMMENT '所属团体',
  `flag` tinyint(1) unsigned zerofill NOT NULL DEFAULT '1' COMMENT '标志位',
  PRIMARY KEY (`userid`),
  KEY `organization` (`organization`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
