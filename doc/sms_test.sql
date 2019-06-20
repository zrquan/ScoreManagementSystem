CREATE DATABASE IF NOT EXISTS `sms_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `sms_test`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: sms_test
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
SET NAMES utf8;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `course`
(
  `id`            int(11)                                                      NOT NULL AUTO_INCREMENT,
  `course_name`   varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名',
  `credit`        int(11)                                                      NOT NULL COMMENT '学分',
  `type`          varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL COMMENT '课程类型',
  `period`        int(11)                                                      NOT NULL COMMENT '学时',
  `average`       double                                                                DEFAULT NULL COMMENT '平均分',
  `student_count` int(11)                                                      NOT NULL DEFAULT '0' COMMENT '选课人数',
  `teacher_id`    int(11)                                                      NOT NULL COMMENT '任课老师',
  `year`          varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT '2018' COMMENT '学年',
  `term`          varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT '2' COMMENT '学期（一或二）',
  `test_form`     varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT '笔试' COMMENT '考试方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 43
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course`
  DISABLE KEYS */;
INSERT INTO `course`
VALUES (31, '管理学原理', 3, '专必', 20, NULL, 0, 21, '2018', '1', '笔试'),
       (32, '信息管理概论', 3, '专选', 20, NULL, 0, 21, '2018', '1', '笔试'),
       (33, '高等数学', 5, '专必', 20, NULL, 0, 21, '2018', '1', '笔试'),
       (34, '概率论与数理统计', 3, '专必', 20, NULL, 0, 21, '2018', '1', '笔试'),
       (35, '线性代数', 3, '专选', 20, NULL, 0, 22, '2018', '1', '笔试'),
       (36, '计算机网络', 4, '专必', 22, NULL, 0, 22, '2018', '1', '笔试'),
       (37, '数据结构', 3, '专选', 20, NULL, 0, 22, '2018', '1', '笔试'),
       (38, '信息分析与决策', 5, '专必', 22, NULL, 0, 23, '2018', '1', '笔试'),
       (39, '机器学习概论', 4, '专选', 22, NULL, 0, 23, '2018', '1', '笔试'),
       (40, '大数据分析导论', 4, '公必', 22, NULL, 0, 23, '2018', '1', '笔试'),
       (41, '网络开发工具及技术', 3, '公选', 22, NULL, 0, 24, '2018', '1', '笔试'),
       (42, 'JAVA高级程序设计', 3, '公选', 24, NULL, 0, 25, '2018', '1', '笔试');
/*!40000 ALTER TABLE `course`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `department`
(
  `id`              int(11)                                                      NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='学院表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department`
  DISABLE KEYS */;
INSERT INTO `department`
VALUES (1, '资讯管理学院');
/*!40000 ALTER TABLE `department`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educational_manager`
--

DROP TABLE IF EXISTS `educational_manager`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `educational_manager`
(
  `id`      int(11)                                                      NOT NULL AUTO_INCREMENT,
  `enumber` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工号',
  `ename`   varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `dept_id` int(11)                                                      NOT NULL COMMENT '院系',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='教务管理人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educational_manager`
--

LOCK TABLES `educational_manager` WRITE;
/*!40000 ALTER TABLE `educational_manager`
  DISABLE KEYS */;
INSERT INTO `educational_manager`
VALUES (1, '1111', 'zrquan', 1);
/*!40000 ALTER TABLE `educational_manager`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `major`
(
  `id`                int(11)                                                      NOT NULL AUTO_INCREMENT,
  `major_name`        varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `department_id`     int(11)                                                      NOT NULL COMMENT '所属院系',
  `pro_need_credit`   int(11) DEFAULT NULL COMMENT '专必学分要求',
  `com_need_credit`   int(11) DEFAULT NULL COMMENT '公必学分要求',
  `pro_select_credit` int(11) DEFAULT NULL COMMENT '专选学分要求',
  `com_select_credit` int(11) DEFAULT NULL COMMENT '公选学分要求',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='专业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major`
  DISABLE KEYS */;
