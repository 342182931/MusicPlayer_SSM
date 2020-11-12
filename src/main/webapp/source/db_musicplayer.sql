/*
 Navicat Premium Data Transfer

 Source Server         : My SQL
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : db_musicplayer

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 11/04/2020 08:52:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orright` int(11) NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', '123', '许剑峰', 1, '/upload/20200213122914455498.jpg', 23, '2017-10-09', '342182931@qq.com', '13063962511', '中国福建省', '哈哈', 1);
INSERT INTO `tb_user` VALUES (2, 'admin', '888', '宋锁', 1, '/upload/photo.jpeg', 23, '2017-10-05', '123', '123', '123', '123', 2);
INSERT INTO `tb_user` VALUES (3, '123', '123', '哈哈', 1, '/upload/photo.jpeg', 12, '2017-10-12', '163@163.com', '123123', 'asd', '无敌是多么寂寞', 2);
INSERT INTO `tb_user` VALUES (4, 'asd', 'asd', '戚薇', 2, '/upload/photo.jpeg', 12, '2017-11-01', NULL, '123', 'asd', NULL, 3);
INSERT INTO `tb_user` VALUES (5, 'zhangda', '123', '张大', 1, '/upload/photo.jpeg', 24, '2017-10-21', '163@163.com', '123', '江苏省', '哈哈哈', 2);
INSERT INTO `tb_user` VALUES (6, 'fc123', '123', '冯辰', 2, '/upload/photo.jpeg', 15, '2017-11-16', NULL, '1321', '', NULL, 1);
INSERT INTO `tb_user` VALUES (17, 'useradmin', '123', '背包', 1, '/upload/20200201175632764893.jpg', 12, '2020-01-29', '342182931@qq.com', '12312312312', '福建省', '无', 1);
INSERT INTO `tb_user` VALUES (18, 'abc', '123', '许剑峰', 1, '/upload/photo.jpeg', 12, '2020-01-21', '342182931@qq.com', '12312312312', '中国福建省', '暗杀', 2);
INSERT INTO `tb_user` VALUES (21, NULL, NULL, '黄义达', NULL, '/upload/photo/20200318204445321516.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `tb_user` VALUES (22, NULL, NULL, '王力宏、谭维维', NULL, '/upload/photo/20200318214435577754.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `tb_user` VALUES (23, NULL, NULL, '王力宏、萨顶顶', NULL, '/upload/photo/20200318214454129634.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `tb_user` VALUES (24, NULL, NULL, '小阿七', NULL, '/upload/photo/20200318214618922566.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `tb_user` VALUES (25, NULL, NULL, 'Uu', NULL, '/upload/photo/20200320004614587374.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `tb_user` VALUES (26, NULL, NULL, '王源', NULL, '/upload/photo/20200320170358574683.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `tb_user` VALUES (27, NULL, NULL, '宋雅萌', NULL, '/upload/photo/20200320170405221484.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `tb_user` VALUES (28, NULL, NULL, '卓依婷、林正桦', NULL, '/upload/photo/20200327203451691351.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 3);

-- ----------------------------
-- Table structure for tb_music
-- ----------------------------
DROP TABLE IF EXISTS `tb_music`;
CREATE TABLE `tb_music`  (
  `musicid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` double NULL DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lyric` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(11) UNSIGNED ZEROFILL NULL DEFAULT 00000000000,
  PRIMARY KEY (`musicid`) USING BTREE,
  INDEX `songerid1`(`userid`) USING BTREE,
  CONSTRAINT `tb_music_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `tb_user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_music
-- ----------------------------
INSERT INTO `tb_music` VALUES (1, '笨小孩', 2, '薛之谦 - 演员.mp3', '/upload/photo.jpeg', 4, '国语', '经典', '陈奕迅 - 十年.mkv', '123', 00000000035);
INSERT INTO `tb_music` VALUES (2, 'asd ', 2, '薛之谦 - 演员.mp3', '/upload/photo.jpeg', 3, '国语', '经典', '陈奕迅 - 十年.mkv', '', 00000000002);
INSERT INTO `tb_music` VALUES (3, '戚薇', 2, '薛之谦 - 演员.mp3', '/upload/photo.jpeg', 3, '国语', '经典', NULL, '', 00000000004);
INSERT INTO `tb_music` VALUES (5, '演员', 3, '薛之谦 - 演员.mp3', '/upload/photo.jpeg', 3, '英语', '经典', '薛之谦 - 演员.mp4', '薛之谦 - 演员-57b83eaf673d77ee21009cbd8fd05bd6-21008758-00000000.krc', 00000000044);
INSERT INTO `tb_music` VALUES (7, '演员', 3, '薛之谦 - 演员.mp3', '/upload/photo.jpeg', 5, '国语', '经典', '薛之谦 - 演员.mp4', NULL, 00000000002);
INSERT INTO `tb_music` VALUES (11, '黄义达 - 那女孩对我说', 21, '/upload/mp3/黄义达 - 那女孩对我说.mp3', '/upload/photo/20200318204446940244.jpg', 4338432, NULL, NULL, '/upload/mv/20200327195848120090.mkv', NULL, 00000000020);
INSERT INTO `tb_music` VALUES (12, '王力宏、谭维维 - 缘分一道桥', 22, '/upload/mp3/王力宏、谭维维 - 缘分一道桥.mp3', '/upload/photo/20200318214437165166.jpg', 3939644, NULL, NULL, NULL, NULL, 00000000001);
INSERT INTO `tb_music` VALUES (13, '王力宏、萨顶顶 - 缘分一道桥 (Live)', 23, '/upload/mp3/王力宏、萨顶顶 - 缘分一道桥 (Live).mp3', '/upload/photo/20200318214454463574.jpg', 4298462, NULL, NULL, NULL, NULL, 00000000001);
INSERT INTO `tb_music` VALUES (14, '小阿七 - 那女孩对我说 (正式版)', 24, '/upload/mp3/小阿七 - 那女孩对我说 (正式版).mp3', '/upload/photo/20200318214620755832.jpg', 4099764, NULL, NULL, NULL, NULL, 00000000002);
INSERT INTO `tb_music` VALUES (15, 'Uu - 那女孩对我说 (完整版)', 25, '/upload/mp3/Uu - 那女孩对我说 (完整版).mp3', '/upload/photo/20200320004615957418.jpg', 4490179, NULL, NULL, NULL, NULL, 00000000007);
INSERT INTO `tb_music` VALUES (16, '王源 - 那女孩对我说 (Live)', 26, '/upload/mp3/王源 - 那女孩对我说 (Live).mp3', '/upload/photo/20200320170359783041.jpg', 4289063, NULL, NULL, '/upload/mv/20200327205545259420.mkv', NULL, 00000000011);
INSERT INTO `tb_music` VALUES (17, '宋雅萌 - 那女孩对我说 (女声版)', 27, '/upload/mp3/宋雅萌 - 那女孩对我说 (女声版).mp3', '/upload/photo/20200320170406098092.jpg', 4298754, NULL, NULL, NULL, NULL, 00000000001);
INSERT INTO `tb_music` VALUES (18, '卓依婷、林正桦 - 爱拼才会赢', 28, '/upload/mp3/卓依婷、林正桦 - 爱拼才会赢.mp3', '/upload/photo/20200327203452967780.jpg', 3440220, NULL, NULL, NULL, NULL, 00000000000);

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message`  (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `musicid` int(11) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` timestamp(0) NULL DEFAULT NULL,
  `reply` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`messageid`) USING BTREE,
  INDEX `musicid`(`musicid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `tb_message_ibfk_1`(`reply`) USING BTREE,
  CONSTRAINT `tb_message_ibfk_1` FOREIGN KEY (`musicid`) REFERENCES `tb_music` (`musicid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_message_ibfk_2` FOREIGN KEY (`reply`) REFERENCES `tb_message` (`messageid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_message_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `tb_user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_message
-- ----------------------------
INSERT INTO `tb_message` VALUES (0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_message` VALUES (1, 1, 1, '很好很好', '2017-10-02 00:00:00', 0);
INSERT INTO `tb_message` VALUES (12, 5, 1, '哈哈', '2017-11-01 10:25:44', 1);
INSERT INTO `tb_message` VALUES (16, 1, 1, '好听', '2020-03-21 00:00:00', 0);
INSERT INTO `tb_message` VALUES (17, 1, 1, '确实', '2020-03-21 00:00:00', 16);
INSERT INTO `tb_message` VALUES (18, 1, 11, '确实', '2020-03-30 00:00:00', 0);
INSERT INTO `tb_message` VALUES (19, 1, 11, '确实', '2020-03-30 00:00:00', 18);
INSERT INTO `tb_message` VALUES (20, 1, 11, 'a', '2020-03-30 00:00:00', 18);
INSERT INTO `tb_message` VALUES (21, NULL, 11, '很好听', '2020-03-31 00:00:00', 0);
INSERT INTO `tb_message` VALUES (22, 1, 11, '很好听', '2020-03-31 00:00:00', 0);
INSERT INTO `tb_message` VALUES (23, 1, 11, '确实', '2020-03-31 00:00:00', 22);

-- ----------------------------
-- Table structure for tb_songmenu
-- ----------------------------
DROP TABLE IF EXISTS `tb_songmenu`;
CREATE TABLE `tb_songmenu`  (
  `songmenuid` int(11) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  PRIMARY KEY (`songmenuid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `tb_songmenu_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `tb_user` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_songmenu
-- ----------------------------
INSERT INTO `tb_songmenu` VALUES (1, '收藏歌单', '/upload/photo.jpeg', 1, '经典', '国语', '流行', '2017-10-12');
INSERT INTO `tb_songmenu` VALUES (2, '我喜欢歌单', '/upload/photo.jpeg', 5, '网络', '英语', '民歌', '2017-09-27');
INSERT INTO `tb_songmenu` VALUES (6, '我喜欢', '/upload/photo.jpeg', 1, '经典', '国语', '流行', '2017-10-22');
INSERT INTO `tb_songmenu` VALUES (9, '我喜欢的', '/upload/photo.jpeg', 1, '网络', '英语', 'R&B', '2017-11-03');
INSERT INTO `tb_songmenu` VALUES (10, '我的歌单', '/upload/photo.jpeg', 5, '经典', '国语', '流行', '2017-11-09');
INSERT INTO `tb_songmenu` VALUES (14, '我的歌单', '/upload/photo.jpeg', 1, '经典', '国语', '流行', '2020-02-15');
INSERT INTO `tb_songmenu` VALUES (15, '我的歌单2', '/upload/photo.jpeg', 1, '经典', '国语', '流行', '2020-02-15');
INSERT INTO `tb_songmenu` VALUES (16, '90经典回忆', '/upload/photo.jpeg', 4, '经典', '英文', '流行', '2020-02-11');
INSERT INTO `tb_songmenu` VALUES (17, '00后行', '/upload/photo.jpeg', 4, '经典', '英文', '流行', '2020-01-27');
INSERT INTO `tb_songmenu` VALUES (18, 'asdasd', '/upload/photo.jpeg', 18, '经典', '中文', '流行', '2020-02-02');
INSERT INTO `tb_songmenu` VALUES (19, '奥术大师大所', '/upload/photo.jpeg', 17, '经典', '国语', '流行', '2020-02-17');
INSERT INTO `tb_songmenu` VALUES (20, '大萨达', '/upload/photo.jpeg', 6, '文艺', '国语', '流行', '2020-02-03');
INSERT INTO `tb_songmenu` VALUES (21, 'asdas', '/upload/photo.jpeg', 6, '经典', '国语', '流行', '2020-02-11');

-- ----------------------------
-- Table structure for tb_collect
-- ----------------------------
DROP TABLE IF EXISTS `tb_collect`;
CREATE TABLE `tb_collect`  (
  `collectid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `songmenuid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`collectid`) USING BTREE,
  INDEX `userid1`(`userid`) USING BTREE,
  INDEX `songmenuid1`(`songmenuid`) USING BTREE,
  CONSTRAINT `tb_collect_ibfk_1` FOREIGN KEY (`songmenuid`) REFERENCES `tb_songmenu` (`songmenuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_collect_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `tb_user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_collect
-- ----------------------------
INSERT INTO `tb_collect` VALUES (15, 5, 2);
INSERT INTO `tb_collect` VALUES (60, 1, 1);
INSERT INTO `tb_collect` VALUES (69, 1, 2);
INSERT INTO `tb_collect` VALUES (70, 1, 6);
INSERT INTO `tb_collect` VALUES (71, 1, 19);

-- ----------------------------
-- Table structure for tb_songlist
-- ----------------------------
DROP TABLE IF EXISTS `tb_songlist`;
CREATE TABLE `tb_songlist`  (
  `songlistid` int(11) NOT NULL AUTO_INCREMENT,
  `songmenuid` int(11) NULL DEFAULT NULL,
  `musicid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`songlistid`) USING BTREE,
  INDEX `musicid1`(`musicid`) USING BTREE,
  INDEX `songmenuid`(`songmenuid`) USING BTREE,
  CONSTRAINT `tb_songlist_ibfk_1` FOREIGN KEY (`musicid`) REFERENCES `tb_music` (`musicid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_songlist_ibfk_2` FOREIGN KEY (`songmenuid`) REFERENCES `tb_songmenu` (`songmenuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_songlist
-- ----------------------------
INSERT INTO `tb_songlist` VALUES (1, 1, 1);
INSERT INTO `tb_songlist` VALUES (2, 1, 3);
INSERT INTO `tb_songlist` VALUES (8, 2, 3);
INSERT INTO `tb_songlist` VALUES (9, 1, 5);
INSERT INTO `tb_songlist` VALUES (10, 1, 5);
INSERT INTO `tb_songlist` VALUES (11, 2, 5);
INSERT INTO `tb_songlist` VALUES (12, 2, 5);
INSERT INTO `tb_songlist` VALUES (13, 15, 5);
INSERT INTO `tb_songlist` VALUES (14, 14, 5);
INSERT INTO `tb_songlist` VALUES (15, 14, 5);
INSERT INTO `tb_songlist` VALUES (16, 2, 3);
INSERT INTO `tb_songlist` VALUES (17, 9, 3);
INSERT INTO `tb_songlist` VALUES (18, 9, 3);
INSERT INTO `tb_songlist` VALUES (19, 9, 5);
INSERT INTO `tb_songlist` VALUES (20, 6, 3);
INSERT INTO `tb_songlist` VALUES (21, 1, 11);



SET FOREIGN_KEY_CHECKS = 1;
