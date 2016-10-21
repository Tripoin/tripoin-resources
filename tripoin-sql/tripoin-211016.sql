/*
Navicat MySQL Data Transfer

Source Server         : mysql-local-xampp
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : tripoin

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-10-21 17:58:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mst_api_type`
-- ----------------------------
DROP TABLE IF EXISTS `mst_api_type`;
CREATE TABLE `mst_api_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) NOT NULL,
  `name` varchar(255) NOT NULL,
  `api_type_identifier` varchar(150) NOT NULL,
  `api_type_secret` varchar(150) NOT NULL,
  `api_type_host` varchar(150) NOT NULL,
  `api_type_port` varchar(10) NOT NULL,
  `api_type_protocol` varchar(150) NOT NULL,
  `api_type_redirect` varchar(255) DEFAULT NULL,
  `api_type_expired` varchar(100) DEFAULT NULL,
  `status` smallint(5) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` varchar(150) DEFAULT 'admin',
  `created_ip` varchar(150) DEFAULT '127.0.0.1',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_platform` varchar(255) DEFAULT NULL,
  `modified_by` varchar(150) DEFAULT NULL,
  `modified_ip` varchar(150) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `modified_platform` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_type_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mst_api_type
-- ----------------------------
INSERT INTO `mst_api_type` VALUES ('1', 'FACEBOOK', 'Facebook API', '1569758926648647', 'af4af3d0b5f00378b213e8b3ce9c2bee', 'https://graph.facebook.com', '443', 'https', 'http://localhost:8080/api/secret/facebook', null, null, null, 'admin', '127.0.0.1', '2016-09-01 12:04:35', null, null, null, null, null);

-- ----------------------------
-- Table structure for `mst_branch`
-- ----------------------------
DROP TABLE IF EXISTS `mst_branch`;
CREATE TABLE `mst_branch` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `company_id` bigint(50) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_company` (`company_id`),
  CONSTRAINT `fk_company` FOREIGN KEY (`company_id`) REFERENCES `mst_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mst_branch
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_company`
-- ----------------------------
DROP TABLE IF EXISTS `mst_company`;
CREATE TABLE `mst_company` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mst_company
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_employee`
-- ----------------------------
DROP TABLE IF EXISTS `mst_employee`;
CREATE TABLE `mst_employee` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `profile_id` bigint(50) DEFAULT NULL,
  `profile_parent_id` bigint(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_employee` (`profile_id`),
  KEY `fk_profil_parent_employee` (`profile_parent_id`),
  CONSTRAINT `fk_profil_parent_employee` FOREIGN KEY (`profile_parent_id`) REFERENCES `sec_user_profile` (`id`),
  CONSTRAINT `fk_profile_employee` FOREIGN KEY (`profile_id`) REFERENCES `sec_user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mst_employee
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_finance_account`
-- ----------------------------
DROP TABLE IF EXISTS `mst_finance_account`;
CREATE TABLE `mst_finance_account` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `account_id` varchar(50) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mst_finance_account
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_guarantee`
-- ----------------------------
DROP TABLE IF EXISTS `mst_guarantee`;
CREATE TABLE `mst_guarantee` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `merchant_guarantee` int(20) DEFAULT NULL,
  `brand_guarantee` int(20) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mst_guarantee
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_info_address`
-- ----------------------------
DROP TABLE IF EXISTS `mst_info_address`;
CREATE TABLE `mst_info_address` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `detail_address` text,
  `province_id` bigint(10) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `district_id` bigint(20) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mst_info_address
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_info_contact`
-- ----------------------------
DROP TABLE IF EXISTS `mst_info_contact`;
CREATE TABLE `mst_info_contact` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `personal_number` varchar(20) DEFAULT NULL,
  `phone_number1` varchar(20) DEFAULT NULL,
  `phone_number2` varchar(20) DEFAULT NULL,
  `fax_number` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mst_info_contact
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_locale`
-- ----------------------------
DROP TABLE IF EXISTS `mst_locale`;
CREATE TABLE `mst_locale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` smallint(5) DEFAULT '1',
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` varchar(150) DEFAULT 'admin',
  `created_ip` varchar(150) DEFAULT '127.0.0.1',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_platform` varchar(255) DEFAULT NULL,
  `modified_by` varchar(150) DEFAULT NULL,
  `modified_ip` varchar(150) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `modified_platform` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mst_locale
-- ----------------------------
INSERT INTO `mst_locale` VALUES ('1', 'ar', 'Arabic', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('2', 'am', 'Amharic', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('3', 'bg', 'Bulgarian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('4', 'bn', 'Bengali', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('5', 'ca', 'Catalan', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('6', 'cs', 'Czech', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('7', 'da', 'Danish', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('8', 'de', 'German', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('9', 'el', 'Greek', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('10', 'en', 'English', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('11', 'en_GB', 'English (Great Britain)', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('12', 'en_US', 'English (USA)', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('13', 'es', 'Spanish', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('14', 'es_419', 'Spanish (Latin America and Caribbean)', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('15', 'et', 'Estonian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('16', 'fa', 'Persian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('17', 'fi', 'Finnish', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('18', 'fil', 'Filipino', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('19', 'fr', 'French', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('20', 'gu', 'Gujarati', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('21', 'he', 'Hebrew', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('22', 'hi', 'Hindi', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('23', 'hr', 'Croatian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('24', 'hu', 'Hungarian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('25', 'id', 'Indonesian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('26', 'it', 'Italian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('27', 'ja', 'Japanese', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('28', 'kn', 'Kannada', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('29', 'ko', 'Korean', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('30', 'lt', 'Lithuanian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('31', 'lv', 'Latvian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('32', 'ml', 'Malayalam', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('33', 'mr', 'Marathi', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('34', 'ms', 'Malay', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('35', 'nl', 'Dutch', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('36', 'no', 'Norwegian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('37', 'pl', 'Polish', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('38', 'pt_BR', 'Portuguese (Brazil)', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('39', 'pt_PT', 'Portuguese (Portugal)', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('40', 'ro', 'Romanian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('41', 'ru', 'Russian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('42', 'sk', 'Slovak', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('43', 'sl', 'Slovenian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('44', 'sr', 'Serbian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('45', 'sv', 'Swedish', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('46', 'sw', 'Swahili', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('47', 'ta', 'Tamil', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('48', 'te', 'Telugu', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('49', 'th', 'Thai', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('50', 'tr', 'Turkish', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('51', 'uk', 'Ukrainian', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('52', 'vi', 'Vietnamese', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('53', 'zh_CN', 'Chinese (China)', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);
INSERT INTO `mst_locale` VALUES ('54', 'zh_TW', 'Chinese (Taiwan)', '1', null, 'admin', '127.0.0.1', '2016-09-04 22:36:21', null, null, null, null, null);

-- ----------------------------
-- Table structure for `mst_point_of_sales`
-- ----------------------------
DROP TABLE IF EXISTS `mst_point_of_sales`;
CREATE TABLE `mst_point_of_sales` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mst_point_of_sales
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_product`
-- ----------------------------
DROP TABLE IF EXISTS `mst_product`;
CREATE TABLE `mst_product` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `category_id` bigint(50) DEFAULT NULL,
  `type_id` bigint(50) DEFAULT NULL,
  `brand_id` bigint(50) DEFAULT NULL,
  `supplier_id` bigint(50) DEFAULT NULL,
  `price_id` bigint(50) DEFAULT NULL,
  `stock_id` bigint(100) DEFAULT NULL,
  `guarantee_id` bigint(50) DEFAULT NULL,
  `image_url` varchar(50) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`category_id`),
  KEY `fk_product_type` (`type_id`),
  KEY `fk_product_brand` (`brand_id`),
  KEY `fk_supplier` (`supplier_id`),
  KEY `fk_product_price` (`price_id`),
  KEY `fk_product_stock` (`stock_id`),
  KEY `fk_guarantee` (`guarantee_id`),
  CONSTRAINT `fk_guarantee` FOREIGN KEY (`guarantee_id`) REFERENCES `mst_guarantee` (`id`),
  CONSTRAINT `fk_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `mst_product_brand` (`id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `mst_product_category` (`id`),
  CONSTRAINT `fk_product_price` FOREIGN KEY (`price_id`) REFERENCES `trx_price` (`id`),
  CONSTRAINT `fk_product_stock` FOREIGN KEY (`stock_id`) REFERENCES `mst_product_stock` (`id`),
  CONSTRAINT `fk_product_type` FOREIGN KEY (`type_id`) REFERENCES `mst_product_type` (`id`),
  CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `mst_supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mst_product
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_product_brand`
-- ----------------------------
DROP TABLE IF EXISTS `mst_product_brand`;
CREATE TABLE `mst_product_brand` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mst_product_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_product_category`
-- ----------------------------
DROP TABLE IF EXISTS `mst_product_category`;
CREATE TABLE `mst_product_category` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mst_product_category
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_product_stock`
-- ----------------------------
DROP TABLE IF EXISTS `mst_product_stock`;
CREATE TABLE `mst_product_stock` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `warehouse_stock` bigint(50) DEFAULT NULL,
  `display_stock` int(20) DEFAULT NULL,
  `unit_id` bigint(50) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mst_unit` (`unit_id`),
  CONSTRAINT `fk_mst_unit` FOREIGN KEY (`unit_id`) REFERENCES `mst_product_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mst_product_stock
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_product_type`
-- ----------------------------
DROP TABLE IF EXISTS `mst_product_type`;
CREATE TABLE `mst_product_type` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mst_product_type
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_product_unit`
-- ----------------------------
DROP TABLE IF EXISTS `mst_product_unit`;
CREATE TABLE `mst_product_unit` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mst_product_unit
-- ----------------------------

-- ----------------------------
-- Table structure for `mst_profile`
-- ----------------------------
DROP TABLE IF EXISTS `mst_profile`;
CREATE TABLE `mst_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `profile_email` varchar(255) NOT NULL,
  `profile_gender` varchar(255) DEFAULT NULL,
  `profile_birthdate` date DEFAULT NULL,
  `profile_address` text,
  `profile_phone` varchar(255) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `profile_bio` text,
  `profile_resources_uuid` varchar(255) DEFAULT NULL,
  `profile_forgot_uuid` varchar(255) DEFAULT NULL,
  `profile_forgot_expired` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `locale_id` bigint(20) NOT NULL DEFAULT '10',
  `status` smallint(5) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` varchar(150) DEFAULT 'admin',
  `created_ip` varchar(150) DEFAULT '127.0.0.1',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_platform` varchar(255) DEFAULT NULL,
  `modified_by` varchar(150) DEFAULT NULL,
  `modified_ip` varchar(150) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `modified_platform` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_email` (`profile_email`),
  UNIQUE KEY `profile_phone` (`profile_phone`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`),
  KEY `locale_id` (`locale_id`),
  CONSTRAINT `mst_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sec_user_details` (`user_id`),
  CONSTRAINT `mst_profile_ibfk_2` FOREIGN KEY (`locale_id`) REFERENCES `mst_locale` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mst_profile
-- ----------------------------
INSERT INTO `mst_profile` VALUES ('1', 'tripoinstudio@gmail.com', 'Tripoin, Inc.', 'tripoinstudio@gmail.com', 'MALE', '2016-01-01', 'Jalan Kapten Subidjanto DJ', '0812345678', null, null, null, null, null, '1', '25', null, null, 'admin', '127.0.0.1', '2016-08-31 10:36:29', null, null, null, null, null);
INSERT INTO `mst_profile` VALUES ('2', 'user@mail.com', 'User', 'user@mail.com', 'FEMALE', '2016-10-12', 'Jalan Kapten Subidjanto DJ', '0812345679', null, null, null, null, null, '2', '10', null, null, 'admin', '127.0.0.1', '2016-10-12 23:58:32', null, null, null, null, null);

-- ----------------------------
-- Table structure for `mst_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `mst_supplier`;
CREATE TABLE `mst_supplier` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `address_id` bigint(50) DEFAULT NULL,
  `contact_id` bigint(50) DEFAULT NULL,
  `finance_account_id` bigint(50) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_info` (`address_id`),
  KEY `fk_contact_info` (`contact_id`),
  KEY `fk_finance` (`finance_account_id`),
  CONSTRAINT `fk_address_info` FOREIGN KEY (`address_id`) REFERENCES `mst_info_address` (`id`),
  CONSTRAINT `fk_contact_info` FOREIGN KEY (`contact_id`) REFERENCES `mst_info_contact` (`id`),
  CONSTRAINT `fk_finance` FOREIGN KEY (`finance_account_id`) REFERENCES `mst_finance_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mst_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for `oauth_access_token`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) DEFAULT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------
INSERT INTO `oauth_access_token` VALUES ('2321af6a009c91500512adfb59f52d56', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000157B9FD87BC787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002434653630386332362D343561362D343862332D393432312D6461393761613038323934637371007E0009770800000157BAC3076278737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000374000574727573747400047265616474000577726974657874000662656172657274002430663339326366392D343132642D346366352D616163652D386663336163633131646331, '897010ef01712980801ff8fb7d1bfe6c', null, 'tripoin', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870, '4f6f018aeba4dafb69a996b8a3d0ff0c');

-- ----------------------------
-- Table structure for `oauth_client_details`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('tripoin', 'ws_api', '$2a$11$gxpnezmYfNJRYnw/EpIK5Oe08TlwZDmcmUeKkrGcSGGHXvWaxUwQ2', 'trust,read,write', 'client_credentials,authorization_code,implicit,password,refresh_token', null, 'ROLE_ADMIN', '4500', '45000', null, null);
INSERT INTO `oauth_client_details` VALUES ('user', 'ws_api', '$2a$11$gxpnezmYfNJRYnw/EpIK5Oe08TlwZDmcmUeKkrGcSGGHXvWaxUwQ2', 'trust,read,write', 'client_credentials,authorization_code,implicit,password,refresh_token', null, 'ROLE_USER', '4500', '45000', null, null);

-- ----------------------------
-- Table structure for `oauth_refresh_token`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------
INSERT INTO `oauth_refresh_token` VALUES ('7ec75bae423fcc0a0ad844c6450fcef1', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002462383230383736362D356538372D346630622D623135632D3164393165396136396463327372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156B335ECF478, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740009524F4C455F555345527871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('b724f9a704b5a3e9278254fe0862751d', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002436306632313863612D616561352D343436642D626334372D3166333666343033333639667372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156B8E19A0878, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740009524F4C455F555345527871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('287ac8ec04bf1ffae6ba38b8e58f0a78', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002436633535383565612D343037372D343231612D616631612D6333653837333334666238347372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156B92B99A678, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740009524F4C455F555345527871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('fa5d2c775aab058be5d8abebc23bc06f', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002464343164386232362D623133622D346364382D623430302D3961666563383266653362617372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156E1B799F078, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('d435b12d867b194a0ff0a120cd2d908f', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002438343230616662392D336165662D343465612D613830322D6531383264636165366532637372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156E3FBD00578, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('39d31414a8ae4751b7ba9e3f6c03120d', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002431663062626161662D623838352D343036612D623631342D3039366130303765653463387372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156E68E113378, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('51f4fc4065d4ac24dcfb1a549fd7e57f', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002439613331356330382D636137382D346534662D386263612D3935376133346437626664307372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156EC8F7FE378, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('1ef38076838d85aad97ffc22f94ca632', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002437346664636432302D323632362D346465362D623634362D6130383461373734383531647372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156EF09138F78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('e987efba62ea71e1d6fc889a353b284a', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002465333430363962632D353130332D343832352D626539342D6137633431383563636235627372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156EF515CF578, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('2f4a25b0b3b10d085b124fd4e08e0361', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002463376132386530362D376433332D343331642D393232662D6564333837396336353438377372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156EF82090E78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('645eedf4d905d6ab6316eec9a0c2f160', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002439626538333532312D396234312D343634632D613133342D6232313339396163353766667372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156EFAF3E8878, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('117670142ed25921162af3bb4766f081', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002464313737373038652D326433612D346537342D613563352D6235616562306439353831307372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156F8B774CB78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('74092c878004f77f478f8b56b5f7720c', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002432356266363765382D333330352D346362652D393332372D3065313334366238356163327372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000156F8FE927C78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('7e019410d2c5046b2c714328d2c7177d', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002461643861376262382D343535362D343365352D626637312D3434633166353834383461317372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001570B3E114B78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('4f6f018aeba4dafb69a996b8a3d0ff0c', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002434653630386332362D343561362D343862332D393432312D6461393761613038323934637372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000157BAC3076278, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001400200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200065A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0013787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00137870740007747269706F696E737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7378737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740005747275737474000472656164740005777269746578017371007E0020770C000000103F4000000000000171007E000F787371007E00193F40000000000010770800000010000000007870707371007E0020770C000000003F400000000000007870);

-- ----------------------------
-- Table structure for `sec_role`
-- ----------------------------
DROP TABLE IF EXISTS `sec_role`;
CREATE TABLE `sec_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(50) NOT NULL,
  `role_status` smallint(5) NOT NULL,
  `role_remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_code` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sec_role
-- ----------------------------
INSERT INTO `sec_role` VALUES ('1', 'ROLE_USER', '1', 'Role User');
INSERT INTO `sec_role` VALUES ('2', 'ROLE_ADMIN', '1', 'Role Administrator');
INSERT INTO `sec_role` VALUES ('3', 'ROLE_SUPERADMIN', '1', 'Role Special Administrator');
INSERT INTO `sec_role` VALUES ('4', 'ROLE_THIRD_PARTY', '0', 'Role Third Party');

-- ----------------------------
-- Table structure for `sec_user_details`
-- ----------------------------
DROP TABLE IF EXISTS `sec_user_details`;
CREATE TABLE `sec_user_details` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `client_id` varchar(50) NOT NULL,
  `user_enabled` smallint(5) NOT NULL,
  `user_expired_date` timestamp NULL DEFAULT NULL,
  `user_credentials_expired_date` timestamp NULL DEFAULT NULL,
  `user_non_locked` smallint(5) DEFAULT '1',
  `role_id` bigint(20) NOT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_username` (`client_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `sec_user_details_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sec_role` (`role_id`),
  CONSTRAINT `sec_user_details_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `oauth_client_details` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sec_user_details
-- ----------------------------
INSERT INTO `sec_user_details` VALUES ('1', null, 'tripoin', '1', null, null, '1', '2', null, null, null);
INSERT INTO `sec_user_details` VALUES ('2', null, 'user', '1', null, null, '1', '1', null, null, null);

-- ----------------------------
-- Table structure for `sec_user_profile`
-- ----------------------------
DROP TABLE IF EXISTS `sec_user_profile`;
CREATE TABLE `sec_user_profile` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address_id` bigint(50) DEFAULT NULL,
  `contact_id` bigint(50) DEFAULT NULL,
  `user_detail_id` bigint(50) DEFAULT NULL,
  `branch_id` bigint(50) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_user` (`address_id`),
  KEY `fk_contact_user` (`contact_id`),
  KEY `fk_user` (`user_detail_id`),
  KEY `fk_branch_user` (`branch_id`),
  CONSTRAINT `fk_address_user` FOREIGN KEY (`address_id`) REFERENCES `mst_info_address` (`id`),
  CONSTRAINT `fk_branch_user` FOREIGN KEY (`branch_id`) REFERENCES `mst_branch` (`id`),
  CONSTRAINT `fk_contact_user` FOREIGN KEY (`contact_id`) REFERENCES `mst_info_contact` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_detail_id`) REFERENCES `sec_user_details` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sec_user_profile
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_payment_type_detail`
-- ----------------------------
DROP TABLE IF EXISTS `sys_payment_type_detail`;
CREATE TABLE `sys_payment_type_detail` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `payment_type` smallint(1) DEFAULT NULL COMMENT '1 = tunai/cash, 2 = debit/credit',
  `card_number` varchar(30) DEFAULT NULL,
  `receipt` varchar(30) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_payment_type_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_pos_shift`
-- ----------------------------
DROP TABLE IF EXISTS `sys_pos_shift`;
CREATE TABLE `sys_pos_shift` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_pos_shift
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_system_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `sys_system_parameter`;
CREATE TABLE `sys_system_parameter` (
  `system_parameter_id` bigint(20) NOT NULL,
  `system_parameter_code` varchar(100) NOT NULL,
  `system_parameter_value` text NOT NULL,
  `status` smallint(5) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` varchar(150) DEFAULT 'admin',
  `created_ip` varchar(150) DEFAULT '127.0.0.1',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_platform` varchar(255) DEFAULT NULL,
  `modified_by` varchar(150) DEFAULT NULL,
  `modified_ip` varchar(150) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `modified_platform` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`system_parameter_id`),
  UNIQUE KEY `system_parameter_code` (`system_parameter_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_system_parameter
-- ----------------------------
INSERT INTO `sys_system_parameter` VALUES ('1', 'TRIPOIN.EMAIL.FORGOT.PASSWORD.SUBJECT', 'Request Reset Password', '1', 'Subject Email Forgot Password', 'admin', '127.0.0.1', '2015-10-31 17:00:00', null, null, null, null, null);
INSERT INTO `sys_system_parameter` VALUES ('2', 'TRIPOIN.EMAIL.FORGOT.PASSWORD.BODY.MESSAGE', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"> <html>  	<head> 	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /> 	<meta name=\"viewport\" content=\"width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0\" /> 	<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" /> 	<style type=\"text/css\"> 	@media only screen and (max-width: 320px) { 	table[class=\"edu-module\"]{ 	border-radius: 0px !important; 	-webkit-border-radius: 0px !important; 	-moz-border-radius: 0px !important; 	} 	td[class=\"edu-margins\"]{ 	background-color: #f5f8fa; 	} 	td[class=\"edu-collapse\"]{ 	width: 0px !important; 	} 	td[class=\"edu-space\"]{ 	height: 10px !important; 	background-color: #f5f8fa; 	} 	td[class=\"mobile-height\"]{ 	height: 30px !important; 	} 	} 	@media only screen and (max-width: 420px) { 	span[class=\"address\"] a { 	line-height:18px !important; 	} 	td[class=\"margins\"]{ 	width:18px !important; 	} 	td[class=\"edu-margins\"]{ 	width:18px !important; 	} 	td[class=\"logo_space\"]{ 	height:12px !important; 				} 			}  			@media only screen and (max-width: 480px) { 				table[class=\"collapse\"]{ 					width:100% !important; 				} 				table[class=\"edu-module\"]{ 					width:100% !important; 				} 				span[class=\"address\"]{ 					display:block !important; 					width:240px !important; 				} 				td[class=\"cut\"]{ 					display:none !important; 				} 			} 		</style> 	</head> 	<body bgcolor=\"#FAFAFA\" style=\"margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;\"> 		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" bgcolor=\"#FAFAFA\" style=\"background-color:#FAFAFA;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"body_wrapper\"> 			<tbody> 				<tr> 					<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 						<table class=\"collapse\" id=\"header\" align=\"center\" width=\"650\" style=\"width: 650px;padding:0;margin:0;line-height:1px;font-size:1px;\" bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> 							<tbody> 								<tr> 									<td style=\"min-width: 650px;height:1px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"cut\"></td> 								</tr> 							</tbody> 						</table>  					</td> 				</tr> 				<tr> 					<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 					<!--///////////////////header///////////////////////////--> 						<table class=\"collapse\" id=\"header\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> 							<tbody> 								<tr> 									<td height=\"15\" style=\"height:15px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"logo_space\"> &nbsp; </td> 								</tr> 								<tr> 									<td style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 										<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"left\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 											<tbody> 												<tr align=\"left\"> 													<td align=\"left\" width=\"15\" style=\"width:15px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 													<td align=\"left\" width=\"28\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 													<td align=\"left\" width=\"10\" style=\"width:10px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 													<td align=\"left\" class=\"greeting\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;color:#66757f;font-size:16px;padding:0px;margin:0px;font-weight:300;line-height:100%;text-align:left;\"> Dear ${TRIPOIN.CONTENT.FULLNAME}, </td> 													<td width=\"50\" style=\"width:50px;padding:0;margin:0;line-height:1px;font-size:1px;\" align=\"left\"></td> 												</tr> 											</tbody> 										</table>  									</td> 								</tr> 								<tr> 								<td height=\"14\" style=\"height:14px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"logo_space\"> &nbsp; </td> 								</tr> 							</tbody> 						</table> 						<!--////////////////////border//////////////////////////--> 						<table class=\"collapse\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> 							<tbody> 								<tr id=\"border\"> 									<td colspan=\"2\" height=\"1\" style=\"line-height:1px;display:block;height:1px;background-color:#FAFAFA;padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 								</tr> 							</tbody> 						</table> 						<!--//////////////////////////////////////////////--> 						<table class=\"collapse\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> 							<tbody> 								<tr> 								<td width=\"50\" style=\"width:50px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"margins\"></td> 								<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 									<table width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"collapse\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 										<tbody> 										<tr> 											<td height=\"30\" style=\"height:45px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 										</tr> 										<tr> 											<td align=\"left\" class=\"display\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:22px;line-height:30px;font-weight:300;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;text-align:left;color:#292f33;\"> We received a request to reset the password for your account. </td> 										</tr> 										<tr> 											<td height=\"30\" style=\"height:30px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 										</tr> 										<tr> 											<td align=\"left\" class=\"body-text\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:16px;line-height:22px;font-weight:400;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;text-align:left;color:#292f33;\"> If you requested a reset for username <span style=\"text-decoration:none;border-style:none;border:0;padding:0;margin:0;border:none;text-decoration:none;font-weight:400;color:#1879DB;\">${TRIPOIN.CONTENT.USERNAME}</span>, click the button below. If you didn\'t make this request, please ignore this email. </td> 										</tr> 										<tr> 											<td height=\"25\" style=\"height:25px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 										</tr> 										<!--*********** button ************--> 										<tr> 											<td align=\"left\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 												<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 													<tbody> 														<tr> 															<td style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 																<!-- Tap, click, press, push the button --> 																<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 																	<tbody> 																		<tr> 																			<td style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 																				<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> 																					<tbody> 																						<tr> 																							<td align=\"center\" class=\"bulletproof-btn-1\" bgcolor=\"#1879DB\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;line-height:18px;\"> 																								<a href=\"${TRIPOIN.CONTENT.URL}\" target=\"_blank\" class=\"bulletproof-btn-2\" style=\"text-decoration:none;border-style:none;border:0;padding:0;margin:0;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:16px;line-height:22px;font-weight:650;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;color:#ffffff;text-align:center;text-decoration:none;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;padding:11px 30px;border:1px solid #1879DB;display:inline-block;\"> 																									<strong>Reset password</strong> 																								</a> 																							</td> 																						</tr> 																					</tbody> 																				</table>  																			</td> 																		</tr> 																	</tbody> 																</table>  															</td> 														</tr> 													</tbody> 												</table>  											</td> 										</tr> 										<!--*********** end button ************--> 										<tr> 											<td height=\"55\" style=\"height:55px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 										</tr> 										</tbody> 									</table>  								</td> 								<td width=\"50\" style=\"width:50px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"margins\"></td> 								</tr> 							</tbody> 						</table> 						<!--//////////////////////////////////////////////--> 						<table class=\"collapse\" id=\"footer\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"> 							<tbody> 								<tr> 									<td height=\"1\" style=\"line-height:1px;display:block;height:1px;background-color:#FAFAFA;padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 								</tr> 								<tr> 									<td height=\"20\" style=\"height:20;padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 								</tr> 								<tr> 									<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> <span class=\"footer_type\" style=\"font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;color:#8899a6;font-size:12px;padding:0px;margin:0px;font-weight:normal;line-height:12px;\">  <a href=\"http://www.tripoin.co.id\" class=\"footer_link\" style=\"text-decoration:none;border-style:none;border:0;padding:0;margin:0;font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;color:#1879DB;font-size:12px;padding:0px;margin:0px;font-weight:600;line-height:12px;\">Tripoin, Inc.</a>  </span> </td> 								</tr> 								<tr> 									<td height=\"10\" style=\"height:10px;line-height:1px;font-size:1px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 								</tr> 								<tr> 									<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"> <span class=\"address\"> <a href=\"\" style=\"text-decoration:none;border-style:none;border:0;padding:0;margin:0;font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;color:#8899a6;font-size:12px;padding:0px;margin:0px;font-weight:normal;line-height:12px;cursor:default;\">Indonesia, Jakarta</a> </span> </td> 								</tr> 								<tr> 									<td height=\"26\" style=\"height:26;padding:0;margin:0;line-height:1px;font-size:1px;\"></td> 								</tr> 							</tbody> 						</table>					 					</td> 				</tr> 			</tbody> 		</table> 	</body> </html>', '1', 'Body Email Forgot Password', 'admin', '127.0.0.1', '2015-10-31 19:02:05', null, null, null, null, null);
INSERT INTO `sys_system_parameter` VALUES ('3', 'TRIPOIN.EMAIL.FORGOT.PASSWORD.VERIFY.SUBJECT', 'Verify Reset Password', '1', 'Subject Email Verify Forgot Password', 'admin', '127.0.0.1', '2015-11-01 17:00:00', null, null, null, null, null);
INSERT INTO `sys_system_parameter` VALUES ('4', 'TRIPOIN.EMAIL.FORGOT.PASSWORD.VERIFY.BODY.MESSAGE', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"><html> 	<head>	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />	<meta name=\"viewport\" content=\"width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0\" />	<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />	<style type=\"text/css\">	@media only screen and (max-width: 320px) { 	table[class=\"edu-module\"]{ 	border-radius: 0px !important; 	-webkit-border-radius: 0px !important; 	-moz-border-radius: 0px !important; 	} 	td[class=\"edu-margins\"]{ 	background-color: #f5f8fa; 	} 	td[class=\"edu-collapse\"]{ 	width: 0px !important; 	} 	td[class=\"edu-space\"]{ 	height: 10px !important; 	background-color: #f5f8fa; 	} 	td[class=\"mobile-height\"]{ 	height: 30px !important; 	} 	} 	@media only screen and (max-width: 420px) { 	span[class=\"address\"] a { 	line-height:18px !important; 	} 	td[class=\"margins\"]{ 	width:18px !important; 	} 	td[class=\"edu-margins\"]{ 	width:18px !important; 	} 	td[class=\"logo_space\"]{ 	height:12px !important; 				} 			}  			@media only screen and (max-width: 480px) { 				table[class=\"collapse\"]{ 					width:100% !important; 				} 				table[class=\"edu-module\"]{ 					width:100% !important; 				} 				span[class=\"address\"]{ 					display:block !important; 					width:240px !important; 				} 				td[class=\"cut\"]{ 					display:none !important; 				} 			} 		</style>	</head>	<body bgcolor=\"#FAFAFA\" style=\"margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;\">		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" bgcolor=\"#FAFAFA\" style=\"background-color:#FAFAFA;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"body_wrapper\">			<tbody>				<tr>					<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">						<table class=\"collapse\" id=\"header\" align=\"center\" width=\"650\" style=\"width: 650px;padding:0;margin:0;line-height:1px;font-size:1px;\" bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">							<tbody>								<tr>									<td style=\"min-width: 650px;height:1px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"cut\"></td>								</tr>							</tbody>						</table> 					</td>				</tr>				<tr>					<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">					<!--///////////////////header///////////////////////////-->						<table class=\"collapse\" id=\"header\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">							<tbody>								<tr>									<td height=\"15\" style=\"height:15px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"logo_space\">&nbsp; </td>								</tr>								<tr>									<td style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">										<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"left\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">											<tbody>												<tr align=\"left\">													<td align=\"left\" width=\"15\" style=\"width:15px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>													<td align=\"left\" width=\"28\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"></td>													<td align=\"left\" width=\"10\" style=\"width:10px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>													<td align=\"left\" class=\"greeting\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;color:#66757f;font-size:16px;padding:0px;margin:0px;font-weight:300;line-height:100%;text-align:left;\">														Dear ${TRIPOIN.CONTENT.FULLNAME}, 													</td>													<td width=\"50\" style=\"width:50px;padding:0;margin:0;line-height:1px;font-size:1px;\" align=\"left\"></td>												</tr>											</tbody>										</table> 									</td>								</tr>								<tr>								<td height=\"14\" style=\"height:14px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"logo_space\">&nbsp; </td>								</tr>							</tbody>						</table>						<!--////////////////////border//////////////////////////-->						<table class=\"collapse\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">							<tbody>								<tr id=\"border\">									<td colspan=\"2\" height=\"1\" style=\"line-height:1px;display:block;height:1px;background-color:#FAFAFA;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>								</tr>							</tbody>						</table>						<!--//////////////////////////////////////////////-->						<table class=\"collapse\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">							<tbody>								<tr>								<td width=\"50\" style=\"width:50px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"margins\"></td>								<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">									<table width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"collapse\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">										<tbody>										<tr>											<td height=\"30\" style=\"height:45px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>										</tr>										<tr>											<td align=\"left\" class=\"display\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:22px;line-height:30px;font-weight:300;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;text-align:left;color:#292f33;\">												We received a request to reset the password for this account.											</td>										</tr>										<tr>											<td height=\"30\" style=\"height:45px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>										</tr>										<tr>											<td align=\"left\" class=\"body-text\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:16px;line-height:22px;font-weight:400;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;text-align:left;color:#292f33;\">												Username : <span style=\"text-decoration:none;border-style:none;border:0;padding:0;margin:0;border:none;text-decoration:none;font-weight:400;color:#1879DB;\">${TRIPOIN.CONTENT.USERNAME}</span>											</td>										</tr>										<tr>											<td align=\"left\" class=\"body-text\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:16px;line-height:22px;font-weight:400;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;text-align:left;color:#292f33;\">												Password : <span style=\"text-decoration:none;border-style:none;border:0;padding:0;margin:0;border:none;text-decoration:none;font-weight:400;color:#1879DB;\">${TRIPOIN.CONTENT.PASSWORD}</span>											</td>										</tr>										<tr>											<td height=\"30\" style=\"height:15px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>										</tr>										<tr>											<td align=\"left\" class=\"body-text\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:16px;line-height:22px;font-weight:400;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;text-align:left;color:#292f33;\">												Please use this new password to login and then change your password to something more to your liking.											</td>										</tr>										<tr>											<td height=\"25\" style=\"height:25px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>										</tr>										<tr>											<td height=\"55\" style=\"height:55px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>										</tr>										</tbody>									</table> 								</td>								<td width=\"50\" style=\"width:50px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"margins\"></td>								</tr>							</tbody>						</table>						<!--//////////////////////////////////////////////-->						<table class=\"collapse\" id=\"footer\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">							<tbody>								<tr>									<td height=\"1\" style=\"line-height:1px;display:block;height:1px;background-color:#FAFAFA;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>								</tr>								<tr>									<td height=\"20\" style=\"height:20;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>								</tr>								<tr>									<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"><span class=\"footer_type\" style=\"font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;color:#8899a6;font-size:12px;padding:0px;margin:0px;font-weight:normal;line-height:12px;\"> <a href=\"http://www.tripoin.co.id\" class=\"footer_link\" style=\"text-decoration:none;border-style:none;border:0;padding:0;margin:0;font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;color:#1879DB;font-size:12px;padding:0px;margin:0px;font-weight:600;line-height:12px;\">Tripoin, Inc.</a> </span></td>								</tr>								<tr>									<td height=\"10\" style=\"height:10px;line-height:1px;font-size:1px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>								</tr>								<tr>									<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"><span class=\"address\"><a href=\"\" style=\"text-decoration:none;border-style:none;border:0;padding:0;margin:0;font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;color:#8899a6;font-size:12px;padding:0px;margin:0px;font-weight:normal;line-height:12px;cursor:default;\">Indonesia, Jakarta</a></span></td>								</tr>								<tr>									<td height=\"26\" style=\"height:26;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>								</tr>							</tbody>						</table>					 					</td>				</tr>			</tbody>		</table>	</body></html>', '1', 'Body Email Verify Forgot Password', 'admin', '127.0.0.1', '2015-11-01 17:22:52', null, null, null, null, null);
INSERT INTO `sys_system_parameter` VALUES ('5', 'TRIPOIN.EMAIL.NEW.USER.SUBJECT', 'Laris Account', '1', 'Subject Email New User', 'admin', '127.0.0.1', '2016-03-08 04:38:21', null, null, null, null, null);
INSERT INTO `sys_system_parameter` VALUES ('6', 'TRIPOIN.EMAIL.NEW.USER.BODY.MESSAGE', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"><html> 	<head>	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />	<meta name=\"viewport\" content=\"width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0\" />	<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />	<style type=\"text/css\">	@media only screen and (max-width: 320px) { 	table[class=\"edu-module\"]{ 	border-radius: 0px !important; 	-webkit-border-radius: 0px !important; 	-moz-border-radius: 0px !important; 	} 	td[class=\"edu-margins\"]{ 	background-color: #f5f8fa; 	} 	td[class=\"edu-collapse\"]{ 	width: 0px !important; 	} 	td[class=\"edu-space\"]{ 	height: 10px !important; 	background-color: #f5f8fa; 	} 	td[class=\"mobile-height\"]{ 	height: 30px !important; 	} 	} 	@media only screen and (max-width: 420px) { 	span[class=\"address\"] a { 	line-height:18px !important; 	} 	td[class=\"margins\"]{ 	width:18px !important; 	} 	td[class=\"edu-margins\"]{ 	width:18px !important; 	} 	td[class=\"logo_space\"]{ 	height:12px !important; 				} 			}  			@media only screen and (max-width: 480px) { 				table[class=\"collapse\"]{ 					width:100% !important; 				} 				table[class=\"edu-module\"]{ 					width:100% !important; 				} 				span[class=\"address\"]{ 					display:block !important; 					width:240px !important; 				} 				td[class=\"cut\"]{ 					display:none !important; 				} 			} 		</style>	</head>	<body bgcolor=\"#FAFAFA\" style=\"margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;\">		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" bgcolor=\"#FAFAFA\" style=\"background-color:#FAFAFA;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"body_wrapper\">			<tbody>				<tr>					<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">						<table class=\"collapse\" id=\"header\" align=\"center\" width=\"650\" style=\"width: 650px;padding:0;margin:0;line-height:1px;font-size:1px;\" bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">							<tbody>								<tr>									<td style=\"min-width: 650px;height:1px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"cut\"></td>								</tr>							</tbody>						</table> 					</td>				</tr>				<tr>					<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">					<!--///////////////////header///////////////////////////-->						<table class=\"collapse\" id=\"header\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" bgcolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">							<tbody>								<tr>									<td height=\"15\" style=\"height:15px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"logo_space\">&nbsp; </td>								</tr>								<tr>									<td style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">										<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"left\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">											<tbody>												<tr align=\"left\">													<td align=\"left\" width=\"15\" style=\"width:15px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>													<td align=\"left\" width=\"28\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"></td>													<td align=\"left\" width=\"10\" style=\"width:10px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>													<td align=\"left\" class=\"greeting\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;color:#66757f;font-size:16px;padding:0px;margin:0px;font-weight:300;line-height:100%;text-align:left;\">														Dear ${TRIPOIN.CONTENT.FULLNAME}, 													</td>													<td width=\"50\" style=\"width:50px;padding:0;margin:0;line-height:1px;font-size:1px;\" align=\"left\"></td>												</tr>											</tbody>										</table> 									</td>								</tr>								<tr>								<td height=\"14\" style=\"height:14px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"logo_space\">&nbsp; </td>								</tr>							</tbody>						</table>						<!--////////////////////border//////////////////////////-->						<table class=\"collapse\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">							<tbody>								<tr id=\"border\">									<td colspan=\"2\" height=\"1\" style=\"line-height:1px;display:block;height:1px;background-color:#FAFAFA;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>								</tr>							</tbody>						</table>						<!--//////////////////////////////////////////////-->						<table class=\"collapse\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">							<tbody>								<tr>								<td width=\"50\" style=\"width:50px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"margins\"></td>								<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">									<table width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"collapse\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\">										<tbody>										<tr>											<td height=\"30\" style=\"height:45px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>										</tr>										<tr>											<td align=\"left\" class=\"display\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:22px;line-height:30px;font-weight:300;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;text-align:left;color:#292f33;\">												We received a request to create account in Laris.											</td>										</tr>										<tr>											<td height=\"30\" style=\"height:45px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>										</tr>										<tr>											<td align=\"left\" class=\"body-text\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:16px;line-height:22px;font-weight:400;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;text-align:left;color:#292f33;\">												Username : <span style=\"text-decoration:none;border-style:none;border:0;padding:0;margin:0;border:none;text-decoration:none;font-weight:400;color:#1879DB;\">${TRIPOIN.CONTENT.USERNAME}</span>											</td>										</tr>										<tr>											<td height=\"30\" style=\"height:15px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>										</tr>										<tr>											<td align=\"left\" class=\"body-text\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:16px;line-height:22px;font-weight:400;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;text-align:left;color:#292f33;\">												Please use this new password to login and then change your password to something more to your liking.											</td>										</tr>										<tr>											<td height=\"25\" style=\"height:25px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>										</tr>										<tr>											<td height=\"55\" style=\"height:55px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>										</tr>										</tbody>									</table> 								</td>								<td width=\"50\" style=\"width:50px;padding:0;margin:0;line-height:1px;font-size:1px;\" class=\"margins\"></td>								</tr>							</tbody>						</table>						<!--//////////////////////////////////////////////-->						<table class=\"collapse\" id=\"footer\" align=\"center\" width=\"650\" style=\"width:650px;background-color:#ffffff;padding:0;margin:0;line-height:1px;font-size:1px;\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">							<tbody>								<tr>									<td height=\"1\" style=\"line-height:1px;display:block;height:1px;background-color:#FAFAFA;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>								</tr>								<tr>									<td height=\"20\" style=\"height:20;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>								</tr>								<tr>									<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"><span class=\"footer_type\" style=\"font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;color:#8899a6;font-size:12px;padding:0px;margin:0px;font-weight:normal;line-height:12px;\"> <a href=\"http://www.tripoin.co.id\" class=\"footer_link\" style=\"text-decoration:none;border-style:none;border:0;padding:0;margin:0;font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;-webkit-text-size-adjust:none;color:#1879DB;font-size:12px;padding:0px;margin:0px;font-weight:600;line-height:12px;\">Tripoin, Inc.</a> </span></td>								</tr>								<tr>									<td height=\"10\" style=\"height:10px;line-height:1px;font-size:1px;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>								</tr>								<tr>									<td align=\"center\" style=\"padding:0;margin:0;line-height:1px;font-size:1px;\"><span class=\"address\"><a href=\"\" style=\"text-decoration:none;border-style:none;border:0;padding:0;margin:0;font-family:\'Helvetica Neue Light\', Helvetica, Arial, sans-serif;-webkit-font-smoothing:antialiased;color:#8899a6;font-size:12px;padding:0px;margin:0px;font-weight:normal;line-height:12px;cursor:default;\">Indonesia, Jakarta</a></span></td>								</tr>								<tr>									<td height=\"26\" style=\"height:26;padding:0;margin:0;line-height:1px;font-size:1px;\"></td>								</tr>							</tbody>						</table>					 					</td>				</tr>			</tbody>		</table>	</body></html>', '1', 'Body Email New User', 'admin', '127.0.0.1', '2016-03-08 04:46:51', null, null, null, null, null);
INSERT INTO `sys_system_parameter` VALUES ('7', 'TRIPOIN.HEADER.KEY', 'UEBzc3cwcmQ6UEBzc3cwcmQ=', '1', 'X-Tripoin-Key Plain Text', 'admin', '127.0.0.1', '2016-04-09 19:16:39', null, null, null, null, null);

-- ----------------------------
-- Table structure for `trx_cashier_balance_detail`
-- ----------------------------
DROP TABLE IF EXISTS `trx_cashier_balance_detail`;
CREATE TABLE `trx_cashier_balance_detail` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `trx_cashier_header_id` bigint(50) DEFAULT NULL,
  `is_app_spv` smallint(1) DEFAULT NULL,
  `app_spv_time` datetime DEFAULT NULL,
  `shift_id` bigint(50) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cashbal_header_detail` (`trx_cashier_header_id`),
  KEY `fk_shift_sys` (`shift_id`),
  CONSTRAINT `fk_cashbal_header_detail` FOREIGN KEY (`trx_cashier_header_id`) REFERENCES `trx_cashier_balance_header` (`id`),
  CONSTRAINT `fk_shift_sys` FOREIGN KEY (`shift_id`) REFERENCES `sys_pos_shift` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_cashier_balance_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_cashier_balance_header`
-- ----------------------------
DROP TABLE IF EXISTS `trx_cashier_balance_header`;
CREATE TABLE `trx_cashier_balance_header` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `trx_date` datetime DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_cashier_balance_header
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_expense_price`
-- ----------------------------
DROP TABLE IF EXISTS `trx_expense_price`;
CREATE TABLE `trx_expense_price` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `retail_quantity` int(20) DEFAULT NULL,
  `retail_price` double(50,0) DEFAULT NULL,
  `distributor_quantity` int(20) DEFAULT NULL,
  `distributor_price` double(50,0) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_expense_price
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_income_price`
-- ----------------------------
DROP TABLE IF EXISTS `trx_income_price`;
CREATE TABLE `trx_income_price` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `capital_price` double(50,0) DEFAULT NULL,
  `capital_quantity` int(50) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_income_price
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_payment`
-- ----------------------------
DROP TABLE IF EXISTS `trx_payment`;
CREATE TABLE `trx_payment` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `payment_type_id` bigint(50) DEFAULT NULL,
  `employee_id` bigint(50) DEFAULT NULL,
  `trx_date` datetime DEFAULT NULL,
  `total_item` int(50) DEFAULT NULL,
  `total_price` double(100,2) DEFAULT NULL,
  `tax` double(100,4) DEFAULT NULL,
  `reff_id` int(50) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_type` (`payment_type_id`),
  KEY `fk_employee` (`employee_id`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`employee_id`) REFERENCES `mst_employee` (`id`),
  CONSTRAINT `fk_payment_type` FOREIGN KEY (`payment_type_id`) REFERENCES `sys_payment_type_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_pos_detail`
-- ----------------------------
DROP TABLE IF EXISTS `trx_pos_detail`;
CREATE TABLE `trx_pos_detail` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `trx_pos_header_id` bigint(50) DEFAULT NULL,
  `open_balance` double(100,2) DEFAULT NULL,
  `open_date` date DEFAULT NULL,
  `is_open_balance` smallint(1) DEFAULT NULL,
  `close_balance` double(100,2) DEFAULT NULL,
  `close_time` date DEFAULT NULL,
  `is_close_balance` smallint(1) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pos_header` (`trx_pos_header_id`),
  CONSTRAINT `fk_pos_header` FOREIGN KEY (`trx_pos_header_id`) REFERENCES `trx_pos_header` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_pos_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_pos_header`
-- ----------------------------
DROP TABLE IF EXISTS `trx_pos_header`;
CREATE TABLE `trx_pos_header` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `reamrks` varchar(20) DEFAULT NULL,
  `trx_cashier_balance_detail_id` bigint(50) DEFAULT NULL,
  `pos_id` bigint(50) DEFAULT NULL,
  `employee_id` bigint(50) DEFAULT NULL,
  `debit` double(100,2) DEFAULT NULL,
  `credit` double(100,2) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cshbal_header_detail` (`trx_cashier_balance_detail_id`),
  KEY `fk_pos_id` (`pos_id`),
  KEY `fk_emp_id` (`employee_id`),
  CONSTRAINT `fk_cshbal_header_detail` FOREIGN KEY (`trx_cashier_balance_detail_id`) REFERENCES `trx_cashier_balance_detail` (`id`),
  CONSTRAINT `fk_emp_id` FOREIGN KEY (`employee_id`) REFERENCES `mst_employee` (`id`),
  CONSTRAINT `fk_pos_id` FOREIGN KEY (`pos_id`) REFERENCES `mst_point_of_sales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_pos_header
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_price`
-- ----------------------------
DROP TABLE IF EXISTS `trx_price`;
CREATE TABLE `trx_price` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `income_price` bigint(50) DEFAULT NULL,
  `expense_price` bigint(50) DEFAULT NULL,
  `promo_id` bigint(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_income_price` (`income_price`),
  KEY `fk_expense_price` (`expense_price`),
  KEY `fk_promo` (`promo_id`),
  CONSTRAINT `fk_expense_price` FOREIGN KEY (`expense_price`) REFERENCES `trx_expense_price` (`id`),
  CONSTRAINT `fk_income_price` FOREIGN KEY (`income_price`) REFERENCES `trx_income_price` (`id`),
  CONSTRAINT `fk_promo` FOREIGN KEY (`promo_id`) REFERENCES `trx_promo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_price
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_promo`
-- ----------------------------
DROP TABLE IF EXISTS `trx_promo`;
CREATE TABLE `trx_promo` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `discount_rate` double(50,0) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_promo
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_purchase_detail`
-- ----------------------------
DROP TABLE IF EXISTS `trx_purchase_detail`;
CREATE TABLE `trx_purchase_detail` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `purchase_header_id` bigint(50) DEFAULT NULL,
  `product_id` bigint(50) DEFAULT NULL,
  `qty` int(50) DEFAULT NULL,
  `item_price` int(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_purchase_header` (`purchase_header_id`),
  KEY `fk_product_purchase_detail` (`product_id`),
  CONSTRAINT `fk_product_purchase_detail` FOREIGN KEY (`product_id`) REFERENCES `mst_product` (`id`),
  CONSTRAINT `fk_purchase_header` FOREIGN KEY (`purchase_header_id`) REFERENCES `trx_purchase_header` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_purchase_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_purchase_header`
-- ----------------------------
DROP TABLE IF EXISTS `trx_purchase_header`;
CREATE TABLE `trx_purchase_header` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `trx_date` datetime DEFAULT NULL,
  `total_item` int(50) DEFAULT NULL,
  `total_price` double(50,2) DEFAULT NULL,
  `promo_id` bigint(50) DEFAULT NULL,
  `reff_id` int(50) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_promo_purchase` (`promo_id`),
  CONSTRAINT `fk_promo_purchase` FOREIGN KEY (`promo_id`) REFERENCES `trx_promo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_purchase_header
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_retur_detail`
-- ----------------------------
DROP TABLE IF EXISTS `trx_retur_detail`;
CREATE TABLE `trx_retur_detail` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `retur_header_id` bigint(50) DEFAULT NULL,
  `product_id` bigint(50) DEFAULT NULL,
  `item_price` double(50,2) DEFAULT NULL,
  `qty` int(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_retur_header` (`retur_header_id`),
  KEY `fk_product_retur` (`product_id`),
  CONSTRAINT `fk_product_retur` FOREIGN KEY (`product_id`) REFERENCES `mst_product` (`id`),
  CONSTRAINT `fk_retur_header` FOREIGN KEY (`retur_header_id`) REFERENCES `trx_retur_header` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_retur_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_retur_header`
-- ----------------------------
DROP TABLE IF EXISTS `trx_retur_header`;
CREATE TABLE `trx_retur_header` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `trx_date` datetime DEFAULT NULL,
  `total_item` int(50) DEFAULT NULL,
  `total_price` double(50,2) DEFAULT NULL,
  `reff_id` int(50) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `app_spv` smallint(1) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_retur_header
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_selling_detail`
-- ----------------------------
DROP TABLE IF EXISTS `trx_selling_detail`;
CREATE TABLE `trx_selling_detail` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `selling_header_id` bigint(50) DEFAULT NULL,
  `product_id` bigint(50) DEFAULT NULL,
  `item_price` bigint(50) DEFAULT NULL,
  `qty` int(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_selling_header_id` (`selling_header_id`),
  KEY `fk_product_selling` (`product_id`),
  CONSTRAINT `fk_product_selling` FOREIGN KEY (`product_id`) REFERENCES `mst_product` (`id`),
  CONSTRAINT `fk_selling_header_id` FOREIGN KEY (`selling_header_id`) REFERENCES `trx_selling_header` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_selling_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_selling_header`
-- ----------------------------
DROP TABLE IF EXISTS `trx_selling_header`;
CREATE TABLE `trx_selling_header` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `trx_date` datetime DEFAULT NULL,
  `total_item` bigint(50) DEFAULT NULL,
  `total_price` double(50,2) DEFAULT NULL,
  `promo_id` bigint(50) DEFAULT NULL,
  `reff_id` int(20) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trx_promo` (`promo_id`),
  CONSTRAINT `fk_trx_promo` FOREIGN KEY (`promo_id`) REFERENCES `trx_promo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_selling_header
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_tax`
-- ----------------------------
DROP TABLE IF EXISTS `trx_tax`;
CREATE TABLE `trx_tax` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(10) DEFAULT NULL,
  `tax_rate` double(10,0) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trx_tax
-- ----------------------------
