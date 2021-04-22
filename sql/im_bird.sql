/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : im_bird

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 22/04/2021 17:52:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chat_msg
-- ----------------------------
DROP TABLE IF EXISTS `chat_msg`;
CREATE TABLE `chat_msg`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `send_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `accept_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sign_flag` int(1) NULL DEFAULT NULL COMMENT '消息是否签收状态\r\n1：签收\r\n0：未签收\r\n',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '发送请求的事件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat_msg
-- ----------------------------
INSERT INTO `chat_msg` VALUES ('1', '1', '2', '你好啊', 0, '2021-04-22 11:16:01');

-- ----------------------------
-- Table structure for friends_request
-- ----------------------------
DROP TABLE IF EXISTS `friends_request`;
CREATE TABLE `friends_request`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `send_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `accept_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `request_date_time` datetime(0) NULL DEFAULT NULL COMMENT '发送请求的事件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for my_friends
-- ----------------------------
DROP TABLE IF EXISTS `my_friends`;
CREATE TABLE `my_friends`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `my_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
  `my_friend_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户的好友id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `my_user_id`(`my_user_id`, `my_friend_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名，账号，慕信号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `face_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '我的头像，如果没有默认给一张',
  `face_image_big` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `qrcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新用户注册后默认后台生成二维码，并且上传到fastdfs',
  `cid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2021042214441594064023225', 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'aa', 'big_aa', NULL, NULL, NULL);
INSERT INTO `users` VALUES ('2021042215411879330885357', '12', 'f7177163c833dff4b38fc8d2872f1ec6', 'aa', 'big_aa', NULL, NULL, NULL);
INSERT INTO `users` VALUES ('2021042216000045896014173', 'df', '19b19ffc30caef1c9376cd2982992a59', 'aa', 'big_aa', NULL, NULL, NULL);
INSERT INTO `users` VALUES ('2021042216084014947561205', 'gg', '73c18c59a39b18382081ec00bb456d43', 'aa', 'big_aa', NULL, NULL, NULL);
INSERT INTO `users` VALUES ('2021042217325941311755096', 'hh', '5e9c52c6d618881e7d9d62a294c4979c', 'aa', 'big_aa', NULL, NULL, NULL);
INSERT INTO `users` VALUES ('2021042217355693832587851', 'vh', 'ea7d201d1cdd240f3798b2dc51d6adcb', 'aa', 'big_aa', NULL, NULL, NULL);
INSERT INTO `users` VALUES ('2021042217362553865609073', 'gh', 'eed71700a6022b826a3daf1cd2a97819', 'aa', 'big_aa', NULL, NULL, NULL);
INSERT INTO `users` VALUES ('2021042217365572687833686', 'gb', '70ecd010452224a92bcf6c9503d8c313', 'aa', 'big_aa', NULL, NULL, NULL);
INSERT INTO `users` VALUES ('2021042217372179031677555', 'ghj', '19b19ffc30caef1c9376cd2982992a59', 'aa', 'big_aa', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
