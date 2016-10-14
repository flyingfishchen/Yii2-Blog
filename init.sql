-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.26 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 press 的数据库结构
CREATE DATABASE IF NOT EXISTS `press` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `press`;


-- 导出  表 press.press_admins 结构
CREATE TABLE IF NOT EXISTS `press_admins` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `auth_key` varchar(128) NOT NULL,
  `access_token` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `access_token` (`access_token`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_admins 的数据：2 rows
/*!40000 ALTER TABLE `press_admins` DISABLE KEYS */;
INSERT INTO `press_admins` (`admin_id`, `username`, `password`, `auth_key`, `access_token`) VALUES
	(1, 'root', '7e0d01be13de1b4a39343b1edcde4cab03f41833', 'vPCCPL3Q6MBSI7RL3S544F0lklPkk_Lr', NULL),
	(3, 'test', 'a4c1b51230fba8552f379ade9ad654b42d88204d', 'wS_LzRoOQaWJb_ab9uuqFAFjPxgx6XAb', NULL);
/*!40000 ALTER TABLE `press_admins` ENABLE KEYS */;


-- 导出  表 press.press_article_categories 结构
CREATE TABLE IF NOT EXISTS `press_article_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `tree` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_article_categories 的数据：4 rows
/*!40000 ALTER TABLE `press_article_categories` DISABLE KEYS */;
INSERT INTO `press_article_categories` (`category_id`, `title`, `image`, `order_num`, `slug`, `tree`, `lft`, `rgt`, `depth`, `status`) VALUES
	(1, 'Articles category 1', NULL, 2, 'articles-category-1', 1, 1, 2, 0, 1),
	(2, 'Articles category 2', NULL, 1, 'articles-category-2', 2, 1, 6, 0, 1),
	(3, 'Subcategory 1', NULL, 1, 'subcategory-1', 2, 2, 3, 1, 1),
	(4, 'Subcategory 1', NULL, 1, 'subcategory-1-2', 2, 4, 5, 1, 1);
/*!40000 ALTER TABLE `press_article_categories` ENABLE KEYS */;


-- 导出  表 press.press_article_items 结构
CREATE TABLE IF NOT EXISTS `press_article_items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `short` varchar(1024) DEFAULT NULL,
  `text` text NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `time` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_article_items 的数据：3 rows
/*!40000 ALTER TABLE `press_article_items` DISABLE KEYS */;
INSERT INTO `press_article_items` (`item_id`, `category_id`, `title`, `image`, `short`, `text`, `slug`, `time`, `views`, `status`) VALUES
	(1, 1, 'First article title', '/uploads/article/article-1.jpg', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt molliti', '<p><strong>Sed ut perspiciatis</strong>, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.&nbsp;</p><ul><li>item 1</li><li>item 2</li><li>item 3</li></ul><p>ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?</p>', 'first-article-title', 1456885754, 2, 1),
	(2, 1, 'Second article title', '/uploads/article/article-2.jpg', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p><ol> <li>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </li><li>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</li></ol>', 'second-article-title', 1456799354, 0, 1),
	(3, 1, 'Third article title', '/uploads/article/article-3.jpg', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt molliti', '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>', 'third-article-title', 1456712954, 0, 1);
/*!40000 ALTER TABLE `press_article_items` ENABLE KEYS */;


-- 导出  表 press.press_auth_assignment 结构
CREATE TABLE IF NOT EXISTS `press_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `press_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `press_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_auth_assignment 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `press_auth_assignment` DISABLE KEYS */;
INSERT INTO `press_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
	('Administrator', '3', 1476344399),
	('root', '1', 1476259377);
/*!40000 ALTER TABLE `press_auth_assignment` ENABLE KEYS */;


-- 导出  表 press.press_auth_item 结构
CREATE TABLE IF NOT EXISTS `press_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `press_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `press_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_auth_item 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `press_auth_item` DISABLE KEYS */;
INSERT INTO `press_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
	('/admin/admins/*', 2, NULL, NULL, NULL, 1476261310, 1476261310),
	('/admin/default/*', 2, NULL, NULL, NULL, 1476342242, 1476342242),
	('/admin/logs/*', 2, NULL, NULL, NULL, 1476261314, 1476261314),
	('/admin/modules/*', 2, NULL, NULL, NULL, 1476261319, 1476261319),
	('/admin/news/*', 2, NULL, NULL, NULL, 1476261453, 1476261453),
	('/admin/redactor/*', 2, NULL, NULL, NULL, 1476342263, 1476342263),
	('/admin/sign/*', 2, NULL, NULL, NULL, 1476342278, 1476342278),
	('/admin/system/*', 2, NULL, NULL, NULL, 1476261329, 1476261329),
	('/admin/tags/*', 2, NULL, NULL, NULL, 1476342292, 1476342292),
	('/rabc/assignment/*', 2, NULL, NULL, NULL, 1476332746, 1476332746),
	('/rabc/role/*', 2, NULL, NULL, NULL, 1476332735, 1476332735),
	('/rabc/route/*', 2, NULL, NULL, NULL, 1476332739, 1476332739),
	('Administrator', 1, 'Administrator', NULL, NULL, 1476257176, 1476338951),
	('root', 1, 'Super Administrator', NULL, NULL, 1476257150, 1476338990);
/*!40000 ALTER TABLE `press_auth_item` ENABLE KEYS */;


-- 导出  表 press.press_auth_item_child 结构
CREATE TABLE IF NOT EXISTS `press_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `press_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `press_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `press_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `press_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_auth_item_child 的数据：~18 rows (大约)
/*!40000 ALTER TABLE `press_auth_item_child` DISABLE KEYS */;
INSERT INTO `press_auth_item_child` (`parent`, `child`) VALUES
	('root', '/admin/admins/*'),
	('Administrator', '/admin/default/*'),
	('root', '/admin/default/*'),
	('root', '/admin/logs/*'),
	('root', '/admin/modules/*'),
	('Administrator', '/admin/news/*'),
	('root', '/admin/news/*'),
	('Administrator', '/admin/redactor/*'),
	('root', '/admin/redactor/*'),
	('Administrator', '/admin/sign/*'),
	('root', '/admin/sign/*'),
	('Administrator', '/admin/system/*'),
	('root', '/admin/system/*'),
	('Administrator', '/admin/tags/*'),
	('root', '/admin/tags/*'),
	('root', '/rabc/assignment/*'),
	('root', '/rabc/role/*'),
	('root', '/rabc/route/*');
/*!40000 ALTER TABLE `press_auth_item_child` ENABLE KEYS */;


-- 导出  表 press.press_auth_rule 结构
CREATE TABLE IF NOT EXISTS `press_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_auth_rule 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `press_auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `press_auth_rule` ENABLE KEYS */;


-- 导出  表 press.press_loginform 结构
CREATE TABLE IF NOT EXISTS `press_loginform` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `user_agent` varchar(1024) NOT NULL,
  `time` int(11) DEFAULT '0',
  `success` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_loginform 的数据：45 rows
/*!40000 ALTER TABLE `press_loginform` DISABLE KEYS */;
INSERT INTO `press_loginform` (`log_id`, `username`, `password`, `ip`, `user_agent`, `time`, `success`) VALUES
	(78, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476344392, 1),
	(77, 'test', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476342445, 1),
	(76, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476342199, 1),
	(75, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476341360, 1),
	(74, 'test', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476340835, 1),
	(73, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476340747, 1),
	(72, 'test', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476340693, 1),
	(71, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476334021, 1),
	(70, 'test', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476334010, 1),
	(69, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476334003, 1),
	(68, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476333362, 1),
	(67, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476333073, 1),
	(66, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476253564, 1),
	(65, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1475923631, 1),
	(64, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1475923295, 1),
	(63, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1475923170, 1),
	(62, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1475920922, 1),
	(61, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1475918197, 1),
	(60, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1475907324, 1),
	(59, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1475893567, 1),
	(58, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475138693, 1),
	(57, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475138647, 1),
	(56, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475138527, 1),
	(55, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475138432, 1),
	(54, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475138268, 1),
	(53, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475138148, 1),
	(52, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475138057, 1),
	(51, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475137786, 1),
	(50, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475134449, 1),
	(49, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475134342, 1),
	(48, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475132990, 1),
	(47, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1475116115, 1),
	(46, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1474972475, 1),
	(45, 'root', 'mGVx89DLxN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1474972443, 0),
	(44, 'root', 'mGVx89DLxN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1474972336, 0),
	(43, 'root', 'mGVx89DLxN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 1474972332, 0),
	(79, 'test', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476344429, 1),
	(80, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476344856, 1),
	(81, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476349612, 1),
	(82, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476349845, 1),
	(83, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476350208, 1),
	(84, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476350235, 1),
	(85, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476352729, 1),
	(86, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476353285, 1),
	(87, 'root', '******', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1476430736, 1);
/*!40000 ALTER TABLE `press_loginform` ENABLE KEYS */;


-- 导出  表 press.press_menu 结构
CREATE TABLE IF NOT EXISTS `press_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `press_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `press_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_menu 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `press_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `press_menu` ENABLE KEYS */;


-- 导出  表 press.press_migration 结构
CREATE TABLE IF NOT EXISTS `press_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_migration 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `press_migration` DISABLE KEYS */;
INSERT INTO `press_migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1456885752),
	('m000000_000000_install', 1456885754),
	('m140602_111327_create_menu_table', 1476256040);
/*!40000 ALTER TABLE `press_migration` ENABLE KEYS */;


-- 导出  表 press.press_modules 结构
CREATE TABLE IF NOT EXISTS `press_modules` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `class` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `icon` varchar(32) NOT NULL,
  `settings` text NOT NULL,
  `notice` int(11) DEFAULT '0',
  `order_num` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_modules 的数据：1 rows
/*!40000 ALTER TABLE `press_modules` DISABLE KEYS */;
INSERT INTO `press_modules` (`module_id`, `name`, `class`, `title`, `icon`, `settings`, `notice`, `order_num`, `status`) VALUES
	(9, 'news', 'backend\\modules\\news\\NewsModule', 'News', 'pencil', '{"enableThumb":false,"enablePhotos":false,"enableShort":true,"shortMaxLength":"256","enableTags":true}', 0, 70, 1);
/*!40000 ALTER TABLE `press_modules` ENABLE KEYS */;


-- 导出  表 press.press_news 结构
CREATE TABLE IF NOT EXISTS `press_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `short` varchar(1024) DEFAULT NULL,
  `text` text NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `time` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `sequence` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`news_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_news 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `press_news` DISABLE KEYS */;
INSERT INTO `press_news` (`news_id`, `title`, `image`, `short`, `text`, `slug`, `time`, `views`, `sequence`, `status`) VALUES
	(1, 'First news title', '/uploads/news/news-1.jpg', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt molliti', '<p><strong>Sed ut perspiciatis</strong>, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.&nbsp;</p><ul><li>item 1</li><li>item 2</li><li>item 3</li></ul><p>ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?</p>', 'first-news-title', 1456885754, 12, 6, 1),
	(2, 'Second news title', '/uploads/news/news-2.jpg', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p><ol> <li>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </li><li>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</li></ol>', 'second-news-title', 1456799354, 9, 5, 1),
	(3, 'Third news title', '/uploads/news/news-3.jpg', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt molliti', '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>', 'third-news-title', 1456712954, 7, 2, 1);
/*!40000 ALTER TABLE `press_news` ENABLE KEYS */;


-- 导出  表 press.press_seotext 结构
CREATE TABLE IF NOT EXISTS `press_seotext` (
  `seotext_id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(128) NOT NULL,
  `item_id` int(11) NOT NULL,
  `h1` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `keywords` varchar(128) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`seotext_id`),
  UNIQUE KEY `model_item` (`class`,`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_seotext 的数据：1 rows
/*!40000 ALTER TABLE `press_seotext` DISABLE KEYS */;
/*!40000 ALTER TABLE `press_seotext` ENABLE KEYS */;


-- 导出  表 press.press_settings 结构
CREATE TABLE IF NOT EXISTS `press_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `value` varchar(1024) NOT NULL,
  `visibility` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_settings 的数据：9 rows
/*!40000 ALTER TABLE `press_settings` DISABLE KEYS */;
INSERT INTO `press_settings` (`setting_id`, `name`, `title`, `value`, `visibility`) VALUES
	(1, 'press_version', 'pressCMS version', '0.9', 0),
	(2, 'recaptcha_key', 'ReCaptcha key', '', 1),
	(3, 'password_salt', 'Password salt', 'lK7MZDOXOsijEz_PS-YR9I_vySzEJkyN', 0),
	(4, 'root_auth_key', 'Root authorization key', 'vPCCPL3Q6MBSI7RL3S544F0lklPkk_Lr', 0),
	(5, 'root_password', 'Root password', 'a66a44fc421bfc20c8d972aa588c8e161d5010c5', 1),
	(6, 'auth_time', 'Auth time', '86400', 1),
	(7, 'robot_email', 'Robot E-mail', 'noreply@www.press.com', 1),
	(8, 'admin_email', 'Admin E-mail', 'chenming1@meizu.com', 2),
	(9, 'recaptcha_secret', 'ReCaptcha secret', '', 1);
/*!40000 ALTER TABLE `press_settings` ENABLE KEYS */;


-- 导出  表 press.press_tags 结构
CREATE TABLE IF NOT EXISTS `press_tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `frequency` int(11) DEFAULT '0',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_tags 的数据：8 rows
/*!40000 ALTER TABLE `press_tags` DISABLE KEYS */;
INSERT INTO `press_tags` (`tag_id`, `name`, `frequency`) VALUES
	(1, 'php', 2),
	(2, 'yii2', 3),
	(3, 'jquery', 3),
	(4, 'html', 1),
	(5, 'css', 1),
	(6, 'bootstrap', 1),
	(7, 'ajax', 1),
	(19, 'test', 1);
/*!40000 ALTER TABLE `press_tags` ENABLE KEYS */;


-- 导出  表 press.press_tags_assign 结构
CREATE TABLE IF NOT EXISTS `press_tags_assign` (
  `class` varchar(128) NOT NULL,
  `item_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  KEY `class` (`class`),
  KEY `item_tag` (`item_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  press.press_tags_assign 的数据：13 rows
/*!40000 ALTER TABLE `press_tags_assign` DISABLE KEYS */;
INSERT INTO `press_tags_assign` (`class`, `item_id`, `tag_id`) VALUES
	('yii\\press\\modules\\news\\models\\News', 1, 1),
	('yii\\press\\modules\\news\\models\\News', 1, 2),
	('yii\\press\\modules\\news\\models\\News', 1, 3),
	('yii\\press\\modules\\news\\models\\News', 2, 2),
	('yii\\press\\modules\\news\\models\\News', 2, 3),
	('yii\\press\\modules\\news\\models\\News', 2, 4),
	('yii\\press\\modules\\article\\models\\Item', 1, 1),
	('yii\\press\\modules\\article\\models\\Item', 1, 5),
	('yii\\press\\modules\\article\\models\\Item', 1, 6),
	('yii\\press\\modules\\article\\models\\Item', 2, 2),
	('yii\\press\\modules\\article\\models\\Item', 2, 3),
	('yii\\press\\modules\\article\\models\\Item', 2, 7),
	('yii\\press\\modules\\news\\models\\News', 4, 19);
/*!40000 ALTER TABLE `press_tags_assign` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
