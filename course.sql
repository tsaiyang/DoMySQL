SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`(
    `课程号` varchar(255) NOT NULL,
    `课程名称` varchar(255) NOT NULL,
    `教师号` varchar(255) NOT NULL,
    PRIMARY KEY (`课程号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of course
-- ----------------------------
insert into course(课程号,课程名称,教师号) values('0001' , '语文' , '0002');
insert into course(课程号,课程名称,教师号) values('0002' , '数学' , '0001');
insert into course(课程号,课程名称,教师号) values('0003' , '英语' , '0003');

SET FOREIGN_KEY_CHECKS = 1;