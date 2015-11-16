/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : jjzone

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2015-10-27 09:39:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `imgId` int(11) NOT NULL AUTO_INCREMENT,
  `imgAddress` varchar(255) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `setTime` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `photoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`imgId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('2', 'resources/i/i.jpg', '2015-10-21 10:20:08', null, '1', null);
INSERT INTO `image` VALUES ('3', 'resources/i/i.jpg', '2015-10-21 10:34:13', null, '2', null);
INSERT INTO `image` VALUES ('4', 'resources/i/photosImg/38.jpg', '2015-10-21 10:39:16', null, '3', null);
INSERT INTO `image` VALUES ('5', 'resources/i/photosImg/1.jpg', '2015-10-21 14:36:43', null, '1', '1');
INSERT INTO `image` VALUES ('6', 'resources/i/photosImg/2.jpg', '2015-10-21 14:37:52', null, '1', '1');
INSERT INTO `image` VALUES ('7', 'resources/i/photosImg/3.jpg', '2015-10-21 14:37:52', null, '1', '1');
INSERT INTO `image` VALUES ('8', 'resources/i/photosImg/4.jpg', '2015-10-21 14:37:52', null, '1', '1');
INSERT INTO `image` VALUES ('9', 'resources/i/photosImg/5.jpg', '2015-10-21 14:37:52', null, '1', '1');
INSERT INTO `image` VALUES ('10', 'resources/i/photosImg/6.jpg', '2015-10-21 14:37:52', null, '1', '1');
INSERT INTO `image` VALUES ('11', 'resources/i/photosImg/7.jpg', '2015-10-21 14:37:52', null, '1', '1');
INSERT INTO `image` VALUES ('12', 'resources/i/photosImg/8.jpg', '2015-10-21 14:37:52', null, '1', '1');
INSERT INTO `image` VALUES ('13', 'resources/i/photosImg/9.jpg', '2015-10-21 14:38:19', null, '1', '2');
INSERT INTO `image` VALUES ('14', 'resources/i/photosImg/10.jpg', '2015-10-21 14:38:19', null, '1', '2');
INSERT INTO `image` VALUES ('15', 'resources/i/photosImg/11.jpg', '2015-10-21 14:38:19', null, '1', '2');
INSERT INTO `image` VALUES ('16', 'resources/i/photosImg/12.jpg', '2015-10-21 14:38:19', null, '1', '2');
INSERT INTO `image` VALUES ('17', 'resources/i/photosImg/13.jpg', '2015-10-21 14:38:19', null, '1', '2');
INSERT INTO `image` VALUES ('18', 'resources/i/photosImg/14.jpg', '2015-10-21 14:38:19', null, '1', '2');
INSERT INTO `image` VALUES ('19', 'resources/i/photosImg/15.jpg', '2015-10-21 14:38:19', null, '1', '2');
INSERT INTO `image` VALUES ('20', 'resources/i/photosImg/38.jpg', '2015-10-22 16:55:32', null, '4', null);

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `photoId` int(11) NOT NULL AUTO_INCREMENT,
  `photoName` varchar(255) NOT NULL,
  `photoDescribe` varchar(255) DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `setTime` datetime DEFAULT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`photoId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES ('1', 'DORAEMON', 'Oh My LOVE', '2015-10-21 14:35:20', null, '1');
INSERT INTO `photo` VALUES ('2', 'old', 'provence', '2015-10-21 14:35:56', null, '1');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `publishId` int(11) NOT NULL,
  `reviewContext` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `reviewDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `coverReviewId` int(11) DEFAULT NULL,
  PRIMARY KEY (`reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `songId` int(11) NOT NULL AUTO_INCREMENT,
  `songAddress` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`songId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of song
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userPwd` varchar(255) NOT NULL,
  `userNick` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'ly', 'jj511314', '我家芋头');
INSERT INTO `user` VALUES ('2', 'good', 'jj511314', '骨朵');
INSERT INTO `user` VALUES ('3', 'doraemon', 'jj511314', '哆啦A梦');
INSERT INTO `user` VALUES ('4', 'forever', 'jj511314', '我真的好想你');

-- ----------------------------
-- Table structure for userrelated
-- ----------------------------
DROP TABLE IF EXISTS `userrelated`;
CREATE TABLE `userrelated` (
  `userRelatedId` int(11) NOT NULL AUTO_INCREMENT,
  `meUserId` int(11) NOT NULL,
  `friendUserId` int(11) NOT NULL,
  PRIMARY KEY (`userRelatedId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userrelated
-- ----------------------------

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `videoId` int(11) NOT NULL AUTO_INCREMENT,
  `videoAddress` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`videoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