INSERT INTO `major`
VALUES (1, '信息管理与信息系统', 1, 64, 33, 32, 16),
       (2, '图书馆学', 1, 64, 44, 32, 16);
/*!40000 ALTER TABLE `major`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major_course`
--

DROP TABLE IF EXISTS `major_course`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `major_course`
(
  `id`        int(11) NOT NULL AUTO_INCREMENT,
  `major_id`  int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 27
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='专业课程关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major_course`
--

LOCK TABLES `major_course` WRITE;
/*!40000 ALTER TABLE `major_course`
  DISABLE KEYS */;
INSERT INTO `major_course`
VALUES (15, 2, 31),
       (16, 2, 32),
       (17, 1, 33),
       (18, 1, 34),
       (19, 1, 35),
       (20, 1, 36),
       (21, 1, 37),
       (22, 1, 38),
       (23, 1, 39),
       (24, 1, 40),
       (25, 1, 41),
       (26, 1, 42);
/*!40000 ALTER TABLE `major_course`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `score`
(
  `id`         int(11)    NOT NULL AUTO_INCREMENT,
  `course_id`  int(11)    NOT NULL,
  `student_id` int(11)    NOT NULL,
  `value`      double DEFAULT NULL COMMENT '分数（NULL表示未出成绩）',
  `identity`   tinyint(4) NOT NULL COMMENT '重考标识',
  `gpa`        double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 143
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='成绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score`
  DISABLE KEYS */;
INSERT INTO `score`
VALUES (84, 34, 13, 98, 0, 4.8),
       (85, 34, 14, 94, 0, 4.4),
       (86, 34, 15, 59, 1, 0.9),
       (87, 34, 16, 62, 0, 1.2),
       (88, 34, 17, 77, 0, 2.7),
       (89, 34, 18, 72, 0, 2.2),
       (91, 33, 13, 60, 0, 1),
       (92, 35, 13, 80, 0, 3),
       (93, 36, 13, 59, 1, 0.9),
       (95, 38, 13, 90, 0, 4),
       (96, 39, 13, 95, 0, 4.5),
       (97, 40, 13, 72, 0, 2.2),
       (98, 41, 13, 90, 0, 4),
       (99, 42, 13, 65, 0, 1.5),
       (100, 35, 14, 56, 1, 0.6),
       (101, 35, 15, 89, 0, 3.9),
       (102, 35, 16, 56, 1, 0.6),
       (103, 35, 17, 56, 1, 0.6),
       (104, 35, 18, 56, 1, 0.6),
       (105, 35, 19, 56, 1, 0.6),
       (106, 36, 14, 100, 1, 5),
       (107, 36, 15, 100, 1, 5),
       (108, 36, 16, 100, 1, 5),
       (109, 36, 17, 100, 1, 5),
       (110, 36, 18, 99, 1, 4.9),
       (111, 36, 19, 99, 1, 4.9),
       (112, 33, 14, 89, 0, 3.9),
       (113, 33, 15, 90, 0, 4),
       (114, 33, 16, 89, 0, 3.9),
       (115, 33, 17, 59, 1, 0.9),
       (116, 33, 18, 94, 0, 4.4),
       (117, 33, 19, 89, 0, 3.9),
       (118, 38, 14, 99, 0, 4.9),
       (119, 38, 15, 60, 0, 1),
       (120, 38, 16, 60, 0, 1),
       (121, 38, 17, 60, 0, 1),
       (122, 38, 18, 60, 0, 1),
       (123, 38, 19, 60, 0, 1),
       (124, 39, 14, 99, 0, 4.9),
       (125, 39, 15, 60, 0, 1),
       (126, 39, 16, 60, 0, 1),
       (127, 39, 17, 60, 0, 1),
       (128, 39, 18, 60, 0, 1),
       (129, 39, 19, 60, 0, 1),
       (130, 39, 21, 60, 0, 1),
       (131, 40, 14, 99, 0, 4.9),
       (132, 40, 15, 99, 0, 4.9),
       (133, 40, 16, 99, 0, 4.9),
       (134, 40, 17, 99, 0, 4.9),
       (135, 40, 18, 99, 0, 4.9),
       (136, 40, 19, 99, 0, 4.9),
       (137, 41, 14, 99, 0, 4.9),
       (138, 41, 15, 50, 1, 0),
       (139, 41, 16, 50, 1, 0),
       (140, 41, 17, 50, 1, 0),
       (141, 42, 14, 50, 1, 0),
       (142, 42, 15, 60, 0, 1);
