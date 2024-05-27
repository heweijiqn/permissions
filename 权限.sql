/*
SQLyog Professional
MySQL - 5.7.19 : Database - permissions
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`permissions` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `permissions`;

/*Table structure for table `sys_dept` */

CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '上级部门id',
  `tree_path` varchar(255) DEFAULT ',' COMMENT '树结构',
  `sort_value` int(11) DEFAULT '1' COMMENT '排序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态（1正常 0停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2028 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='组织机构';

/*Data for the table `sys_dept` */

LOCK TABLES `sys_dept` WRITE;

insert  into `sys_dept`(`id`,`name`,`parent_id`,`tree_path`,`sort_value`,`leader`,`phone`,`status`,`create_time`,`update_time`,`is_deleted`) values 
(1,'世九有限公司',0,',1,',1,'张怀民','15659090912',1,'2023-06-20 21:25:57','2023-06-20 21:25:57',0),
(10,'北京分公司',1,',1,10,',1,'李总','18790007789',1,'2023-06-20 21:26:04','2023-06-20 21:26:04',0),
(20,'上海分公司',1,',1,20,',1,'王总','15090987678',1,'2023-06-20 21:26:12','2023-06-20 21:26:12',0),
(30,'深圳分公司',1,',1,30,',1,'李总','15090987678',1,'2023-06-20 21:26:24','2023-06-20 21:26:24',0),
(1010,'行政部门',10,',1,10,1010,',1,'李总','15090987670',1,'2023-06-20 21:28:01','2023-06-20 21:28:01',0),
(1020,'运营部门',10,',1,10,1020,',1,'王总','15090987678',1,'2023-06-20 21:22:21','2023-06-20 21:22:21',0),
(1021,'财务部门',10,',1,10,1010,1021,',1,'王总','15090987678',1,'2023-06-20 23:09:19','2023-06-20 23:09:19',0),
(1022,'法务部门',10,',1,10,1010,1022,',1,'王总','15090987678',1,'2023-06-21 15:15:28','2023-06-21 15:15:28',0),
(1024,'IT部门',10,',1,10,1010,1024,',1,'李总','15090987678',1,'2023-06-20 23:09:25','2023-06-20 23:09:25',0),
(1025,'客服部',10,',1,10,1020,1025,',1,'李总','15090987678',1,'2023-06-20 23:09:38','2023-06-20 23:09:38',0),
(1026,'市场部门',10,',1,10,1020,1026,',1,'李总','15090987678',1,'2023-06-20 23:09:41','2023-06-20 23:09:41',0),
(1027,'生产部门',10,',1,10,1020,1027,',1,'李总','15090987678',1,'2023-06-20 23:09:43','2023-06-20 23:09:43',0),
(1028,'研发部门',10,',1,10,1020,1028,',1,'李总','15090987678',1,'2023-06-20 23:09:49','2023-06-20 23:09:49',0),
(2022,'营销部',20,',',1,'王总','15090987679',1,'2023-06-21 16:04:00','2023-06-21 16:04:43',0),
(2023,'游戏开发部',30,',',1,'何总','15816474932',1,'2023-06-21 16:14:41',NULL,0),
(2024,'研发部',30,',',1,'何总','15090987679',1,'2023-06-21 20:41:37',NULL,0),
(2025,'公关部',20,',',1,'何总','15816474932',1,'2023-06-21 20:51:38',NULL,0),
(2026,'清洁部',10,',',1,'李总','15090987670',1,'2023-06-23 12:38:48',NULL,0),
(2027,'开发部',10,',',1,'何·总','15816474932',1,'2023-06-25 11:23:02','2023-06-25 11:23:02',1);

UNLOCK TABLES;

/*Table structure for table `sys_login_log` */

