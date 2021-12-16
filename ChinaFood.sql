
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
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('root','ff9830c42660c1dd1942844f8069b74a','12312@qq.com','licy',19,'/public/avatar/1.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('1234YUan','1b32ea179af6fbeee4945b69f0f692da','12312@qq.com','tom',18,'/public/avatar/2.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('root1','96c7a36b5ce81fa43e8279c6ca438231','12312@qq.com','baby',29,'/public/avatar/3.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('12981Y','e80d25cbaf905ebf1deb541af425434b','12312@qq.com','good',32,'/public/avatar/4.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('121J','da18b6fd33758e128cba26694d461a71','12312@qq.com','Lucy',22,'/public/avatar/5.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('root6','0de8594dd96f877e5ff1c0a8af897d61','12312@qq.com','Alit',24,'/public/avatar/6.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('12','165937b0a60d6dea259c1adc5d1bb909','12312@qq.com','Bob',101,'/public/avatar/7.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('13223','2c4a3dec7f6245d9ba25e58787862d5a','12312@qq.com','Right',12,'/public/avatar/8.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('12321','ecbe0757abdeb929a0b2488e90c9fb87','12312@qq.com','mounted',56,'/public/avatar/9.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('123dfdf','d8c6dad8bb983135db4730fe0ba89674','12312@qq.com','Mouth',14,'/public/avatar/10.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('12idfiadsfj','14ea78fa124cb3e53f8953fbca435c43','12312@qq.com','kittors',26,'/public/avatar/11.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('121fdad','ebbe35ad09f5f9c8b27e582eaf75937b','12312@qq.com','muster',23,'/public/avatar/12.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('root4','e5d9dee0892c9f474a174d3bfffb7810','12312@qq.com','Mater',20,'/public/avatar/13.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('root2','9b70d6dbfb1457d05e4e2c2fbb42d7db','12312@qq.com','Kily',19,'/public/avatar/14.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('root3','c63526821e73a8dc412566be9968bcd3','12312@qq.com','Berste',23,'/public/avatar/15.jpg');
INSERT INTO cfood_user(username,password,email,nickname,age,pic) VALUES('root5','530f086cfe178d16365a9ab9f537e81a','12312@qq.com','Wow',63,'/public/avatar/16.jpg');


#2.创建用户头像图库表
DROP TABLE IF EXISTS `avatar`;

CREATE TABLE `avatar`(
    `avatar_id` INT UNSIGNED AUTO_INCREMENT NOT NULL COMMENT '头像库ID，主键且自增',
    `images` varchar(100)  COMMENT '头像路径',
    PRIMARY KEY (`avatar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

INSERT INTO avatar(images) VALUES('/public/avatar/1.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/2.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/3.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/4.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/5.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/6.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/7.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/8.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/9.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/10.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/11.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/12.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/13.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/14.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/15.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/16.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/17.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/18.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/19.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/20.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/21.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/22.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/23.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/24.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/25.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/26.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/27.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/28.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/29.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/30.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/31.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/32.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/33.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/34.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/35.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/36.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/37.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/38.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/39.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/40.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/41.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/42.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/43.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/44.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/45.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/46.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/47.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/48.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/49.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/50.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/51.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/52.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/53.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/54.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/55.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/56.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/57.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/58.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/59.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/60.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/61.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/62.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/63.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/64.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/65.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/66.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/67.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/68.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/69.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/70.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/71.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/72.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/73.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/74.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/75.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/76.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/77.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/78.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/79.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/80.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/81.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/82.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/83.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/84.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/85.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/86.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/87.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/88.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/89.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/90.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/91.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/92.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/93.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/94.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/95.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/96.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/97.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/98.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/99.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/100.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/101.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/102.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/103.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/104.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/105.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/106.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/107.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/108.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/109.jpg');
INSERT INTO avatar(images) VALUES('/public/avatar/110.jpg');
#锁定headPortrait表的写入
#LOCK TABLES `headPortrait` WRITE;


#3.创建菜品分类表
DROP TABLE IF EXISTS `food_category`;
CREATE TABLE `food_category`(
    `category_id` INT NOT NULL AUTO_INCREMENT COMMENT '分类列表ID，主键且自增',
    `pic` varchar(100) NOT NULL  DEFAULT '/public/category/0.jpg' COMMENT '分类图标',
    `category_name` varchar(10) NOT NULL,
    PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;
INSERT INTO food_category(pic,category_name) VALUES('/public/category/tiandain2.png','甜点');
INSERT INTO food_category(pic,category_name) VALUES('/public/category/tanggen.png','汤羹');
INSERT INTO food_category(pic,category_name) VALUES('/public/category/rou2.png','肉类');
INSERT INTO food_category(pic,category_name) VALUES('/public/category/mogu.png','菌类');
INSERT INTO food_category(pic,category_name) VALUES('/public/category/lajiao.png','辣椒');
INSERT INTO food_category(pic,category_name) VALUES('/public/category/kugua.png','苦味');
INSERT INTO food_category(pic,category_name) VALUES('/public/category/shucai2.png','蔬菜');

LOCK TABLES `food_category` WRITE;
UNLOCK TABLES;

#4.创建菜品表  菜品编号非负数
DROP TABLE IF EXISTS `dishes`;
CREATE TABLE `dishes` (
    `dishes_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜品编号,主键且自增',
    `dishes_name` varchar(20) NOT NULL COMMENT '菜品名',
    `dishes_pic` varchar(20) DEFAULT '/food/default.jpg' COMMENT '默认菜品图片地址',
    `category_name` VARCHAR(20) COMMENT '菜系名字',
    `taste` VARCHAR(20) COMMENT '菜品味道',
    `category`  INT NOT NULL COMMENT '菜品分类id,外键',
    `score` INT(5)  COMMENT '菜品评分',
    `Material` varchar(200) COMMENT '食材材料'
    `steps`  varchar(2000) COMMENT '菜品的制作步骤',
    PRIMARY KEY (`dishes_id`),
    foreign key(`category`) references `food_category`(`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(1,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(2,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(3,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(4,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(5,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(6,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(7,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(8,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(9,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(10,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(11,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(12,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(13,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(14,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(15,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(16,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(17,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(18,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(19,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(20,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(21,);
INSERT INTO dishes(dishes_id,dishes_name,dishes_pic,category_name,taste,category,score,Material,steps) VALUES(22,);



# 5.创建定位地址表
DROP TABLE IF EXISTS `location`;

CREATE TABLE `location`(
    `location_id` INT AUTO_INCREMENT NOT NULL COMMENT '地址ID，主键且自增',
    `name` varchar(20) NOT NULL COMMENT '地址名称',
    PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;


#锁定写入
# LOCK TABLES `location` WRITE;



#6.创建广告宣传表 
DROP TABLE IF EXISTS `advertis`;

CREATE TABLE `advertis`(
    `advertis_id` INT AUTO_INCREMENT NOT NULL COMMENT '广告id',
    `images` varchar(100)  COMMENT '广告图片路径',
    PRIMARY KEY (`advertis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;


# 7.用户注册  邮箱验证码表
DROP TABLE IF EXISTS `codes`;

CREATE TABLE `codes`(
    `id` INT AUTO_INCREMENT NOT NULL COMMENT '验证码ID，主键且自增',
    `email` varchar(100) NOT NULL COMMENT '注册使用邮箱',
    `number` INT UNSIGNED NOT NULL COMMENT '验证码',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 CHARSET=utf8;


# 8.用户文章表
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


# 9.轮播图
DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner`(
    `id` INT AUTO_INCREMENT NOT NULL COMMENT '轮播图ID，主键且自增',
    `pic` varchar(100) NOT NULL COMMENT '轮播图图片',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8;

LOCK TABLES `banner` WRITE;

# INSERT INTO `banner` (`id`,`pic`) VALUES (1,'/public/banner/banner1.jpg'),(2,'/public/banner/banner2.jpg'),(3,'/public/banner/banner3.jpg'),(4,'/public/banner/banner4.jpg'),(5,'/public/banner/banner5.jpg');

UNLOCK TABLES;


# 10.创建用户反馈表
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

#11.作者表
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


