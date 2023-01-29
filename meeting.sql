/*
 Navicat Premium Data Transfer

 Source Server         : Meeting
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : meeting

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 27/05/2020 14:32:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `departmentid` int(0) NOT NULL,
  `departmentname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `departmentid`(`departmentid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (23, 1, '技术部');
INSERT INTO `department` VALUES (24, 2, '财务部');
INSERT INTO `department` VALUES (25, 3, '市场部');
INSERT INTO `department` VALUES (26, 4, '商务部');
INSERT INTO `department` VALUES (27, 5, '销售部');
INSERT INTO `department` VALUES (28, 6, '生产部');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employeeid` int(0) NOT NULL AUTO_INCREMENT,
  `employeename` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `departmentid` int(0) NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`employeeid`) USING BTREE,
  INDEX `部门号`(`departmentid`) USING BTREE,
  CONSTRAINT `部门号` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'admin', 'aaa', '11111111111', 'wang@qq.com', '1', 1, '1', '1');
INSERT INTO `employee` VALUES (2, '林耀坤', 'bbb', '22222222222', 'yang@qq.com', '1', 1, '1', '2');
INSERT INTO `employee` VALUES (3, '熊杰文', 'ccc', '33333333333', 'xiong@qq.com', '1', 1, '1', '2');
INSERT INTO `employee` VALUES (4, '王敏', 'ddd', '44444444444', 'wangm@qq.com', '1', 1, '1', '2');
INSERT INTO `employee` VALUES (5, '黄美玲', 'eee', '55555555555', 'huang@qq.com', '1', 2, '1', '2');
INSERT INTO `employee` VALUES (6, '王敏', 'fff', '66666666666', 'wangming@qq.com', '1', 2, '1', '2');
INSERT INTO `employee` VALUES (7, '陈敏', 'ggg', '77777777777', 'www@aa.com', '0', 2, '1', '2');
INSERT INTO `employee` VALUES (8, '陈晨', 'hhh', '8', '11', '1', 3, '1', '2');
INSERT INTO `employee` VALUES (9, '王晓华', 'iii', '9', '1', '1', 3, '1', '2');
INSERT INTO `employee` VALUES (10, '张三', 'jjj', '10', '22', '1', 3, '1', '2');
INSERT INTO `employee` VALUES (11, '李四', 'kkk', '11', '1', '1', 4, '1', '2');
INSERT INTO `employee` VALUES (12, '王五', 'lll', '12', '1', '1', 4, '1', '2');
INSERT INTO `employee` VALUES (13, '赵六', 'nnn', '13', '1', '1', 5, '1', '2');
INSERT INTO `employee` VALUES (14, '冯七', 'mmm', '14', '1', '1', 5, '1', '2');
INSERT INTO `employee` VALUES (15, '马八', 'ooo', '15', '1', '1', 5, '1', '2');
INSERT INTO `employee` VALUES (16, '钱十', 'ppp', '16', '1', '2', 5, '1', '2');
INSERT INTO `employee` VALUES (17, '周十一', 'qqq', '17', '1', '1', 6, '1', '2');
INSERT INTO `employee` VALUES (18, 'Ray', 'Ray', '18', '1', '0', 6, '1', '2');

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting`  (
  `meetingid` int(0) NOT NULL AUTO_INCREMENT,
  `meetingname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roomid` int(0) NOT NULL,
  `reservationistid` int(0) NULL DEFAULT NULL,
  `numberofparticipants` int(0) NULL DEFAULT NULL,
  `starttime` datetime(0) NULL DEFAULT NULL,
  `endtime` datetime(0) NULL DEFAULT NULL,
  `reservationtime` datetime(0) NULL DEFAULT NULL,
  `canceledtime` datetime(0) NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `canceledreason` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`meetingid`) USING BTREE,
  INDEX `房间号`(`roomid`) USING BTREE,
  INDEX `用户名`(`reservationistid`) USING BTREE,
  CONSTRAINT `房间号` FOREIGN KEY (`roomid`) REFERENCES `meetingroom` (`roomid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `用户名` FOREIGN KEY (`reservationistid`) REFERENCES `employee` (`employeeid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES (1, '测试1', 111, 1, 3, '2020-05-10 12:00:00', '2020-05-30 12:00:00', '2020-04-30 23:02:39', '2020-05-01 14:48:40', '会议测试', '1', '下雨');
INSERT INTO `meeting` VALUES (2, '测试2', 222, 2, 2, '2020-05-10 12:00:00', '2020-05-30 12:00:00', '2020-04-30 23:02:39', '2020-05-01 14:48:40', '会议测试2', '1', '公事');
INSERT INTO `meeting` VALUES (3, '销售部会议', 333, 3, 4, '2020-05-10 12:00:00', '2020-05-30 12:00:00', '2020-04-30 23:02:39', '2020-05-01 14:48:40', '销售部', '1', 'xxxxxxxxxxxx');
INSERT INTO `meeting` VALUES (4, '运营会会议', 444, 4, 4, '2020-05-10 12:00:00', '2020-05-30 12:00:00', '2020-04-30 23:02:39', '2020-05-01 14:48:40', '运营部', '1', '出差');
INSERT INTO `meeting` VALUES (5, '市场部会议', 555, 5, 3, '2020-05-10 12:00:00', '2020-05-30 12:00:00', '2020-04-30 23:02:39', NULL, '市场部', '0', NULL);
INSERT INTO `meeting` VALUES (6, '商务部会议', 666, 6, 5, '2020-05-11 12:00:00', '2020-05-30 12:00:00', '2020-04-30 23:02:39', NULL, '商务部', '0', NULL);
INSERT INTO `meeting` VALUES (7, '生产部会议', 777, 7, 2, '2020-05-11 12:00:00', '2020-05-30 12:00:00', '2020-04-30 23:02:39', NULL, '生产部', '0', NULL);
INSERT INTO `meeting` VALUES (8, '我的会议', 111, 1, 3, '2020-05-11 12:00:00', '2020-05-30 12:00:00', '2020-05-09 17:06:49', NULL, '', '0', NULL);
INSERT INTO `meeting` VALUES (9, '员工集合', 999, 9, 4, '2020-05-11 12:00:00', '2020-05-30 12:00:00', '2020-04-30 23:02:39', '2020-05-02 14:48:40', '你好', '1', NULL);
INSERT INTO `meeting` VALUES (10, '新员工交流大会', 1111, 1, 3, '2020-05-12 12:00:00', '2020-05-30 12:00:00', '2020-04-30 23:02:39', NULL, '测试', '0', NULL);
INSERT INTO `meeting` VALUES (42, '领导讲话', 111, 1, 3, '2020-05-08 01:07:55', '2020-05-09 01:07:57', '2020-05-08 01:08:20', '2020-05-08 01:12:24', '领导谈话', '1', '没空');
INSERT INTO `meeting` VALUES (43, '领导讲话', 111, 1, 3, '2020-05-08 01:10:25', '2020-05-09 01:10:27', '2020-05-08 01:10:42', '2020-05-09 15:53:32', '领导讲话', '1', '家里有事');
INSERT INTO `meeting` VALUES (47, '个人', 111, 1, 2, '2020-05-12 17:07:32', '2020-05-13 17:07:40', '2020-05-09 22:17:06', NULL, '2', '0', NULL);

-- ----------------------------
-- Table structure for meetingparticipants
-- ----------------------------
DROP TABLE IF EXISTS `meetingparticipants`;
CREATE TABLE `meetingparticipants`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `meetingid` int(0) NOT NULL,
  `employeeid` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `员工编号`(`employeeid`) USING BTREE,
  INDEX `会议编号`(`meetingid`) USING BTREE,
  CONSTRAINT `会议编号` FOREIGN KEY (`meetingid`) REFERENCES `meeting` (`meetingid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `员工编号` FOREIGN KEY (`employeeid`) REFERENCES `employee` (`employeeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meetingparticipants
-- ----------------------------
INSERT INTO `meetingparticipants` VALUES (1, 1, 1);
INSERT INTO `meetingparticipants` VALUES (2, 1, 2);
INSERT INTO `meetingparticipants` VALUES (3, 1, 3);
INSERT INTO `meetingparticipants` VALUES (4, 2, 4);
INSERT INTO `meetingparticipants` VALUES (5, 2, 10);
INSERT INTO `meetingparticipants` VALUES (6, 3, 3);
INSERT INTO `meetingparticipants` VALUES (7, 3, 14);
INSERT INTO `meetingparticipants` VALUES (8, 3, 15);
INSERT INTO `meetingparticipants` VALUES (9, 3, 9);
INSERT INTO `meetingparticipants` VALUES (10, 3, 15);
INSERT INTO `meetingparticipants` VALUES (11, 4, 4);
INSERT INTO `meetingparticipants` VALUES (12, 4, 11);
INSERT INTO `meetingparticipants` VALUES (13, 4, 6);
INSERT INTO `meetingparticipants` VALUES (14, 5, 5);
INSERT INTO `meetingparticipants` VALUES (15, 5, 8);
INSERT INTO `meetingparticipants` VALUES (16, 5, 9);
INSERT INTO `meetingparticipants` VALUES (17, 5, 5);
INSERT INTO `meetingparticipants` VALUES (18, 5, 13);
INSERT INTO `meetingparticipants` VALUES (19, 6, 6);
INSERT INTO `meetingparticipants` VALUES (20, 6, 1);
INSERT INTO `meetingparticipants` VALUES (21, 6, 12);
INSERT INTO `meetingparticipants` VALUES (22, 6, 10);
INSERT INTO `meetingparticipants` VALUES (23, 6, 2);
INSERT INTO `meetingparticipants` VALUES (24, 6, 15);
INSERT INTO `meetingparticipants` VALUES (25, 7, 7);
INSERT INTO `meetingparticipants` VALUES (26, 7, 4);
INSERT INTO `meetingparticipants` VALUES (27, 8, 1);
INSERT INTO `meetingparticipants` VALUES (28, 8, 6);
INSERT INTO `meetingparticipants` VALUES (29, 8, 8);
INSERT INTO `meetingparticipants` VALUES (30, 9, 13);
INSERT INTO `meetingparticipants` VALUES (31, 9, 9);
INSERT INTO `meetingparticipants` VALUES (32, 9, 14);
INSERT INTO `meetingparticipants` VALUES (33, 9, 6);
INSERT INTO `meetingparticipants` VALUES (34, 10, 1);
INSERT INTO `meetingparticipants` VALUES (35, 10, 10);
INSERT INTO `meetingparticipants` VALUES (36, 10, 11);
INSERT INTO `meetingparticipants` VALUES (39, 42, 1);
INSERT INTO `meetingparticipants` VALUES (40, 42, 2);
INSERT INTO `meetingparticipants` VALUES (41, 42, 4);
INSERT INTO `meetingparticipants` VALUES (42, 43, 1);
INSERT INTO `meetingparticipants` VALUES (43, 43, 2);
INSERT INTO `meetingparticipants` VALUES (44, 43, 4);
INSERT INTO `meetingparticipants` VALUES (66, 47, 1);
INSERT INTO `meetingparticipants` VALUES (67, 47, 2);

-- ----------------------------
-- Table structure for meetingroom
-- ----------------------------
DROP TABLE IF EXISTS `meetingroom`;
CREATE TABLE `meetingroom`  (
  `roomid` int(0) NOT NULL AUTO_INCREMENT,
  `roomnum` int(0) NOT NULL,
  `roomname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `capacity` int(0) NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`roomid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3333 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meetingroom
-- ----------------------------
INSERT INTO `meetingroom` VALUES (111, 101, '第一会议室', 15, '0', '销售部会议室');
INSERT INTO `meetingroom` VALUES (222, 102, '第二会议室', 5, '0', '管理部门会议室');
INSERT INTO `meetingroom` VALUES (333, 103, '第三会议室', 12, '0', '市场部专用会议室');
INSERT INTO `meetingroom` VALUES (444, 401, '第四会议室', 15, '0', '公共会议室');
INSERT INTO `meetingroom` VALUES (555, 201, '第五会议室', 15, '0', '最大会议室');
INSERT INTO `meetingroom` VALUES (666, 601, '第六会议室', 12, '0', '需要提前三天预定');
INSERT INTO `meetingroom` VALUES (777, 999, '第999会议室', 99, '0', '第999会议室，哈哈哈哈哈');
INSERT INTO `meetingroom` VALUES (888, 998, '第998会议室', 98, '1', '第998会议室，哈哈哈哈哈');
INSERT INTO `meetingroom` VALUES (999, 996, '第996会议室', 96, '0', '第996666666666666666666666666会议室顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶');
INSERT INTO `meetingroom` VALUES (1111, 1001, '测试会议室', 99, '0', '1111111111111');
INSERT INTO `meetingroom` VALUES (2222, 1002, '测试会议室2', 99, '0', '2222222222222');
INSERT INTO `meetingroom` VALUES (3333, 1003, '测试会议室3', 99, '0', '3333333333333');

SET FOREIGN_KEY_CHECKS = 1;
