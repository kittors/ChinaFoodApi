
-- 创建ChinaFood数据库
SET NAMES UTF8;
DROP DATABASE IF EXISTS `ChinaFood`;
CREATE DATABASE IF  NOT EXISTS  `ChinaFood` DEFAULT  CHARACTER SET 'utf8';
USE `ChinaFood`;


-------------------------------------------------------------------------
-- 1.创建用户表
DROP TABLE IF EXISTS `cfood_user`;

CREATE TABLE `cfood_user` (
  `user_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '作者ID,主键且自增',
  `username` varchar(30) NOT NULL COMMENT '用户名,唯一',
  `password` varchar(32) NOT NULL COMMENT '密码,MD5',
  `email` varchar(50) NOT NULL COMMENT '用户邮箱',
  `nickname` varchar(30) COMMENT '用户昵称',
  `age` INT NOT NULL COMMENT '年龄',
  `pic` varchar(50) DEFAULT '/images/default.jpg' COMMENT '用户默认头像',
  `article_number` mediumint(9) NOT NULL DEFAULT '0' COMMENT '发表的文章数量',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- 锁定cfood_user表的写入
-- LOCK TABLES `cfood_user` WRITE;  

-------------------------------------------------------------------------
--2.创建用户头像图库表
DROP TABLE IF EXISTS `headPortrait`;

CREATE TABLE `headPortrait`(
    `headpic_id` INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT '头像库ID，主键且自增',
    `images` varchar(100)  COMMENT '头像路径',
    PRIMARY KEY (`headpic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

-- 锁定headPortrait表的写入
-- LOCK TABLES `headPortrait` WRITE;

-------------------------------------------------------------------------
--3.创建菜品表  菜品编号非负数
DROP TABLE IF EXISTS `food_dishes`;
CREATE TABLE `food_dishes`(
  `dishes_id` INT(8) UNSIGNED AUTO_INCREMENT NOT NULL COMMENT '菜品id',
  `category_name` varchar(30) COMMENT '菜系名',--八大菜系 如川菜 
  `category_id` INT NOT NULL COMMENT '菜品分类编号 外键',
  PRIMARY KEY (`dishes_id`),
  foreign key(`category_id`) references `food_category`(`category_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

-------------------------------------------------------------------------
-- 4.创建菜品分类表
DROP TABLE IF EXISTS `food_category`;

CREATE TABLE `food_category`(
    `category_id` INT AUTO_INCREMENT NOT NULL COMMENT '分类列表ID，主键且自增',
    `pic` varchar(100) NOT NULL COMMENT '分类图标',
    `category_name` varchar(10) NOT NULL,
    PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

LOCK TABLES `food_category` WRITE;

UNLOCK TABLES;

-------------------------------------------------------------------------
-- 5.创建定位地址表
DROP TABLE IF EXISTS `location`;

CREATE TABLE `location`(
    `location_id` INT AUTO_INCREMENT NOT NULL COMMENT '地址ID，主键且自增',
    `name` varchar(20) NOT NULL COMMENT '地址名称',
    `initials` varchar(5)  COMMENT '首字母排序',
    PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;


-- 锁定写入
-- LOCK TABLES `location` WRITE;
-------------------------------------------------------------------------


--6.创建广告宣传表 
DROP TABLE IF EXISTS `advertis`;

CREATE TABLE `advertis`(
    `advertis_id` INT AUTO_INCREMENT NOT NULL COMMENT '广告id',
    `images` varchar(100)  COMMENT '广告图片路径',
    PRIMARY KEY (`advertis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

-------------------------------------------------------------------------
-- 7.用户注册  邮箱验证码表
DROP TABLE IF EXISTS `codes`;

CREATE TABLE `codes`(
    `id` INT AUTO_INCREMENT NOT NULL COMMENT '验证码ID，主键且自增',
    `email` varchar(100) NOT NULL COMMENT '注册使用邮箱',
    `number` INT UNSIGNED NOT NULL COMMENT '验证码',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 CHARSET=utf8;
--------------------------------------------------------------------
-- 8.用户文章表
DROP TABLE IF EXISTS `article`;

CREATE TABLE `article`(
    `article_id` INT AUTO_INCREMENT NOT NULL COMMENT '文章，主键且自增',
    `title` varchar(100) NOT NULL COMMENT '文章标题',
    `articlePic` varchar(200) NOT NULL COMMENT '文章图片',
    `article_content` TEXT NOT NULL COMMENT '文章内容',
    `article_date` INT NOT NULL COMMENT '文章时间戳' ,
    `author_id` mediumint(8) NOT NULL COMMENT '作者id 外键',
    PRIMARY KEY (`article_id`),
    foreign key(`author_id`) references `cfood_user`(`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

-------------------------------------------------------------------------
-- 9.轮播图
DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner`(
    `id` INT AUTO_INCREMENT NOT NULL COMMENT '轮播图ID，主键且自增',
    `pic` varchar(100) NOT NULL COMMENT '轮播图图片',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

LOCK TABLES `banner` WRITE;

-- INSERT INTO `banner` (`id`,`pic`) VALUES (1,'/images/banner1.jpg'),(2,'/images/banner2.jpg'),(3,'/images/banner3.jpg'),(4,'/images/banner4.jpg'),(5,'/images/banner5.jpg');

UNLOCK TABLES;

-------------------------------------------------------------------------
-- 10.创建用户反馈表
DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback`(
    `id` INT AUTO_INCREMENT NOT NULL COMMENT '反馈ID，主键且自增',
    `details` varchar(200) COMMENT '反馈内容',
    `user_id` INT UNSIGNED NOT NULL COMMENT '外键,用户ID',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

LOCK TABLES `feedback` WRITE;

-- INSERT INTO `feedback` (`id`,`details`,`user_id`) VALUES (1,NULL,1);

UNLOCK TABLES;
