/*
我是第一个访问的
Source Host           : localhost:3306
Source Database       : fc

Date: 2018-03-14 
*/

SET FOREIGN_KEY_CHECKS=0;

create database fc;

CREATE TABLE `festival`(
	`fid`    int(4) NOT NULL AUTO_INCREMENT,
	`user_id` int(11) NOT NULL DEFAULT '1',
	`fname`  varchar(64)  NOT NULL,
	`fdate`  varchar(64)  NOT NULL,
	`forigin`  mediumtext NOT NULL,
	`fprogress` mediumtext NOT NULL,
	`fcustom` mediumtext NOT NULL,
	`feffect` mediumtext NOT NULL,
	`fliterature` mediumtext NOT NULL,
	`fother`  mediumtext NOT NULL,
	`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	 PRIMARY KEY (`fid`),
	CONSTRAINT `fk_fuid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `article` (
  `articleid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `sys_category_id` int(11) NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `summary` mediumtext NOT NULL,
  `publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_top` bit(1) NOT NULL DEFAULT b'0',
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`articleid`),
  KEY `fk_auid` (`user_id`),
  KEY `fk_ascategory` (`sys_category_id`),
  CONSTRAINT `fk_auid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_ascategory` FOREIGN KEY (`sys_category_id`) REFERENCES `sys_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `article_id` int(11) NOT NULL DEFAULT '0',
  `content` LONGTEXT NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_cuid` (`user_id`),
  KEY `fk_caid` (`article_id`),
  CONSTRAINT `fk_cuid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_caid` FOREIGN KEY (`article_id`) REFERENCES `article` (`articleid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `bbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `content` LONGTEXT NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_cuid` (`user_id`),
  CONSTRAINT `fk_buid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `sys_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL DEFAULT '0',
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '0',
  `userpwd` varchar(64) NOT NULL DEFAULT '0',
  `userpermission` int(1) NOT NULL DEFAULT '1',
  `userregdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userinfo` mediumtext,   --新加
  `integral` int(11) NOT NULL DEFAULT '0',   --新加
  PRIMARY KEY (`id`),
  KEY `index_user` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `user`(id,username,userpwd,userpermission) VALUES ('1', 'Jae', 'jae597982968', '0');

INSERT INTO `sys_category`(id,category_name,is_delete) VALUES ('1', '春节', '');
INSERT INTO `sys_category` VALUES ('2', '元宵节',  '');
INSERT INTO `sys_category` VALUES ('3', '清明节', '');
INSERT INTO `sys_category` VALUES ('4', '端午节', '');
INSERT INTO `sys_category` VALUES ('5', '七夕节', '');
INSERT INTO `sys_category` VALUES ('6', '中秋节', '');
INSERT INTO `sys_category` VALUES ('7', '除夕', '');



) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


INSERT INTO `counter` VALUES ('1', '111');
