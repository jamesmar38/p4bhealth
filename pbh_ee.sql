-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2013 at 11:54 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pbh_ee`
--

-- --------------------------------------------------------

--
-- Table structure for table `exp_accessories`
--

CREATE TABLE IF NOT EXISTS `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(255) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `exp_accessories`
--

INSERT INTO `exp_accessories` (`accessory_id`, `class`, `member_groups`, `controllers`, `accessory_version`) VALUES
(1, 'Expressionengine_info_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.0'),
(2, 'Structure_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '3.3.10'),
(3, 'Structure_first_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.2'),
(4, 'Nsm_morphine_theme_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '2.0.3'),
(5, 'Nsm_addon_updater_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.3.0'),
(6, 'Draggable_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.3');

-- --------------------------------------------------------

--
-- Table structure for table `exp_actions`
--

CREATE TABLE IF NOT EXISTS `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES
(1, 'Comment', 'insert_new_comment'),
(2, 'Comment_mcp', 'delete_comment_notification'),
(3, 'Comment', 'comment_subscribe'),
(4, 'Comment', 'edit_comment'),
(5, 'Safecracker', 'submit_entry'),
(6, 'Safecracker', 'combo_loader'),
(7, 'Search', 'do_search'),
(8, 'Channel', 'insert_new_entry'),
(9, 'Channel', 'filemanager_endpoint'),
(10, 'Channel', 'smiley_pop'),
(11, 'Rte', 'get_js'),
(12, 'Structure', 'ajax_move_set_data'),
(13, 'Editor', 'ACT_file_upload'),
(14, 'Channel_videos', 'channel_videos_router');

-- --------------------------------------------------------

--
-- Table structure for table `exp_captcha`
--

CREATE TABLE IF NOT EXISTS `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

CREATE TABLE IF NOT EXISTS `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_fields`
--

CREATE TABLE IF NOT EXISTS `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_field_data`
--

CREATE TABLE IF NOT EXISTS `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_groups`
--

CREATE TABLE IF NOT EXISTS `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_posts`
--

CREATE TABLE IF NOT EXISTS `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels`
--

CREATE TABLE IF NOT EXISTS `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(255) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `ping_return_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `ping_return_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`) VALUES
(1, 1, 'homepage', 'Homepage', 'http://local.p4bhealth.org/', NULL, 'en', 1, 0, 1375826640, 0, '', NULL, 'open', 1, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0),
(2, 1, 'give', 'Give', 'http://local.p4bhealth.org/', NULL, 'en', 8, 0, 1376681040, 0, '', NULL, 'open', 5, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0),
(3, 1, 'projects', 'Projects', 'http://local.p4bhealth.org/', NULL, 'en', 1, 0, 1376510580, 0, '', NULL, 'open', 4, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0),
(4, 1, 'get-involved', 'Get Involved', 'http://local.p4bhealth.org/', NULL, 'en', 1, 0, 1376679780, 0, '', NULL, 'open', 3, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0),
(5, 1, 'about', 'About', 'http://local.p4bhealth.org/', NULL, 'en', 6, 0, 1376931840, 0, '', NULL, 'open', 6, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0),
(6, 1, 'stories', 'Stories', 'http://local.p4bhealth.org/', NULL, 'en', 1, 0, 1376935440, 0, '', NULL, 'open', 7, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data`
--

CREATE TABLE IF NOT EXISTS `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_1` text,
  `field_ft_1` tinytext,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` text,
  `field_ft_5` tinytext,
  `field_id_6` text,
  `field_ft_6` tinytext,
  `field_id_7` text,
  `field_ft_7` tinytext,
  `field_id_8` text,
  `field_ft_8` tinytext,
  `field_id_9` text,
  `field_ft_9` tinytext,
  `field_id_10` text,
  `field_ft_10` tinytext,
  `field_id_11` text,
  `field_ft_11` tinytext,
  `field_id_12` text,
  `field_ft_12` tinytext,
  `field_id_13` text,
  `field_ft_13` tinytext,
  `field_id_14` text,
  `field_ft_14` tinytext,
  `field_id_15` text,
  `field_ft_15` tinytext,
  `field_id_16` text,
  `field_ft_16` tinytext,
  `field_id_17` text,
  `field_ft_17` tinytext,
  `field_id_18` text,
  `field_ft_18` tinytext,
  `field_id_19` text,
  `field_ft_19` tinytext,
  `field_id_20` text,
  `field_ft_20` tinytext,
  `field_id_21` text,
  `field_ft_21` tinytext,
  `field_id_22` text,
  `field_ft_22` tinytext,
  `field_id_23` text,
  `field_ft_23` tinytext,
  `field_id_24` text,
  `field_ft_24` tinytext,
  `field_id_25` text,
  `field_ft_25` tinytext,
  `field_id_26` text,
  `field_ft_26` tinytext,
  `field_id_28` text,
  `field_ft_28` tinytext,
  `field_id_29` text,
  `field_ft_29` tinytext,
  `field_id_30` text,
  `field_ft_30` tinytext,
  `field_id_31` text,
  `field_ft_31` tinytext,
  `field_id_32` text,
  `field_ft_32` tinytext,
  `field_id_33` text,
  `field_ft_33` tinytext,
  `field_id_34` text,
  `field_ft_34` tinytext,
  `field_id_35` text,
  `field_ft_35` tinytext,
  `field_id_36` text,
  `field_ft_36` tinytext,
  `field_id_37` text,
  `field_ft_37` tinytext,
  `field_id_38` text,
  `field_ft_38` tinytext,
  `field_id_39` text,
  `field_ft_39` tinytext,
  `field_id_40` text,
  `field_ft_40` tinytext,
  `field_id_41` text,
  `field_ft_41` tinytext,
  `field_id_42` text,
  `field_ft_42` tinytext,
  `field_id_43` text,
  `field_ft_43` tinytext,
  `field_id_44` text,
  `field_ft_44` tinytext,
  `field_id_45` text,
  `field_ft_45` tinytext,
  `field_id_46` text,
  `field_ft_46` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_channel_data`
--

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_1`, `field_ft_1`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`, `field_id_8`, `field_ft_8`, `field_id_9`, `field_ft_9`, `field_id_10`, `field_ft_10`, `field_id_11`, `field_ft_11`, `field_id_12`, `field_ft_12`, `field_id_13`, `field_ft_13`, `field_id_14`, `field_ft_14`, `field_id_15`, `field_ft_15`, `field_id_16`, `field_ft_16`, `field_id_17`, `field_ft_17`, `field_id_18`, `field_ft_18`, `field_id_19`, `field_ft_19`, `field_id_20`, `field_ft_20`, `field_id_21`, `field_ft_21`, `field_id_22`, `field_ft_22`, `field_id_23`, `field_ft_23`, `field_id_24`, `field_ft_24`, `field_id_25`, `field_ft_25`, `field_id_26`, `field_ft_26`, `field_id_28`, `field_ft_28`, `field_id_29`, `field_ft_29`, `field_id_30`, `field_ft_30`, `field_id_31`, `field_ft_31`, `field_id_32`, `field_ft_32`, `field_id_33`, `field_ft_33`, `field_id_34`, `field_ft_34`, `field_id_35`, `field_ft_35`, `field_id_36`, `field_ft_36`, `field_id_37`, `field_ft_37`, `field_id_38`, `field_ft_38`, `field_id_39`, `field_ft_39`, `field_id_40`, `field_ft_40`, `field_id_41`, `field_ft_41`, `field_id_42`, `field_ft_42`, `field_id_43`, `field_ft_43`, `field_id_44`, `field_ft_44`, `field_id_45`, `field_ft_45`, `field_id_46`, `field_ft_46`) VALUES
(1, 1, 1, '{filedir_1}pbh_home-header.jpg', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', 'Imagine Your Community \nWith A Healthier Future', 'none', 'ChannelVideos', 'xhtml', 'OUR VISION', 'none', 'Population-Based Health Systems', 'none', 'Our vision is to assist communities throughout the United States in developing a population-based health system that reflects the health needs and preferences of the segments of our community, with service and access solutions that are appropriate in scale and cost, developed through collaboration and cooperation between the communities and the health sector.', 'none', 'OUR PROCESS', 'none', 'It Starts With Collaboration', 'none', '1', 'xhtml', '/about', 'none', 'OUR PARTNERS', 'none', 'It Continues With Our Partnerships', 'none', '1', 'none', 'CALL TO ACTION', 'none', 'How Can You Participate?', 'none', '1', 'none', 'See Our List of Partners', 'none', '/about/partners-organizations', 'none', 'WHAT WE''VE DONE', 'none', '1', 'none'),
(4, 1, 3, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', 'These Are Our Projects', 'none', '<p>\n	                Our projects are brought to you by the Randall Lewis Fellowship\n</p>', 'xhtml', '1', 'none', 'FILTER PROJECTS BY CITY', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(3, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(5, 1, 3, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(6, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(7, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(8, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(9, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(10, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(11, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(12, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(13, 1, 4, '', NULL, '', 'none', 'The Randall Lewis Health Policy Fellowship', 'none', '<p>\n	 A collaborative of corporate, university, and community leadership to assist municipal efforts in the San Bernardino County’s Healthy Communities Initiative. You’re invited to get involved!\n</p>', 'xhtml', 'THE PURPOSE', 'none', '<p>\n	 The purpose of the Randall Lewis Health Policy Fellowship program is to ensure the development of public health professionals who possess the necessary skills to influence positive change in public policy, systems, and the built environment in our local municipalities. In addition, these prestigious and competitive fellowships will create educational and professional opportunities for local students in health policy, provide for the expansion of the regional health policy infrastructure, and retain essential intellectual capital in the Inland Empire\n</p>\n<p>\n	 The fellowship, currentily in its third year, runs from September until May.\n</p>', 'xhtml', '1', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(14, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', 'How You Can Give', 'none', '<p>\n	 Please join us in creating a healthier future with a donation. We have provided a safe and cost efficient means for you to give to Partners for Better Health (P4bHealth.)\n</p>', 'xhtml', 'OTHER WAYS TO GIVE', 'none', '1', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(15, 1, 5, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', 'About Us', 'none', '<p>\n	     Please join us in creating a healthier future with a donation. We have provided a safe and cost efficient means for you to give to Partners for Better Health (P4bHealth.)\n</p>', 'xhtml', '...', 'none', '<p>\n	 ...\n</p>', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(16, 1, 5, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', 'About Us', 'none', '<h1>What Is P4B Health?</h1>\n<p>\n	     Partners for Better Health (P4bHealth) is a not-for-profit 501 (C) (3) public benefit corporation in formation with the purpose and healthcare design and development to meet the health needs of our local communities. We will not directly provide health services but work with existing agencies to develop appropriate health services.\n</p>\n<h1>Vision</h1>\n<p>\n	  To assist communities throughout the United States in developing a population-based health system that reflects the health needs and preferences of the segments of our community, with service and access solutions that are appropriate in scale and cost, developed through collaboration and cooperation between the communities and the health sector.\n</p>\n<h1>Mission</h1>\n<p>\n	  Partners for Better Health (P4bHealth) will lead in creation of a collaborative effort to understand and interpret health needs, conceptualize solutions, then incubate solutions, drawing on the resources of public and private organizations and on the voluntary contributions of people in the served communities.\n</p>\n<h1>History</h1>\n<p>\n	  Partners for Better Health (P4bHealth) started in 2002 when a group of concerned community members made a decision that they wanted their community to be different. They wanted to create a better future. In 2006, Partners for Better Health (P4bHealth) officially became a 501(c)(3). Today, the conversation continues. Communities are being transformed; our part of the world is modeling the change we want to see—a new paradigm in health begins.\n</p>', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(17, 1, 5, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', 'About Us', 'none', '<p>\n	  Please join us in creating a healthier future with a donation. We have provided a safe and cost efficient means for you to give to Partners for Better Health (P4bHealth.)\n</p>', 'xhtml', 'Partners & Organizations', 'none', '<div>\n	<ol>\n		<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">2-1-1</li>\n		<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">American Red Cross</li>\n		<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Arrowhead Regional Medical Center</li>\n		<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">BLD Consulting</li>\n		<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Chaffey Joint Unified School District</li>\n		<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">City of Ontario<br>\n		  City Manager<br>\n		  Chamber of Commerce<br>\n		  Code Enforcement<br>\n		  Development Center<br>\n		  Economic Development<br>\n		  Fire Department<br>\n		  Housing<br>\n		  Library<br>\n		  Mayor’s Office<br>\n		  Parks<br>\n		  Planning<br>\n		  Public Works<br>\n		  Police Department<br>\n		  Recreation<br>\n		  Risk Management<br>\n		  Transportation</li>\n		<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Fresh Start Ministries</li>\n		<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Coalition for Quality Affordable Health Care</li>\n		<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">First 5 San Bernardino</li>\n	</ol>\n	<div>\n		<ol>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Fox Group - Consultants to the Healthcare Industry</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">IHP</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Kaiser Permanente</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Kids Come First</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Latino Health Collaborative</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Lewis Group</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Loma Linda University</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Mercy House</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Mt Zion Church</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Ontario Montclair School District</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Our Lady of Guadalupe</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Pomona Valley Hospital Medical Center</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Public Works</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Reach Out West End</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">SMG Catering</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">San Bernardino County</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">San Joaquin Valley College</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">San Antonio Community Hospital</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">The Planning Center</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Transportation Center</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Water of Life Church</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">12 Week Weight Loss Challenge</li>\n			<li><img src="http://www.p4bhealth.org/P4bhealth/Partners_files/bullet_plus.png" alt="Bullet">Ontario Montclair YMCA</li>\n		</ol>\n	</div>\n</div>', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(18, 1, 5, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', 'Our Team', 'none', '<h1>Staff</h1>\n<ul>\n	<li><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget1">Dora Barilla, DrPH, MPH, CHES, Executive Director, Loma Linda University</a></li>\n	<li><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget1"><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"></a><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget2">Eileen Fry Bowers, JD, MS, RN, CPNP</a></li>\n	<li><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget2"><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"></a><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget3">Sandra Fuentes, MSW, RN</a></li>\n</ul>\n<h1>Board of Directors</h1>\n<ul>\n	<li><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget1">Dora Barilla, DrPH, MPH, CHES, Executive Director, Loma Linda University </a></li>\n	<li><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget1"><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"></a><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget4">Larry Enriquez, MCS, Ontario/Montclair YMCA</a></li>\n	<li><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget4"><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png">Shirley Simmons, Vice-Chairman, Community</a></li>\n	<li><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget4"><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"></a><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget5">Lesa Hiben, EMBA, Secretary, Claremont Graduate University </a></li>\n	<li><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget5"><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"></a><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget6">Betty Ansley, RN , Board Member; Public Heath Nurse (Retired), County of San Bernardino Department of Public Health </a></li>\n	<li><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget6"><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png">Angela Coaston, BSN, Water of Life</a></li>\n	<li><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget6"><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"></a><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget7">S. Eric Anderson, PhD, MBA, Treasurer, La Sierra University</a></li>\n	<li><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget7"><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"></a><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget8">Tammy Young, Member, DrPH, FNP-BC, CHES, Department of State</a></li>\n</ul>\n<h1>Advisory Board</h1>\n<ul>\n	<li><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget9">Angelica Baltazar, MSW, Health and Human Services Industry Specialist, ESRI</a></li>\n	<li><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget9"><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"></a><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget10">Mayor Paul Leon, City of Ontario, CA</a></li>\n	<li><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget10"><img alt="Bullet" src="http://www.p4bhealth.org/P4bhealth/OurTeam_files/bullet_plus.png"></a><a href="http://web.me.com/dratifadam/P4bhealth/OurTeam.html#widget11">Evelyn Trevino, MSE, Staff Analyst, Healthy Communities Program for the County of  San Bernardino County Public Health Department</a></li>\n</ul>', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(19, 1, 5, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(20, 1, 5, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(21, 1, 6, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'ChannelVideos', 'xhtml', 'Listen and Watch Our Stories', 'none', '<p>\n	    Lorem ipsum dolor sit amet, consectetur adipiscing elit, pellentesque pulvinar urna.\n</p>', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(22, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '1', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(23, 1, 3, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'xhtml', '1', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_entries_autosave`
--

CREATE TABLE IF NOT EXISTS `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_fields`
--

CREATE TABLE IF NOT EXISTS `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `exp_channel_fields`
--

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES
(1, 1, 1, 'hp_header_image', 'Header Image', '', 'file', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(2, 1, 3, 'get-involved_header_image', 'Header Image', '', 'file', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(3, 1, 3, 'get-involved_header_headline', 'Header Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(4, 1, 3, 'get-involved_header_content', 'Header Content', '', 'editor', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 3, 'any', 'YTo3OntzOjY6ImVkaXRvciI7YToyODp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjE0OiJ1cGxvYWRfc2VydmljZSI7czo1OiJsb2NhbCI7czoyMDoiZmlsZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoyMToiaW1hZ2VfdXBsb2FkX2xvY2F0aW9uIjtzOjE6IjAiO3M6MTQ6ImltYWdlX2Jyb3dzaW5nIjtzOjM6InllcyI7czoxMjoiaW1hZ2Vfc3ViZGlyIjtzOjM6InllcyI7czoyOiJzMyI7YTo0OntzOjQ6ImZpbGUiO2E6MTp7czo2OiJidWNrZXQiO3M6MDoiIjt9czo1OiJpbWFnZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjE0OiJhd3NfYWNjZXNzX2tleSI7czowOiIiO3M6MTQ6ImF3c19zZWNyZXRfa2V5IjtzOjA6IiI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czo5OiJkaXJlY3Rpb24iO3M6MzoibHRyIjtzOjc6InRvb2xiYXIiO3M6MzoieWVzIjtzOjY6InNvdXJjZSI7czozOiJ5ZXMiO3M6NToiZm9jdXMiO3M6Mjoibm8iO3M6MTA6ImF1dG9yZXNpemUiO3M6MzoieWVzIjtzOjU6ImZpeGVkIjtzOjI6Im5vIjtzOjEyOiJjb252ZXJ0bGlua3MiO3M6MzoieWVzIjtzOjExOiJjb252ZXJ0ZGl2cyI7czozOiJ5ZXMiO3M6Nzoib3ZlcmxheSI7czozOiJ5ZXMiO3M6MTM6Im9ic2VydmVpbWFnZXMiO3M6MzoieWVzIjtzOjk6InNob3J0Y3V0cyI7czozOiJ5ZXMiO3M6MzoiYWlyIjtzOjI6Im5vIjtzOjM6Ind5bSI7czoyOiJubyI7czo4OiJwcm90b2NvbCI7czozOiJ5ZXMiO3M6MTg6ImFsbG93ZWR0YWdzX29wdGlvbiI7czo3OiJkZWZhdWx0IjtzOjExOiJhbGxvd2VkdGFncyI7YTowOnt9czoxNDoiZm9ybWF0dGluZ3RhZ3MiO2E6Nzp7aTowO3M6MToicCI7aToxO3M6MTA6ImJsb2NrcXVvdGUiO2k6MjtzOjM6InByZSI7aTozO3M6MjoiaDEiO2k6NDtzOjI6ImgyIjtpOjU7czoyOiJoMyI7aTo2O3M6MjoiaDQiO31zOjg6Imxhbmd1YWdlIjtzOjI6ImVuIjtzOjg6ImNzc19maWxlIjtzOjA6IiI7czoxMToiZWRpdG9yX2NvbmYiO3M6MToiMyI7fXM6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(5, 1, 3, 'get-involved_body_headline', 'Body Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(6, 1, 3, 'get-involved_body_content', 'Body Content', '', 'editor', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 5, 'any', 'YTo3OntzOjY6ImVkaXRvciI7YToyODp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjE0OiJ1cGxvYWRfc2VydmljZSI7czo1OiJsb2NhbCI7czoyMDoiZmlsZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoyMToiaW1hZ2VfdXBsb2FkX2xvY2F0aW9uIjtzOjE6IjAiO3M6MTQ6ImltYWdlX2Jyb3dzaW5nIjtzOjM6InllcyI7czoxMjoiaW1hZ2Vfc3ViZGlyIjtzOjM6InllcyI7czoyOiJzMyI7YTo0OntzOjQ6ImZpbGUiO2E6MTp7czo2OiJidWNrZXQiO3M6MDoiIjt9czo1OiJpbWFnZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjE0OiJhd3NfYWNjZXNzX2tleSI7czowOiIiO3M6MTQ6ImF3c19zZWNyZXRfa2V5IjtzOjA6IiI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czo5OiJkaXJlY3Rpb24iO3M6MzoibHRyIjtzOjc6InRvb2xiYXIiO3M6MzoieWVzIjtzOjY6InNvdXJjZSI7czozOiJ5ZXMiO3M6NToiZm9jdXMiO3M6Mjoibm8iO3M6MTA6ImF1dG9yZXNpemUiO3M6MzoieWVzIjtzOjU6ImZpeGVkIjtzOjI6Im5vIjtzOjEyOiJjb252ZXJ0bGlua3MiO3M6MzoieWVzIjtzOjExOiJjb252ZXJ0ZGl2cyI7czozOiJ5ZXMiO3M6Nzoib3ZlcmxheSI7czozOiJ5ZXMiO3M6MTM6Im9ic2VydmVpbWFnZXMiO3M6MzoieWVzIjtzOjk6InNob3J0Y3V0cyI7czozOiJ5ZXMiO3M6MzoiYWlyIjtzOjI6Im5vIjtzOjM6Ind5bSI7czoyOiJubyI7czo4OiJwcm90b2NvbCI7czozOiJ5ZXMiO3M6MTg6ImFsbG93ZWR0YWdzX29wdGlvbiI7czo3OiJkZWZhdWx0IjtzOjExOiJhbGxvd2VkdGFncyI7YTowOnt9czoxNDoiZm9ybWF0dGluZ3RhZ3MiO2E6Nzp7aTowO3M6MToicCI7aToxO3M6MTA6ImJsb2NrcXVvdGUiO2k6MjtzOjM6InByZSI7aTozO3M6MjoiaDEiO2k6NDtzOjI6ImgyIjtpOjU7czoyOiJoMyI7aTo2O3M6MjoiaDQiO31zOjg6Imxhbmd1YWdlIjtzOjI6ImVuIjtzOjg6ImNzc19maWxlIjtzOjA6IiI7czoxMToiZWRpdG9yX2NvbmYiO3M6MToiMyI7fXM6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(7, 1, 3, 'get-involved_content', 'Get Involved Content', '', 'matrix', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 6, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjMiO3M6ODoibWF4X3Jvd3MiO3M6MToiMyI7czo3OiJjb2xfaWRzIjthOjQ6e2k6MDtzOjE6IjEiO2k6MTtzOjE6IjIiO2k6MjtpOjc7aTozO2k6ODt9fQ=='),
(8, 1, 5, 'give_header_image', 'Header Image', '', 'file', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(9, 1, 5, 'give_header_headline', 'Header Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(10, 1, 5, 'give_header_content', 'Header Content', '', 'editor', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 3, 'any', 'YTo3OntzOjY6ImVkaXRvciI7YToyODp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjE0OiJ1cGxvYWRfc2VydmljZSI7czo1OiJsb2NhbCI7czoyMDoiZmlsZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoyMToiaW1hZ2VfdXBsb2FkX2xvY2F0aW9uIjtzOjE6IjAiO3M6MTQ6ImltYWdlX2Jyb3dzaW5nIjtzOjM6InllcyI7czoxMjoiaW1hZ2Vfc3ViZGlyIjtzOjM6InllcyI7czoyOiJzMyI7YTo0OntzOjQ6ImZpbGUiO2E6MTp7czo2OiJidWNrZXQiO3M6MDoiIjt9czo1OiJpbWFnZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjE0OiJhd3NfYWNjZXNzX2tleSI7czowOiIiO3M6MTQ6ImF3c19zZWNyZXRfa2V5IjtzOjA6IiI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czo5OiJkaXJlY3Rpb24iO3M6MzoibHRyIjtzOjc6InRvb2xiYXIiO3M6MzoieWVzIjtzOjY6InNvdXJjZSI7czozOiJ5ZXMiO3M6NToiZm9jdXMiO3M6Mjoibm8iO3M6MTA6ImF1dG9yZXNpemUiO3M6MzoieWVzIjtzOjU6ImZpeGVkIjtzOjI6Im5vIjtzOjEyOiJjb252ZXJ0bGlua3MiO3M6MzoieWVzIjtzOjExOiJjb252ZXJ0ZGl2cyI7czozOiJ5ZXMiO3M6Nzoib3ZlcmxheSI7czozOiJ5ZXMiO3M6MTM6Im9ic2VydmVpbWFnZXMiO3M6MzoieWVzIjtzOjk6InNob3J0Y3V0cyI7czozOiJ5ZXMiO3M6MzoiYWlyIjtzOjI6Im5vIjtzOjM6Ind5bSI7czoyOiJubyI7czo4OiJwcm90b2NvbCI7czozOiJ5ZXMiO3M6MTg6ImFsbG93ZWR0YWdzX29wdGlvbiI7czo3OiJkZWZhdWx0IjtzOjExOiJhbGxvd2VkdGFncyI7YTowOnt9czoxNDoiZm9ybWF0dGluZ3RhZ3MiO2E6Nzp7aTowO3M6MToicCI7aToxO3M6MTA6ImJsb2NrcXVvdGUiO2k6MjtzOjM6InByZSI7aTozO3M6MjoiaDEiO2k6NDtzOjI6ImgyIjtpOjU7czoyOiJoMyI7aTo2O3M6MjoiaDQiO31zOjg6Imxhbmd1YWdlIjtzOjI6ImVuIjtzOjg6ImNzc19maWxlIjtzOjA6IiI7czoxMToiZWRpdG9yX2NvbmYiO3M6MToiMyI7fXM6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(11, 1, 5, 'give_body_headline', 'Body Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(12, 1, 5, 'give_content', 'Content', '', 'matrix', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 5, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6NDp7aTowO3M6MToiMyI7aToxO3M6MToiNCI7aToyO3M6MToiNSI7aTozO3M6MToiNiI7fX0='),
(13, 1, 6, 'about_header_image', 'Header Image', 'If left BLANK, the image in the -top level about page- will be used. Leave BLANK unless you want it to be unique from the other About subpages', 'file', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'y', 'none', 'n', 1, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(14, 1, 6, 'about_header_headline', 'Header Headline', 'If left BLANK, the headline in the -top level about page- will be used. Leave BLANK unless you want it to be unique from the other About subpages', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'y', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(15, 1, 6, 'about_header_content', 'Header Content', 'If left BLANK, the header content in the -top level about page- will be used. Leave BLANK unless you want it to be unique from the other About subpages', 'editor', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'y', 'xhtml', 'n', 3, 'any', 'YTo3OntzOjY6ImVkaXRvciI7YToyOTp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjc6ImJ1dHRvbnMiO2E6MzA6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjE6InwiO2k6MjtzOjEwOiJmb3JtYXR0aW5nIjtpOjM7czoxOiJ8IjtpOjQ7czo0OiJib2xkIjtpOjU7czo2OiJpdGFsaWMiO2k6NjtzOjc6ImRlbGV0ZWQiO2k6NztzOjE6InwiO2k6ODtzOjEzOiJ1bm9yZGVyZWRsaXN0IjtpOjk7czoxMToib3JkZXJlZGxpc3QiO2k6MTA7czo3OiJvdXRkZW50IjtpOjExO3M6NjoiaW5kZW50IjtpOjEyO3M6MToifCI7aToxMztzOjQ6ImxpbmsiO2k6MTQ7czo1OiJpbWFnZSI7aToxNTtzOjU6InZpZGVvIjtpOjE2O3M6NDoiZmlsZSI7aToxNztzOjU6InRhYmxlIjtpOjE4O3M6MToifCI7aToxOTtzOjk6ImZvbnRjb2xvciI7aToyMDtzOjk6ImJhY2tjb2xvciI7aToyMTtzOjE6InwiO2k6MjI7czo5OiJhbGlnbmxlZnQiO2k6MjM7czoxMToiYWxpZ25jZW50ZXIiO2k6MjQ7czoxMDoiYWxpZ25yaWdodCI7aToyNTtzOjc6Imp1c3RpZnkiO2k6MjY7czoxOiJ8IjtpOjI3O3M6MTQ6Imhvcml6b250YWxydWxlIjtpOjI4O3M6MTE6InBhc3RlX3BsYWluIjtpOjI5O3M6MToifCI7fXM6MTQ6InVwbG9hZF9zZXJ2aWNlIjtzOjU6ImxvY2FsIjtzOjIwOiJmaWxlX3VwbG9hZF9sb2NhdGlvbiI7czoxOiIwIjtzOjIxOiJpbWFnZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoxNDoiaW1hZ2VfYnJvd3NpbmciO3M6MzoieWVzIjtzOjEyOiJpbWFnZV9zdWJkaXIiO3M6MzoieWVzIjtzOjI6InMzIjthOjQ6e3M6NDoiZmlsZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjU6ImltYWdlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6MTQ6ImF3c19hY2Nlc3Nfa2V5IjtzOjA6IiI7czoxNDoiYXdzX3NlY3JldF9rZXkiO3M6MDoiIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjk6ImRpcmVjdGlvbiI7czozOiJsdHIiO3M6NzoidG9vbGJhciI7czozOiJ5ZXMiO3M6Njoic291cmNlIjtzOjM6InllcyI7czo1OiJmb2N1cyI7czoyOiJubyI7czoxMDoiYXV0b3Jlc2l6ZSI7czozOiJ5ZXMiO3M6NToiZml4ZWQiO3M6Mjoibm8iO3M6MTI6ImNvbnZlcnRsaW5rcyI7czozOiJ5ZXMiO3M6MTE6ImNvbnZlcnRkaXZzIjtzOjM6InllcyI7czo3OiJvdmVybGF5IjtzOjM6InllcyI7czoxMzoib2JzZXJ2ZWltYWdlcyI7czozOiJ5ZXMiO3M6OToic2hvcnRjdXRzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjI6Im5vIjtzOjg6InByb3RvY29sIjtzOjM6InllcyI7czoxODoiYWxsb3dlZHRhZ3Nfb3B0aW9uIjtzOjc6ImRlZmF1bHQiO3M6MTE6ImFsbG93ZWR0YWdzIjthOjA6e31zOjE0OiJmb3JtYXR0aW5ndGFncyI7YTo3OntpOjA7czoxOiJwIjtpOjE7czoxMDoiYmxvY2txdW90ZSI7aToyO3M6MzoicHJlIjtpOjM7czoyOiJoMSI7aTo0O3M6MjoiaDIiO2k6NTtzOjI6ImgzIjtpOjY7czoyOiJoNCI7fXM6ODoibGFuZ3VhZ2UiO3M6MjoiZW4iO3M6ODoiY3NzX2ZpbGUiO3M6MDoiIjtzOjExOiJlZGl0b3JfY29uZiI7czoxOiIzIjt9czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(16, 1, 6, 'about_body_headline', 'Body Headline', '', 'text', '', '0', 0, 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(17, 1, 6, 'about_body_content', 'Body Content', '', 'editor', '', '0', 0, 0, 6, 128, 'y', 'ltr', 'n', 'n', 'xhtml', 'n', 5, 'any', 'YTo3OntzOjY6ImVkaXRvciI7YToyOTp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjc6ImJ1dHRvbnMiO2E6MzA6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjE6InwiO2k6MjtzOjEwOiJmb3JtYXR0aW5nIjtpOjM7czoxOiJ8IjtpOjQ7czo0OiJib2xkIjtpOjU7czo2OiJpdGFsaWMiO2k6NjtzOjc6ImRlbGV0ZWQiO2k6NztzOjE6InwiO2k6ODtzOjEzOiJ1bm9yZGVyZWRsaXN0IjtpOjk7czoxMToib3JkZXJlZGxpc3QiO2k6MTA7czo3OiJvdXRkZW50IjtpOjExO3M6NjoiaW5kZW50IjtpOjEyO3M6MToifCI7aToxMztzOjQ6ImxpbmsiO2k6MTQ7czo1OiJpbWFnZSI7aToxNTtzOjU6InZpZGVvIjtpOjE2O3M6NDoiZmlsZSI7aToxNztzOjU6InRhYmxlIjtpOjE4O3M6MToifCI7aToxOTtzOjk6ImZvbnRjb2xvciI7aToyMDtzOjk6ImJhY2tjb2xvciI7aToyMTtzOjE6InwiO2k6MjI7czo5OiJhbGlnbmxlZnQiO2k6MjM7czoxMToiYWxpZ25jZW50ZXIiO2k6MjQ7czoxMDoiYWxpZ25yaWdodCI7aToyNTtzOjc6Imp1c3RpZnkiO2k6MjY7czoxOiJ8IjtpOjI3O3M6MTQ6Imhvcml6b250YWxydWxlIjtpOjI4O3M6MTE6InBhc3RlX3BsYWluIjtpOjI5O3M6MToifCI7fXM6MTQ6InVwbG9hZF9zZXJ2aWNlIjtzOjU6ImxvY2FsIjtzOjIwOiJmaWxlX3VwbG9hZF9sb2NhdGlvbiI7czoxOiIwIjtzOjIxOiJpbWFnZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoxNDoiaW1hZ2VfYnJvd3NpbmciO3M6MzoieWVzIjtzOjEyOiJpbWFnZV9zdWJkaXIiO3M6MzoieWVzIjtzOjI6InMzIjthOjQ6e3M6NDoiZmlsZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjU6ImltYWdlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6MTQ6ImF3c19hY2Nlc3Nfa2V5IjtzOjA6IiI7czoxNDoiYXdzX3NlY3JldF9rZXkiO3M6MDoiIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjk6ImRpcmVjdGlvbiI7czozOiJsdHIiO3M6NzoidG9vbGJhciI7czozOiJ5ZXMiO3M6Njoic291cmNlIjtzOjM6InllcyI7czo1OiJmb2N1cyI7czoyOiJubyI7czoxMDoiYXV0b3Jlc2l6ZSI7czozOiJ5ZXMiO3M6NToiZml4ZWQiO3M6Mjoibm8iO3M6MTI6ImNvbnZlcnRsaW5rcyI7czozOiJ5ZXMiO3M6MTE6ImNvbnZlcnRkaXZzIjtzOjM6InllcyI7czo3OiJvdmVybGF5IjtzOjM6InllcyI7czoxMzoib2JzZXJ2ZWltYWdlcyI7czozOiJ5ZXMiO3M6OToic2hvcnRjdXRzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjI6Im5vIjtzOjg6InByb3RvY29sIjtzOjM6InllcyI7czoxODoiYWxsb3dlZHRhZ3Nfb3B0aW9uIjtzOjc6ImRlZmF1bHQiO3M6MTE6ImFsbG93ZWR0YWdzIjthOjA6e31zOjE0OiJmb3JtYXR0aW5ndGFncyI7YTo3OntpOjA7czoxOiJwIjtpOjE7czoxMDoiYmxvY2txdW90ZSI7aToyO3M6MzoicHJlIjtpOjM7czoyOiJoMSI7aTo0O3M6MjoiaDIiO2k6NTtzOjI6ImgzIjtpOjY7czoyOiJoNCI7fXM6ODoibGFuZ3VhZ2UiO3M6MjoiZW4iO3M6ODoiY3NzX2ZpbGUiO3M6MDoiIjtzOjExOiJlZGl0b3JfY29uZiI7czoxOiIzIjt9czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(18, 1, 7, 'videos', 'Videos', '', 'channel_videos', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 5, 'any', 'YTo4OntzOjExOiJjdl9zZXJ2aWNlcyI7YToyOntpOjA7czo3OiJ5b3V0dWJlIjtpOjE7czo1OiJ2aW1lbyI7fXM6OToiY3ZfbGF5b3V0IjtzOjU6InRhYmxlIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(19, 1, 7, 'stories_header_headline', 'Header Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(20, 1, 7, 'stories_header_content', 'Header Content', '', 'editor', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 3, 'any', 'YTo3OntzOjY6ImVkaXRvciI7YToyODp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjE0OiJ1cGxvYWRfc2VydmljZSI7czo1OiJsb2NhbCI7czoyMDoiZmlsZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoyMToiaW1hZ2VfdXBsb2FkX2xvY2F0aW9uIjtzOjE6IjAiO3M6MTQ6ImltYWdlX2Jyb3dzaW5nIjtzOjM6InllcyI7czoxMjoiaW1hZ2Vfc3ViZGlyIjtzOjM6InllcyI7czoyOiJzMyI7YTo0OntzOjQ6ImZpbGUiO2E6MTp7czo2OiJidWNrZXQiO3M6MDoiIjt9czo1OiJpbWFnZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjE0OiJhd3NfYWNjZXNzX2tleSI7czowOiIiO3M6MTQ6ImF3c19zZWNyZXRfa2V5IjtzOjA6IiI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czo5OiJkaXJlY3Rpb24iO3M6MzoibHRyIjtzOjc6InRvb2xiYXIiO3M6MzoieWVzIjtzOjY6InNvdXJjZSI7czozOiJ5ZXMiO3M6NToiZm9jdXMiO3M6Mjoibm8iO3M6MTA6ImF1dG9yZXNpemUiO3M6MzoieWVzIjtzOjU6ImZpeGVkIjtzOjI6Im5vIjtzOjEyOiJjb252ZXJ0bGlua3MiO3M6MzoieWVzIjtzOjExOiJjb252ZXJ0ZGl2cyI7czozOiJ5ZXMiO3M6Nzoib3ZlcmxheSI7czozOiJ5ZXMiO3M6MTM6Im9ic2VydmVpbWFnZXMiO3M6MzoieWVzIjtzOjk6InNob3J0Y3V0cyI7czozOiJ5ZXMiO3M6MzoiYWlyIjtzOjI6Im5vIjtzOjM6Ind5bSI7czoyOiJubyI7czo4OiJwcm90b2NvbCI7czozOiJ5ZXMiO3M6MTg6ImFsbG93ZWR0YWdzX29wdGlvbiI7czo3OiJkZWZhdWx0IjtzOjExOiJhbGxvd2VkdGFncyI7YTowOnt9czoxNDoiZm9ybWF0dGluZ3RhZ3MiO2E6Nzp7aTowO3M6MToicCI7aToxO3M6MTA6ImJsb2NrcXVvdGUiO2k6MjtzOjM6InByZSI7aTozO3M6MjoiaDEiO2k6NDtzOjI6ImgyIjtpOjU7czoyOiJoMyI7aTo2O3M6MjoiaDQiO31zOjg6Imxhbmd1YWdlIjtzOjI6ImVuIjtzOjg6ImNzc19maWxlIjtzOjA6IiI7czoxMToiZWRpdG9yX2NvbmYiO3M6MToiMyI7fXM6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(21, 1, 7, 'stories_header_image', 'Header Image', '', 'file', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(22, 1, 4, 'projects_header_image', 'Header Image', '', 'file', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(23, 1, 4, 'projects_header_headline', 'Header Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(24, 1, 4, 'projects_header_content', 'Header Content', '', 'editor', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 3, 'any', 'YTo3OntzOjY6ImVkaXRvciI7YToyOTp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjc6ImJ1dHRvbnMiO2E6MzA6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjE6InwiO2k6MjtzOjEwOiJmb3JtYXR0aW5nIjtpOjM7czoxOiJ8IjtpOjQ7czo0OiJib2xkIjtpOjU7czo2OiJpdGFsaWMiO2k6NjtzOjc6ImRlbGV0ZWQiO2k6NztzOjE6InwiO2k6ODtzOjEzOiJ1bm9yZGVyZWRsaXN0IjtpOjk7czoxMToib3JkZXJlZGxpc3QiO2k6MTA7czo3OiJvdXRkZW50IjtpOjExO3M6NjoiaW5kZW50IjtpOjEyO3M6MToifCI7aToxMztzOjQ6ImxpbmsiO2k6MTQ7czo1OiJpbWFnZSI7aToxNTtzOjU6InZpZGVvIjtpOjE2O3M6NDoiZmlsZSI7aToxNztzOjU6InRhYmxlIjtpOjE4O3M6MToifCI7aToxOTtzOjk6ImZvbnRjb2xvciI7aToyMDtzOjk6ImJhY2tjb2xvciI7aToyMTtzOjE6InwiO2k6MjI7czo5OiJhbGlnbmxlZnQiO2k6MjM7czoxMToiYWxpZ25jZW50ZXIiO2k6MjQ7czoxMDoiYWxpZ25yaWdodCI7aToyNTtzOjc6Imp1c3RpZnkiO2k6MjY7czoxOiJ8IjtpOjI3O3M6MTQ6Imhvcml6b250YWxydWxlIjtpOjI4O3M6MTE6InBhc3RlX3BsYWluIjtpOjI5O3M6MToifCI7fXM6MTQ6InVwbG9hZF9zZXJ2aWNlIjtzOjU6ImxvY2FsIjtzOjIwOiJmaWxlX3VwbG9hZF9sb2NhdGlvbiI7czoxOiIwIjtzOjIxOiJpbWFnZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoxNDoiaW1hZ2VfYnJvd3NpbmciO3M6MzoieWVzIjtzOjEyOiJpbWFnZV9zdWJkaXIiO3M6MzoieWVzIjtzOjI6InMzIjthOjQ6e3M6NDoiZmlsZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjU6ImltYWdlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6MTQ6ImF3c19hY2Nlc3Nfa2V5IjtzOjA6IiI7czoxNDoiYXdzX3NlY3JldF9rZXkiO3M6MDoiIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjk6ImRpcmVjdGlvbiI7czozOiJsdHIiO3M6NzoidG9vbGJhciI7czozOiJ5ZXMiO3M6Njoic291cmNlIjtzOjM6InllcyI7czo1OiJmb2N1cyI7czoyOiJubyI7czoxMDoiYXV0b3Jlc2l6ZSI7czozOiJ5ZXMiO3M6NToiZml4ZWQiO3M6Mjoibm8iO3M6MTI6ImNvbnZlcnRsaW5rcyI7czozOiJ5ZXMiO3M6MTE6ImNvbnZlcnRkaXZzIjtzOjM6InllcyI7czo3OiJvdmVybGF5IjtzOjM6InllcyI7czoxMzoib2JzZXJ2ZWltYWdlcyI7czozOiJ5ZXMiO3M6OToic2hvcnRjdXRzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjI6Im5vIjtzOjg6InByb3RvY29sIjtzOjM6InllcyI7czoxODoiYWxsb3dlZHRhZ3Nfb3B0aW9uIjtzOjc6ImRlZmF1bHQiO3M6MTE6ImFsbG93ZWR0YWdzIjthOjA6e31zOjE0OiJmb3JtYXR0aW5ndGFncyI7YTo3OntpOjA7czoxOiJwIjtpOjE7czoxMDoiYmxvY2txdW90ZSI7aToyO3M6MzoicHJlIjtpOjM7czoyOiJoMSI7aTo0O3M6MjoiaDIiO2k6NTtzOjI6ImgzIjtpOjY7czoyOiJoNCI7fXM6ODoibGFuZ3VhZ2UiO3M6MjoiZW4iO3M6ODoiY3NzX2ZpbGUiO3M6MDoiIjtzOjExOiJlZGl0b3JfY29uZiI7czoxOiIzIjt9czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(25, 1, 4, 'projects_content', 'Content', '', 'matrix', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 5, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6Njp7aTowO3M6MjoiMTIiO2k6MTtzOjE6IjkiO2k6MjtzOjI6IjEwIjtpOjM7czoyOiIxMSI7aTo0O3M6MjoiMTQiO2k6NTtpOjE1O319'),
(26, 1, 4, 'projects_body_headline', 'Body Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(45, 1, 1, 'hp_projects_banner', 'Projects Banner', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 16, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(28, 1, 1, 'hp_header_headline', 'Header Headline', '', 'textarea', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'br', 'n', 2, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(29, 1, 1, 'hp_header_content', 'Header Content', '', 'channel_videos', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 3, 'any', 'YTo4OntzOjExOiJjdl9zZXJ2aWNlcyI7YToyOntpOjA7czo3OiJ5b3V0dWJlIjtpOjE7czo1OiJ2aW1lbyI7fXM6OToiY3ZfbGF5b3V0IjtzOjU6InRhYmxlIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(30, 1, 1, 'hp_vision_banner', 'Vision Banner', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(31, 1, 1, 'hp_vision_headline', 'Vision Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 5, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(32, 1, 1, 'hp_vision_content', 'Vision Content', '', 'textarea', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 6, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(43, 1, 1, 'hp_partners_button', 'Partners Button Text', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 14, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(44, 1, 1, 'hp_partners_button_link', 'Partners Button Link', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 15, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(33, 1, 1, 'hp_process_banner', 'Process Banner', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 8, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(34, 1, 1, 'hp_process_headline', 'Process Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 9, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(35, 1, 1, 'hp_process_content', 'Process Content', '', 'matrix', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 10, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjMiO3M6ODoibWF4X3Jvd3MiO3M6MToiMyI7czo3OiJjb2xfaWRzIjthOjM6e2k6MDtzOjI6IjE2IjtpOjE7czoyOiIyMyI7aToyO3M6MjoiMTciO319'),
(37, 1, 1, 'hp_partners_banner', 'Partners Banner', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 12, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(38, 1, 1, 'hp_partners_headline', 'Partners Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 11, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(39, 1, 1, 'hp_partners_content', 'Partners Content', '', 'matrix', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 13, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjYiO3M6ODoibWF4X3Jvd3MiO3M6MToiNiI7czo3OiJjb2xfaWRzIjthOjI6e2k6MDtzOjI6IjE4IjtpOjE7czoyOiIxOSI7fX0='),
(40, 1, 1, 'hp_action_banner', 'Call to Action Banner', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 18, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(36, 1, 1, 'hp_vision_link', 'Vision Link', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 7, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(41, 1, 1, 'hp_action_headline', 'Call to Action Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 19, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(42, 1, 1, 'hp_action_content', 'Call to Action Content', '', 'matrix', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 20, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjMiO3M6ODoibWF4X3Jvd3MiO3M6MToiMyI7czo3OiJjb2xfaWRzIjthOjM6e2k6MDtzOjI6IjIwIjtpOjE7czoyOiIyMSI7aToyO3M6MjoiMjIiO319'),
(46, 1, 1, 'hp_projects_content', 'Projects Content', '', 'matrix', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 17, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6Mzp7aTowO3M6MjoiMjQiO2k6MTtzOjI6IjI1IjtpOjI7czoyOiIyNiI7fX0=');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_titles`
--

CREATE TABLE IF NOT EXISTS `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `exp_channel_titles`
--

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(1, 1, 1, 1, NULL, '127.0.0.1', 'Homepage', 'homepage', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1375826640, '2013', '08', '06', 0, 0, 20130822231159, 0, 0),
(4, 1, 3, 1, NULL, '127.0.0.1', 'Projects', 'projects', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376510580, '2013', '08', '14', 0, 0, 20130822235332, 0, 0),
(3, 1, 2, 1, NULL, '127.0.0.1', 'Give', 'give', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1376502180, '2013', '08', '14', 0, 0, 20130815190941, 0, 0),
(6, 1, 2, 1, NULL, '127.0.0.1', 'About Us', 'about-us', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1376593320, '2013', '08', '15', 0, 0, 20130815190306, 0, 0),
(5, 1, 3, 1, NULL, '127.0.0.1', 'Get Involved', 'get-involved', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1376522460, '2013', '08', '14', 0, 0, 20130816190312, 0, 0),
(7, 1, 2, 1, NULL, '127.0.0.1', 'Success Stories', 'success-stories', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1376593380, '2013', '08', '15', 0, 0, 20130815190326, 0, 0),
(8, 1, 2, 1, NULL, '127.0.0.1', 'About Us', 'about-us1', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1376597280, '2013', '08', '15', 0, 0, 20130815200844, 0, 0),
(9, 1, 2, 1, NULL, '127.0.0.1', 'Team', 'team', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1376597280, '2013', '08', '15', 0, 0, 20130815200856, 0, 0),
(10, 1, 2, 1, NULL, '127.0.0.1', 'Alumni', 'alumni', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1376597340, '2013', '08', '15', 0, 0, 20130815200906, 0, 0),
(11, 1, 2, 1, NULL, '127.0.0.1', 'Partners & Organizations', 'partners-organizations', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1376597340, '2013', '08', '15', 0, 0, 20130815200924, 0, 0),
(12, 1, 2, 1, NULL, '127.0.0.1', 'Resources & Links', 'resources-links', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1376597340, '2013', '08', '15', 0, 0, 20130815200936, 0, 0),
(13, 1, 4, 1, NULL, '127.0.0.1', 'Get Involved', 'get-involved', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376679780, '2013', '08', '16', 0, 0, 20130816203414, 0, 0),
(14, 1, 2, 1, NULL, '127.0.0.1', 'Give', 'give1', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376681040, '2013', '08', '16', 0, 0, 20130816193345, 0, 0),
(15, 1, 5, 1, NULL, '127.0.0.1', 'About Us', 'about-us', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376681880, '2013', '08', '16', 0, 0, 20130819174120, 0, 0),
(16, 1, 5, 1, NULL, '127.0.0.1', 'About Us', 'about-us1', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376682120, '2013', '08', '16', 0, 0, 20130819173827, 0, 0),
(17, 1, 5, 1, NULL, '127.0.0.1', 'Partners & Organizations', 'partners-organizations', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376682900, '2013', '08', '16', 0, 0, 20130819172948, 0, 0),
(18, 1, 5, 1, NULL, '127.0.0.1', 'Team', 'team', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376931780, '2013', '08', '19', 0, 0, 20130819172443, 0, 0),
(19, 1, 5, 1, NULL, '127.0.0.1', 'Alumni', 'alumni', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376931840, '2013', '08', '19', 0, 0, 20130819172452, 0, 0),
(20, 1, 5, 1, NULL, '127.0.0.1', 'Resources & Links', 'resources-links', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376931840, '2013', '08', '19', 0, 0, 20130819170507, 0, 0),
(21, 1, 6, 1, NULL, '127.0.0.1', 'Success Stories', 'success-stories', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376935440, '2013', '08', '19', 0, 0, 20130819211425, 0, 0),
(22, 1, 3, 1, NULL, '127.0.0.1', 'Ontario', 'ontario', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1377030480, '2013', '08', '20', 0, 0, 20130820202835, 0, 0),
(23, 1, 3, 1, NULL, '127.0.0.1', 'Loma Linda', 'loma-linda', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1377030480, '2013', '08', '20', 0, 0, 20130820202913, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_videos`
--

CREATE TABLE IF NOT EXISTS `exp_channel_videos` (
  `video_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` tinyint(3) unsigned DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(10) unsigned DEFAULT '0',
  `field_id` mediumint(8) unsigned DEFAULT '1',
  `service` varchar(250) DEFAULT '',
  `service_video_id` varchar(250) DEFAULT '',
  `hash_id` varchar(250) DEFAULT '',
  `video_title` varchar(250) DEFAULT '',
  `video_desc` varchar(250) DEFAULT '',
  `video_username` varchar(250) DEFAULT '',
  `video_author` varchar(250) DEFAULT '',
  `video_author_id` int(10) unsigned DEFAULT '0',
  `video_date` varchar(250) DEFAULT '',
  `video_views` varchar(250) DEFAULT '',
  `video_duration` varchar(250) DEFAULT '',
  `video_url` varchar(250) DEFAULT '',
  `video_img_url` varchar(250) DEFAULT '',
  `video_order` smallint(5) unsigned DEFAULT '1',
  `video_cover` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`video_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `exp_channel_videos`
--

INSERT INTO `exp_channel_videos` (`video_id`, `site_id`, `entry_id`, `channel_id`, `field_id`, `service`, `service_video_id`, `hash_id`, `video_title`, `video_desc`, `video_username`, `video_author`, `video_author_id`, `video_date`, `video_views`, `video_duration`, `video_url`, `video_img_url`, `video_order`, `video_cover`) VALUES
(1, 1, 21, 6, 18, 'vimeo', '70771434', '', 'Ecuador e Islas Galápagos', 'Trip to Ecuador and Galápagos Islands, made with Canon T2i for video  and G10 for Timelapses.', 'fabianosilva', 'Fabiano Silva', 8613746, '1374476834', '179', '269', 'http://player.vimeo.com/video/70771434?title=0&byline=0&portrait=0', 'https://secure-b.vimeocdn.com/ts/445/924/445924825_100.jpg', 1, 0),
(3, 1, 21, 6, 18, 'vimeo', '71908739', '', 'Paddling Out', 'Kayaking Colorado rivers and creeks in May of 2013.', 'user15631437', 'SkiniKid Productions', 15631437, '1375883069', '75', '234', 'http://player.vimeo.com/video/71908739?title=0&byline=0&portrait=0', 'https://secure-b.vimeocdn.com/ts/445/626/445626716_100.jpg', 2, 0),
(4, 1, 21, 6, 18, 'vimeo', '7030292', '', 'one minute', 'Erica, Xander and I went to Onsted on Saturday, and before heading out to go buy pumpkins, we went to the park with my Mom and baby brother, Dylan to hike around "the trail" and record a one minute video for this weekend''s Vimeo project :) \n\nI guess ', 'mikeambs', 'mike ambs', 229397, '1255362096', '2305', '61', 'http://player.vimeo.com/video/7030292?title=0&byline=0&portrait=0', 'https://secure-b.vimeocdn.com/ts/288/779/28877983_100.jpg', 3, 0),
(5, 1, 21, 6, 18, 'vimeo', '32493954', '', 'Salmon Fishing in a Minute', 'See if I hook up fishing for King Salmon in a Minute.\n\nThe rules:\n-Video must be exactly one minute long\n-No camera movement (no panning, tilting, etc)\n-No editing whatsoever\n-Use original sound\n-Tag with ''1 minute''', 'user1547388', 'Clearwater-Media', 1547388, '1321922077', '746', '60', 'http://player.vimeo.com/video/32493954?title=0&byline=0&portrait=0', 'https://secure-b.vimeocdn.com/ts/219/865/219865977_100.jpg', 4, 0),
(6, 1, 1, 1, 29, 'vimeo', '35396305', '', 'Yosemite HD', 'This video is a collaboration between Sheldon Neill and Colin Delehanty. All timelapses were shot on the Canon 5D Mark II with a variety of Canon L and Zeiss CP.2 Lenses.\n\nProject Yosemite Website: http://projectyose.com\nFacebook Page: http://faceboo', 'projectyose', 'Project Yosemite', 9807817, '1327076331', '3579907', '237', 'http://player.vimeo.com/video/35396305?title=0&byline=0&portrait=0', 'https://secure-b.vimeocdn.com/ts/254/218/254218511_100.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_comments`
--

CREATE TABLE IF NOT EXISTS `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `url` varchar(75) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`),
  KEY `comment_date_idx` (`comment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_comment_subscriptions`
--

CREATE TABLE IF NOT EXISTS `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `subscription_date` varchar(10) DEFAULT NULL,
  `notification_sent` char(1) DEFAULT 'n',
  `hash` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_log`
--

CREATE TABLE IF NOT EXISTS `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'admin', '127.0.0.1', 1375811384, 'Logged in'),
(2, 1, 1, 'admin', '127.0.0.1', 1375816617, 'Logged in'),
(3, 1, 1, 'admin', '127.0.0.1', 1375823043, 'Logged in'),
(4, 1, 1, 'admin', '127.0.0.1', 1375826541, 'Channel Created:&nbsp;&nbsp;Homepage'),
(5, 1, 1, 'admin', '127.0.0.1', 1375826634, 'Field Group Created:&nbsp;Homepage'),
(6, 1, 1, 'admin', '127.0.0.1', 1375826650, 'Field Group Created:&nbsp;Pages'),
(7, 1, 1, 'admin', '127.0.0.1', 1375826854, 'Logged out'),
(8, 1, 1, 'admin', '127.0.0.1', 1375826873, 'Logged in'),
(9, 1, 1, 'admin', '127.0.0.1', 1375826898, 'Screen name was changed to:&nbsp;&nbsp;Long Dao\nUsername was changed to:&nbsp;&nbsp;longdao'),
(10, 1, 1, 'longdao', '127.0.0.1', 1375834664, 'Logged out'),
(11, 1, 1, 'longdao', '127.0.0.1', 1376412650, 'Logged in'),
(12, 1, 1, 'longdao', '127.0.0.1', 1376434683, 'Logged in'),
(13, 1, 1, 'longdao', '127.0.0.1', 1376501213, 'Logged in'),
(14, 1, 1, 'longdao', '127.0.0.1', 1376501386, 'Channel Created:&nbsp;&nbsp;Give'),
(15, 1, 1, 'longdao', '127.0.0.1', 1376509114, 'Logged out'),
(16, 1, 1, 'longdao', '127.0.0.1', 1376510561, 'Logged in'),
(17, 1, 1, 'longdao', '127.0.0.1', 1376510593, 'Channel Created:&nbsp;&nbsp;Projects'),
(18, 1, 1, 'longdao', '127.0.0.1', 1376522482, 'Logged in'),
(19, 1, 1, 'longdao', '127.0.0.1', 1376593342, 'Logged in'),
(20, 1, 1, 'longdao', '127.0.0.1', 1376608951, 'Field Group Created:&nbsp;get-involved'),
(21, 1, 1, 'longdao', '127.0.0.1', 1376608961, 'Field Group Created:&nbsp;projects'),
(22, 1, 1, 'longdao', '127.0.0.1', 1376608971, 'Field Group Created:&nbsp;give'),
(23, 1, 1, 'longdao', '127.0.0.1', 1376608979, 'Field Group Created:&nbsp;about-us'),
(24, 1, 1, 'longdao', '127.0.0.1', 1376679094, 'Logged in'),
(25, 1, 1, 'longdao', '127.0.0.1', 1376679240, 'Field group Deleted:&nbsp;&nbsp;Pages'),
(26, 1, 1, 'longdao', '127.0.0.1', 1376679709, 'Channel Created:&nbsp;&nbsp;Get Involved'),
(27, 1, 1, 'longdao', '127.0.0.1', 1376679765, 'Channel Created:&nbsp;&nbsp;About'),
(28, 1, 1, 'longdao', '127.0.0.1', 1376931796, 'Logged in'),
(29, 1, 1, 'longdao', '127.0.0.1', 1376935380, 'Field Group Created:&nbsp;stories'),
(30, 1, 1, 'longdao', '127.0.0.1', 1376935425, 'Channel Created:&nbsp;&nbsp;Stories'),
(31, 1, 1, 'longdao', '127.0.0.1', 1376946449, 'Logged in'),
(32, 1, 1, 'longdao', '127.0.0.1', 1377029404, 'Logged in'),
(33, 1, 1, 'longdao', '127.0.0.1', 1377041123, 'Logged in'),
(34, 1, 1, 'longdao', '127.0.0.1', 1377107336, 'Logged in'),
(35, 1, 1, 'longdao', '127.0.0.1', 1377114483, 'Logged out'),
(36, 1, 1, 'longdao', '127.0.0.1', 1377118446, 'Logged in'),
(37, 1, 1, 'longdao', '127.0.0.1', 1377121921, 'Custom Field Deleted:&nbsp;Video'),
(38, 1, 1, 'longdao', '127.0.0.1', 1377128176, 'Logged in'),
(39, 1, 1, 'longdao', '127.0.0.1', 1377198650, 'Logged in'),
(40, 1, 1, 'longdao', '127.0.0.1', 1377207362, 'Logged in'),
(41, 1, 1, 'longdao', '127.0.0.1', 1377209094, 'Logged out'),
(42, 1, 1, 'longdao', '127.0.0.1', 1377209131, 'Logged in'),
(43, 1, 1, 'longdao', '127.0.0.1', 1377212981, 'Logged in');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_search_index`
--

CREATE TABLE IF NOT EXISTS `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_developer_log`
--

CREATE TABLE IF NOT EXISTS `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) DEFAULT NULL,
  `template_group` varchar(100) DEFAULT NULL,
  `addon_module` varchar(100) DEFAULT NULL,
  `addon_method` varchar(100) DEFAULT NULL,
  `snippets` text,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_developer_log`
--

INSERT INTO `exp_developer_log` (`log_id`, `timestamp`, `viewed`, `description`, `function`, `line`, `file`, `deprecated_since`, `use_instead`, `template_id`, `template_name`, `template_group`, `addon_module`, `addon_method`, `snippets`) VALUES
(1, 1376412718, 'n', NULL, 'generate_json()', 684, 'I:\\git\\PBH\\system\\expressionengine\\third_party\\nsm_htaccess_generator\\ext.nsm_htaccess_generator.php', '2.6', 'the native JSON extension (json_encode())', 0, NULL, NULL, NULL, NULL, NULL),
(2, 1376412718, 'n', NULL, 'generate_json()', 797, 'I:\\git\\PBH\\system\\codeigniter\\system\\libraries\\Javascript.php', '2.6', 'the native JSON extension (json_encode())', 0, NULL, NULL, NULL, NULL, NULL),
(3, 1376412723, 'n', NULL, 'generate_json()', 421, 'I:\\git\\PBH\\system\\expressionengine\\third_party\\nsm_htaccess_generator\\ext.nsm_htaccess_generator.php', '2.6', 'the native JSON extension (json_encode())', 0, NULL, NULL, NULL, NULL, NULL),
(4, 1377030014, 'n', NULL, 'do_hash()', 224, 'I:\\git\\PBH\\system\\expressionengine\\third_party\\nsm_htaccess_generator\\ext.nsm_htaccess_generator.php', '2.6', 'PHP''s hashing functions', 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_editor_buttons`
--

CREATE TABLE IF NOT EXISTS `exp_editor_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` smallint(5) unsigned DEFAULT '1',
  `config_id` int(10) unsigned DEFAULT '1',
  `lowvar_id` int(10) unsigned DEFAULT '1',
  `matrixcol_id` int(10) unsigned DEFAULT '1',
  `button_class` varchar(250) DEFAULT '',
  `button_settings` text,
  PRIMARY KEY (`id`),
  KEY `button_class` (`button_class`),
  KEY `config_id` (`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_editor_configs`
--

CREATE TABLE IF NOT EXISTS `exp_editor_configs` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` smallint(5) unsigned DEFAULT '1',
  `config_label` varchar(250) DEFAULT '',
  `config_settings` text,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exp_editor_configs`
--

INSERT INTO `exp_editor_configs` (`config_id`, `site_id`, `config_label`, `config_settings`) VALUES
(1, 1, 'Minimum', 'YToyMDp7czo3OiJidXR0b25zIjthOjc6e2k6MDtzOjEwOiJmb3JtYXR0aW5nIjtpOjE7czoxOiJ8IjtpOjI7czo0OiJib2xkIjtpOjM7czo2OiJpdGFsaWMiO2k6NDtzOjE6InwiO2k6NTtzOjQ6ImxpbmsiO2k6NjtzOjE6InwiO31zOjE0OiJ1cGxvYWRfc2VydmljZSI7czo1OiJsb2NhbCI7czoyMDoiZmlsZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoyMToiaW1hZ2VfdXBsb2FkX2xvY2F0aW9uIjtzOjE6IjAiO3M6MjoiczMiO2E6NDp7czo0OiJmaWxlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6NToiaW1hZ2UiO2E6MTp7czo2OiJidWNrZXQiO3M6MDoiIjt9czoxNDoiYXdzX2FjY2Vzc19rZXkiO3M6MDoiIjtzOjE0OiJhd3Nfc2VjcmV0X2tleSI7czowOiIiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6OToiZGlyZWN0aW9uIjtzOjM6Imx0ciI7czo3OiJ0b29sYmFyIjtzOjM6InllcyI7czo2OiJzb3VyY2UiO3M6MzoieWVzIjtzOjU6ImZvY3VzIjtzOjI6Im5vIjtzOjEwOiJhdXRvcmVzaXplIjtzOjM6InllcyI7czo1OiJmaXhlZCI7czoyOiJubyI7czoxMjoiY29udmVydGxpbmtzIjtzOjM6InllcyI7czoxMToiY29udmVydGRpdnMiO3M6MzoieWVzIjtzOjc6Im92ZXJsYXkiO3M6MzoieWVzIjtzOjEzOiJvYnNlcnZlaW1hZ2VzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjI6Im5vIjtzOjE4OiJhbGxvd2VkdGFnc19vcHRpb24iO3M6NzoiZGVmYXVsdCI7czoxMToiYWxsb3dlZHRhZ3MiO2E6MDp7fX0='),
(2, 1, 'Standard', 'YToyMDp7czo3OiJidXR0b25zIjthOjEzOntpOjA7czo0OiJodG1sIjtpOjE7czoxOiJ8IjtpOjI7czoxMDoiZm9ybWF0dGluZyI7aTozO3M6MToifCI7aTo0O3M6NDoiYm9sZCI7aTo1O3M6NjoiaXRhbGljIjtpOjY7czo3OiJkZWxldGVkIjtpOjc7czoxOiJ8IjtpOjg7czo0OiJsaW5rIjtpOjk7czo0OiJmaWxlIjtpOjEwO3M6NToiaW1hZ2UiO2k6MTE7czo1OiJ2aWRlbyI7aToxMjtzOjE6InwiO31zOjE0OiJ1cGxvYWRfc2VydmljZSI7czo1OiJsb2NhbCI7czoyMDoiZmlsZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoyMToiaW1hZ2VfdXBsb2FkX2xvY2F0aW9uIjtzOjE6IjAiO3M6MjoiczMiO2E6NDp7czo0OiJmaWxlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6NToiaW1hZ2UiO2E6MTp7czo2OiJidWNrZXQiO3M6MDoiIjt9czoxNDoiYXdzX2FjY2Vzc19rZXkiO3M6MDoiIjtzOjE0OiJhd3Nfc2VjcmV0X2tleSI7czowOiIiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6OToiZGlyZWN0aW9uIjtzOjM6Imx0ciI7czo3OiJ0b29sYmFyIjtzOjM6InllcyI7czo2OiJzb3VyY2UiO3M6MzoieWVzIjtzOjU6ImZvY3VzIjtzOjI6Im5vIjtzOjEwOiJhdXRvcmVzaXplIjtzOjM6InllcyI7czo1OiJmaXhlZCI7czoyOiJubyI7czoxMjoiY29udmVydGxpbmtzIjtzOjM6InllcyI7czoxMToiY29udmVydGRpdnMiO3M6MzoieWVzIjtzOjc6Im92ZXJsYXkiO3M6MzoieWVzIjtzOjEzOiJvYnNlcnZlaW1hZ2VzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjI6Im5vIjtzOjE4OiJhbGxvd2VkdGFnc19vcHRpb24iO3M6NzoiZGVmYXVsdCI7czoxMToiYWxsb3dlZHRhZ3MiO2E6MDp7fX0='),
(3, 1, 'Full', 'YToyNDp7czo3OiJidXR0b25zIjthOjMwOntpOjA7czo0OiJodG1sIjtpOjE7czoxOiJ8IjtpOjI7czoxMDoiZm9ybWF0dGluZyI7aTozO3M6MToifCI7aTo0O3M6NDoiYm9sZCI7aTo1O3M6NjoiaXRhbGljIjtpOjY7czo3OiJkZWxldGVkIjtpOjc7czoxOiJ8IjtpOjg7czoxMzoidW5vcmRlcmVkbGlzdCI7aTo5O3M6MTE6Im9yZGVyZWRsaXN0IjtpOjEwO3M6Nzoib3V0ZGVudCI7aToxMTtzOjY6ImluZGVudCI7aToxMjtzOjE6InwiO2k6MTM7czo0OiJsaW5rIjtpOjE0O3M6NToiaW1hZ2UiO2k6MTU7czo1OiJ2aWRlbyI7aToxNjtzOjQ6ImZpbGUiO2k6MTc7czo1OiJ0YWJsZSI7aToxODtzOjE6InwiO2k6MTk7czo5OiJmb250Y29sb3IiO2k6MjA7czo5OiJiYWNrY29sb3IiO2k6MjE7czoxOiJ8IjtpOjIyO3M6OToiYWxpZ25sZWZ0IjtpOjIzO3M6MTE6ImFsaWduY2VudGVyIjtpOjI0O3M6MTA6ImFsaWducmlnaHQiO2k6MjU7czo3OiJqdXN0aWZ5IjtpOjI2O3M6MToifCI7aToyNztzOjE0OiJob3Jpem9udGFscnVsZSI7aToyODtzOjExOiJwYXN0ZV9wbGFpbiI7aToyOTtzOjE6InwiO31zOjE0OiJ1cGxvYWRfc2VydmljZSI7czo1OiJsb2NhbCI7czoyMDoiZmlsZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoyMToiaW1hZ2VfdXBsb2FkX2xvY2F0aW9uIjtzOjE6IjAiO3M6MTQ6ImltYWdlX2Jyb3dzaW5nIjtzOjM6InllcyI7czoyOiJzMyI7YTo0OntzOjQ6ImZpbGUiO2E6MTp7czo2OiJidWNrZXQiO3M6MDoiIjt9czo1OiJpbWFnZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjE0OiJhd3NfYWNjZXNzX2tleSI7czowOiIiO3M6MTQ6ImF3c19zZWNyZXRfa2V5IjtzOjA6IiI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czo5OiJkaXJlY3Rpb24iO3M6MzoibHRyIjtzOjc6InRvb2xiYXIiO3M6MzoieWVzIjtzOjY6InNvdXJjZSI7czozOiJ5ZXMiO3M6NToiZm9jdXMiO3M6Mjoibm8iO3M6MTA6ImF1dG9yZXNpemUiO3M6MzoieWVzIjtzOjU6ImZpeGVkIjtzOjI6Im5vIjtzOjEyOiJjb252ZXJ0bGlua3MiO3M6MzoieWVzIjtzOjExOiJjb252ZXJ0ZGl2cyI7czozOiJ5ZXMiO3M6Nzoib3ZlcmxheSI7czozOiJ5ZXMiO3M6MTM6Im9ic2VydmVpbWFnZXMiO3M6MzoieWVzIjtzOjM6ImFpciI7czoyOiJubyI7czozOiJ3eW0iO3M6Mjoibm8iO3M6MTg6ImFsbG93ZWR0YWdzX29wdGlvbiI7czo3OiJkZWZhdWx0IjtzOjExOiJhbGxvd2VkdGFncyI7YTowOnt9czoxNDoiZm9ybWF0dGluZ3RhZ3MiO2E6Nzp7aTowO3M6MToicCI7aToxO3M6MTA6ImJsb2NrcXVvdGUiO2k6MjtzOjM6InByZSI7aTozO3M6MjoiaDEiO2k6NDtzOjI6ImgyIjtpOjU7czoyOiJoMyI7aTo2O3M6MjoiaDQiO31zOjg6Imxhbmd1YWdlIjtzOjI6ImVuIjtzOjg6ImNzc19maWxlIjtzOjA6IiI7fQ=='),
(4, 1, 'Full (Visual Mode)', 'YToyMzp7czo3OiJidXR0b25zIjthOjMwOntpOjA7czo0OiJodG1sIjtpOjE7czoxOiJ8IjtpOjI7czoxMDoiZm9ybWF0dGluZyI7aTozO3M6MToifCI7aTo0O3M6NDoiYm9sZCI7aTo1O3M6NjoiaXRhbGljIjtpOjY7czo3OiJkZWxldGVkIjtpOjc7czoxOiJ8IjtpOjg7czoxMzoidW5vcmRlcmVkbGlzdCI7aTo5O3M6MTE6Im9yZGVyZWRsaXN0IjtpOjEwO3M6Nzoib3V0ZGVudCI7aToxMTtzOjY6ImluZGVudCI7aToxMjtzOjE6InwiO2k6MTM7czo0OiJsaW5rIjtpOjE0O3M6NToiaW1hZ2UiO2k6MTU7czo1OiJ2aWRlbyI7aToxNjtzOjQ6ImZpbGUiO2k6MTc7czo1OiJ0YWJsZSI7aToxODtzOjE6InwiO2k6MTk7czo5OiJmb250Y29sb3IiO2k6MjA7czo5OiJiYWNrY29sb3IiO2k6MjE7czoxOiJ8IjtpOjIyO3M6OToiYWxpZ25sZWZ0IjtpOjIzO3M6MTE6ImFsaWduY2VudGVyIjtpOjI0O3M6MTA6ImFsaWducmlnaHQiO2k6MjU7czo3OiJqdXN0aWZ5IjtpOjI2O3M6MToifCI7aToyNztzOjE0OiJob3Jpem9udGFscnVsZSI7aToyODtzOjExOiJwYXN0ZV9wbGFpbiI7aToyOTtzOjE6InwiO31zOjE0OiJ1cGxvYWRfc2VydmljZSI7czo1OiJsb2NhbCI7czoyMDoiZmlsZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoyMToiaW1hZ2VfdXBsb2FkX2xvY2F0aW9uIjtzOjE6IjAiO3M6MTQ6ImltYWdlX2Jyb3dzaW5nIjtzOjM6InllcyI7czoyOiJzMyI7YTo0OntzOjQ6ImZpbGUiO2E6MTp7czo2OiJidWNrZXQiO3M6MDoiIjt9czo1OiJpbWFnZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjE0OiJhd3NfYWNjZXNzX2tleSI7czowOiIiO3M6MTQ6ImF3c19zZWNyZXRfa2V5IjtzOjA6IiI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czo5OiJkaXJlY3Rpb24iO3M6MzoibHRyIjtzOjc6InRvb2xiYXIiO3M6MzoieWVzIjtzOjY6InNvdXJjZSI7czozOiJ5ZXMiO3M6NToiZm9jdXMiO3M6Mjoibm8iO3M6MTA6ImF1dG9yZXNpemUiO3M6MzoieWVzIjtzOjU6ImZpeGVkIjtzOjI6Im5vIjtzOjEyOiJjb252ZXJ0bGlua3MiO3M6MzoieWVzIjtzOjExOiJjb252ZXJ0ZGl2cyI7czozOiJ5ZXMiO3M6Nzoib3ZlcmxheSI7czozOiJ5ZXMiO3M6MTM6Im9ic2VydmVpbWFnZXMiO3M6MzoieWVzIjtzOjM6ImFpciI7czoyOiJubyI7czozOiJ3eW0iO3M6MzoieWVzIjtzOjE4OiJhbGxvd2VkdGFnc19vcHRpb24iO3M6NzoiZGVmYXVsdCI7czoxMToiYWxsb3dlZHRhZ3MiO2E6MDp7fXM6MTQ6ImZvcm1hdHRpbmd0YWdzIjthOjc6e2k6MDtzOjE6InAiO2k6MTtzOjEwOiJibG9ja3F1b3RlIjtpOjI7czozOiJwcmUiO2k6MztzOjI6ImgxIjtpOjQ7czoyOiJoMiI7aTo1O3M6MjoiaDMiO2k6NjtzOjI6Img0Ijt9czo4OiJsYW5ndWFnZSI7czoyOiJlbiI7fQ=='),
(5, 1, 'Standard (Visual Mode)', 'YToyMDp7czo3OiJidXR0b25zIjthOjEzOntpOjA7czo0OiJodG1sIjtpOjE7czoxOiJ8IjtpOjI7czoxMDoiZm9ybWF0dGluZyI7aTozO3M6MToifCI7aTo0O3M6NDoiYm9sZCI7aTo1O3M6NjoiaXRhbGljIjtpOjY7czo3OiJkZWxldGVkIjtpOjc7czoxOiJ8IjtpOjg7czo0OiJsaW5rIjtpOjk7czo0OiJmaWxlIjtpOjEwO3M6NToiaW1hZ2UiO2k6MTE7czo1OiJ2aWRlbyI7aToxMjtzOjE6InwiO31zOjE0OiJ1cGxvYWRfc2VydmljZSI7czo1OiJsb2NhbCI7czoyMDoiZmlsZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoyMToiaW1hZ2VfdXBsb2FkX2xvY2F0aW9uIjtzOjE6IjAiO3M6MjoiczMiO2E6NDp7czo0OiJmaWxlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6NToiaW1hZ2UiO2E6MTp7czo2OiJidWNrZXQiO3M6MDoiIjt9czoxNDoiYXdzX2FjY2Vzc19rZXkiO3M6MDoiIjtzOjE0OiJhd3Nfc2VjcmV0X2tleSI7czowOiIiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6OToiZGlyZWN0aW9uIjtzOjM6Imx0ciI7czo3OiJ0b29sYmFyIjtzOjM6InllcyI7czo2OiJzb3VyY2UiO3M6MzoieWVzIjtzOjU6ImZvY3VzIjtzOjI6Im5vIjtzOjEwOiJhdXRvcmVzaXplIjtzOjM6InllcyI7czo1OiJmaXhlZCI7czoyOiJubyI7czoxMjoiY29udmVydGxpbmtzIjtzOjM6InllcyI7czoxMToiY29udmVydGRpdnMiO3M6MzoieWVzIjtzOjc6Im92ZXJsYXkiO3M6MzoieWVzIjtzOjEzOiJvYnNlcnZlaW1hZ2VzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjM6InllcyI7czoxODoiYWxsb3dlZHRhZ3Nfb3B0aW9uIjtzOjc6ImRlZmF1bHQiO3M6MTE6ImFsbG93ZWR0YWdzIjthOjA6e319');

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_mg`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_ml`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_console_cache`
--

CREATE TABLE IF NOT EXISTS `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_ping_status`
--

CREATE TABLE IF NOT EXISTS `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`ping_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_versioning`
--

CREATE TABLE IF NOT EXISTS `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_extensions`
--

CREATE TABLE IF NOT EXISTS `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Safecracker_ext', 'form_declaration_modify_data', 'form_declaration_modify_data', '', 10, '2.1', 'y'),
(2, 'Rte_ext', 'myaccount_nav_setup', 'myaccount_nav_setup', '', 10, '1.0', 'y'),
(3, 'Rte_ext', 'cp_menu_array', 'cp_menu_array', '', 10, '1.0', 'y'),
(4, 'Rte_ext', 'publish_form_entry_data', 'publish_form_entry_data', '', 10, '1.0', 'y'),
(5, 'Structure_ext', 'entry_submission_redirect', 'entry_submission_redirect', '', 10, '3.3.10', 'y'),
(6, 'Structure_ext', 'cp_member_login', 'cp_member_login', '', 10, '3.3.10', 'y'),
(7, 'Structure_ext', 'sessions_start', 'sessions_start', '', 10, '3.3.10', 'y'),
(8, 'Structure_ext', 'channel_module_create_pagination', 'channel_module_create_pagination', '', 9, '3.3.10', 'y'),
(9, 'Structure_ext', 'wygwam_config', 'wygwam_config', '', 10, '3.3.10', 'y'),
(10, 'Structure_ext', 'core_template_route', 'core_template_route', '', 10, '3.3.10', 'y'),
(11, 'Structure_ext', 'entry_submission_end', 'entry_submission_end', '', 10, '3.3.10', 'y'),
(12, 'Structure_ext', 'safecracker_submit_entry_end', 'safecracker_submit_entry_end', '', 10, '3.3.10', 'y'),
(13, 'Structure_ext', 'template_post_parse', 'template_post_parse', '', 10, '3.3.10', 'y'),
(14, 'Snippetssync_ext', 'on_sessions_start', 'sessions_start', '', 10, '1.0.7', 'y'),
(15, 'Editor_ext', 'cp_js_end', 'cp_js_end', 'a:23:{s:15:"editor_settings";s:10:"predefined";s:13:"convert_field";s:4:"none";s:14:"upload_service";s:5:"local";s:20:"file_upload_location";s:1:"0";s:21:"image_upload_location";s:1:"0";s:2:"s3";a:4:{s:4:"file";a:1:{s:6:"bucket";s:0:"";}s:5:"image";a:1:{s:6:"bucket";s:0:"";}s:14:"aws_access_key";s:0:"";s:14:"aws_secret_key";s:0:"";}s:6:"height";s:3:"200";s:9:"direction";s:3:"ltr";s:7:"toolbar";s:3:"yes";s:6:"source";s:3:"yes";s:5:"focus";s:2:"no";s:10:"autoresize";s:3:"yes";s:5:"fixed";s:2:"no";s:12:"convertlinks";s:3:"yes";s:11:"convertdivs";s:3:"yes";s:7:"overlay";s:3:"yes";s:13:"observeimages";s:3:"yes";s:3:"air";s:2:"no";s:3:"wym";s:2:"no";s:18:"allowedtags_option";s:7:"default";s:11:"allowedtags";s:0:"";s:11:"editor_conf";s:1:"1";s:6:"site:1";a:22:{s:15:"editor_settings";s:10:"predefined";s:13:"convert_field";s:4:"none";s:14:"upload_service";s:5:"local";s:20:"file_upload_location";s:1:"0";s:21:"image_upload_location";s:1:"0";s:2:"s3";a:4:{s:4:"file";a:1:{s:6:"bucket";s:0:"";}s:5:"image";a:1:{s:6:"bucket";s:0:"";}s:14:"aws_access_key";s:0:"";s:14:"aws_secret_key";s:0:"";}s:6:"height";s:3:"200";s:9:"direction";s:3:"ltr";s:7:"toolbar";s:3:"yes";s:6:"source";s:3:"yes";s:5:"focus";s:2:"no";s:10:"autoresize";s:3:"yes";s:5:"fixed";s:2:"no";s:12:"convertlinks";s:3:"yes";s:11:"convertdivs";s:3:"yes";s:7:"overlay";s:3:"yes";s:13:"observeimages";s:3:"yes";s:3:"air";s:2:"no";s:3:"wym";s:2:"no";s:18:"allowedtags_option";s:7:"default";s:11:"allowedtags";s:0:"";s:11:"editor_conf";s:1:"2";}}', 100, '3.1.4', 'y'),
(16, 'Editor_ext', 'cp_css_end', 'cp_css_end', 'a:23:{s:15:"editor_settings";s:10:"predefined";s:13:"convert_field";s:4:"none";s:14:"upload_service";s:5:"local";s:20:"file_upload_location";s:1:"0";s:21:"image_upload_location";s:1:"0";s:2:"s3";a:4:{s:4:"file";a:1:{s:6:"bucket";s:0:"";}s:5:"image";a:1:{s:6:"bucket";s:0:"";}s:14:"aws_access_key";s:0:"";s:14:"aws_secret_key";s:0:"";}s:6:"height";s:3:"200";s:9:"direction";s:3:"ltr";s:7:"toolbar";s:3:"yes";s:6:"source";s:3:"yes";s:5:"focus";s:2:"no";s:10:"autoresize";s:3:"yes";s:5:"fixed";s:2:"no";s:12:"convertlinks";s:3:"yes";s:11:"convertdivs";s:3:"yes";s:7:"overlay";s:3:"yes";s:13:"observeimages";s:3:"yes";s:3:"air";s:2:"no";s:3:"wym";s:2:"no";s:18:"allowedtags_option";s:7:"default";s:11:"allowedtags";s:0:"";s:11:"editor_conf";s:1:"1";s:6:"site:1";a:22:{s:15:"editor_settings";s:10:"predefined";s:13:"convert_field";s:4:"none";s:14:"upload_service";s:5:"local";s:20:"file_upload_location";s:1:"0";s:21:"image_upload_location";s:1:"0";s:2:"s3";a:4:{s:4:"file";a:1:{s:6:"bucket";s:0:"";}s:5:"image";a:1:{s:6:"bucket";s:0:"";}s:14:"aws_access_key";s:0:"";s:14:"aws_secret_key";s:0:"";}s:6:"height";s:3:"200";s:9:"direction";s:3:"ltr";s:7:"toolbar";s:3:"yes";s:6:"source";s:3:"yes";s:5:"focus";s:2:"no";s:10:"autoresize";s:3:"yes";s:5:"fixed";s:2:"no";s:12:"convertlinks";s:3:"yes";s:11:"convertdivs";s:3:"yes";s:7:"overlay";s:3:"yes";s:13:"observeimages";s:3:"yes";s:3:"air";s:2:"no";s:3:"wym";s:2:"no";s:18:"allowedtags_option";s:7:"default";s:11:"allowedtags";s:0:"";s:11:"editor_conf";s:1:"2";}}', 100, '3.1.4', 'y'),
(17, 'Low_reorder_ext', 'entry_submission_end', 'entry_submission_end', '', 5, '2.2.1', 'y'),
(18, 'Low_reorder_ext', 'channel_entries_query_result', 'channel_entries_query_result', '', 5, '2.2.1', 'y'),
(19, 'Low_reorder_ext', 'low_search_post_search', 'low_search_post_search', '', 5, '2.2.1', 'y'),
(20, 'Low_reorder_ext', 'playa_parse_relationships', 'playa_parse_relationships', '', 5, '2.2.1', 'y'),
(21, 'Draggable_ext', 'update_order', 'sessions_end', '', 10, '1.3', 'y'),
(22, 'Nsm_htaccess_generator_ext', 'entry_submission_end', 'entry_submission_end', 'a:0:{}', 10, '1.1.5', 'y'),
(23, 'Nsm_htaccess_generator_ext', 'update_template_end', 'update_template_end', 'a:0:{}', 10, '1.1.5', 'y'),
(24, 'Matrix_ext', 'channel_entries_tagdata', 'channel_entries_tagdata', '', 10, '2.5.6', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_fieldtypes`
--

CREATE TABLE IF NOT EXISTS `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0', 'YTowOnt9', 'n'),
(3, 'textarea', '1.0', 'YTowOnt9', 'n'),
(4, 'date', '1.0', 'YTowOnt9', 'n'),
(5, 'file', '1.0', 'YTowOnt9', 'n'),
(6, 'multi_select', '1.0', 'YTowOnt9', 'n'),
(7, 'checkboxes', '1.0', 'YTowOnt9', 'n'),
(8, 'radio', '1.0', 'YTowOnt9', 'n'),
(9, 'relationship', '1.0', 'YTowOnt9', 'n'),
(10, 'rte', '1.0', 'YTowOnt9', 'n'),
(11, 'structure', '3.3.10', 'YToxOntzOjE5OiJzdHJ1Y3R1cmVfbGlzdF90eXBlIjtzOjU6InBhZ2VzIjt9', 'n'),
(12, 'editor', '3.1.4', 'YTowOnt9', 'n'),
(13, 'matrix', '2.5.6', 'YTowOnt9', 'y'),
(14, 'channel_videos', '3.1.3', 'YTowOnt9', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_formatting`
--

CREATE TABLE IF NOT EXISTS `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=139 ;

--
-- Dumping data for table `exp_field_formatting`
--

INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES
(1, 1, 'none'),
(2, 1, 'br'),
(3, 1, 'xhtml'),
(4, 2, 'none'),
(5, 2, 'br'),
(6, 2, 'xhtml'),
(7, 3, 'none'),
(8, 3, 'br'),
(9, 3, 'xhtml'),
(10, 4, 'none'),
(11, 4, 'br'),
(12, 4, 'xhtml'),
(13, 5, 'none'),
(14, 5, 'br'),
(15, 5, 'xhtml'),
(16, 6, 'none'),
(17, 6, 'br'),
(18, 6, 'xhtml'),
(19, 7, 'none'),
(20, 7, 'br'),
(21, 7, 'xhtml'),
(22, 8, 'none'),
(23, 8, 'br'),
(24, 8, 'xhtml'),
(25, 9, 'none'),
(26, 9, 'br'),
(27, 9, 'xhtml'),
(28, 10, 'none'),
(29, 10, 'br'),
(30, 10, 'xhtml'),
(31, 11, 'none'),
(32, 11, 'br'),
(33, 11, 'xhtml'),
(34, 12, 'none'),
(35, 12, 'br'),
(36, 12, 'xhtml'),
(37, 13, 'none'),
(38, 13, 'br'),
(39, 13, 'xhtml'),
(40, 14, 'none'),
(41, 14, 'br'),
(42, 14, 'xhtml'),
(43, 15, 'none'),
(44, 15, 'br'),
(45, 15, 'xhtml'),
(46, 16, 'none'),
(47, 16, 'br'),
(48, 16, 'xhtml'),
(49, 17, 'none'),
(50, 17, 'br'),
(51, 17, 'xhtml'),
(52, 18, 'none'),
(53, 18, 'br'),
(54, 18, 'xhtml'),
(55, 19, 'none'),
(56, 19, 'br'),
(57, 19, 'xhtml'),
(58, 20, 'none'),
(59, 20, 'br'),
(60, 20, 'xhtml'),
(61, 21, 'none'),
(62, 21, 'br'),
(63, 21, 'xhtml'),
(64, 22, 'none'),
(65, 22, 'br'),
(66, 22, 'xhtml'),
(67, 23, 'none'),
(68, 23, 'br'),
(69, 23, 'xhtml'),
(70, 24, 'none'),
(71, 24, 'br'),
(72, 24, 'xhtml'),
(73, 25, 'none'),
(74, 25, 'br'),
(75, 25, 'xhtml'),
(76, 26, 'none'),
(77, 26, 'br'),
(78, 26, 'xhtml'),
(84, 28, 'xhtml'),
(83, 28, 'br'),
(82, 28, 'none'),
(85, 29, 'none'),
(86, 29, 'br'),
(87, 29, 'xhtml'),
(88, 30, 'none'),
(89, 30, 'br'),
(90, 30, 'xhtml'),
(91, 31, 'none'),
(92, 31, 'br'),
(93, 31, 'xhtml'),
(94, 32, 'none'),
(95, 32, 'br'),
(96, 32, 'xhtml'),
(97, 33, 'none'),
(98, 33, 'br'),
(99, 33, 'xhtml'),
(100, 34, 'none'),
(101, 34, 'br'),
(102, 34, 'xhtml'),
(103, 35, 'none'),
(104, 35, 'br'),
(105, 35, 'xhtml'),
(106, 36, 'none'),
(107, 36, 'br'),
(108, 36, 'xhtml'),
(109, 37, 'none'),
(110, 37, 'br'),
(111, 37, 'xhtml'),
(112, 38, 'none'),
(113, 38, 'br'),
(114, 38, 'xhtml'),
(115, 39, 'none'),
(116, 39, 'br'),
(117, 39, 'xhtml'),
(118, 40, 'none'),
(119, 40, 'br'),
(120, 40, 'xhtml'),
(121, 41, 'none'),
(122, 41, 'br'),
(123, 41, 'xhtml'),
(124, 42, 'none'),
(125, 42, 'br'),
(126, 42, 'xhtml'),
(127, 43, 'none'),
(128, 43, 'br'),
(129, 43, 'xhtml'),
(130, 44, 'none'),
(131, 44, 'br'),
(132, 44, 'xhtml'),
(133, 45, 'none'),
(134, 45, 'br'),
(135, 45, 'xhtml'),
(136, 46, 'none'),
(137, 46, 'br'),
(138, 46, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_groups`
--

CREATE TABLE IF NOT EXISTS `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Homepage'),
(7, 1, 'stories'),
(3, 1, 'get-involved'),
(4, 1, 'projects'),
(5, 1, 'give'),
(6, 1, 'about-us');

-- --------------------------------------------------------

--
-- Table structure for table `exp_files`
--

CREATE TABLE IF NOT EXISTS `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `exp_files`
--

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `rel_path`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`) VALUES
(2, 1, 'pbh_home-header.jpg', 1, 'I:/git/PBH/httpdocs/images/uploads/pbh_home-header.jpg', 'image/jpeg', 'pbh_home-header.jpg', 147201, NULL, NULL, NULL, 1, 1375827616, 1, 1375827718, '657 1600'),
(3, 1, '10219_1business_group.jpg', 1, 'I:/git/PBH/httpdocs/images/uploads/10219_1business_group.jpg', 'image/jpeg', '10219_1business_group.jpg', 487967, NULL, NULL, NULL, 1, 1376681123, 1, 1376681123, '1050 1500'),
(4, 1, 'll.png', 1, 'I:/git/PBH/httpdocs/images/uploads/ll.png', 'image/png', 'll.png', 72571, NULL, NULL, NULL, 1, 1377213420, 1, 1377213420, '526 527'),
(5, 1, 'ont1.png', 1, 'I:/git/PBH/httpdocs/images/uploads/ont1.png', 'image/png', 'ont1.png', 50842, NULL, NULL, NULL, 1, 1377213606, 1, 1377213606, '121 156'),
(6, 1, 'sb.jpg', 1, 'I:/git/PBH/httpdocs/images/uploads/sb.jpg', 'image/jpeg', 'sb.jpg', 20879, NULL, NULL, NULL, 1, 1377213771, 1, 1377213771, '182 518'),
(7, 1, 'psdna.png', 1, 'I:/git/PBH/httpdocs/images/uploads/psdna.png', 'image/png', 'psdna.png', 33915, NULL, NULL, NULL, 1, 1377213900, 1, 1377213900, '161 180'),
(8, 1, 'rialto.jpg', 1, 'I:/git/PBH/httpdocs/images/uploads/rialto.jpg', 'image/jpeg', 'rialto.jpg', 14203, NULL, NULL, NULL, 1, 1377214063, 1, 1377214063, '131 578'),
(9, 1, 'fntn.jpg', 1, 'I:/git/PBH/httpdocs/images/uploads/fntn.jpg', 'image/jpeg', 'fntn.jpg', 8858, NULL, NULL, NULL, 1, 1377214175, 1, 1377214175, '106 407'),
(10, 1, 'desrt.jpg', 1, 'I:/git/PBH/httpdocs/images/uploads/desrt.jpg', 'image/jpeg', 'desrt.jpg', 20040, NULL, NULL, NULL, 1, 1377214263, 1, 1377214263, '173 596'),
(11, 1, 'rc.png', 1, 'I:/git/PBH/httpdocs/images/uploads/rc.png', 'image/png', 'rc.png', 149217, NULL, NULL, NULL, 1, 1377214472, 1, 1377214472, '319 323'),
(12, 1, 'rim.jpg', 1, 'I:/git/PBH/httpdocs/images/uploads/rim.jpg', 'image/jpeg', 'rim.jpg', 29962, NULL, NULL, NULL, 1, 1377214570, 1, 1377214570, '251 463'),
(13, 1, 'jurupa.jpg', 1, 'I:/git/PBH/httpdocs/images/uploads/jurupa.jpg', 'image/jpeg', 'jurupa.jpg', 47483, NULL, NULL, NULL, 1, 1377214653, 1, 1377214653, '334 502'),
(14, 1, 'clr.gif', 1, 'I:/git/PBH/httpdocs/images/uploads/clr.gif', 'image/gif', 'clr.gif', 6318, NULL, NULL, NULL, 1, 1377214735, 1, 1377214735, '114 110'),
(15, 1, 'chino.png', 1, 'I:/git/PBH/httpdocs/images/uploads/chino.png', 'image/png', 'chino.png', 52777, NULL, NULL, NULL, 1, 1377215276, 1, 1377215276, '143 363'),
(16, 1, 'pomona.jpg', 1, 'I:/git/PBH/httpdocs/images/uploads/pomona.jpg', 'image/jpeg', 'pomona.jpg', 44780, NULL, NULL, NULL, 1, 1377215291, 1, 1377215291, '334 335');

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_categories`
--

CREATE TABLE IF NOT EXISTS `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_dimensions`
--

CREATE TABLE IF NOT EXISTS `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_watermarks`
--

CREATE TABLE IF NOT EXISTS `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_global_variables`
--

CREATE TABLE IF NOT EXISTS `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_global_variables`
--

INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES
(1, 1, 'www_body_html_end', '</body>\r\n</html>'),
(2, 1, 'www_html_head', '<!DOCTYPE html>\r\n<html lang="en">\r\n  <head>'),
(3, 1, 'www_html_head_end', '\r\n<link href="apple-touch-startup-image-320x460.png" media="(device-width: 320px)" rel="apple-touch-startup-image"> <!-- iPhone SPLASHSCREEN-->\r\n<link href="apple-touch-startup-image-640x920.png" media="(device-width: 320px) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image"> <!-- iPhone (Retina) SPLASHSCREEN-->\r\n<link href="apple-touch-startup-image-640x1096.png" media="(device-width: 320px) and (device-height: 568px) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image"> <!-- iPhone 5 (Retina) SPLASHSCREEN-->\r\n<link href="apple-touch-startup-image-768x1004.png" media="(device-width: 768px) and (orientation: portrait)" rel="apple-touch-startup-image"> <!-- iPad (portrait) SPLASHSCREEN-->\r\n<link href="apple-touch-startup-image-1024x748.png" media="(device-width: 768px) and (orientation: landscape)" rel="apple-touch-startup-image"> <!-- iPad (landscape) SPLASHSCREEN-->\r\n<link href="apple-touch-startup-image-1536x2008.png" media="(device-width: 1536px) and (orientation: portrait) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image"> <!-- iPad (Retina, portrait) SPLASHSCREEN-->\r\n<link href="apple-touch-startup-image-2048x1496.png" media="(device-width: 1536px)  and (orientation: landscape) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image"> <!-- iPad (Retina, landscape) SPLASHSCREEN-->\r\n\r\n</head>'),
(4, 1, 'www_js_head', '<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->\r\n<script src="/assets/js/vendor/custom.modernizr2.js"></script>\r\n<!--[if lt IE 9]>\r\n  <script src="/assets/js/vendor/html5shiv.js"></script>\r\n  <script src="/assets/js/vendor/respond/respond.min.js"></script>\r\n<![endif]-->\r\n<script src="/assets/js/gridloading/modernizr.custom.js"></script>\r\n<script src="/assets/js/slider/jquery-1.8.3.min.js"></script>\r\n<script src="/assets/js/slider/jquery.royalslider.min.js"></script>');

-- --------------------------------------------------------

--
-- Table structure for table `exp_html_buttons`
--

CREATE TABLE IF NOT EXISTS `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'b', '<strong>', '</strong>', 'b', 1, '1', 'btn_b'),
(2, 1, 0, 'i', '<em>', '</em>', 'i', 2, '1', 'btn_i'),
(3, 1, 0, 'blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'btn_blockquote'),
(4, 1, 0, 'a', '<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', '</a>', 'a', 4, '1', 'btn_a'),
(5, 1, 0, 'img', '<img src="[![Link:!:http://]!]" alt="[![Alternative text]!]" />', '', '', 5, '1', 'btn_img');

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish`
--

CREATE TABLE IF NOT EXISTS `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_low_reorder_orders`
--

CREATE TABLE IF NOT EXISTS `exp_low_reorder_orders` (
  `set_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  `sort_order` text,
  PRIMARY KEY (`set_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_low_reorder_sets`
--

CREATE TABLE IF NOT EXISTS `exp_low_reorder_sets` (
  `set_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `set_label` varchar(100) NOT NULL,
  `set_name` varchar(50) NOT NULL,
  `set_notes` text NOT NULL,
  `new_entries` enum('append','prepend') NOT NULL DEFAULT 'append',
  `clear_cache` enum('y','n') NOT NULL DEFAULT 'y',
  `channels` varchar(255) NOT NULL,
  `cat_option` enum('all','some','one','none') NOT NULL DEFAULT 'all',
  `cat_groups` varchar(255) NOT NULL,
  `parameters` text NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`set_id`),
  KEY `site_id` (`site_id`),
  KEY `set_name` (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_matrix_cols`
--

CREATE TABLE IF NOT EXISTS `exp_matrix_cols` (
  `col_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `field_id` int(6) unsigned DEFAULT NULL,
  `var_id` int(6) unsigned DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_instructions` text,
  `col_type` varchar(50) DEFAULT 'text',
  `col_required` char(1) DEFAULT 'n',
  `col_search` char(1) DEFAULT 'n',
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_width` varchar(4) DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `site_id` (`site_id`),
  KEY `field_id` (`field_id`),
  KEY `var_id` (`var_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `exp_matrix_cols`
--

INSERT INTO `exp_matrix_cols` (`col_id`, `site_id`, `field_id`, `var_id`, `col_name`, `col_label`, `col_instructions`, `col_type`, `col_required`, `col_search`, `col_order`, `col_width`, `col_settings`) VALUES
(1, 1, 7, NULL, 'headline', 'Headline', '', 'text', 'n', 'n', 0, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(2, 1, 7, NULL, 'content', 'Content', '', 'editor', 'n', 'n', 1, '60%', 'YToxOntzOjY6ImVkaXRvciI7YToyOTp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjc6ImJ1dHRvbnMiO2E6MzA6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjE6InwiO2k6MjtzOjEwOiJmb3JtYXR0aW5nIjtpOjM7czoxOiJ8IjtpOjQ7czo0OiJib2xkIjtpOjU7czo2OiJpdGFsaWMiO2k6NjtzOjc6ImRlbGV0ZWQiO2k6NztzOjE6InwiO2k6ODtzOjEzOiJ1bm9yZGVyZWRsaXN0IjtpOjk7czoxMToib3JkZXJlZGxpc3QiO2k6MTA7czo3OiJvdXRkZW50IjtpOjExO3M6NjoiaW5kZW50IjtpOjEyO3M6MToifCI7aToxMztzOjQ6ImxpbmsiO2k6MTQ7czo1OiJpbWFnZSI7aToxNTtzOjU6InZpZGVvIjtpOjE2O3M6NDoiZmlsZSI7aToxNztzOjU6InRhYmxlIjtpOjE4O3M6MToifCI7aToxOTtzOjk6ImZvbnRjb2xvciI7aToyMDtzOjk6ImJhY2tjb2xvciI7aToyMTtzOjE6InwiO2k6MjI7czo5OiJhbGlnbmxlZnQiO2k6MjM7czoxMToiYWxpZ25jZW50ZXIiO2k6MjQ7czoxMDoiYWxpZ25yaWdodCI7aToyNTtzOjc6Imp1c3RpZnkiO2k6MjY7czoxOiJ8IjtpOjI3O3M6MTQ6Imhvcml6b250YWxydWxlIjtpOjI4O3M6MTE6InBhc3RlX3BsYWluIjtpOjI5O3M6MToifCI7fXM6MTQ6InVwbG9hZF9zZXJ2aWNlIjtzOjU6ImxvY2FsIjtzOjIwOiJmaWxlX3VwbG9hZF9sb2NhdGlvbiI7czoxOiIwIjtzOjIxOiJpbWFnZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoxNDoiaW1hZ2VfYnJvd3NpbmciO3M6MzoieWVzIjtzOjEyOiJpbWFnZV9zdWJkaXIiO3M6MzoieWVzIjtzOjI6InMzIjthOjQ6e3M6NDoiZmlsZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjU6ImltYWdlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6MTQ6ImF3c19hY2Nlc3Nfa2V5IjtzOjA6IiI7czoxNDoiYXdzX3NlY3JldF9rZXkiO3M6MDoiIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjk6ImRpcmVjdGlvbiI7czozOiJsdHIiO3M6NzoidG9vbGJhciI7czozOiJ5ZXMiO3M6Njoic291cmNlIjtzOjM6InllcyI7czo1OiJmb2N1cyI7czoyOiJubyI7czoxMDoiYXV0b3Jlc2l6ZSI7czozOiJ5ZXMiO3M6NToiZml4ZWQiO3M6Mjoibm8iO3M6MTI6ImNvbnZlcnRsaW5rcyI7czozOiJ5ZXMiO3M6MTE6ImNvbnZlcnRkaXZzIjtzOjM6InllcyI7czo3OiJvdmVybGF5IjtzOjM6InllcyI7czoxMzoib2JzZXJ2ZWltYWdlcyI7czozOiJ5ZXMiO3M6OToic2hvcnRjdXRzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjI6Im5vIjtzOjg6InByb3RvY29sIjtzOjM6InllcyI7czoxODoiYWxsb3dlZHRhZ3Nfb3B0aW9uIjtzOjc6ImRlZmF1bHQiO3M6MTE6ImFsbG93ZWR0YWdzIjthOjA6e31zOjE0OiJmb3JtYXR0aW5ndGFncyI7YTo3OntpOjA7czoxOiJwIjtpOjE7czoxMDoiYmxvY2txdW90ZSI7aToyO3M6MzoicHJlIjtpOjM7czoyOiJoMSI7aTo0O3M6MjoiaDIiO2k6NTtzOjI6ImgzIjtpOjY7czoyOiJoNCI7fXM6ODoibGFuZ3VhZ2UiO3M6MjoiZW4iO3M6ODoiY3NzX2ZpbGUiO3M6MDoiIjtzOjExOiJlZGl0b3JfY29uZiI7czoxOiIzIjt9fQ=='),
(3, 1, 12, NULL, 'img', 'Image', '', 'file', 'y', 'n', 0, '10%', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czozOiJhbGwiO3M6MTI6ImNvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
(4, 1, 12, NULL, 'headline', 'Headline', '', 'text', 'y', 'n', 1, '30%', 'YTo0OntzOjQ6Im1heGwiO3M6MzoiMTQwIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(5, 1, 12, NULL, 'content', 'Content', '', 'editor', 'y', 'n', 2, '', 'YToxOntzOjY6ImVkaXRvciI7YToyOTp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjc6ImJ1dHRvbnMiO2E6MzA6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjE6InwiO2k6MjtzOjEwOiJmb3JtYXR0aW5nIjtpOjM7czoxOiJ8IjtpOjQ7czo0OiJib2xkIjtpOjU7czo2OiJpdGFsaWMiO2k6NjtzOjc6ImRlbGV0ZWQiO2k6NztzOjE6InwiO2k6ODtzOjEzOiJ1bm9yZGVyZWRsaXN0IjtpOjk7czoxMToib3JkZXJlZGxpc3QiO2k6MTA7czo3OiJvdXRkZW50IjtpOjExO3M6NjoiaW5kZW50IjtpOjEyO3M6MToifCI7aToxMztzOjQ6ImxpbmsiO2k6MTQ7czo1OiJpbWFnZSI7aToxNTtzOjU6InZpZGVvIjtpOjE2O3M6NDoiZmlsZSI7aToxNztzOjU6InRhYmxlIjtpOjE4O3M6MToifCI7aToxOTtzOjk6ImZvbnRjb2xvciI7aToyMDtzOjk6ImJhY2tjb2xvciI7aToyMTtzOjE6InwiO2k6MjI7czo5OiJhbGlnbmxlZnQiO2k6MjM7czoxMToiYWxpZ25jZW50ZXIiO2k6MjQ7czoxMDoiYWxpZ25yaWdodCI7aToyNTtzOjc6Imp1c3RpZnkiO2k6MjY7czoxOiJ8IjtpOjI3O3M6MTQ6Imhvcml6b250YWxydWxlIjtpOjI4O3M6MTE6InBhc3RlX3BsYWluIjtpOjI5O3M6MToifCI7fXM6MTQ6InVwbG9hZF9zZXJ2aWNlIjtzOjU6ImxvY2FsIjtzOjIwOiJmaWxlX3VwbG9hZF9sb2NhdGlvbiI7czoxOiIwIjtzOjIxOiJpbWFnZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoxNDoiaW1hZ2VfYnJvd3NpbmciO3M6MzoieWVzIjtzOjEyOiJpbWFnZV9zdWJkaXIiO3M6MzoieWVzIjtzOjI6InMzIjthOjQ6e3M6NDoiZmlsZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjU6ImltYWdlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6MTQ6ImF3c19hY2Nlc3Nfa2V5IjtzOjA6IiI7czoxNDoiYXdzX3NlY3JldF9rZXkiO3M6MDoiIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjk6ImRpcmVjdGlvbiI7czozOiJsdHIiO3M6NzoidG9vbGJhciI7czozOiJ5ZXMiO3M6Njoic291cmNlIjtzOjM6InllcyI7czo1OiJmb2N1cyI7czoyOiJubyI7czoxMDoiYXV0b3Jlc2l6ZSI7czozOiJ5ZXMiO3M6NToiZml4ZWQiO3M6Mjoibm8iO3M6MTI6ImNvbnZlcnRsaW5rcyI7czozOiJ5ZXMiO3M6MTE6ImNvbnZlcnRkaXZzIjtzOjM6InllcyI7czo3OiJvdmVybGF5IjtzOjM6InllcyI7czoxMzoib2JzZXJ2ZWltYWdlcyI7czozOiJ5ZXMiO3M6OToic2hvcnRjdXRzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjI6Im5vIjtzOjg6InByb3RvY29sIjtzOjM6InllcyI7czoxODoiYWxsb3dlZHRhZ3Nfb3B0aW9uIjtzOjc6ImRlZmF1bHQiO3M6MTE6ImFsbG93ZWR0YWdzIjthOjA6e31zOjE0OiJmb3JtYXR0aW5ndGFncyI7YTo3OntpOjA7czoxOiJwIjtpOjE7czoxMDoiYmxvY2txdW90ZSI7aToyO3M6MzoicHJlIjtpOjM7czoyOiJoMSI7aTo0O3M6MjoiaDIiO2k6NTtzOjI6ImgzIjtpOjY7czoyOiJoNCI7fXM6ODoibGFuZ3VhZ2UiO3M6MjoiZW4iO3M6ODoiY3NzX2ZpbGUiO3M6MDoiIjtzOjExOiJlZGl0b3JfY29uZiI7czoxOiIzIjt9fQ=='),
(6, 1, 12, NULL, 'link', 'Link', '', 'text', 'n', 'n', 3, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(7, 1, 7, NULL, 'button_text', 'Button Text', '', 'text', 'n', 'n', 2, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(8, 1, 7, NULL, 'link', 'File', '', 'file', 'n', 'n', 3, '', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czozOiJhbGwiO3M6MTI6ImNvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
(9, 1, 25, NULL, 'image', 'Project Image', '', 'file', 'n', 'n', 1, '10%', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiIxIjtzOjEyOiJjb250ZW50X3R5cGUiO3M6MzoiYWxsIjt9'),
(10, 1, 25, NULL, 'headline', 'Body Headline', '', 'text', 'n', 'n', 2, '', 'YTo0OntzOjQ6Im1heGwiO3M6MzoiMTQwIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(11, 1, 25, NULL, 'content1', 'Body Content 1', '', 'editor', 'n', 'n', 3, '', 'YToxOntzOjY6ImVkaXRvciI7YToyOTp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjc6ImJ1dHRvbnMiO2E6MzA6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjE6InwiO2k6MjtzOjEwOiJmb3JtYXR0aW5nIjtpOjM7czoxOiJ8IjtpOjQ7czo0OiJib2xkIjtpOjU7czo2OiJpdGFsaWMiO2k6NjtzOjc6ImRlbGV0ZWQiO2k6NztzOjE6InwiO2k6ODtzOjEzOiJ1bm9yZGVyZWRsaXN0IjtpOjk7czoxMToib3JkZXJlZGxpc3QiO2k6MTA7czo3OiJvdXRkZW50IjtpOjExO3M6NjoiaW5kZW50IjtpOjEyO3M6MToifCI7aToxMztzOjQ6ImxpbmsiO2k6MTQ7czo1OiJpbWFnZSI7aToxNTtzOjU6InZpZGVvIjtpOjE2O3M6NDoiZmlsZSI7aToxNztzOjU6InRhYmxlIjtpOjE4O3M6MToifCI7aToxOTtzOjk6ImZvbnRjb2xvciI7aToyMDtzOjk6ImJhY2tjb2xvciI7aToyMTtzOjE6InwiO2k6MjI7czo5OiJhbGlnbmxlZnQiO2k6MjM7czoxMToiYWxpZ25jZW50ZXIiO2k6MjQ7czoxMDoiYWxpZ25yaWdodCI7aToyNTtzOjc6Imp1c3RpZnkiO2k6MjY7czoxOiJ8IjtpOjI3O3M6MTQ6Imhvcml6b250YWxydWxlIjtpOjI4O3M6MTE6InBhc3RlX3BsYWluIjtpOjI5O3M6MToifCI7fXM6MTQ6InVwbG9hZF9zZXJ2aWNlIjtzOjU6ImxvY2FsIjtzOjIwOiJmaWxlX3VwbG9hZF9sb2NhdGlvbiI7czoxOiIwIjtzOjIxOiJpbWFnZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoxNDoiaW1hZ2VfYnJvd3NpbmciO3M6MzoieWVzIjtzOjEyOiJpbWFnZV9zdWJkaXIiO3M6MzoieWVzIjtzOjI6InMzIjthOjQ6e3M6NDoiZmlsZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjU6ImltYWdlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6MTQ6ImF3c19hY2Nlc3Nfa2V5IjtzOjA6IiI7czoxNDoiYXdzX3NlY3JldF9rZXkiO3M6MDoiIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjk6ImRpcmVjdGlvbiI7czozOiJsdHIiO3M6NzoidG9vbGJhciI7czozOiJ5ZXMiO3M6Njoic291cmNlIjtzOjM6InllcyI7czo1OiJmb2N1cyI7czoyOiJubyI7czoxMDoiYXV0b3Jlc2l6ZSI7czozOiJ5ZXMiO3M6NToiZml4ZWQiO3M6Mjoibm8iO3M6MTI6ImNvbnZlcnRsaW5rcyI7czozOiJ5ZXMiO3M6MTE6ImNvbnZlcnRkaXZzIjtzOjM6InllcyI7czo3OiJvdmVybGF5IjtzOjM6InllcyI7czoxMzoib2JzZXJ2ZWltYWdlcyI7czozOiJ5ZXMiO3M6OToic2hvcnRjdXRzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjI6Im5vIjtzOjg6InByb3RvY29sIjtzOjM6InllcyI7czoxODoiYWxsb3dlZHRhZ3Nfb3B0aW9uIjtzOjc6ImRlZmF1bHQiO3M6MTE6ImFsbG93ZWR0YWdzIjthOjA6e31zOjE0OiJmb3JtYXR0aW5ndGFncyI7YTo3OntpOjA7czoxOiJwIjtpOjE7czoxMDoiYmxvY2txdW90ZSI7aToyO3M6MzoicHJlIjtpOjM7czoyOiJoMSI7aTo0O3M6MjoiaDIiO2k6NTtzOjI6ImgzIjtpOjY7czoyOiJoNCI7fXM6ODoibGFuZ3VhZ2UiO3M6MjoiZW4iO3M6ODoiY3NzX2ZpbGUiO3M6MDoiIjtzOjExOiJlZGl0b3JfY29uZiI7czoxOiIzIjt9fQ=='),
(12, 1, 25, NULL, 'city', 'City', '', 'text', 'y', 'n', 0, '5%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(14, 1, 25, NULL, 'content2', 'Body Content 2', '', 'editor', 'n', 'n', 4, '', 'YToxOntzOjY6ImVkaXRvciI7YToyOTp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjc6ImJ1dHRvbnMiO2E6MzA6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjE6InwiO2k6MjtzOjEwOiJmb3JtYXR0aW5nIjtpOjM7czoxOiJ8IjtpOjQ7czo0OiJib2xkIjtpOjU7czo2OiJpdGFsaWMiO2k6NjtzOjc6ImRlbGV0ZWQiO2k6NztzOjE6InwiO2k6ODtzOjEzOiJ1bm9yZGVyZWRsaXN0IjtpOjk7czoxMToib3JkZXJlZGxpc3QiO2k6MTA7czo3OiJvdXRkZW50IjtpOjExO3M6NjoiaW5kZW50IjtpOjEyO3M6MToifCI7aToxMztzOjQ6ImxpbmsiO2k6MTQ7czo1OiJpbWFnZSI7aToxNTtzOjU6InZpZGVvIjtpOjE2O3M6NDoiZmlsZSI7aToxNztzOjU6InRhYmxlIjtpOjE4O3M6MToifCI7aToxOTtzOjk6ImZvbnRjb2xvciI7aToyMDtzOjk6ImJhY2tjb2xvciI7aToyMTtzOjE6InwiO2k6MjI7czo5OiJhbGlnbmxlZnQiO2k6MjM7czoxMToiYWxpZ25jZW50ZXIiO2k6MjQ7czoxMDoiYWxpZ25yaWdodCI7aToyNTtzOjc6Imp1c3RpZnkiO2k6MjY7czoxOiJ8IjtpOjI3O3M6MTQ6Imhvcml6b250YWxydWxlIjtpOjI4O3M6MTE6InBhc3RlX3BsYWluIjtpOjI5O3M6MToifCI7fXM6MTQ6InVwbG9hZF9zZXJ2aWNlIjtzOjU6ImxvY2FsIjtzOjIwOiJmaWxlX3VwbG9hZF9sb2NhdGlvbiI7czoxOiIwIjtzOjIxOiJpbWFnZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoxNDoiaW1hZ2VfYnJvd3NpbmciO3M6MzoieWVzIjtzOjEyOiJpbWFnZV9zdWJkaXIiO3M6MzoieWVzIjtzOjI6InMzIjthOjQ6e3M6NDoiZmlsZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjU6ImltYWdlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6MTQ6ImF3c19hY2Nlc3Nfa2V5IjtzOjA6IiI7czoxNDoiYXdzX3NlY3JldF9rZXkiO3M6MDoiIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjk6ImRpcmVjdGlvbiI7czozOiJsdHIiO3M6NzoidG9vbGJhciI7czozOiJ5ZXMiO3M6Njoic291cmNlIjtzOjM6InllcyI7czo1OiJmb2N1cyI7czoyOiJubyI7czoxMDoiYXV0b3Jlc2l6ZSI7czozOiJ5ZXMiO3M6NToiZml4ZWQiO3M6Mjoibm8iO3M6MTI6ImNvbnZlcnRsaW5rcyI7czozOiJ5ZXMiO3M6MTE6ImNvbnZlcnRkaXZzIjtzOjM6InllcyI7czo3OiJvdmVybGF5IjtzOjM6InllcyI7czoxMzoib2JzZXJ2ZWltYWdlcyI7czozOiJ5ZXMiO3M6OToic2hvcnRjdXRzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjI6Im5vIjtzOjg6InByb3RvY29sIjtzOjM6InllcyI7czoxODoiYWxsb3dlZHRhZ3Nfb3B0aW9uIjtzOjc6ImRlZmF1bHQiO3M6MTE6ImFsbG93ZWR0YWdzIjthOjA6e31zOjE0OiJmb3JtYXR0aW5ndGFncyI7YTo3OntpOjA7czoxOiJwIjtpOjE7czoxMDoiYmxvY2txdW90ZSI7aToyO3M6MzoicHJlIjtpOjM7czoyOiJoMSI7aTo0O3M6MjoiaDIiO2k6NTtzOjI6ImgzIjtpOjY7czoyOiJoNCI7fXM6ODoibGFuZ3VhZ2UiO3M6MjoiZW4iO3M6ODoiY3NzX2ZpbGUiO3M6MDoiIjtzOjExOiJlZGl0b3JfY29uZiI7czoxOiIzIjt9fQ=='),
(15, 1, 25, NULL, 'video', 'Video URL', '', 'text', 'n', 'n', 5, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(16, 1, 35, NULL, 'icon', 'Icon', '', 'text', 'y', 'n', 0, '33%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo1OiJ4aHRtbCI7czozOiJkaXIiO3M6MzoibHRyIjt9'),
(17, 1, 35, NULL, 'content', 'Content', '', 'text', 'y', 'n', 2, '', 'YTo0OntzOjQ6Im1heGwiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(18, 1, 39, NULL, 'icon', 'Icon', '', 'text', 'n', 'n', 0, '5%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo1OiJ4aHRtbCI7czozOiJkaXIiO3M6MzoibHRyIjt9'),
(19, 1, 39, NULL, 'content', 'Content', '', 'text', 'n', 'n', 1, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(20, 1, 42, NULL, 'icon', 'Icon', '', 'text', 'y', 'n', 0, '10%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo1OiJ4aHRtbCI7czozOiJkaXIiO3M6MzoibHRyIjt9'),
(21, 1, 42, NULL, 'content', 'Content', '', 'text', 'y', 'n', 1, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(24, 1, 46, NULL, 'bg', 'Background', '', 'file', 'n', 'n', 0, '33%', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czozOiJhbGwiO3M6MTI6ImNvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
(25, 1, 46, NULL, 'headline', 'Headline', '', 'text', 'n', 'n', 1, '', 'YTo0OntzOjQ6Im1heGwiO3M6MzoiMTQwIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(26, 1, 46, NULL, 'content', 'Content', '', 'editor', 'n', 'n', 2, '', 'YToxOntzOjY6ImVkaXRvciI7YToyOTp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjc6ImJ1dHRvbnMiO2E6MzA6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjE6InwiO2k6MjtzOjEwOiJmb3JtYXR0aW5nIjtpOjM7czoxOiJ8IjtpOjQ7czo0OiJib2xkIjtpOjU7czo2OiJpdGFsaWMiO2k6NjtzOjc6ImRlbGV0ZWQiO2k6NztzOjE6InwiO2k6ODtzOjEzOiJ1bm9yZGVyZWRsaXN0IjtpOjk7czoxMToib3JkZXJlZGxpc3QiO2k6MTA7czo3OiJvdXRkZW50IjtpOjExO3M6NjoiaW5kZW50IjtpOjEyO3M6MToifCI7aToxMztzOjQ6ImxpbmsiO2k6MTQ7czo1OiJpbWFnZSI7aToxNTtzOjU6InZpZGVvIjtpOjE2O3M6NDoiZmlsZSI7aToxNztzOjU6InRhYmxlIjtpOjE4O3M6MToifCI7aToxOTtzOjk6ImZvbnRjb2xvciI7aToyMDtzOjk6ImJhY2tjb2xvciI7aToyMTtzOjE6InwiO2k6MjI7czo5OiJhbGlnbmxlZnQiO2k6MjM7czoxMToiYWxpZ25jZW50ZXIiO2k6MjQ7czoxMDoiYWxpZ25yaWdodCI7aToyNTtzOjc6Imp1c3RpZnkiO2k6MjY7czoxOiJ8IjtpOjI3O3M6MTQ6Imhvcml6b250YWxydWxlIjtpOjI4O3M6MTE6InBhc3RlX3BsYWluIjtpOjI5O3M6MToifCI7fXM6MTQ6InVwbG9hZF9zZXJ2aWNlIjtzOjU6ImxvY2FsIjtzOjIwOiJmaWxlX3VwbG9hZF9sb2NhdGlvbiI7czoxOiIwIjtzOjIxOiJpbWFnZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoxNDoiaW1hZ2VfYnJvd3NpbmciO3M6MzoieWVzIjtzOjEyOiJpbWFnZV9zdWJkaXIiO3M6MzoieWVzIjtzOjI6InMzIjthOjQ6e3M6NDoiZmlsZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjU6ImltYWdlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6MTQ6ImF3c19hY2Nlc3Nfa2V5IjtzOjA6IiI7czoxNDoiYXdzX3NlY3JldF9rZXkiO3M6MDoiIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjk6ImRpcmVjdGlvbiI7czozOiJsdHIiO3M6NzoidG9vbGJhciI7czozOiJ5ZXMiO3M6Njoic291cmNlIjtzOjM6InllcyI7czo1OiJmb2N1cyI7czoyOiJubyI7czoxMDoiYXV0b3Jlc2l6ZSI7czozOiJ5ZXMiO3M6NToiZml4ZWQiO3M6Mjoibm8iO3M6MTI6ImNvbnZlcnRsaW5rcyI7czozOiJ5ZXMiO3M6MTE6ImNvbnZlcnRkaXZzIjtzOjM6InllcyI7czo3OiJvdmVybGF5IjtzOjM6InllcyI7czoxMzoib2JzZXJ2ZWltYWdlcyI7czozOiJ5ZXMiO3M6OToic2hvcnRjdXRzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjI6Im5vIjtzOjg6InByb3RvY29sIjtzOjM6InllcyI7czoxODoiYWxsb3dlZHRhZ3Nfb3B0aW9uIjtzOjc6ImRlZmF1bHQiO3M6MTE6ImFsbG93ZWR0YWdzIjthOjA6e31zOjE0OiJmb3JtYXR0aW5ndGFncyI7YTo3OntpOjA7czoxOiJwIjtpOjE7czoxMDoiYmxvY2txdW90ZSI7aToyO3M6MzoicHJlIjtpOjM7czoyOiJoMSI7aTo0O3M6MjoiaDIiO2k6NTtzOjI6ImgzIjtpOjY7czoyOiJoNCI7fXM6ODoibGFuZ3VhZ2UiO3M6MjoiZW4iO3M6ODoiY3NzX2ZpbGUiO3M6MDoiIjtzOjExOiJlZGl0b3JfY29uZiI7czoxOiIzIjt9fQ=='),
(22, 1, 42, NULL, 'link', 'Link', '', 'text', 'y', 'n', 2, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(23, 1, 35, NULL, 'headline', 'Headline', '', 'text', 'n', 'n', 1, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30=');

-- --------------------------------------------------------

--
-- Table structure for table `exp_matrix_data`
--

CREATE TABLE IF NOT EXISTS `exp_matrix_data` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(6) unsigned DEFAULT NULL,
  `var_id` int(6) unsigned DEFAULT NULL,
  `is_draft` tinyint(1) unsigned DEFAULT '0',
  `row_order` int(4) unsigned DEFAULT NULL,
  `col_id_1` text,
  `col_id_2` text,
  `col_id_3` text,
  `col_id_4` text,
  `col_id_5` text,
  `col_id_6` text,
  `col_id_7` text,
  `col_id_8` text,
  `col_id_9` text,
  `col_id_10` text,
  `col_id_11` text,
  `col_id_12` text,
  `col_id_14` text,
  `col_id_15` text,
  `col_id_16` text,
  `col_id_17` text,
  `col_id_18` text,
  `col_id_19` text,
  `col_id_20` text,
  `col_id_21` text,
  `col_id_22` text,
  `col_id_23` text,
  `col_id_24` text,
  `col_id_25` text,
  `col_id_26` text,
  PRIMARY KEY (`row_id`),
  KEY `site_id` (`site_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `var_id` (`var_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `exp_matrix_data`
--

INSERT INTO `exp_matrix_data` (`row_id`, `site_id`, `entry_id`, `field_id`, `var_id`, `is_draft`, `row_order`, `col_id_1`, `col_id_2`, `col_id_3`, `col_id_4`, `col_id_5`, `col_id_6`, `col_id_7`, `col_id_8`, `col_id_9`, `col_id_10`, `col_id_11`, `col_id_12`, `col_id_14`, `col_id_15`, `col_id_16`, `col_id_17`, `col_id_18`, `col_id_19`, `col_id_20`, `col_id_21`, `col_id_22`, `col_id_23`, `col_id_24`, `col_id_25`, `col_id_26`) VALUES
(1, 1, 13, 7, NULL, 0, 1, 'Universities', '<p>\n	 Randall Lewis Health Policy Fellows are enroled in graduate programs at local universities. They are selected to work with participating municipal leadership on Healthy Communities intiatives. The Fellow is placed with no cost to the city or agency, but we do ask that you participate in maintaining the quality of the fellowship program for our region.\n</p>\n<p>\n	 If you are interested in working with a Fellow for 2013-2014, please take a moment to complete our interest form.\n</p>', NULL, NULL, NULL, NULL, 'Download', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 13, 7, NULL, 0, 2, 'Students', '<p>\n	 Randall Lewis Health Policy Fellows are enroled in graduate programs at local universities. They are selected to work with participating municipal leadership on Healthy Communities intiatives. The Fellow is placed with no cost to the city or agency, but we do ask that you participate in maintaining the quality of the fellowship program for our region.\n</p>\n<p>\n	 If you are interested in working with a Fellow for 2013-2014, please take a moment to complete our interest form.\n</p>', NULL, NULL, NULL, NULL, 'Download', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 13, 7, NULL, 0, 3, 'Cities / Agencies', '<p>\n	 Randall Lewis Health Policy Fellows are enroled in graduate programs at local universities. They are selected to work with participating municipal leadership on Healthy Communities intiatives. The Fellow is placed with no cost to the city or agency, but we do ask that you participate in maintaining the quality of the fellowship program for our region.\n</p>\n<p>\n	 If you are interested in working with a Fellow for 2013-2014, please take a moment to complete our interest form.\n</p>', NULL, NULL, NULL, NULL, 'Download', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 14, 12, NULL, 0, 1, NULL, NULL, '{filedir_1}10219_1business_group.jpg', 'Randall Lewis Health Policy Fellowship', '<p>\n	 Your donation to the Partners for Better Health Policy Fellowships will help us create a better future in the Inland Empire.\n</p>\n<p>\n	 We are now seeking applications for The Randall Lewis Health Policy Fellowship for the 2011-2012 academic year. This prestigious and competitive fellowship is the first of its kind in the Inland Empire and will provide a unique opportunity to work directly with local communities in improving residents'' health. Five to seven applicants will be selected to serve as interns in cities within the Inland Empire. Fellows will develop the skills required to successfully influence local and regional health policy. We will have a direct influence on shaping the little p in health policy to make a difference in our communities.between the communities and the health sector.\n</p>', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 14, 12, NULL, 0, 2, NULL, NULL, '{filedir_1}10219_1business_group.jpg', 'Randall Lewis Health Policy Fellowship', '<p>\n	Your donation to the Partners for Better Health Policy Fellowships will help us create a better future in the Inland Empire.\n</p>\n<p>\n	We are now seeking applications for The Randall Lewis Health Policy Fellowship for the 2011-2012 academic year. This prestigious and competitive fellowship is the first of its kind in the Inland Empire and will provide a unique opportunity to work directly with local communities in improving residents'' health. Five to seven applicants will be selected to serve as interns in cities within the Inland Empire. Fellows will develop the skills required to successfully influence local and regional health policy. We will have a direct influence on shaping the little p in health policy to make a difference in our communities.between the communities and the health sector.\n</p>', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, 22, 25, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}pbh_home-header.jpg', 'Ontario', '<p>\n	This is Ontario\n</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, 23, 25, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}10219_1business_group.jpg', 'Healthy Cities Initiative', '<p>\n	This is Loma Linda\n</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, 4, 25, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}ll.png', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	     Population – 23,296 (nearly triples during workdays)\n</p>\n<p>\n	     Median Income - $50,643\n</p>\n<p>\n	     Median Age – 33.7\n</p>\n<h1>Key Fact</h1>\n<p>\n	     Known as a Blue Zone with commonly observed longevity exceeding 100 years\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2>Healthy Communities By Design Summit 2012</h2>\n<p>\n	     Opportunity to attend and present on Healthy Loma Linda efforts\n</p>\n<h2></h2>\n<h2>Launching and re-energizing Healthy Loma Linda efforts</h2>\n<p>\n	     Working with local partners to improve farmer’s market and increase healthy food options, address walkability and bicycle safety, quality of built environment\n</p>', 'Loma Linda', '<h1>Supporting Universities</h1>\n<p>\n	             Loma Linda University\n</p>\n<h1>University Contact</h1>\n<p>\n	     Andrejs Galenieks\n</p>\n<h1>City Preceptor</h1>\n<p>\n	     Konrad Bolowich\n</p>', 'https://player.vimeo.com/video/7030292?title=0&amp;byline=0&amp;portrait=0&amp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 1, 4, 25, NULL, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}ont1.png', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	     Population: 173,690\n</p>\n<p>\n	     Median Income:  $53,018\n</p>\n<p>\n	     Median Age: 29 years old\n</p>\n<h1>Key Fact</h1>\n<p>\n	     The Gateway to Southern CA takes its name from the Ontario Model Colony development in 1882 by the Chaffey brothers, Canadian engineers, after their home province of Ontario, Canada.\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2>\n<p>\n	 <span style="font-weight: normal;">Access to Health Care for Target Population</span>\n</p>\n<p>\n	 <span style="font-weight: normal;">Needs Assessment - Focus Group Meeting</span>\n</p>\n<p>\n	 <span style="font-weight: normal;">Junior Public Health Internship Program</span>\n</p>\n</h2>\n<h2></h2>\n<h2>Key Project</h2>\n<p>\n	     In the context of Affordability Care Act implementation, establish an action plan with partner organizations to initiate outreach promotion, provide appropriate resources &amp; information to facilitate health care access for a target population and help achieve better care outcomes long term.\n</p>', 'Ontario', '<h1>Supporting Universities</h1>\n<p>\n	     Claremont Graduate University\n</p>\n<h1>University Contact</h1>\n<p>\n	     Joe Garbanzos\n</p>\n<h1>City Preceptor</h1>\n<p>\n	     Karen Thompson\n</p>', 'https://player.vimeo.com/video/7030292?title=0&amp;byline=0&amp;portrait=0&amp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 1, 4, 25, NULL, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}sb.jpg', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	    Population: 2,035,210\n</p>\n<p>\n	      Median Income: $53,364\n</p>\n<p>\n	      Median Age: 31.9 years\n</p>\n<h1>Key Fact</h1>\n<p>\n	    The City of San Bernardino has the most elected officials of any city in California (7 council members + Mayor + Treasurer + City Attorney + City Clerk)\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2></h2>\n<h2>1. Policy Briefs</h2>\n<p>\n	    1. Access to healthy food\n</p>\n<p>\n	      2. Open safe spaces for physical activity\n</p>\n<h2>2. HSBC Health Hubs Farm Share</h2>\n<p>\n	    HSBC is working with its partners to increase access to fresh fruits and vegetable in   underserved neighborhoods.\n</p>\n<h2>3. Healthy San Bernardino Junior Public Health Internship</h2>\n<p>\n	    Encourage students interested in health and public health in experiential learning   opportunities.\n</p>\n<h2>*Health Hubs</h2>\n<p>\n	    Place-based in San Bernardino where multiple partners are collaborating to improve the health of the community.\n</p>\n<p>\n	      14 identified health hubs in the city\n</p>', 'San Bernardino', '<h1>Supporting Universities</h1>\n<p>\n	          Loma Linda University\n</p>\n<h1>University Contact</h1>\n<p>\n	    Laura Acosta\n</p>\n<h1>City Preceptor</h1>\n<p>\n	    Cynthia Luna\n</p>', 'https://player.vimeo.com/video/7030292?title=0&amp;byline=0&amp;portrait=0&amp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 1, 4, 25, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}rialto.jpg', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	   Population – 100,438\n</p>\n<p>\n	   Median Income - $50,516\n</p>\n<p>\n	   Median Age – 28.5\n</p>\n<h1>Key Fact</h1>\n<p>\n	   The last orange grove in Rialto,  Adams Acres, delivers oranges to Pomona college twice a week\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2></h2>\n<h2><span style="font-weight: normal;">Rialto’s Certified Farmers’ Market</span></h2>\n<p>\n	 <span style="font-weight: normal;">Initially seasonal market that expanded to a year-round market </span>\n</p>\n<p>\n	 <span style="font-weight: normal;">Opportunity to present Healthy Rialto programs </span>\n</p>\n<h2><span style="font-weight: normal;">Healthy Rialto Divisions and Programs</span></h2>\n<p>\n	 <span style="font-weight: normal;">Healthy Rialto Earth, Food, Active Living, Kids, &amp; Seniors</span>\n</p>\n<h2><span style="font-weight: normal;">Healthy Rialto Coalition Meetings</span></h2>\n<p>\n	 <span style="font-weight: normal;">Coordinate and implement healthy eating active living programs that are sustainable</span>\n</p>', 'Rialto', '<h1>Supporting Universities</h1>\n<p>\n	          Loma Linda University\n</p>\n<h1>University Contact</h1>\n<p>\n	   Laureen Nilo\n</p>\n<h1>City Preceptor</h1>\n<p>\n	   Barbara McGee\n</p>', 'https://player.vimeo.com/video/7030292?title=0&amp;byline=0&amp;portrait=0&amp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 1, 4, 25, NULL, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}fntn.jpg', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	   Population – 199,898 residents\n</p>\n<p>\n	   Median Income – $57,557\n</p>\n<p>\n	   Median Age – 28.7\n</p>\n<h1>Key Fact</h1>\n<p>\n	   Currently, ranked number 5 in the nation for the Let’s Move! Cities, Towns, and Counties Initiative\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2></h2>\n<h2><span style="font-weight: normal;">Grant/Policy Research and Assistance</span></h2>\n<p>\n	 <span style="font-weight: normal;">Contributing editor for grant application for Kaiser Permanente Fontana Medical Center Community Benefits Program</span>\n</p>\n<h2><span style="font-weight: normal;">Community Outreach, Partnerships, and Events </span></h2>\n<p>\n	 <span style="font-weight: normal;">Provide support during outreach and collaboration events (e.g. Festival of Winter, Stakeholders’ Meeting, etc)</span>\n</p>\n<h2><span style="font-weight: normal;">Let’s Move! Cities, Towns, and Counties initiative </span></h2>\n<p>\n	 <span style="font-weight: normal;">Create a checklist of goals, provide technical support in accomplishing them, and develop and maintain online profile for City of Fontana</span>\n</p>', 'Fontana', '<h1>Supporting Universities</h1>\n<p>\n	          Loma Linda University\n</p>\n<h1>University Contact</h1>\n<p>\n	   Sidra Nasir\n</p>\n<h1>City Preceptor</h1>\n<p>\n	   Dede Benson\n</p>', 'https://player.vimeo.com/video/7030292?title=0&amp;byline=0&amp;portrait=0&amp;', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1, 1, 35, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&#128269;', '	 We create a collaborative effort to understand and interpret the health needs of the community.', NULL, NULL, NULL, NULL, NULL, 'Investigate', NULL, NULL, NULL),
(14, 1, 1, 35, NULL, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&#128161;', '	 We gather our findings and conceptualize solutions.', NULL, NULL, NULL, NULL, NULL, 'Conceptualize', NULL, NULL, NULL),
(15, 1, 1, 35, NULL, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&#128255;', '	 We incubate those solutions by drawing on a network of resources.', NULL, NULL, NULL, NULL, NULL, 'Incubate', NULL, NULL, NULL),
(16, 1, 1, 39, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&#59172;', 'Cities', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 1, 1, 39, NULL, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&#128213;', 'Universities', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 1, 1, 39, NULL, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&#127891;', 'Students', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 1, 1, 39, NULL, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&#128710;', 'Businesses', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 1, 1, 39, NULL, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&#128101;', 'Organizations', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 1, 1, 39, NULL, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&#127810;', 'Health Systems', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 1, 1, 42, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&#128227;', 'Get Involved', '/get-involved', NULL, NULL, NULL, NULL),
(23, 1, 1, 42, NULL, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&hearts;', 'Give', '/give', NULL, NULL, NULL, NULL),
(24, 1, 1, 42, NULL, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '&#128213;', 'Learn More', '/about', NULL, NULL, NULL, NULL),
(25, 1, 1, 46, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}pbh_home-header.jpg', 'San Bernardino', '<p>\n	Joined Healthy Cities in 2010\n</p>\n<p>\n	At a glance:\n</p>\n<p>\n	Population: 2,035,210\n</p>\n<p>\n	  Median Income: $53,364\n</p>\n<p>\n	  Median Age: 31.9 years\n</p>\n<p>\n	The City of San Bernardino has the most elected officials of any city in California (7 council members + Mayor + Treasurer + City Attorney + City Clerk)\n</p>'),
(26, 1, 1, 46, NULL, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}pbh_home-header.jpg', 'Pasadena', '<p>\n	Joined Healthy Cities in 1989\n</p>\n<p>\n	At a glance:\n</p>\n<p>\n	Population- 137,122\n</p>\n<p>\n	  Median Income- $58,402\n</p>\n<p>\n	Median Age- 37.2\n</p>\n<p>\n	One of only three cities in the state of California that maintains its own independent local health jurisdiction\n</p>'),
(27, 1, 1, 46, NULL, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}10219_1business_group.jpg', 'Loma Linda', '<p>\n	Joined Healthy Cities in 2012\n</p>\n<p>\n	At a glance:\n</p>\n<p>\n	Population – 23,296 (nearly triples during workdays)\n</p>\n<p>\n	Median Income - $50,643\n</p>\n<p>\n	Median Age – 33.7\n</p>\n<p>\n	Known as a Blue Zone with commonly observed longevity exceeding 100 years\n</p>'),
(28, 1, 4, 25, NULL, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}psdna.png', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	    Population- 137,122\n</p>\n<p>\n	      Median Income- $58,402\n</p>\n<p>\n	    Median Age- 37.2\n</p>\n<h1>Key Fact</h1>\n<p>\n	    One of only three cities in the state of California that maintains its own independent local health jurisdiction\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2></h2>\n<h2><span style="font-weight: normal;">2013-2016 School/City Work Plan</span></h2>\n<p>\n	<span style="font-weight: normal;">A collaborative effort to strategically track the progress of children and families through a variety of conditions for learning.</span>\n</p>\n<h2><span style="font-weight: normal;">Infant, Children, Youth and Family Master Plan</span></h2>\n<p>\n	<span style="font-weight: normal;">A long range strategic planning document that will set measurable goals and objectives to support and enrich the lives of children, youth, and families.</span>\n</p>\n<h2><span style="font-weight: normal;">Policy on Children, Youth, and Families, 2013 Report</span></h2>\n<p>\n	<span style="font-weight: normal;">Comprehensive review of key issues that make the City of Pasadena a family friendly and nurturing community.</span>\n</p>', 'Pasadena', '<h1>Supporting Universities</h1>\n<p>\n	    Loma Linda University\n</p>\n<h1>University Contact</h1>\n<p>\n	    Bode Adeniyi\n</p>\n<h1>City Preceptor</h1>\n<p>\n	   Mercy Santoro\n</p>', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 1, 4, 25, NULL, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}desrt.jpg', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	   Population – 339,492\n</p>\n<p>\n	   Median Income - $48,463\n</p>\n<p>\n	   Median Age – 30.5\n</p>\n<h1>Key Fact</h1>\n<p>\n	   The late Roy Rogers retired in Apple Valley\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2></h2>\n<h2><span style="font-weight: normal;">Healthy Vending Machine</span></h2>\n<p>\n	 <span style="font-weight: normal;">Developed an audit tool, assessed and presented data to the Healthy Victorville meeting on the vending machines in the city</span>\n</p>\n<h2><span style="font-weight: normal;">Matthew’s Park</span></h2>\n<p>\n	 <span style="font-weight: normal;">Working to purchase equipment and dedicate a park to Matthew in Adelanto</span>\n</p>\n<h2><span style="font-weight: normal;">Joint Use Agreement</span></h2>\n<p>\n	 <span style="font-weight: normal;">Shot a video that will highlight the importance of policy in the city</span>\n</p>\n<p>\n	 <span style="font-weight: normal;">  Developing a joint use agreement for the use of Adelanto High School</span>\n</p>\n<h2><span style="font-weight: normal;">Pipeline Program</span></h2>\n<p>\n	 <span style="font-weight: normal;">Junior Public Health Internship</span>\n</p>\n<p>\n	 <span style="font-weight: normal;">Encourage students interested in health and public health in experiential   learning opportunities</span>\n</p>', 'High Desert', '<h1>Supporting Universities</h1>\n<p>\n	   Loma Linda University\n</p>\n<h1>University Contact</h1>\n<p>\n	   Sendy Sanchez\n</p>\n<h1>City Preceptor</h1>\n<p>\n	   Allen Christensen\n</p>', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 1, 4, 25, NULL, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}rc.png', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	  Population: 168,000\n</p>\n<p>\n	  Median Income: $81,000\n</p>\n<p>\n	  Median Age: 32.8\n</p>\n<h1>Key Fact</h1>\n<p>\n	  Rancho Cucamonga was home to the first commercial winery founded in 1889\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2></h2>\n<h2><span style="font-weight: normal;">Bringing Health Home Initiative  </span></h2>\n<p>\n	<span style="font-weight: normal;">Provides financial incentives to Southwest Cucamonga residents at the Farmer’s Market</span>\n</p>\n<h2><span style="font-weight: normal;">Healthy RC Dining Program</span></h2>\n<p>\n	<span style="font-weight: normal;">Working on providing healthier dining options at restaurants within the City</span>\n</p>\n<h2><span style="font-weight: normal;">Breastfeeding Workplace Policy</span></h2>\n<p>\n	<span style="font-weight: normal;">Creating a policy to accommodate lactating mothers at the workplace</span>\n</p>', 'Rancho Cucamonga', '<h1>Supporting Universities</h1>\n<p>\n	  Claremont Graduate University\n</p>\n<h1>University Contact</h1>\n<p>\n	  Uloma Ajuonu\n</p>\n<h1>City Preceptor</h1>\n<p>\n	  Ruben Brambila &amp; Michael Parmer\n</p>', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 1, 4, 25, NULL, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}rim.jpg', 'Healthy Cities Initiative', '<h1><span style="color: rgb(0, 0, 0); font-weight: bold;">At A Glance</span></h1>\n<p>\n	  Population- 28,912\n</p>\n<p>\n	    Income- 40% of households are above $70,000\n</p>\n<p>\n	    &amp; 25% are below $30,000\n</p>\n<p>\n	    Median Age- 43.3\n</p>\n<h1>Key Fact</h1>\n<p>\n	  43% of households are seasonal recreational or occasional-use which means fluctuations in population seasonally\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2></h2>\n<h2><span style="font-weight: normal;">Rim Communities Resource Network</span></h2>\n<p>\n	<span style="font-weight: normal;">Develop a Healthy Communities Action Plan</span>\n</p>\n<h2><span style="font-weight: normal;">Research</span></h2>\n<p>\n	<span style="font-weight: normal;">Complete secondary data analysis and plan future primary data collection</span>\n</p>', 'Rim', '<h1>Supporting Universities</h1>\n<p>\n	  Claremont Graduate University\n</p>\n<h1>University Contact</h1>\n<p>\n	  Alyssa De Santiago, MPH\n</p>\n<h1>City Preceptor</h1>\n<p>\n	  Miki Carpenter, PhD, MPH\n</p>', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 1, 4, 25, NULL, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}jurupa.jpg', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	  Population: 95,004\n</p>\n<p>\n	  Median Income: $55,803\n</p>\n<p>\n	  Median Age: 27.8\n</p>\n<h1>Key Fact</h1>\n<p>\n	  “The Newest City In California”\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2></h2>\n<h2><span style="font-weight: normal;">Safe Routes to School  </span></h2>\n<p>\n	<span style="font-weight: normal;">Working together with community stakeholders and County of Riverside to improve the safety of our students walking/biking to school</span>\n</p>\n<h2><span style="font-weight: normal;">Healthy Jurupa Valley Extravaganza!</span></h2>\n<p>\n	<span style="font-weight: normal;">Health and safety fair to generate community excitement and desire to be part of the visioning &amp; planning process of our Healthy Jurupa Valley Initiative   </span>\n</p>\n<p>\n	<span style="font-weight: normal;">Where: Community Center and Agate Park (JARPD)</span>\n</p>\n<p>\n	<span style="font-weight: normal;">  When: April 20, 2013</span>\n</p>\n<p>\n	<span style="font-weight: normal;">  Time: 10am – 3pm</span>\n</p>', 'Jurupa', '<h1>Supporting Universities</h1>\n<p>\n	  Claremont Graduate University\n</p>\n<h1>University Contact</h1>\n<p>\n	  Leticia Miranda\n</p>\n<h1>City Preceptor</h1>\n<p>\n	  Jose Campos\n</p>', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 1, 4, 25, NULL, 0, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}clr.gif', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	  Population: 35,143\n</p>\n<p>\n	  Median Income: $78,376\n</p>\n<p>\n	  Median Age: 38.6\n</p>\n<h1>Key Fact</h1>\n<p>\n	  Claremont has been a winner of the National Arbor Day Association’s Tree City USA award for the past 20 years\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2></h2>\n<h2><span style="font-weight: normal;">Claremont Youth Health Fair </span></h2>\n<p>\n	<span style="font-weight: normal;">Creation of an annual health fair to provide free physicals as well as health and well-being information to our youth</span>\n</p>\n<h2><span style="font-weight: normal;">Community-Wide Status Update in Mental Health</span></h2>\n<p>\n	<span style="font-weight: normal;">Formal status report on the mental health service providers in our community and adoption of evaluation methodology </span>\n</p>\n<h2><span style="font-weight: normal;">Claremont Mental Health Provider Summit</span></h2>\n<p>\n	<span style="font-weight: normal;">Opportunity to provide cross collaboration across mental health organizations and present our status report findings</span>\n</p>', 'Claremont', '<h1>Supporting Universities</h1>\n<p>\n	  Claremont Graduate University\n</p>\n<h1>University Contact</h1>\n<p>\n	  Hannah Gordon\n</p>\n<h1>City Preceptor</h1>\n<p>\n	  Bill Pallotto\n</p>', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 1, 4, 25, NULL, 0, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}chino.png', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	 Population: 79,059\n</p>\n<p>\n	 Median Income: 60,000\n</p>\n<p>\n	 Median Age: 33.2\n</p>\n<h1>Key Fact</h1>\n<p>\n	 Largely agricultural in the past, but continues to provide dairy for much of Southern California\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2></h2>\n<h2><span style="font-weight: normal;">Project 1</span></h2>\n<p>\n	 <span style="font-weight: normal;">Re-vitalize employee wellness program </span>\n</p>\n<h2><span style="font-weight: normal;">Project 2</span></h2>\n<p>\n	 <span style="font-weight: normal;">Encourage local business to be a part of the Healthy Chino Movement</span>\n</p>\n<h2><span style="font-weight: normal;">Key Project</span></h2>\n<p>\n	 <span style="font-weight: normal;">Research and compile information for policy change of vending machines to include healthy options</span>\n</p>', 'Chino', '<h1>Supporting Universities</h1>\n<p>\n	 Claremont Graduate University\n</p>\n<h1>University Contact</h1>\n<p>\n	 Gar-Wei Lee\n</p>\n<h1>City Preceptor</h1>\n<p>\n	 Karen Pacheco, Martha Hernandez\n</p>', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 1, 4, 25, NULL, 0, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_1}pomona.jpg', 'Healthy Cities Initiative', '<h1>At A Glance</h1>\n<p>\n	 Population: 149,058\n</p>\n<p>\n	 Median income: $48,973\n</p>\n<p>\n	 Median age: 29.5 years\n</p>\n<h1>Key Fact</h1>\n<p>\n	 Birthplace of Mark McGwire (73 home runs in 2001)\n</p>\n<h1>Key Projects &amp; Initiatives</h1>\n<h2></h2>\n<h2><span style="font-weight: normal;">Healthy Communities by Design Summit 2012  </span></h2>\n<p>\n	 <span style="font-weight: normal;">Represent Pomona in its inaugural year</span>\n</p>\n<h2><span style="font-weight: normal;">Youth and Family Master Plan</span></h2>\n<p>\n	 <span style="font-weight: normal;">Attend meetings and share ideas to foster coordination of services</span>\n</p>\n<h2><span style="font-weight: normal;">“Healthy Pomona” General Plan component</span></h2>\n<p>\n	 <span style="font-weight: normal;">In the forthcoming update to the city''s general plan, a new unique section will be added that unifies health promotion efforts and articulates the vision for improving the city''s health in the coming years</span>\n</p>', 'Pomona', '<h1>Supporting Universities</h1>\n<p>\n	 Claremont Graduate University\n</p>\n<h1>University Contact</h1>\n<p>\n	 Daniel Nuyujukian\n</p>\n<h1>City Preceptor</h1>\n<p>\n	 Andrea Rico\n</p>', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_members`
--

CREATE TABLE IF NOT EXISTS `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `localization_is_site_default` char(1) NOT NULL DEFAULT 'n',
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '28',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `localization_is_site_default`, `time_format`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`) VALUES
(1, 1, 'longdao', 'Long Dao', '12979c641bc3b4e40c73d02cf5bbf2e376d3ccfed770602e3081d3ad20f2893dabe1926fbab9daed15fa4a9016f481d66b80bd0cb7cf6692f0e513596e0e8467', '@b0R2Xi)WskwA85Id;(ae54:r'':Vim[Tx8o#&\\)8>P!K3}qi-Wxh''!#{Lbu}{>x1rkVB#|VoP.Uqa08##kp;xN3I^K~>)ATey^s@FFoQm4?Z5CT;0.]m"<}t+Cel|v~Q', '92f71572c4d8aa6251ef1aa88162af2731307147', 'f3d4626675be8404dae6ec4c194165296cdc6ec0', NULL, 'support@maven20.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1375811349, 1377209293, 1377215625, 23, 0, 0, 0, 1377030553, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'America/Los_Angeles', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', '', 'Template Manager|C=design&M=manager&tgpref=1|1', 'n', 0, 'y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_bulletin_board`
--

CREATE TABLE IF NOT EXISTS `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_data`
--

CREATE TABLE IF NOT EXISTS `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_fields`
--

CREATE TABLE IF NOT EXISTS `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_groups`
--

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_fieldtypes`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_upload_prefs`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES
(1, 1, 'Super Admins', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', 'y'),
(2, 1, 'Banned', '', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '', 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(3, 1, 'Guests', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(4, 1, 'Pending', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(5, 1, 'Members', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'n', '', 'y', 'n', 'y', 10, 'y', 20, 60, 'y', 'n', 'n', 'y', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_homepage`
--

CREATE TABLE IF NOT EXISTS `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_homepage`
--

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`) VALUES
(1, 'l', 1, 'l', 2, 'n', 0, 'r', 1, 'n', 0, 'r', 2, 'r', 0, 'l', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_search`
--

CREATE TABLE IF NOT EXISTS `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_attachments`
--

CREATE TABLE IF NOT EXISTS `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_copies`
--

CREATE TABLE IF NOT EXISTS `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_data`
--

CREATE TABLE IF NOT EXISTS `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_folders`
--

CREATE TABLE IF NOT EXISTS `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_message_folders`
--

INSERT INTO `exp_message_folders` (`member_id`, `folder1_name`, `folder2_name`, `folder3_name`, `folder4_name`, `folder5_name`, `folder6_name`, `folder7_name`, `folder8_name`, `folder9_name`, `folder10_name`) VALUES
(1, 'InBox', 'Sent', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_listed`
--

CREATE TABLE IF NOT EXISTS `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_modules`
--

CREATE TABLE IF NOT EXISTS `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  `settings` text,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`, `settings`) VALUES
(1, 'Comment', '2.3.1', 'y', 'n', NULL),
(2, 'Emoticon', '2.0', 'n', 'n', NULL),
(3, 'Jquery', '1.0', 'n', 'n', NULL),
(4, 'Rss', '2.0', 'n', 'n', NULL),
(5, 'Safecracker', '2.1', 'y', 'n', NULL),
(6, 'Search', '2.2.1', 'n', 'n', NULL),
(7, 'Channel', '2.0.1', 'n', 'n', NULL),
(8, 'Stats', '2.0', 'n', 'n', NULL),
(9, 'Rte', '1.0', 'y', 'n', NULL),
(10, 'Structure', '3.3.10', 'y', 'y', NULL),
(11, 'Seo_lite', '1.4.4', 'y', 'y', NULL),
(12, 'Snippetssync', '1.0.7', 'y', 'n', NULL),
(13, 'Editor', '3.1.4', 'y', 'n', NULL),
(14, 'Low_reorder', '2.2.1', 'y', 'n', NULL),
(15, 'Channel_videos', '3.1.3', 'y', 'n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_module_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_nsm_addon_settings`
--

CREATE TABLE IF NOT EXISTS `exp_nsm_addon_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(5) unsigned NOT NULL DEFAULT '1',
  `addon_id` varchar(255) NOT NULL,
  `settings` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_nsm_addon_settings`
--

INSERT INTO `exp_nsm_addon_settings` (`id`, `site_id`, `addon_id`, `settings`) VALUES
(1, 1, 'nsm_htaccess_generator', '{"enabled":"1","template":"# Apache configuration file\\n# httpd.apache.org\\/docs\\/2.2\\/mod\\/quickreference.html\\n\\n# Increase PHP Memory\\nphp_value memory_limit 128M\\nphp_value post_max_size 128M\\nphp_value upload_max_filesize 128M\\n\\n# Better website experience for IE users\\n# ----------------------------------------------------------------------\\n<IfModule mod_headers.c>\\n  Header set X-UA-Compatible \\"IE=Edge,chrome=1\\"\\n  # mod_headers can''t match by content-type, but we don''t want to send this header on *everything*...\\n  <FilesMatch \\"\\\\.(js|css|gif|png|jpe?g|pdf|xml|oga|ogg|m4a|ogv|mp4|m4v|webm|svg|svgz|eot|ttf|otf|woff|ico|webp|appcache|manifest|htc|crx|oex|xpi|safariextz|vcf)$\\" >\\n    Header unset X-UA-Compatible\\n  <\\/FilesMatch>\\n<\\/IfModule>\\n\\n# CORS-enabled images (@crossorigin)\\n# ----------------------------------------------------------------------\\n<IfModule mod_setenvif.c>\\n  <IfModule mod_headers.c>\\n    # mod_headers, y u no match by Content-Type?!\\n    <FilesMatch \\"\\\\.(gif|png|jpe?g|svg|svgz|ico|webp)$\\">\\n      SetEnvIf Origin \\":\\" IS_CORS\\n      Header set Access-Control-Allow-Origin \\"*\\" env=IS_CORS\\n    <\\/FilesMatch>\\n  <\\/IfModule>\\n<\\/IfModule>\\n\\n# Webfont access\\n# ----------------------------------------------------------------------\\n<IfModule mod_headers.c>\\n  <FilesMatch \\"\\\\.(ttf|ttc|otf|eot|woff|font.css)$\\">\\n    Header set Access-Control-Allow-Origin \\"*\\"\\n  <\\/FilesMatch>\\n<\\/IfModule>\\n\\n\\n# Proper MIME type for all files\\n# ----------------------------------------------------------------------\\n# JavaScript\\nAddType application\\/javascript         js jsonp\\nAddType application\\/json               json\\n# Audio\\nAddType audio\\/ogg                      oga ogg\\nAddType audio\\/mp4                      m4a f4a f4b\\n# Video\\nAddType video\\/ogg                      ogv\\nAddType video\\/mp4                      mp4 m4v f4v f4p\\nAddType video\\/webm                     webm\\nAddType video\\/x-flv                    flv\\n# SVG\\nAddType     image\\/svg+xml              svg svgz\\nAddEncoding gzip                       svgz\\n# Webfonts\\nAddType application\\/vnd.ms-fontobject  eot\\nAddType application\\/x-font-ttf         ttf ttc\\nAddType font\\/opentype                  otf\\nAddType application\\/x-font-woff        woff\\n# Assorted types\\nAddType image\\/x-icon                        ico\\nAddType image\\/webp                          webp\\nAddType text\\/cache-manifest                 appcache manifest\\nAddType text\\/x-component                    htc\\nAddType application\\/xml                     rss atom xml rdf\\nAddType application\\/x-chrome-extension      crx\\nAddType application\\/x-opera-extension       oex\\nAddType application\\/x-xpinstall             xpi\\nAddType application\\/octet-stream            safariextz\\nAddType application\\/x-web-app-manifest+json webapp\\nAddType text\\/x-vcard                        vcf\\nAddType application\\/x-shockwave-flash       swf\\nAddType text\\/vtt                            vtt\\n\\n# Gzip compression\\n# ----------------------------------------------------------------------\\n<IfModule mod_deflate.c>\\n  # Force deflate for mangled headers developer.yahoo.com\\/blogs\\/ydn\\/posts\\/2010\\/12\\/pushing-beyond-gzipping\\/\\n  <IfModule mod_setenvif.c>\\n    <IfModule mod_headers.c>\\n      SetEnvIfNoCase ^(Accept-EncodXng|X-cept-Encoding|X{15}|~{15}|-{15})$ ^((gzip|deflate)\\\\s*,?\\\\s*)+|[X~-]{4,13}$ HAVE_Accept-Encoding\\n      RequestHeader append Accept-Encoding \\"gzip,deflate\\" env=HAVE_Accept-Encoding\\n    <\\/IfModule>\\n  <\\/IfModule>\\n  # Compress all output labeled with one of the following MIME-types\\n  <IfModule mod_filter.c>\\n    AddOutputFilterByType DEFLATE application\\/atom+xml \\\\\\n                                  application\\/javascript \\\\\\n                                  application\\/json \\\\\\n                                  application\\/rss+xml \\\\\\n                                  application\\/vnd.ms-fontobject \\\\\\n                                  application\\/x-font-ttf \\\\\\n                                  application\\/xhtml+xml \\\\\\n                                  application\\/xml \\\\\\n                                  font\\/opentype \\\\\\n                                  image\\/svg+xml \\\\\\n                                  image\\/x-icon \\\\\\n                                  text\\/css \\\\\\n                                  text\\/html \\\\\\n                                  text\\/plain \\\\\\n                                  text\\/x-component \\\\\\n                                  text\\/xml\\n  <\\/IfModule>\\n<\\/IfModule>\\n\\n# Expires headers (for better cache control)\\n# ----------------------------------------------------------------------\\n\\n# These are pretty far-future expires headers.\\n# They assume you control versioning with filename-based cache busting\\n# Additionally, consider that outdated proxies may miscache\\n#   www.stevesouders.com\\/blog\\/2008\\/08\\/23\\/revving-filenames-dont-use-querystring\\/\\n\\n# If you don''t use filenames to version, lower the CSS and JS to something like\\n# \\"access plus 1 week\\".\\n\\n<IfModule mod_expires.c>\\n  ExpiresActive on\\n\\n# Perhaps better to whitelist expires rules? Perhaps.\\n  ExpiresDefault                          \\"access plus 1 month\\"\\n\\n# cache.appcache needs re-requests in FF 3.6 (thanks Remy ~Introducing HTML5)\\n  ExpiresByType text\\/cache-manifest       \\"access plus 0 seconds\\"\\n\\n# Your document html\\n  ExpiresByType text\\/html                 \\"access plus 0 seconds\\"\\n\\n# Data\\n  ExpiresByType text\\/xml                  \\"access plus 0 seconds\\"\\n  ExpiresByType application\\/xml           \\"access plus 0 seconds\\"\\n  ExpiresByType application\\/json          \\"access plus 0 seconds\\"\\n\\n# Feed\\n  ExpiresByType application\\/rss+xml       \\"access plus 1 hour\\"\\n  ExpiresByType application\\/atom+xml      \\"access plus 1 hour\\"\\n\\n# Favicon (cannot be renamed)\\n  ExpiresByType image\\/x-icon              \\"access plus 1 week\\"\\n\\n# Media: images, video, audio\\n  ExpiresByType image\\/gif                 \\"access plus 1 month\\"\\n  ExpiresByType image\\/png                 \\"access plus 1 month\\"\\n  ExpiresByType image\\/jpeg                \\"access plus 1 month\\"\\n  ExpiresByType video\\/ogg                 \\"access plus 1 month\\"\\n  ExpiresByType audio\\/ogg                 \\"access plus 1 month\\"\\n  ExpiresByType video\\/mp4                 \\"access plus 1 month\\"\\n  ExpiresByType video\\/webm                \\"access plus 1 month\\"\\n\\n# HTC files  (css3pie)\\n  ExpiresByType text\\/x-component          \\"access plus 1 month\\"\\n\\n# Webfonts\\n  ExpiresByType application\\/x-font-ttf    \\"access plus 1 month\\"\\n  ExpiresByType font\\/opentype             \\"access plus 1 month\\"\\n  ExpiresByType application\\/x-font-woff   \\"access plus 1 month\\"\\n  ExpiresByType image\\/svg+xml             \\"access plus 1 month\\"\\n  ExpiresByType application\\/vnd.ms-fontobject \\"access plus 1 month\\"\\n\\n# CSS and JavaScript\\n  ExpiresByType text\\/css                  \\"access plus 1 week\\"\\n  ExpiresByType application\\/javascript    \\"access plus 1 week\\"\\n\\n<\\/IfModule>\\n\\n\\n# ETag removal\\n# ----------------------------------------------------------------------\\n# FileETag None is not enough for every server.\\n<IfModule mod_headers.c>\\n  Header unset ETag\\n<\\/IfModule>\\n\\n# Since we''re sending far-future expires, we don''t need ETags for\\n# static content.\\n#   developer.yahoo.com\\/performance\\/rules.html#etags\\nFileETag None\\n\\n\\n# Stop screen flicker in IE on CSS rollovers\\n# ----------------------------------------------------------------------\\nBrowserMatch \\"MSIE\\" brokenvary=1\\nBrowserMatch \\"Mozilla\\/4.[0-9]{2}\\" brokenvary=1\\nBrowserMatch \\"Opera\\" !brokenvary\\nSetEnvIf brokenvary 1 force-no-vary\\n\\n\\n# Start rewrite engine\\n# ----------------------------------------------------------------------\\n# Although highly unlikely, your host may have +FollowSymLinks enabled at the root level,\\n# yet disallow its addition in .htaccess; in which case, \\n# adding +FollowSymLinks will break your setup (probably a 500 error), \\n# so just remove it, and your rules should work fine.\\nOptions +FollowSymlinks\\n# Options +SymLinksIfOwnerMatch\\n# Prevent 404 errors for non-existing redirected folders\\nOptions -MultiViews\\n\\n# EE 404 page for missing pages\\nErrorDocument 404 \\/index.php\\/{ee:404}\\n\\n# Simple 404 for missing files\\n<FilesMatch \\"(\\\\.jpe?g|gif|png|bmp|css|js|flv)$\\">\\n  ErrorDocument 404 \\"File Not Found\\"\\n<\\/FilesMatch>\\n\\n\\n# Rewriting will likely already be on, uncomment if it isnt\\n# <IfModule mod_rewrite.c>\\nRewriteEngine On\\n# RewriteBase \\/\\n# <\\/IfModule>\\n\\n# Block access to \\"hidden\\" directories whose names begin with a period. This\\n# includes directories used by version control systems such as Subversion or Git.\\n<IfModule mod_rewrite.c>\\n  RewriteRule \\"(^|\\/)\\\\.\\" - [F]\\n<\\/IfModule>\\n\\n# Suppress or force the \\"www.\\" at the beginning of URLs\\n# ----------------------------------------------------------------------\\n<IfModule mod_rewrite.c>\\n  RewriteCond %{HTTPS} !=on\\n  RewriteCond %{HTTP_HOST} ^www\\\\.(.+)$ [NC]\\n  RewriteRule ^ http:\\/\\/%1%{REQUEST_URI} [R=301,L]\\n<\\/IfModule>\\n\\n#Handle comment redirection \\nRewriteCond %{THE_REQUEST} !^POST \\n\\n# Prevent SSL cert warnings\\n# ----------------------------------------------------------------------\\n\\n# Rewrite secure requests properly to prevent SSL cert warnings, e.g. prevent\\n# https:\\/\\/www.example.com when your cert only allows https:\\/\\/secure.example.com\\n\\n# <IfModule mod_rewrite.c>\\n#   RewriteCond %{SERVER_PORT} !^443\\n#   RewriteRule ^ https:\\/\\/example-domain-please-change-me.com%{REQUEST_URI} [R=301,L]\\n# <\\/IfModule>\\n\\n\\n# ----------------------------------------------------------------------\\n# UTF-8 encoding\\n# ----------------------------------------------------------------------\\n\\n# Use UTF-8 encoding for anything served text\\/plain or text\\/html\\nAddDefaultCharset utf-8\\n\\n# Force UTF-8 for a number of file formats\\nAddCharset utf-8 .atom .css .js .json .rss .vtt .xml\\n\\n\\n\\n# ----------------------------------------------------------------------\\n# Custom redirects\\n# ----------------------------------------------------------------------\\nRedirect 301 \\/sitemap.xml http:\\/\\/maven20.com\\/pages\\/sitemap\\n\\n\\n# ----------------------------------------------------------------------\\n# A little more security\\n# ----------------------------------------------------------------------\\n\\n# To avoid displaying the exact version number of Apache being used, add the\\n# following to httpd.conf (it will not work in .htaccess):\\n# ServerTokens Prod\\n\\n# \\"-Indexes\\" will have Apache block users from browsing folders without a\\n# default document Usually you should leave this activated, because you\\n# shouldn''t allow everybody to surf through every folder on your server (which\\n# includes rather private places like CMS system folders).\\n<IfModule mod_autoindex.c>\\n  Options -Indexes\\n<\\/IfModule>\\n\\n# Block access to \\"hidden\\" directories or files whose names begin with a\\n# period. This includes directories used by version control systems such as\\n# Subversion or Git.\\n<IfModule mod_rewrite.c>\\n  RewriteCond %{SCRIPT_FILENAME} -d [OR]\\n  RewriteCond %{SCRIPT_FILENAME} -f\\n  RewriteRule \\"(^|\\/)\\\\.\\" - [F]\\n<\\/IfModule>\\n\\n# Block access to backup and source files. These files may be left by some\\n# text\\/html editors and pose a great security danger, when anyone can access\\n# them.\\n<FilesMatch \\"(\\\\.(bak|config|sql|fla|psd|ini|log|sh|inc|swp|dist)|~)$\\">\\n  Order allow,deny\\n  Deny from all\\n  Satisfy All\\n<\\/FilesMatch>\\n\\n# Increase cookie security\\n<IfModule php5_module>\\n  php_value session.cookie_httponly true\\n<\\/IfModule>\\n\\n# Remove the trailing slash to paths without an extension\\n# Uncomment to activate\\n<IfModule mod_rewrite.c>\\n  RewriteRule ^(.*)\\/$ \\/$1 [R=301,L]\\n<\\/IfModule>\\n\\n# Remove index.php\\n# Uses the \\"include method\\"\\n# http:\\/\\/expressionengine.com\\/wiki\\/Remove_index.php_From_URLs\\/#Include_List_Method\\n# <IfModule mod_rewrite.c>\\nRewriteCond %{QUERY_STRING} !^(ACT=.*)$ [NC]\\nRewriteCond %{REQUEST_URI} !(\\\\.[a-zA-Z0-9]{1,5})$\\nRewriteCond %{REQUEST_FILENAME} !-f\\nRewriteCond %{REQUEST_FILENAME} !-d\\nRewriteCond %{REQUEST_URI} ^\\/({ee:template_groups}{ee:pages}members|P[0-9]{2,8}) [NC]\\nRewriteRule (.*) \\/index.php\\/$1 [L]"}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_online_users`
--

CREATE TABLE IF NOT EXISTS `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_password_lockout`
--

CREATE TABLE IF NOT EXISTS `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_password_lockout`
--

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`) VALUES
(1, 1375826867, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.41 Safari/537.36', 'longdao'),
(2, 1376412634, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.49 Safari/537.36', 'admin'),
(3, 1377118443, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', 'longdao');

-- --------------------------------------------------------

--
-- Table structure for table `exp_ping_servers`
--

CREATE TABLE IF NOT EXISTS `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL DEFAULT '80',
  `ping_protocol` varchar(12) NOT NULL DEFAULT 'xmlrpc',
  `is_default` char(1) NOT NULL DEFAULT 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_relationships`
--

CREATE TABLE IF NOT EXISTS `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_remember_me`
--

CREATE TABLE IF NOT EXISTS `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_reset_password`
--

CREATE TABLE IF NOT EXISTS `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_revision_tracker`
--

CREATE TABLE IF NOT EXISTS `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_tools`
--

CREATE TABLE IF NOT EXISTS `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exp_rte_tools`
--

INSERT INTO `exp_rte_tools` (`tool_id`, `name`, `class`, `enabled`) VALUES
(1, 'Blockquote', 'Blockquote_rte', 'y'),
(2, 'Bold', 'Bold_rte', 'y'),
(3, 'Headings', 'Headings_rte', 'y'),
(4, 'Image', 'Image_rte', 'y'),
(5, 'Italic', 'Italic_rte', 'y'),
(6, 'Link', 'Link_rte', 'y'),
(7, 'Ordered List', 'Ordered_list_rte', 'y'),
(8, 'Underline', 'Underline_rte', 'y'),
(9, 'Unordered List', 'Unordered_list_rte', 'y'),
(10, 'View Source', 'View_source_rte', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_toolsets`
--

CREATE TABLE IF NOT EXISTS `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_rte_toolsets`
--

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`) VALUES
(1, 0, 'Default', '3|2|5|1|9|7|6|4|10', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_search`
--

CREATE TABLE IF NOT EXISTS `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_search_log`
--

CREATE TABLE IF NOT EXISTS `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_security_hashes`
--

CREATE TABLE IF NOT EXISTS `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2964 ;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`) VALUES
(2866, 1377213902, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'e13ea498fcaeccc0966ceb913d0010e476047f6d'),
(2862, 1377213900, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '9f4c40f3d3e9ebb4fb080cf0dd1f467a853f8af7'),
(2863, 1377213902, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'd05860e861722049838ac5502f8f069261aa54c4'),
(2864, 1377213902, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '4deb062a44efc63a81de828860d794dbe0d5313e'),
(2865, 1377213902, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '6ad3b7953c3fca754a6bffafddecde8c33018a3a'),
(2807, 1377209325, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'cfba7ff94cd727074254cf46777224b649f6ad5c'),
(2808, 1377209326, '0a0610034613c6896ffecb05620fdb3208b4aa5e', '7802e82f8e11a262eba11d408f00f36e130954ca'),
(2809, 1377209327, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'c286baf31bfb03f6f62096cbc4846f367a0743e9'),
(2810, 1377209328, '0a0610034613c6896ffecb05620fdb3208b4aa5e', '68a06284fc4825f9655f80566d6256f42f632ab0'),
(2811, 1377209329, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'c1b8989480ea9b829bc009a0660cd7fd801044a8'),
(2820, 1377212986, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '198e3b355f114216ff3499cbc933e3f4b89d775b'),
(2821, 1377213067, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '470664ce76255e0bcc20aa44c78d58c4a3676354'),
(2822, 1377213089, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '5cfae92ea436fd7eb220b8ea90ab197f6297eb2c'),
(2823, 1377213091, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'd03ea99a2328894389519d2cc9852bf3191e18b4'),
(2824, 1377213091, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'bbf8f35bbfc5f448b4abba4ff69b9f355ed4a1f4'),
(2826, 1377213120, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '79c932d18f7e398a15012c9535be980e4f3d6b34'),
(2827, 1377213121, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '2040e3799b828088eef22d8a2e1ef5f98128ee36'),
(2846, 1377213712, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'cc415220fb3e1b1372b95a0edfa344a6bf1c2b00'),
(2829, 1377213199, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '07c5502fa7c8b0956d14f0d7730cdd249fad79ee'),
(2830, 1377213199, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'cdaf7b92b0244d4789ab43c9ae0daa2d166fd4c5'),
(2831, 1377213200, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'a3eaca7e78084ed4228b33f2d88f866fa49038fc'),
(2832, 1377213201, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '867ebf12eaf4639e77bc1f330ae21ef581c5796a'),
(2833, 1377213405, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'cfe51b98a51894a3fa005cec74e1bdb3dced1d58'),
(2835, 1377213420, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '01921a9886c2aef75f079fb9c80430cd9be751f8'),
(2836, 1377213423, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'c9733dcb9cc35c6251923ba14bafc3623c4426a5'),
(2837, 1377213423, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '0ae5a89fd1166106490446b83516e4895104ad5e'),
(2838, 1377213423, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '5498f447f1c1a2cb0e663a329dc824849d96bba2'),
(2839, 1377213423, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'd6b3741cb1b8c55ee870000a5bdeaed55621c811'),
(2841, 1377213606, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '153afd9148cbab5e1d3386f88d0554d644c704bf'),
(2842, 1377213608, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '5c1c461afd180318851661a45b07f3728a109a0e'),
(2843, 1377213608, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'ebe2dd63b36694242d0aa10bc29159d673a50c3c'),
(2844, 1377213608, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '06efb666b75b9ed76501671fa2811ddc918c56c1'),
(2845, 1377213608, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '06f5d06f81076c994d0d2620d7ee9f85cd21c2d7'),
(2847, 1377213714, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '9ae0a10a8d1f0faa77175f06b13f24d38caf3da3'),
(2848, 1377213715, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '15697aa3a2a23dc387e250206f7be6175864527c'),
(2867, 1377213997, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'be40006d1452e295a8f7efb70cd9ccd972f5794e'),
(2850, 1377213752, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '029737f743fccb4c58c271faf7f0c0aef7d67be9'),
(2851, 1377213752, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '54f950332bb369f4d4238fec955650112342d6ab'),
(2852, 1377213752, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '01e48371305aeae450024f156e171429b838eb8e'),
(2853, 1377213754, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '0f795a978c89586dd59c2dadba902835a122a54d'),
(2854, 1377213766, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'f81c6880b37198a6e5e354d2d84f552ff118eb34'),
(2856, 1377213771, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'fd75e2f5a804860d4828885de032cd3297c1f607'),
(2857, 1377213773, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '59163b033b43b870f226c6d912f799997a470e63'),
(2858, 1377213773, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '9ba1aefa436b4ce3dd30046db1f44757b8f1da2b'),
(2859, 1377213773, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '28a0f1bb3112098cfcbaf609a201a6af3626851d'),
(2860, 1377213773, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '12ac714036101ac42474eda13c4777f7f09c7429'),
(2806, 1377209324, '0a0610034613c6896ffecb05620fdb3208b4aa5e', '549b2096eecdcd5601be5c64cb6d12a53a537e2e'),
(2788, 1377209096, '0', 'e4dea534af1e36f039dea4d0759e559e7b138265'),
(2787, 1377209094, 'af137c57c00c07b7988dc84b6970edb516d23bd2', 'a78436e84e990c1d0064296f64886662bcfd5b59'),
(2778, 1377209064, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '4a83263d89e1f0975cbd3e2f9bd85848daa2734f'),
(2779, 1377209065, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '0b327c5b023e2da4121f8a853e1f0118862a52da'),
(2780, 1377209084, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '642033cb12986f956a8cd675c864acb4b68e8152'),
(2781, 1377209086, 'af137c57c00c07b7988dc84b6970edb516d23bd2', 'bb7b8abf70c8cad9934bda032e46a91ce544b351'),
(2782, 1377209087, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '4a44de86a8aff1189c034ca7cdde143b4a2ccccb'),
(2783, 1377209089, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '79f4c3e36aa589e70dc524d13e47e1a468758b13'),
(2784, 1377209089, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '33e2a330b8088a0dd21fb551cf3cee1231052889'),
(2785, 1377209090, 'af137c57c00c07b7988dc84b6970edb516d23bd2', 'd4015bec28bb9d5ae7a5cadc84a16ca6d98554d0'),
(2786, 1377209090, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '75de19a8728d43973f03d391e5bf237abf226c27'),
(2766, 1377208481, 'af137c57c00c07b7988dc84b6970edb516d23bd2', 'fd78c0342d099ebb255edc38ba103edfff34a83c'),
(2767, 1377208482, 'af137c57c00c07b7988dc84b6970edb516d23bd2', 'c43463ecbf35b00c883d1d807b78195b56de2f5c'),
(2768, 1377209049, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '1ee551a63a19be68354fa1ff5f5c66c2bceaaf79'),
(2769, 1377209050, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '822bb57e9a79131879089d2a8f48a9c530eb18b2'),
(2770, 1377209051, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '3c0570384966865795c5d080443c7aaa9d3dd670'),
(2771, 1377209053, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '8069ea86816c7d5ec6c77e8a0123e76cd369de4b'),
(2772, 1377209053, 'af137c57c00c07b7988dc84b6970edb516d23bd2', 'd56881536fe4c77d0485742209899529927e3b96'),
(2773, 1377209055, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '0ebc50e830abe0931b4feb9b5af34939c262c48d'),
(2774, 1377209056, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '68b76e607f9d54686e416c9b7f4ac0f610198cca'),
(2777, 1377209063, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '5ce918b759627a405a550108aef1bfc6f1dac7e2'),
(2776, 1377209059, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '8cd333083b1e52ccbd5e5c93b319243cf01fb3c6'),
(2868, 1377213999, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'd73a1b7e20f21ffe95298f263e198a510ed61ddc'),
(2869, 1377214000, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '7f2a64950422ce6e870f86152e8a708c3333e544'),
(2896, 1377214346, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'c8785d46e8d52f73fb91278fc9db8f716f3fee40'),
(2871, 1377214038, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'e697fd76bac1f0a071dcb0f5301413e01354e0e0'),
(2765, 1377208480, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '42c1df8b981fca1aafbf5b6501f2d397c02454ef'),
(2764, 1377208474, 'af137c57c00c07b7988dc84b6970edb516d23bd2', '40933c6a127c306534656c49e31adae36ddb5a3c'),
(2906, 1377214472, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '8b9889c1ba65e382bf2e75f642b873122f5c9317'),
(2904, 1377214460, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '8858417e28c5ea06c2bb99185e2a79b4444044b4'),
(2903, 1377214442, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '8ef45a9d5c4a00df9265dd07bcfe4bddaa859a2a'),
(2902, 1377214441, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'c0a18c1d3457e118e1caabe5e3b5b77ca99ca957'),
(2901, 1377214440, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '3e04addcddf7218eafb0dd99e610e1beeb457156'),
(2900, 1377214440, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'a5ddb03ed7185b2df43770923adada119a1f390c'),
(2934, 1377215235, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '41e1230b3b4cdadc34f59e50022b9f7ffc384bb2'),
(2898, 1377214349, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '35afb94b62af8deb799808cd093266914efe857a'),
(2897, 1377214348, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '04feb011162d84250df99cce784d316d18fd0419'),
(2895, 1377214264, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'a53fa8556e67416fc4417379bfe4d435dc35ba4b'),
(2894, 1377214264, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '2cf43b66e6a977ac793509ffd2a5ed704f7fc797'),
(2891, 1377214263, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '9f7d8df1c5ba1381d0b69e07ba377f61903d23d0'),
(2892, 1377214264, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '4d2d00d8d36ffe6cd41d215ced261e1fb2787e74'),
(2889, 1377214225, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '4697b48660a6e273c7df011a2ff6149ac9b0cece'),
(2893, 1377214264, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '9126cf8a6dd05c3b14c9bcc798c0cd5e0783ed73'),
(2888, 1377214176, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '76481f4d0402d0466921c755557f1d5e9b88c147'),
(2887, 1377214176, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '0c2592d571a9c768e0b5263fdc1460c1b2a39b0a'),
(2886, 1377214176, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'eaa8dbdf3df0f84e8993857e8cb0635d8f321666'),
(2885, 1377214176, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '90928574ca1c4a4fb92c3ce198d97ff2b1ba9f2c'),
(2884, 1377214175, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '5436da7c2d3580026c71e32c60bd33dca3337882'),
(2882, 1377214114, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'ce0d32b25d9d73d82f98d92f669a239f879e90e5'),
(2881, 1377214067, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'cc50c5a8a78f3e749501b1ff22c24e4ca9c05d9d'),
(2880, 1377214067, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'cdfc1b0af1b66b40314db83b07e79c76aa330367'),
(2879, 1377214067, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'beb6a443acbbaa6157e8d3a69617174362b32d36'),
(2878, 1377214067, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '53a3a2966f11f7aeb1981a2211fa2c0048c179f4'),
(2877, 1377214063, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '2297225aa71ecc33a5224abc51ee0cbfd47b149f'),
(2875, 1377214057, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'afdbef6069cc7e0677b9e953e8df41dca3510e3a'),
(2874, 1377214040, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '0c9bb04d7aabd6064deb085bd2098e540f99aee3'),
(2873, 1377214038, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '795940467dbee44f8ce49552390cb3433a7bf6a8'),
(2872, 1377214038, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '8f5b465bfd82285deb15e0bcbfe4bdc15a0896ab'),
(2962, 1377215619, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'c83f026830bbdb664af880ebacaedd9fb0fd8575'),
(2963, 1377215620, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'c1b0eb04aad86d6e7aba10d2b89694a126ed338c'),
(2953, 1377215560, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '9af70b90be1134dcbd79602cf7f7949c282a8103'),
(2954, 1377215562, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '2295648eb8fc3e053c5013d8b88a41b3a565824c'),
(2961, 1377215612, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '95c01839f78a325bc87e27cc4bb18af9153f9cc1'),
(2956, 1377215596, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'd1ed7dc5b36e8652bc186262fcc26438519d070c'),
(2957, 1377215596, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'b0e966d7c561baf416d0aaef51d85ac7771ec612'),
(2958, 1377215596, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'd11eaa4007eb7c9808e01593730e010ef69a3711'),
(2959, 1377215597, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '7c9a3ba8a363ebd761aacfcdea1df19d756bcddd'),
(2960, 1377215597, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'acc246ca87325713d3164a55cf03fac9267a2756'),
(2935, 1377215236, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '4b7ae15867f8806e671417369445290c32d0af83'),
(2936, 1377215236, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '28da9d090629c518858b986f71f33d14f55f9751'),
(2937, 1377215236, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'fc19b29a8e756ddaf6b3f4ee7463bfa250685f91'),
(2938, 1377215268, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'e83ce284b1645c5089f0ffcdd88dc706ef72a23a'),
(2948, 1377215293, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '8af48b79e2c6dfb1a45d52e93294df15b62dbd6d'),
(2949, 1377215293, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '66ced500c6c56fa71c3db77cceb490ac6d727531'),
(2950, 1377215293, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '819d2b08a2917cdebfdee267b4e0c53a90c5b6cb'),
(2951, 1377215321, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '410f4596175e2abbc27a78849536ba3462f2b96e'),
(2819, 1377212986, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '15a3eb35ed76957a4e25c1a9e771fe5b6201b0b4'),
(2818, 1377212985, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'd3e5c9484a4f3c0781707d3500952152cdd0e87f'),
(2817, 1377212985, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'b5961d06558549e7a3f7e899ba567ad8cf7df122'),
(2825, 1377213119, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '428d33248386c02c5fb72f9999e339e66e10dd76'),
(2815, 1377212983, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '842a249289551d1e8eb767b78725562fbe9bf82e'),
(2814, 1377212982, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '5902b886dea1a3b7b842dfb56beb34cb8d379aa6'),
(2813, 1377212981, '0', '0250dba230e2bda5ac385c1b7d9618417c3dee3e'),
(2800, 1377209171, '0a0610034613c6896ffecb05620fdb3208b4aa5e', '08fdc56bdbc4a9bc13f4a53242b2c243dd057092'),
(2801, 1377209180, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'a869489a5d0792f7e1e4cdc7aa704b490527ff57'),
(2802, 1377209182, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'abf074bc13dea194ddf5b278d06ef67dc0e9cf8a'),
(2803, 1377209182, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'a38cb032eeac7768dcd916fd1abf8e4e974c0d7f'),
(2804, 1377209184, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'ed3e5712f093796455dc47ebf206032e54ebfcb4'),
(2799, 1377209170, '0a0610034613c6896ffecb05620fdb3208b4aa5e', '959c9dc5ee92014c35718726bc26205cfd6e97ec'),
(2790, 1377209131, '0', 'cc6d66dac251d1e244a1ab66483c462da6d56c1f'),
(2791, 1377209131, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'e0d0bb3e59d9047d67a1d15fc2e0cd0fec7f05ca'),
(2792, 1377209132, '0a0610034613c6896ffecb05620fdb3208b4aa5e', '4dd1685e1d202d1f60be08a4e839ce4c339722ce'),
(2798, 1377209169, '0a0610034613c6896ffecb05620fdb3208b4aa5e', '8596d6b3b88b9c1cb147da3f5b4dd25ca99da1a4'),
(2794, 1377209135, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'a33cbc9a47f7f4d712610fc402840cbd3677415f'),
(2795, 1377209135, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'c50216d443bed009c18dc0b54b2a9a28eaf0930d'),
(2796, 1377209136, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'bfb657f1df43b3e57b959c5a23c6ba40f5163f97'),
(2797, 1377209137, '0a0610034613c6896ffecb05620fdb3208b4aa5e', 'bbed9e3ff5c9542348bc7c422f583120375fdb23'),
(2805, 1377209184, '0a0610034613c6896ffecb05620fdb3208b4aa5e', '91fa4d2e9cb009e9fff7e61f57e7a2ff2c23664f'),
(2916, 1377214572, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '76af0806fe9e0a162e0cc8baa1cc591b6c7bb07b'),
(2915, 1377214572, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '632d358f751c5d6279f46e8f2e3190131489e17e'),
(2910, 1377214474, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'e64d01c328b2e2210a1f23d81f5b6043e2b90a50'),
(2909, 1377214474, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'cbec57e9f8c9c7d27940693421565b806fc8a804'),
(2908, 1377214474, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '2bb88a261bd16882a23eb9e3e4cf0529d60269bd'),
(2907, 1377214474, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '854f921b2704144cf13e39c705087e8b82333d0a'),
(2947, 1377215293, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'c4d434fcaaa0862ab75a601af7b3f5cd588374d2'),
(2946, 1377215291, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '4ed598b201cf1e87f57b35457f496185236615aa'),
(2944, 1377215277, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'a646a6813b4bf167464f94cd04b26d06c7b7fdeb'),
(2943, 1377215277, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '1b9d81b76e4224eff93ef4b5073d1bf65a4a9357'),
(2942, 1377215277, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '16c54485b4099ad48d062e8eaa1489a5fabbfd4f'),
(2941, 1377215277, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'b2854445b755046dd84125927f3f26404df6e747'),
(2940, 1377215276, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '7f4d4901227b937e041dab1ec63beeeba03eac58'),
(2933, 1377215235, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'b2f1dce807c4a50789e31d6e450ecc78087d74d1'),
(2952, 1377215553, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '141f006f0a5cc1fd162e29da3bdf570461871ae6'),
(2931, 1377214818, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '07fdc89a4888634e65f8f14559efc962302b7750'),
(2930, 1377214817, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'e558ac44dfb9deb604cbba734612a3f9cf97080a'),
(2929, 1377214811, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '147f8593797dba8268d773d30fbc4ced5bba8e86'),
(2928, 1377214737, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '603612555453014c3e1502db5bb953720e1f0fe8'),
(2927, 1377214737, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '4a73b2af521a509a8d11a096f6dae1e0f85fb223'),
(2926, 1377214737, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'dfaa2455467eb8bfb421406388ae376b04487f3e'),
(2925, 1377214737, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'f89f935f780ce37cedf47b20babd469b214418f9'),
(2924, 1377214735, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'ae2bfab7ca615f06fb4bfafdd89a442dc8f320e5'),
(2922, 1377214655, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '146958d46b712d658c95cb7df6e1ef924dd89227'),
(2921, 1377214655, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '350639de131a195325a20750c62b30df8933f6a8'),
(2920, 1377214655, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '73310ef294e4e9a5910e3287832e3211ab244d33'),
(2919, 1377214655, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '22dd4fd1fdb2bd9a3796a94dc335d61619d21361'),
(2918, 1377214653, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '611b72f2c63fd74b41c377b3d48e54ade0b1a096'),
(2914, 1377214572, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '13acd8b0bc09a5667ca2b9e69a220b95a8ff40c4'),
(2913, 1377214572, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', 'da8970087934877f6abd0220cbfad7da1b5f2805'),
(2912, 1377214570, 'f232cabf9a9784d83ba6cdbc50243e975411af8a', '3301ce997aadadc3d588dcb588a554ae90ebeb61');

-- --------------------------------------------------------

--
-- Table structure for table `exp_seolite_config`
--

CREATE TABLE IF NOT EXISTS `exp_seolite_config` (
  `seolite_config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned DEFAULT NULL,
  `template` text,
  `default_keywords` varchar(1024) NOT NULL,
  `default_description` varchar(1024) NOT NULL,
  `default_title_postfix` varchar(60) NOT NULL,
  PRIMARY KEY (`seolite_config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_seolite_config`
--

INSERT INTO `exp_seolite_config` (`seolite_config_id`, `site_id`, `template`, `default_keywords`, `default_description`, `default_title_postfix`) VALUES
(1, 1, '<title>{title}{site_name}</title>\n<meta name=''keywords'' content=''{meta_keywords}'' />\n<meta name=''description'' content=''{meta_description}'' />\n<link rel=''canonical'' href=''{canonical_url}'' />\n<!-- generated by seo_lite -->', 'your, default, keywords, here', 'Your default description here', ' |&nbsp;');

-- --------------------------------------------------------

--
-- Table structure for table `exp_seolite_content`
--

CREATE TABLE IF NOT EXISTS `exp_seolite_content` (
  `seolite_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) NOT NULL,
  `entry_id` int(10) NOT NULL,
  `title` varchar(1024) DEFAULT NULL,
  `keywords` varchar(1024) NOT NULL,
  `description` text,
  PRIMARY KEY (`seolite_content_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `exp_seolite_content`
--

INSERT INTO `exp_seolite_content` (`seolite_content_id`, `site_id`, `entry_id`, `title`, `keywords`, `description`) VALUES
(1, 1, 1, '', '', ''),
(4, 1, 4, '', '', ''),
(3, 1, 3, '', '', ''),
(5, 1, 5, '', '', ''),
(6, 1, 6, '', '', ''),
(7, 1, 7, '', '', ''),
(8, 1, 8, '', '', ''),
(9, 1, 9, '', '', ''),
(10, 1, 10, '', '', ''),
(11, 1, 11, '', '', ''),
(12, 1, 12, '', '', ''),
(13, 1, 13, '', '', ''),
(14, 1, 14, '', '', ''),
(15, 1, 15, '', '', ''),
(16, 1, 16, '', '', ''),
(17, 1, 17, '', '', ''),
(18, 1, 18, '', '', ''),
(19, 1, 19, '', '', ''),
(20, 1, 20, '', '', ''),
(21, 1, 21, '', '', ''),
(22, 1, 22, '', '', ''),
(23, 1, 23, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sessions`
--

CREATE TABLE IF NOT EXISTS `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `fingerprint` varchar(40) NOT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `fingerprint`, `sess_start`, `last_activity`) VALUES
('f232cabf9a9784d83ba6cdbc50243e975411af8a', 1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.10 Safari/537.36', '85f26a3e2aa02451053fa67b8da0f9f8', 1377212981, 1377215629);

-- --------------------------------------------------------

--
-- Table structure for table `exp_sites`
--

CREATE TABLE IF NOT EXISTS `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` longtext,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_mailinglist_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`, `site_pages`) VALUES
(1, 'Partners for Better Health', 'default_site', NULL, 'YTo5MDp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbC5wNGJoZWFsdGgub3JnLyI7czoxNjoidGhlbWVfZm9sZGVyX3VybCI7czozNDoiaHR0cDovL2xvY2FsLnA0YmhlYWx0aC5vcmcvdGhlbWVzLyI7czoxNToid2VibWFzdGVyX2VtYWlsIjtzOjE5OiJzdXBwb3J0QG1hdmVuMjAuY29tIjtzOjE0OiJ3ZWJtYXN0ZXJfbmFtZSI7czowOiIiO3M6MjA6ImNoYW5uZWxfbm9tZW5jbGF0dXJlIjtzOjc6ImNoYW5uZWwiO3M6MTA6Im1heF9jYWNoZXMiO3M6MzoiMTUwIjtzOjExOiJjYXB0Y2hhX3VybCI7czo0MzoiaHR0cDovL2xvY2FsLnA0YmhlYWx0aC5vcmcvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjI3OiJJOlxnaXRcUEJIXGltYWdlc1xjYXB0Y2hhc1wiO3M6MTI6ImNhcHRjaGFfZm9udCI7czoxOiJ5IjtzOjEyOiJjYXB0Y2hhX3JhbmQiO3M6MToieSI7czoyMzoiY2FwdGNoYV9yZXF1aXJlX21lbWJlcnMiO3M6MToibiI7czoxNzoiZW5hYmxlX2RiX2NhY2hpbmciO3M6MToibiI7czoxODoiZW5hYmxlX3NxbF9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImZvcmNlX3F1ZXJ5X3N0cmluZyI7czoxOiJuIjtzOjEzOiJzaG93X3Byb2ZpbGVyIjtzOjE6Im4iO3M6MTg6InRlbXBsYXRlX2RlYnVnZ2luZyI7czoxOiJuIjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czoxNzoidXNlcl9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoxODoiYWRtaW5fc2Vzc2lvbl90eXBlIjtzOjI6ImNzIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjc6InJlZnJlc2giO3M6OToiZGVmdF9sYW5nIjtzOjc6ImVuZ2xpc2giO3M6ODoieG1sX2xhbmciO3M6MjoiZW4iO3M6MTI6InNlbmRfaGVhZGVycyI7czoxOiJ5IjtzOjExOiJnemlwX291dHB1dCI7czoxOiJuIjtzOjEzOiJsb2dfcmVmZXJyZXJzIjtzOjE6Im4iO3M6MTM6Im1heF9yZWZlcnJlcnMiO3M6MzoiNTAwIjtzOjExOiJ0aW1lX2Zvcm1hdCI7czoyOiJ1cyI7czoxNToic2VydmVyX3RpbWV6b25lIjtzOjE5OiJBbWVyaWNhL0xvc19BbmdlbGVzIjtzOjEzOiJzZXJ2ZXJfb2Zmc2V0IjtzOjA6IiI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjE5OiJBbWVyaWNhL0xvc19BbmdlbGVzIjtzOjE1OiJob25vcl9lbnRyeV9kc3QiO3M6MToieSI7czoxMzoibWFpbF9wcm90b2NvbCI7czo0OiJtYWlsIjtzOjExOiJzbXRwX3NlcnZlciI7czowOiIiO3M6MTM6InNtdHBfdXNlcm5hbWUiO3M6MDoiIjtzOjEzOiJzbXRwX3Bhc3N3b3JkIjtzOjA6IiI7czoxMToiZW1haWxfZGVidWciO3M6MToibiI7czoxMzoiZW1haWxfY2hhcnNldCI7czo1OiJ1dGYtOCI7czoxNToiZW1haWxfYmF0Y2htb2RlIjtzOjE6Im4iO3M6MTY6ImVtYWlsX2JhdGNoX3NpemUiO3M6MDoiIjtzOjExOiJtYWlsX2Zvcm1hdCI7czo1OiJwbGFpbiI7czo5OiJ3b3JkX3dyYXAiO3M6MToieSI7czoyMjoiZW1haWxfY29uc29sZV90aW1lbG9jayI7czoxOiI1IjtzOjIyOiJsb2dfZW1haWxfY29uc29sZV9tc2dzIjtzOjE6InkiO3M6ODoiY3BfdGhlbWUiO3M6NzoiZGVmYXVsdCI7czoyMToiZW1haWxfbW9kdWxlX2NhcHRjaGFzIjtzOjE6Im4iO3M6MTY6ImxvZ19zZWFyY2hfdGVybXMiO3M6MToieSI7czoxMjoic2VjdXJlX2Zvcm1zIjtzOjE6InkiO3M6MTk6ImRlbnlfZHVwbGljYXRlX2RhdGEiO3M6MToieSI7czoyNDoicmVkaXJlY3Rfc3VibWl0dGVkX2xpbmtzIjtzOjE6Im4iO3M6MTY6ImVuYWJsZV9jZW5zb3JpbmciO3M6MToibiI7czoxNDoiY2Vuc29yZWRfd29yZHMiO3M6MDoiIjtzOjE4OiJjZW5zb3JfcmVwbGFjZW1lbnQiO3M6MDoiIjtzOjEwOiJiYW5uZWRfaXBzIjtzOjA6IiI7czoxMzoiYmFubmVkX2VtYWlscyI7czowOiIiO3M6MTY6ImJhbm5lZF91c2VybmFtZXMiO3M6MDoiIjtzOjE5OiJiYW5uZWRfc2NyZWVuX25hbWVzIjtzOjA6IiI7czoxMDoiYmFuX2FjdGlvbiI7czo4OiJyZXN0cmljdCI7czoxMToiYmFuX21lc3NhZ2UiO3M6MzQ6IlRoaXMgc2l0ZSBpcyBjdXJyZW50bHkgdW5hdmFpbGFibGUiO3M6MTU6ImJhbl9kZXN0aW5hdGlvbiI7czoyMToiaHR0cDovL3d3dy55YWhvby5jb20vIjtzOjE2OiJlbmFibGVfZW1vdGljb25zIjtzOjE6InkiO3M6MTI6ImVtb3RpY29uX3VybCI7czo0MjoiaHR0cDovL2xvY2FsLnA0YmhlYWx0aC5vcmcvaW1hZ2VzL3NtaWxleXMvIjtzOjE5OiJyZWNvdW50X2JhdGNoX3RvdGFsIjtzOjQ6IjEwMDAiO3M6MTc6Im5ld192ZXJzaW9uX2NoZWNrIjtzOjE6InkiO3M6MTc6ImVuYWJsZV90aHJvdHRsaW5nIjtzOjE6Im4iO3M6MTc6ImJhbmlzaF9tYXNrZWRfaXBzIjtzOjE6InkiO3M6MTQ6Im1heF9wYWdlX2xvYWRzIjtzOjI6IjEwIjtzOjEzOiJ0aW1lX2ludGVydmFsIjtzOjE6IjgiO3M6MTI6ImxvY2tvdXRfdGltZSI7czoyOiIzMCI7czoxNToiYmFuaXNobWVudF90eXBlIjtzOjc6Im1lc3NhZ2UiO3M6MTQ6ImJhbmlzaG1lbnRfdXJsIjtzOjA6IiI7czoxODoiYmFuaXNobWVudF9tZXNzYWdlIjtzOjUwOiJZb3UgaGF2ZSBleGNlZWRlZCB0aGUgYWxsb3dlZCBwYWdlIGxvYWQgZnJlcXVlbmN5LiI7czoxNzoiZW5hYmxlX3NlYXJjaF9sb2ciO3M6MToieSI7czoxOToibWF4X2xvZ2dlZF9zZWFyY2hlcyI7czozOiI1MDAiO3M6MTc6InRoZW1lX2ZvbGRlcl9wYXRoIjtzOjI3OiJJOi9naXQvUEJIL2h0dHBkb2NzL3RoZW1lcy8iO3M6MTA6ImlzX3NpdGVfb24iO3M6MToieSI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjt9', 'YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==', 'YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6NDI6Imh0dHA6Ly9sb2NhbC5wNGJoZWFsdGgub3JnL2ltYWdlcy9hdmF0YXJzLyI7czoxMToiYXZhdGFyX3BhdGgiO3M6MjY6Ikk6XGdpdFxQQkhcaW1hZ2VzXGF2YXRhcnNcIjtzOjE2OiJhdmF0YXJfbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNzoiYXZhdGFyX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEzOiJhdmF0YXJfbWF4X2tiIjtzOjI6IjUwIjtzOjEzOiJlbmFibGVfcGhvdG9zIjtzOjE6Im4iO3M6OToicGhvdG9fdXJsIjtzOjQ4OiJodHRwOi8vbG9jYWwucDRiaGVhbHRoLm9yZy9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTA6InBob3RvX3BhdGgiO3M6MzI6Ikk6XGdpdFxQQkhcaW1hZ2VzXG1lbWJlcl9waG90b3NcIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjI6IjUwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6InkiO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6NTY6Imh0dHA6Ly9sb2NhbC5wNGJoZWFsdGgub3JnL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjEyOiJzaWdfaW1nX3BhdGgiO3M6NDA6Ikk6XGdpdFxQQkhcaW1hZ2VzXHNpZ25hdHVyZV9hdHRhY2htZW50c1wiO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czozMzoiSTpcZ2l0XFBCSFxpbWFnZXNccG1fYXR0YWNobWVudHNcIjtzOjIzOiJwcnZfbXNnX21heF9hdHRhY2htZW50cyI7czoxOiIzIjtzOjIyOiJwcnZfbXNnX2F0dGFjaF9tYXhzaXplIjtzOjM6IjI1MCI7czoyMDoicHJ2X21zZ19hdHRhY2hfdG90YWwiO3M6MzoiMTAwIjtzOjE5OiJwcnZfbXNnX2h0bWxfZm9ybWF0IjtzOjQ6InNhZmUiO3M6MTg6InBydl9tc2dfYXV0b19saW5rcyI7czoxOiJ5IjtzOjE3OiJwcnZfbXNnX21heF9jaGFycyI7czo0OiI2MDAwIjtzOjE5OiJtZW1iZXJsaXN0X29yZGVyX2J5IjtzOjExOiJ0b3RhbF9wb3N0cyI7czoyMToibWVtYmVybGlzdF9zb3J0X29yZGVyIjtzOjQ6ImRlc2MiO3M6MjA6Im1lbWJlcmxpc3Rfcm93X2xpbWl0IjtzOjI6IjIwIjt9', 'YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJ5IjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6Im4iO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czoxOiJcIjt9', 'YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=', 'YToxOntzOjI5OiJJOlxnaXRcUEJIXGh0dHBkb2NzXGluZGV4LnBocCI7czozMjoiZjM5MzU3ZTVlZDNhZjc4N2FiNWFmMjQzYTg5YjIwNmUiO30=', 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyNzoiaHR0cDovL2xvY2FsLnA0YmhlYWx0aC5vcmcvIjtzOjQ6InVyaXMiO2E6MTE6e2k6MTtzOjk6Ii9ob21lcGFnZSI7aToxMztzOjEzOiIvZ2V0LWludm9sdmVkIjtpOjQ7czo5OiIvcHJvamVjdHMiO2k6MjE7czoxNjoiL3N1Y2Nlc3Mtc3RvcmllcyI7aToxNDtzOjU6Ii9naXZlIjtpOjE1O3M6NjoiL2Fib3V0IjtpOjE2O3M6MTU6Ii9hYm91dC9hYm91dC11cyI7aToxODtzOjExOiIvYWJvdXQvdGVhbSI7aToxOTtzOjEzOiIvYWJvdXQvYWx1bW5pIjtpOjE3O3M6Mjk6Ii9hYm91dC9wYXJ0bmVycy1vcmdhbml6YXRpb25zIjtpOjIwO3M6MjI6Ii9hYm91dC9yZXNvdXJjZXMtbGlua3MiO31zOjk6InRlbXBsYXRlcyI7YToxMTp7aToxO3M6MToiMiI7aTo0O3M6MToiMiI7aToxMztzOjE6IjIiO2k6MTQ7czoxOiIyIjtpOjE1O3M6MToiMiI7aToxNjtzOjE6IjIiO2k6MTc7czoxOiIyIjtpOjE4O3M6MToiMiI7aToxOTtzOjE6IjIiO2k6MjA7czoxOiIyIjtpOjIxO3M6MToiMiI7fX19');

-- --------------------------------------------------------

--
-- Table structure for table `exp_snippets`
--

CREATE TABLE IF NOT EXISTS `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_snippets`
--

INSERT INTO `exp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`) VALUES
(1, 0, 'www_js_foot', '<!-- JS and analytics only. -->\r\n\r\n<!-- Slider. For some reason, it doesn''t load correctly if placed below other scripts here-->\r\n<script>\r\n    jQuery(document).ready(function($) {\r\n	$(''#full-width-slider'').royalSlider({\r\n		arrowsNav: true,\r\n		loop: true,\r\n		\r\n		keyboardNavEnabled: true,\r\n		controlsInside: false,\r\n		imageScaleMode: ''fill'',\r\n		arrowsNavAutoHide: false,\r\n		autoScaleSlider: false, \r\n		autoScaleSliderWidth: false,     \r\n		autoScaleSliderHeight: false,\r\n		controlNavigation: ''bullets'',\r\n		thumbsFitInViewport: false,\r\n		navigateByClick: true,\r\n		startSlideId: 0,\r\n		autoPlay: {\r\n    		// autoplay options go gere\r\n    		enabled: true,\r\n    		pauseOnHover: false,\r\n			delay: 4000\r\n    	},\r\n		transitionType:''move'',\r\n		globalCaption: true,\r\n		deeplinking: {\r\n			enabled: true,\r\n			change: false\r\n		},\r\n		/* size of all images http://help.dimsemenov.com/kb/royalslider-jquery-plugin-faq/adding-width-and-height-properties-to-images */\r\n		\r\n		});\r\n	});\r\n</script>\r\n<!-- Modal -->\r\n<script src="/assets/js/jquery.min.js" type="text/javascript"></script>\r\n<script src="/assets/js/modal.js"></script>\r\n<script>\r\n	$.reveal({\r\n	  animation: ''fadeAndPop'',                   //fade, fadeAndPop, none\r\n     animationspeed: 900,                       //how fast animtions are\r\n     closeonbackgroundclick: true,              //if you click background will modal close?\r\n     dismissmodalclass: ''close-reveal-modal''    //the class of a button or element that will close an open modal\r\n});\r\n</script>\r\n<!-- Bootstrap core JavaScript\r\n================================================== -->\r\n<!-- Placed at the end of the document so the pages load faster -->\r\n<!-- backbone\r\n    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/backbone.js/0.9.10/backbone-min.js"></script>\r\n    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.4.3/underscore-min.js"></script>\r\n-->\r\n<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>\r\n<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>\r\n<script src="/assets/js/lib.js"></script>\r\n<script src="/assets/js/app.js"></script>\r\n\r\n<!-- Livereload code (http://livereload.com/) -->\r\n<script>document.write(''<script src="http://'' + (location.host || ''localhost'').split('':'')[0] + '':35729/livereload.js?snipver=1"></'' + ''script>'')</script>\r\n\r\n\r\n\r\n<!-- Filtering -->\r\n<script src="/assets/js/filtering.js"></script>\r\n <script>\r\n    $(function(){\r\n      \r\n      var $container = $(''#container'');\r\n\r\n      $container.isotope({\r\n        itemSelector : ''.element'',\r\n		layoutMode : ''fitRows''\r\n      });\r\n      $(''#container'').isotope({\r\n  layoutMode: ''cellsByRow'',\r\n  cellsByRow: {\r\n    columnWidth: 278,\r\n    rowHeight: 190\r\n  }\r\n});\r\n      \r\n      var $optionSets = $(''#options .option-set''),\r\n          $optionLinks = $optionSets.find(''a'');\r\n\r\n      $optionLinks.click(function(){\r\n        var $this = $(this);\r\n        // don''t proceed if already selected\r\n        if ( $this.hasClass(''selected'') ) {\r\n          return false;\r\n        }\r\n        var $optionSet = $this.parents(''.option-set'');\r\n        $optionSet.find(''.selected'').removeClass(''selected'');\r\n        $this.addClass(''selected'');\r\n  \r\n        // make option object dynamically, i.e. { filter: ''.my-filter-class'' }\r\n        var options = {},\r\n            key = $optionSet.attr(''data-option-key''),\r\n            value = $this.attr(''data-option-value'');\r\n        // parse ''false'' as false boolean\r\n        value = value === ''false'' ? false : value;\r\n        options[ key ] = value;\r\n        if ( key === ''layoutMode'' && typeof changeLayoutMode === ''function'' ) {\r\n          // changes in layout modes need extra logic\r\n          changeLayoutMode( $this, options )\r\n        } else {\r\n          // otherwise, apply new options\r\n          $container.isotope( options );\r\n        }\r\n        \r\n        return false;\r\n      });\r\n\r\n      \r\n    });\r\n  </script>\r\n\r\n<!-- Y Axis Loader -->\r\n<script src="/assets/js/gridloading/masonry.pkgd.min.js"></script>\r\n<script src="/assets/js/gridloading/imagesloaded.js"></script>\r\n<script src="/assets/js/gridloading/classie.js"></script>\r\n<script src="/assets/js/gridloading/AnimOnScroll.js"></script>\r\n<script>\r\n\r\n\r\n	new AnimOnScroll( document.getElementById( ''grid'' ), {\r\n		minDuration : 0.3,\r\n		maxDuration : 0.6,\r\n		viewportFactor : 0.6\r\n	} );\r\n</script>'),
(2, 0, 'www_metatags', '<!-- Meta, title, CSS, favicons, etc. -->\r\n<meta charset="utf-8">\r\n<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=0">\r\n{!--<meta name="apple-mobile-web-app-capable" content="yes" />--}\r\n<!--[if lte IE 9]><meta http-equiv="X-UA-Compatible" content="chrome=1" /><![endif]-->\r\n<meta name="author" content="Maven 2.0">\r\n'),
(3, 0, 'www_stylesheets', '<!-- Core CSS -->\r\n<link href="{exp:cache_buster file="/assets/css/screen.css" separator="?"}" rel="stylesheet">\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_specialty_templates`
--

CREATE TABLE IF NOT EXISTS `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES
(1, 1, 'y', 'offline_template', '', '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type="text/css">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),
(2, 1, 'y', 'message_template', '', '<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=''content-type'' content=''text/html; charset={charset}'' />\n\n{meta_refresh}\n\n<style type="text/css">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),
(4, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),
(5, 1, 'y', 'admin_notify_mailinglist', 'Someone has subscribed to your mailing list', 'A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),
(6, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),
(7, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),
(8, 1, 'y', 'forgot_password_instructions', 'Login information', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),
(9, 1, 'y', 'reset_password_notification', 'New Login Information', '{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),
(10, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),
(11, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', '{name},\n\nWe''re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),
(12, 1, 'y', 'mailinglist_activation_instructions', 'Email Confirmation', 'Thank you for joining the "{mailing_list}" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),
(13, 1, 'y', 'comment_notification', 'Someone just responded to your comment', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
(14, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),
(15, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),
(16, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_stats`
--

CREATE TABLE IF NOT EXISTS `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 1, 1, 'admin', 11, 0, 0, 0, 1376935440, 0, 0, 0, 0, 0, 1377631034);

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses`
--

CREATE TABLE IF NOT EXISTS `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`) VALUES
(1, 1, 1, 'open', 1, '009933'),
(2, 1, 1, 'closed', 2, '990000');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_groups`
--

CREATE TABLE IF NOT EXISTS `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_status_groups`
--

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Statuses');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_structure`
--

CREATE TABLE IF NOT EXISTS `exp_structure` (
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `listing_cid` int(6) unsigned NOT NULL DEFAULT '0',
  `lft` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rgt` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dead` varchar(100) NOT NULL,
  `hidden` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_structure`
--

INSERT INTO `exp_structure` (`site_id`, `entry_id`, `parent_id`, `channel_id`, `listing_cid`, `lft`, `rgt`, `dead`, `hidden`) VALUES
(0, 0, 0, 0, 0, 1, 24, 'root', 'n'),
(1, 1, 0, 1, 0, 2, 3, '', 'n'),
(1, 14, 0, 2, 0, 10, 11, '', 'n'),
(1, 4, 0, 3, 0, 6, 7, '', 'n'),
(1, 15, 0, 5, 0, 12, 23, '', 'n'),
(1, 19, 15, 5, 0, 17, 18, '', 'n'),
(1, 16, 15, 5, 0, 13, 14, '', 'n'),
(1, 17, 15, 5, 0, 19, 20, '', 'n'),
(1, 18, 15, 5, 0, 15, 16, '', 'n'),
(1, 13, 0, 4, 0, 4, 5, '', 'n'),
(1, 21, 0, 6, 0, 8, 9, '', 'n'),
(1, 20, 15, 5, 0, 21, 22, '', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_structure_channels`
--

CREATE TABLE IF NOT EXISTS `exp_structure_channels` (
  `site_id` smallint(5) unsigned NOT NULL,
  `channel_id` mediumint(8) unsigned NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  `type` enum('page','listing','asset','unmanaged') NOT NULL DEFAULT 'unmanaged',
  `split_assets` enum('y','n') NOT NULL DEFAULT 'n',
  `show_in_page_selector` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`site_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_structure_channels`
--

INSERT INTO `exp_structure_channels` (`site_id`, `channel_id`, `template_id`, `type`, `split_assets`, `show_in_page_selector`) VALUES
(1, 1, 2, 'page', 'n', 'n'),
(1, 2, 2, 'page', 'n', 'n'),
(1, 3, 2, 'page', 'n', 'y'),
(1, 5, 2, 'page', 'n', 'y'),
(1, 4, 2, 'page', 'n', 'n'),
(1, 6, 2, 'page', 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_structure_listings`
--

CREATE TABLE IF NOT EXISTS `exp_structure_listings` (
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `template_id` int(6) unsigned NOT NULL DEFAULT '0',
  `uri` varchar(75) NOT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_structure_members`
--

CREATE TABLE IF NOT EXISTS `exp_structure_members` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `nav_state` text,
  PRIMARY KEY (`site_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_structure_members`
--

INSERT INTO `exp_structure_members` (`member_id`, `site_id`, `nav_state`) VALUES
(1, 1, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `exp_structure_settings`
--

CREATE TABLE IF NOT EXISTS `exp_structure_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `var` varchar(60) NOT NULL,
  `var_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `exp_structure_settings`
--

INSERT INTO `exp_structure_settings` (`id`, `site_id`, `var`, `var_value`) VALUES
(1, 0, 'action_ajax_move', '12'),
(2, 0, 'module_id', '10'),
(13, 1, 'add_trailing_slash', 'y'),
(12, 1, 'hide_hidden_templates', 'y'),
(11, 1, 'redirect_on_publish', 'y'),
(10, 1, 'redirect_on_login', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_templates`
--

CREATE TABLE IF NOT EXISTS `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`) VALUES
(1, 1, 1, '.header', 'y', 'webpage', '<body class="{exp:nsm_body_class return=''class_attr''} {if logged_in} logged-in{/if}{if logged_out} not-logged-in{/if}">\r\n  <!--[if lt IE 7]>\r\n    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>\r\n  <![endif]-->\r\n  <div id="skip-link">\r\n    <a href="#main-content" class="invisible focusable">Skip to main content</a>\r\n  </div>\r\n  ', NULL, 1375823064, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(2, 1, 1, 'index', 'y', 'webpage', '{www_html_head}\r\n\r\n{www_metatags}\r\n\r\n{exp:seo_lite use_last_segment="yes"}\r\n\r\n{www_stylesheets}\r\n{www_js_head}\r\n{www_html_head_end}\r\n\r\n{embed="global/.header"\r\n  entry_id="{last_segment_absolute_id}"\r\n  url_title="{last_segment_absolute}"\r\n  template="index"\r\n  template_group="page"\r\n  channel_name="pages"\r\n  body_class="sub-page"\r\n}\r\n\r\n{!-- PAGE BODY HERE --}\r\n\r\n\r\n\r\n\r\n{embed="global/.footer"}\r\n{www_js_foot}\r\n{www_body_html_end}', NULL, 1375823064, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(3, 1, 2, '_homepage', 'y', 'webpage', '		<div id="intro-scene">\r\n			<div class="container">\r\n				<div class="row text-center">	\r\n						<h1>Imagine Your Community<br>With A Healthier Future</h1>\r\n				</div>\r\n				<div class="row text-center">		\r\n						<div id="video">\r\n							<object  data="/assets/img/vectors/playbutton.svg" type="image/svg+xml" class="svg"></object>\r\n					</div>\r\n				</div>				\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div id="vision-scene">\r\n		<div class="container">\r\n			<div class="row text-center">\r\n				<div class="section-banner">Our Vision</div>\r\n				<h2>Population-Based Health Systems</h2>\r\n			</div>\r\n			<div class="row text-center">\r\n				<div class="col-lg-6">\r\n					<img class="img-responsive" src="/assets/img/site/united-states-visual.png">\r\n				</div>\r\n				<div class="col-lg-6">\r\n					Our vision is to assist communities throughout the United States in developing a \r\n					population-based health system that reflects the health needs and preferences of \r\n					the segments of our community, with service and access solutions that are \r\n					appropriate in scale and cost, developed through collaboration and cooperation \r\n					between the communities and the health sector.\r\n					 \r\n					<div id="learn-more">\r\n						<button type="button" class="btn btn-primary btn-lg btn-white">Learn more</button>\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div id="process-scene" style="background: url(''{hp_header_image}'') no-repeat fixed center;background-size:cover;">\r\n		<div class="container">\r\n			<div class="row text-center">\r\n				<div class="section-banner">Our Process</div>\r\n				<h2>It Starts With Collaboration</h2>\r\n				<ul class="grid effect-2" id="grid">\r\n					<li>\r\n					\r\n						<div class="icons entypo">&#128269;</div>\r\n						<h3>Investigate</h3>\r\n						We create a collaborative effort to understand and interpret the health needs of the \r\n						community.\r\n					</li>\r\n					<li>\r\n						<div class="icons entypo">&#128161;</div>				\r\n						<h3>Conceptualize</h3>\r\n						We gather our findings and conceptualize solutions.\r\n					</li>\r\n					<li>\r\n						<div class="icons entypo">&#128255;</div>\r\n						<h3>Incubate</h3>\r\n						We incubate those solutions by drawing on a network of resources.		\r\n					</li>\r\n				</ul>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div id="partners-scene">\r\n		<div class="container">\r\n			<div class="row text-center">\r\n				<div class="section-banner">Our Partners</div>\r\n				<h2>It Continues With Our Partnerships</h2>\r\n				<div class="col-lg-2 col-4">\r\n					<div class="icons entypo">&#59172;</div>\r\n					Cities\r\n				</div>\r\n				<div class="col-lg-2 col-4">\r\n					<div class="icons entypo">&#128213;</div>\r\n					Universities\r\n				</div>\r\n				<div class="col-lg-2 col-4">\r\n					<div class="icons entypo">&#127891;</div>\r\n					Students\r\n				</div>\r\n				<div class="col-lg-2 col-4">\r\n					<div class="icons entypo">&#128710;</div>\r\n					Businesses\r\n				</div>\r\n				<div class="col-lg-2 col-4">\r\n					<div class="icons entypo">&#128101;</div>\r\n					Organizations\r\n				</div>\r\n				<div class="col-lg-2 col-4">\r\n					<div class="icons entypo">&#127810;</div>\r\n					Health Systems\r\n				</div>				\r\n			</div>\r\n			<div class="row text-center">\r\n				<div id="partners-btn">\r\n					<button type="button" class="btn btn-primary btn-lg btn-orange">See Our List of Partners</button>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div id="projects-scene">\r\n		<div id="full-width-slider" class="royalSlider heroSlider rsDefault">\r\n			<div class="rsContent">\r\n				<img class="rsImg" src="/assets/img/site/projects-scene.jpg" alt="" />\r\n				<div style="margin-top:60px;" class="section-banner text-center rsABlock " data-fade-effect="" data-move-offset="30" data-move-effect="top" data-speed="200">Our Projects</div>\r\n				<div class="infoBlock rsABlock text-center" data-fade-effect="" data-move-offset="30" data-move-effect="left" data-speed="800">\r\n				 \r\n						<h1>Ontario</h1>\r\n						<p>Put completely anything inside - text, images, inputs, links, buttons.</p>\r\n				\r\n				</div>	\r\n			</div>\r\n			<div class="rsContent">\r\n				<img class="rsImg" src="/assets/img/site/chicago.jpg" alt="" />\r\n				<div style="margin-top:60px;" class="section-banner text-center rsABlock" data-fade-effect="" data-move-offset="30" data-move-effect="top" data-speed="200">Our Partners</div>\r\n				<div class="infoBlock rsABlock text-center" data-fade-effect="" data-move-offset="30" data-move-effect="left" data-speed="800">\r\n						<h1>Chicago</h1>\r\n						<p>Put completely anything inside - text, images, inputs, links, buttons.</p>\r\n				</div>	\r\n			</div>	\r\n			<div class="rsContent">\r\n				<img class="rsImg" src="/assets/img/site/chicago.jpg" alt="" />\r\n				<div style="margin-top:60px;" class="section-banner text-center rsABlock" data-fade-effect="" data-move-offset="30" data-move-effect="top" data-speed="200">Our Partners</div>\r\n				<div class="infoBlock rsABlock text-center" data-fade-effect="" data-move-offset="30" data-move-effect="left" data-speed="800">\r\n						<h1>Rancho Cucumonga</h1>\r\n						<p>Put completely anything inside - text, images, inputs, links, buttons.</p>\r\n				</div>	\r\n			</div>				\r\n		</div>\r\n	</div>		\r\n	<div id="participate-scene">\r\n		<div class="container">\r\n			<div class="row text-center">\r\n				<div class="section-banner">Call to action</div>\r\n				<h2>How Can You Participate?</h2>\r\n				<ul class="grid effect-6" id="grid">\r\n					<li>	\r\n						<div class="icons entypo">&#128227;</div>\r\n						<button type="button" class="btn btn-primary btn-lg btn-white btn-fixed-width">Get Involved</button>						\r\n					</li>\r\n					<li>					\r\n						<div class="icons entypo">&hearts;</div>				\r\n						<button type="button" class="btn btn-primary btn-lg btn-white btn-fixed-width">Give</button>						\r\n					</li>\r\n					<li>	\r\n						<div class="icons entypo">&#128213;</div>\r\n						<button type="button" class="btn btn-primary btn-lg btn-white btn-fixed-width">Learn more</button>				\r\n					</li>\r\n				</ul>\r\n			</div>\r\n		</div>\r\n	</div>		\r\n	<div id="footer">\r\n		<div class="container">\r\n			<div class="row">\r\n				<div class="pull-left">\r\n					<img class="vertical-center" src="/assets/img/logo.png">\r\n				</div>\r\n				<div class="col-2">\r\n					<address>\r\n						Partners For Better Health\r\n						8780  19th Street, Suite #239\r\n						Rancho Cucamonga, CA  91701     \r\n\r\n						T: 909.984.9153\r\n					</address>\r\n				</div>\r\n				<div class="pull-right">\r\n					<button type="button" class="btn btn-primary btn-lg btn-gray">RLF Login</button>\r\n				</div>\r\n			</div>\r\n			<div class="row footer-text">\r\n				Copyright 2013, All Rights Reserved, Partners For Better Health©, p4bHealth©\r\n			</div>\r\n		</div>\r\n	</div>	', NULL, 1376434757, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(4, 1, 2, '_about', 'y', 'webpage', '', NULL, 1376501251, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(5, 1, 2, 'index', 'y', 'webpage', 'f', '', 1376502276, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(6, 1, 2, '_give', 'y', 'webpage', 'frt', '', 1376502301, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(7, 1, 1, '_header', 'y', 'webpage', '<body class="{exp:nsm_body_class return=''class_attr''} {if logged_in} logged-in{/if}{if logged_out} not-logged-in{/if}">\r\n	<!--[if lt IE 7]>\r\n	<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>\r\n	<![endif]-->\r\n	<!--<div id="skip-link">\r\n	<a href="#main-content" class="invisible focusable">Skip to main content</a>\r\n	</div>-->\r\n	{exp:channel:entries channel="homepage"}\r\n	<div id="header" style="background: url(''{hp_header_image}'') no-repeat fixed center;background-size:cover;">\r\n		<div id="topbar">\r\n			<div class="container">\r\n				<div class="pull-left">\r\n					<img class="vertical-center" src="/assets/img/logo.png">\r\n				</div>\r\n				<div class="pull-right">\r\n					<nav>\r\n						<ul>\r\n							<li>Get Involved</li>\r\n							<li>Projects</li>\r\n							<li>Success Stories</li>\r\n							<li><div class="banner"><object  data="/assets/img/vectors/banner.svg" type="image/svg+xml">sdsd</object></div><span class="topper">Give</span></li>\r\n							<li>About Us</li>				\r\n						</ul>\r\n					</nav>\r\n				</div>\r\n			</div>	\r\n		</div>\r\n	{/exp:channel:entries}', NULL, 1376502174, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(8, 1, 1, '_footer', 'y', 'webpage', '<div id="footer">\r\n	<div class="container">\r\n		<div class="row">\r\n			<div class="pull-left">\r\n				<img class="vertical-center" src="/assets/img/logo.png">\r\n			</div>\r\n			<div class="col-2">\r\n				<address>\r\n					Partners For Better Health\r\n					8780  19th Street, Suite #239\r\n					Rancho Cucamonga, CA  91701     \r\n\r\n					T: 909.984.9153\r\n				</address>\r\n			</div>\r\n			<div class="pull-right">\r\n				<button type="button" class="btn btn-primary btn-lg btn-gray">RLF Login</button>\r\n			</div>\r\n		</div>\r\n		<div class="row footer-text">\r\n			Copyright 2013, All Rights Reserved, Partners For Better Health©, p4bHealth©\r\n		</div>\r\n	</div>\r\n</div>	', NULL, 1376502770, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(9, 1, 2, '_projects', 'y', 'webpage', '{exp:channel:entries channel="projects"}\n{embed="global/_header"\n	entry_id="{last_segment_absolute_id}"\n	url_title="{last_segment_absolute}"\n	template="index"\n	template_group="page"\n	channel_name="pages"\n	body_class="sub-page"\n	header_image="{projects_header_image}"\n}\n	<div id="header-scene">\n		<div class="container">\n			<div class="row text-center">	\n				<h1>{projects_header_headline}</h1>\n				<p>{projects_header_content}</p>					\n			</div>			\n		</div>\n	</div>\n</div>\n<div class="yellowbar-scene"></div>\n<div class="single-scene">\n\n \n	<div class="container">\n		<div class="section-banner">Filter projects by city</div>\n		<div class="filter" >\n			<section id="options" class="clearfix">\n				<ul id="filter" class="option-set clearfix nav nav-pills" data-option-key="filter">\n					<li><a href="#filter" data-option-value="*" class="selected">All</a></li>\n					{projects_content orderby="city" sort="asc"}\n					<li><a href="#filter" data-option-value=".{stripped-city}">{city}</a></li>\n					\n					\n					{/projects_content}\n				</ul>\n				<script>	//Prevent List items from showing more than once\n					var seen = {};\n					$(''a'').each(function() {\n						var txt = $(this).text();\n						if (seen[txt])\n							$(this).remove();\n						else\n							seen[txt] = true;\n					});\n				</script>\n			</section> <!-- #options -->\n		</div>\n		<div class="rowd margin-top-small"> \n			<div id="container" class="col-lg-12 clearfix text-center">\n				{projects_content}\n				<div class="element {stripped-city}" data-category="{city}">\n				<img src="{image}" width="265" height="165">\n				</div>\n				{/projects_content}\n			</div> <!-- #container -->\n		</div>\n	</div>\n</div>\n{/exp:channel:entries}', '', 1377034648, 1, 'n', 0, '', 'n', 'y', 'o', 0),
(10, 1, 2, '_get-involved', 'y', 'webpage', '	<div id="header-scene">\r\n		<div class="container">\r\n			<div class="row text-center">	\r\n				<h1>How You Can Give</h1>\r\n				<p>Please join us in creating a healthier future with a donation. We have provided a safe and cost efficient means for you to give to Partners for Better Health (P4bHealth.) </p>					\r\n			</div>\r\n			<div class="row text-center">		\r\n				<div id="button">\r\n						<button type="button" class="btn btn-primary btn-lg btn-orange">Give Now</button>\r\n				</div>\r\n			</div>				\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class="yellowbar-scene"></div>\r\n<div class="single-scene">\r\n	<div class="container">\r\n		<div class="section-banner">Other ways to give</div>\r\n		<div class="row margin-top-80">\r\n			<div class="col-lg-4">\r\n				<img class="img-responsive" src="/assets/img/site/10219_1business_group.jpg">\r\n			</div>\r\n			<div class="col-lg-8">\r\n				<h2>Randall Lewis Health Policy Fellowship</h2>\r\n				<p>Your donation to the Partners for Better Health Policy Fellowships will help us create a better future in the \r\nInland Empire.</p>\r\n\r\n				<p>We are now seeking applications for The Randall Lewis Health Policy Fellowship for the 2011-2012 academic year. This prestigious and competitive fellowship is the first of its kind in the Inland Empire and will provide a unique opportunity to work directly with local communities in improving residents'' health.  Five to seven applicants will be selected to serve as interns in cities within the Inland Empire.   Fellows will develop the skills required to successfully influence local and regional health policy.  We will have a direct influence on shaping the little p in health policy to make a difference in our communities.between the communities and the health sector. </p>\r\n				<button type="button" class="btn btn-primary btn-lg btn-orange">Give Now</button>\r\n			</div>\r\n		</div>\r\n		<div class="row margin-top-80">\r\n			<div class="col-lg-4">\r\n				<img class="img-responsive" src="/assets/img/site/10219_1business_group.jpg">\r\n			</div>\r\n			<div class="col-lg-8">\r\n				<h2>Randall Lewis Health Policy Fellowship</h2>\r\n				<p>Your donation to the Partners for Better Health Policy Fellowships will help us create a better future in the \r\nInland Empire.</p>\r\n\r\n				<p>We are now seeking applications for The Randall Lewis Health Policy Fellowship for the 2011-2012 academic year. This prestigious and competitive fellowship is the first of its kind in the Inland Empire and will provide a unique opportunity to work directly with local communities in improving residents'' health.  Five to seven applicants will be selected to serve as interns in cities within the Inland Empire.   Fellows will develop the skills required to successfully influence local and regional health policy.  We will have a direct influence on shaping the little p in health policy to make a difference in our communities.between the communities and the health sector. </p>\r\n				<button type="button" class="btn btn-primary btn-lg btn-orange">Give Now</button>\r\n			</div>\r\n		</div>		\r\n	</div>\r\n</div>	', NULL, 1376522575, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(11, 1, 2, '_stories', 'y', 'webpage', '', NULL, 1376593461, 1, 'n', 0, '', 'n', 'n', 'o', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups`
--

CREATE TABLE IF NOT EXISTS `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(1, 1, 'global', 1, 'y'),
(2, 1, 'pages', 2, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_throttle`
--

CREATE TABLE IF NOT EXISTS `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs`
--

CREATE TABLE IF NOT EXISTS `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`) VALUES
(1, 1, 'Images', 'I:\\git\\PBH\\httpdocs\\images\\uploads\\', 'http://local.p4bhealth.org/images/uploads/', 'img', '', '', '', '', '', '', '', '', '', '', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
