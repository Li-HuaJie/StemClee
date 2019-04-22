/*
SQLyog Ultimate v8.32 
MySQL - 5.5.23 : Database - stemcell
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stemcell` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `stemcell`;

/*Table structure for table `site_main` */

DROP TABLE IF EXISTS `site_main`;

CREATE TABLE `site_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '网站简称',
  `domain` varchar(50) DEFAULT NULL COMMENT '域名 不带http://',
  `link` varchar(200) DEFAULT NULL COMMENT '网址连接 带http://',
  `state` int(1) DEFAULT NULL COMMENT '状态 0禁用 1可用 2审核中',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `pic` varchar(200) DEFAULT NULL COMMENT '图片URL',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除状态 0=未删除 1=删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `site_main` */

insert  into `site_main`(`id`,`name`,`domain`,`link`,`state`,`createTime`,`updateTime`,`rank`,`pic`,`deleted`) values (1,'华生论坛','www.mn606.com','http://www.mn606.com',0,'2012-12-23 20:13:24','2013-01-09 22:37:32',0,'',0),(2,'美女之家','www.mn606.com','http://www.mn606.com',0,'2012-12-23 20:16:53','2013-01-11 22:14:09',0,'',0),(3,'532525','532532','http://532532.com',0,'2012-12-23 20:32:15','2012-12-23 20:32:15',0,'',1),(4,'百度','www.mn606.com','http://www.mn606.com',0,'2013-01-08 16:29:14','2013-01-08 16:29:14',0,'',1),(5,'11111','1111','http://www.mn606.com',0,'2013-01-09 16:55:23','2013-01-09 16:55:23',0,'',1),(6,'1112','222','http://www.sina.com',0,'2013-01-09 16:55:47','2013-01-09 16:55:47',0,'',1);

/*Table structure for table `site_type` */

DROP TABLE IF EXISTS `site_type`;

CREATE TABLE `site_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id 主键',
  `name` varchar(20) NOT NULL COMMENT '分类名称',
  `code` varchar(10) DEFAULT NULL COMMENT 'code 英文和数字',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `descr` varchar(250) DEFAULT NULL COMMENT '描述',
  `state` int(1) DEFAULT NULL COMMENT '状态 0=可用,1=禁用',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `site_type` */

insert  into `site_type`(`id`,`name`,`code`,`rank`,`descr`,`state`,`createTime`,`updateTime`) values (1,'美女论坛','mnlt',0,'美女论坛',0,'2012-12-23 20:06:45','2012-12-23 20:06:45'),(2,'美女网站','mnwz',0,'11',0,'2012-12-23 20:30:39','2013-01-06 19:05:45');

/*Table structure for table `site_type_rel` */

DROP TABLE IF EXISTS `site_type_rel`;

CREATE TABLE `site_type_rel` (
  `siteId` int(11) NOT NULL COMMENT '站点id 关联：site_main.id',
  `siteTypeId` int(11) NOT NULL COMMENT '站点分类id 关联：site_type.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `site_type_rel` */

insert  into `site_type_rel`(`siteId`,`siteTypeId`) values (1,2),(1,1),(2,1),(2,2);

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(100) DEFAULT NULL COMMENT '系统url',
  `parentId` int(10) DEFAULT NULL COMMENT ' 父id 关联sys_menu.id',
  `deleted` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除,0=未删除，1=已删除',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `actions` varchar(500) DEFAULT '0' COMMENT '注册Action 按钮|分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`name`,`url`,`parentId`,`deleted`,`createTime`,`updateTime`,`rank`,`actions`) values (1,'系统管理','',NULL,0,'2012-12-23 17:21:58','2013-01-10 22:30:50',1,''),(2,'菜单管理','/sysMenu/menu.shtml',1,0,'2012-12-23 18:18:32','2013-01-13 02:29:33',0,'dataList.do'),(3,'站点管理','',NULL,0,'2012-12-23 20:26:35','2012-12-23 21:16:51',1,''),(4,'站点信息管理','/siteMain/list.shtml',3,0,'2012-12-23 20:26:53','2013-01-13 01:24:47',0,'dataList.do|/siteType/typeListJson.do'),(5,'站点类型','/siteType/list.shtml',3,0,'2012-12-23 20:28:23','2013-01-13 01:20:46',0,'dataList.do'),(6,'操作员管理','/sysUser/list.shtml',1,0,'2012-12-23 22:15:33','2013-01-13 00:57:51',0,'dataList.do'),(7,'角色管理','/sysRole/role.shtml',1,0,'2012-12-24 22:17:51','2013-01-13 01:15:00',0,'dataList.do|/sysMenu/getMenuTree.do'),(8,'操作员授权','/sysUser/userRole.shtml',1,0,'2013-01-06 11:42:26','2013-01-14 11:35:04',0,'userList.do|/sysRole/loadRoleList.do');

