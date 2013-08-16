-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2013 at 07:32 PM
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

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
(13, 'Editor', 'ACT_file_upload');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `ping_return_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`) VALUES
(1, 1, 'homepage', 'Homepage', 'http://local.p4bhealth.org/', NULL, 'en', 1, 0, 1375826640, 0, '', NULL, 'open', 1, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0),
(2, 1, 'give', 'Give', 'http://local.p4bhealth.org/', NULL, 'en', 8, 0, 1376681040, 0, '', NULL, 'open', 5, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0),
(3, 1, 'projects', 'Projects', 'http://local.p4bhealth.org/', NULL, 'en', 2, 0, 1376522460, 0, '', NULL, 'open', NULL, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0),
(4, 1, 'get-involved', 'Get Involved', 'http://local.p4bhealth.org/', NULL, 'en', 1, 0, 1376679780, 0, '', NULL, 'open', 3, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0),
(5, 1, 'about', 'About', 'http://local.p4bhealth.org/', NULL, 'en', 0, 0, 0, 0, '', NULL, 'open', 6, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0);

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
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_channel_data`
--

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_1`, `field_ft_1`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`, `field_id_8`, `field_ft_8`, `field_id_9`, `field_ft_9`, `field_id_10`, `field_ft_10`, `field_id_11`, `field_ft_11`, `field_id_12`, `field_ft_12`) VALUES
(1, 1, 1, '{filedir_1}pbh_home-header.jpg', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(4, 1, 3, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(3, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(5, 1, 3, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(6, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(7, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(8, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(9, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(10, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(11, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(12, 1, 2, '', NULL, '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'xhtml', '', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(13, 1, 4, '', NULL, '', 'none', 'The Randall Lewis Health Policy Fellowship', 'none', '<p>\n	A collaborative of corporate, university, and community leadership to assist municipal efforts in the San Bernardino County’s Healthy Communities Initiative. You’re invited to get involved!\n</p>', 'xhtml', 'THE PURPOSE', 'none', '<p>\n	The purpose of the Randall Lewis Health Policy Fellowship program is to ensure the development of public health professionals who possess the necessary skills to influence positive change in public policy, systems, and the built environment in our local municipalities. In addition, these prestigious and competitive fellowships will create educational and professional opportunities for local students in health policy, provide for the expansion of the regional health policy infrastructure, and retain essential intellectual capital in the Inland Empire\n</p>\n<p>\n	The fellowship, currentily in its third year, runs from September until May.\n</p>', 'xhtml', '1', 'none', '', 'none', '', 'none', '', 'xhtml', '', 'none', '', 'none'),
(14, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', 'How You Can Give', 'none', '<p>\n	Please join us in creating a healthier future with a donation. We have provided a safe and cost efficient means for you to give to Partners for Better Health (P4bHealth.)\n</p>', 'xhtml', 'OTHER WAYS TO GIVE', 'none', '1', 'none');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

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
(7, 1, 3, 'get-involved_content', 'Get Involved Content', '', 'matrix', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 6, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjMiO3M6ODoibWF4X3Jvd3MiO3M6MToiMyI7czo3OiJjb2xfaWRzIjthOjI6e2k6MDtpOjE7aToxO2k6Mjt9fQ=='),
(8, 1, 5, 'give_header_image', 'Header Image', '', 'file', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(9, 1, 5, 'give_header_headline', 'Header Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(10, 1, 5, 'give_header_content', 'Header Content', '', 'editor', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 3, 'any', 'YTo3OntzOjY6ImVkaXRvciI7YToyODp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjE0OiJ1cGxvYWRfc2VydmljZSI7czo1OiJsb2NhbCI7czoyMDoiZmlsZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoyMToiaW1hZ2VfdXBsb2FkX2xvY2F0aW9uIjtzOjE6IjAiO3M6MTQ6ImltYWdlX2Jyb3dzaW5nIjtzOjM6InllcyI7czoxMjoiaW1hZ2Vfc3ViZGlyIjtzOjM6InllcyI7czoyOiJzMyI7YTo0OntzOjQ6ImZpbGUiO2E6MTp7czo2OiJidWNrZXQiO3M6MDoiIjt9czo1OiJpbWFnZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjE0OiJhd3NfYWNjZXNzX2tleSI7czowOiIiO3M6MTQ6ImF3c19zZWNyZXRfa2V5IjtzOjA6IiI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czo5OiJkaXJlY3Rpb24iO3M6MzoibHRyIjtzOjc6InRvb2xiYXIiO3M6MzoieWVzIjtzOjY6InNvdXJjZSI7czozOiJ5ZXMiO3M6NToiZm9jdXMiO3M6Mjoibm8iO3M6MTA6ImF1dG9yZXNpemUiO3M6MzoieWVzIjtzOjU6ImZpeGVkIjtzOjI6Im5vIjtzOjEyOiJjb252ZXJ0bGlua3MiO3M6MzoieWVzIjtzOjExOiJjb252ZXJ0ZGl2cyI7czozOiJ5ZXMiO3M6Nzoib3ZlcmxheSI7czozOiJ5ZXMiO3M6MTM6Im9ic2VydmVpbWFnZXMiO3M6MzoieWVzIjtzOjk6InNob3J0Y3V0cyI7czozOiJ5ZXMiO3M6MzoiYWlyIjtzOjI6Im5vIjtzOjM6Ind5bSI7czoyOiJubyI7czo4OiJwcm90b2NvbCI7czozOiJ5ZXMiO3M6MTg6ImFsbG93ZWR0YWdzX29wdGlvbiI7czo3OiJkZWZhdWx0IjtzOjExOiJhbGxvd2VkdGFncyI7YTowOnt9czoxNDoiZm9ybWF0dGluZ3RhZ3MiO2E6Nzp7aTowO3M6MToicCI7aToxO3M6MTA6ImJsb2NrcXVvdGUiO2k6MjtzOjM6InByZSI7aTozO3M6MjoiaDEiO2k6NDtzOjI6ImgyIjtpOjU7czoyOiJoMyI7aTo2O3M6MjoiaDQiO31zOjg6Imxhbmd1YWdlIjtzOjI6ImVuIjtzOjg6ImNzc19maWxlIjtzOjA6IiI7czoxMToiZWRpdG9yX2NvbmYiO3M6MToiMyI7fXM6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(11, 1, 5, 'give_body_headline', 'Body Headline', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(12, 1, 5, 'give_content', 'Content', '', 'matrix', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 5, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6NDp7aTowO3M6MToiMyI7aToxO3M6MToiNCI7aToyO3M6MToiNSI7aTozO3M6MToiNiI7fX0=');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `exp_channel_titles`
--

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(1, 1, 1, 1, NULL, '127.0.0.1', 'Homepage', 'homepage', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1375826640, '2013', '08', '06', 0, 0, 20130806222623, 0, 0),
(4, 1, 3, 1, NULL, '127.0.0.1', 'Projects', 'projects', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376510580, '2013', '08', '14', 0, 0, 20130814232228, 0, 0),
(3, 1, 2, 1, NULL, '127.0.0.1', 'Give', 'give', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1376502180, '2013', '08', '14', 0, 0, 20130815190941, 0, 0),
(6, 1, 2, 1, NULL, '127.0.0.1', 'About Us', 'about-us', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376593320, '2013', '08', '15', 0, 0, 20130815190306, 0, 0),
(5, 1, 3, 1, NULL, '127.0.0.1', 'Get Involved', 'get-involved', 'closed', 'y', 0, 0, 0, 0, 'y', 'n', 1376522460, '2013', '08', '14', 0, 0, 20130816190312, 0, 0),
(7, 1, 2, 1, NULL, '127.0.0.1', 'Success Stories', 'success-stories', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376593380, '2013', '08', '15', 0, 0, 20130815190326, 0, 0),
(8, 1, 2, 1, NULL, '127.0.0.1', 'About Us', 'about-us1', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376597280, '2013', '08', '15', 0, 0, 20130815200844, 0, 0),
(9, 1, 2, 1, NULL, '127.0.0.1', 'Team', 'team', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376597280, '2013', '08', '15', 0, 0, 20130815200856, 0, 0),
(10, 1, 2, 1, NULL, '127.0.0.1', 'Alumni', 'alumni', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376597340, '2013', '08', '15', 0, 0, 20130815200906, 0, 0),
(11, 1, 2, 1, NULL, '127.0.0.1', 'Partners & Organizations', 'partners-organizations', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376597340, '2013', '08', '15', 0, 0, 20130815200924, 0, 0),
(12, 1, 2, 1, NULL, '127.0.0.1', 'Resources & Links', 'resources-links', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376597340, '2013', '08', '15', 0, 0, 20130815200936, 0, 0),
(13, 1, 4, 1, NULL, '127.0.0.1', 'Get Involved', 'get-involved', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376679780, '2013', '08', '16', 0, 0, 20130816190601, 0, 0),
(14, 1, 2, 1, NULL, '127.0.0.1', 'Give', 'give1', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1376681040, '2013', '08', '16', 0, 0, 20130816192549, 0, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

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
(27, 1, 1, 'longdao', '127.0.0.1', 1376679765, 'Channel Created:&nbsp;&nbsp;About');

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
(4, 1376412819, 'n', NULL, 'do_hash()', 224, 'I:\\git\\PBH\\system\\expressionengine\\third_party\\nsm_htaccess_generator\\ext.nsm_htaccess_generator.php', '2.6', 'PHP''s hashing functions', 0, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

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
(13, 'matrix', '2.5.6', 'YTowOnt9', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_formatting`
--

