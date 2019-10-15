/*
MySQL Backup
Source Server Version: 5.5.5
Source Database: epindb
Date: 2019/10/10 11:52:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `companyname` varchar(50) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `msg` text DEFAULT NULL COMMENT '公司简介',
  `email` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyname` (`companyname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司信息';

-- ----------------------------
--  Table structure for `cv_msg`
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
INSERT INTO `cv_msg` VALUES ('31', '2', '姓名', '男', '手机号', '邮箱', '2019-09-30', '住址', '专业', '技能', '简介', '城市', '学校', '学习', '职位', '2019-10-01', '2019-10-02', '工作');
INSERT INTO `cv_msg` VALUES ('32', '2', '刘庆栋', '男', '4008208820', '321@163.com', '2019-09-30', '徐汇区汇银广场南楼7楼', '计算机', 'JAVA', '简介', '上海', '交大', '学习', '架构师', '2019-10-01', '2019-10-02', '开发');

-- ----------------------------
-- Table structure for `received_cv`
-- ----------------------------
DROP TABLE IF EXISTS `received_cv`;
CREATE TABLE `received_cv` (
  `user_id` int(50) NOT NULL,
  `cv_id` int(50) NOT NULL,
  PRIMARY KEY (`user_id`,`cv_id`),
  KEY `cv_id` (`cv_id`),
  CONSTRAINT `received_cv_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `received_cv_ibfk_2` FOREIGN KEY (`cv_id`) REFERENCES `cv_msg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司所收到的简历 ';

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
  `skill` varchar(100) NOT NULL COMMENT '技能需求',
  `sal` int(50) NOT NULL COMMENT '薪资',
  `position_msg` text NOT NULL COMMENT '职位简介',
  `addr` varchar(50) NOT NULL COMMENT '地址',
  `end_date` date NOT NULL COMMENT '截止日期',
  `category` varchar(255) NOT NULL COMMENT '职位分类',
  PRIMARY KEY (`id`),
  KEY `com_id` (`user_id`),
  CONSTRAINT `recruit_msg_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招聘简章';

-- ----------------------------
-- Records of recruit_msg
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'lqd', '123', '1321@132.com', 'qwe', '', 'asd', null, null, null);
