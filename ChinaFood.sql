
SET names utf8;
DROP DATABASE IF EXISTS ChinaFood;
CREATE DATABASE ChinaFood charset utf8;
USE ChinaFood;



# 用户表
DROP TABLE IF EXISTS `cfood_user`;

CREATE TABLE `cfood_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '作者ID,主键且自增',
  `username` varchar(30) NOT NULL COMMENT '用户名,唯一',
  `password` varchar(32) NOT NULL COMMENT '密码,MD5',
  `nickname` varchar(30) DEFAULT NULL,
  `avatar` varchar(50) NOT NULL DEFAULT 'unnamed.jpg' COMMENT '用户头像',
  `article_number` mediumint(9) NOT NULL DEFAULT '0' COMMENT '发表的文章数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `cfood_user`;

#菜品表
DROP TABLE IF EXISTS `Food_Category`;
CREATE TABLE Food_Category (
  `category_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `category_name` varchar(30) NOT NULL COMMENT '菜系名',  --八大菜系 如川菜 
  `category_section` varchar(20) NOT NULL COMMENT '菜品时段类' , -- 如 ：早餐 晚餐 下午茶 甜品 夜宵 早午餐
  PRIMARY KEY (`category_id`), --设置主键
  -- FOREIGN KEY(category_id) REFERENCES Food_Classification(FC_category)
);

#广告宣传表 


#文章表