CREATE TABLE IF NOT EXISTS `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

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
(36, 12, 'xhtml');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Homepage'),
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_files`
--

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `rel_path`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`) VALUES
(2, 1, 'pbh_home-header.jpg', 1, 'I:/git/PBH/httpdocs/images/uploads/pbh_home-header.jpg', 'image/jpeg', 'pbh_home-header.jpg', 147201, NULL, NULL, NULL, 1, 1375827616, 1, 1375827718, '657 1600'),
(3, 1, '10219_1business_group.jpg', 1, 'I:/git/PBH/httpdocs/images/uploads/10219_1business_group.jpg', 'image/jpeg', '10219_1business_group.jpg', 487967, NULL, NULL, NULL, 1, 1376681123, 1, 1376681123, '1050 1500');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `exp_matrix_cols`
--

INSERT INTO `exp_matrix_cols` (`col_id`, `site_id`, `field_id`, `var_id`, `col_name`, `col_label`, `col_instructions`, `col_type`, `col_required`, `col_search`, `col_order`, `col_width`, `col_settings`) VALUES
(1, 1, 7, NULL, 'headline', 'Headline', '', 'text', 'n', 'n', 0, '33%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(2, 1, 7, NULL, 'content', 'Content', '', 'editor', 'n', 'n', 1, '', 'YToxOntzOjY6ImVkaXRvciI7YToyODp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjE0OiJ1cGxvYWRfc2VydmljZSI7czo1OiJsb2NhbCI7czoyMDoiZmlsZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoyMToiaW1hZ2VfdXBsb2FkX2xvY2F0aW9uIjtzOjE6IjAiO3M6MTQ6ImltYWdlX2Jyb3dzaW5nIjtzOjM6InllcyI7czoxMjoiaW1hZ2Vfc3ViZGlyIjtzOjM6InllcyI7czoyOiJzMyI7YTo0OntzOjQ6ImZpbGUiO2E6MTp7czo2OiJidWNrZXQiO3M6MDoiIjt9czo1OiJpbWFnZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjE0OiJhd3NfYWNjZXNzX2tleSI7czowOiIiO3M6MTQ6ImF3c19zZWNyZXRfa2V5IjtzOjA6IiI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czo5OiJkaXJlY3Rpb24iO3M6MzoibHRyIjtzOjc6InRvb2xiYXIiO3M6MzoieWVzIjtzOjY6InNvdXJjZSI7czozOiJ5ZXMiO3M6NToiZm9jdXMiO3M6Mjoibm8iO3M6MTA6ImF1dG9yZXNpemUiO3M6MzoieWVzIjtzOjU6ImZpeGVkIjtzOjI6Im5vIjtzOjEyOiJjb252ZXJ0bGlua3MiO3M6MzoieWVzIjtzOjExOiJjb252ZXJ0ZGl2cyI7czozOiJ5ZXMiO3M6Nzoib3ZlcmxheSI7czozOiJ5ZXMiO3M6MTM6Im9ic2VydmVpbWFnZXMiO3M6MzoieWVzIjtzOjk6InNob3J0Y3V0cyI7czozOiJ5ZXMiO3M6MzoiYWlyIjtzOjI6Im5vIjtzOjM6Ind5bSI7czoyOiJubyI7czo4OiJwcm90b2NvbCI7czozOiJ5ZXMiO3M6MTg6ImFsbG93ZWR0YWdzX29wdGlvbiI7czo3OiJkZWZhdWx0IjtzOjExOiJhbGxvd2VkdGFncyI7YTowOnt9czoxNDoiZm9ybWF0dGluZ3RhZ3MiO2E6Nzp7aTowO3M6MToicCI7aToxO3M6MTA6ImJsb2NrcXVvdGUiO2k6MjtzOjM6InByZSI7aTozO3M6MjoiaDEiO2k6NDtzOjI6ImgyIjtpOjU7czoyOiJoMyI7aTo2O3M6MjoiaDQiO31zOjg6Imxhbmd1YWdlIjtzOjI6ImVuIjtzOjg6ImNzc19maWxlIjtzOjA6IiI7czoxMToiZWRpdG9yX2NvbmYiO3M6MToiMyI7fX0='),
(3, 1, 12, NULL, 'img', 'Image', '', 'file', 'n', 'n', 0, '', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czozOiJhbGwiO3M6MTI6ImNvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
(4, 1, 12, NULL, 'headline', 'Headline', '', 'text', 'n', 'n', 1, '', 'YTo0OntzOjQ6Im1heGwiO3M6MzoiMTQwIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(5, 1, 12, NULL, 'content', 'Content', '', 'editor', 'n', 'n', 2, '', 'YToxOntzOjY6ImVkaXRvciI7YToyOTp7czoxNToiZWRpdG9yX3NldHRpbmdzIjtzOjEwOiJwcmVkZWZpbmVkIjtzOjc6ImJ1dHRvbnMiO2E6MzA6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjE6InwiO2k6MjtzOjEwOiJmb3JtYXR0aW5nIjtpOjM7czoxOiJ8IjtpOjQ7czo0OiJib2xkIjtpOjU7czo2OiJpdGFsaWMiO2k6NjtzOjc6ImRlbGV0ZWQiO2k6NztzOjE6InwiO2k6ODtzOjEzOiJ1bm9yZGVyZWRsaXN0IjtpOjk7czoxMToib3JkZXJlZGxpc3QiO2k6MTA7czo3OiJvdXRkZW50IjtpOjExO3M6NjoiaW5kZW50IjtpOjEyO3M6MToifCI7aToxMztzOjQ6ImxpbmsiO2k6MTQ7czo1OiJpbWFnZSI7aToxNTtzOjU6InZpZGVvIjtpOjE2O3M6NDoiZmlsZSI7aToxNztzOjU6InRhYmxlIjtpOjE4O3M6MToifCI7aToxOTtzOjk6ImZvbnRjb2xvciI7aToyMDtzOjk6ImJhY2tjb2xvciI7aToyMTtzOjE6InwiO2k6MjI7czo5OiJhbGlnbmxlZnQiO2k6MjM7czoxMToiYWxpZ25jZW50ZXIiO2k6MjQ7czoxMDoiYWxpZ25yaWdodCI7aToyNTtzOjc6Imp1c3RpZnkiO2k6MjY7czoxOiJ8IjtpOjI3O3M6MTQ6Imhvcml6b250YWxydWxlIjtpOjI4O3M6MTE6InBhc3RlX3BsYWluIjtpOjI5O3M6MToifCI7fXM6MTQ6InVwbG9hZF9zZXJ2aWNlIjtzOjU6ImxvY2FsIjtzOjIwOiJmaWxlX3VwbG9hZF9sb2NhdGlvbiI7czoxOiIwIjtzOjIxOiJpbWFnZV91cGxvYWRfbG9jYXRpb24iO3M6MToiMCI7czoxNDoiaW1hZ2VfYnJvd3NpbmciO3M6MzoieWVzIjtzOjEyOiJpbWFnZV9zdWJkaXIiO3M6MzoieWVzIjtzOjI6InMzIjthOjQ6e3M6NDoiZmlsZSI7YToxOntzOjY6ImJ1Y2tldCI7czowOiIiO31zOjU6ImltYWdlIjthOjE6e3M6NjoiYnVja2V0IjtzOjA6IiI7fXM6MTQ6ImF3c19hY2Nlc3Nfa2V5IjtzOjA6IiI7czoxNDoiYXdzX3NlY3JldF9rZXkiO3M6MDoiIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjk6ImRpcmVjdGlvbiI7czozOiJsdHIiO3M6NzoidG9vbGJhciI7czozOiJ5ZXMiO3M6Njoic291cmNlIjtzOjM6InllcyI7czo1OiJmb2N1cyI7czoyOiJubyI7czoxMDoiYXV0b3Jlc2l6ZSI7czozOiJ5ZXMiO3M6NToiZml4ZWQiO3M6Mjoibm8iO3M6MTI6ImNvbnZlcnRsaW5rcyI7czozOiJ5ZXMiO3M6MTE6ImNvbnZlcnRkaXZzIjtzOjM6InllcyI7czo3OiJvdmVybGF5IjtzOjM6InllcyI7czoxMzoib2JzZXJ2ZWltYWdlcyI7czozOiJ5ZXMiO3M6OToic2hvcnRjdXRzIjtzOjM6InllcyI7czozOiJhaXIiO3M6Mjoibm8iO3M6Mzoid3ltIjtzOjI6Im5vIjtzOjg6InByb3RvY29sIjtzOjM6InllcyI7czoxODoiYWxsb3dlZHRhZ3Nfb3B0aW9uIjtzOjc6ImRlZmF1bHQiO3M6MTE6ImFsbG93ZWR0YWdzIjthOjA6e31zOjE0OiJmb3JtYXR0aW5ndGFncyI7YTo3OntpOjA7czoxOiJwIjtpOjE7czoxMDoiYmxvY2txdW90ZSI7aToyO3M6MzoicHJlIjtpOjM7czoyOiJoMSI7aTo0O3M6MjoiaDIiO2k6NTtzOjI6ImgzIjtpOjY7czoyOiJoNCI7fXM6ODoibGFuZ3VhZ2UiO3M6MjoiZW4iO3M6ODoiY3NzX2ZpbGUiO3M6MDoiIjtzOjExOiJlZGl0b3JfY29uZiI7czoxOiIzIjt9fQ=='),
(6, 1, 12, NULL, 'link', 'Link', '', 'text', 'n', 'n', 3, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30=');

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
  PRIMARY KEY (`row_id`),
  KEY `site_id` (`site_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `var_id` (`var_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_matrix_data`
--

INSERT INTO `exp_matrix_data` (`row_id`, `site_id`, `entry_id`, `field_id`, `var_id`, `is_draft`, `row_order`, `col_id_1`, `col_id_2`, `col_id_3`, `col_id_4`, `col_id_5`, `col_id_6`) VALUES
(1, 1, 13, 7, NULL, 0, 1, 'Universities', '<p>\n	Randall Lewis Health Policy Fellows are enroled in graduate programs at local universities. They are selected to work with participating municipal leadership on Healthy Communities intiatives. The Fellow is placed with no cost to the city or agency, but we do ask that you participate in maintaining the quality of the fellowship program for our region.\n</p>\n<p>\n	If you are interested in working with a Fellow for 2013-2014, please take a moment to complete our interest form.\n</p>', NULL, NULL, NULL, NULL),
(2, 1, 13, 7, NULL, 0, 2, 'Students', '<p>\n	Randall Lewis Health Policy Fellows are enroled in graduate programs at local universities. They are selected to work with participating municipal leadership on Healthy Communities intiatives. The Fellow is placed with no cost to the city or agency, but we do ask that you participate in maintaining the quality of the fellowship program for our region.\n</p>\n<p>\n	If you are interested in working with a Fellow for 2013-2014, please take a moment to complete our interest form.\n</p>', NULL, NULL, NULL, NULL),
(3, 1, 13, 7, NULL, 0, 3, 'Cities / Agencies', '<p>\n	Randall Lewis Health Policy Fellows are enroled in graduate programs at local universities. They are selected to work with participating municipal leadership on Healthy Communities intiatives. The Fellow is placed with no cost to the city or agency, but we do ask that you participate in maintaining the quality of the fellowship program for our region.\n</p>\n<p>\n	If you are interested in working with a Fellow for 2013-2014, please take a moment to complete our interest form.\n</p>', NULL, NULL, NULL, NULL),
(4, 1, 14, 12, NULL, 0, 1, NULL, NULL, '{filedir_1}10219_1business_group.jpg', 'Randall Lewis Health Policy Fellowship', '<p>\n	Your donation to the Partners for Better Health Policy Fellowships will help us create a better future in the Inland Empire.\n</p>\n<p>\n	We are now seeking applications for The Randall Lewis Health Policy Fellowship for the 2011-2012 academic year. This prestigious and competitive fellowship is the first of its kind in the Inland Empire and will provide a unique opportunity to work directly with local communities in improving residents'' health. Five to seven applicants will be selected to serve as interns in cities within the Inland Empire. Fellows will develop the skills required to successfully influence local and regional health policy. We will have a direct influence on shaping the little p in health policy to make a difference in our communities.between the communities and the health sector.\n</p>', '');

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
(1, 1, 'longdao', 'Long Dao', '12979c641bc3b4e40c73d02cf5bbf2e376d3ccfed770602e3081d3ad20f2893dabe1926fbab9daed15fa4a9016f481d66b80bd0cb7cf6692f0e513596e0e8467', '@b0R2Xi)WskwA85Id;(ae54:r'':Vim[Tx8o#&\\)8>P!K3}qi-Wxh''!#{Lbu}{>x1rkVB#|VoP.Uqa08##kp;xN3I^K~>)ATey^s@FFoQm4?Z5CT;0.]m"<}t+Cel|v~Q', '92f71572c4d8aa6251ef1aa88162af2731307147', 'f3d4626675be8404dae6ec4c194165296cdc6ec0', NULL, 'support@maven20.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1375811349, 1376609979, 1376681330, 14, 0, 0, 0, 1376681149, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'America/Los_Angeles', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', '', 'Template Manager|C=design&M=manager&tgpref=1|1', 'n', 0, 'y', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

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
(14, 'Low_reorder', '2.2.1', 'y', 'n', NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_password_lockout`
--

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`) VALUES
(1, 1375826867, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.41 Safari/537.36', 'longdao'),
(2, 1376412634, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.49 Safari/537.36', 'admin');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1052 ;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`) VALUES
(976, 1376680996, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '40595270fe2c19906802ece3b227cb7b79b0a7dc'),
(975, 1376680996, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '97945708b600a215d5f68b8cecc6f24d2604fdec'),
(974, 1376680995, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5679500fbb0a739a29db2f1f0425d302a3d3d37e'),
(973, 1376680995, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f873eab54500b4052664474921007d50b78d7ae6'),
(972, 1376680994, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6b2f970b3a60b0d03488fa43d9bb4cac50d93ca4'),
(971, 1376680984, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '60a98375ecbea3aa5d02d4505be2d05b4c45a657'),
(970, 1376680983, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '512a9ebe21bcd9d1d4fa077af94fa5796db709d0'),
(969, 1376680979, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ae0f7b64ed4f5ec3dbac709b5342a67742093e58'),
(968, 1376680978, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '582b590cc49fd9d67998baaae9c84f75183d116a'),
(967, 1376680978, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e7029c8914adee66916c82335bf31f1aa71dcc66'),
(966, 1376680978, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0f40e291854aa66ee7fd50343ed1921535e3cb7f'),
(965, 1376680977, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f9b04d796378552a08c8929cf960073d7f7d322b'),
(964, 1376680975, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '90a79ee0159c006c9f2fbc8a29e611b5b5720f94'),
(963, 1376680974, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'c24b075dfaf91c06f39512745d0ba99b3ed6ad94'),
(962, 1376680972, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '8f76b6c231649d8f363ddb4f45acb6661998cf19'),
(961, 1376680972, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '07c4bae81e41fc06f63314f5d493df9fab2fdeea'),
(960, 1376680972, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '841ccf8a0a195d2e577b504052061d7c8b2c6622'),
(959, 1376680971, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '022d5e402db0b97d6ca326eda27b59ec0ef2307d'),
(958, 1376680971, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f31eeef39cef722be4f3fe2143c3c7f4b9b4ed1c'),
(957, 1376680962, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '92e53cd4a37797060794faf1c5fb76abd80665f3'),
(956, 1376680961, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6814946a15acd0a08f9d556073843914d9604476'),
(955, 1376680953, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0baf5578c14665f4eabe8e5c56bfa6d17c88af52'),
(863, 1376679813, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5057f3dd18170e127d4ae31c7d9feb5337fae20d'),
(862, 1376679812, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'acfa6cb955aab4926349a9145eaca9338ed3dd39'),
(861, 1376679809, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '05934af5e25ac284c80bb87b438e859209bc1fbe'),
(860, 1376679809, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ff8fb7adaf0bd1c0b3463ad2b6ec25ddb0df02f4'),
(858, 1376679803, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'b70776d81825d5c69172c0ddd88702a0545c392b'),
(859, 1376679808, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'dfb4a2fccd348fa90e4adc8f49f741126aa248cc'),
(856, 1376679801, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ea6236b6b6712580a018d2f264c5d2e0230d5499'),
(855, 1376679800, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e1b10275dd60ffe3cf2cec4a49e7159c74db88d6'),
(854, 1376679796, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'd737984274c7d9f0f97ed550ec877dc3bacfe37d'),
(853, 1376679796, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'a021e705500177c45148c17799f22f72786871e5'),
(852, 1376679795, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '3924ccbcc7649116c2eca71105c8289ab2da565d'),
(851, 1376679795, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'cee5c5a1bb8968825c02287f5bfaf532d8c72f21'),
(850, 1376679795, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'd9753de9aadba5d326880ab951246fb8e665457c'),
(849, 1376679793, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '15c50658a59a561e3db398978e59dc3968381f14'),
(848, 1376679793, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '319b6e1954e56f67f0fa75e4da79607a29454e7e'),
(846, 1376679786, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0f7a0d0489ac27fbe90610b8a3155764f9b3374a'),
(845, 1376679786, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e83249d155bacd55b44e1c3c76623fadaee87553'),
(844, 1376679786, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e6f153aa801449791cde9bed2143c4c9d74ab641'),
(843, 1376679785, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'bae286c43290f78f4e5dcbf9b0faadc9a1a06aa6'),
(847, 1376679792, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f704d70d6c18ae32400b8556303df670c3983e8a'),
(841, 1376679784, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'a42eaf05d74aa1d5f3f8a0e7ff79645ec1fc64cc'),
(840, 1376679783, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '22df178f76c888b55c43b4bb288127eee19c288a'),
(839, 1376679781, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '7e1024cea4f46d66e609c3de6bf5b5c095a8392b'),
(790, 1376679525, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '564e45db4c41467780a5b0263e1a459b8db59b75'),
(789, 1376679524, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '82f56256f3508389f4b1797e7456a6ad1017ccc9'),
(788, 1376679522, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '16d9e63a66f6701b52da670c4354010e3c644984'),
(786, 1376679520, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '839aca5a64bc703ed994a864bc437c3b37689f09'),
(785, 1376679517, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '91e3131a9395f045e728765c0e9acd7eef1fb44d'),
(784, 1376679512, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'd5b66f6f7c453b3bc2c9ea1d6ebdf010d64ac43b'),
(783, 1376679506, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '191ded30db984ac88674af6d865e0b620d118995'),
(782, 1376679505, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6d3d0a8c88740586de6de23a8fbd0ebb0a7eb9e0'),
(781, 1376679504, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0476d7f1c558e3edfc08bf3ebefe4f46f329a4ce'),
(780, 1376679503, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ec108dcf75f1a6935372ae6978273a9c4d83b4ff'),
(779, 1376679493, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '90c187ee700b9b9dfcfb06148cf367be808eda92'),
(778, 1376679492, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '04621aecf22b4c57a03f80546917763a5322b0d5'),
(777, 1376679484, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'faab9343d9ebefa69b22eb4c1d9db116a9f48dee'),
(770, 1376679470, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f80e985a11436a3a1120e84a6442e314b8b1c272'),
(773, 1376679481, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f3db9720594b4a2dfc61556efd97b27a9c3d72fb'),
(772, 1376679472, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'fb1234764e9f5175de913a8757a75e34fa008cd0'),
(774, 1376679482, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'a24868067743d58348393634917888ce8f5a5ec7'),
(775, 1376679483, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'fa1f53bcbaaee7a75c60c0a4b8e5ddb5a32c93e8'),
(776, 1376679484, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '1da924282849ab695d5ce668ec8972948011ea83'),
(759, 1376679420, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ceaaea90851511407ffff5d8b9dc9bc9a422de7d'),
(760, 1376679421, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '8f444df9e352e95f1f006b3d265807017c2b75bc'),
(763, 1376679441, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'eefc55ebf78c4b8a432504ace58fd22d0e6b2d48'),
(762, 1376679423, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '51cdc5cb36859b6171e26a161ab870a25cb1bbbe'),
(764, 1376679442, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'a344cc5c807761aa2e9bd6053844b3d641defdb8'),
(765, 1376679442, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f605001ae4e534b16feed38d3aac0c44f4f19a7c'),
(768, 1376679469, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'b6543b2168bfe1ec81e9678b12b809486e87fb84'),
(767, 1376679447, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6708fdaa4ea0df8dc9f95541bf2010ccf7af1b18'),
(769, 1376679469, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '414a22fd27b3330cdf8eccafabf6950df13e360c'),
(954, 1376680952, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f88631c388ac5f2a5e387051ef35a923941376f9'),
(952, 1376680873, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '018bf87e60096a81ff0e9a18e1f76ef57192fd0a'),
(953, 1376680951, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'c6eb90ddf21d258c92996d77b1cb0ebf4de5e571'),
(950, 1376680870, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '4f593f54fcfae450b16ea93654321dc476afe06e'),
(949, 1376680870, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '956cc504d5fd55a5f66d91d27a3fd7ec4f01113f'),
(947, 1376680858, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ff78f56c42d3ec5daac03e3509cbe347288518c1'),
(948, 1376680869, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5813c918ac979b935e24ff7160b848b1017c4536'),
(945, 1376680856, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'cfce0d08f5e212e66da7806be1e47863697cac14'),
(944, 1376680855, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '09d24aad4a3b11dd6940e8c453ac624b30836c66'),
(942, 1376680846, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '12c54de7d1288255bf62a20fbcb20e7f8d4d791b'),
(943, 1376680854, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e3e9ae10f7624913fe89de8ea365e4552f1d7721'),
(940, 1376680845, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '19c8edd8218bc842e3d77fb0a2db4cae3f95e437'),
(939, 1376680844, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '69e126a07f04c730bae3d0cbd9255363fc075f06'),
(937, 1376680839, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ab146cd841f99f40cb21475321e1b7c3306c2923'),
(938, 1376680843, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '1ed61c58e96bb862686b7345a2fcc22cab53cb6e'),
(935, 1376680834, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f8b27a616fcafe44c35544191a0784ea9ef4eabb'),
(934, 1376680833, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e498dc776d7a0d3dd8826155a8c85a02577257d1'),
(932, 1376680814, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '1f75ea8c7096fa9c67c141489f0956d36c37fce8'),
(933, 1376680832, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'da0d4a40a76948c3bcf8d70231c82e8b7f1d8b2f'),
(930, 1376680812, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5fdcc272bd5c9e924a254b03ba4ab03db3660162'),
(929, 1376680811, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '42ac64e1f8a17cb5535b7faeda9fa377fcfe6c80'),
(927, 1376680765, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0b2563403434920c137318655802b2473cf0b3c8'),
(928, 1376680810, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'a4d28908b69711ffe57d83aca456a7f84daa6cc6'),
(925, 1376680762, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '21703bbba8be3a83954512a849c37311580b9482'),
(924, 1376680762, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '55544686cb8e1f925636a323db21378b6b5bb409'),
(923, 1376680759, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '934c0c39e5fbd33fadc0892abcc11fdb815db48a'),
(922, 1376680758, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '67d9c5197cfb22cb0ca6f0c9a16378ff6ae3a726'),
(921, 1376680516, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '48f06d56dcc835a51c15d61c9f13c3ccc00e61ea'),
(920, 1376680515, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e46bc2f143e99dfe40e328cfc0ee8ed5a5fd3ffd'),
(919, 1376680513, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e69f52fead79a588c7b9faec0d8e61aa830d5d3a'),
(918, 1376680128, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5db16e1c737555f85f9fea5e7c4e17f0a7deb323'),
(917, 1376680127, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '7aa49b4f7ec723118491fa84af3f186e7c090ce6'),
(916, 1376680125, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '3186867d62714f89d83d64a5ff05d6c1323cacfd'),
(915, 1376680124, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f91239064be9d2d2053d180920d59657bdf0bfda'),
(914, 1376680122, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '856ea490554a21ebff1fae200c69b00bd8ead4bd'),
(913, 1376680122, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'a21c8a7b13e511730ad703b815e24e8547e054dc'),
(912, 1376680114, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '61fd824d14085cfd5484a0e6f8bce589ae43155a'),
(911, 1376680114, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '17acdae2ed5ed434a9d22c950737f0f3b58476ae'),
(910, 1376680114, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '673738d9e56426e249f67fd37c13be82c99a10b7'),
(909, 1376680114, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'aef8a0ba01389fb0231055577fb72ec49ff2b486'),
(908, 1376680113, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '9b8b2cfcb6cce945c13ed91e446bda5d85d01803'),
(907, 1376679963, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6c42e9aa1dbc78ac7d1d3c59d4087beb9c8d2ca1'),
(906, 1376679962, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'fe0aa25e70f214441fafb96582dc57d195aa6b3f'),
(904, 1376679907, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '1d45a9230f79dae76e981e25e9f81a80cf4fd6a5'),
(903, 1376679907, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '647bb220ac6724c8ec772ac9ab5662217b3dc502'),
(902, 1376679907, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '419c15304e3115649ca4a3a224edfa9825bffb68'),
(901, 1376679907, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5c4e66927a841847f98699f0e93a14f18360582c'),
(905, 1376679961, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '265da157d972d343898f302318c9796e4d062a81'),
(899, 1376679900, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '58af924e1fdaa9bc8992393802d1ad4b2eac78e7'),
(898, 1376679900, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '25a9e424484b5a9dad0743b13f463660a46c49fa'),
(897, 1376679900, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '76535f9c4d21217b27c48a5b32ff07d0b9f3caa4'),
(896, 1376679889, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '289195ec47839ccd6068e4421572b81d156fca95'),
(895, 1376679889, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '4eb0a992b0f5e028e665bd9baee6f51368e5a91e'),
(894, 1376679884, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '3056a2ebd22afe0fa3054915e9208dfa327e0b8f'),
(893, 1376679884, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '77719fd8d45e21ed747ceeb4896e84d0f46954d9'),
(892, 1376679884, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '3a4aa647114c9b408e1a57967be2e509928ed15f'),
(891, 1376679882, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '161175b35035bc2da3c3b4cb29e7ddd44bdb963f'),
(890, 1376679863, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '643274e33080d2df7cb032656c2f49ef7b14e0ee'),
(889, 1376679862, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '2f2304155e72e1d120ce527929cb06e43dc8cbe0'),
(888, 1376679862, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f3db09715dbf98497a27ea5a448327424ec2058a'),
(887, 1376679862, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ea8656c3c6ffcfdb6d30de3123c21471977e3931'),
(886, 1376679862, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ca028ded2f3f6e0feecd538baf7aac88991d000f'),
(885, 1376679861, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '9f85341760b7aeb96b6b3d8cd80dfae433135045'),
(884, 1376679861, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6c1541acc4bd3390fd4023a2d684ce347b7304ad'),
(883, 1376679861, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f2131a58fe1498162d464ce38c188b60a3a1e58d'),
(882, 1376679861, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '1e01dfe8e0dae063de7cdb8375db774633239b0c'),
(881, 1376679860, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'b3c7709500a0f2dae0d66114393fc618a2b484d4'),
(880, 1376679858, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '230c159803d12cde249f4ec39ae33ba3a2eaa835'),
(879, 1376679856, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '7e0dce214eb3669200160f98b4afce82e6d57251'),
(878, 1376679850, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'd0ce570fa3bf2989f325a1f5187468283d91310f'),
(877, 1376679849, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'bcc97946446e9ac28e02662d3958eea505fa92ac'),
(875, 1376679827, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'cf0f54340863ce7044e6aad6a5f8bb4b6994658f'),
(874, 1376679827, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '08cc28cf8d657b183c4f83bbe913215956194c6c'),
(873, 1376679826, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6a398cab74d2371a096db1b76849e3b1be288820'),
(872, 1376679826, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0e5d588ee853cdb05f71608e5d97d6e2af5a3c0a'),
(876, 1376679848, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '768dbfb642efc12ec5e129273e9692d6755861bd'),
(870, 1376679822, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'cbb4e0c1672bf76af277a67210f5540e6d4bc429'),
(869, 1376679821, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '028cfcac2aa8f8e03760b91f3f123417c406e627'),
(868, 1376679816, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'fc2dbab72b148d20ae2de55b0bce4d2c7303b514'),
(867, 1376679816, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'd2d2b2686fe14bc96dbf56b464a6fc3752f5be84'),
(866, 1376679816, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '583e3fce90dd5cd3ad19357a57278393fd3b3dc6'),
(865, 1376679816, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '03799810a5df5e49c1ebc842265de464b45038e5'),
(864, 1376679815, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '130836639363ba7409921a5d0855e8156ebd91b3'),
(838, 1376679781, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5259496bc59a3d26dfa2ebfd182fcc267dfa69ab'),
(836, 1376679769, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '72d9480a6cd23ab31855cf63a896d1a46f358804'),
(837, 1376679780, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '26c2ad0fd395d4ad16f18e24392f74794840d0fb'),
(834, 1376679768, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '7442c1363e4b0987ce5403d7acec867ac7a20059'),
(833, 1376679767, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '8a64388279e61813aa7e738af3098e01eee0d922'),
(832, 1376679766, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'd30ca2aac5ecb792a6d4753ecc8f6164b07631a7'),
(831, 1376679765, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '1e5be07279144a3e972ef473f50cf875e654f98b'),
(829, 1376679756, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '8e6b346b452d228b6baa0468aed391b063769b99'),
(830, 1376679765, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '1b9cccd0161da9f20fea836ea8c2263a51b10ea3'),
(827, 1376679749, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'b31cbeb22c0895e5527d9d3b9ad13bbd131d200f'),
(826, 1376679747, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'a93a80419b8b2bb18dabe283c9dd4c22f34a62f3'),
(825, 1376679744, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'eb669098f411efd14ac704892496b928f9a95600'),
(823, 1376679732, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '82d9550dab4c1153d817bcc8ceef1628292fa480'),
(824, 1376679743, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'cc8b0bac1308ccd17299b8b9f4d8d4679bf356c7'),
(821, 1376679729, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ac615d7b60deb00bbbda38111b9fcdb550747049'),
(820, 1376679729, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '447f04f534762623befa6667c1d30a0b2a5a04ad'),
(819, 1376679726, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'adff3c7a38f13a72f9bcbd66fed8d29d6079d04e'),
(818, 1376679725, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '3e48da6694a6e78652526f143cbb53fc95d68b60'),
(817, 1376679718, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'b62aa671b6c8d6ef6d177417d8e9ddc8329ee79e'),
(816, 1376679718, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '53caa21e5dff82cd9ff338caa6907ab91d898dfb'),
(815, 1376679718, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0127d1d274345b9853a01cd3520744c2fe151ecd'),
(814, 1376679718, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'd8a4c6245fb48ba22d0f1fc9e23e72f5dfaf4beb'),
(813, 1376679717, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'd2584a55c7e6469f1fd5d8477fa6454e3a2e4b86'),
(812, 1376679716, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '69dba0fcaeb27ffeaf723197621a3f7a70d3426a'),
(811, 1376679715, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6bc91494f34cff2089bb19a7149f1ae52db41f18'),
(810, 1376679710, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ec90bcbae02451781a089c52daa9990ac2e5f57a'),
(809, 1376679710, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'b661fdc9b7dd6b8a0e61b703db50321efc52b918'),
(807, 1376679695, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '8592abf89128bda5701e39ba7e6228811cbc7bb5'),
(808, 1376679709, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '646656dfae1379054ddd2cd931dcd66507d2cd76'),
(805, 1376679691, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '36ac63890fa92465c8bd1960b19f3137ab0c7e6d'),
(804, 1376679691, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '1f0099c9cbe7b65a16f385431b537ad9c1f043a3'),
(803, 1376679684, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '01ebaa92aaba6e617c7358540b9859e21961ab6b'),
(802, 1376679683, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '18673ec80b3791d56f1f1047f4c42ffb52096425'),
(801, 1376679683, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'a76590bab78c1f556b649d9a682c60b70843d4d7'),
(800, 1376679683, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0590ae1e6b51c3c3b8fd8c643dfc28f0c02f2f89'),
(799, 1376679680, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'da2d4e19048aafab6e58e3ce15b8596d4a05d446'),
(798, 1376679678, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '2c0196f0dc2fcf92747c5875de813403cb574184'),
(797, 1376679677, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '761251d22e70f54218bb1095965d3c1d1b59fc5a'),
(796, 1376679652, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '2caa376cc94a9267d8560d163dcd8c9fc44ca01a'),
(795, 1376679651, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '65a33e95bbab30b23eeb99745b9c7a74fe13d18a'),
(793, 1376679533, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '98c5bbeea6be22361474370a915199d03d8ddc75'),
(794, 1376679650, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0a97883407e0a94af7aa1da919fbc55079b3bdf6'),
(791, 1376679526, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'bf3b3b5733678af1c7a8471b5ebeb39b6e641f2c'),
(757, 1376679386, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '2f3f05687d9d5475f84fa0b65864b92253253892'),
(758, 1376679419, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '92f8d0c21c99802ae63ea12d1e97052d3105680a'),
(755, 1376679383, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '2b9e828fe5ebfb9669083c699ea64349794ae273'),
(754, 1376679383, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e1d28e3821b1eed89ea6ef383fb62d44b160352b'),
(752, 1376679286, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '645459c9d53e13ec9591785c70f19de4151b9c54'),
(753, 1376679382, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '741168df362a11ec527aed3091d54a943ef704a8'),
(750, 1376679277, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ccf314b336e81151faabfc84f68dee33a31a7f40'),
(749, 1376679277, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '8b136e821ca1dc939e963f2505ee28fcdd662182'),
(748, 1376679244, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '8ecbaa8bc236bd2f41b190c4f6a4b89285ff347a'),
(747, 1376679244, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '503424bb1f60404c6b9be3eace8f91ff9a0cb9c1'),
(743, 1376679229, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '9a8eb9e7a0b1645fb59a7c22b49a446d0e923fa7'),
(746, 1376679240, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5d716bb9e55e6f96943d14c10395c69d509d1977'),
(745, 1376679238, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '94dd7f7f7f1120d9b2d36fddc2a1c0610bc73a44'),
(742, 1376679228, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '3b44af0f1ad7841f5505153669a6cd0f59b9c7b6'),
(741, 1376679097, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '928fc31746baf3f89b9f53bb034af505c2c22392'),
(739, 1376679094, '0', '970bdc5cd5521564703fa5d500bb296504e023e8'),
(740, 1376679094, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '231304142d6718357c03ef946f3a8e5d57821f11'),
(977, 1376681003, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '39f4f00a4f22b5c801df32e731e7d27070069ca1'),
(978, 1376681004, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ef590ac127d40987857f782750bde877eaac4b4b'),
(979, 1376681004, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'a5f30b609c95ef11f94dcf8ca8a04ab3d22e121a'),
(980, 1376681007, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'd561530c6daaea3a5f7ba05fc53cac01b66c1066'),
(981, 1376681007, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '99982e7be3d4eb92519a377a08d145cb7daa4b57'),
(982, 1376681007, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ba75cce3451791344fee0e0a577bf5bc9fd06132'),
(983, 1376681008, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '4d1d7aec4adb29e16adfb2d610f061aebcdfff25'),
(984, 1376681008, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'a001b62531ba4a70a6a511b10e89a65765c18ada'),
(985, 1376681024, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0953efad93139b494168941b28095432f651faa9'),
(986, 1376681025, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6c2ed88e931856086c333b6a9828e32039b31db1'),
(987, 1376681031, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e3be5e99be397f30848f6e961c175ad0fd82ab0f'),
(988, 1376681032, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5bea761df75459f7d2d8027c01121118ea481f19'),
(989, 1376681036, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'da130c724b1692513dceb7f5dae28c9a7d987ac2'),
(990, 1376681037, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '7be9a314f25ed77a5e1588e52b9f1f3df72839d0'),
(993, 1376681044, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'acd304053bce9abf5ddf266977f1be24e388769f'),
(992, 1376681041, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'b166c5333c4a73afed9ef87eb2f28b1c41af14fc'),
(994, 1376681044, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f6c0cfcaa4fdcab7a792c0fc6d593a363315a813'),
(995, 1376681045, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '965fef27036d5153d7104cdc958a85448aa6caa7'),
(996, 1376681045, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '499ac5f6a1b67126ffdd2b44fdff1e8c6d75be29'),
(997, 1376681046, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '4390fe619d06e2fdce1b7c75d6538bb0602096b0'),
(1011, 1376681149, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0cacdda7e724f0ad0e87c4229498efd7bcb71a9f'),
(999, 1376681050, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '86fbcd2d393b2bed0cb3820865c6bfb4a73a25cc'),
(1000, 1376681050, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '98792391dcc979b30970ac92d48e8182aca0cc89'),
(1001, 1376681050, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '71e98d2adbdca64c5d731edcd72665f3bac66ff3'),
(1002, 1376681051, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '1c7fee8ffe64d7a7a91c1071b16fb73b4677fc7e'),
(1003, 1376681098, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '733969d95fa06676d86d8e51cab5f2a7d2926783'),
(1006, 1376681123, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'f30c4a9422f3da484ccbbd53ee2f28d9d9d87fa7'),
(1005, 1376681112, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '3c82cfc4d62f54a83f27eede0028bd9f50dbaaf4'),
(1007, 1376681126, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5ea741c5a8c0f213ab17bd79933bfd905abd8ebd'),
(1008, 1376681126, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5037508923a2977ffe6b270cfa1d780b685f83bd'),
(1009, 1376681126, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'c2fa51bc4a08288827ee02b13e3f91b95c77ce40'),
(1010, 1376681126, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '752246d888d9fd31818003a2fdb5bf81c8afe0f2'),
(1012, 1376681150, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'd7f5faa45de051b1faf91dbb6130403638218fbc'),
(1013, 1376681150, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '10014c18f44441f63521c63ccc509b17e0f92a2f'),
(1014, 1376681157, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '00f6e89b6f60da6cc2c79631267db97bc839bd8d'),
(1015, 1376681161, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'd7bf5060e1c3328328f52fc2ce5e1b6c792e5774'),
(1016, 1376681161, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6d01c77d80bf4960ac6a8942c032bb72e3c8943b'),
(1017, 1376681162, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5d0ec69aea9544f7608d1816b35f7bb04f1bd13c'),
(1018, 1376681163, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e1554d79f5864735d931adde9ea0807109d17797'),
(1021, 1376681170, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '2ae4dbe41aeb65cb049a4418a6a613d8dedd3eb4'),
(1020, 1376681165, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6e2aaea1368654c84475f621793123cb563c8c89'),
(1022, 1376681171, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '85129cebe602f58a81c671b95849d66788cf1a51'),
(1023, 1376681171, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'faceb7355b721225a406bba50f493ebc5c276a75'),
(1024, 1376681302, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'cb0af0c1696162f69da34087d7d4f3f35eeb19f9'),
(1025, 1376681303, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '03a3cf51a146978a1dbedd1616010f2f42ec2b2f'),
(1026, 1376681305, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '8d90f3c8ea1c7d71129b58df7fbe5fd28d79618c'),
(1027, 1376681305, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '1866c40dc43bf850ae2804d63c3f711a14803c16'),
(1028, 1376681305, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'a08c5c07bcf9981c6b6912c965bdc6e159f0b927'),
(1029, 1376681306, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '6a21ca92748478defb5555438404846ba7566ce4'),
(1030, 1376681306, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ccfcee39c90cadcd0a0fa2f7683670e0cdef8ee7'),
(1031, 1376681313, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5a4d6fdb7a1e4f893ea56f417eb83474af665e61'),
(1032, 1376681313, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5ad83694e888fb212d6882e67364a52e0dfece27'),
(1033, 1376681315, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '4e606cf6449877e6eacf8965fe0308350800dcd5'),
(1034, 1376681316, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'b5e26381fc0d2a979cef2f657fa304bc97b5c788'),
(1037, 1376681330, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '0b31e61b786293aec7bd3daa16b141c454fecfd8'),
(1036, 1376681318, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '2acaf3f1178ab47ceb9644760ff33651ac5b9736'),
(1038, 1376681330, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '74b358178325bae45124befa52795ca8a10dc0a3'),
(1039, 1376681331, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'b2c5d46bc1c3d046caf2bd5f054132f2f81338ae'),
(1042, 1376681363, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '32451e3e8775a5cce8ca75021e9037897023308b'),
(1041, 1376681342, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '19e5b5fcb61eae27d50bcc36f0b514f96fb057f7'),
(1043, 1376681364, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '03def945f162c390b3f9461d6c924760b42b453a'),
(1044, 1376681365, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'ab2909f17ddf4d134f707ab401a8816342eeac5a'),
(1045, 1376681522, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', 'e52769ab192b9078abd3ebf43561b7bd0fb58cd1'),
(1046, 1376681523, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '28e7452ba30cddc32c2f1ee66c99f86d73e3e098'),
(1047, 1376681524, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '9583a2f824757809462bdbe561466ab7297d43f9'),
(1048, 1376681525, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '4a5982cc10cee6466a79a67946bb719c11cb54ae'),
(1049, 1376681525, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '3c9416a4c2747028112f168fe77f5753ab9a9d86'),
(1050, 1376681526, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '5fe1a9ea70fff8ee324701aa545ee480df63a5b8'),
(1051, 1376681526, '0128b51062e091f2556b4e667ba657a9ba8a4b0c', '61a84bdfc96436469aa04209360bf95902f2f66b');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

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
(14, 1, 14, '', '', '');

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
('0128b51062e091f2556b4e667ba657a9ba8a4b0c', 1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.55 Safari/537.36', 'd229ff47eb517a11d2d08e1565db2339', 1376679094, 1376681526);

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
(1, 'Partners for Better Health', 'default_site', NULL, 'YTo5MDp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbC5wNGJoZWFsdGgub3JnLyI7czoxNjoidGhlbWVfZm9sZGVyX3VybCI7czozNDoiaHR0cDovL2xvY2FsLnA0YmhlYWx0aC5vcmcvdGhlbWVzLyI7czoxNToid2VibWFzdGVyX2VtYWlsIjtzOjE5OiJzdXBwb3J0QG1hdmVuMjAuY29tIjtzOjE0OiJ3ZWJtYXN0ZXJfbmFtZSI7czowOiIiO3M6MjA6ImNoYW5uZWxfbm9tZW5jbGF0dXJlIjtzOjc6ImNoYW5uZWwiO3M6MTA6Im1heF9jYWNoZXMiO3M6MzoiMTUwIjtzOjExOiJjYXB0Y2hhX3VybCI7czo0MzoiaHR0cDovL2xvY2FsLnA0YmhlYWx0aC5vcmcvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjI3OiJJOlxnaXRcUEJIXGltYWdlc1xjYXB0Y2hhc1wiO3M6MTI6ImNhcHRjaGFfZm9udCI7czoxOiJ5IjtzOjEyOiJjYXB0Y2hhX3JhbmQiO3M6MToieSI7czoyMzoiY2FwdGNoYV9yZXF1aXJlX21lbWJlcnMiO3M6MToibiI7czoxNzoiZW5hYmxlX2RiX2NhY2hpbmciO3M6MToibiI7czoxODoiZW5hYmxlX3NxbF9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImZvcmNlX3F1ZXJ5X3N0cmluZyI7czoxOiJuIjtzOjEzOiJzaG93X3Byb2ZpbGVyIjtzOjE6Im4iO3M6MTg6InRlbXBsYXRlX2RlYnVnZ2luZyI7czoxOiJuIjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czoxNzoidXNlcl9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoxODoiYWRtaW5fc2Vzc2lvbl90eXBlIjtzOjI6ImNzIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjc6InJlZnJlc2giO3M6OToiZGVmdF9sYW5nIjtzOjc6ImVuZ2xpc2giO3M6ODoieG1sX2xhbmciO3M6MjoiZW4iO3M6MTI6InNlbmRfaGVhZGVycyI7czoxOiJ5IjtzOjExOiJnemlwX291dHB1dCI7czoxOiJuIjtzOjEzOiJsb2dfcmVmZXJyZXJzIjtzOjE6Im4iO3M6MTM6Im1heF9yZWZlcnJlcnMiO3M6MzoiNTAwIjtzOjExOiJ0aW1lX2Zvcm1hdCI7czoyOiJ1cyI7czoxNToic2VydmVyX3RpbWV6b25lIjtzOjE5OiJBbWVyaWNhL0xvc19BbmdlbGVzIjtzOjEzOiJzZXJ2ZXJfb2Zmc2V0IjtzOjA6IiI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjE5OiJBbWVyaWNhL0xvc19BbmdlbGVzIjtzOjE1OiJob25vcl9lbnRyeV9kc3QiO3M6MToieSI7czoxMzoibWFpbF9wcm90b2NvbCI7czo0OiJtYWlsIjtzOjExOiJzbXRwX3NlcnZlciI7czowOiIiO3M6MTM6InNtdHBfdXNlcm5hbWUiO3M6MDoiIjtzOjEzOiJzbXRwX3Bhc3N3b3JkIjtzOjA6IiI7czoxMToiZW1haWxfZGVidWciO3M6MToibiI7czoxMzoiZW1haWxfY2hhcnNldCI7czo1OiJ1dGYtOCI7czoxNToiZW1haWxfYmF0Y2htb2RlIjtzOjE6Im4iO3M6MTY6ImVtYWlsX2JhdGNoX3NpemUiO3M6MDoiIjtzOjExOiJtYWlsX2Zvcm1hdCI7czo1OiJwbGFpbiI7czo5OiJ3b3JkX3dyYXAiO3M6MToieSI7czoyMjoiZW1haWxfY29uc29sZV90aW1lbG9jayI7czoxOiI1IjtzOjIyOiJsb2dfZW1haWxfY29uc29sZV9tc2dzIjtzOjE6InkiO3M6ODoiY3BfdGhlbWUiO3M6NzoiZGVmYXVsdCI7czoyMToiZW1haWxfbW9kdWxlX2NhcHRjaGFzIjtzOjE6Im4iO3M6MTY6ImxvZ19zZWFyY2hfdGVybXMiO3M6MToieSI7czoxMjoic2VjdXJlX2Zvcm1zIjtzOjE6InkiO3M6MTk6ImRlbnlfZHVwbGljYXRlX2RhdGEiO3M6MToieSI7czoyNDoicmVkaXJlY3Rfc3VibWl0dGVkX2xpbmtzIjtzOjE6Im4iO3M6MTY6ImVuYWJsZV9jZW5zb3JpbmciO3M6MToibiI7czoxNDoiY2Vuc29yZWRfd29yZHMiO3M6MDoiIjtzOjE4OiJjZW5zb3JfcmVwbGFjZW1lbnQiO3M6MDoiIjtzOjEwOiJiYW5uZWRfaXBzIjtzOjA6IiI7czoxMzoiYmFubmVkX2VtYWlscyI7czowOiIiO3M6MTY6ImJhbm5lZF91c2VybmFtZXMiO3M6MDoiIjtzOjE5OiJiYW5uZWRfc2NyZWVuX25hbWVzIjtzOjA6IiI7czoxMDoiYmFuX2FjdGlvbiI7czo4OiJyZXN0cmljdCI7czoxMToiYmFuX21lc3NhZ2UiO3M6MzQ6IlRoaXMgc2l0ZSBpcyBjdXJyZW50bHkgdW5hdmFpbGFibGUiO3M6MTU6ImJhbl9kZXN0aW5hdGlvbiI7czoyMToiaHR0cDovL3d3dy55YWhvby5jb20vIjtzOjE2OiJlbmFibGVfZW1vdGljb25zIjtzOjE6InkiO3M6MTI6ImVtb3RpY29uX3VybCI7czo0MjoiaHR0cDovL2xvY2FsLnA0YmhlYWx0aC5vcmcvaW1hZ2VzL3NtaWxleXMvIjtzOjE5OiJyZWNvdW50X2JhdGNoX3RvdGFsIjtzOjQ6IjEwMDAiO3M6MTc6Im5ld192ZXJzaW9uX2NoZWNrIjtzOjE6InkiO3M6MTc6ImVuYWJsZV90aHJvdHRsaW5nIjtzOjE6Im4iO3M6MTc6ImJhbmlzaF9tYXNrZWRfaXBzIjtzOjE6InkiO3M6MTQ6Im1heF9wYWdlX2xvYWRzIjtzOjI6IjEwIjtzOjEzOiJ0aW1lX2ludGVydmFsIjtzOjE6IjgiO3M6MTI6ImxvY2tvdXRfdGltZSI7czoyOiIzMCI7czoxNToiYmFuaXNobWVudF90eXBlIjtzOjc6Im1lc3NhZ2UiO3M6MTQ6ImJhbmlzaG1lbnRfdXJsIjtzOjA6IiI7czoxODoiYmFuaXNobWVudF9tZXNzYWdlIjtzOjUwOiJZb3UgaGF2ZSBleGNlZWRlZCB0aGUgYWxsb3dlZCBwYWdlIGxvYWQgZnJlcXVlbmN5LiI7czoxNzoiZW5hYmxlX3NlYXJjaF9sb2ciO3M6MToieSI7czoxOToibWF4X2xvZ2dlZF9zZWFyY2hlcyI7czozOiI1MDAiO3M6MTc6InRoZW1lX2ZvbGRlcl9wYXRoIjtzOjI3OiJJOi9naXQvUEJIL2h0dHBkb2NzL3RoZW1lcy8iO3M6MTA6ImlzX3NpdGVfb24iO3M6MToieSI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjt9', 'YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==', 'YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6NDI6Imh0dHA6Ly9sb2NhbC5wNGJoZWFsdGgub3JnL2ltYWdlcy9hdmF0YXJzLyI7czoxMToiYXZhdGFyX3BhdGgiO3M6MjY6Ikk6XGdpdFxQQkhcaW1hZ2VzXGF2YXRhcnNcIjtzOjE2OiJhdmF0YXJfbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNzoiYXZhdGFyX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEzOiJhdmF0YXJfbWF4X2tiIjtzOjI6IjUwIjtzOjEzOiJlbmFibGVfcGhvdG9zIjtzOjE6Im4iO3M6OToicGhvdG9fdXJsIjtzOjQ4OiJodHRwOi8vbG9jYWwucDRiaGVhbHRoLm9yZy9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTA6InBob3RvX3BhdGgiO3M6MzI6Ikk6XGdpdFxQQkhcaW1hZ2VzXG1lbWJlcl9waG90b3NcIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjI6IjUwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6InkiO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6NTY6Imh0dHA6Ly9sb2NhbC5wNGJoZWFsdGgub3JnL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjEyOiJzaWdfaW1nX3BhdGgiO3M6NDA6Ikk6XGdpdFxQQkhcaW1hZ2VzXHNpZ25hdHVyZV9hdHRhY2htZW50c1wiO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czozMzoiSTpcZ2l0XFBCSFxpbWFnZXNccG1fYXR0YWNobWVudHNcIjtzOjIzOiJwcnZfbXNnX21heF9hdHRhY2htZW50cyI7czoxOiIzIjtzOjIyOiJwcnZfbXNnX2F0dGFjaF9tYXhzaXplIjtzOjM6IjI1MCI7czoyMDoicHJ2X21zZ19hdHRhY2hfdG90YWwiO3M6MzoiMTAwIjtzOjE5OiJwcnZfbXNnX2h0bWxfZm9ybWF0IjtzOjQ6InNhZmUiO3M6MTg6InBydl9tc2dfYXV0b19saW5rcyI7czoxOiJ5IjtzOjE3OiJwcnZfbXNnX21heF9jaGFycyI7czo0OiI2MDAwIjtzOjE5OiJtZW1iZXJsaXN0X29yZGVyX2J5IjtzOjExOiJ0b3RhbF9wb3N0cyI7czoyMToibWVtYmVybGlzdF9zb3J0X29yZGVyIjtzOjQ6ImRlc2MiO3M6MjA6Im1lbWJlcmxpc3Rfcm93X2xpbWl0IjtzOjI6IjIwIjt9', 'YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJ5IjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6Im4iO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czoxOiJcIjt9', 'YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=', 'YToxOntzOjI5OiJJOlxnaXRcUEJIXGh0dHBkb2NzXGluZGV4LnBocCI7czozMjoiZjM5MzU3ZTVlZDNhZjc4N2FiNWFmMjQzYTg5YjIwNmUiO30=', 'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyNzoiaHR0cDovL2xvY2FsLnA0YmhlYWx0aC5vcmcvIjtzOjQ6InVyaXMiO2E6MTE6e2k6MTtzOjk6Ii9ob21lcGFnZSI7aToxMztzOjEzOiIvZ2V0LWludm9sdmVkIjtpOjQ7czo5OiIvcHJvamVjdHMiO2k6NztzOjg6Ii9zdG9yaWVzIjtpOjE0O3M6NToiL2dpdmUiO2k6NjtzOjY6Ii9hYm91dCI7aTo4O3M6MTU6Ii9hYm91dC9hYm91dC11cyI7aTo5O3M6MTE6Ii9hYm91dC90ZWFtIjtpOjEwO3M6MTM6Ii9hYm91dC9hbHVtbmkiO2k6MTE7czoyOToiL2Fib3V0L3BhcnRuZXJzLW9yZ2FuaXphdGlvbnMiO2k6MTI7czoyMjoiL2Fib3V0L3Jlc291cmNlcy1saW5rcyI7fXM6OToidGVtcGxhdGVzIjthOjExOntpOjE7czoxOiIyIjtpOjQ7czoxOiIyIjtpOjY7czoxOiIyIjtpOjc7czoxOiIyIjtpOjg7czoxOiIyIjtpOjk7czoxOiIyIjtpOjEwO3M6MToiMiI7aToxMTtzOjE6IjIiO2k6MTI7czoxOiIyIjtpOjEzO3M6MToiMiI7aToxNDtzOjE6IjIiO319fQ==');

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
(1, 0, 'www_js_foot', '<!-- JS and analytics only. -->\r\n\r\n<!-- Slider. For some reason, it doesn''t load correctly if placed below other scripts here-->\r\n<script>\r\n    jQuery(document).ready(function($) {\r\n	$(''#full-width-slider'').royalSlider({\r\n		arrowsNav: true,\r\n		loop: true,\r\n		keyboardNavEnabled: true,\r\n		controlsInside: false,\r\n		imageScaleMode: ''fill'',\r\n		arrowsNavAutoHide: false,\r\n		autoScaleSlider: true, \r\n		autoScaleSliderWidth: 960,     \r\n		autoScaleSliderHeight: 400,\r\n		controlNavigation: ''bullets'',\r\n		thumbsFitInViewport: true,\r\n		navigateByClick: true,\r\n		startSlideId: 0,\r\n		autoPlay: true,\r\n		transitionType:''move'',\r\n		globalCaption: true,\r\n		deeplinking: {\r\n			enabled: true,\r\n			change: false\r\n		},\r\n		/* size of all images http://help.dimsemenov.com/kb/royalslider-jquery-plugin-faq/adding-width-and-height-properties-to-images */\r\n		imgWidth: 1400,\r\n		imgHeight: 715\r\n		});\r\n	});\r\n</script>\r\n\r\n<!-- Bootstrap core JavaScript\r\n================================================== -->\r\n<!-- Placed at the end of the document so the pages load faster -->\r\n<!-- backbone\r\n    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/backbone.js/0.9.10/backbone-min.js"></script>\r\n    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.4.3/underscore-min.js"></script>\r\n-->\r\n<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>\r\n<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>\r\n<script src="/assets/js/lib.js"></script>\r\n<script src="/assets/js/app.js"></script>\r\n\r\n<!-- Livereload code (http://livereload.com/) -->\r\n<script>document.write(''<script src="http://'' + (location.host || ''localhost'').split('':'')[0] + '':35729/livereload.js?snipver=1"></'' + ''script>'')</script>\r\n\r\n\r\n<!-- Y Axis Loader -->\r\n<script src="/assets/js/gridloading/masonry.pkgd.min.js"></script>\r\n<script src="/assets/js/gridloading/imagesloaded.js"></script>\r\n<script src="/assets/js/gridloading/classie.js"></script>\r\n<script src="/assets/js/gridloading/AnimOnScroll.js"></script>\r\n<script>\r\n	new AnimOnScroll( document.getElementById( ''grid'' ), {\r\n		minDuration : 0.3,\r\n		maxDuration : 0.6,\r\n		viewportFactor : 0.6\r\n	} );\r\n</script>'),
(2, 0, 'www_metatags', '<!-- Meta, title, CSS, favicons, etc. -->\r\n<meta charset="utf-8">\r\n<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=0">\r\n{!--<meta name="apple-mobile-web-app-capable" content="yes" />--}\r\n<!--[if lte IE 9]><meta http-equiv="X-UA-Compatible" content="chrome=1" /><![endif]-->\r\n<meta name="author" content="Maven 2.0">\r\n'),
(3, 0, 'www_stylesheets', '<!-- Core CSS -->\r\n<link href="{exp:cache_buster file="/assets/css/screen.css" separator="?"}" rel="stylesheet">\r\n<link href=''http://fonts.googleapis.com/css?family=Maven+Pro'' rel=''stylesheet'' type=''text/css''>\r\n');

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
(1, 1, 1, 1, 'admin', 11, 0, 0, 0, 1376681040, 0, 0, 0, 0, 0, 1377026223);

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
(0, 0, 0, 0, 0, 1, 26, 'root', 'n'),
(1, 1, 0, 1, 0, 2, 3, '', 'n'),
(1, 14, 0, 2, 0, 10, 11, '', 'n'),
(1, 4, 0, 3, 0, 6, 7, '', 'n'),
(1, 6, 0, 2, 0, 12, 23, '', 'n'),
(1, 7, 0, 2, 0, 8, 9, '', 'n'),
(1, 8, 6, 2, 0, 13, 14, '', 'n'),
(1, 9, 6, 2, 0, 15, 16, '', 'n'),
(1, 10, 6, 2, 0, 17, 18, '', 'n'),
(1, 11, 6, 2, 0, 19, 20, '', 'n'),
(1, 12, 6, 2, 0, 21, 22, '', 'n'),
(1, 13, 0, 4, 0, 4, 5, '', 'n');

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
(1, 1, 2, 'page', 'n', 'y'),
(1, 2, 2, 'page', 'n', 'y'),
(1, 3, 2, 'page', 'n', 'y'),
(1, 5, 2, 'page', 'n', 'y'),
(1, 4, 2, 'page', 'n', 'y');

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
(9, 1, 2, '_projects', 'y', 'webpage', '', NULL, 1376510574, 1, 'n', 0, '', 'n', 'n', 'o', 0),
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
