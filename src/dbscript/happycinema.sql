/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : happycinema

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2015-04-01 21:52:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `datadictionary`
-- ----------------------------
DROP TABLE IF EXISTS `datadictionary`;
CREATE TABLE `datadictionary` (
  `ddid` int(11) NOT NULL auto_increment,
  `ddcontent` varchar(255) default NULL,
  `ddtype` varchar(255) default NULL,
  PRIMARY KEY  (`ddid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datadictionary
-- ----------------------------
INSERT INTO `datadictionary` VALUES ('1', 'IMAX', 'showroomtype');
INSERT INTO `datadictionary` VALUES ('2', '3D', 'showroomtype');
INSERT INTO `datadictionary` VALUES ('3', '普通', 'showroomtype');
INSERT INTO `datadictionary` VALUES ('5', 'Forrest Gump', '2');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employeeid` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `photo` varchar(255) default NULL,
  `gender` varchar(11) default NULL,
  `birthdate` varchar(255) default NULL,
  `idcode` varchar(255) default NULL,
  `phoneno` varchar(255) default NULL,
  `entrytime` varchar(255) default NULL,
  `position` varchar(11) default NULL,
  `password` varchar(255) default NULL,
  `age` int(11) default NULL,
  PRIMARY KEY  (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'admin', 'admin', '1', '19910906', '321323199109063465', '18243010337', '20140905', '管理员', 'admin', '45');
INSERT INTO `employee` VALUES ('3', '周星驰', '142771723619401.jpg', '男', '2015-01-01', '321323199109063245', '18243020334', '2015-03-24', '售票员', 'user', '50');

-- ----------------------------
-- Table structure for `film`
-- ----------------------------
DROP TABLE IF EXISTS `film`;
CREATE TABLE `film` (
  `filmid` int(11) NOT NULL auto_increment,
  `filmname` varchar(255) default NULL,
  `filemalias` varchar(255) default NULL,
  `filmcountry` varchar(255) default NULL,
  `filmdirector` varchar(255) default NULL,
  `filmleadingrole` varchar(255) default NULL,
  `filmlanguage` varchar(255) default NULL,
  `filmlasttime` varchar(255) default NULL,
  `filetype` varchar(255) default NULL,
  `filmonline` varchar(255) default NULL,
  `filmpost` text,
  `filmcontent` text,
  `filmBackStory` text,
  `filmaward` text,
  PRIMARY KEY  (`filmid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of film
-- ----------------------------
INSERT INTO `film` VALUES ('2', '阿甘正传', null, '美国', '罗伯特·泽米吉斯', '汤姆·汉克斯', '英语', '142', '战争/喜剧/爱情/剧情', '2015-03-02', '142771567568201.jpg/142771567568802.jpg/142771567569503.jpg', '　福瑞斯特·甘（阿甘）出生在上世纪中叶、美国南部阿拉巴马州的绿茵堡镇，由于父亲早逝，他的母亲独自将他抚养长大。阿甘的智商只有75，但凭借跑步的天赋，他顺利地完成大学学业并参了军，随后开赴越南战场。在军营里，他结识了“捕虾迷”布巴和神经兮兮的丹·泰勒中尉。布巴在越战中丧生，丹中尉失去了双腿，阿甘则因为救人成了战斗英雄。\r\n　　回国后，阿甘为了履行对布巴的承诺，买下了一艘破船开始捕虾。一系列机缘巧合后，他不但化解了丹中尉的怨气，还莫名其妙地累积了大量资产。不过，钱并不是阿甘所看重的东西。阿甘和女孩珍妮青梅竹马，可珍妮有自己的梦想，不愿平淡地度过一生……', '　福瑞斯特·甘（阿甘）出生在上世纪中叶、美国南部阿拉巴马州的绿茵堡镇，由于父亲早逝，他的母亲独自将他抚养长大。阿甘的智商只有75，但凭借跑步的天赋，他顺利地完成大学学业并参了军，随后开赴越南战场。在军营里，他结识了“捕虾迷”布巴和神经兮兮的丹·泰勒中尉。布巴在越战中丧生，丹中尉失去了双腿，阿甘则因为救人成了战斗英雄。\r\n　　回国后，阿甘为了履行对布巴的承诺，买下了一艘破船开始捕虾。一系列机缘巧合后，他不但化解了丹中尉的怨气，还莫名其妙地累积了大量资产。不过，钱并不是阿甘所看重的东西。阿甘和女孩珍妮青梅竹马，可珍妮有自己的梦想，不愿平淡地度过一生……', '　福瑞斯特·甘（阿甘）出生在上世纪中叶、美国南部阿拉巴马州的绿茵堡镇，由于父亲早逝，他的母亲独自将他抚养长大。阿甘的智商只有75，但凭借跑步的天赋，他顺利地完成大学学业并参了军，随后开赴越南战场。在军营里，他结识了“捕虾迷”布巴和神经兮兮的丹·泰勒中尉。布巴在越战中丧生，丹中尉失去了双腿，阿甘则因为救人成了战斗英雄。\r\n　　回国后，阿甘为了履行对布巴的承诺，买下了一艘破船开始捕虾。一系列机缘巧合后，他不但化解了丹中尉的怨气，还莫名其妙地累积了大量资产。不过，钱并不是阿甘所看重的东西。阿甘和女孩珍妮青梅竹马，可珍妮有自己的梦想，不愿平淡地度过一生……');

-- ----------------------------
-- Table structure for `onscreen`
-- ----------------------------
DROP TABLE IF EXISTS `onscreen`;
CREATE TABLE `onscreen` (
  `onscreenid` int(11) NOT NULL auto_increment,
  `showroomid` int(11) default NULL,
  `onscreendate` varchar(255) default NULL,
  `filmid` int(11) default NULL,
  `onscreenstarttime` varchar(255) default NULL,
  `onscreenendtime` varchar(255) default NULL,
  `onscreenprice` varchar(255) default NULL,
  PRIMARY KEY  (`onscreenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onscreen
-- ----------------------------
INSERT INTO `onscreen` VALUES ('1', '2', '2015-03-30', '2', '19:06:04', '2015-03-30 21:28:04', '23');
INSERT INTO `onscreen` VALUES ('2', '3', '2015-03-31', '2', '05:16:12', '2015-03-31 07:38:12', '45');

-- ----------------------------
-- Table structure for `showroom`
-- ----------------------------
DROP TABLE IF EXISTS `showroom`;
CREATE TABLE `showroom` (
  `showroomsiteamount` int(11) default NULL,
  `showroomtype` int(11) default NULL,
  `showroomname` varchar(255) default NULL,
  `showroomid` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`showroomid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of showroom
-- ----------------------------
INSERT INTO `showroom` VALUES ('120', '1', '天天影院', '2');
INSERT INTO `showroom` VALUES ('120', '1', '快乐影厅', '3');

-- ----------------------------
-- Table structure for `showroomsite`
-- ----------------------------
DROP TABLE IF EXISTS `showroomsite`;
CREATE TABLE `showroomsite` (
  `siteid` int(11) NOT NULL auto_increment,
  `siterow` varchar(255) default NULL,
  `sitecol` varchar(255) default NULL,
  `showroomid` varchar(255) default NULL,
  PRIMARY KEY  (`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of showroomsite
-- ----------------------------
INSERT INTO `showroomsite` VALUES ('7', '1', '0(0)-20(1)-1(0)', '2');
INSERT INTO `showroomsite` VALUES ('8', '2', '0(0)-20(1)-1(0)', '2');
INSERT INTO `showroomsite` VALUES ('9', '3', '0(0)-20(1)-1(0)', '2');
INSERT INTO `showroomsite` VALUES ('10', '4', '0(0)-20(1)-1(0)', '2');
INSERT INTO `showroomsite` VALUES ('11', '5', '2(0)-20(1)-(0)', '2');
INSERT INTO `showroomsite` VALUES ('12', '6', '2(0)-20(1)-(0)', '2');
INSERT INTO `showroomsite` VALUES ('13', '1', '0(0)-20(1)-1(0)', '3');
INSERT INTO `showroomsite` VALUES ('14', '2', '0(0)-20(1)-1(0)', '3');
INSERT INTO `showroomsite` VALUES ('15', '3', '0(0)-20(1)-1(0)', '3');
INSERT INTO `showroomsite` VALUES ('16', '4', '0(0)-20(1)-1(0)', '3');
INSERT INTO `showroomsite` VALUES ('17', '5', '2(0)-20(1)-(0)', '3');
INSERT INTO `showroomsite` VALUES ('18', '6', '2(0)-20(1)-(0)', '3');

-- ----------------------------
-- Table structure for `tickettrade`
-- ----------------------------
DROP TABLE IF EXISTS `tickettrade`;
CREATE TABLE `tickettrade` (
  `tickedid` int(11) NOT NULL auto_increment,
  `onscreenid` int(11) default NULL,
  `siterow` int(11) default NULL,
  `sitecol` int(11) default NULL,
  `showroomid` int(11) default NULL,
  `shouldpay` int(11) default NULL,
  `realpay` int(11) default NULL,
  `vipno` varchar(255) default NULL,
  PRIMARY KEY  (`tickedid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tickettrade
-- ----------------------------
INSERT INTO `tickettrade` VALUES ('1', '2', '3', '11', '3', '45', '45', '-1');
INSERT INTO `tickettrade` VALUES ('2', '2', '4', '11', '3', '45', '45', '-1');
INSERT INTO `tickettrade` VALUES ('3', '2', '4', '8', '3', '45', '45', '-1');

-- ----------------------------
-- Table structure for `vip`
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `vipid` int(11) NOT NULL auto_increment,
  `vipno` varchar(255) default NULL,
  `viplevel` varchar(255) default NULL,
  `totalconsume` varchar(255) default NULL,
  PRIMARY KEY  (`vipid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('1', '2015033020000943', '223', '0');
