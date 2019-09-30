/*
MySQL Backup
Source Server Version: 5.5.5
Source Database: recruitdb
Date: 2019/9/30 15:17:13
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
  `companyname` varchar(50) NOT NULL,
  `addr` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyname` (`companyname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司信息';

-- ----------------------------
--  Table structure for `cv_list`
-- ----------------------------
DROP TABLE IF EXISTS `cv_list`;
CREATE TABLE `cv_list` (
  `user_id` int(50) NOT NULL,
  `cv_id` int(50) NOT NULL,
  PRIMARY KEY (`cv_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cv_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `cv_list_ibfk_2` FOREIGN KEY (`cv_id`) REFERENCES `cv_msg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户的简历列表';

-- ----------------------------
--  Table structure for `cv_msg`
-- ----------------------------
DROP TABLE IF EXISTS `cv_msg`;
CREATE TABLE `cv_msg` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` int(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `tel` int(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `addr` varchar(50) NOT NULL,
  `speciality` text NOT NULL COMMENT '所学专业',
  `skill` text NOT NULL COMMENT '掌握技能',
  `position` text NOT NULL COMMENT '职位意向',
  `profile` text NOT NULL COMMENT '个人简介',
  `salary` int(50) NOT NULL COMMENT '薪资意向',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历信息';

-- ----------------------------
--  Table structure for `received_cv`
-- ----------------------------
DROP TABLE IF EXISTS `received_cv`;
CREATE TABLE `received_cv` (
  `com_id` int(50) NOT NULL,
  `cv_id` int(50) NOT NULL,
  PRIMARY KEY (`com_id`,`cv_id`),
  KEY `cv_id` (`cv_id`),
  CONSTRAINT `received_cv_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `company` (`id`),
  CONSTRAINT `received_cv_ibfk_2` FOREIGN KEY (`cv_id`) REFERENCES `cv_msg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司所收到的简历 ';

-- ----------------------------
--  Table structure for `recruit_msg`
-- ----------------------------
DROP TABLE IF EXISTS `recruit_msg`;
CREATE TABLE `recruit_msg` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(50) NOT NULL COMMENT '职位名称',
  `qualification` varchar(50) NOT NULL COMMENT '学历要求',
  `skill` varchar(100) NOT NULL COMMENT '技能需求',
  `max_age` int(50) NOT NULL,
  `min_age` int(50) NOT NULL,
  `max_sal` int(50) NOT NULL,
  `min_sal` int(50) NOT NULL,
  `position_msg` text NOT NULL COMMENT '职位简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招聘简章';

-- ----------------------------
--  Table structure for `rec_list`
-- ----------------------------
DROP TABLE IF EXISTS `rec_list`;
CREATE TABLE `rec_list` (
  `com_id` int(50) NOT NULL,
  `rec_id` int(50) NOT NULL,
  PRIMARY KEY (`com_id`,`rec_id`),
  KEY `rec_id` (`rec_id`),
  CONSTRAINT `rec_list_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `company` (`id`),
  CONSTRAINT `rec_list_ibfk_2` FOREIGN KEY (`rec_id`) REFERENCES `recruit_msg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招聘信息列表';

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
--  Records 
-- ----------------------------