/*Table structure for table `sys_menu_btn` */

DROP TABLE IF EXISTS `sys_menu_btn`;

CREATE TABLE `sys_menu_btn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` int(11) NOT NULL COMMENT ' 菜单id关联 sys_menu.id',
  `btnName` varchar(30) DEFAULT NULL COMMENT '按钮名称',
  `btnType` varchar(30) DEFAULT NULL COMMENT '按钮类型，用于列表页显示的按钮',
  `actionUrls` varchar(250) DEFAULT NULL COMMENT 'url注册，用"," 分隔 。用于权限控制UR',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu_btn` */

insert  into `sys_menu_btn`(`id`,`menuid`,`btnName`,`btnType`,`actionUrls`) values (5,2,'添加','add','save.do'),(6,2,'修改','edit','getId.do|save.do'),(7,2,'删除','remove','delete.do'),(8,6,'添加','add','save.do'),(9,6,'修改','edit','getId.do|save.do'),(10,6,'修改密码','editPwd','updatePwd.do'),(11,6,'删除','remove','delete.do'),(12,7,'添加','add','save.do'),(13,7,'修改','edit','getId.do|save.do'),(14,7,'删除','remove','delete.do'),(15,8,'授权','authRole','/sysUser/getUser.do|/sysUser/addUserRole.do'),(16,5,'添加','add','save.do'),(17,5,'修改','edit','getId.do|save.do'),(18,5,'删除','remove','delete.do'),(19,4,'添加','add','save.do'),(20,4,'修改','edit','getId.do|save.do'),(21,4,'删除','remove','delete.do');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `roleName` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建人',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `updateBy` int(11) DEFAULT NULL COMMENT '修改人',
  `state` int(1) DEFAULT NULL COMMENT '状态0=可用 1=禁用',
  `descr` varchar(200) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`roleName`,`createTime`,`createBy`,`updateTime`,`updateBy`,`state`,`descr`) values (1,'系统管理员','2013-01-05 16:07:00',NULL,'2013-01-14 11:28:29',NULL,0,NULL),(3,'管理员','2013-01-06 10:45:06',NULL,'2013-01-14 11:22:38',NULL,0,NULL),(18,'站点管理','2013-01-13 01:21:46',NULL,'2013-01-13 01:21:54',NULL,0,'站点管理'),(19,'测试管理员','2013-01-13 17:10:21',NULL,'2013-01-13 19:17:24',NULL,0,NULL);

/*Table structure for table `sys_role_rel` */

DROP TABLE IF EXISTS `sys_role_rel`;

CREATE TABLE `sys_role_rel` (
  `roleId` int(11) NOT NULL COMMENT '角色主键 sys_role.id',
  `objId` int(11) NOT NULL COMMENT '关联主键 type=0管理sys_menu.id, type=1关联sys_user.id',
  `relType` int(1) DEFAULT NULL COMMENT '关联类型 0=菜单,1=用户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_rel` */

