/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.5.15 : Database - ssm_onlinemealorder
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_onlinemealorder` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm_onlinemealorder`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `receiver_name` varchar(20) DEFAULT NULL,
  `receiver_phone` varchar(20) DEFAULT NULL,
  `receiver_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`id`,`user_id`,`receiver_name`,`receiver_phone`,`receiver_address`) values (1,2,'zxm呀','13543235415','钟落潭仲恺农业工程学院12209'),(2,2,'cml123','13543235415','钟落潭仲恺农业工程学院18804'),(3,2,'张锡鸣','135423235415','12209'),(4,2,'zzz','13543235471','仲恺教务处'),(5,2,'ccc','13543235415','仲恺D栋201'),(6,3,'zhang','13543235417','仲恺1220977'),(7,3,'chen','13543235481','zhku18809');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`password`) values (1,'admin1','123456'),(2,'admin2','123456');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `menu_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

insert  into `cart`(`cart_id`,`user_id`,`menu_id`,`menu_num`) values (17,2,1,2);

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `collect` */

insert  into `collect`(`id`,`user_id`,`shop_id`) values (6,2,1);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`user_id`,`shop_id`,`menu_id`,`content`,`createtime`) values (2,3,2,5,'hanbaobao','2020-06-25');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `menu_name` varchar(20) DEFAULT NULL,
  `menu_img` varchar(200) DEFAULT NULL,
  `menu_price` int(11) DEFAULT NULL,
  `menu_count` int(11) DEFAULT NULL,
  `menu_sell` int(11) DEFAULT NULL,
  `menu_comment` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`menu_id`,`shop_id`,`menu_name`,`menu_img`,`menu_price`,`menu_count`,`menu_sell`,`menu_comment`) values (1,1,'老鸭粉丝汤','upload/oldduck1.jpg',16,96,0,0),(2,1,'老鸭面汤','upload/oldduck2.jpg',20,96,3,0),(3,3,'脆皮烧鸭饭','upload/cf7a240b5f9e43569ca235295b7a4cbe_2018109938326791.jpg',13,20,0,0),(4,3,'均衡饮食餐','upload/bccac830533647e4bd62c3077d10e9f8_timg.jpg',20,10,0,0),(5,2,'汉堡王','upload/06bddd4cdd824b69bbf6b2dbca9e895d_ce70306ddd89fa289ed505706fe4ad82.jpg',8,39,1,0),(6,4,'烤鸡中翅','upload/jzc.jpg',6,35,2,0),(7,5,'皮蛋瘦肉粥','upload/pd.jpg',9,66,0,0),(8,6,'铁板烧鱿鱼','upload/a6ac182e835c4cc9bdfbe76c905a9389_ts.jpg',12,21,0,NULL);

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `paystate` int(11) DEFAULT NULL,
  `deliverstate` int(11) DEFAULT NULL,
  `arrivestate` int(11) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`id`,`order_id`,`user_id`,`address_id`,`price`,`paystate`,`deliverstate`,`arrivestate`,`createtime`) values (8,'20200611135469429',2,1,63,2,1,0,'2020-06-11 10:00:00'),(10,'20200619231649389',2,3,11,1,1,0,'2020-06-19 23:16:12'),(11,'20200620215221650',2,1,79,1,0,0,'2020-06-20 21:52:40'),(12,'20200624233543278',3,6,23,1,0,0,'2020-06-24 23:35:03');

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `orderitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `buynum` int(11) DEFAULT NULL,
  `totalprice` int(11) DEFAULT NULL,
  `commentstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderitem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `order_item` */

insert  into `order_item`(`orderitem_id`,`order_id`,`menu_id`,`buynum`,`totalprice`,`commentstate`) values (8,'20200611135469429',2,3,60,1),(10,'20200619231649389',5,1,8,0),(11,'20200620215221650',2,3,60,0),(12,'20200620215221650',5,2,16,0),(13,'20200624233543278',6,2,12,2),(14,'20200624233543278',5,1,8,2);

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(50) DEFAULT NULL,
  `shop_img` varchar(200) DEFAULT NULL,
  `shop_type` varchar(20) DEFAULT NULL,
  `shop_address` varchar(100) DEFAULT NULL,
  `shop_phone` varchar(20) DEFAULT NULL,
  `shop_special` varchar(30) DEFAULT NULL,
  `shop_discount` varchar(50) DEFAULT NULL,
  `shop_price` varchar(50) DEFAULT NULL,
  `opentime` varchar(50) DEFAULT NULL,
  `shop_income` int(11) DEFAULT NULL,
  `shop_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `shop` */

insert  into `shop`(`id`,`shop_name`,`shop_img`,`shop_type`,`shop_address`,`shop_phone`,`shop_special`,`shop_discount`,`shop_price`,`opentime`,`shop_income`,`shop_state`) values (1,'老鸭粉丝汤店','upload/7ae519ef002346edafb1ac52f8ad1d8a_267f9e2f07082838685c484ab999a9014c08f11f.jpg','米粉面馆','白云区钟落潭188号路口','7758258','老鸭粉丝汤','送一份肉丸','20-50元','8:00-14:00',60,1),(2,'汉堡大亨','upload/hbdh.jpg','汉堡披萨','白云区人和镇地铁口A出口','123456789','汉堡、炸鸡块','没有优惠','20-50元','10:00-16:00',32,1),(3,'旧时光餐厅','upload/09026108d5594abba708a47e3b766862_timg.jpg','快餐便当','白云区马沥村','999999','烧鸭烤鸭样样齐全','打折是不可能的','20元以下','10:00-12:00',0,1),(4,'北京烤串串','upload/kc.jpg','炸鸡烤串','白云区钟落潭108路xxx','66666666','烤串串','满10元就再买100元呗','20-50元','12:00-16:00',24,1),(5,'七号粥铺','upload/qihao.jpg','包子粥店','白云区马洞村路口','888888','粥店','没有yh','20元以下','8:00-12:00',0,0),(6,'憨憨铁板烧','upload/a3bc7334a9e64abcb3022b3ee9634233_timg.jpg','炸鸡烤串','钟落潭机电学院旁边','1111111','铁板烧，万物皆可烧','小本生意，没有优惠','20-50元','18:00-24:00',0,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(11) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `isused` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`phone`,`img`,`isused`) values (1,'谦风','123456789','5306@qq.com','13543235415','upload/tou1.jpg',1),(2,'nihao','123456789','nihao@163.com','13411291647','upload/6767996f257b4a5ea3d6070cdfa77453_dd.PNG',1),(3,'zhangx','123456789','zhang@qq.com','13543235417','upload/56e8950cb3314dad80765db4d3c50d36_1111.jpg',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