/*!40000 ALTER TABLE `score`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_check`
--

DROP TABLE IF EXISTS `score_check`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `score_check`
(
  `id`         int(11) NOT NULL AUTO_INCREMENT,
  `course_id`  int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `value`      double DEFAULT NULL,
  `gpa`        double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 57
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='待审核成绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_check`
--

LOCK TABLES `score_check` WRITE;
/*!40000 ALTER TABLE `score_check`
  DISABLE KEYS */;
INSERT INTO `score_check`
VALUES (35, 31, 13, NULL, NULL),
       (36, 31, 14, NULL, NULL),
       (37, 31, 15, NULL, NULL),
       (38, 31, 16, NULL, NULL),
       (39, 31, 17, NULL, NULL),
       (40, 31, 18, NULL, NULL),
       (41, 31, 19, NULL, NULL),
       (42, 31, 21, NULL, NULL),
       (43, 32, 13, 89, 3.9),
       (44, 32, 14, 70, 2),
       (45, 32, 15, 71, 2.1),
       (46, 32, 16, 89, 3.9),
       (47, 32, 17, 75, 2.5),
       (48, 32, 18, 60, 1),
       (49, 32, 19, 91, 4.1),
       (50, 32, 21, 99, 4.9),
       (51, 37, 13, 90, 4),
       (52, 37, 14, 89, 3.9),
       (53, 37, 15, 89, 3.9),
       (54, 37, 16, 89, 3.9),
       (55, 37, 17, 89, 3.9),
       (56, 37, 18, 59, 0.9);
/*!40000 ALTER TABLE `score_check`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `student`
(
  `id`       int(11)                                                      NOT NULL AUTO_INCREMENT,
  `snumber`  varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `sname`    varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `major_id` int(11)                                                      NOT NULL COMMENT '专业',
  `class`    varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班级',
  `gpa`      double  DEFAULT NULL COMMENT '平均绩点',
  `credit`   int(11) DEFAULT NULL COMMENT '已获学分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student`
  DISABLE KEYS */;
INSERT INTO `student`
VALUES (13, '16369003', '曾润铨', 1, 'A班', NULL, NULL),
       (14, '16369071', '辛睿哲', 1, 'B班', NULL, NULL),
       (15, '16369079', '赵松', 1, 'B班', NULL, NULL),
       (16, '16369073', '张宇阳', 1, 'B班', NULL, NULL),
       (17, '16369081', '钟亚帆', 1, 'A班', NULL, NULL),
       (18, '16369048', '陆阳', 1, 'B班', NULL, NULL),
       (19, '16369101', '测试学生1', 2, 'C班', NULL, NULL),
       (21, '16369103', '测试学生2', 2, 'A班', NULL, NULL);
/*!40000 ALTER TABLE `student`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_feedback`
--

DROP TABLE IF EXISTS `system_feedback`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `system_feedback`
(
  `id`            int(11)                                                       NOT NULL AUTO_INCREMENT,
  `which_account` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci           DEFAULT NULL COMMENT '递交反馈的用户账号（NULL代表匿名）',
  `content`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time`          timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '反馈递交时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_feedback`
--

LOCK TABLES `system_feedback` WRITE;
/*!40000 ALTER TABLE `system_feedback`
  DISABLE KEYS */;
/*!40000 ALTER TABLE `system_feedback`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `teacher`
(
  `id`            int(11)                                                      NOT NULL AUTO_INCREMENT,
  `tnumber`       varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工号',
  `tname`         varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `department_id` int(11)                                                      NOT NULL COMMENT '院系',
  `title`         varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tnumber_UNIQUE` (`tnumber`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='教师表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher`
  DISABLE KEYS */;
