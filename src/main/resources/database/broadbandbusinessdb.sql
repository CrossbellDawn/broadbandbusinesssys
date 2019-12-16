/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50621
 Source Host           : localhost:3306
 Source Schema         : broadbandbusinessdb

 Target Server Type    : MySQL
 Target Server Version : 50621
 File Encoding         : 65001

 Date: 15/12/2019 13:29:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bus_broadband
-- ----------------------------
DROP TABLE IF EXISTS `bus_broadband`;
CREATE TABLE `bus_broadband`  (
  `band_id` int(255) NOT NULL,
  `band_width` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `band_speed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `band_monthly` double(10, 2) NULL DEFAULT NULL,
  `band_yearly` double(10, 2) NULL DEFAULT NULL,
  `band_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `band_state` int(255) NULL DEFAULT NULL,
  `band_createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`band_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bus_broadband
-- ----------------------------
INSERT INTO `bus_broadband` VALUES (1, '2M铜缆宽带', '256KB/S', 50.00, 500.00, 'ADSL铜线入户，单人使用', 1, '2019-12-05 23:48:17');
INSERT INTO `bus_broadband` VALUES (2, '4M铜缆宽带', '512KB/S', 80.00, 800.00, 'ADSL铜线入户，2人使用', 1, '2019-12-05 23:49:02');
INSERT INTO `bus_broadband` VALUES (3, '8M铜缆宽带', '1024KB/S', 150.00, 1200.00, 'ADSL铜线入户，4人宿舍首选', 1, '2019-12-05 23:50:31');
INSERT INTO `bus_broadband` VALUES (4, '10M光纤宽带', '1.25MB/S', 200.00, 1600.00, 'FTTH光纤入户，大宽带无阻塞', 1, '2019-12-05 23:52:21');
INSERT INTO `bus_broadband` VALUES (5, '20M光纤宽带', '2.50MB/S', 320.00, 3000.00, 'FTTH光纤入户，免费送modem', 1, '2019-12-05 23:53:51');
INSERT INTO `bus_broadband` VALUES (6, '100M光纤宽带', '12.5MB/S', 500.00, 4000.00, 'FTTH光纤入户，优质业务筹划中', 0, '2019-12-06 00:05:56');

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer`  (
  `cust_id` int(255) NOT NULL,
  `cust_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_user_id` int(255) NULL DEFAULT NULL,
  `cust_create_id` int(255) NULL DEFAULT NULL,
  `cust_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_level` int(2) NULL DEFAULT NULL,
  `cust_linkman` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_zipcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`cust_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES (1, '张三', 1, 1, '信通学院', '计算机科学', 0, '教师甲', '81861001', '18322337701', '510750', '红山三路101号', '2019-12-04 16:00:35');
INSERT INTO `bus_customer` VALUES (2, '李四', 1, 1, '信通学院', '软件工程', 1, '教师乙', '81861002', '18322448802', '510750', '红山三路101号', '2019-11-28 16:02:56');
INSERT INTO `bus_customer` VALUES (3, '王五', 1, 1, '信通学院', '计算机科学', 1, '教师甲', '81861003', '18322337723', '510750', '红山三路101号', '2019-12-04 16:00:35');
INSERT INTO `bus_customer` VALUES (4, '赵六', 1, 1, '信通学院', '软件工程', 0, '教师乙', '81861004', '18322448834', '510750', '红山三路101号', '2019-11-29 16:02:56');
INSERT INTO `bus_customer` VALUES (5, '田七', 1, 1, '海运学院', '海运技术', 0, '教师丙', '81861005', '18322337725', '510750', '红山三路101号', '2019-12-03 16:00:35');
INSERT INTO `bus_customer` VALUES (6, '周八', 1, 1, '海运学院', '海运技术', 0, '教师丁', '81861006', '18322448806', '510750', '红山三路101号', '2019-11-29 16:02:56');
INSERT INTO `bus_customer` VALUES (7, '郑九', 1, 1, '外语学院', '商务英语', 1, '教师戊', '81861007', '18322337787', '510750', '红山三路101号', '2019-12-01 16:00:35');
INSERT INTO `bus_customer` VALUES (8, '金十', 1, 1, '外语学院', '商务法语', 1, '教师己', '81861008', '18322448808', '510750', '红山三路101号', '2019-11-29 16:02:56');
INSERT INTO `bus_customer` VALUES (9, '陈十一', 1, 1, '轮机学院', '轮机工程', 0, '教师庚', '81861009', '18322392709', '510750', '红山三路101号', '2019-12-01 16:00:35');
INSERT INTO `bus_customer` VALUES (10, '潘十二', 1, 1, '马克思学院', '哲学', 0, '教师辛', '81861010', '18322448810', '510750', '红山三路101号', '2019-11-30 16:02:56');
INSERT INTO `bus_customer` VALUES (11, '钱十三', 1, 1, '马克思学院', '政治经济学', 1, '教师子', '81861011', '18322337711', '510750', '红山三路101号', '2019-12-02 16:00:35');
INSERT INTO `bus_customer` VALUES (12, '孙十四', 1, 1, '海运学院', '交通运输', 0, '教师寅', '81861012', '18322448812', '510750', '红山三路101号', '2019-11-30 16:02:56');

-- ----------------------------
-- Table structure for bus_order
-- ----------------------------
DROP TABLE IF EXISTS `bus_order`;
CREATE TABLE `bus_order`  (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_bandwidth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_cust_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_feetype` int(2) NULL DEFAULT NULL,
  `order_pay` double(255, 0) NULL DEFAULT NULL,
  `order_starttime` datetime(0) NULL DEFAULT NULL,
  `order_endtime` datetime(0) NULL DEFAULT NULL,
  `order_createtime` datetime(0) NULL DEFAULT NULL,
  `order_state` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `order_cust_id`(`order_cust_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bus_order
-- ----------------------------
INSERT INTO `bus_order` VALUES (3, 'GH_20191215_101543_566_14074', '2M铜缆宽带', '张三', '业务管理甲', 0, 50, '2019-12-15 10:15:43', '2020-01-15 10:15:43', '2019-11-01 10:15:50', 1);
INSERT INTO `bus_order` VALUES (4, 'GH_20191215_101553_045_50731', '4M铜缆宽带', '李四', '业务管理甲', 1, 800, '2019-12-15 10:15:53', '2020-12-15 10:15:53', '2019-07-01 10:16:03', 1);
INSERT INTO `bus_order` VALUES (5, 'GH_20191215_101605_671_45032', '8M铜缆宽带', '王五', '业务管理乙', 1, 1200, '2019-12-15 10:16:05', '2020-12-15 10:16:05', '2019-08-01 10:16:20', 1);
INSERT INTO `bus_order` VALUES (6, 'GH_20191215_101659_309_71562', '10M光纤宽带', '赵六', '业务管理乙', 0, 200, '2019-12-15 10:16:59', '2020-01-15 10:16:59', '2019-06-01 10:17:05', 1);
INSERT INTO `bus_order` VALUES (7, 'GH_20191215_101708_873_42385', '2M铜缆宽带', '田七', '业务管理丙', 0, 50, '2019-12-15 10:17:08', '2020-01-15 10:17:08', '2019-05-15 10:17:15', 1);
INSERT INTO `bus_order` VALUES (8, 'GH_20191215_101720_968_42790', '20M光纤宽带', '周八', '业务管理丙', 0, 320, '2019-12-15 10:17:20', '2020-01-15 10:17:20', '2019-04-15 10:17:29', 1);
INSERT INTO `bus_order` VALUES (9, 'GH_20191215_101857_184_89256', '20M光纤宽带', '郑九', '业务管理丁', 1, 3000, '2019-12-15 10:18:57', '2020-12-15 10:18:57', '2019-03-15 10:19:13', 1);
INSERT INTO `bus_order` VALUES (10, 'GH_20191215_101916_378_45207', '4M铜缆宽带', '金十', '业务管理丁', 1, 800, '2019-12-15 10:19:16', '2020-12-15 10:19:16', '2019-02-15 10:19:27', 1);
INSERT INTO `bus_order` VALUES (11, 'GH_20191215_102013_049_24836', '8M铜缆宽带', '陈十一', '业务管理戊', 0, 150, '2019-12-15 10:20:13', '2020-01-15 10:20:13', '2019-01-15 10:20:19', 1);
INSERT INTO `bus_order` VALUES (12, 'GH_20191215_102023_623_40752', '10M光纤宽带', '潘十二', '业务管理戊', 0, 200, '2019-12-15 10:20:23', '2020-01-15 10:20:23', '2019-12-15 10:20:28', 1);

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logintime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 394 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO `sys_log_login` VALUES (383, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-12-14 20:47:49');
INSERT INTO `sys_log_login` VALUES (384, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-12-14 20:48:22');
INSERT INTO `sys_log_login` VALUES (385, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-12-14 21:41:51');
INSERT INTO `sys_log_login` VALUES (386, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-12-14 22:38:37');
INSERT INTO `sys_log_login` VALUES (387, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-12-15 10:08:57');
INSERT INTO `sys_log_login` VALUES (388, '业务管理甲-bus001', '0:0:0:0:0:0:0:1', '2019-12-15 10:15:23');
INSERT INTO `sys_log_login` VALUES (389, '业务管理乙-bus002', '0:0:0:0:0:0:0:1', '2019-12-15 10:16:52');
INSERT INTO `sys_log_login` VALUES (390, '业务管理丁-bus004', '0:0:0:0:0:0:0:1', '2019-12-15 10:18:51');
INSERT INTO `sys_log_login` VALUES (391, '业务管理戊-bus005', '0:0:0:0:0:0:0:1', '2019-12-15 10:19:43');
INSERT INTO `sys_log_login` VALUES (392, '数据管理己-stats006', '0:0:0:0:0:0:0:1', '2019-12-15 10:23:13');
INSERT INTO `sys_log_login` VALUES (393, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-12-15 12:44:54');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spread` int(255) NULL DEFAULT NULL COMMENT '0不展开1展开',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(255) NULL DEFAULT NULL COMMENT '0不可用1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '校园宽带业务系统', NULL, 1, NULL, '&#xe68e;', 1);
INSERT INTO `sys_menu` VALUES (2, 1, '基础管理', '', 0, '', '&#xe621;', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '业务管理', '', 0, '', '&#xe663;', 1);
INSERT INTO `sys_menu` VALUES (4, 1, '系统管理', '', 1, '', '&#xe716;', 1);
INSERT INTO `sys_menu` VALUES (5, 1, '统计分析', NULL, 0, NULL, '&#xe629;', 1);
INSERT INTO `sys_menu` VALUES (6, 2, '客户管理', '../bus/toCustomerManager.action', 0, '', '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (7, 2, '宽带管理', '../bus/tobroadbandManager.action', 0, '', '&#xe7ae;', 1);
INSERT INTO `sys_menu` VALUES (8, 3, '订单管理', '../bus/toOrderManager.action', 0, '', '&#xe63c;', 1);
INSERT INTO `sys_menu` VALUES (9, 3, '添加订单', '../bus/toAddOrderPage.action', 0, '', '&#xe657;', 1);
INSERT INTO `sys_menu` VALUES (10, 4, '菜单管理', '../sys/toMenuManager.action', 1, NULL, '&#xe60f', 1);
INSERT INTO `sys_menu` VALUES (11, 4, '角色管理', '../sys/toRoleManager.action', 1, '', '&#xe66f;', 1);
INSERT INTO `sys_menu` VALUES (12, 4, '用户管理', '../sys/toUserManager.action', 0, '', '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (13, 4, '日志管理', '../sys/toLogInfoManager.action', 0, '', '&#xe655;', 1);
INSERT INTO `sys_menu` VALUES (14, 4, '系统公告', '../sys/toNewsManager.action', 0, '', '&#xe645;', 1);
INSERT INTO `sys_menu` VALUES (15, 4, '数据源监控', '../druid/', 0, '', '&#xe857;', 1);
INSERT INTO `sys_menu` VALUES (16, 5, '公司年度月份业务销售统计', '../stats/toCompanyYearGradeStat.action', 0, '', '&#xe62c;', 1);
INSERT INTO `sys_menu` VALUES (17, 5, '员工年度业务销售额统计', '../stats/toOperatorYearGradeStat.action', 0, '', '&#xe62c;', 1);

-- ----------------------------
-- Table structure for sys_news
-- ----------------------------
DROP TABLE IF EXISTS `sys_news`;
CREATE TABLE `sys_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `opername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_news
-- ----------------------------
INSERT INTO `sys_news` VALUES (19, '【系统完工里程碑】', '<p>【正文】</p><p><br></p>', '2019-12-14 21:08:54', '超级管理员');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roledesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '拥有所有菜单权限', 1);
INSERT INTO `sys_role` VALUES (2, '业务管理员', '拥有业务菜单权限', 1);
INSERT INTO `sys_role` VALUES (3, '系统管理员', '拥有系统管理权限', 1);
INSERT INTO `sys_role` VALUES (4, '数据统计管理员', '拥有数据统计权限', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`rid`, `mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 9);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 10);
INSERT INTO `sys_role_menu` VALUES (3, 11);
INSERT INTO `sys_role_menu` VALUES (3, 12);
INSERT INTO `sys_role_menu` VALUES (3, 13);
INSERT INTO `sys_role_menu` VALUES (3, 14);
INSERT INTO `sys_role_menu` VALUES (3, 15);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 5);
INSERT INTO `sys_role_menu` VALUES (4, 16);
INSERT INTO `sys_role_menu` VALUES (4, 17);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`, `rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (3, 2);
INSERT INTO `sys_role_user` VALUES (4, 2);
INSERT INTO `sys_role_user` VALUES (5, 2);
INSERT INTO `sys_role_user` VALUES (6, 2);
INSERT INTO `sys_role_user` VALUES (7, 2);
INSERT INTO `sys_role_user` VALUES (8, 2);
INSERT INTO `sys_role_user` VALUES (9, 3);
INSERT INTO `sys_role_user` VALUES (10, 4);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(255) NULL DEFAULT NULL COMMENT '0女1男',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(255) NULL DEFAULT 2 COMMENT '1，超级管理员,2，系统用户',
  `available` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '101', '超级管理员', 1, '广州航海学院网络中心', '18300010001', 'e10adc3949ba59abbe56e057f20f883e', '宽带项目组组长', 1, 1);
INSERT INTO `sys_user` VALUES (3, 'bus001', '201', '业务管理甲', 1, '广州航海学院', '18300020001', 'e10adc3949ba59abbe56e057f20f883e', '宽带业务员', 2, 1);
INSERT INTO `sys_user` VALUES (4, 'bus002', '202', '业务管理乙', 1, '广州航海学院', '18300020002', 'e10adc3949ba59abbe56e057f20f883e', '宽带业务员', 2, 1);
INSERT INTO `sys_user` VALUES (5, 'bus003', '203', '业务管理丙', 1, '广州航海学院', '18300020003', 'e10adc3949ba59abbe56e057f20f883e', '宽带业务员', 2, 1);
INSERT INTO `sys_user` VALUES (6, 'bus004', '204', '业务管理丁', 1, '广州航海学院', '18300020004', 'e10adc3949ba59abbe56e057f20f883e', '宽带业务员', 2, 1);
INSERT INTO `sys_user` VALUES (7, 'bus005', '205', '业务管理戊', 1, '广州航海学院', '18300020005', 'e10adc3949ba59abbe56e057f20f883e', '宽带业务员', 2, 1);
INSERT INTO `sys_user` VALUES (8, 'bus006', '206', '业务管理己', 1, '广州航海学院', '18300020006', 'e10adc3949ba59abbe56e057f20f883e', '宽带业务员', 2, 1);
INSERT INTO `sys_user` VALUES (9, 'sys009', '309', '系统管理丁', 1, '广州航海学院', '18300030003', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员', 2, 1);
INSERT INTO `sys_user` VALUES (10, 'stats006', '406', '数据管理己', 1, '广州航海学院', '18300040004', 'e10adc3949ba59abbe56e057f20f883e', '数据管理员', 2, 1);

SET FOREIGN_KEY_CHECKS = 1;
