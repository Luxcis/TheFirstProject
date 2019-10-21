/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : epindb

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-10-21 17:08:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cv_msg`
-- ----------------------------
DROP TABLE IF EXISTS `cv_msg`;
CREATE TABLE `cv_msg` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) NOT NULL COMMENT '用户id',
  `name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `addr` varchar(50) NOT NULL,
  `speciality` text NOT NULL COMMENT '所学专业',
  `skill` text NOT NULL COMMENT '掌握技能',
  `profile` text NOT NULL COMMENT '个人简介',
  `city` varchar(50) NOT NULL,
  `school` varchar(50) NOT NULL COMMENT '毕业院校',
  `stu_desc` text NOT NULL,
  `position` varchar(50) NOT NULL COMMENT '曾工作职位',
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `job_desc` text NOT NULL COMMENT '工作经历简述',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cv_msg_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='简历信息';

-- ----------------------------
-- Records of cv_msg
-- ----------------------------
INSERT INTO `cv_msg` VALUES ('30', '2', '姓名', '男', '4008208820', '321@163.com', '2019-09-30', '汇银广场南楼7楼', '计算机', 'java', '简介', '上海', '交大', '学习', '架构师', '2019-10-01', '2019-10-19', '开发');
INSERT INTO `cv_msg` VALUES ('32', '2', '刘庆栋', '男', '4008208820', '321@163.com', '2019-09-30', '徐汇区汇银广场南楼7楼', '计算机', 'JAVA', '简介', '上海', '交大', '学习', '架构师', '2019-10-01', '2019-10-02', '开发');

-- ----------------------------
-- Table structure for `received_cv`
-- ----------------------------
DROP TABLE IF EXISTS `received_cv`;
CREATE TABLE `received_cv` (
  `cv_id` int(50) NOT NULL,
  `recruit_id` int(50) NOT NULL,
  PRIMARY KEY (`cv_id`,`recruit_id`),
  KEY `received_cv_ibfk_2` (`recruit_id`),
  CONSTRAINT `received_cv_ibfk_1` FOREIGN KEY (`cv_id`) REFERENCES `cv_msg` (`id`),
  CONSTRAINT `received_cv_ibfk_2` FOREIGN KEY (`recruit_id`) REFERENCES `recruit_msg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of received_cv
-- ----------------------------

-- ----------------------------
-- Table structure for `recruit_msg`
-- ----------------------------
DROP TABLE IF EXISTS `recruit_msg`;
CREATE TABLE `recruit_msg` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) NOT NULL COMMENT '公司id',
  `position_name` varchar(50) NOT NULL COMMENT '职位名称',
  `qualification` varchar(50) NOT NULL COMMENT '学历要求',
  `skill` text NOT NULL COMMENT '技能需求',
  `sal` int(50) NOT NULL COMMENT '薪资',
  `position_msg` text NOT NULL COMMENT '职位简介',
  `addr` varchar(50) NOT NULL COMMENT '地址',
  `end_date` date NOT NULL COMMENT '截止日期',
  `category` varchar(255) NOT NULL COMMENT '职位分类',
  PRIMARY KEY (`id`),
  KEY `com_id` (`user_id`),
  CONSTRAINT `recruit_msg_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='招聘简章';

-- ----------------------------
-- Records of recruit_msg
-- ----------------------------
INSERT INTO `recruit_msg` VALUES ('1', '3', 'Java', '专科', '无', '10000', '无', '上海', '2019-10-15', '无');
INSERT INTO `recruit_msg` VALUES ('2', '3', 'Java', '专科', '无', '11000', '无', '上海', '2019-10-01', '无');
INSERT INTO `recruit_msg` VALUES ('3', '3', 'PhP', '专科', '无', '12000', '无', '上海', '2019-09-05', '无');
INSERT INTO `recruit_msg` VALUES ('4', '3', 'web前端', '专科', '无', '13000', '无', '深圳', '2019-09-18', '无');
INSERT INTO `recruit_msg` VALUES ('5', '3', 'UI设计师', '本科', '无', '14000', '无', '北京', '2019-09-16', '无');
INSERT INTO `recruit_msg` VALUES ('6', '3', 'Java', '本科', '无', '15000', '无', '北京', '2019-09-22', '无');
INSERT INTO `recruit_msg` VALUES ('7', '3', 'Java', '专科', '无', '16000', '无', '安徽', '2019-11-01', '无');
INSERT INTO `recruit_msg` VALUES ('8', '3', 'Java', '专科', '无', '17000', '无', '南京', '2019-10-26', '无');
INSERT INTO `recruit_msg` VALUES ('9', '3', 'Java', '专科', '无', '18000', '无', '福建', '2019-11-02', '无');
INSERT INTO `recruit_msg` VALUES ('10', '3', 'Java', '专科', '无', '19000', '无', '香港', '2019-11-04', '无');
INSERT INTO `recruit_msg` VALUES ('21', '3', 'JAVA开发', '本科', '全日制本科及以上学历，5年以上Java编程经验； 具有丰富的系统架构设计实践经验，能够设计开发高性能、高并发、高可用性、高扩展性系统架构； 精通Java语言，JVM原理及调优；精通J2EE、WebService、分布式、多线程、缓存等高性能架构技术； 掌握网络协议栈，熟悉常用网络协议 HTTP,HTTPS,SSL,WEBSOCKET，以及安全相关的技术； 掌握微服务Spring Cloud架构和常用组件、消息队列框架RabbitMQ等，了解分布式协调服务Zookeeper等； 熟悉大数据技术栈，对Hadoop、Hive、Spark、Hbase、Kafka、ELK 等开源组件有使用及优化经验； 具有良好的技术文档功底和编码习惯，有互联网大型项目架构设计或产品研发经验者优先。', '15000', '设计核心产品的前端架构，并带领组员实现并持续优化；\r\n\r\n优化前端开发方式及协作流程，创建技术标准及规范，并孜孜不倦的布道；\r\n\r\n为前后端技术改进、网站性能优化、技术选型提供解决方案；\r\n\r\n为组员的技术成长制定目标、计划并帮助实施，提升整体技术水平。', '徐汇区汇银广场南楼7楼', '2019-09-30', 'JAVA');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  `nickname` varchar(50) DEFAULT '',
  `type` varchar(50) NOT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `com_msg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'lqd', '202cb962ac59075b964b07152d234b70', 'qwe@132.com', 'qwe', 'user', 'man', null, null, null);
INSERT INTO `user` VALUES ('3', 'jack', '828fd9255753432d51df95eb62d61722', 'asdf@qq.com', 'jack', 'company', 'woman', '易聘股份有限公司', '阿里', '全球500强');
