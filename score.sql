SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`(
    `学号` varchar(255) NOT NULL,
    `课程号` varchar(255) NOT NULL,
    `成绩` float(3,0) NOT NULL,
    PRIMARY KEY (`学号`,`课程号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT=Dynamic;
-- ----------------------------
-- Records of score
-- ----------------------------
insert into score(学号,课程号,成绩) values('0001' , '0001' , 80);
insert into score(学号,课程号,成绩) values('0001' , '0002' , 90);
insert into score(学号,课程号,成绩) values('0001' , '0003' , 99);
insert into score(学号,课程号,成绩) values('0002' , '0002' , 60);
insert into score(学号,课程号,成绩) values('0002' , '0003' , 80);
insert into score(学号,课程号,成绩) values('0003' , '0001' , 80);
insert into score(学号,课程号,成绩) values('0003' , '0002' , 80);
insert into score(学号,课程号,成绩) values('0003' , '0003' , 80);

SET FOREIGN_KEY_CHECKS = 1;