CREATE TABLE `sys_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

/*Data for the table `sys_login_log` */

LOCK TABLES `sys_login_log` WRITE;

insert  into `sys_login_log`(`id`,`username`,`ipaddr`,`status`,`msg`,`access_time`,`create_time`,`update_time`,`is_deleted`) values 
(3,'admin','127.0.0.1',1,'登录成功','2023-06-01 19:26:17','2023-06-22 19:26:24','2023-06-22 19:26:24',0),
(4,'admin','127.0.0.1',1,'登录成功','2023-05-29 19:26:25','2023-06-22 19:26:28','2023-06-22 19:26:28',0),
(5,'hwj1218','127.0.0.1',1,'登录成功','2023-05-30 19:26:29','2023-06-22 21:37:17','2023-06-22 21:37:17',0),
(6,'admin','127.0.0.1',1,'登录成功','2023-05-01 19:26:33','2023-06-22 19:26:40','2023-06-22 19:26:40',0),
(7,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-22 19:06:48',NULL,0),
(8,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-22 19:10:28',NULL,0),
(9,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-22 19:34:45',NULL,0),
(10,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-06-22 19:43:13',NULL,0),
(11,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-22 20:00:32',NULL,0),
(12,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-22 20:12:51',NULL,0),
(13,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-22 20:33:00',NULL,0),
(14,'hwj1218','127.0.0.1',1,'登录成功',NULL,'2023-06-22 21:00:58',NULL,0),
(15,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-22 21:01:03',NULL,0),
(16,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-22 21:34:17',NULL,0),
(17,'admin','192.168.233.1',1,'登录成功',NULL,'2023-06-22 23:01:30',NULL,0),
(18,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-23 17:17:12',NULL,0),
(19,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-24 12:41:46',NULL,0),
(20,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-24 12:44:23',NULL,0),
(21,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 08:56:54',NULL,0),
(22,'hwj2023','127.0.0.1',1,'登录成功',NULL,'2023-06-25 08:58:59',NULL,0),
(23,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 09:06:26',NULL,0),
(24,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:13:20',NULL,0),
(25,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:29:15',NULL,0),
(26,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:29:16',NULL,0),
(27,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:29:18',NULL,0),
(28,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:29:18',NULL,0),
(29,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:31:32',NULL,0),
(30,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:31:33',NULL,0),
(31,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:31:41',NULL,0),
(32,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:31:42',NULL,0),
(33,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:32:06',NULL,0),
(34,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:32:45',NULL,0),
(35,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:34:52',NULL,0),
(36,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 10:34:53',NULL,0),
(37,'hej1111','127.0.0.1',1,'登录成功',NULL,'2023-06-25 11:16:57',NULL,0),
(38,'admin','127.0.0.1',1,'登录成功',NULL,'2023-06-25 11:21:48',NULL,0),
(39,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-07-30 21:52:19',NULL,0),
(40,'admin','192.168.31.215',1,'登录成功',NULL,'2023-07-30 21:53:32',NULL,0),
(41,'admin','192.168.31.215',1,'登录成功',NULL,'2023-08-01 01:58:19',NULL,0),
(42,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-01 18:21:41',NULL,0),
(43,'admin','127.0.0.1',1,'登录成功',NULL,'2023-08-02 20:04:27',NULL,0),
(44,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-12-11 17:14:41',NULL,0),
(45,'admin','127.0.0.1',1,'登录成功',NULL,'2023-12-11 17:46:34',NULL,0),
(46,'admin','127.0.0.1',1,'登录成功',NULL,'2023-12-12 12:11:09',NULL,0),
(47,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-12-13 20:22:58',NULL,0),
(48,'admin','127.0.0.1',1,'登录成功',NULL,'2023-12-13 21:13:23',NULL,0),
(49,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-12-14 09:11:54',NULL,0),
(50,'admin','127.0.0.1',1,'登录成功',NULL,'2023-12-14 09:28:38',NULL,0),
(51,'admin','0:0:0:0:0:0:0:1',1,'登录成功',NULL,'2023-12-14 09:30:28',NULL,0),
(52,'admin','127.0.0.1',1,'登录成功',NULL,'2023-12-14 09:31:34',NULL,0),
(53,'admin','127.0.0.1',1,'登录成功',NULL,'2023-12-18 16:13:38',NULL,0);

UNLOCK TABLES;

/*Table structure for table `sys_menu` */

CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属上级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `sort_value` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';

/*Data for the table `sys_menu` */

LOCK TABLES `sys_menu` WRITE;

insert  into `sys_menu`(`id`,`parent_id`,`name`,`type`,`path`,`component`,`perms`,`icon`,`sort_value`,`status`,`create_time`,`update_time`,`is_deleted`) values 
(2,0,'系统管理',0,'system','Layout',NULL,'el-icon-s-tools',1,1,'2021-05-31 18:05:37','2022-06-09 09:23:24',0),
(3,2,'用户管理',1,'sysUser','system/sysUser/list','','el-icon-s-custom',1,1,'2021-05-31 18:05:37','2022-06-09 09:22:47',0),
(4,2,'角色管理',1,'sysRole','system/sysRole/list','','el-icon-user-solid',2,1,'2021-05-31 18:05:37','2022-06-09 09:37:18',0),
(5,2,'菜单管理',1,'sysMenu','system/sysMenu/list','','el-icon-s-unfold',3,1,'2021-05-31 18:05:37','2022-06-09 09:37:21',0),
(6,3,'查看',2,NULL,NULL,'bnt.sysUser.list',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(7,3,'添加',2,NULL,NULL,'bnt.sysUser.add',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(8,3,'修改',2,NULL,NULL,'bnt.sysUser.update',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(9,3,'删除',2,NULL,NULL,'bnt.sysUser.remove',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(10,4,'查看',2,NULL,NULL,'bnt.sysRole.list',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(11,4,'添加',2,NULL,NULL,'bnt.sysRole.add',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(12,4,'修改',2,NULL,NULL,'bnt.sysRole.update',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(13,4,'删除',2,NULL,NULL,'bnt.sysRole.remove',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(14,5,'查看',2,NULL,NULL,'bnt.sysMenu.list',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(15,5,'添加',2,NULL,NULL,'bnt.sysMenu.add',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(16,5,'修改',2,NULL,NULL,'bnt.sysMenu.update',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(17,5,'删除',2,NULL,NULL,'bnt.sysMenu.remove',NULL,1,1,'2021-05-31 18:05:37','2022-06-09 09:22:38',0),
(18,3,'分配角色',2,NULL,NULL,'bnt.sysUser.assignRole',NULL,1,1,'2022-05-23 17:14:32','2022-06-09 09:22:38',0),
(19,4,'分配权限',2,'assignAuth','system/sysRole/assignAuth','bnt.sysRole.assignAuth',NULL,1,1,'2022-05-23 17:18:14','2022-06-09 09:22:38',0),
(20,2,'部门管理',1,'sysDept','system/sysDept/list','','el-icon-s-operation',4,1,'2022-05-24 10:07:05','2023-12-13 21:17:50',1),
(21,20,'查看',2,NULL,NULL,'bnt.sysDept.list',NULL,1,1,'2022-05-24 10:07:44','2023-12-13 21:17:36',1),
(22,2,'岗位管理',1,'sysPost','system/sysPost/list','','el-icon-more-outline',5,1,'2022-05-24 10:25:30','2023-12-13 21:18:07',1),
(23,22,'查看',2,NULL,NULL,'bnt.sysPost.list',NULL,1,1,'2022-05-24 10:25:45','2023-12-13 21:18:05',1),
(24,20,'添加',2,NULL,NULL,'bnt.sysDept.add',NULL,1,1,'2022-05-25 15:31:27','2023-12-13 21:17:38',1),
(25,20,'修改',2,NULL,NULL,'bnt.sysDept.update',NULL,1,1,'2022-05-25 15:31:41','2023-12-13 21:17:42',1),
(26,20,'删除',2,NULL,NULL,'bnt.sysDept.remove',NULL,1,1,'2022-05-25 15:31:59','2023-12-13 21:17:44',1),
(27,22,'添加',2,NULL,NULL,'bnt.sysPost.add',NULL,1,1,'2022-05-25 15:32:44','2023-12-13 21:18:02',1),
(28,22,'修改',2,NULL,NULL,'bnt.sysPost.update',NULL,1,1,'2022-05-25 15:32:58','2023-12-13 21:18:00',1),
(29,22,'删除',2,NULL,NULL,'bnt.sysPost.remove',NULL,1,1,'2022-05-25 15:33:11','2023-12-13 21:17:58',1),
(30,34,'操作日志',1,'sysOperLog','system/sysOperLog/list','','el-icon-document-remove',7,1,'2022-05-26 16:09:59','2023-06-22 17:34:13',0),
(31,30,'查看',2,NULL,NULL,'bnt.sysOperLog.list',NULL,1,1,'2022-05-26 16:10:17','2023-06-22 17:34:23',0),
(32,34,'登录日志',1,'sysLoginLog','system/sysLoginLog/list','','el-icon-s-goods',8,1,'2022-05-26 16:36:13','2022-06-09 09:39:24',0),
(33,32,'查看',2,NULL,NULL,'bnt.sysLoginLog.list',NULL,1,1,'2022-05-26 16:36:31','2022-06-09 09:36:36',0),
(34,2,'日志管理',0,'log','ParentView','','el-icon-tickets',6,1,'2022-05-31 13:23:07','2022-06-09 09:39:22',0),
(37,3,'修改状态',2,'','','bnt.sysUser.updateStatus','',1,1,'2023-06-21 16:55:26','2023-06-21 16:55:26',0),
(38,4,'批量删除',2,'','','bnt.sysRole.batchRemove','',1,1,'2023-06-21 20:05:59','2023-06-21 20:05:59',0),
(39,20,'修改状态',2,'','','bnt.sysDept.updateStatus','',1,1,'2023-06-21 20:39:28','2023-12-13 21:17:46',1),
(40,22,'批量删除',2,'','','bnt.sysPost.batchRemove','',1,1,'2023-06-21 23:54:53','2023-12-13 21:17:56',1),
(41,22,'修改状态',2,'','','bnt.sysPost.updateStatus','',1,1,'2023-06-22 14:20:29','2023-12-13 21:17:54',1),
(42,30,'删除',2,'','','bnt.sysOperLog.delete','',1,1,'2023-06-22 21:27:17','2023-06-22 21:27:17',0),
(43,30,'批量删除',2,'','','bnt.sysOperLog.batchRemove','',1,1,'2023-06-22 21:27:45','2023-06-22 21:27:45',0),
(44,32,'批量删除',2,'','','bnt.sysLoginLog.batchRemove','',1,1,'2023-06-22 21:28:12','2023-06-22 21:28:12',0),
(45,32,'删除',2,'','','bnt.sysLoginLog.delete','',1,1,'2023-06-22 21:29:27','2023-06-22 21:29:27',0);

UNLOCK TABLES;

/*Table structure for table `sys_oper_log` */

CREATE TABLE `sys_oper_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(20) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` varchar(20) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

LOCK TABLES `sys_oper_log` WRITE;

insert  into `sys_oper_log`(`id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`create_time`,`update_time`,`is_deleted`) values 
(98,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1687362893000,\"type\":2,\"parentId\":22,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1687362893000,\"param\":{},\"name\":\"批量删除\",\"perms\":\"bnt.sysPost.batchRemove\",\"id\":\"40\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-22 22:08:29','2023-06-22 22:08:29',1),
(101,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1687440465000,\"type\":2,\"parentId\":30,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1687440465000,\"param\":{},\"name\":\"批量删除\",\"perms\":\"bnt.sysOperLog.batchRemove\",\"id\":\"43\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:30:25',NULL,0),
(102,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1687440492000,\"type\":2,\"parentId\":32,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1687440492000,\"param\":{},\"name\":\"批量删除\",\"perms\":\"bnt.sysLoginLog.batchRemove\",\"id\":\"44\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-23 12:43:22','2023-06-23 12:43:22',1),
(103,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1687440567000,\"type\":2,\"parentId\":32,\"path\":\"\",\"sortValue\":1,\"component\":\"\",\"isDeleted\":0,\"children\":[],\"createTime\":1687440567000,\"param\":{},\"name\":\"删除\",\"perms\":\"bnt.sysLoginLog.delete\",\"id\":\"45\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:30:38',NULL,0),
(104,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:30:51',NULL,0),
(105,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"1\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"11\",\"12\",\"13\",\"19\",\"38\",\"5\",\"14\",\"15\",\"16\",\"17\",\"20\",\"21\",\"24\",\"25\",\"26\",\"39\",\"22\",\"23\",\"27\",\"28\",\"29\",\"40\",\"41\",\"34\",\"30\",\"31\",\"42\",\"43\",\"32\",\"33\",\"44\",\"45\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:31:02',NULL,0),
(106,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:31:03',NULL,0),
(107,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:31:58',NULL,0),
(108,'登录日志管理','DELETE','com.hwj.system.controller.SysLoginLogController.remove()','DELETE','MANAGE','admin','','/admin/system/sysLoginLog/remove/5','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:34:25',NULL,0),
(109,'登录日志管理','DELETE','com.hwj.system.controller.SysLoginLogController.batchRemove()','DELETE','MANAGE','admin','','/admin/system/sysLoginLog/batchRemove','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:37:02',NULL,0),
(110,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:42:23',NULL,0),
(111,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:54:14',NULL,0),
(112,'操作日志管理','DELETE','com.hwj.system.controller.SysOperLogController.remove()','DELETE','MANAGE','admin','','/admin/system/sysOperLog/remove/70','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:56:26',NULL,0),
(113,'操作日志管理','DELETE','com.hwj.system.controller.SysOperLogController.remove()','DELETE','MANAGE','admin','','/admin/system/sysOperLog/remove/71','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:56:28',NULL,0),
(114,'操作日志管理','DELETE','com.hwj.system.controller.SysOperLogController.remove()','DELETE','MANAGE','admin','','/admin/system/sysOperLog/remove/69','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-22 21:56:31',NULL,0),
(115,'操作日志管理','DELETE','com.hwj.system.controller.SysOperLogController.batchRemove()','DELETE','MANAGE','admin','','/admin/system/sysOperLog/batchRemove','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-22 22:08:29',NULL,0),
(116,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-22 22:12:08',NULL,0),
(117,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-23 12:37:21',NULL,0),
(118,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/2/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":2,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试管理员\",\"updateTime\":1686836155000},{\"createTime\":1686736855000,\"description\":\"普通人员\",\"id\":\"11\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TESTROLE\",\"roleName\":\"测试人员\",\"updateTime\":1686836165000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-23 12:37:23',NULL,0),
(119,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-23 12:37:25',NULL,0),
(120,'部门管理','INSERT','com.hwj.system.controller.SysDeptController.save()','POST','MANAGE','admin','','/admin/system/sysDept/save','127.0.0.1','{\"leader\":\"李总\",\"parentId\":10,\"param\":{},\"phone\":\"15090987670\",\"name\":\"清洁部\",\"id\":\"2026\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-23 12:38:48',NULL,0),
(121,'操作日志管理','DELETE','com.hwj.system.controller.SysOperLogController.batchRemove()','DELETE','MANAGE','admin','','/admin/system/sysOperLog/batchRemove','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-23 12:43:22',NULL,0),
(122,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-23 13:39:00',NULL,0),
(123,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-23 17:17:43',NULL,0),
(124,'岗位管理','STATUS','com.hwj.system.controller.SysPostController.updateStatus()','GET','MANAGE','admin','','/admin/system/sysPost/updateStatus/12/0','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-23 17:37:07',NULL,0),
(125,'岗位管理','STATUS','com.hwj.system.controller.SysPostController.updateStatus()','GET','MANAGE','admin','','/admin/system/sysPost/updateStatus/12/1','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-23 17:37:12',NULL,0),
(126,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-23 17:38:25',NULL,0),
(127,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-24 14:04:08',NULL,0),
(128,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-24 14:16:36',NULL,0),
(129,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-25 08:57:32',NULL,0),
(130,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"2\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\",\"4\",\"10\",\"38\",\"5\",\"14\",\"20\",\"21\",\"22\",\"23\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 08:58:11',NULL,0),
(131,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-25 08:58:12',NULL,0),
(132,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"3\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 08:58:20',NULL,0),
(133,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-25 08:58:21',NULL,0),
(134,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/2/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":2,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试管理员\",\"updateTime\":1686836155000},{\"createTime\":1686736855000,\"description\":\"普通人员\",\"id\":\"11\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TESTROLE\",\"roleName\":\"测试人员\",\"updateTime\":1686836165000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-25 08:58:23',NULL,0),
(135,'用户角色管理','IMPORT','com.hwj.system.controller.SysUserRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserRole/doAssign','127.0.0.1','{\"roleIdList\":[\"2\"],\"userId\":\"6\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 08:58:38',NULL,0),
(136,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 08:58:43',NULL,0),
(137,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','hwj2023','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-25 08:59:04',NULL,0),
(138,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','hwj2023','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 09:06:24',NULL,0),
(139,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 09:14:52',NULL,0),
(140,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 10:13:25',NULL,0),
(141,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 10:30:07',NULL,0),
(142,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 10:32:04',NULL,0),
(143,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 10:32:10',NULL,0),
(144,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 10:33:16',NULL,0),
(145,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-25 10:36:10',NULL,0),
(146,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 11:16:15',NULL,0),
(147,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','hej1111','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 11:21:47',NULL,0),
(148,'部门管理','INSERT','com.hwj.system.controller.SysDeptController.save()','POST','MANAGE','admin','','/admin/system/sysDept/save','127.0.0.1','{\"leader\":\"何·总\",\"parentId\":10,\"param\":{},\"phone\":\"15816474932\",\"name\":\"开发部\",\"id\":\"2027\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 11:22:49',NULL,0),
(149,'部门管理','STATUS','com.hwj.system.controller.SysDeptController.updateStatus()','POST','MANAGE','admin','','/admin/system/sysDept/updateStatus/2027/0','127.0.0.1','2027 0','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 11:22:52',NULL,0),
(150,'部门管理','STATUS','com.hwj.system.controller.SysDeptController.updateStatus()','POST','MANAGE','admin','','/admin/system/sysDept/updateStatus/2027/1','127.0.0.1','2027 1','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 11:22:59',NULL,0),
(151,'部门管理','DELETE','com.hwj.system.controller.SysDeptController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysDept/remove/2027','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 11:23:02',NULL,0),
(152,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-25 11:23:41',NULL,0),
(153,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-25 11:25:18',NULL,0),
(154,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-25 11:28:08',NULL,0),
(155,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/2/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":2,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试管理员\",\"updateTime\":1686836155000},{\"createTime\":1686736855000,\"description\":\"普通人员\",\"id\":\"11\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TESTROLE\",\"roleName\":\"测试人员\",\"updateTime\":1686836165000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-06-25 11:28:09',NULL,0),
(156,'用户管理','DELETE','com.hwj.system.controller.SysUserController.remove()','DELETE','MANAGE','admin','','/admin/system/sysUser/remove/2','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-06-25 11:29:24',NULL,0),
(157,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','192.168.31.215','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-07-30 21:53:36',NULL,0),
(158,'岗位管理','STATUS','com.hwj.system.controller.SysPostController.updateStatus()','GET','MANAGE','admin','','/admin/system/sysPost/updateStatus/6/0','192.168.31.215','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-07-30 22:05:54',NULL,0),
(159,'岗位管理','STATUS','com.hwj.system.controller.SysPostController.updateStatus()','GET','MANAGE','admin','','/admin/system/sysPost/updateStatus/6/1','192.168.31.215','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-07-30 22:05:55',NULL,0),
(160,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','192.168.31.215','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-07-31 16:34:09',NULL,0),
(161,'用户管理','DELETE','com.hwj.system.controller.SysUserController.updateStatus()','GET','MANAGE','admin','','/admin/system/sysUser/updateStatus/5/0','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-01 18:21:48',NULL,0),
(162,'用户管理','DELETE','com.hwj.system.controller.SysUserController.updateStatus()','GET','MANAGE','admin','','/admin/system/sysUser/updateStatus/5/1','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-08-01 18:21:49',NULL,0),
(163,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-01 22:00:39',NULL,0),
(164,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-08-01 22:00:55',NULL,0),
(165,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-12-11 17:47:21',NULL,0),
(166,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-12-12 12:11:17',NULL,0),
(167,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-12-12 12:11:22',NULL,0),
(168,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/21','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:17:36',NULL,0),
(169,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/24','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:17:38',NULL,0),
(170,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/25','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:17:42',NULL,0),
(171,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/26','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:17:44',NULL,0),
(172,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/39','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:17:46',NULL,0),
(173,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/20','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:17:50',NULL,0),
(174,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/41','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:17:54',NULL,0),
(175,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/40','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:17:56',NULL,0),
(176,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/29','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:17:58',NULL,0),
(177,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/28','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:18:00',NULL,0),
(178,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/27','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:18:02',NULL,0),
(179,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/23','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:18:05',NULL,0),
(180,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/22','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:18:07',NULL,0),
(181,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-12-13 21:29:04',NULL,0),
(182,'用户角色管理','IMPORT','com.hwj.system.controller.SysUserRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserRole/doAssign','127.0.0.1','{\"roleIdList\":[\"2\"],\"userId\":\"1\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:28:50',NULL,0),
(183,'用户角色管理','IMPORT','com.hwj.system.controller.SysUserRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysUserRole/doAssign','127.0.0.1','{\"roleIdList\":[\"1\"],\"userId\":\"1\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:28:56',NULL,0),
(184,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:29:05',NULL,0),
(185,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/2/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":2,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试管理员\",\"updateTime\":1686836155000},{\"createTime\":1686736855000,\"description\":\"普通人员\",\"id\":\"11\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TESTROLE\",\"roleName\":\"测试人员\",\"updateTime\":1686836165000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:29:07',NULL,0),
(186,'角色管理','UPDATE','com.hwj.system.controller.SysRoleController.updateRole()','POST','MANAGE','admin','','/admin/system/sysRole/update','127.0.0.1','{\"isDeleted\":0,\"createTime\":1686736855000,\"param\":{},\"roleCode\":\"TESTROLE\",\"roleName\":\"测试\",\"description\":\"普通人员\",\"updateTime\":1686836165000,\"id\":\"11\"}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:29:17',NULL,0),
(187,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/2/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":2,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1686735659000,\"description\":\"测试管理员\",\"id\":\"5\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TEST\",\"roleName\":\"测试管理员\",\"updateTime\":1686836155000},{\"createTime\":1686736855000,\"description\":\"普通人员\",\"id\":\"11\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"TESTROLE\",\"roleName\":\"测试\",\"updateTime\":1686836165000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:29:17',NULL,0),
(188,'角色菜单分配','IMPORT','com.hwj.system.controller.SysRoleMenuController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRoleMenuAllot/doAssign','127.0.0.1','{\"roleId\":\"11\",\"menuIdList\":[\"2\",\"3\",\"6\",\"7\",\"8\",\"9\",\"18\",\"37\"]}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:29:30',NULL,0),
(189,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:29:31',NULL,0),
(190,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:29:36',NULL,0),
(191,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":3,\"path\":\"111\",\"sortValue\":1,\"component\":\"111\",\"param\":{},\"name\":\"\",\"perms\":\"1111\",\"id\":\"46\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:30:10',NULL,0),
(192,'菜单管理','UPDATE','com.hwj.system.controller.SysMenuController.updateById()','POST','MANAGE','admin','','/admin/system/sysMenu/update','127.0.0.1','{\"select\":false,\"icon\":\"\",\"updateTime\":1702517410000,\"type\":2,\"parentId\":3,\"path\":\"111111\",\"sortValue\":1,\"component\":\"111\",\"isDeleted\":0,\"children\":[],\"createTime\":1702517410000,\"param\":{},\"name\":\"\",\"perms\":\"1111\",\"id\":\"46\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:30:16',NULL,0),
(193,'菜单管理','DELETE','com.hwj.system.controller.SysMenuController.removeById()','DELETE','MANAGE','admin','','/admin/system/sysMenu/remove/46','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:30:18',NULL,0),
(194,'菜单管理','INSERT','com.hwj.system.controller.SysMenuController.save()','POST','MANAGE','admin','','/admin/system/sysMenu/save','127.0.0.1','{\"select\":false,\"icon\":\"\",\"type\":2,\"parentId\":3,\"path\":\"111\",\"sortValue\":1,\"component\":\"\",\"param\":{},\"name\":\"\",\"perms\":\"\",\"id\":\"47\",\"status\":1}','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:31:03',NULL,0),
(195,'退出登录','FORCE','com.hwj.system.controller.IndexController.logout()','POST','MANAGE','admin','','/admin/system/index/logout','127.0.0.1','','{\"code\":200,\"message\":\"成功\"}',1,'',NULL,'2023-12-14 09:31:07',NULL,0),
(196,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-12-18 16:39:17',NULL,0),
(197,'角色管理','OTHER','com.hwj.system.controller.SysRoleController.findPageQueryRole()','GET','MANAGE','admin','','/admin/system/sysRole/1/3','127.0.0.1','','{\"code\":200,\"data\":{\"current\":1,\"hitCount\":false,\"optimizeCountSql\":true,\"orders\":[],\"pages\":2,\"records\":[{\"createTime\":1622455758000,\"description\":\"超级管理员\",\"id\":\"1\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"SYSTEM\",\"roleName\":\"系统管理员\",\"updateTime\":1686755328000},{\"createTime\":1622507920000,\"description\":\"普通管理员\",\"id\":\"2\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"COMMON\",\"roleName\":\"普通管理员\",\"updateTime\":1687363013000},{\"createTime\":1654681144000,\"description\":\"用户管理员\",\"id\":\"3\",\"isDeleted\":0,\"param\":{},\"roleCode\":\"USER\",\"roleName\":\"用户管理员\",\"updateTime\":1686836147000}],\"searchCount\":true,\"size\":3,\"total\":5},\"message\":\"成功\"}',1,'',NULL,'2023-12-18 16:50:31',NULL,0);

UNLOCK TABLES;

/*Table structure for table `sys_post` */

CREATE TABLE `sys_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '岗位名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1正常 0停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

/*Data for the table `sys_post` */

LOCK TABLES `sys_post` WRITE;

insert  into `sys_post`(`id`,`post_code`,`name`,`description`,`status`,`create_time`,`update_time`,`is_deleted`) values 
(6,'General manager','总经理','',1,'2023-06-22 00:06:49','2023-06-22 00:06:49',0),
(7,'Internet consultation','网络咨询','',1,'2023-06-21 22:53:16','2023-06-21 22:53:16',0),
(8,'Operations Director','运营总监','',1,'2023-06-22 12:39:29','2023-06-22 12:39:29',1),
(9,'chairman','董事长','',1,'2023-06-22 12:39:33','2023-06-22 12:39:33',1),
(10,'cleaner','清洁工','',1,'2023-06-21 22:56:50','2023-06-22 12:38:49',0),
(11,'manager','经理','',1,'2023-06-21 23:39:53','2023-06-22 12:39:06',0),
(12,'Technical experts','技术专家','',1,'2023-06-22 12:39:53','2023-06-22 12:40:15',0);

UNLOCK TABLES;

/*Table structure for table `sys_role` */

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `sys_role` */

LOCK TABLES `sys_role` WRITE;

insert  into `sys_role`(`id`,`role_name`,`role_code`,`description`,`create_time`,`update_time`,`is_deleted`) values 
(1,'系统管理员','SYSTEM','超级管理员','2021-05-31 18:09:18','2023-06-14 23:08:48',0),
(2,'普通管理员','COMMON','普通管理员','2021-06-01 08:38:40','2023-06-21 23:56:53',0),
(3,'用户管理员','USER','用户管理员','2022-06-08 17:39:04','2023-06-15 21:35:47',0),
(5,'测试管理员','TEST','测试管理员','2023-06-14 17:40:59','2023-06-15 21:35:55',0),
(11,'测试','TESTROLE','普通人员','2023-06-14 18:00:55','2023-06-15 21:36:05',0);

UNLOCK TABLES;

/*Table structure for table `sys_role_menu` */

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL DEFAULT '0',
  `menu_id` bigint(11) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8 COMMENT='角色菜单';

/*Data for the table `sys_role_menu` */

LOCK TABLES `sys_role_menu` WRITE;

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`,`create_time`,`update_time`,`is_deleted`) values 
(1,2,2,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(2,2,3,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(3,2,6,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(4,2,7,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(5,2,8,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(6,2,9,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(7,2,18,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(8,2,4,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(9,2,10,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(10,2,11,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(11,2,12,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(12,2,13,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(13,2,19,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(14,2,5,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(15,2,14,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(16,2,15,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(17,2,16,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(18,2,17,'2022-06-02 16:11:27','2022-06-02 16:16:10',1),
(19,2,2,'2022-06-02 16:16:10','2022-06-09 09:26:34',1),
(20,2,3,'2022-06-02 16:16:10','2022-06-09 09:26:34',1),
(21,2,6,'2022-06-02 16:16:10','2022-06-09 09:26:34',1),
(22,2,7,'2022-06-02 16:16:10','2022-06-09 09:26:34',1),
(23,2,8,'2022-06-02 16:16:10','2022-06-09 09:26:34',1),
(24,2,2,'2022-06-09 09:26:34','2023-06-20 20:49:55',1),
(25,2,3,'2022-06-09 09:26:34','2023-06-20 20:49:55',1),
(26,2,6,'2022-06-09 09:26:34','2023-06-20 20:49:55',1),
(27,2,7,'2022-06-09 09:26:34','2023-06-20 20:49:55',1),
(28,2,8,'2022-06-09 09:26:34','2023-06-20 20:49:55',1),
(29,2,5,'2022-06-09 09:26:34','2023-06-20 20:49:55',1),
(30,2,14,'2022-06-09 09:26:34','2023-06-20 20:49:55',1),
(31,2,20,'2022-06-09 09:26:34','2023-06-20 20:49:55',1),
(32,2,21,'2022-06-09 09:26:34','2023-06-20 20:49:55',1),
(33,12,2,'2023-06-16 17:19:47','2023-06-16 17:57:52',1),
(34,12,3,'2023-06-16 17:19:47','2023-06-16 17:57:52',1),
(35,12,6,'2023-06-16 17:19:47','2023-06-16 17:57:52',1),
(36,12,7,'2023-06-16 17:19:47','2023-06-16 17:57:52',1),
(37,12,8,'2023-06-16 17:19:47','2023-06-16 17:57:52',1),
(38,12,9,'2023-06-16 17:19:47','2023-06-16 17:57:52',1),
(39,12,18,'2023-06-16 17:19:47','2023-06-16 17:57:52',1),
(40,1,2,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(41,1,3,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(42,1,6,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(43,1,7,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(44,1,8,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(45,1,9,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(46,1,18,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(47,1,4,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(48,1,10,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(49,1,11,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(50,1,12,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(51,1,13,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(52,1,19,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(53,1,5,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(54,1,14,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(55,1,15,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(56,1,16,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(57,1,17,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(58,1,20,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(59,1,21,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(60,1,24,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(61,1,25,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(62,1,26,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(63,1,22,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(64,1,23,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(65,1,27,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(66,1,28,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(67,1,29,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(68,1,34,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(69,1,32,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(70,1,33,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(71,1,36,'2023-06-16 17:58:07','2023-06-16 17:58:15',1),
(72,1,2,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(73,1,3,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(74,1,6,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(75,1,7,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(76,1,8,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(77,1,9,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(78,1,18,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(79,1,4,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(80,1,10,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(81,1,11,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(82,1,12,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(83,1,13,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(84,1,19,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(85,1,5,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(86,1,14,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(87,1,15,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(88,1,16,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(89,1,17,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(90,1,20,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(91,1,21,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(92,1,24,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(93,1,25,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(94,1,26,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(95,1,22,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(96,1,23,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(97,1,27,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(98,1,28,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(99,1,29,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(100,1,34,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(101,1,32,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(102,1,33,'2023-06-16 17:58:15','2023-06-21 20:38:43',1),
(103,3,2,'2023-06-16 22:42:16','2023-06-25 08:58:20',1),
(104,3,3,'2023-06-16 22:42:16','2023-06-25 08:58:20',1),
(105,3,6,'2023-06-16 22:42:16','2023-06-25 08:58:20',1),
(106,3,7,'2023-06-16 22:42:16','2023-06-25 08:58:20',1),
(107,3,8,'2023-06-16 22:42:16','2023-06-25 08:58:20',1),
(108,3,9,'2023-06-16 22:42:16','2023-06-25 08:58:20',1),
(109,3,18,'2023-06-16 22:42:16','2023-06-25 08:58:20',1),
(110,2,2,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(111,2,3,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(112,2,6,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(113,2,7,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(114,2,8,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(115,2,9,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(116,2,18,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(117,2,4,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(118,2,10,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(119,2,11,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(120,2,12,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(121,2,13,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(122,2,19,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(123,2,5,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(124,2,14,'2023-06-20 20:49:55','2023-06-20 20:54:59',1),
(125,2,2,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(126,2,3,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(127,2,6,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(128,2,7,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(129,2,8,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(130,2,9,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(131,2,18,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(132,2,4,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(133,2,10,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(134,2,11,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(135,2,5,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(136,2,14,'2023-06-20 20:54:59','2023-06-25 08:58:11',1),
(137,1,2,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(138,1,3,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(139,1,6,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(140,1,7,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(141,1,8,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(142,1,9,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(143,1,18,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(144,1,37,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(145,1,4,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(146,1,10,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(147,1,11,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(148,1,12,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(149,1,13,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(150,1,19,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(151,1,38,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(152,1,5,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(153,1,14,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(154,1,15,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(155,1,16,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(156,1,17,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(157,1,20,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(158,1,21,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(159,1,24,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(160,1,25,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(161,1,26,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(162,1,22,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(163,1,23,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(164,1,27,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(165,1,28,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(166,1,29,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(167,1,34,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(168,1,32,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(169,1,33,'2023-06-21 20:38:43','2023-06-21 20:39:37',1),
(170,1,2,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(171,1,3,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(172,1,6,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(173,1,7,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(174,1,8,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(175,1,9,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(176,1,18,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(177,1,37,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(178,1,4,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(179,1,10,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(180,1,11,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(181,1,12,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(182,1,13,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(183,1,19,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(184,1,38,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(185,1,5,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(186,1,14,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(187,1,15,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(188,1,16,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(189,1,17,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(190,1,20,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(191,1,21,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(192,1,24,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(193,1,25,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(194,1,26,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(195,1,39,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(196,1,22,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(197,1,23,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(198,1,27,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(199,1,28,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(200,1,29,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(201,1,34,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(202,1,32,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(203,1,33,'2023-06-21 20:39:37','2023-06-21 23:55:01',1),
(204,1,2,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(205,1,3,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(206,1,6,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(207,1,7,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(208,1,8,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(209,1,9,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(210,1,18,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(211,1,37,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(212,1,4,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(213,1,10,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(214,1,11,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(215,1,12,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(216,1,13,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(217,1,19,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(218,1,38,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(219,1,5,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(220,1,14,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(221,1,15,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(222,1,16,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(223,1,17,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(224,1,20,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(225,1,21,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(226,1,24,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(227,1,25,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(228,1,26,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(229,1,39,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(230,1,22,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(231,1,23,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(232,1,27,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(233,1,28,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(234,1,29,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(235,1,40,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(236,1,34,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(237,1,32,'2023-06-21 23:55:01','2023-06-22 00:02:09',1),
(238,1,33,'2023-06-21 23:55:02','2023-06-22 00:02:09',1),
(239,1,2,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(240,1,3,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(241,1,6,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(242,1,7,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(243,1,8,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(244,1,9,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(245,1,18,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(246,1,37,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(247,1,4,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(248,1,10,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(249,1,11,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(250,1,12,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(251,1,13,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(252,1,19,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(253,1,38,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(254,1,5,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(255,1,14,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(256,1,15,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(257,1,16,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(258,1,17,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(259,1,20,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(260,1,21,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(261,1,24,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(262,1,25,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(263,1,26,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(264,1,39,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(265,1,22,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(266,1,23,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(267,1,27,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(268,1,28,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(269,1,29,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(270,1,40,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(271,1,34,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(272,1,32,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(273,1,33,'2023-06-22 00:02:09','2023-06-22 14:20:36',1),
(274,1,2,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(275,1,3,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(276,1,6,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(277,1,7,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(278,1,8,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(279,1,9,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(280,1,18,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(281,1,37,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(282,1,4,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(283,1,10,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(284,1,11,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(285,1,12,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(286,1,13,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(287,1,19,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(288,1,38,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(289,1,5,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(290,1,14,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(291,1,15,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(292,1,16,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(293,1,17,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(294,1,20,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(295,1,21,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(296,1,24,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(297,1,25,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(298,1,26,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(299,1,39,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(300,1,22,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(301,1,23,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(302,1,27,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(303,1,28,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(304,1,29,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(305,1,40,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(306,1,41,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(307,1,34,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(308,1,32,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(309,1,33,'2023-06-22 14:20:36','2023-06-22 21:31:02',1),
(310,1,2,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(311,1,3,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(312,1,6,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(313,1,7,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(314,1,8,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(315,1,9,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(316,1,18,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(317,1,37,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(318,1,4,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(319,1,10,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(320,1,11,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(321,1,12,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(322,1,13,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(323,1,19,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(324,1,38,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(325,1,5,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(326,1,14,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(327,1,15,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(328,1,16,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(329,1,17,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(330,1,20,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(331,1,21,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(332,1,24,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(333,1,25,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(334,1,26,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(335,1,39,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(336,1,22,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(337,1,23,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(338,1,27,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(339,1,28,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(340,1,29,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(341,1,40,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(342,1,41,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(343,1,34,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(344,1,30,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(345,1,31,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(346,1,42,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(347,1,43,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(348,1,32,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(349,1,33,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(350,1,44,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(351,1,45,'2023-06-22 21:31:02','2023-06-22 21:31:02',0),
(352,2,2,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(353,2,3,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(354,2,6,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(355,2,7,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(356,2,8,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(357,2,9,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(358,2,18,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(359,2,37,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(360,2,4,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(361,2,10,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(362,2,38,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(363,2,5,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(364,2,14,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(365,2,20,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(366,2,21,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(367,2,22,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(368,2,23,'2023-06-25 08:58:11','2023-06-25 08:58:11',0),
(369,3,2,'2023-06-25 08:58:20','2023-06-25 08:58:20',0),
(370,3,3,'2023-06-25 08:58:20','2023-06-25 08:58:20',0),
(371,3,6,'2023-06-25 08:58:20','2023-06-25 08:58:20',0),
(372,3,7,'2023-06-25 08:58:20','2023-06-25 08:58:20',0),
(373,3,8,'2023-06-25 08:58:20','2023-06-25 08:58:20',0),
(374,3,9,'2023-06-25 08:58:20','2023-06-25 08:58:20',0),
(375,3,18,'2023-06-25 08:58:20','2023-06-25 08:58:20',0),
(376,3,37,'2023-06-25 08:58:20','2023-06-25 08:58:20',0),
(377,11,2,'2023-12-14 09:29:30','2023-12-14 09:29:30',0),
(378,11,3,'2023-12-14 09:29:30','2023-12-14 09:29:30',0),
(379,11,6,'2023-12-14 09:29:30','2023-12-14 09:29:30',0),
(380,11,7,'2023-12-14 09:29:30','2023-12-14 09:29:30',0),
(381,11,8,'2023-12-14 09:29:30','2023-12-14 09:29:30',0),
(382,11,9,'2023-12-14 09:29:30','2023-12-14 09:29:30',0),
(383,11,18,'2023-12-14 09:29:30','2023-12-14 09:29:30',0),
(384,11,37,'2023-12-14 09:29:30','2023-12-14 09:29:30',0);

UNLOCK TABLES;

/*Table structure for table `sys_user` */

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `head_url` varchar(200) DEFAULT NULL COMMENT '头像地址',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `post_id` bigint(20) DEFAULT NULL COMMENT '岗位id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态（1：正常 0：停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

/*Data for the table `sys_user` */

LOCK TABLES `sys_user` WRITE;

insert  into `sys_user`(`id`,`username`,`password`,`name`,`phone`,`head_url`,`dept_id`,`post_id`,`description`,`status`,`create_time`,`update_time`,`is_deleted`) values 
(1,'admin','96e79218965eb72c92a549dd5a330112','admin','15099909888','',1021,5,NULL,1,'2021-05-31 18:08:43','2023-06-14 22:54:32',0),
(2,'wangqq','96e79218965eb72c92a549dd5a330112','王倩倩','15010546381','',1022,5,NULL,1,'2022-02-08 10:35:38','2023-06-25 11:29:24',1),
(3,'wanggang','96e79218965eb72c92a549dd5a330112','王刚','18909098909','',1024,5,NULL,1,'2022-05-24 11:05:40','2023-06-15 21:53:40',0),
(5,'hwj1218','e10adc3949ba59abbe56e057f20f883e','何伟健','15816474932',NULL,NULL,NULL,NULL,1,'2023-06-16 22:41:29','2023-06-16 22:41:29',0),
(6,'hwj2023','e10adc3949ba59abbe56e057f20f883e','何世九','13414730186',NULL,NULL,NULL,NULL,1,'2023-06-20 20:48:37','2023-06-20 20:48:37',0),
(7,'hwj1111','96e79218965eb72c92a549dd5a330112','叶伟骏','13542747592',NULL,NULL,NULL,NULL,1,'2023-06-25 10:43:38','2023-06-25 10:43:38',0),
(8,'hej1111','96e79218965eb72c92a549dd5a330112','何','12345678900',NULL,NULL,NULL,NULL,1,'2023-06-25 11:16:11','2023-06-25 11:16:52',0);

UNLOCK TABLES;

/*Table structure for table `sys_user_item` */

CREATE TABLE `sys_user_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `item_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  KEY `idx_item_id` (`item_id`),
  KEY `idx_admin_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目成员';

/*Data for the table `sys_user_item` */

LOCK TABLES `sys_user_item` WRITE;

UNLOCK TABLES;

/*Table structure for table `sys_user_role` */

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_admin_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='用户角色';

/*Data for the table `sys_user_role` */

LOCK TABLES `sys_user_role` WRITE;

insert  into `sys_user_role`(`id`,`role_id`,`user_id`,`create_time`,`update_time`,`is_deleted`) values 
(11,1,1,'2023-06-15 23:26:30','2023-06-21 20:38:26',1),
(12,3,5,'2023-06-16 22:42:07','2023-06-16 22:42:07',0),
(13,3,6,'2023-06-20 20:48:49','2023-06-20 20:49:29',1),
(14,2,6,'2023-06-20 20:49:29','2023-06-25 08:58:38',1),
(15,1,1,'2023-06-21 20:38:26','2023-12-14 09:28:50',1),
(16,2,6,'2023-06-25 08:58:38','2023-06-25 08:58:38',0),
(17,2,1,'2023-12-14 09:28:50','2023-12-14 09:28:56',1),
(18,1,1,'2023-12-14 09:28:56','2023-12-14 09:28:56',0);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
