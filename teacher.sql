SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`(
    `教师号` varchar(255) NOT NULL,
    `教师姓名` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`教师号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of teacher
-- ----------------------------
insert into teacher(教师号,教师姓名) values('0001' , '孟扎扎');
insert into teacher(教师号,教师姓名) values('0002' , '马化腾');
insert into teacher(教师号,教师姓名) values('0003' , null);
insert into teacher(教师号,教师姓名) values('0004' , '');

SET FOREIGN_KEY_CHECKS = 1;