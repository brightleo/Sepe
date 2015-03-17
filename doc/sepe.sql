-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '$shiro1$SHA-256$500000$vEgQXP9//FEW/4AKvslZkQ==$5G2JPj8umTRl9rf7zc7t9V2ke7a2sgNPGIlqJyqh/EE=');
INSERT INTO `user` VALUES ('2', 'user', '$shiro1$SHA-256$500000$jcNrEhKxKT5UqQJouDiEBg==$LP5uvE2i1YMI5hEpvnfedcuCp3Wibe1Aa9IdfzvRkaY=');
-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `notice_date` date,
   `title` varchar(50),
   `type` varchar(1),
   `status` varchar(1),
   `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `usertel` varchar(100) ,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for salesman
-- ----------------------------
DROP TABLE IF EXISTS `salesman`;
CREATE TABLE `salesman` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` bigint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50),
  `parentname` varchar(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sub_order
-- ----------------------------
DROP TABLE IF EXISTS `sub_order`;
CREATE TABLE `sub_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `shipmentcode` varchar(50),
  `shipmentdate` date,
  `product_name` text,
  `quantity` bigint(20),
  `unitprice` decimal(18,2),
  `billingcode` varchar(50),
  `billingdate` date,
  `invoicecode` varchar(50),
  `billing_product_name` text,
  `billing_quantity` bigint(20),
  `billing_unitprice` decimal(18,2),
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tosection
-- ----------------------------
DROP TABLE IF EXISTS `tosection`;
CREATE TABLE `tosection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `tosectiondate` date,
  `tosection_amount` decimal(18,2),
  `tosection_comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(100),
  `product_type` varchar(50),
  `order_quantity` bigint(20),
  `sub_product_type` varchar(50),
  `customer` varchar(20),
  `customer_orderid` varchar(50),
  `salesman` varchar(20),
  `orderdate` date,
  `deliverydate` date,
  `paymenttype` text,
  `comment` text,
  `status` int,
  `orderamount` decimal(18,2),
  `shipmentamount` decimal(18,2),
  `billingamount` decimal(18,2),
  `tosectionamount` decimal(18,2),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` char(10) DEFAULT NULL,
  `time` char(8) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', 'user');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'order.view');
INSERT INTO `permission` VALUES ('2', 'order.create');
INSERT INTO `permission` VALUES ('3', 'order.edit');
INSERT INTO `permission` VALUES ('4', 'order.delete');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '2', '2');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '1');
INSERT INTO `role_permission` VALUES ('2', '1', '2');
INSERT INTO `role_permission` VALUES ('3', '1', '3');
INSERT INTO `role_permission` VALUES ('4', '1', '4');
INSERT INTO `role_permission` VALUES ('5', '2', '1');