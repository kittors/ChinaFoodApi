
#创建ChinaFood数据库
SET NAMES UTF8;
DROP DATABASE IF EXISTS `ChinaFood`;
CREATE DATABASE IF  NOT EXISTS  `ChinaFood` DEFAULT  CHARACTER SET 'utf8';
USE `ChinaFood`;



#1.创建用户表
DROP TABLE IF EXISTS `cfood_user`;

CREATE TABLE `cfood_user` (
  `user_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '用户ID,主键且自增',
  `username` varchar(30) NOT NULL COMMENT '用户名,唯一',
  `password` varchar(32) NOT NULL COMMENT '密码,MD5',
  `email` varchar(50) NOT NULL COMMENT '用户邮箱',
  `nickname` varchar(30) COMMENT '用户昵称',
  `age` INT NOT NULL COMMENT '年龄',
  `pic` varchar(50) DEFAULT '/public/avatar/0.jpg' COMMENT '用户默认头像',
  `article_number` mediumint(9) NOT NULL DEFAULT '0' COMMENT '发表的文章数量',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
#锁定cfood_user表的写入
# LOCK TABLES `cfood_user` WRITE;  


#3.创建用户头像图库表
DROP TABLE IF EXISTS `avatar`;

CREATE TABLE `avatar`(
    `avatar_id` INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT '头像库ID，主键且自增',
    `images` varchar(100)  COMMENT '头像路径',
    PRIMARY KEY (`avatar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

#锁定headPortrait表的写入
#LOCK TABLES `headPortrait` WRITE;


#4.创建菜品分类表
DROP TABLE IF EXISTS `food_category`;
CREATE TABLE `food_category`(
    `category_id` INT NOT NULL AUTO_INCREMENT COMMENT '分类列表ID，主键且自增',
    `pic` varchar(100) NOT NULL  DEFAULT '/public/category/0.jpg' COMMENT '分类图标',
    `category_name` varchar(10) NOT NULL,
    PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;
LOCK TABLES `food_category` WRITE;
UNLOCK TABLES;

#5.创建菜品表  菜品编号非负数
DROP TABLE IF EXISTS `dishes`;
CREATE TABLE `dishes` (
    `dishes_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜品编号,主键且自增',
    `dishes_name` varchar(20) NOT NULL COMMENT '菜品名',
    `dishes_pic` varchar(20) DEFAULT '/food/default.jpg' COMMENT '默认菜品图片地址',
    `category_name` VARCHAR(20) COMMENT '菜系名字',
    `taste` VARCHAR(20) COMMENT '菜品味道',
    `category`  INT NOT NULL COMMENT '菜品分类id,外键',
    `score` INT(5)  COMMENT '菜品评分',
    `steps`  varchar(2000) COMMENT '菜品的制作步骤',
    PRIMARY KEY (`dishes_id`),
    foreign key(`category`) references `food_category`(`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;



# 6.创建定位地址表
DROP TABLE IF EXISTS `location`;

CREATE TABLE `location`(
    `location_id` INT AUTO_INCREMENT NOT NULL COMMENT '地址ID，主键且自增',
    `name` varchar(20) NOT NULL COMMENT '地址名称',
    `initials` varchar(5)  COMMENT '首字母排序',
    PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;


#锁定写入
# LOCK TABLES `location` WRITE;



#7.创建广告宣传表 
DROP TABLE IF EXISTS `advertis`;

CREATE TABLE `advertis`(
    `advertis_id` INT AUTO_INCREMENT NOT NULL COMMENT '广告id',
    `images` varchar(100)  COMMENT '广告图片路径',
    PRIMARY KEY (`advertis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;


# 8.用户注册  邮箱验证码表
DROP TABLE IF EXISTS `codes`;

CREATE TABLE `codes`(
    `id` INT AUTO_INCREMENT NOT NULL COMMENT '验证码ID，主键且自增',
    `email` varchar(100) NOT NULL COMMENT '注册使用邮箱',
    `number` INT UNSIGNED NOT NULL COMMENT '验证码',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 CHARSET=utf8;


# 9.用户文章表
DROP TABLE IF EXISTS `article`;

CREATE TABLE `article`(
    `article_id` INT AUTO_INCREMENT NOT NULL COMMENT '文章，主键且自增',
    `title` varchar(100) NOT NULL COMMENT '文章标题',
    `articlePic` varchar(200) DEFAULT '/public/articles/default.jpg' NOT NULL COMMENT '文章图片',
    `article_content` TEXT NOT NULL COMMENT '文章内容',
    `article_date` INT NOT NULL COMMENT '文章时间戳' ,
    `author_id` mediumint(8) NOT NULL COMMENT '作者id 外键',
    `author_name` varchar(30) NOT NULL COMMENT '作者名字',
    PRIMARY KEY (`article_id`),
    foreign key(`author_id`) references `cfood_user`(`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;


# 10.轮播图
DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner`(
    `id` INT AUTO_INCREMENT NOT NULL COMMENT '轮播图ID，主键且自增',
    `pic` varchar(100) NOT NULL COMMENT '轮播图图片',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

LOCK TABLES `banner` WRITE;

# INSERT INTO `banner` (`id`,`pic`) VALUES (1,'/images/banner1.jpg'),(2,'/images/banner2.jpg'),(3,'/images/banner3.jpg'),(4,'/images/banner4.jpg'),(5,'/images/banner5.jpg');

UNLOCK TABLES;


# 11.创建用户反馈表
DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback`(
    `id` INT AUTO_INCREMENT NOT NULL COMMENT '反馈ID，主键且自增',
    `details` varchar(200) NOT NULL COMMENT '反馈内容',
    `user_id` mediumint(8) NOT NULL COMMENT '外键,用户ID',
    PRIMARY KEY (`id`),
    foreign key(`user_id`) references `cfood_user`(`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

LOCK TABLES `feedback` WRITE;

# INSERT INTO `feedback` (`id`,`details`,`user_id`) VALUES (1,NULL,1);
UNLOCK TABLES;

#2.作者表
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author`(
    `author_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '作者ID,主键且自增',
    `author_name` varchar(30) NOT NULL COMMENT '作者名',
    `article_id` INT COMMENT '文章id,外键',
    PRIMARY KEY (`author_id`),
    foreign key(`article_id`) references `article`(`article_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;


# 12.创建用户关注表
DROP TABLE IF EXISTS `follow`;

CREATE TABLE `follow`(
    `id` INT AUTO_INCREMENT NOT NULL COMMENT '关注ID，主键且自增',
    `author_id`  mediumint(8) NOT NULL COMMENT '外键,作者ID',
    `user_id` mediumint(8)  NOT NULL COMMENT '外键,用户ID',
    PRIMARY KEY (`id`),
    foreign key(`user_id`) references `cfood_user`(`user_id`),
    foreign key(`author_id`) references `author`(`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

LOCK TABLES `follow` WRITE;

# INSERT INTO `follow` (`id`,`author_id`,`user_id`) VALUES (1,2,1),(2,3,2);

UNLOCK TABLES;