INSERT INTO `teacher`
VALUES (21, '63619001', '张老师', 1, '教授'),
       (22, '63619002', '赵老师', 1, '教授'),
       (23, '63619003', '李老师', 1, '副教授'),
       (24, '63619004', '王老师', 1, '副教授'),
       (25, '63619005', '辛老师', 1, '讲师');
/*!40000 ALTER TABLE `teacher`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `user`
(
  `id`             int(11)                                                                               NOT NULL AUTO_INCREMENT,
  `account_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci                          NOT NULL COMMENT '账号，对应管理员、教师的工号，和学生的学号',
  `user_name`      varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci                          NOT NULL,
  `password`       varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci                          NOT NULL,
  `user_type`      enum ('manager','teacher','student') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户类型，只能是管理员、教师、学生',
  `avatar`         mediumblob COMMENT '用户头像',
  `mail`           varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci                                   DEFAULT NULL,
  `phone`          varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci                                   DEFAULT NULL,
  `created_time`   timestamp                                                                             NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `updated_time`   timestamp                                                                             NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户信息修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_number_UNIQUE` (`account_number`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 46
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
  DISABLE KEYS */;
INSERT INTO `user`
VALUES (31, '1111', 'zrquan', '1111', 'manager', NULL, '123@qq.com', '13265321450', '2019-06-20 03:13:44',
        '2019-06-20 05:20:46'),
       (32, '63619001', '张老师', '9001', 'teacher', NULL, 'anan46946@gmail.com', '03197661744', '2019-06-20 03:18:26',
        '2019-06-20 03:18:26'),
       (33, '63619002', '赵老师', '9002', 'teacher', NULL, 'z15531914673@163.com', '03197661744', '2019-06-20 03:18:51',
        '2019-06-20 03:18:51'),
       (34, '63619003', '李老师', '9003', 'teacher', NULL, 'Joker163@qq.com', '03197661744', '2019-06-20 03:19:19',
        '2019-06-20 03:19:19'),
       (35, '63619004', '王老师', '9004', 'teacher', NULL, 'anan46946@gmail.com', '03197661744', '2019-06-20 03:19:42',
        '2019-06-20 03:19:42'),
       (36, '63619005', '辛老师', '9005', 'teacher', NULL, 'z15531914673@163.com', '03197661744', '2019-06-20 03:20:11',
        '2019-06-20 03:20:11'),
       (37, '16369003', '曾润铨', '9003', 'student', NULL, 'anan46946@gmail.com', '03197661744', '2019-06-20 03:20:55',
        '2019-06-20 03:20:55'),
       (38, '16369071', '辛睿哲', '9071', 'student', NULL, 'z15531914673@163.com', '03197661744', '2019-06-20 03:21:43',
        '2019-06-20 03:21:43'),
       (39, '16369079', '赵松', '9079', 'student', NULL, 'Joker163@qq.com', '03197661744', '2019-06-20 03:22:44',
        '2019-06-20 03:22:44'),
       (40, '16369073', '张宇阳', '9073', 'student', NULL, 'anan46946@gmail.com', '03197661744', '2019-06-20 03:23:13',
        '2019-06-20 03:23:13'),
       (41, '16369081', '张亚婷', '9081', 'student', NULL, 'z15531914673@163.com', '03197661744', '2019-06-20 03:24:26',
        '2019-06-20 03:29:11'),
       (42, '16369048', '陆阳', '9048', 'student', NULL, 'z15531914673@163.com', '03197661744', '2019-06-20 03:25:28',
        '2019-06-20 03:25:28'),
       (43, '16369101', '钟亚帆', '9101', 'student', NULL, 'anan46946@gmail.com', '03197661744', '2019-06-20 03:26:36',
        '2019-06-20 03:26:36'),
       (45, '16369103', '安安', '9103', 'student', NULL, 'anan46946@gmail.com', '03197661744', '2019-06-20 03:27:57',
        '2019-06-20 03:27:57');
/*!40000 ALTER TABLE `user`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sms_test'
--

--
-- Dumping routines for database 'sms_test'
--
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2019-06-20 13:23:12
