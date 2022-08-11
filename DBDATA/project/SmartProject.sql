-- (SmartProject.sql)

-- 데이터베이스 생성
CREATE DATABASE `smartproject` /*!40100 DEFAULT CHARACTER SET utf8 */;

-- 데이터베이스 사용
use smartproject;

-- 테이블 삭제
drop table  if exists admin;
drop table if exists members;
drop table if exists shop_order;
drop table if exists shop_product;

-- 테이블 생성
CREATE TABLE `admin` (
  `admin_id` varchar(20) NOT NULL,
  `admin_passwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `members` (
  `id` varchar(45) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `e_mail` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `shop_order` (
  `no` int(5) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(5) NOT NULL,
  `quantity` varchar(10) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `shop_product` (
  `no` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `detail` text,
  `date` varchar(20) DEFAULT NULL,
  `stock` varchar(10) DEFAULT NULL,
  `image` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- 데이터 조회
select * from admin;
select * from members;
select * from shop_order;
select * from shop_product;