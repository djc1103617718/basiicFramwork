-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015-12-25 15:26:18
-- 服务器版本: 5.5.46-0ubuntu0.14.04.2
-- PHP 版本: 5.5.9-1ubuntu4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `basicFramework`
--

-- --------------------------------------------------------

--
-- 表的结构 `bf_admin`
--

CREATE TABLE IF NOT EXISTS `bf_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `password_reset_token` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `auth_key` varchar(42) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bf_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `bf_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='该表存放授权条目对用户的指派情况';

-- --------------------------------------------------------

--
-- 表的结构 `bf_auth_item`
--

CREATE TABLE IF NOT EXISTS `bf_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='该表存放授权条目（译者注：即角色和权限）';

-- --------------------------------------------------------

--
-- 表的结构 `bf_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `bf_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='该表存放授权条目的层次关系';

-- --------------------------------------------------------

--
-- 表的结构 `bf_auth_rule`
--

CREATE TABLE IF NOT EXISTS `bf_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 该表存放规则';

-- --------------------------------------------------------

--
-- 表的结构 `bf_user`
--

CREATE TABLE IF NOT EXISTS `bf_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `password_reset_token` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `auth_key` varchar(42) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `bf_user`
--

INSERT INTO `bf_user` (`id`, `username`, `password_hash`, `password_reset_token`, `email`, `auth_key`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$13$Qbu.xB6ESAkGBzCzQK950ewYql66HeYDvMK.FiQftIlqYcULpa1Tq', '', 'admin@email.com', 'XAxirZhuFMDevXT0rnOPpfcU0X-OsSdc', 10, 1451028126, 1451028126);

--
-- 限制导出的表
--

--
-- 限制表 `bf_auth_assignment`
--
ALTER TABLE `bf_auth_assignment`
  ADD CONSTRAINT `bf_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `bf_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `bf_auth_item`
--
ALTER TABLE `bf_auth_item`
  ADD CONSTRAINT `bf_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `bf_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `bf_auth_item_child`
--
ALTER TABLE `bf_auth_item_child`
  ADD CONSTRAINT `bf_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `bf_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bf_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `bf_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