insert  into `sys_role_rel`(`roleId`,`objId`,`relType`) values (1,3,1),(18,3,0),(18,4,0),(18,5,0),(18,19,2),(18,20,2),(18,16,2),(18,17,2),(18,5,1),(3,5,1),(19,8,0),(19,1,0),(19,2,0),(19,6,0),(19,7,0),(19,3,0),(19,4,0),(19,5,0),(19,7,2),(19,8,2),(19,10,2),(19,13,2),(19,15,2),(19,19,2),(19,20,2),(19,16,2),(19,17,2),(3,8,0),(3,1,0),(3,2,0),(3,6,0),(3,7,0),(3,5,2),(3,8,2),(3,9,2),(3,12,2),(3,13,2),(3,15,2),(1,3,0),(1,4,0),(1,5,0),(1,19,2),(1,20,2),(1,21,2),(1,16,2),(1,17,2),(1,18,2),(18,6,1),(3,6,1),(1,6,1),(19,6,1);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `email` varchar(50) NOT NULL COMMENT '邮箱也是登录帐号',
  `pwd` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `nickName` varchar(50) DEFAULT NULL COMMENT '昵称',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态 0=可用,1=禁用',
  `loginCount` int(11) DEFAULT NULL COMMENT '登录总次数',
  `loginTime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `deleted` int(1) NOT NULL DEFAULT '0' COMMENT '删除状态 0=未删除,1=已删除',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `createBy` int(11) DEFAULT NULL COMMENT '创建人',
  `updateBy` int(11) DEFAULT NULL COMMENT '修改人',
  `superAdmin` int(1) NOT NULL DEFAULT '0' COMMENT '是否超级管理员 0= 不是，1=是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`email`,`pwd`,`nickName`,`state`,`loginCount`,`loginTime`,`deleted`,`createTime`,`updateTime`,`createBy`,`updateBy`,`superAdmin`) values (1,'admin@qq.com','C33367701511B4F6020EC61DED352059','超级大Boss',0,121,'2013-01-14 11:34:23',0,'2012-12-23 23:01:15','2013-01-14 11:34:23',NULL,NULL,1),(3,'362217990@qq.com','E10ADC3949BA59ABBE56E057F20F883E','vowo',0,1,'2013-01-07 12:53:29',0,'2012-12-23 23:17:39','2013-01-13 03:33:41',NULL,NULL,0),(5,'wolf@qq.com','E10ADC3949BA59ABBE56E057F20F883E','大灰狼',0,69,'2013-01-14 14:32:12',0,'2013-01-07 12:30:10','2013-01-14 14:32:12',NULL,NULL,0),(6,'youke@qq.com',NULL,' 游客',0,NULL,NULL,0,'2013-01-13 03:41:32','2013-01-13 03:41:32',NULL,NULL,0);

-- 信息请求table
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `site_information`;
CREATE TABLE `information` (
	id int(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(32) NOT NULL COMMENT '姓名',
	city VARCHAR(32) COMMENT '城市',
	mobile VARCHAR(32) COMMENT '电话',
	email VARCHAR(32) NOT NULL COMMENT '电子邮箱',
	know VARCHAR(32) COMMENT '如何认识',
	inform VARCHAR(32) COMMENT '了解信息',
	state INT(11) COMMENT '0未读,1解决,2审核',
	create_time DATETIME COMMENT '反馈时间',
	update_time DATETIME COMMENT '修改时间',
	PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

insert into `site_information` (`id`,`name`,`city`,`mobile`,`email`,`know`,`inform`,`state`,`create_time`,`update_time`) values (1,'测试','厦门','18860043300','123456@qq.com','因特网','干细胞',0,NOW(),NOW()),(2,'测试2','厦门','18860043300','123456@qq.com','医生','肿瘤科',1,NOW(),NOW()),(3,'测试3','厦门','18860043300','123456@qq.com','课程','产前检查',2,NOW(),NOW());

-- 合作table
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `site_cooperation`;
CREATE TABLE `cooperation` (
	id int(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(32) NOT NULL COMMENT '姓名',
	email VARCHAR(32) NOT NULL COMMENT '电子邮箱',
	mobile VARCHAR(32) COMMENT '电话',
	descrizione VARCHAR(255) COMMENT '个人描述',
	resume VARCHAR(255) COMMENT '简历文件',
	create_time DATETIME COMMENT '提交时间',
	PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8;

-- 专家table
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `site_experts`;
CREATE TABLE `experts` (
	id int(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(32) COMMENT '姓名',
	presentation VARCHAR(255) COMMENT '简介',
	status SMALLINT DEFAULT '1' COMMENT '状态 默认1启动',
	photo VARCHAR(255) COMMENT '照片',
	create_time DATETIME,
	PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8;

-- 新闻评论
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `site_news`;
CREATE TABLE `news` (
	id int(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(32) COMMENT '杂志名称',
	title VARCHAR(32) COMMENT '标题',
	category VARCHAR(32) COMMENT '文章类别',
	status SMALLINT DEFAULT '1' COMMENT '状态 默认1启动',
	file VARCHAR(255) COMMENT '文章文件',
	create_time DATETIME COMMENT '创建时间',
	PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8;

-- 视频评论
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `site_video`;
CREATE TABLE `video`(
	id int(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(32) COMMENT '名称',
	presentation VARCHAR(32) COMMENT '简介',
	status SMALLINT DEFAULT '1' COMMENT '状态 默认1启用',
	video VARCHAR(255) COMMENT '视频',
	create_time DATETIME COMMENT '上传时间',
	PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

-- 证书
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `site_certificate`;
CREATE TABLE `certificate` (
	id int(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(32) COMMENT '认证名称',
	region VARCHAR(32) COMMENT '认证地区',
	status SMALLINT DEFAULT '1' COMMENT '状态 默认1启用',
	file VARCHAR(255) COMMENT '证书文件',
	create_time DATETIME,
	PRIMARY KEY(id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
