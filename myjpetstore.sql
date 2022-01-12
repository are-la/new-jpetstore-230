/*
MySQL Data Transfer
Source Host: localhost
Source Database: myjpetstore
Target Host: localhost
Target Database: myjpetstore
Date: 2022/1/12 16:22:46
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `ACCOUNT`;
CREATE TABLE `ACCOUNT` (
  `USERID` varchar(80) NOT NULL,
  `EMAIL` varchar(80) NOT NULL,
  `FIRSTNAME` varchar(80) NOT NULL,
  `LASTNAME` varchar(80) NOT NULL,
  `STATUS` varchar(2) default NULL,
  `ADDR1` varchar(80) NOT NULL,
  `ADDR2` varchar(40) default NULL,
  `CITY` varchar(80) NOT NULL,
  `STATE` varchar(80) default NULL,
  `ZIP` varchar(20) default NULL,
  `COUNTRY` varchar(20) NOT NULL,
  `PHONE` varchar(80) NOT NULL,
  PRIMARY KEY  (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for addlog
-- ----------------------------
DROP TABLE IF EXISTS `ADDLOG`;
CREATE TABLE `ADDLOG` (
  `ADDLOGID` int(11) NOT NULL auto_increment,
  `USERID` varchar(80) default NULL,
  `ADDITEMID` varchar(10) default NULL,
  `ADDTIME` date default NULL,
  PRIMARY KEY  (`ADDLOGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bannerdata
-- ----------------------------
DROP TABLE IF EXISTS `BANNERDATA`;
CREATE TABLE `BANNERDATA` (
  `FAVCATEGORY` varchar(80) NOT NULL,
  `BANNERNAME` varchar(255) default NULL,
  PRIMARY KEY  (`FAVCATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for browselog
-- ----------------------------
DROP TABLE IF EXISTS `BROWSELOG`;
CREATE TABLE `BROWSELOG` (
  `BROWSELOGID` int(11) NOT NULL auto_increment,
  `USERID` varchar(80) default NULL,
  `BROWSEITEMID` varchar(10) default NULL,
  `BROWSETIME` date default NULL,
  PRIMARY KEY  (`BROWSELOGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `CART`;
CREATE TABLE `CART` (
  `ID` int(11) NOT NULL auto_increment,
  `USERID` varchar(80) NOT NULL,
  `ITEMID` varchar(10) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `CATEGORY`;
CREATE TABLE `CATEGORY` (
  `CATID` varchar(10) NOT NULL,
  `NAME` varchar(80) default NULL,
  `DESCN` varchar(255) default NULL,
  PRIMARY KEY  (`CATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `INVENTORY`;
CREATE TABLE `INVENTORY` (
  `ITEMID` varchar(10) NOT NULL,
  `QTY` int(11) NOT NULL,
  PRIMARY KEY  (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `ITEM`;
CREATE TABLE `ITEM` (
  `ITEMID` varchar(10) NOT NULL,
  `PRODUCTID` varchar(10) NOT NULL,
  `LISTPRICE` decimal(10,2) default NULL,
  `UNITCOST` decimal(10,2) default NULL,
  `SUPPLIER` int(11) default NULL,
  `STATUS` varchar(2) default NULL,
  `ATTR1` varchar(80) default NULL,
  `ATTR2` varchar(80) default NULL,
  `ATTR3` varchar(80) default NULL,
  `ATTR4` varchar(80) default NULL,
  `ATTR5` varchar(80) default NULL,
  PRIMARY KEY  (`ITEMID`),
  KEY `FK_ITEM_2` (`SUPPLIER`),
  KEY `ITEMPROD` (`PRODUCTID`),
  CONSTRAINT `FK_ITEM_1` FOREIGN KEY (`PRODUCTID`) REFERENCES `PRODUCT` (`PRODUCTID`),
  CONSTRAINT `FK_ITEM_2` FOREIGN KEY (`SUPPLIER`) REFERENCES `SUPPLIER` (`SUPPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lineitem
-- ----------------------------
DROP TABLE IF EXISTS `LINEITEM`;
CREATE TABLE `LINEITEM` (
  `ORDERID` int(11) NOT NULL,
  `LINENUM` int(11) NOT NULL,
  `ITEMID` varchar(10) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `UNITPRICE` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`ORDERID`,`LINENUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `ORDERS`;
CREATE TABLE `ORDERS` (
  `ORDERID` int(11) NOT NULL,
  `USERID` varchar(80) NOT NULL,
  `ORDERDATE` date NOT NULL,
  `SHIPADDR1` varchar(80) NOT NULL,
  `SHIPADDR2` varchar(80) default NULL,
  `SHIPCITY` varchar(80) NOT NULL,
  `SHIPSTATE` varchar(80) NOT NULL,
  `SHIPZIP` varchar(20) NOT NULL,
  `SHIPCOUNTRY` varchar(20) NOT NULL,
  `BILLADDR1` varchar(80) NOT NULL,
  `BILLADDR2` varchar(80) default NULL,
  `BILLCITY` varchar(80) NOT NULL,
  `BILLSTATE` varchar(80) NOT NULL,
  `BILLZIP` varchar(20) NOT NULL,
  `BILLCOUNTRY` varchar(20) NOT NULL,
  `COURIER` varchar(80) NOT NULL,
  `TOTALPRICE` decimal(10,2) NOT NULL,
  `BILLTOFIRSTNAME` varchar(80) NOT NULL,
  `BILLTOLASTNAME` varchar(80) NOT NULL,
  `SHIPTOFIRSTNAME` varchar(80) NOT NULL,
  `SHIPTOLASTNAME` varchar(80) NOT NULL,
  `CREDITCARD` varchar(80) NOT NULL,
  `EXPRDATE` varchar(7) NOT NULL,
  `CARDTYPE` varchar(80) NOT NULL,
  `LOCALE` varchar(80) NOT NULL,
  PRIMARY KEY  (`ORDERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `ORDERSTATUS`;
CREATE TABLE `ORDERSTATUS` (
  `ORDERID` int(11) NOT NULL,
  `LINENUM` int(11) NOT NULL,
  `TIMESTAMP` date NOT NULL,
  `STATUS` varchar(2) NOT NULL,
  PRIMARY KEY  (`ORDERID`,`LINENUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `PRODUCT`;
CREATE TABLE `PRODUCT` (
  `PRODUCTID` varchar(10) NOT NULL,
  `CATEGORY` varchar(10) NOT NULL,
  `NAME` varchar(80) default NULL,
  `DESCN` varchar(255) default NULL,
  PRIMARY KEY  (`PRODUCTID`),
  KEY `PRODUCTCAT` (`CATEGORY`),
  KEY `PRODUCTNAME` (`NAME`),
  CONSTRAINT `FK_PRODUCT_1` FOREIGN KEY (`CATEGORY`) REFERENCES `CATEGORY` (`CATID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `PROFILE`;
CREATE TABLE `PROFILE` (
  `USERID` varchar(80) NOT NULL,
  `LANGPREF` varchar(80) NOT NULL,
  `FAVCATEGORY` varchar(30) default NULL,
  `MYLISTOPT` tinyint(1) default NULL,
  `BANNEROPT` tinyint(1) default NULL,
  PRIMARY KEY  (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `SEQUENCE`;
CREATE TABLE `SEQUENCE` (
  `NAME` varchar(30) NOT NULL,
  `NEXTID` int(11) NOT NULL,
  PRIMARY KEY  (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for signon
-- ----------------------------
DROP TABLE IF EXISTS `SIGNON`;
CREATE TABLE `SIGNON` (
  `USERNAME` varchar(25) NOT NULL,
  `PASSWORD` varchar(25) NOT NULL,
  PRIMARY KEY  (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `SUPPLIER`;
CREATE TABLE `SUPPLIER` (
  `SUPPID` int(11) NOT NULL,
  `NAME` varchar(80) default NULL,
  `STATUS` varchar(2) NOT NULL,
  `ADDR1` varchar(80) default NULL,
  `ADDR2` varchar(80) default NULL,
  `CITY` varchar(80) default NULL,
  `STATE` varchar(80) default NULL,
  `ZIP` varchar(5) default NULL,
  `PHONE` varchar(80) default NULL,
  PRIMARY KEY  (`SUPPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `ACCOUNT` VALUES ('5', '55454', '5555', '5', null, '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `ACCOUNT` VALUES ('7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7');
INSERT INTO `ACCOUNT` VALUES ('8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8', '8');
INSERT INTO `ACCOUNT` VALUES ('9', '9', '9', '9', '9', '9', '9', '9', '9', '9', '9', '9');
INSERT INTO `ACCOUNT` VALUES ('a', 'a', 'a', 'a', null, 'a', 'a', 'aa', 'a', 'a', 'a', 'a');
INSERT INTO `ACCOUNT` VALUES ('ACID', 'acid@yourdomain.com', 'ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `ACCOUNT` VALUES ('b', 'a', 'a', 'a', null, 'a', 'a', 'a', 'a', 'a', 'a', 'a');
INSERT INTO `ACCOUNT` VALUES ('j2ee', 'yourname@yourdomain.com', 'ABC', 'XYX', null, '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `ACCOUNT` VALUES ('we', '11223344@', 'w', 'e', null, 'www', null, 'HuNan', null, null, 'china', '1839080');
INSERT INTO `ADDLOG` VALUES ('1', 'j2ee', null, '2021-11-05');
INSERT INTO `ADDLOG` VALUES ('2', 'j2ee', null, '2021-11-05');
INSERT INTO `ADDLOG` VALUES ('3', 'j2ee', null, '2021-11-05');
INSERT INTO `ADDLOG` VALUES ('4', 'j2ee', null, '2021-11-05');
INSERT INTO `ADDLOG` VALUES ('5', 'j2ee', 'EST-19', '2021-11-05');
INSERT INTO `ADDLOG` VALUES ('6', 'j2ee', null, '2021-11-05');
INSERT INTO `ADDLOG` VALUES ('7', 'j2ee', 'EST-19', '2021-11-05');
INSERT INTO `ADDLOG` VALUES ('8', 'j2ee', 'EST-18', '2021-11-05');
INSERT INTO `BANNERDATA` VALUES ('BIRDS', '<image src=\"../images/banner_birds.gif\">');
INSERT INTO `BANNERDATA` VALUES ('CATS', '<image src=\"../images/banner_cats.gif\">');
INSERT INTO `BANNERDATA` VALUES ('DOGS', '<image src=\"../images/banner_dogs.gif\">');
INSERT INTO `BANNERDATA` VALUES ('FISH', '<image src=\"../images/banner_fish.gif\">');
INSERT INTO `BANNERDATA` VALUES ('REPTILES', '<image src=\"../images/banner_reptiles.gif\">');
INSERT INTO `BROWSELOG` VALUES ('1', 'j2ee', 'EST-18', '2021-11-05');
INSERT INTO `BROWSELOG` VALUES ('2', 'j2ee', 'EST-4', '2021-11-05');
INSERT INTO `CART` VALUES ('12', 'j2ee', 'EST-4', '1');
INSERT INTO `CART` VALUES ('13', 'j2ee', 'EST-2', '1');
INSERT INTO `CART` VALUES ('14', 'j2ee', 'EST-4', '1');
INSERT INTO `CART` VALUES ('15', 'j2ee', 'EST-5', '2');
INSERT INTO `CART` VALUES ('16', 'j2ee', 'EST-19', '1');
INSERT INTO `CART` VALUES ('17', 'j2ee', 'EST-6', '1');
INSERT INTO `CART` VALUES ('18', 'j2ee', 'EST-7', '1');
INSERT INTO `CART` VALUES ('19', 'j2ee', 'EST-4', '1');
INSERT INTO `CART` VALUES ('20', 'j2ee', 'EST-5', '1');
INSERT INTO `CART` VALUES ('21', 'j2ee', 'EST-16', '1');
INSERT INTO `CART` VALUES ('22', 'j2ee', 'EST-13', '1');
INSERT INTO `CART` VALUES ('23', 'j2ee', 'EST-19', '1');
INSERT INTO `CART` VALUES ('24', 'j2ee', 'EST-19', '1');
INSERT INTO `CART` VALUES ('25', 'j2ee', 'EST-18', '1');
INSERT INTO `CATEGORY` VALUES ('BIRDS', 'Birds', '<image src=\"../images/birds_icon.gif\"><font size=\"5\" color=\"blue\"> Birds</font>');
INSERT INTO `CATEGORY` VALUES ('CATS', 'Cats', '<image src=\"../images/cats_icon.gif\"><font size=\"5\" color=\"blue\"> Cats</font>');
INSERT INTO `CATEGORY` VALUES ('DOGS', 'Dogs', '<image src=\"../images/dogs_icon.gif\"><font size=\"5\" color=\"blue\"> Dogs</font>');
INSERT INTO `CATEGORY` VALUES ('FISH', 'Fish', '<image src=\"../images/fish_icon.gif\"><font size=\"5\" color=\"blue\"> Fish</font>');
INSERT INTO `CATEGORY` VALUES ('REPTILES', 'Reptiles', '<image src=\"../images/reptiles_icon.gif\"><font size=\"5\" color=\"blue\"> Reptiles</font>');
INSERT INTO `INVENTORY` VALUES ('EST-1', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-10', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-11', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-12', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-13', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-14', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-15', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-16', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-17', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-18', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-19', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-2', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-20', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-21', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-22', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-23', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-24', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-25', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-26', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-27', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-28', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-3', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-4', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-5', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-6', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-7', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-8', '10000');
INSERT INTO `INVENTORY` VALUES ('EST-9', '10000');
INSERT INTO `ITEM` VALUES ('EST-1', 'FI-SW-01', '16.50', '10.00', '1', 'P', 'Large', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-10', 'K9-DL-01', '18.50', '12.00', '1', 'P', 'Spotted Adult Female', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-11', 'RP-SN-01', '18.50', '12.00', '1', 'P', 'Venomless', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-12', 'RP-SN-01', '18.50', '12.00', '1', 'P', 'Rattleless', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-13', 'RP-LI-02', '18.50', '12.00', '1', 'P', 'Green Adult', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-14', 'FL-DSH-01', '58.50', '12.00', '1', 'P', 'Tailless', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-15', 'FL-DSH-01', '23.50', '12.00', '1', 'P', 'With tail', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-16', 'FL-DLH-02', '93.50', '12.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-17', 'FL-DLH-02', '93.50', '12.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-18', 'AV-CB-01', '193.50', '92.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-19', 'AV-SB-02', '15.50', '2.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-2', 'FI-SW-01', '16.50', '10.00', '1', 'P', 'Small', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-20', 'FI-FW-02', '5.50', '2.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-21', 'FI-FW-02', '5.29', '1.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-22', 'K9-RT-02', '135.50', '100.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-23', 'K9-RT-02', '145.49', '100.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-24', 'K9-RT-02', '255.50', '92.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-25', 'K9-RT-02', '325.29', '90.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-26', 'K9-CW-01', '125.50', '92.00', '1', 'P', 'Adult Male', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-27', 'K9-CW-01', '155.29', '90.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-28', 'K9-RT-01', '155.29', '90.00', '1', 'P', 'Adult Female', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-3', 'FI-SW-02', '18.50', '12.00', '1', 'P', 'Toothless', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-4', 'FI-FW-01', '18.50', '12.00', '1', 'P', 'Spotted', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-5', 'FI-FW-01', '18.50', '12.00', '1', 'P', 'Spotless', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-6', 'K9-BD-01', '18.50', '12.00', '1', 'P', 'Male Adult', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-7', 'K9-BD-01', '18.50', '12.00', '1', 'P', 'Female Puppy', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-8', 'K9-PO-02', '18.50', '12.00', '1', 'P', 'Male Puppy', null, null, null, null);
INSERT INTO `ITEM` VALUES ('EST-9', 'K9-DL-01', '18.50', '12.00', '1', 'P', 'Spotless Male Puppy', null, null, null, null);
INSERT INTO `LINEITEM` VALUES ('1000', '1', 'EST-16', '1', '93.50');
INSERT INTO `LINEITEM` VALUES ('1000', '2', 'EST-19', '1', '15.50');
INSERT INTO `LINEITEM` VALUES ('1000', '3', 'EST-20', '1', '5.50');
INSERT INTO `LINEITEM` VALUES ('1000', '4', 'EST-14', '1', '58.50');
INSERT INTO `LINEITEM` VALUES ('1001', '1', 'EST-6', '1', '18.50');
INSERT INTO `LINEITEM` VALUES ('1002', '1', 'EST-19', '1', '15.50');
INSERT INTO `LINEITEM` VALUES ('1003', '1', 'EST-18', '1', '193.50');
INSERT INTO `LINEITEM` VALUES ('1004', '1', 'EST-28', '1', '155.29');
INSERT INTO `LINEITEM` VALUES ('1005', '1', 'EST-21', '1', '5.29');
INSERT INTO `LINEITEM` VALUES ('1006', '1', 'EST-18', '2', '193.50');
INSERT INTO `LINEITEM` VALUES ('1007', '1', 'EST-4', '1', '18.50');
INSERT INTO `LINEITEM` VALUES ('1007', '2', 'EST-5', '1', '18.50');
INSERT INTO `ORDERS` VALUES ('1000', 'j2ee', '2021-11-05', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '173.00', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `ORDERS` VALUES ('1001', 'a', '2021-11-05', 'a', 'a', 'aa', 'a', 'a', 'a', 'a', 'a', 'aa', 'a', 'a', 'a', 'UPS', '18.50', 'a', 'a', 'a', 'a', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `ORDERS` VALUES ('1002', 'j2ee', '2021-11-05', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '15.50', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `ORDERS` VALUES ('1003', 'j2ee', '2021-11-05', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '193.50', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `ORDERS` VALUES ('1004', 'j2ee', '2021-11-05', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '155.29', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `ORDERS` VALUES ('1005', 'j2ee', '2021-11-05', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '5.29', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `ORDERS` VALUES ('1006', 'j2ee', '2021-11-05', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '387.00', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `ORDERS` VALUES ('1007', 'j2ee', '2021-11-05', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'UPS', '37.00', 'ABC', 'XYX', 'ABC', 'XYX', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `ORDERSTATUS` VALUES ('1000', '4', '2021-11-05', 'P');
INSERT INTO `ORDERSTATUS` VALUES ('1001', '1', '2021-11-05', 'P');
INSERT INTO `ORDERSTATUS` VALUES ('1002', '1', '2021-11-05', 'P');
INSERT INTO `ORDERSTATUS` VALUES ('1003', '1', '2021-11-05', 'P');
INSERT INTO `ORDERSTATUS` VALUES ('1004', '1', '2021-11-05', 'P');
INSERT INTO `ORDERSTATUS` VALUES ('1005', '1', '2021-11-05', 'P');
INSERT INTO `ORDERSTATUS` VALUES ('1006', '1', '2021-11-05', 'P');
INSERT INTO `ORDERSTATUS` VALUES ('1007', '2', '2021-11-05', 'P');
INSERT INTO `PRODUCT` VALUES ('AV-CB-01', 'BIRDS', 'Amazon Parrot', '<image src=\"images/bird2.gif\">Great companion for up to 75 years');
INSERT INTO `PRODUCT` VALUES ('AV-SB-02', 'BIRDS', 'Finch', '<image src=\"images/bird1.gif\">Great stress reliever');
INSERT INTO `PRODUCT` VALUES ('FI-FW-01', 'FISH', 'Koi', '<image src=\"images/fish3.gif\">Fresh Water fish from Japan');
INSERT INTO `PRODUCT` VALUES ('FI-FW-02', 'FISH', 'Goldfish', '<image src=\"images/fish2.gif\">Fresh Water fish from China');
INSERT INTO `PRODUCT` VALUES ('FI-SW-01', 'FISH', 'Angelfish', '<image src=\"images/fish1.gif\">Salt Water fish from Australia');
INSERT INTO `PRODUCT` VALUES ('FI-SW-02', 'FISH', 'Tiger Shark', '<image src=\"images/fish4.gif\">Salt Water fish from Australia');
INSERT INTO `PRODUCT` VALUES ('FL-DLH-02', 'CATS', 'Persian', '<image src=\"images/cat1.gif\">Friendly house cat, doubles as a princess');
INSERT INTO `PRODUCT` VALUES ('FL-DSH-01', 'CATS', 'Manx', '<image src=\"images/cat2.gif\">Great for reducing mouse populations');
INSERT INTO `PRODUCT` VALUES ('K9-BD-01', 'DOGS', 'Bulldog', '<image src=\"images/dog2.gif\">Friendly dog from England');
INSERT INTO `PRODUCT` VALUES ('K9-CW-01', 'DOGS', 'Chihuahua', '<image src=\"images/dog4.gif\">Great companion dog');
INSERT INTO `PRODUCT` VALUES ('K9-DL-01', 'DOGS', 'Dalmation', '<image src=\"images/dog3.gif\">Great dog for a Fire Station');
INSERT INTO `PRODUCT` VALUES ('K9-PO-02', 'DOGS', 'Poodle', '<image src=\"images/dog6.gif\">Cute dog from France');
INSERT INTO `PRODUCT` VALUES ('K9-RT-01', 'DOGS', 'Golden Retriever', '<image src=\"images/dog1.gif\">Great family dog');
INSERT INTO `PRODUCT` VALUES ('K9-RT-02', 'DOGS', 'Labrador Retriever', '<image src=\"images/dog5.gif\">Great hunting dog');
INSERT INTO `PRODUCT` VALUES ('RP-LI-02', 'REPTILES', 'Iguana', '<image src=\"images/lizard1.gif\">Friendly green friend');
INSERT INTO `PRODUCT` VALUES ('RP-SN-01', 'REPTILES', 'Rattlesnake', '<image src=\"images/lizard1.gif\">Doubles as a watch dog');
INSERT INTO `PROFILE` VALUES ('5', 'english', 'DOGS', null, null);
INSERT INTO `PROFILE` VALUES ('8', 'english', 'DOGS', null, null);
INSERT INTO `PROFILE` VALUES ('9', 'english', 'DOGS', null, null);
INSERT INTO `PROFILE` VALUES ('a', 'japanese', 'DOGS', null, null);
INSERT INTO `PROFILE` VALUES ('ACID', 'english', 'CATS', '1', '1');
INSERT INTO `PROFILE` VALUES ('j2ee', 'english', 'FISH', '1', '1');
INSERT INTO `SEQUENCE` VALUES ('linenum', '1000');
INSERT INTO `SEQUENCE` VALUES ('ordernum', '1008');
INSERT INTO `SIGNON` VALUES ('2', '2');
INSERT INTO `SIGNON` VALUES ('3', '3');
INSERT INTO `SIGNON` VALUES ('5', '55');
INSERT INTO `SIGNON` VALUES ('7', '7');
INSERT INTO `SIGNON` VALUES ('8', '8');
INSERT INTO `SIGNON` VALUES ('9', '9');
INSERT INTO `SIGNON` VALUES ('a', 'a');
INSERT INTO `SIGNON` VALUES ('abc', 'abc');
INSERT INTO `SIGNON` VALUES ('ACID', 'ACID');
INSERT INTO `SIGNON` VALUES ('b', 'b');
INSERT INTO `SIGNON` VALUES ('c', '');
INSERT INTO `SIGNON` VALUES ('cm', '112366');
INSERT INTO `SIGNON` VALUES ('crf', '081123');
INSERT INTO `SIGNON` VALUES ('j2ee', 'j2ee');
INSERT INTO `SIGNON` VALUES ('ttt', 'ttt');
INSERT INTO `SIGNON` VALUES ('we', 'we');
INSERT INTO `SUPPLIER` VALUES ('1', 'XYZ Pets', 'AC', '600 Avon Way', '', 'Los Angeles', 'CA', '94024', '212-947-0797');
INSERT INTO `SUPPLIER` VALUES ('2', 'ABC Pets', 'AC', '700 Abalone Way', '', 'San Francisco ', 'CA', '94024', '415-947-0797');
