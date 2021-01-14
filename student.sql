SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`(
    `学号` varchar(255) NOT NULL,
    `姓名`  varchar(255) NOT NULL,
    `出生日期` date  DEFAULT '1971-01-01',
    `性别` varchar(255) NOT NULL,
    PRIMARY KEY (`学号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
insert into student(学号,姓名,出生日期,性别) values('0001' , '猴子' , '1989-01-01' , '男');
insert into student(学号,姓名,出生日期,性别) values('0002' , '猴子' , '1990-12-21' , '女');
insert into student(学号,姓名,出生日期,性别) values('0003' , '马云' , '1991-12-21' , '男');
insert into student(学号,姓名,出生日期,性别) values('0004' , '王思聪' , '1990-05-20' , '男');

SET FOREIGN_KEY_CHECKS = 1;