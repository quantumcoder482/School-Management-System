#
# TABLE STRUCTURE FOR: admin_categories
#

DROP TABLE IF EXISTS `admin_categories`;

CREATE TABLE `admin_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(250) NOT NULL,
  `in_charge` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

INSERT INTO `admin_categories` (`id`, `category_name`, `in_charge`, `description`, `created_at`, `updated_at`) VALUES (1, 'New category', 'super admin', 'created by super admin', '2019-10-04 12:45:56', '0000-00-00 00:00:00');
INSERT INTO `admin_categories` (`id`, `category_name`, `in_charge`, `description`, `created_at`, `updated_at`) VALUES (4, 'newone', 'Mr, Jin', 'aaaa', '2019-10-04 12:46:44', '0000-00-00 00:00:00');
INSERT INTO `admin_categories` (`id`, `category_name`, `in_charge`, `description`, `created_at`, `updated_at`) VALUES (5, 'eww', 'ewew', 'wwew', '2019-10-04 12:50:51', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: admin_document
#

DROP TABLE IF EXISTS `admin_document`;

CREATE TABLE `admin_document` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_title` varchar(250) NOT NULL,
  `document_no` varchar(10) NOT NULL,
  `category_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: attendence_type
#

DROP TABLE IF EXISTS `attendence_type`;

CREATE TABLE `attendence_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `key_value` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '2016-06-23 13:11:37', '0000-00-00 00:00:00');
INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'Late With Excuse', '<b class=\"text text-warning\">E</b>', 'no', '2018-05-29 03:19:48', '0000-00-00 00:00:00');
INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '2016-06-23 13:12:28', '0000-00-00 00:00:00');
INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '2016-10-11 06:35:40', '0000-00-00 00:00:00');
INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'Holiday', 'H', 'yes', '2016-10-11 06:35:01', '0000-00-00 00:00:00');
INSERT INTO `attendence_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (6, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2016-06-23 13:12:28', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: batches
#

DROP TABLE IF EXISTS `batches`;

CREATE TABLE `batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `batches` (`id`, `batch`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'Batch A', 'no', '2019-08-09 07:32:35', '0000-00-00 00:00:00');
INSERT INTO `batches` (`id`, `batch`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'Batch B', 'no', '2019-08-09 07:32:46', '0000-00-00 00:00:00');
INSERT INTO `batches` (`id`, `batch`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'Batch C', 'no', '2019-08-09 07:33:43', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: book_issues
#

DROP TABLE IF EXISTS `book_issues`;

CREATE TABLE `book_issues` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `is_returned` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: books
#

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `isbn_no` varchar(100) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `from_acc_no` varchar(50) NOT NULL,
  `to_acc_no` varchar(50) NOT NULL,
  `edition` varchar(250) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `bookprice` float(10,2) DEFAULT NULL,
  `no_of_pages` int(10) DEFAULT NULL,
  `department` varchar(250) DEFAULT NULL,
  `book_type` varchar(250) DEFAULT NULL,
  `category` varchar(250) DEFAULT NULL,
  `rack_no` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `available` varchar(10) DEFAULT 'yes',
  `issue_book` varchar(10) DEFAULT NULL,
  `reference_book` varchar(10) DEFAULT NULL,
  `damaged` varchar(10) DEFAULT 'no',
  `missed` varchar(10) DEFAULT 'no',
  `supplier` varchar(250) DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `description` text,
  `subject` varchar(100) DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO `books` (`id`, `book_title`, `author`, `publisher`, `isbn_no`, `book_no`, `from_acc_no`, `to_acc_no`, `edition`, `volume`, `year`, `bookprice`, `no_of_pages`, `department`, `book_type`, `category`, `rack_no`, `qty`, `available`, `issue_book`, `reference_book`, `damaged`, `missed`, `supplier`, `invoice_no`, `invoice_date`, `is_active`, `description`, `subject`, `postdate`, `created_at`, `updated_at`) VALUES (1, 'angular2', 'nadan', 'norway', '978-1-23-123456-3', '10554215', 'sdsd', '1231312', '', '', 2016, '35.00', 232, '', '', '', '1232', 23, 'yes', 'yes', 'no', 'no', 'no', '', '', '2019-12-05', 'no', 'sample data', 'technology', '2019-06-05', '2019-10-12 02:37:54', '0000-00-00 00:00:00');
INSERT INTO `books` (`id`, `book_title`, `author`, `publisher`, `isbn_no`, `book_no`, `from_acc_no`, `to_acc_no`, `edition`, `volume`, `year`, `bookprice`, `no_of_pages`, `department`, `book_type`, `category`, `rack_no`, `qty`, `available`, `issue_book`, `reference_book`, `damaged`, `missed`, `supplier`, `invoice_no`, `invoice_date`, `is_active`, `description`, `subject`, `postdate`, `created_at`, `updated_at`) VALUES (9, 'Learn AngularJS in 1 Day: Complete Angular JS Guide with Examples', 'Krishna Rungta', 'Independently published', '978-1718095267', '112512', 'dsfsa', 'sadfsa', '', '', 0, '689.00', 0, '', '', '', '134', 9, 'yes', 'yes', 'no', 'no', 'no', '', '', '2019-06-05', 'no', 'The book covers all basic fundamentals of Angular JS like Routes, Modules, Directives, Dependency Injection and so on. The images and examples are well-illustrated addressing each and every glitch of Angular JS. The book purpose is to make Angular JS easier, simpler and interesting such that even beginners will feel like a pro at the end of the book. This edition promises your eventual mastery of AngularJS.', 'Software', '2018-06-19', '2019-10-12 02:37:51', '0000-00-00 00:00:00');
INSERT INTO `books` (`id`, `book_title`, `author`, `publisher`, `isbn_no`, `book_no`, `from_acc_no`, `to_acc_no`, `edition`, `volume`, `year`, `bookprice`, `no_of_pages`, `department`, `book_type`, `category`, `rack_no`, `qty`, `available`, `issue_book`, `reference_book`, `damaged`, `missed`, `supplier`, `invoice_no`, `invoice_date`, `is_active`, `description`, `subject`, `postdate`, `created_at`, `updated_at`) VALUES (13, 'aaa', 'aaa', 'aaa', 'sdwsd232', 'dfasdf343', 'safw423', 'dfas34', 'sdfas', '23', 2015, '342.00', 343, 'dfdsf', 'dfs', 'sdfsf', 'dfds', 3, 'yes', 'yes', 'no', 'no', 'no', 'dafsf', 'safa343', '2019-09-18', 'no', 'asfa', NULL, NULL, '2019-10-12 02:37:49', '0000-00-00 00:00:00');
INSERT INTO `books` (`id`, `book_title`, `author`, `publisher`, `isbn_no`, `book_no`, `from_acc_no`, `to_acc_no`, `edition`, `volume`, `year`, `bookprice`, `no_of_pages`, `department`, `book_type`, `category`, `rack_no`, `qty`, `available`, `issue_book`, `reference_book`, `damaged`, `missed`, `supplier`, `invoice_no`, `invoice_date`, `is_active`, `description`, `subject`, `postdate`, `created_at`, `updated_at`) VALUES (16, 'Learn AngularJS in 1 Day: Complete Angular JS Guide with Examples', 'mingching', 'chn', 'BJ39FE999', '1245', 'aaa', 'bbb', 'DDD', '12', 2014, '121.00', 1251, '', '', '', '121', 11, 'yes', 'no', 'yes', 'no', 'no', '', '', '1970-01-01', 'no', '', NULL, NULL, '2019-09-29 05:46:20', '0000-00-00 00:00:00');
INSERT INTO `books` (`id`, `book_title`, `author`, `publisher`, `isbn_no`, `book_no`, `from_acc_no`, `to_acc_no`, `edition`, `volume`, `year`, `bookprice`, `no_of_pages`, `department`, `book_type`, `category`, `rack_no`, `qty`, `available`, `issue_book`, `reference_book`, `damaged`, `missed`, `supplier`, `invoice_no`, `invoice_date`, `is_active`, `description`, `subject`, `postdate`, `created_at`, `updated_at`) VALUES (18, 'asas', 'asasa', 'asasa', 'asas', 'asas', 'asas', 'asas', 'asas', '', 2019, '768.00', 87, '', '', '', '', 7, 'yes', 'yes', 'no', 'no', 'no', '', '', '1970-01-01', 'no', '7777', NULL, NULL, '2019-10-12 02:37:44', '0000-00-00 00:00:00');
INSERT INTO `books` (`id`, `book_title`, `author`, `publisher`, `isbn_no`, `book_no`, `from_acc_no`, `to_acc_no`, `edition`, `volume`, `year`, `bookprice`, `no_of_pages`, `department`, `book_type`, `category`, `rack_no`, `qty`, `available`, `issue_book`, `reference_book`, `damaged`, `missed`, `supplier`, `invoice_no`, `invoice_date`, `is_active`, `description`, `subject`, `postdate`, `created_at`, `updated_at`) VALUES (19, 'Learn AngularJS in 1 Day: Complete Angular JS Guide with Examples', 'mingching', 'chn', 'BJ39FE999', '1245', 'aaa', 'bbb', 'DDD', '12', 2014, '121.00', 1251, '', '', '', '121', 11, 'yes', 'no', 'yes', 'no', 'no', '', '', '1970-01-01', 'no', '', NULL, NULL, '2019-09-29 05:50:10', '0000-00-00 00:00:00');
INSERT INTO `books` (`id`, `book_title`, `author`, `publisher`, `isbn_no`, `book_no`, `from_acc_no`, `to_acc_no`, `edition`, `volume`, `year`, `bookprice`, `no_of_pages`, `department`, `book_type`, `category`, `rack_no`, `qty`, `available`, `issue_book`, `reference_book`, `damaged`, `missed`, `supplier`, `invoice_no`, `invoice_date`, `is_active`, `description`, `subject`, `postdate`, `created_at`, `updated_at`) VALUES (20, 'New language', 'jengxin', 'cnn', 'BG399DF3', '1252', 'aaa', 'bbb', 'edi', '12', 2015, '111.00', 121, '12', 'kk', 'll', '45', 12, 'yes', 'yes', 'no', 'no', 'no', 'klkl', 'klkl', '2016-05-25', 'no', '3121212', NULL, NULL, '2019-09-29 05:50:10', '0000-00-00 00:00:00');
INSERT INTO `books` (`id`, `book_title`, `author`, `publisher`, `isbn_no`, `book_no`, `from_acc_no`, `to_acc_no`, `edition`, `volume`, `year`, `bookprice`, `no_of_pages`, `department`, `book_type`, `category`, `rack_no`, `qty`, `available`, `issue_book`, `reference_book`, `damaged`, `missed`, `supplier`, `invoice_no`, `invoice_date`, `is_active`, `description`, `subject`, `postdate`, `created_at`, `updated_at`) VALUES (21, 'dfds', 'adf', 'dfadsf', 'fdasfdas', 'dafd', 'fasdfasdf', 'fadfasdf', 'adfa', '32', 2018, '32.00', 323, '', '', '', '', 2, 'yes', 'no', 'no', 'yes', 'yes', '', '3424', '2019-10-16', 'no', '23424324', NULL, NULL, '2019-10-12 02:48:47', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: categories
#

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'OC', 'no', '2019-05-27 23:40:21', '0000-00-00 00:00:00');
INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'BC-A', 'no', '2019-05-27 23:40:34', '0000-00-00 00:00:00');
INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'BC-B', 'no', '2019-05-27 23:41:02', '0000-00-00 00:00:00');
INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'BC-C', 'no', '2019-05-27 23:41:08', '0000-00-00 00:00:00');
INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'BC-D', 'no', '2019-05-27 23:41:14', '0000-00-00 00:00:00');
INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (6, 'BC-E', 'no', '2019-05-27 23:41:21', '0000-00-00 00:00:00');
INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (7, 'OBC', 'no', '2019-05-27 23:41:30', '0000-00-00 00:00:00');
INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (8, 'SC', 'no', '2019-05-27 23:41:34', '0000-00-00 00:00:00');
INSERT INTO `categories` (`id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (9, 'ST', 'no', '2019-05-27 23:41:39', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: certificates
#

DROP TABLE IF EXISTS `certificates`;

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_name` varchar(100) NOT NULL,
  `certificate_text` text NOT NULL,
  `left_header` varchar(100) NOT NULL,
  `center_header` varchar(100) NOT NULL,
  `right_header` varchar(100) NOT NULL,
  `left_footer` varchar(100) NOT NULL,
  `right_footer` varchar(100) NOT NULL,
  `center_footer` varchar(100) NOT NULL,
  `background_image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_for` tinyint(1) NOT NULL COMMENT '1 = staff, 2 = students',
  `status` tinyint(1) NOT NULL,
  `header_height` int(11) NOT NULL,
  `content_height` int(11) NOT NULL,
  `footer_height` int(11) NOT NULL,
  `content_width` int(11) NOT NULL,
  `enable_student_image` tinyint(1) NOT NULL COMMENT '0=no,1=yes',
  `enable_image_height` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `certificates` (`id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_at`, `updated_at`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_student_image`, `enable_image_height`) VALUES (1, 'Sample Transfer Certificate', 'This is certify that <b>[name]</b> has born on [dob]  <br> and have following details [present_address] [guardian] [created_at] [admission_no] [roll_no] [class] [section] [gender] [admission_date] [category] [cast] [father_name] [mother_name] [religion] [email] [phone] .<br>We wish best of luck for future endeavors.', 'Reff. No.......................', '', 'Date: ___/____/_______', '.................................<br>Authority Sign', '.................................<br>Principal Sign', '.................................<br>Class Teacher Sign', 'sampletc12.png', '2018-09-05 14:47:33', '0000-00-00 00:00:00', 2, 1, 360, 400, 480, 810, 1, 230);


#
# TABLE STRUCTURE FOR: class_sections
#

DROP TABLE IF EXISTS `class_sections`;

CREATE TABLE `class_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `section_id` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (1, 1, 1, 'no', '2019-05-08 23:41:10', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 2, 'no', '2019-05-08 23:41:10', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (3, 2, 1, 'no', '2019-05-08 23:41:30', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (4, 2, 2, 'no', '2019-05-08 23:41:30', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (5, 3, 1, 'no', '2019-05-08 23:41:42', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (6, 3, 2, 'no', '2019-05-08 23:41:42', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (7, 4, 1, 'no', '2019-05-08 23:41:57', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (8, 4, 2, 'no', '2019-05-08 23:41:57', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (9, 5, 1, 'no', '2019-05-08 23:42:16', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (10, 5, 2, 'no', '2019-05-08 23:42:16', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (11, 6, 1, 'no', '2019-05-08 23:42:39', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (12, 6, 2, 'no', '2019-05-08 23:42:39', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (13, 7, 1, 'no', '2019-05-08 23:42:58', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (14, 7, 2, 'no', '2019-05-08 23:42:58', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (15, 8, 1, 'no', '2019-05-08 23:43:19', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (16, 8, 2, 'no', '2019-05-08 23:43:19', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (17, 9, 1, 'no', '2019-05-08 23:43:57', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (18, 10, 1, 'no', '2019-05-08 23:44:10', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (19, 11, 1, 'no', '2019-05-08 23:44:20', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (20, 12, 1, 'no', '2019-05-08 23:44:38', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (21, 13, 1, 'no', '2019-05-08 23:44:54', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (22, 14, 1, 'no', '2019-05-08 23:45:07', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (23, 15, 1, 'no', '2019-05-08 23:45:38', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (24, 16, 1, 'no', '2019-05-08 23:47:00', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (25, 17, 1, 'no', '2019-05-08 23:47:17', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (26, 18, 1, 'no', '2019-05-08 23:50:57', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (27, 19, 1, 'no', '2019-05-08 23:51:06', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (28, 20, 1, 'no', '2019-05-08 23:51:18', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (29, 21, 1, 'no', '2019-05-08 23:51:37', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (30, 22, 1, 'no', '2019-05-08 23:51:47', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (31, 23, 1, 'no', '2019-05-08 23:51:59', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (32, 24, 1, 'no', '2019-05-08 23:52:17', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (33, 25, 1, 'no', '2019-05-08 23:52:30', '0000-00-00 00:00:00');
INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (34, 26, 1, 'no', '2019-05-08 23:52:40', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: class_teacher
#

DROP TABLE IF EXISTS `class_teacher`;

CREATE TABLE `class_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: classes
#

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'B PHARMACY I YEAR I SEMESTER', 'no', '2019-05-08 23:41:10', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'B PHARMACY I YEAR II SEMESTER', 'no', '2019-05-08 23:41:30', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'B PHARMACY II YEAR I SEMESTER', 'no', '2019-05-08 23:41:42', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'B PHARMACY II YEAR II SEMESTER', 'no', '2019-05-08 23:41:57', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'B PHARMACY III YEAR I SEMESTER', 'no', '2019-05-08 23:42:16', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (6, 'B PHARMACY III YEAR II SEMESTER', 'no', '2019-05-08 23:42:39', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (7, 'B PHARMACY IV YEAR I SEMESTER', 'no', '2019-05-08 23:42:58', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (8, 'B PHARMACY IV YEAR II SEMESTER', 'no', '2019-05-08 23:43:19', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (9, 'PHARMA D I YEAR', 'no', '2019-05-08 23:43:57', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (10, 'PHARMA D II YEAR', 'no', '2019-05-08 23:44:10', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (11, 'PHARMA D III YEAR', 'no', '2019-05-08 23:44:20', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (12, 'PHARMA D IV YEAR', 'no', '2019-05-08 23:44:38', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (13, 'PHARMA D V YEAR', 'no', '2019-05-08 23:44:54', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (14, 'PHARMA D VI YEAR', 'no', '2019-05-08 23:45:07', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (15, 'M PHARMACY I YEAR  I SEMESTER PHARMACEUTICAL ANALYSIS', 'no', '2019-05-08 23:46:10', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (16, 'M PHARMACY I YEAR I SEMESTER PHARMACEUTICS', 'no', '2019-05-08 23:47:00', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (17, 'M PHARMACY I YEAR I SEMESTER INDUSTRIAL PHARMACY', 'no', '2019-05-08 23:47:17', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (18, 'M PHARMACY I YEAR II SEMESTER PHARMACEUTICAL ANALYSIS', 'no', '2019-05-08 23:50:57', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (19, 'M PHARMACY II YEAR I SEMESTER PHARMACEUTICAL ANALYSIS', 'no', '2019-05-08 23:51:06', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (20, 'M PHARMACY II YEAR II SEMESTER PHARMACEUTICAL ANALYSIS', 'no', '2019-05-08 23:51:18', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (21, 'M PHARMACY I YEAR II SEMESTER PHARMACEUTICS', 'no', '2019-05-08 23:51:37', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (22, 'M PHARMACY II YEAR I SEMESTER PHARMACEUTICS', 'no', '2019-05-08 23:51:47', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (23, 'M PHARMACY II YEAR II SEMESTER PHARMACEUTICS', 'no', '2019-05-08 23:51:59', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (24, 'M PHARMACY I YEAR II SEMESTER INDUSTRIAL PHARMACY', 'no', '2019-05-08 23:52:17', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (25, 'M PHARMACY II YEAR I SEMESTER INDUSTRIAL PHARMACY', 'no', '2019-05-08 23:52:30', '0000-00-00 00:00:00');
INSERT INTO `classes` (`id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (26, 'M PHARMACY II YEAR II SEMESTER INDUSTRIAL PHARMACY', 'no', '2019-05-08 23:52:40', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: complaint
#

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_type` varchar(15) NOT NULL,
  `source` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `action_taken` varchar(200) NOT NULL,
  `assigned` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: complaint_type
#

DROP TABLE IF EXISTS `complaint_type`;

CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: content_for
#

DROP TABLE IF EXISTS `content_for`;

CREATE TABLE `content_for` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `content_for_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_for_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `content_for` (`id`, `role`, `content_id`, `user_id`, `created_at`) VALUES (1, 'Super Admin', 1, NULL, '2019-05-14 21:33:28');
INSERT INTO `content_for` (`id`, `role`, `content_id`, `user_id`, `created_at`) VALUES (2, 'Admin', 2, NULL, '2019-06-10 05:33:53');
INSERT INTO `content_for` (`id`, `role`, `content_id`, `user_id`, `created_at`) VALUES (3, 'student', 2, NULL, '2019-06-10 05:33:53');
INSERT INTO `content_for` (`id`, `role`, `content_id`, `user_id`, `created_at`) VALUES (4, 'Admin', 3, NULL, '2019-06-10 05:34:44');
INSERT INTO `content_for` (`id`, `role`, `content_id`, `user_id`, `created_at`) VALUES (5, 'student', 3, NULL, '2019-06-10 05:34:44');


#
# TABLE STRUCTURE FOR: contents
#

DROP TABLE IF EXISTS `contents`;

CREATE TABLE `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_public` varchar(10) DEFAULT 'No',
  `class_id` int(11) DEFAULT NULL,
  `cls_sec_id` int(10) NOT NULL,
  `file` varchar(250) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `contents` (`id`, `title`, `type`, `is_public`, `class_id`, `cls_sec_id`, `file`, `created_by`, `note`, `is_active`, `created_at`, `updated_at`, `date`) VALUES (1, 'Test', 'Other Download', 'No', 0, 0, 'uploads/school_content/material/1.pdf', 0, 'AICTE Approvals', 'no', '2019-05-14 21:33:28', '0000-00-00 00:00:00', '2019-05-15');
INSERT INTO `contents` (`id`, `title`, `type`, `is_public`, `class_id`, `cls_sec_id`, `file`, `created_by`, `note`, `is_active`, `created_at`, `updated_at`, `date`) VALUES (2, 'Pharm.D R17 Regulation', 'Syllabus', 'Yes', 0, 0, 'uploads/school_content/material/2.pdf', 0, 'Pharm.D Syllabus', 'no', '2019-06-10 05:33:53', '0000-00-00 00:00:00', '2019-06-10');
INSERT INTO `contents` (`id`, `title`, `type`, `is_public`, `class_id`, `cls_sec_id`, `file`, `created_by`, `note`, `is_active`, `created_at`, `updated_at`, `date`) VALUES (3, 'Pharm.D R14 Regulation', 'Syllabus', 'Yes', 0, 0, 'uploads/school_content/material/3.pdf', 0, 'Pharm.D R14 Syllabus copy ', 'no', '2019-06-10 05:34:44', '0000-00-00 00:00:00', '2019-06-10');


#
# TABLE STRUCTURE FOR: department
#

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (1, 'Administration', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (2, 'Academic', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (3, 'Office', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (4, 'Pharmaceutics', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (5, 'Pharmaceutical Chemistry', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (6, 'Pharmaceutical Analysis', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (7, 'Pharmacology', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (8, 'Pharmacognosy', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (9, 'Pharmaceutical Biotechnology', 'yes');
INSERT INTO `department` (`id`, `department_name`, `is_active`) VALUES (10, 'Pharmacy Practice', 'yes');


#
# TABLE STRUCTURE FOR: dispatch_receive
#

DROP TABLE IF EXISTS `dispatch_receive`;

CREATE TABLE `dispatch_receive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: e_resources
#

DROP TABLE IF EXISTS `e_resources`;

CREATE TABLE `e_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) CHARACTER SET utf8 NOT NULL,
  `type` varchar(250) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `attachment` varchar(250) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `e_resources` (`id`, `title`, `type`, `description`, `attachment`, `created_at`, `updated_at`) VALUES (2, 'dfdf', 'dfdf', 'dfdf', 'uploads/e_resources/2.jpg', '2019-10-12 01:42:53', '0000-00-00 00:00:00');
INSERT INTO `e_resources` (`id`, `title`, `type`, `description`, `attachment`, `created_at`, `updated_at`) VALUES (3, 'dfd', 'fdsf', 'dfd', 'uploads/e_resources/3.jpg', '2019-10-12 01:52:33', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: email_config
#

DROP TABLE IF EXISTS `email_config`;

CREATE TABLE `email_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `is_active`, `created_at`) VALUES (1, 'sendmail', '', '', '', '', '', 'yes', '2019-05-11 00:06:53');


#
# TABLE STRUCTURE FOR: enquiry
#

DROP TABLE IF EXISTS `enquiry`;

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` mediumtext NOT NULL,
  `reference` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `note` mediumtext NOT NULL,
  `source` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `assigned` varchar(100) NOT NULL,
  `class` int(11) NOT NULL,
  `no_of_child` varchar(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: enquiry_type
#

DROP TABLE IF EXISTS `enquiry_type`;

CREATE TABLE `enquiry_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: event
#

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(250) NOT NULL,
  `in_charge` varchar(250) NOT NULL,
  `category_id` int(10) NOT NULL,
  `description` text,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

INSERT INTO `event` (`id`, `event_name`, `in_charge`, `category_id`, `description`, `date_from`, `date_to`, `attachment`, `created_at`, `updated_at`) VALUES (2, 'New event', 'admin', 4, 'description', '2019-11-11', '2019-11-13', 'uploads/event_documents/2.pdf', '2019-10-04 13:02:47', '0000-00-00 00:00:00');
INSERT INTO `event` (`id`, `event_name`, `in_charge`, `category_id`, `description`, `date_from`, `date_to`, `attachment`, `created_at`, `updated_at`) VALUES (3, 'Change Event', 'administrator', 3, 'created by administrator', '2019-09-27', '2019-09-25', 'uploads/event_documents/3.docx', '2019-09-30 19:52:21', '0000-00-00 00:00:00');
INSERT INTO `event` (`id`, `event_name`, `in_charge`, `category_id`, `description`, `date_from`, `date_to`, `attachment`, `created_at`, `updated_at`) VALUES (8, 'adfas', 'dfasf', 5, 'sdfas', '2019-11-04', '2019-11-08', 'uploads/event_documents/8.pdf', '2019-10-04 13:11:12', '0000-00-00 00:00:00');
INSERT INTO `event` (`id`, `event_name`, `in_charge`, `category_id`, `description`, `date_from`, `date_to`, `attachment`, `created_at`, `updated_at`) VALUES (9, 'wew', 'wew', 5, 'wew', '2019-10-28', '2019-11-15', 'uploads/event_documents/9.pdf', '2019-10-04 13:46:18', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: events
#

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(200) NOT NULL,
  `event_description` varchar(300) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: exam_results
#

DROP TABLE IF EXISTS `exam_results`;

CREATE TABLE `exam_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendence` varchar(10) NOT NULL,
  `exam_schedule_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `get_marks` float(10,2) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `exam_schedule_id` (`exam_schedule_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'pre', 1, 88, '3.65', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'pre', 2, 88, '4.85', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'pre', 3, 88, '4.20', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'pre', 1, 86, '3.25', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'pre', 2, 86, '5.00', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (6, 'pre', 3, 86, '4.65', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (7, 'pre', 1, 91, '4.20', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (8, 'pre', 2, 91, '4.60', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (9, 'pre', 3, 91, '3.20', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (10, 'pre', 1, 90, '2.30', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (11, 'pre', 2, 90, '2.20', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (12, 'pre', 3, 90, '2.00', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (13, 'ABS', 1, 84, '0.00', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (14, 'pre', 2, 84, '3.20', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (15, 'pre', 3, 84, '2.60', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (16, 'pre', 1, 85, '2.30', NULL, 'no', '2019-10-10 14:44:38', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (17, 'pre', 2, 85, '3.60', NULL, 'no', '2019-10-10 14:44:39', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (18, 'pre', 3, 85, '4.50', NULL, 'no', '2019-10-10 14:44:39', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (19, 'ABS', 1, 92, '0.00', NULL, 'no', '2019-10-10 14:44:39', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (20, 'pre', 2, 92, '4.60', NULL, 'no', '2019-10-10 14:44:39', '0000-00-00 00:00:00');
INSERT INTO `exam_results` (`id`, `attendence`, `exam_schedule_id`, `student_id`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (21, 'pre', 3, 92, '4.20', NULL, 'no', '2019-10-10 14:44:39', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: exam_schedules
#

DROP TABLE IF EXISTS `exam_schedules`;

CREATE TABLE `exam_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `teacher_subject_id` int(11) DEFAULT NULL,
  `date_of_exam` date DEFAULT NULL,
  `start_to` varchar(50) DEFAULT NULL,
  `end_from` varchar(50) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `full_marks` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `teacher_subject_id` (`teacher_subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `exam_schedules` (`id`, `session_id`, `exam_id`, `teacher_subject_id`, `date_of_exam`, `start_to`, `end_from`, `room_no`, `full_marks`, `passing_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (1, 14, 1, 1, '2019-10-16', '12:00 AM', '02:30 PM', '101', 5, 3, NULL, 'no', '2019-10-10 14:38:38', '0000-00-00 00:00:00');
INSERT INTO `exam_schedules` (`id`, `session_id`, `exam_id`, `teacher_subject_id`, `date_of_exam`, `start_to`, `end_from`, `room_no`, `full_marks`, `passing_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (2, 14, 1, 2, '2019-10-17', '12:00 AM', '02:30 PM', '101', 5, 3, NULL, 'no', '2019-10-10 14:38:38', '0000-00-00 00:00:00');
INSERT INTO `exam_schedules` (`id`, `session_id`, `exam_id`, `teacher_subject_id`, `date_of_exam`, `start_to`, `end_from`, `room_no`, `full_marks`, `passing_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (3, 14, 1, 3, '2019-10-18', '12:00 AM', '02:30 PM', '101', 5, 5, NULL, 'no', '2019-10-10 14:38:39', '0000-00-00 00:00:00');
INSERT INTO `exam_schedules` (`id`, `session_id`, `exam_id`, `teacher_subject_id`, `date_of_exam`, `start_to`, `end_from`, `room_no`, `full_marks`, `passing_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (4, 14, 1, 4, '2019-10-01', '12:00 AM', '08:45 AM', '123', 5, 3, NULL, 'no', '2019-10-15 08:50:47', '0000-00-00 00:00:00');
INSERT INTO `exam_schedules` (`id`, `session_id`, `exam_id`, `teacher_subject_id`, `date_of_exam`, `start_to`, `end_from`, `room_no`, `full_marks`, `passing_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (5, 14, 1, 5, '2019-10-09', '12:00 AM', '08:45 AM', '123', 5, 3, NULL, 'no', '2019-10-15 08:50:47', '0000-00-00 00:00:00');
INSERT INTO `exam_schedules` (`id`, `session_id`, `exam_id`, `teacher_subject_id`, `date_of_exam`, `start_to`, `end_from`, `room_no`, `full_marks`, `passing_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (6, 14, 1, 6, '2019-10-17', '12:00 AM', '08:45 AM', '123', 5, 3, NULL, 'no', '2019-10-15 08:50:47', '0000-00-00 00:00:00');
INSERT INTO `exam_schedules` (`id`, `session_id`, `exam_id`, `teacher_subject_id`, `date_of_exam`, `start_to`, `end_from`, `room_no`, `full_marks`, `passing_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (7, 14, 1, 7, '2019-10-19', '12:00 AM', '08:45 AM', '123', 5, 3, NULL, 'no', '2019-10-15 08:50:48', '0000-00-00 00:00:00');
INSERT INTO `exam_schedules` (`id`, `session_id`, `exam_id`, `teacher_subject_id`, `date_of_exam`, `start_to`, `end_from`, `room_no`, `full_marks`, `passing_marks`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (8, 14, 1, 8, '2019-10-22', '12:00 AM', '08:45 AM', '123', 5, 3, NULL, 'no', '2019-10-15 08:50:48', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: exams
#

DROP TABLE IF EXISTS `exams`;

CREATE TABLE `exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `sesion_id` int(11) NOT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `exams` (`id`, `name`, `sesion_id`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'MID TERM 1', 0, 'MID 1', 'no', '2019-05-09 03:37:31', '0000-00-00 00:00:00');
INSERT INTO `exams` (`id`, `name`, `sesion_id`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'MID TERM 2', 0, 'MID TERM 2', 'no', '2019-05-09 03:37:59', '0000-00-00 00:00:00');
INSERT INTO `exams` (`id`, `name`, `sesion_id`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'MID TERM 3', 0, 'MID TERM 3', 'no', '2019-05-09 03:38:19', '0000-00-00 00:00:00');
INSERT INTO `exams` (`id`, `name`, `sesion_id`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'MID TERM LAB 1', 0, 'MID TERM LAB 1', 'no', '2019-05-09 03:38:47', '0000-00-00 00:00:00');
INSERT INTO `exams` (`id`, `name`, `sesion_id`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (6, 'MID TERM LAB 2', 0, 'MID TERM LAB 2', 'no', '2019-05-09 03:39:05', '0000-00-00 00:00:00');
INSERT INTO `exams` (`id`, `name`, `sesion_id`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (7, 'MID TERM LAB 3', 0, 'MID TERM LAB 3', 'no', '2019-05-09 03:39:21', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: expense_head
#

DROP TABLE IF EXISTS `expense_head`;

CREATE TABLE `expense_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: expenses
#

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: fee_groups
#

DROP TABLE IF EXISTS `fee_groups`;

CREATE TABLE `fee_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `is_system` int(1) NOT NULL DEFAULT '0',
  `description` text,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (1, 'B. PHARMACY', 0, '', 'no', '2019-05-30 04:11:16');
INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (2, 'M.PHARMACY', 0, '', 'no', '2019-06-20 11:14:58');
INSERT INTO `fee_groups` (`id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (3, 'PHARM.D', 0, '', 'no', '2019-06-20 11:15:15');


#
# TABLE STRUCTURE FOR: fee_groups_feetype
#

DROP TABLE IF EXISTS `fee_groups_feetype`;

CREATE TABLE `fee_groups_feetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `fee_groups_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fee_session_group_id` (`fee_session_group_id`),
  KEY `fee_groups_id` (`fee_groups_id`),
  KEY `feetype_id` (`feetype_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `fee_groups_feetype_ibfk_1` FOREIGN KEY (`fee_session_group_id`) REFERENCES `fee_session_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_groups_feetype_ibfk_2` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_groups_feetype_ibfk_3` FOREIGN KEY (`feetype_id`) REFERENCES `feetype` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_groups_feetype_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `fee_groups_feetype` (`id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `due_date`, `amount`, `is_active`, `created_at`) VALUES (2, 2, 1, 1, 14, '2019-09-01', '60000.00', 'no', '2019-06-20 11:15:49');


#
# TABLE STRUCTURE FOR: fee_receipt_no
#

DROP TABLE IF EXISTS `fee_receipt_no`;

CREATE TABLE `fee_receipt_no` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: fee_session_groups
#

DROP TABLE IF EXISTS `fee_session_groups`;

CREATE TABLE `fee_session_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_groups_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fee_groups_id` (`fee_groups_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `fee_session_groups_ibfk_1` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_session_groups_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `fee_session_groups` (`id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES (2, 1, 14, 'no', '2019-06-20 11:15:49');


#
# TABLE STRUCTURE FOR: feecategory
#

DROP TABLE IF EXISTS `feecategory`;

CREATE TABLE `feecategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: feemasters
#

DROP TABLE IF EXISTS `feemasters`;

CREATE TABLE `feemasters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `description` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: fees_discounts
#

DROP TABLE IF EXISTS `fees_discounts`;

CREATE TABLE `fees_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` text,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `fees_discounts_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: feetype
#

DROP TABLE IF EXISTS `feetype`;

CREATE TABLE `feetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_system` int(1) NOT NULL DEFAULT '0',
  `feecategory_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `created_at`, `updated_at`, `description`) VALUES (1, 0, NULL, 'MANAGMENT', 'MNG', 'no', '2019-05-15 23:52:19', '0000-00-00 00:00:00', 'MANAGEMENT QUOTA');
INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `created_at`, `updated_at`, `description`) VALUES (2, 0, NULL, 'SPOT ADMISSION', 'SPOT', 'no', '2019-05-28 00:46:06', '0000-00-00 00:00:00', 'spot admission students');
INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `created_at`, `updated_at`, `description`) VALUES (3, 0, NULL, 'FULL FEES REIMBURSEMENT', 'FFR', 'no', '2019-05-28 00:48:14', '0000-00-00 00:00:00', '');
INSERT INTO `feetype` (`id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `created_at`, `updated_at`, `description`) VALUES (4, 0, NULL, 'CONVENER', 'CONV', 'no', '2019-05-28 00:49:03', '0000-00-00 00:00:00', '');


#
# TABLE STRUCTURE FOR: follow_up
#

DROP TABLE IF EXISTS `follow_up`;

CREATE TABLE `follow_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: front_cms_media_gallery
#

DROP TABLE IF EXISTS `front_cms_media_gallery`;

CREATE TABLE `front_cms_media_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` mediumtext NOT NULL,
  `vid_title` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (1, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'homebanner.jpg', 'homebanner.jpg', '2019-05-08 20:45:30', 'image/jpeg', '67042', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (2, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'banner1.jpg', 'banner1.jpg', '2019-05-08 23:20:54', 'image/jpeg', '216508', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (7, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Professional Activities From 2018 march to 2019 march (1)_page-0001.jpg', 'Professional Activities From 2018 march to 2019 march (1)_page-0001.jpg', '2019-05-16 04:46:43', 'image/jpeg', '603307', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (8, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Professional Activities From 2018 march to 2019 march (1)_page-0002.jpg', 'Professional Activities From 2018 march to 2019 march (1)_page-0002.jpg', '2019-05-16 04:46:43', 'image/jpeg', '581347', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (9, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Professional Activities From 2018 march to 2019 march (1)_page-0003 (1).jpg', 'Professional Activities From 2018 march to 2019 march (1)_page-0003 (1).jpg', '2019-05-16 04:46:43', 'image/jpeg', '412127', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (22, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'confeernce.JPG', 'confeernce.JPG', '2019-05-17 00:27:41', 'image/jpeg', '201557', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (23, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Graduation day celebrations - Copy.JPG', 'Graduation day celebrations - Copy.JPG', '2019-05-17 00:31:07', 'image/jpeg', '201990', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (24, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Graduation day celebrations 2.JPG', 'Graduation day celebrations 2.JPG', '2019-05-17 00:31:46', 'image/jpeg', '194313', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (25, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'work shop - Copy.JPG', 'work shop - Copy.JPG', '2019-05-17 00:32:32', 'image/jpeg', '207172', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (26, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'graduation day - Copy.JPG', 'graduation day - Copy.JPG', '2019-05-17 00:36:00', 'image/jpeg', '201179', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (27, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'national conference - Copy.JPG', 'national conference - Copy.JPG', '2019-05-17 00:37:25', 'image/jpeg', '163890', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (29, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'work shop - Copy-1558031400.JPG', 'work shop - Copy-1558031400.JPG', '2019-05-17 00:38:42', 'image/jpeg', '207172', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (30, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'placement - Copy_page-0001.jpg', 'placement - Copy_page-0001.jpg', '2019-05-17 00:54:35', 'image/jpeg', '1162081', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (31, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'placement - Copy_page-0003.jpg', 'placement - Copy_page-0003.jpg', '2019-05-17 01:03:40', 'image/jpeg', '464432', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (32, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'placement - Copy_page-0002.jpg', 'placement - Copy_page-0002.jpg', '2019-05-17 01:04:02', 'image/jpeg', '132473', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (34, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Placement brochure Download.pdf', 'Placement brochure Download.pdf', '2019-05-17 01:15:05', 'application/pdf', '410747', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (36, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'graduation day - Copy-1558031400.JPG', 'graduation day - Copy-1558031400.JPG', '2019-05-17 03:17:38', 'image/jpeg', '157812', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (37, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'placements.jpg', 'placements.jpg', '2019-05-17 03:21:43', 'image/jpeg', '113785', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (38, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'national conference - Copy-1558031400.JPG', 'national conference - Copy-1558031400.JPG', '2019-05-17 03:42:12', 'image/jpeg', '143819', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (42, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Acadamic regulations for M.Pharmacy.pdf', 'Acadamic regulations for M.Pharmacy.pdf', '2019-05-17 04:04:36', 'application/pdf', '437756', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (43, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Acadamic regulations for pharm D.docx', 'Acadamic regulations for pharm D.docx', '2019-05-17 04:04:47', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '20452', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (44, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Course Structure for B.Pharmacy-R15 Regulations.pdf', 'Course Structure for B.Pharmacy-R15 Regulations.pdf', '2019-05-17 04:05:15', 'application/pdf', '876841', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (45, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Graduation day celebrations.JPG', 'Graduation day celebrations.JPG', '2019-05-27 23:59:09', 'image/jpeg', '154532', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (46, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'placements - Copy-1558981800.jpg', 'placements - Copy-1558981800.jpg', '2019-05-28 00:09:23', 'image/jpeg', '112042', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (47, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'work shop - Copy-1558981800.JPG', 'work shop - Copy-1558981800.JPG', '2019-05-28 00:11:05', 'image/jpeg', '168100', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (48, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'confeernce - Copy.JPG', 'confeernce - Copy.JPG', '2019-05-28 00:11:16', 'image/jpeg', '159864', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (49, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Graduation day celebrations 2-1558981800.JPG', 'Graduation day celebrations 2-1558981800.JPG', '2019-05-28 00:18:20', 'image/jpeg', '148166', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (50, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Latest Reseach Projects.docx', 'Latest Reseach Projects.docx', '2019-05-31 00:10:59', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '24286', '', '');
INSERT INTO `front_cms_media_gallery` (`id`, `image`, `thumb_path`, `dir_path`, `img_name`, `thumb_name`, `created_at`, `file_type`, `file_size`, `vid_url`, `vid_title`) VALUES (51, NULL, 'uploads/gallery/media/thumb/', 'uploads/gallery/media/', 'Untitled.jpg', 'Untitled.jpg', '2019-05-31 00:39:31', 'image/jpeg', '61147', '', '');


#
# TABLE STRUCTURE FOR: front_cms_menu_items
#

DROP TABLE IF EXISTS `front_cms_menu_items`;

CREATE TABLE `front_cms_menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ext_url` mediumtext,
  `open_new_tab` int(11) DEFAULT '0',
  `ext_url_link` mediumtext,
  `slug` varchar(200) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  `description` mediumtext,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (1, 2, 'JNTUA', 0, 0, '1', 1, 'http://jntua.ac.in/', 'jntua', NULL, 0, NULL, 'no', '2019-05-08 20:52:11');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (2, 2, 'JNTUA RESULTS', 0, 0, '1', NULL, 'https://jntuaresults.azurewebsites.net/', 'jntua-results', NULL, 0, NULL, 'no', '2019-05-08 20:52:43');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (3, 2, 'PCI', 0, 0, '1', NULL, 'http://pci.nic.in/', 'pci', NULL, 0, NULL, 'no', '2019-05-08 20:53:01');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (4, 2, 'AICTE', 0, 0, '1', NULL, 'http://aicte-india.org/', 'aicte', NULL, 0, NULL, 'no', '2019-05-08 20:53:12');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (5, 1, 'Home', 1, 0, NULL, NULL, NULL, 'home', 1, 0, NULL, 'no', '2019-05-08 21:47:34');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (6, 1, 'About Us', 77, 0, NULL, NULL, NULL, 'about-us', 2, 0, NULL, 'no', '2019-05-08 21:47:34');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (7, 1, 'Courses Offered', 78, 0, NULL, NULL, NULL, 'courses-offered', 3, 0, NULL, 'no', '2019-05-08 20:59:44');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (8, 1, 'Gallery', 79, 0, NULL, NULL, NULL, 'gallery', 4, 0, NULL, 'no', '2019-05-08 20:59:44');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (9, 1, 'Contact Us', 76, 0, NULL, NULL, NULL, 'contact-us', 6, 0, NULL, 'no', '2019-05-08 20:59:44');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (10, 1, 'Events', 80, 0, NULL, NULL, NULL, 'events', 5, 0, NULL, 'no', '2019-05-08 20:59:44');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (13, 1, 'Faculty', 83, 0, NULL, NULL, NULL, 'faculty', NULL, 0, NULL, 'no', '2019-05-16 04:01:17');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (15, 2, 'Chairmen', 77, 0, NULL, NULL, NULL, 'chairmen', NULL, 0, NULL, 'no', '2019-05-16 05:14:35');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (16, 1, 'Brochure -2019', 84, 0, NULL, NULL, NULL, 'brochure-2019', NULL, 0, NULL, 'no', '2019-05-17 00:59:25');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (18, 1, 'Academics', 85, 0, NULL, NULL, NULL, 'academics', NULL, 0, NULL, 'no', '2019-05-17 04:01:43');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (19, 1, 'Facilities', 86, 0, NULL, NULL, NULL, 'facilities', NULL, 0, NULL, 'no', '2019-05-27 23:39:29');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (20, 1, 'NIRF-2019', 88, 0, NULL, NULL, NULL, 'nirf-2019', NULL, 0, NULL, 'no', '2019-05-31 00:24:56');


#
# TABLE STRUCTURE FOR: front_cms_menus
#

DROP TABLE IF EXISTS `front_cms_menus`;

CREATE TABLE `front_cms_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` mediumtext,
  `open_new_tab` int(10) NOT NULL DEFAULT '0',
  `ext_url` mediumtext NOT NULL,
  `ext_url_link` mediumtext NOT NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2018-04-20 09:54:49');
INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2018-04-20 09:54:55');


#
# TABLE STRUCTURE FOR: front_cms_page_contents
#

DROP TABLE IF EXISTS `front_cms_page_contents`;

CREATE TABLE `front_cms_page_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `front_cms_page_contents_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `front_cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_page_contents` (`id`, `page_id`, `content_type`, `created_at`) VALUES (1, 79, 'gallery', '2019-05-08 20:55:15');
INSERT INTO `front_cms_page_contents` (`id`, `page_id`, `content_type`, `created_at`) VALUES (2, 80, 'events', '2019-05-08 20:59:00');
INSERT INTO `front_cms_page_contents` (`id`, `page_id`, `content_type`, `created_at`) VALUES (3, 81, 'notice', '2019-05-08 20:59:14');


#
# TABLE STRUCTURE FOR: front_cms_pages
#

DROP TABLE IF EXISTS `front_cms_pages`;

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int(1) DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `meta_title` mediumtext,
  `meta_description` mediumtext,
  `meta_keyword` mediumtext,
  `feature_image` varchar(200) NOT NULL,
  `description` longtext,
  `publish_date` date NOT NULL,
  `publish` int(10) DEFAULT '0',
  `sidebar` int(10) DEFAULT '0',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (1, 'default', 1, 'Home', 'page/home', 'page', 'home', 'Santhiram College of Pharmacy', 'pharmacy, nandyal, college of pharmacy, andhra pradesh, pci, aicte, jntua', 'pharmacy, nandyal, college of pharmacy, andhra pradesh, pci, aicte, jntua', 'https://santhirampharmacy.edu.in/uploads/gallery/media/national conference - Copy.JPG', '<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"5\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:850px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p style=\"text-align: justify;\"><span style=\"color:#FF0000;\"><span style=\"font-size:22px;\"><span style=\"font-family:comic sans ms,cursive;\">Welcome to Santhiram College of Pharmacy</span></span></span></p>\r\n\r\n			<p style=\"text-align: justify;\"><span style=\"font-family:comic sans ms,cursive;\"><span style=\"font-size:14px;\">Sri Shiridi Sai Educational Academy, Nandyal, established in 2007, Sponsors a group of educational institutions and is designed with meticulous attention and thoughtful design with convenient space, making it truly top class. The vibrant interior and exquisite finishing lends the college an ambience that is as delightful and inspiring. The management introduced Santhiram College of Pharmacy during 2007-08 and offers B.Pharm course with an annual intake of 100, M.Pharm (Pharmaceutics) with an intake of 18, M.Pharm (Industrial Pharmacy) with an intake of 24, M.Pharm (Pharmaceutical Analysis) with an intake of 24 and Doctor of Pharmacy (Pharm.D) with an intake of 30 to materialize the dreams of aspiring students and parents. Santhiram College of Pharmacy, since its inception has been performing exceptionally good to meet its goal of providing quality pharmaceutical service to the society. The pharmacy education needs are increasing in the society. To meet these requirements Santhiram College of Pharmacy is striving to provide the highest standards of quality pharmacy education.</span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p style=\"text-align: justify;\"><img src=\"http://www.srcpnandyal.com/img/chairman.JPG\" style=\"border-width: 7px; border-style: solid; height: 150px; width: 200px;\" /><span style=\"color:#4B0082;\"><span style=\"font-size:28px;\"><span style=\"font-family:comic sans ms,cursive;\"><strong><em>Chairman</em></strong></span></span></span></p>\r\n\r\n			<p style=\"text-align: justify;\"><span style=\"font-size:22px;\"><span style=\"font-family:comic sans ms,cursive;\"><strong><em><span style=\"color:#800000;\">Dr.M.Santhiramudu</span></em></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"5\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width: 187px; text-align: left;\">\r\n			<p style=\"text-align: center;\"><span style=\"font-size:24px;\"><span style=\"color:#800000;\"><span style=\"font-family:times new roman,times,serif;\">Vision</span></span></span></p>\r\n			</td>\r\n			<td style=\"width:399px;\">\r\n			<p style=\"text-align: center;\"><span style=\"font-size:24px;\"><span style=\"color:#800000;\"><span style=\"font-family:times new roman,times,serif;\">Mission</span></span></span></p>\r\n			</td>\r\n			<td style=\"width:293px;\">\r\n			<p style=\"text-align: center;\"><span style=\"font-size:24px;\"><span style=\"color:#800000;\"><span style=\"font-family:times new roman,times,serif;\">Quality policy</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:187px;\">\r\n			<p style=\"text-align: justify;\"><span style=\"color:#800000;\"><span style=\"font-family:times new roman,times,serif;\"><span style=\"font-size:14px;\">To produce competent&nbsp; professionals with sufficient&nbsp; professional skills, knowledge&nbsp; and attitude which elate global&nbsp; standards in Pharma industry&nbsp; and Health care.</span></span></span></p>\r\n			</td>\r\n			<td style=\"width:399px;\">\r\n			<p style=\"text-align: justify;\"><span style=\"color:#800000;\"><span style=\"font-family:times new roman,times,serif;\"><span style=\"font-size:14px;\">• To provide quality and value based education in &nbsp;pharmaceutical sciences.</span></span></span></p>\r\n\r\n			<p style=\"text-align: justify;\"><span style=\"color:#800000;\"><span style=\"font-family:times new roman,times,serif;\"><span style=\"font-size:14px;\">&nbsp;• To achieve positive patient health care outcomes.</span></span></span></p>\r\n\r\n			<p style=\"text-align: justify;\"><span style=\"color:#800000;\"><span style=\"font-family:times new roman,times,serif;\"><span style=\"font-size:14px;\">• To produce innovators and entrepreneurs.</span></span></span></p>\r\n\r\n			<p style=\"text-align: justify;\"><span style=\"color:#800000;\"><span style=\"font-family:times new roman,times,serif;\"><span style=\"font-size:14px;\">• To support health care and industrial needs.</span></span></span></p>\r\n\r\n			<p style=\"text-align: justify;\"><span style=\"color:#800000;\"><span style=\"font-family:times new roman,times,serif;\"><span style=\"font-size:14px;\">• To become self sustained in Pharmacy education and Research.</span></span></span></p>\r\n			</td>\r\n			<td style=\"width:293px;\">\r\n			<p style=\"text-align: justify;\"><span style=\"color:#800000;\"><span style=\"font-family:times new roman,times,serif;\"><span style=\"font-size:14px;\">&nbsp;We strive to provide excellent pharmacy&nbsp; &nbsp;education&nbsp; along with practical and social&nbsp; &nbsp;exposure to the graduates through skilled and&nbsp; &nbsp;adequate professional recourses to enhance their&nbsp; &nbsp;aptitude for pharma industry and health care&nbsp; &nbsp;profession, through consistent improvements in&nbsp; &nbsp;the quality aspects such as&nbsp; drug expertise&nbsp; &nbsp; &nbsp; &nbsp;education with committed research; preparation&nbsp; &nbsp; &nbsp;of&nbsp; convenient dosage form and dispensing; drug&nbsp; &nbsp;monitoring and patient counseling; sustained&nbsp; &nbsp;learning and adopting high communication skills;&nbsp; &nbsp;leadership qualities and teamwork abilities which&nbsp; &nbsp;assure with confirmed placements.</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', '0000-00-00', 1, 1, 'no', '2019-05-28 00:05:49');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<p>\r\n[form-builder:complain]</p>', '0000-00-00', 1, 1, 'no', '2018-05-09 10:14:34');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (54, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2018-05-18 09:46:04');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (76, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<title></title>\r\n<section class=\"contact\">\r\n<div class=\"container spacet50 spaceb50\">\r\n<div class=\"row\">\r\n<div class=\"col-md-12 col-sm-12\">[form-builder:contact_us]<!--./row--></div>\r\n<!--./col-md-12--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>', '0000-00-00', 0, NULL, 'no', '2018-07-11 13:03:41');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (77, 'manual', 0, 'About Us', 'page/about-us', 'page', 'about-us', '', '', '', '', '<h1 style=\"box-sizing: border-box; font-size: 28.6px; margin: 20px 0px 10px; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); padding: 0px 0px 10px;\">About College</h1>\r\n\r\n<p align=\"justify\" bookman=\"\" line-height:=\"\" old=\"\" padding:=\"\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sri Shiridi Sai Educational Academy, Nandyal, established in 2007, Sponsors a group of educational institutions and is designed with meticulous attention and thoughtful design with convenient space, making it truly top class. The vibrant interior and exquisite finishing lends the college an ambience that is as delightful and inspiring. The management introduced Santhiram College of Pharmacy during 2007-08 and offers&nbsp;<span style=\"box-sizing: border-box; font-weight: 700;\">B.Pharm course with an annual intake of 120, M.Pharm (Pharmaceutics) with an intake of 18, M.Pharm (Industrial Pharmacy) with an intake of 24, M.Pharm (Pharmaceutical Analysis) with an intake of 24 and Doctor of Pharmacy (Pharm.D) with an intake of 30 to materialize the dreams of aspiring students and parents.</span>&nbsp;Santhiram College of Pharmacy, since its inception has been performing exceptionally good to meet its goal of providing quality pharmaceutical service to the society. The pharmacy education needs are increasing in the society. To meet these requirements Santhiram College of Pharmacy is striving to provide the highest standards of quality pharmacy education. Under this Management, a number of Institutions have been started, and they are flourishing very well. There are Three Engineering Colleges, one medical college and a Nursing College with the name of<span style=\"box-sizing: border-box; font-weight: 700;\">&nbsp;Rajeev Gandhi Memorial College of Engineering and Technology, Santhiram Engineering College, Syamaladevi institute of technology for women, Santhiram Medical College and Santhiram College of Nursing</span>&nbsp;respectively at Nandyal. These Colleges offers courses such as B.Tech, M.Tech, MBA, MCA, MBBS, MD, MS, M.Sc (Medical Faculty), B.Sc (nursing) and also Provides research facilities in their respective branches. Besides these Institutions which cater to the needs of higher education this Society has also started a Public School starting from Nursery to Intermediate, under State and Central Syllabus namely Nandyal Public School & Junior College. In short, this Management conducts courses from L.K.G. to Doctorate in Various Disciplines.</p>\r\n\r\n<p align=\"justify\" bookman=\"\" line-height:=\"\" old=\"\" padding:=\"\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: \">&nbsp;</p>\r\n\r\n<table border=\"10\" bordercolor=\"#0080C0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: droid_sansregular;\" width=\"747\">\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td align=\"center\" style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" width=\"575\">\r\n			<h1 style=\"box-sizing: border-box; font-size: 28.6px; margin: 20px 0px 10px; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); padding: 0px 0px 10px;\">Founder & Chairman&nbsp;<br style=\"box-sizing: border-box;\" />\r\n			Dr.M. Santhi Ramudu</h1>\r\n			</td>\r\n			<td align=\"center\" bgcolor=\"#0080C0\" style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" width=\"138\"><img align=\"middle\" alt=\"Chancellor\" src=\"http://www.srcpnandyal.com/img/Chairman3.png\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle;\" title=\"Chancellor\" /></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3 style=\"box-sizing: border-box; font-family: droid_sansbold; line-height: 1.1; color: rgb(251, 136, 8); margin-top: 20px; margin-bottom: 10px; font-size: 15.6px; padding: 0px 0px 10px;\">About Dr.M.Santhi Ramudu</h3>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: \"Bookman Old Style\"; line-height: 25px; padding: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"box-sizing: border-box;\">Santhiram college of Pharmacy has started its curriculum from the year 2007-08 which is located besides to Rajeev Gandhi Memorial College of Engineering & Technology (RGMCET) on NH-18 at Nandyal. It is the dedicated commitment and effort of our Chairman, the man with vision \"Vidyarathna\"&nbsp;Dr.M.Santhi Ramudu, who started the institution with a motto&nbsp;\"EDUCATION FOR GLOBAL PEACE AND PROGRESS\". Santhiram college of Pharmacy is a road of elegant educational journey, yet path breaking in different dimensions. He is also the Founder and Chairman of Rajeev Gandhi Memorial College of Engineering & Technology (RGMCET) established in the year 1995.&nbsp;RGMCET started functioning in the campus of The Nandyal Public school. Today it is located in a 50 acre sprawling campus on NH-18 at Nandyal.<br style=\"box-sizing: border-box;\" />\r\nDr.M.Santhi Ramudu strived a lot to bring technical education to the people of Rayalaseema.&nbsp;As a part of his Mission he established Santhiram Medical College & General Hospital in the year 2005, which is a real boon to the people of many areas of rayalaseema where thousands of people are utilizing free medical services. The secret of this visionary is his humility with his cheerful approach. He is enriching these rural lands with knowledge. As a skilled crafts-man, he utilizes each moment of the day and stands as an apostle of hard work and the living example for the saying \'HARD WORK NEVER DECEIVES�?&nbsp;<br style=\"box-sizing: border-box;\" />\r\nHe is playing a major role in the State for the development of technical education.&nbsp;The cosmopolitan university (university network and research institute), Missouri, USA has conferred the honorary degree, doctor of philosophy - PhD in education to Dr.M.Santhi Ramudu.</span></p>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: \"Bookman Old Style\"; line-height: 25px; padding: 0px;\">&nbsp;</p>\r\n\r\n<table border=\"10\" bordercolor=\"#0080C0\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: droid_sansregular;\" width=\"724\">\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">\r\n			<h1 style=\"box-sizing: border-box; font-size: 28.6px; margin: 20px 0px 10px; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); padding: 0px 0px 10px;\">Principal</h1>\r\n\r\n			<h3 style=\"box-sizing: border-box; font-family: droid_sansbold; line-height: 1.1; color: rgb(251, 136, 8); margin-top: 20px; margin-bottom: 10px; font-size: 15.6px; padding: 0px 0px 10px;\">Dr.&nbsp;<span style=\"box-sizing: border-box;\">C. Madhusudhana Chetty</span>., Ph.D.</h3>\r\n			</td>\r\n			<td align=\"center\" style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" width=\"150\"><img height=\"176\" src=\"http://www.srcpnandyal.com/img/principal.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle;\" width=\"150\" /></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700;\">EDUCATIONAL QUALIFICATIONS</span></p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">&nbsp;</p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; font-family: droid_sansregular;\">\r\n	<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: 700;\"><span style=\"box-sizing: border-box; font-weight: normal;\">Ph.D. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Pharmaceutical Sciences)</span><br style=\"box-sizing: border-box;\" />\r\n	Faculty of Pharmacy<span style=\"box-sizing: border-box; font-weight: normal;\">,&nbsp;</span><span style=\"box-sizing: border-box; font-weight: normal;\"><em style=\"box-sizing: border-box;\">Andhra University</em></span>, Visakhapatnam, A.P.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<span style=\"box-sizing: border-box; font-weight: normal;\"><em style=\"box-sizing: border-box;\">May-2006.</em></span></span></li>\r\n</ul>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\">&nbsp;</p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">\r\n	<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box; font-weight: normal;\">M.B.A.&nbsp; (Part- time)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (</span>58.96%)<br style=\"box-sizing: border-box;\" />\r\n	<span style=\"box-sizing: border-box; font-weight: normal;\"><em style=\"box-sizing: border-box;\">Bharathiyar University</em></span>,&nbsp;<br style=\"box-sizing: border-box;\" />\r\n	Coimbatore,T.N.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .<span style=\"box-sizing: border-box; font-weight: normal;\"><em style=\"box-sizing: border-box;\">November-</em>2001</span>.</span></li>\r\n</ul>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">&nbsp;</span></p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">\r\n	<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box; font-weight: normal;\">M.Pharmacy (Pharm Bio Tech)(</span>66.90%)<br style=\"box-sizing: border-box;\" />\r\n	Faculty of Pharmacy,&nbsp;<span style=\"box-sizing: border-box; font-weight: normal;\"><em style=\"box-sizing: border-box;\">Andhra University</em></span>, Visakhapatnam, A.P.&nbsp;&nbsp;&nbsp;&nbsp; .&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"box-sizing: border-box; font-weight: normal;\"><em style=\"box-sizing: border-box;\">October- 1996.</em></span></span></li>\r\n</ul>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">\r\n	<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box; font-weight: normal;\">B.Pharmacy</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(60.11%)</span></li>\r\n</ul>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"box-sizing: border-box;\"><em style=\"box-sizing: border-box;\">Madras Medical College</em></span>, Madras. T.N.<br style=\"box-sizing: border-box;\" />\r\n&nbsp;(The Tamilnadu Dr. M.G.R. Medical University,Chennai)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"box-sizing: border-box;\"><em style=\"box-sizing: border-box;\">April - 1994</em></span>.</span></p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">\r\n	<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box; font-weight: normal;\">D.Pharmacy</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(70.58%)</span></li>\r\n</ul>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S<span style=\"box-sizing: border-box;\"><em style=\"box-sizing: border-box;\">.V. Government Polytechnic</em></span>,&nbsp;<br style=\"box-sizing: border-box;\" />\r\n(State Board of Tech.Edu.&Trg., Hyd.) Tirupati,&nbsp;&nbsp; A.P.&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"box-sizing: border-box;\"><em style=\"box-sizing: border-box;\">February- 1989.</em></span></span></p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">Teaching work experience&nbsp; :&nbsp; 20 Years</span></span></p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent;\">\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"66\">\r\n			<p align=\"center\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">Sl.NO</span></span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"108\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">&nbsp;Post held</span></span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"348\">\r\n			<p align=\"center\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">Name of College/ University</span></span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"181\">\r\n			<p align=\"center\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">Duration</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"66\">\r\n			<p align=\"center\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">Present</span></span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"108\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">Principal</span></span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"348\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">Santhiram College of Pharmacy, Nandyala</span></span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"181\">\r\n			<p align=\"center\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">30th June 2017 to tilldate</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"66\">\r\n			<p align=\"center\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"108\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">Principal</span></span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"348\">\r\n			<p align=\"center\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">Nova College of Pharmacy, Jangareddigudem, WG</span></span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"181\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\"><span style=\"box-sizing: border-box;\">Sept 2015 to June 2017</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"66\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">I</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"108\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Principal</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"348\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Mahathi College of Pharmacy,Madanapalle<br style=\"box-sizing: border-box;\" />\r\n			(Service is ratified by the University)</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"181\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">December 2014&nbsp;&nbsp; to&nbsp;<br style=\"box-sizing: border-box;\" />\r\n			August 2015</span></p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"66\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">II</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"108\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Principal</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"348\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Rao’s college of Pharmacy, Nellore<br style=\"box-sizing: border-box;\" />\r\n			(Service is ratified by the University)</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"181\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">November 2013&nbsp;&nbsp; to&nbsp;<br style=\"box-sizing: border-box;\" />\r\n			December 2014</span></p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"66\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">III</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"108\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Asso. Professor</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"348\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Faculty of Pharmacy,<br style=\"box-sizing: border-box;\" />\r\n			ASIA Metropolitan University,&nbsp;<span style=\"box-sizing: border-box;\">Malaysia</span>&nbsp;(Earlier,&nbsp; Masterskill University College of Health Sciences)&nbsp;<br style=\"box-sizing: border-box;\" />\r\n			(Service is ratified by the University)</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"181\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">September 2012&nbsp;&nbsp; to</span></p>\r\n\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">&nbsp;November 2013</span></p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"66\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">IV</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"108\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Professor cum Principal</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"348\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Annamacharya college of Pharmacy, Rajampet<br style=\"box-sizing: border-box;\" />\r\n			(Service is ratified by the University)</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"181\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">February 2005&nbsp;&nbsp;&nbsp;&nbsp; to<br style=\"box-sizing: border-box;\" />\r\n			August 2012</span></p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"66\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">V</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"108\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Asst. Professor</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"348\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">SRM college of Pharmacy, Chennai.TN</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"181\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">December 2002&nbsp;&nbsp; to<br style=\"box-sizing: border-box;\" />\r\n			February 2005</span></p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"66\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">VI</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"108\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Asst. Professor</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"348\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Sri Padmavathi School of Pharmacy, Thirupathi. AP</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"181\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">December 1999&nbsp;&nbsp; to<br style=\"box-sizing: border-box;\" />\r\n			December 2002</span></p>\r\n			</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"66\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">VII</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"108\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">Asst. Professor</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"348\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">RVS College of Pharmacy, Coimbatore, T.N</span></p>\r\n			</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" valign=\"top\" width=\"181\">\r\n			<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">April 1997&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to<br style=\"box-sizing: border-box;\" />\r\n			December 1999</span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">&nbsp;</span></p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-weight: 200; line-height: 25px; padding: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700; font-family: droid_sansregular;\">&nbsp;</span></p>\r\n<title></title>\r\n<p>&nbsp;</p>', '0000-00-00', 0, NULL, 'no', '2019-05-16 05:12:32');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (78, 'manual', 0, 'Courses Offered', 'page/courses-offered', 'page', 'courses-offered', '', '', '', '', '<title></title>\r\n<table border=\"10\" bordercolor=\"#C68D1A\" cellpadding=\"0\" cellspacing=\"0\" height=\"223\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: droid_sansregular;\" width=\"706\">\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td align=\"center\" style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" width=\"100%\"><span style=\"font-size:16px;\"><img align=\"middle\" alt=\"Chancellor\" height=\"200\" src=\"http://www.srcpnandyal.com/img/banner/course-offered.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle;\" title=\"Chancellor\" width=\"701\" /></span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h1 style=\"box-sizing: border-box; font-size: 28.6px; margin: 20px 0px 10px; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); padding: 0px 0px 10px;\"><span style=\"font-size:16px;\">Under Graduate-B.Pharmacy</span></h1>\r\n\r\n<table bookman=\"\" border=\"10\" bordercolor=\"#C6C600\" cellpadding=\"5\" cellspacing=\"10\" font-size:=\"\" old=\"\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: \" width=\"725\">\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr bgcolor=\"#BBB82B\" style=\"box-sizing: border-box;\">\r\n			<th style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131); color: rgb(255, 255, 255); font-size: 20px;\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">Eligibility:</span></span></th>\r\n			<th style=\"box-sizing: border-box; text-align: center; border: 1px solid rgb(255, 216, 131); color: rgb(255, 255, 255); font-size: 20px;\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">Intake</span></span></th>\r\n			<th style=\"box-sizing: border-box; text-align: center; border: 1px solid rgb(255, 216, 131); color: rgb(255, 255, 255); font-size: 20px;\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">Duration</span></span></th>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\"><span style=\"font-size:16px;\">Intermediate M.P.C or Bi.P.C Stream with 50% Marks for open category and 45% Marks for SC/ST Category or EAMCET Qualified</span></td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131); text-align: center;\"><span style=\"font-size:16px;\">100 Seats</span></td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131); text-align: center;\"><span style=\"font-size:16px;\">4 years</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table bookman=\"\" border=\"10\" bordercolor=\"#C6C600\" cellpadding=\"5\" cellspacing=\"10\" font-size:=\"\" old=\"\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: \" width=\"725\">\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr bgcolor=\"#BBB82B\" style=\"box-sizing: border-box;\">\r\n			<th style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131); color: rgb(255, 255, 255); font-size: 20px;\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">B.Pharmacy (Lateral Entry) :</span></span></th>\r\n			<th style=\"box-sizing: border-box; text-align: center; border: 1px solid rgb(255, 216, 131); color: rgb(255, 255, 255); font-size: 20px;\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">Intake</span></span></th>\r\n			<th style=\"box-sizing: border-box; text-align: center; border: 1px solid rgb(255, 216, 131); color: rgb(255, 255, 255); font-size: 20px;\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">Duration</span></span></th>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\"><span style=\"font-size:16px;\">Eligibility: Diploma in pharmacy with 50% Aggregate or ECET Qualified.</span></td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131); text-align: center;\"><span style=\"font-size:16px;\">10</span></td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131); text-align: center;\"><span style=\"font-size:16px;\">3 years</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><br style=\"box-sizing: border-box; font-family: droid_sansregular;\" />\r\n&nbsp;</p>\r\n\r\n<table bookman=\"\" border=\"10\" bordercolor=\"#C6C600\" cellpadding=\"5\" cellspacing=\"10\" font-size:=\"\" old=\"\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: \" width=\"725\">\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr bgcolor=\"#BBB82B\" style=\"box-sizing: border-box;\">\r\n			<th style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131); color: rgb(255, 255, 255); font-size: 20px;\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">Pharm.D</span></span></th>\r\n			<th style=\"box-sizing: border-box; text-align: center; border: 1px solid rgb(255, 216, 131); color: rgb(255, 255, 255); font-size: 20px;\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">Intake</span></span></th>\r\n			<th style=\"box-sizing: border-box; text-align: center; border: 1px solid rgb(255, 216, 131); color: rgb(255, 255, 255); font-size: 20px;\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">Duration</span></span></th>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\"><span style=\"font-size:16px;\">Intermediate M.P.C or Bi.P.C Stream with 50% Marks for open category and 45% Marks for SC/ST Category or EAMCET Qualified</span></td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131); text-align: center;\"><span style=\"font-size:16px;\">30</span></td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131); text-align: center;\"><span style=\"font-size:16px;\">6 years</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h1 style=\"box-sizing: border-box; font-size: 28.6px; margin: 20px 0px 10px; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); padding: 0px 0px 10px;\"><span style=\"font-size:16px;\">Post Graduate-M.Pharmacy</span></h1>\r\n\r\n<table bookman=\"\" border=\"10\" bordercolor=\"#C6C600\" cellpadding=\"5\" cellspacing=\"10\" font-size:=\"\" old=\"\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: \" width=\"781\">\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr bgcolor=\"#BBB82B\" style=\"box-sizing: border-box;\">\r\n			<th style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131); font-size: 20px; color: rgb(255, 255, 255);\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">Specializations</span></span></th>\r\n			<th style=\"box-sizing: border-box; text-align: center; border: 1px solid rgb(255, 216, 131); font-size: 20px; color: rgb(255, 255, 255);\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">Intake</span></span></th>\r\n			<th style=\"box-sizing: border-box; text-align: center; border: 1px solid rgb(255, 216, 131); font-size: 20px; color: rgb(255, 255, 255);\"><span style=\"font-size:16px;\"><span style=\"box-sizing: border-box;\">Duration</span></span></th>\r\n		</tr>\r\n	</tbody>\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\"><span style=\"font-size:16px;\">Pharmaceutics</span></td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131); text-align: center;\"><span style=\"font-size:16px;\">18</span></td>\r\n			<td rowspan=\"6\" style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131); text-align: center;\"><span style=\"font-size:16px;\">2 Years</span></td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\"><span style=\"font-size:16px;\">Industrial Pharmacy</span></td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131); text-align: center;\"><span style=\"font-size:16px;\">24</span></td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\"><span style=\"font-size:16px;\">Pharmaceutical Analysis</span></td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131); text-align: center;\"><span style=\"font-size:16px;\">24</span><br />\r\n			&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', '0000-00-00', 0, NULL, 'no', '2019-05-27 23:50:49');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (79, 'manual', 0, 'Gallery', 'page/gallery', 'page', 'gallery', '', '', '', '', '<p><img src=\"https://santhirampharmacy.edu.in/uploads/gallery/media/national conference - Copy.JPG\" /><img src=\"https://santhirampharmacy.edu.in/uploads/gallery/media/graduation day - Copy-1558031400.JPG\" /><img src=\"https://santhirampharmacy.edu.in/uploads/gallery/media/placements.jpg\" /><img src=\"https://santhirampharmacy.edu.in/uploads/gallery/media/Graduation day celebrations 2.JPG\" /><img src=\"https://santhirampharmacy.edu.in/uploads/gallery/media/Graduation day celebrations - Copy.JPG\" /><img src=\"https://santhirampharmacy.edu.in/uploads/gallery/media/Professional Activities From 2018 march to 2019 march (1)_page-0001.jpg\" /><img src=\"https://santhirampharmacy.edu.in/uploads/gallery/media/Professional Activities From 2018 march to 2019 march (1)_page-0002.jpg\" /><img src=\"https://santhirampharmacy.edu.in/uploads/gallery/media/Professional Activities From 2018 march to 2019 march (1)_page-0003 (1).jpg\" /></p>', '0000-00-00', 0, NULL, 'no', '2019-05-17 03:52:43');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (80, 'manual', 0, 'Events', 'page/events', 'page', 'events', '', '', '', '', '<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>&nbsp;</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2019-05-08 20:59:00');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (81, 'manual', 0, 'News', 'page/news', 'page', 'news', '', '', '', '', '<title></title>\r\n<p>Admissions are open for the academic year 2019-2020 for B.pharmacy M.pharmacy Pharm D Management seats</p>', '0000-00-00', 0, 1, 'no', '2019-05-14 00:49:16');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (83, 'manual', 0, 'Faculty', 'page/faculty', 'page', 'faculty', '', '', '', '', '<p>&nbsp; &nbsp;</p>\r\n\r\n<table align=\"center\" border=\"5\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:358px;\" width=\"356\">\r\n	<colgroup>\r\n		<col />\r\n		<col />\r\n	</colgroup>\r\n	<tbody>\r\n		<tr height=\"22\">\r\n			<td height=\"22\" style=\"height:22px;width:235px;\"><span style=\"color:#800000;\">Qualification&nbsp;</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#800000;\">Number</span></td>\r\n		</tr>\r\n		<tr height=\"20\">\r\n			<td height=\"20\" style=\"height:20px;width:235px;\"><span style=\"color:#800000;\">Professors</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#800000;\">7</span></td>\r\n		</tr>\r\n		<tr height=\"20\">\r\n			<td height=\"20\" style=\"height:20px;width:235px;\"><span style=\"color:#800000;\">Assoc. Professors</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#800000;\">17</span></td>\r\n		</tr>\r\n		<tr height=\"20\">\r\n			<td height=\"20\" style=\"height:20px;width:235px;\"><span style=\"color:#800000;\">Asst. Professors</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#800000;\">26</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"5\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:756px;\" width=\"754\">\r\n	<colgroup>\r\n		<col />\r\n		<col />\r\n		<col span=\"2\" />\r\n		<col />\r\n	</colgroup>\r\n	<thead>\r\n		<tr height=\"19\">\r\n			<th height=\"19\" scope=\"col\" style=\"height: 19px; width: 64px;\"><span style=\"color:#cc6699;\">S.No</span></th>\r\n			<th scope=\"col\" style=\"width: 235px; text-align: left;\"><span style=\"color:#cc6699;\">Name of the Faculty</span></th>\r\n			<th scope=\"col\" style=\"width: 123px; text-align: left;\"><span style=\"color:#cc6699;\">Qualification</span></th>\r\n			<th scope=\"col\" style=\"width: 123px; text-align: left;\"><span style=\"color:#cc6699;\">Designation</span></th>\r\n			<th scope=\"col\" style=\"width: 212px; text-align: left;\"><span style=\"color:#cc6699;\">Specialization</span></th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr height=\"38\">\r\n			<td height=\"38\" style=\"height:38px;width:64px;\"><span style=\"color:#cc6699;\">1</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Dr.C. Madhusudhana Chetty</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, Ph.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Principal & Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">2</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. K. Ravikumar</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, (Ph.D)</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">3</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. D. Maheswara Reddy</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">4</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr.K.Sampath Kumar</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">5</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mrs. S. Gousia Begum</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">6</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. G. Chenna Keshavulu</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">7</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. G. Chennaiah</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">8</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mrs. K. V. Divya Jyothi</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">9</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms. S. Sushma Priya</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">10</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms. M. Santhi Parimala</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">11</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms. S. Ayesha Afreen</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">12</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms. P Shravana Sandhya</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACEUTICS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">13</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Dr. L. Siva Sankar Reddy</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, Ph.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. ANALYSIS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">14</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Dr. B.Md. Ishaq</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, Ph.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. ANALYSIS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">15</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Dr. N.D.V.R. Saradhi</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, Ph.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. ANALYSIS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">16</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. D. China babu</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, (Ph.D)</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. ANALYSIS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">17</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. D. Venkatesh</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. ANALYSIS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">18</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mrs. A.Subhashini</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. ANALYSIS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">19</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms K.Maheswari</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. ANALYSIS</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">20</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Dr. Y. Dasthagiri Reddy</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, Ph.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">INDUSTRIAL PHARMACY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">21</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. V. Vijay Kumar</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, (Ph.D)</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">INDUSTRIAL PHARMACY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">22</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. K. Pavan Kumar</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">INDUSTRIAL PHARMACY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">23</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Dr. M. Sreenivasulu</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, Ph.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. CHEMISTRY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">24</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. G. Mahaboob basha</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. CHEMISTRY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">25</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. T. Venkata Ramaiah</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. CHEMISTRY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">26</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. S. Venu</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. CHEMISTRY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">27</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms. B. Mayuri</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. CHEMISTRY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">28</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms. Shaik Rizwana</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. CHEMISTRY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">29</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. K. Sivaiah</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, (Ph.D)</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHRM. CHEMISTRY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">30</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. B. Venkataramana</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, (Ph.D)</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACOLOGY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">31</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. R.Niranjan Kumar</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACOLOGY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">32</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mrs. V. Saroja</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACOLOGY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">33</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mrs. S. Parveen</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACOLOGY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">34</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms. B. Bhargavi</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACOLOGY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">35</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Dr. R. E. Ugandar</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, Ph.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACOLOGY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">36</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. V. Rama Narayana Reddy</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, (Ph.D)</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACY PRACTICE</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">37</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Dr. C. Bhargav Reddy</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Pharm.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACY PRACTICE</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">38</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. A. Sandeep</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Pharm.D, (P.B)</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACY PRACTICE</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">39</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms. A.S. Malan Bee</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Pharm.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACY PRACTICE</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">40</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms. U Sowjanya</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Pharm.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACY PRACTICE</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">41</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms. C. Renuka Tejeshwini</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Pharm.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACY PRACTICE</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">42</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Ms. B. Rupa Sai</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Pharm.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACY PRACTICE</span></td>\r\n		</tr>\r\n		<tr height=\"38\">\r\n			<td height=\"38\" style=\"height:38px;width:64px;\"><span style=\"color:#cc6699;\">43</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. N.Madana Gopal</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm, (Ph.D)</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACOGNOSY & BIOTECHNOLOGY</span></td>\r\n		</tr>\r\n		<tr height=\"38\">\r\n			<td height=\"38\" style=\"height:38px;width:64px;\"><span style=\"color:#cc6699;\">44</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. N. Srinivas Reddy</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACOGNOSY & BIOTECHNOLOGY</span></td>\r\n		</tr>\r\n		<tr height=\"38\">\r\n			<td height=\"38\" style=\"height:38px;width:64px;\"><span style=\"color:#cc6699;\">45</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mrs A.Renuka</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACOGNOSY & BIOTECHNOLOGY</span></td>\r\n		</tr>\r\n		<tr height=\"38\">\r\n			<td height=\"38\" style=\"height:38px;width:64px;\"><span style=\"color:#cc6699;\">46</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mrs. R. Jameela</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACOGNOSY & BIOTECHNOLOGY</span></td>\r\n		</tr>\r\n		<tr height=\"38\">\r\n			<td height=\"38\" style=\"height:38px;width:64px;\"><span style=\"color:#cc6699;\">47</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mrs. S. Sumiya</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Pharm</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">PHARMACOGNOSY & BIOTECHNOLOGY</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">48</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Dr. D. Veereshappa</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Sc, Ph.D</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">HUMANITIES & SCIENCES</span></td>\r\n		</tr>\r\n		<tr height=\"19\">\r\n			<td height=\"19\" style=\"height:19px;width:64px;\"><span style=\"color:#cc6699;\">49</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. B. Abraham</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.A</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Assoc. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">HUMANITIES & SCIENCES</span></td>\r\n		</tr>\r\n		<tr height=\"20\">\r\n			<td height=\"20\" style=\"height:20px;width:64px;\"><span style=\"color:#cc6699;\">50</span></td>\r\n			<td style=\"width:235px;\"><span style=\"color:#cc6699;\">Mr. M. Balakrishna</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">M.Sc</span></td>\r\n			<td style=\"width:123px;\"><span style=\"color:#cc6699;\">Asst. Professor</span></td>\r\n			<td style=\"width:212px;\"><span style=\"color:#cc6699;\">HUMANITIES & SCIENCES</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '0000-00-00', 0, 1, 'no', '2019-05-16 04:00:30');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (84, 'manual', 0, 'Brochure -2019', 'page/brochure-2019', 'page', 'brochure-2019', '', '', '', '', '<p><span style=\"font-size:48px;\"><a href=\"https://santhirampharmacy.edu.in/uploads/gallery/media/Placement brochure Download.pdf\">Placement brochure Download.pdf</a></span><img src=\"https://santhirampharmacy.edu.in/uploads/gallery/media/placement - Copy_page-0001.jpg\" /><img src=\"https://santhirampharmacy.edu.in/uploads/gallery/media/placement - Copy_page-0002.jpg\" /><img src=\"https://santhirampharmacy.edu.in/uploads/gallery/media/placement - Copy_page-0003.jpg\" /></p>', '0000-00-00', 0, NULL, 'no', '2019-05-17 01:15:34');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (85, 'manual', 0, 'Academics', 'page/academics', 'page', 'academics', '', '', '', '', '<title></title>\r\n<p><a href=\"https://santhirampharmacy.edu.in/uploads/gallery/media/Acadamic regulations for M.Pharmacy.pdf\">Acadamic regulations for M.Pharmacy.pdf</a></p>\r\n\r\n<p><a href=\"https://santhirampharmacy.edu.in/uploads/gallery/media/Acadamic regulations for pharm D.docx\">Acadamic regulations for pharm D.docx</a></p>\r\n\r\n<p><a href=\"https://santhirampharmacy.edu.in/uploads/gallery/media/Course Structure for B.Pharmacy-R15 Regulations.pdf\">Course Structure for B.Pharmacy-R15 Regulations.pdf</a></p>\r\n\r\n<p><span style=\"color:#A52A2A;\"><span style=\"font-size:26px;\">Reaserch</span></span></p>\r\n\r\n<p><a href=\"http://www.srcpnandyal.com/quicklink/Articles%20publications.zip\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(179, 127, 15); text-decoration-line: none; font-family: droid_sansregular; font-size: 13.65px;\"><font color=\"#008040\" size=\"+3\" style=\"box-sizing: border-box;\">Click here to down load publications</font></a></p>\r\n\r\n<p><a href=\"http://www.srcpnandyal.com/quicklink/Articles%20publications/Research%20Projects%20list%20-22.docx\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(179, 127, 15); text-decoration-line: none; font-family: droid_sansregular; font-size: xx-large;\">Latest Reseach Projects</a></p>', '0000-00-00', 0, NULL, 'no', '2019-05-31 00:16:35');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (86, 'manual', 0, 'Facilities', 'page/facilities', 'page', 'facilities', '', '', '', '', '<table border=\"10\" bordercolor=\"#C68D1A\" cellpadding=\"15\" cellspacing=\"0\" height=\"286\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: droid_sansregular;\" width=\"706\">\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td align=\"center\" style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" width=\"100%\"><img align=\"middle\" alt=\"\" height=\"284\" src=\"http://www.srcpnandyal.com/img/facilities/BUS.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle;\" title=\"\" width=\"705\" /></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h1 style=\"box-sizing: border-box; font-size: 28.6px; margin: 20px 0px 10px; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); padding: 0px 0px 10px;\">Transportation Facility</h1>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">The campus being 12Kms from the Nandyal and 69Km from kurnool city, the college provides transportation facility for both students and staff. There are sufficient buses which take care of commutation of about seven hundred students. There are two exclusive buses for the staff.</p>\r\n\r\n<h1 style=\"box-sizing: border-box; font-size: 28.6px; margin: 20px 0px 10px; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); padding: 0px 0px 10px;\">ABSTRACT OF LIBRARY BOOKS</h1>\r\n\r\n<table border=\"5\" bordercolor=\"#FFA54A\" cellpadding=\"5\" cellspacing=\"5\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: droid_sansregular;\">\r\n	<colgroup style=\"box-sizing: border-box;\">\r\n		<col style=\"box-sizing: border-box;\" width=\"73\" />\r\n		<col style=\"box-sizing: border-box;\" width=\"337\" />\r\n		<col style=\"box-sizing: border-box;\" width=\"73\" />\r\n		<col style=\"box-sizing: border-box;\" width=\"113\" />\r\n	</colgroup>\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">S NO</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">DEPARTMENT</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">TITLE</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">VOLUMES</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">1</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACOGNOSY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">26</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">352</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">2</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACY PRACTICE</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">38</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">335</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">3</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">HUMAN ANATOMY & PHYSIOLOGY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">18</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">295</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">4</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMAACEUTICS (DISPENSING &GENERAL PHARMACY)</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">38</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">512</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">5</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL ORGANIC CHIMISTRY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">92</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">718</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">6</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL INORGANIC CHEMISTRY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">24</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">371</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">7</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL MICROBIOLOGY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">23</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">230</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">8</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PATHOPHYSIOLOGY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">15</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">174</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">9</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">APPLIED BIOCHEMISTRY & CLINICAL CHEMISTRY (BIO TECH)</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">31</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">277</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">10</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACOLOGY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">20</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">295</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">11</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL JURISPUDENCE</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">29</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">231</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">12</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL DOSAGE FORMS</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">12</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">116</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">13</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">COMMUNITY PHARMACY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">9</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">142</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">14</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">CLINICAL PHARMACY (TOXICOLOGY )</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">17</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">139</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">15</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">HOSPITAL PHARMACY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">12</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">102</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">16</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACOTHERAPEUTICS</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">13</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">122</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">17</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL ANALYSIS AND QUALITY ASSURANCE</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">52</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">468</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">18</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">MEDICINAL CHEMISTRY&nbsp;</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">27</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">265</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">19</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">BIOLOGY (COGNOSY)</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">18</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">174</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">20</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">COMPUTER SCIENCE OR COMPUTER APPLICATION IN PHARMACY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">19</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">151</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">21</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">&nbsp;MATHEMATICS / STATISTICS</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">18</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">194</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">22</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">COMMUNICATION SKILLS</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">32</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">376</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">23</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICEUTICS (DRUG DELIVERY SYSTEMS PH.ENGG REGULATORY SCIENCE)</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">215</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">1421</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">&nbsp;</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">TOTAL</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">798</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">7460</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">&nbsp;</p>\r\n\r\n<table border=\"5\" bordercolor=\"#FFA54A\" cellpadding=\"5\" cellspacing=\"5\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: droid_sansregular;\">\r\n	<colgroup style=\"box-sizing: border-box;\">\r\n		<col style=\"box-sizing: border-box;\" width=\"73\" />\r\n		<col style=\"box-sizing: border-box;\" width=\"337\" />\r\n		<col style=\"box-sizing: border-box;\" width=\"73\" />\r\n		<col style=\"box-sizing: border-box;\" width=\"113\" />\r\n	</colgroup>\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<th colspan=\"4\" style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131);\">List of Pharm.D books</th>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<th style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131);\" width=\"19\">S NO</th>\r\n			<th style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131);\" width=\"165\">DEPARTMENT</th>\r\n			<th style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131);\" width=\"35\">TITLE</th>\r\n			<th style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131);\" width=\"61\">VOLUMES</th>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">1</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACY PRACTICE</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">25</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">214</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">2</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">HUMAN ANATOMY & PHYSIOLOGY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">12</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">106</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">3</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMAACEUTICS (DISPENSING &GENERAL PHARMACY)</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">28</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">168</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">4</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACOGNOSY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">9</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">74</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">5</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL ORGANIC CHIMISTRY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">20</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">153</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">6</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL INORGANIC CHEMISTRY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">8</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">82</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">7</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL MICROBIOLOGY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">7</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">65</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">8</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PATHOPHYSIOLOGY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">10</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">96</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">9</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">APPLIED BIOCHEMISTRY & CLINICAL CHEMISTRY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">7</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">62</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">10</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACOLOGY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">12</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">126</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">11</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL JURISPUDENCE</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">6</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">67</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">12</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL DOSAGE FORMS</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">10</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">82</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">13</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">COMMUNITY PHARMACY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">6</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">85</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">14</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">CLINICAL PHARMACY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">4</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">74</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">15</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">HOSPITAL PHARMACY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">5</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">76</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">16</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACOTHERAPEUTICS</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">10</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">154</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">17</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">PHARMACEUTICAL ANALYSIS</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">18</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">165</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">18</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">MEDICINAL CHEMISTRY&nbsp;</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">8</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">86</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">19</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">BIOLOGY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">3</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">20</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">20</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">COMPUTER SCIENCE OR COMPUTER APPLICATION IN PHARMACY</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">6</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">68</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">21</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">&nbsp;MATHEMATICS / STATISTICS</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">16</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">156</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">&nbsp;</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">TOTAL</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">230</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">2179</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">&nbsp;</p>\r\n\r\n<h2 style=\"box-sizing: border-box; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); margin-top: 20px; margin-bottom: 10px; font-size: 18.2px; padding: 0px 0px 10px;\">&nbsp;</h2>\r\n\r\n<table border=\"5\" bordercolor=\"#FFA54A\" cellpadding=\"5\" cellspacing=\"5\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent;\">\r\n	<colgroup style=\"box-sizing: border-box;\">\r\n		<col style=\"box-sizing: border-box;\" width=\"76\" />\r\n		<col style=\"box-sizing: border-box;\" width=\"500\" />\r\n	</colgroup>\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<th colspan=\"2\" style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131);\" width=\"576\">List of journals for the academic year 2017-18</th>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<th style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131);\">S.NO</th>\r\n			<th style=\"box-sizing: border-box; text-align: left; border: 1px solid rgb(255, 216, 131);\"><a name=\"RANGE!B5\" style=\"box-sizing: border-box; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; color: rgb(51, 51, 51);\">NATIONAL JOURNALS&nbsp;&nbsp;&nbsp;</a></th>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">1</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Chronicle Pharmabiz</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">2</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Drug Today</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">3</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Express Pharma</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">4</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">The Pharma Review</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">5</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Journal Of&nbsp; Genetics</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">6</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Indian Journal Of Pharmaceutical Sciences</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">7</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Phytopharm</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">8</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Biomedical Analysis</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">9</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">NDDS</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">10</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Indian Drugs</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">11</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Science Reporter</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">12</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Nutraceuticals</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">13</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Clinical Research</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">14</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Pharmacy Practice</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">15</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Drug Information Bulletin&nbsp;</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">16</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">The Indian Pharmacist</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">17</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Pharmaceutical Process Development</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">18</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Elements Of Pharmacovigilance</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">19</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Indian Journal Of Pain</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">20</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Pharm Tech</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">&nbsp;</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">INTERNATIONAL JOURNALS</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">1</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Asian Journal Of Pharmaceutical Analysis</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">2</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Asian Journal Of&nbsp; Research&nbsp; In Chemistry</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">3</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Pharm Analysis & Quality Assurance</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">4</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">International Journal Of Pharmacology And Biological Sciences</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">5</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Advances In Pharmacology And Toxicology</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">6</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Medicinal And Aromatic Plants Abstracts</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">7</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Who Drug Information&nbsp;&nbsp;&nbsp;</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">8</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Indian Journal Of Pharmacology</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">9</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Indian Journal Pharmaceutical Education &&nbsp; Research</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">10</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Indian Journal Of Community Medicine</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">11</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Indian Journal Of Sexually Transmitted Diseases & Aids</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">12</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Indian Journal Of Family Welfare</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">13</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Indian Journal Of Dermatology</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">14</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Journal Of Hospital Pharmacy</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">15</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Indian Journal Of Pharmacy Practice (Ijopp)</td>\r\n		</tr>\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">16</td>\r\n			<td style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\">Journal Of Intellectual Property Rights</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 19.11px; color: rgb(51, 51, 51); font-family: droid_sansregular; line-height: 25px; padding: 0px;\">&nbsp;</p>\r\n\r\n<h2 style=\"box-sizing: border-box; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); margin-top: 20px; margin-bottom: 10px; font-size: 18.2px; padding: 0px 0px 10px;\">Infrastructure & Building Area</h2>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-family: droid_sansregular; line-height: 25px; padding: 0px; text-align: justify;\">The SRPC campus is a beautiful and serene atmosphere ideally suited for technical education. The infrastructure and facilities available on campus are amongst the very best. It is a wholly self-contained campus comprising of everything that students on campus would ever require.</p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-family: droid_sansregular; line-height: 25px; padding: 0px; text-align: justify;\">Greenery in terms of the grass, permanent green plants, trees and flowers have been laid down all over the campus. Horticulture maintenance and development has been meticulously monitored to keep up with the changing weather.</p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 13.65px; font-family: droid_sansregular; line-height: 25px; padding: 0px; text-align: justify;\">SRPC provides full-fledged and marvelous infrastructure. All the required Drawing Halls, Class Rooms, Laboratories, Engineering Workshop, English Language Communication Skills Lab, Library, Computer Center, Internet Lab, Seminar Halls, E-class Rooms, Indoor Games and Faculty Rooms are housed in a total building space of&nbsp;<span style=\"box-sizing: border-box;\">3,81,000 sft</span>. OHPs/LCD projectors are established for all the classrooms to assure an effective teaching-learning process.</p>\r\n\r\n<h1 style=\"box-sizing: border-box; font-size: 28.6px; margin: 20px 0px 10px; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); padding: 0px 0px 10px;\">Bank and ATM</h1>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 18px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">We have an State Bank India Extension Counter at our Campus. This helps all our Students and Faculty to open a bank account and make transactions safer and faster. We have ATM facility.</p>\r\n\r\n<table border=\"10\" bordercolor=\"#C68D1A\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: droid_sansregular;\" width=\"706\">\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td align=\"center\" style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" width=\"100%\"><img align=\"middle\" alt=\"Chancellor\" height=\"242\" src=\"http://www.srcpnandyal.com/img/banner/water.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle;\" title=\"Chancellor\" width=\"701\" /></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h1 style=\"box-sizing: border-box; font-size: 28.6px; margin: 20px 0px 10px; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); padding: 0px 0px 10px;\">Mineral Water</h1>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">The Reverse Osmosis Plant installed in the&nbsp;<span style=\"box-sizing: border-box;\">SRPC</span>&nbsp;caters to the drinking water needs of all the Students, Teachers, supporting Staff and the Visitors. The raw water with an average Total Dissolved Solids [TDS] of 750-1000 ppm is treated to reduce the TDS content to less than 100 ppm the generally acceptable upper limit of the TDS</p>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">This is done in Three stages, namely: Pretreatment, passage of the water through 6 RO membrane filters held in parallel to each other{main process] and Post treatment. The maximum capacity of the plant is 1500 litres per hour [at the rate of 250 lit per membrane] The utilized capacity is 1000 lit/hr potable water. This water is Pure, Tasty and Hygienic rendering it highly suitable for human consumption.</p>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">The rejects water from the plant is used for gardening and washing purposes. This plant not only facilitates the supply of safe drinking water but also obviates the otherwise involved huge expenditure for procuring drinking water for the large number of people in the campus. Now the institution can be liberal in the provision of our own made RO water.</p>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">66 coolers are connected to this plant providing drinking water in every floor of class room blocks, administrative block, library and &nbsp;laboratories Etc..</p>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\"><img align=\"middle\" alt=\"\" height=\"242\" src=\"http://www.srcpnandyal.com/img/facilities/internet.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; font-family: droid_sansregular;\" title=\"Chancellor\" width=\"701\" /></p>\r\n\r\n<h1 style=\"box-sizing: border-box; font-size: 28.6px; margin: 20px 0px 10px; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); padding: 0px 0px 10px;\">Internet & Wifi</h1>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">Our Campus has dedicated Internet Leased line of 100 Mbps , connected to all the terminals throughout the Campus. Students and faculty are free to access internet . This helps the students to prepare papers on the latest technologies to be presented in various symposiums and seminars.</p>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">Interested students who are willing to go abroad for further studies can take up tests such as GRE and TOEFL, take up online mock test and also browse through websites of various universities and centres of higher education around the world. The access speed enables the Students and Staff to download and upload files at a fast rate.</p>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">Wi-Fi Facility is also been provided in our hostels as well as in our central library.</p>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Our college has an 100 Mbps Internet connection Facility, One more point of highlight is every student is provided logins to access the internet free of cost, Under TEQIP programme. we have started campus wide networking also which further facilitates inter college communication. ACDOT telephone exchange is installed within the campus.SRPC is a WiFi enabled campus.</p>\r\n\r\n<table border=\"10\" bordercolor=\"#C68D1A\" style=\"box-sizing: border-box; max-width: 100%; background-color: transparent; font-family: droid_sansregular;\" width=\"706\">\r\n	<tbody style=\"box-sizing: border-box;\">\r\n		<tr style=\"box-sizing: border-box;\">\r\n			<td align=\"center\" style=\"box-sizing: border-box; border: 1px solid rgb(255, 216, 131);\" width=\"100%\"><img align=\"middle\" alt=\"Chancellor\" height=\"242\" src=\"http://www.srcpnandyal.com/img/banner/post.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle;\" title=\"Chancellor\" width=\"701\" /></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h1 style=\"box-sizing: border-box; font-size: 28.6px; margin: 20px 0px 10px; font-family: droid_sansbold; line-height: 1.1; color: rgb(0, 138, 204); padding: 0px 0px 10px;\">Post Office</h1>\r\n\r\n<p align=\"justify\" style=\"box-sizing: border-box; margin: 0px 0px 15px; font-size: 16px; font-family: droid_sansregular; line-height: 25px; padding: 0px;\">The campus has a branch post office. This post office has the capacity to cater to the large number of inward and outward mails on a daily basis. Post Office also offers the small savings schemes.</p>\r\n<title></title>\r\n<p>&nbsp;</p>', '0000-00-00', 0, NULL, 'no', '2019-05-27 23:45:38');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (88, 'manual', 0, 'NIRF-2019', 'page/nirf-2019', 'page', 'nirf-2019', '', '', '', '', '<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p><span style=\"font-size:22px;\"><a href=\"http://www.srcpnandyal.com/quicklink/NIRF%202019.pdf\">NIRF-2019</a></span></p>\r\n\r\n<p><span style=\"font-size:22px;\"><a href=\"http://www.srcpnandyal.com/quicklink/mandatory%20disclosure.rar\">Mandatory Disclousure</a></span></p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2019-05-31 00:24:09');


#
# TABLE STRUCTURE FOR: front_cms_program_photos
#

DROP TABLE IF EXISTS `front_cms_program_photos`;

CREATE TABLE `front_cms_program_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `media_gallery_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`),
  CONSTRAINT `front_cms_program_photos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `front_cms_programs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (3, 1, 6, '2019-05-14 00:42:28');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (4, 1, 5, '2019-05-14 00:42:32');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (8, 1, 28, '2019-05-17 00:39:06');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (12, 1, 35, '2019-05-17 03:16:06');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (13, 1, 36, '2019-05-17 03:17:55');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (15, 1, 38, '2019-05-17 03:42:52');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (16, 1, 45, '2019-05-27 23:59:33');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (17, 1, 48, '2019-05-28 00:11:45');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (18, 1, 47, '2019-05-28 00:11:54');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (19, 1, 46, '2019-05-28 00:12:11');
INSERT INTO `front_cms_program_photos` (`id`, `program_id`, `media_gallery_id`, `created_at`) VALUES (20, 1, 49, '2019-05-28 00:18:34');


#
# TABLE STRUCTURE FOR: front_cms_programs
#

DROP TABLE IF EXISTS `front_cms_programs`;

CREATE TABLE `front_cms_programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` mediumtext,
  `title` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `event_venue` mediumtext,
  `description` mediumtext,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `meta_title` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `meta_keyword` mediumtext NOT NULL,
  `feature_image` mediumtext NOT NULL,
  `publish_date` date NOT NULL,
  `publish` varchar(10) DEFAULT '0',
  `sidebar` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_programs` (`id`, `type`, `slug`, `url`, `title`, `date`, `event_start`, `event_end`, `event_venue`, `description`, `is_active`, `created_at`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `publish_date`, `publish`, `sidebar`) VALUES (1, 'banner', NULL, NULL, 'Banner Images', NULL, NULL, NULL, NULL, NULL, 'no', '2019-05-08 20:45:56', '', '', '', '', '0000-00-00', '0', 0);
INSERT INTO `front_cms_programs` (`id`, `type`, `slug`, `url`, `title`, `date`, `event_start`, `event_end`, `event_venue`, `description`, `is_active`, `created_at`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `publish_date`, `publish`, `sidebar`) VALUES (2, 'notice', 'admissions-are-open', 'read/admissions-are-open', 'Admissions are open', '2019-05-16', NULL, NULL, NULL, '<p><span xss=\"removed\">Admissions are open for the academic year 2019-2020 for B.pharmacy M.pharmacy Pharm D Management seats</span>  - More details contact 9704129298; 9866308468</p>', 'no', '2019-05-16 04:09:46', '', '', '', '', '0000-00-00', '0', NULL);
INSERT INTO `front_cms_programs` (`id`, `type`, `slug`, `url`, `title`, `date`, `event_start`, `event_end`, `event_venue`, `description`, `is_active`, `created_at`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `publish_date`, `publish`, `sidebar`) VALUES (4, 'notice', 'congratulations-to-pgcet-2019-qualifiers', 'read/congratulations-to-pgcet-2019-qualifiers', 'Congratulations to PGCET-2019 Qualifiers', '2019-05-17', NULL, NULL, NULL, '<p>Congratulations to Raja Susmitha student of Santhiram college of pharmacy  who got 21 st Rank in PGCET -2019.</p>\r\n\r\n<p>Congratulations to all final B.Pharm  students who got qualified </p>', 'no', '2019-05-17 01:52:31', '', '', '', '', '0000-00-00', '0', NULL);


#
# TABLE STRUCTURE FOR: front_cms_settings
#

DROP TABLE IF EXISTS `front_cms_settings`;

CREATE TABLE `front_cms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) DEFAULT NULL,
  `is_active_rtl` int(10) DEFAULT '0',
  `is_active_front_cms` int(11) DEFAULT '0',
  `is_active_sidebar` int(1) DEFAULT '0',
  `logo` varchar(200) DEFAULT NULL,
  `contact_us_email` varchar(100) DEFAULT NULL,
  `complain_form_email` varchar(100) DEFAULT NULL,
  `sidebar_options` mediumtext NOT NULL,
  `fb_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `pinterest_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `google_analytics` mediumtext,
  `footer_text` varchar(500) DEFAULT NULL,
  `fav_icon` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_settings` (`id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `fav_icon`, `created_at`) VALUES (1, 'yellow', NULL, 1, 1, './uploads/school_content/logo/front_logo-5cf0c0e6594b72.05922214.jpg', '', '', '[\"news\",\"complain\"]', 'https://facebook.com', 'https://twitter.com', 'https://www.youtube.com', 'https://aboutme.google.com', 'https://www.instagram.com', 'https://in.pinterest.com', 'https://www.linkedin.com', '', '© 2019 All Rights Reserved. Santhiram College of Pharmacy, Nandyal', './uploads/school_content/logo/front_fav_icon-5cd381851e7263.91216585.png', '2019-05-31 00:51:34');


#
# TABLE STRUCTURE FOR: general_calls
#

DROP TABLE IF EXISTS `general_calls`;

CREATE TABLE `general_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_dureation` varchar(50) NOT NULL,
  `note` mediumtext NOT NULL,
  `call_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: grades
#

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `point` float(10,1) DEFAULT NULL,
  `mark_from` float(10,2) DEFAULT NULL,
  `mark_upto` float(10,2) DEFAULT NULL,
  `description` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: homework
#

DROP TABLE IF EXISTS `homework`;

CREATE TABLE `homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `homework_date` date NOT NULL,
  `submit_date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `create_date` date NOT NULL,
  `document` varchar(200) NOT NULL,
  `created_by` int(11) NOT NULL,
  `evaluated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: homework_evaluation
#

DROP TABLE IF EXISTS `homework_evaluation`;

CREATE TABLE `homework_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: hostel
#

DROP TABLE IF EXISTS `hostel`;

CREATE TABLE `hostel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostel_name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `address` text,
  `intake` int(11) DEFAULT NULL,
  `description` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: hostel_rooms
#

DROP TABLE IF EXISTS `hostel_rooms`;

CREATE TABLE `hostel_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostel_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `room_no` varchar(200) DEFAULT NULL,
  `no_of_bed` int(11) DEFAULT NULL,
  `cost_per_bed` float(10,2) DEFAULT '0.00',
  `title` varchar(200) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: id_card
#

DROP TABLE IF EXISTS `id_card`;

CREATE TABLE `id_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `school_address` varchar(500) NOT NULL,
  `background` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `sign_image` varchar(100) NOT NULL,
  `header_color` varchar(100) NOT NULL,
  `enable_admission_no` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_student_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_class` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_blood_group` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `id_card` (`id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_admission_no`, `enable_student_name`, `enable_class`, `enable_fathers_name`, `enable_mothers_name`, `enable_address`, `enable_phone`, `enable_dob`, `enable_blood_group`, `status`) VALUES (1, 'Sample Student Identity Card', 'Mount Carmel School', '110 Kings Street, CA  Phone: 456542 Email: mount@gmail.com', 'samplebackground12.png', 'samplelogo12.png', 'samplesign12.png', '#595959', 1, 1, 1, 1, 0, 1, 1, 1, 1, 1);


#
# TABLE STRUCTURE FOR: income
#

DROP TABLE IF EXISTS `income`;

CREATE TABLE `income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inc_head_id` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `documents` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: income_head
#

DROP TABLE IF EXISTS `income_head`;

CREATE TABLE `income_head` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: item
#

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `item_store_id` int(11) DEFAULT NULL,
  `item_supplier_id` int(11) DEFAULT NULL,
  `quantity` int(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `item` (`id`, `item_category_id`, `name`, `item_photo`, `description`, `created_at`, `updated_at`, `item_store_id`, `item_supplier_id`, `quantity`, `date`) VALUES (1, 1, 'new item', NULL, 'aaaa', '2019-09-23 22:45:38', '0000-00-00 00:00:00', NULL, NULL, 0, '0000-00-00');


#
# TABLE STRUCTURE FOR: item_category
#

DROP TABLE IF EXISTS `item_category`;

CREATE TABLE `item_category` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`, `updated_at`) VALUES (1, 'new item', 'yes', 'aaaa', '2019-09-23 22:45:14', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: item_issue
#

DROP TABLE IF EXISTS `item_issue`;

CREATE TABLE `item_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type` varchar(15) DEFAULT NULL,
  `issue_to` varchar(100) DEFAULT NULL,
  `issue_by` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `note` text NOT NULL,
  `is_returned` int(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` varchar(10) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `item_category_id` (`item_category_id`),
  CONSTRAINT `item_issue_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_issue_ibfk_2` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: item_stock
#

DROP TABLE IF EXISTS `item_stock`;

CREATE TABLE `item_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `item_stock` (`id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (3, 1, 1, '+', 1, 2, '2019-09-19', 'uploads/inventory_items/3.jpg', 'fdasfd', 'yes', '2019-09-23 22:50:47');


#
# TABLE STRUCTURE FOR: item_store
#

DROP TABLE IF EXISTS `item_store`;

CREATE TABLE `item_store` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`) VALUES (1, 'item stoeck', '12121', 'descrio');
INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`) VALUES (2, 'dasfda', '232', 'asdfas');


#
# TABLE STRUCTURE FOR: item_supplier
#

DROP TABLE IF EXISTS `item_supplier`;

CREATE TABLE `item_supplier` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`) VALUES (1, 'dsfa', '2312123123', 'demo@example.com', 'cross 415', 'dfasdfa', '2132151231241', 'demo2@example.com', 'asdfasfdasf');


#
# TABLE STRUCTURE FOR: journals
#

DROP TABLE IF EXISTS `journals`;

CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_title` varchar(100) NOT NULL,
  `journal_no` varchar(50) NOT NULL,
  `issn_no` varchar(100) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `rack_no` varchar(100) NOT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `journalprice` float(10,2) DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `description` text,
  `available` varchar(10) DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `journals` (`id`, `journal_title`, `journal_no`, `issn_no`, `subject`, `rack_no`, `publisher`, `author`, `qty`, `journalprice`, `postdate`, `description`, `available`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'Learn AngularJS in 1 Day: Complete Angular JS Guide with Examples', '112512', '23232', 'Software', '134', 'Independently published ', 'Krishna Rungta', 9, '689.00', '2018-06-19', 'dsddsd', 'yes', 'no', '2019-06-21 14:04:00', '0000-00-00 00:00:00');
INSERT INTO `journals` (`id`, `journal_title`, `journal_no`, `issn_no`, `subject`, `rack_no`, `publisher`, `author`, `qty`, `journalprice`, `postdate`, `description`, `available`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'Learn AngularJS in 1 Day: Complete Angular JS Guide with Examples', '112512', '23232', 'Software', '134', 'Independently published ', 'Krishna Rungta', 9, '689.00', '2018-06-19', 'dsddsd', 'yes', 'no', '2019-06-21 19:17:32', '0000-00-00 00:00:00');
INSERT INTO `journals` (`id`, `journal_title`, `journal_no`, `issn_no`, `subject`, `rack_no`, `publisher`, `author`, `qty`, `journalprice`, `postdate`, `description`, `available`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'dfas', '23213', '12312-343-24243', 'adfd', '123', 'aaa', 'aaadf', 231, '13123.00', '2019-05-28', 'fsafgsdfa', 'yes', 'no', '2019-06-23 21:26:16', '0000-00-00 00:00:00');
INSERT INTO `journals` (`id`, `journal_title`, `journal_no`, `issn_no`, `subject`, `rack_no`, `publisher`, `author`, `qty`, `journalprice`, `postdate`, `description`, `available`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'Learn AngularJS in 1 Day: Complete Angular JS Guide with Examples', '112512', '23232', 'Software', '134', 'Independently published ', 'Krishna Rungta', 9, '689.00', '2018-06-19', 'dsddsd', 'yes', 'no', '2019-06-23 21:27:04', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: languages
#

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(50) DEFAULT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `code` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (1, 'Azerbaijan', 'no', 'no', 'az', '2019-03-25 09:27:01', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (2, 'Albanian', 'no', 'no', 'sq', '2019-03-25 09:25:01', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (3, 'Amharic', 'no', 'no', 'am', '2019-03-25 09:25:16', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (4, 'English', 'no', 'no', 'en', '2019-03-25 09:32:05', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (5, 'Arabic', 'no', 'no', 'ar', '2019-03-25 09:26:50', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (7, 'Afrikaans', 'no', 'no', 'af', '2019-03-25 09:24:33', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (8, 'Basque', 'no', 'no', 'eu', '2019-03-25 09:27:41', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (11, 'Bengali', 'no', 'no', 'bn', '2019-03-25 09:27:52', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (13, 'Bosnian', 'no', 'no', 'bs', '2019-03-25 09:28:03', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (14, 'Welsh', 'no', 'no', 'cy', '2019-03-25 09:46:16', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (15, 'Hungarian', 'no', 'no', 'hu', '2019-03-25 09:36:29', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (16, 'Vietnamese', 'no', 'no', 'vi', '2019-03-25 09:46:06', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (17, 'Haitian (Creole)', 'no', 'no', 'ht', '2019-03-25 09:35:54', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (18, 'Galician', 'no', 'no', 'gl', '2019-03-25 09:35:00', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (19, 'Dutch', 'no', 'no', 'nl', '2019-03-25 09:31:52', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (21, 'Greek', 'no', 'no', 'el', '2019-03-25 09:35:28', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (22, 'Georgian', 'no', 'no', 'ka', '2019-03-25 09:35:10', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (23, 'Gujarati', 'no', 'no', 'gu', '2019-03-25 09:35:38', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (24, 'Danish', 'no', 'no', 'da', '2019-03-25 09:31:40', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (25, 'Hebrew', 'no', 'no', 'he', '2019-03-25 09:36:06', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (26, 'Yiddish', 'no', 'no', 'yi', '2019-03-25 09:46:34', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (27, 'Indonesian', 'no', 'no', 'id', '2019-03-25 09:36:51', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (28, 'Irish', 'no', 'no', 'ga', '2019-03-25 09:37:02', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (29, 'Italian', 'no', 'no', 'it', '2019-03-25 09:37:11', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (30, 'Icelandic', 'no', 'no', 'is', '2019-03-25 09:36:40', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (31, 'Spanish', 'no', 'no', 'es', '2019-03-25 09:44:20', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (33, 'Kannada', 'no', 'no', 'kn', '2019-03-25 09:37:41', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (34, 'Catalan', 'no', 'no', 'ca', '2019-03-25 09:28:20', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (36, 'Chinese', 'no', 'no', 'zh', '2019-03-25 09:31:19', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (37, 'Korean', 'no', 'no', 'ko', '2019-03-25 09:37:55', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (38, 'Xhosa', 'no', 'no', 'xh', '2019-03-25 09:46:26', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (39, 'Latin', 'no', 'no', 'la', '2019-03-25 09:38:04', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (40, 'Latvian', 'no', 'no', 'lv', '2019-03-25 09:38:41', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (41, 'Lithuanian', 'no', 'no', 'lt', '2019-03-25 09:38:46', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (43, 'Malagasy', 'no', 'no', 'mg', '2019-03-25 09:39:17', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (44, 'Malay', 'no', 'no', 'ms', '2019-03-25 09:39:26', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (45, 'Malayalam', 'no', 'no', 'ml', '2019-03-25 09:39:36', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (46, 'Maltese', 'no', 'no', 'mt', '2019-03-25 09:39:46', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (47, 'Macedonian', 'no', 'no', 'mk', '2019-03-25 09:39:06', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (48, 'Maori', 'no', 'no', 'mi', '2019-03-25 09:39:55', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (49, 'Marathi', 'no', 'no', 'mr', '2019-03-25 09:40:04', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (51, 'Mongolian', 'no', 'no', 'mn', '2019-03-25 09:40:14', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (52, 'German', 'no', 'no', 'de', '2019-03-25 09:35:20', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (53, 'Nepali', 'no', 'no', 'ne', '2019-03-25 09:40:24', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (54, 'Norwegian', 'no', 'no', 'no', '2019-03-25 09:40:43', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (55, 'Punjabi', 'no', 'no', 'pa', '2019-03-25 09:41:20', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (57, 'Persian', 'no', 'no', 'fa', '2019-03-25 09:40:57', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (59, 'Portuguese', 'no', 'no', 'pt', '2019-03-25 09:41:09', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (60, 'Romanian', 'no', 'no', 'ro', '2019-03-25 09:41:41', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (61, 'Russian', 'no', 'no', 'ru', '2019-03-25 09:43:19', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (62, 'Cebuano', 'no', 'no', '', '2017-04-06 00:08:33', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (64, 'Sinhala', 'no', 'no', 'si', '2019-03-25 09:43:46', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (65, 'Slovakian', 'no', 'no', '', '2017-04-06 00:08:33', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (66, 'Slovenian', 'no', 'no', 'sl', '2019-03-25 09:44:07', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (67, 'Swahili', 'no', 'no', 'sw', '2019-03-25 09:44:40', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (68, 'Sundanese', 'no', 'no', 'su', '2019-03-25 09:44:30', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (70, 'Thai', 'no', 'no', 'th', '2019-03-25 09:45:29', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (71, 'Tagalog', 'no', 'no', 'tl', '2019-03-25 09:45:00', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (72, 'Tamil', 'no', 'no', 'ta', '2019-03-25 09:45:09', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (74, 'Telugu', 'no', 'no', 'te', '2019-03-25 09:45:18', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (75, 'Turkish', 'no', 'no', 'tr', '2019-03-25 09:45:36', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (77, 'Uzbek', 'no', 'no', 'uz', '2019-03-25 09:45:56', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (79, 'Urdu', 'no', 'no', 'ur', '2019-03-25 09:45:47', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (80, 'Finnish', 'no', 'no', 'fi', '2019-03-25 09:34:34', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (81, 'French', 'no', 'no', 'fr', '2019-03-25 09:34:46', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (82, 'Hindi', 'no', 'no', 'hi', '2019-03-25 09:36:19', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (84, 'Czech', 'no', 'no', 'cs', '2019-03-25 09:31:30', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (85, 'Swedish', 'no', 'no', 'sv', '2019-03-25 09:44:50', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (86, 'Scottish', 'no', 'no', 'gd', '2019-03-25 09:43:35', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (87, 'Estonian', 'no', 'no', 'et', '2019-03-25 09:34:20', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (88, 'Esperanto', 'no', 'no', 'eo', '2019-03-25 09:34:12', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (89, 'Javanese', 'no', 'no', 'jv', '2019-03-25 09:37:31', '0000-00-00 00:00:00');
INSERT INTO `languages` (`id`, `language`, `is_deleted`, `is_active`, `code`, `created_at`, `updated_at`) VALUES (90, 'Japanese', 'no', 'no', 'ja', '2019-03-25 09:37:20', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: leave_types
#

DROP TABLE IF EXISTS `leave_types`;

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (1, 'Causal Leave', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (2, 'On Duty', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (3, 'Vacation', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (4, 'Medical Leave', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (5, 'Loss of Pay', 'yes');


#
# TABLE STRUCTURE FOR: libarary_members
#

DROP TABLE IF EXISTS `libarary_members`;

CREATE TABLE `libarary_members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `library_card_no` varchar(50) DEFAULT NULL,
  `member_type` varchar(50) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `libarary_members` (`id`, `library_card_no`, `member_type`, `member_id`, `is_active`, `created_at`) VALUES (1, '231231', 'student', 84, 'no', '2019-09-04 12:56:18');
INSERT INTO `libarary_members` (`id`, `library_card_no`, `member_type`, `member_id`, `is_active`, `created_at`) VALUES (2, '332232', 'student', 86, 'no', '2019-09-04 12:56:27');
INSERT INTO `libarary_members` (`id`, `library_card_no`, `member_type`, `member_id`, `is_active`, `created_at`) VALUES (3, '232432', 'student', 85, 'no', '2019-09-04 12:56:35');


#
# TABLE STRUCTURE FOR: meeting
#

DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `meeting_name` varchar(250) NOT NULL,
  `meeting_no` varchar(10) NOT NULL,
  `category_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

INSERT INTO `meeting` (`id`, `meeting_name`, `meeting_no`, `category_id`, `description`, `date`, `attachment`, `created_at`, `updated_at`) VALUES (2, 'dsddddd', 'sdasdddd', 4, 'adasdeee', '2019-09-11', 'uploads/meeting_documents/2.pdf', '2019-10-04 13:45:56', '0000-00-00 00:00:00');
INSERT INTO `meeting` (`id`, `meeting_name`, `meeting_no`, `category_id`, `description`, `date`, `attachment`, `created_at`, `updated_at`) VALUES (3, 'aaa', '121', 3, 'asdfd121212', '2019-09-13', 'uploads/meeting_documents/3.pdf', '2019-09-29 00:08:45', '0000-00-00 00:00:00');
INSERT INTO `meeting` (`id`, `meeting_name`, `meeting_no`, `category_id`, `description`, `date`, `attachment`, `created_at`, `updated_at`) VALUES (6, 'weqe', 'qweqw', 4, 'wqeq', '2019-10-17', NULL, '2019-10-04 13:45:44', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `message` text,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `is_individual` varchar(10) DEFAULT '0',
  `is_class` int(10) NOT NULL DEFAULT '0',
  `group_list` text,
  `user_list` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `messages` (`id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (1, 'Test message', '<p>Test message<br></p>', '1', '0', '0', '1', 0, NULL, '[{\"category\":\"staff\",\"user_id\":\"1\",\"email\":\"pharmagp@gmail.com\",\"mobileno\":\"\"}]', '2019-05-11 00:04:58', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: migrations
#

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: notification_roles
#

DROP TABLE IF EXISTS `notification_roles`;

CREATE TABLE `notification_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_notification_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `send_notification_id` (`send_notification_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `notification_roles_ibfk_1` FOREIGN KEY (`send_notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: notification_setting
#

DROP TABLE IF EXISTS `notification_setting`;

CREATE TABLE `notification_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` varchar(10) DEFAULT '0',
  `is_sms` varchar(10) DEFAULT '0',
  `display_notification` int(11) NOT NULL DEFAULT '0',
  `is_notification` int(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `display_notification`, `is_notification`, `created_at`) VALUES (1, 'student_admission', '1', '0', 0, 0, '2019-04-10 09:27:50');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `display_notification`, `is_notification`, `created_at`) VALUES (2, 'exam_result', '1', '0', 1, 0, '2019-04-10 09:27:50');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `display_notification`, `is_notification`, `created_at`) VALUES (3, 'fee_submission', '1', '0', 1, 0, '2019-04-10 09:27:50');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `display_notification`, `is_notification`, `created_at`) VALUES (4, 'absent_attendence', '1', '0', 1, 0, '2019-04-10 09:27:50');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `display_notification`, `is_notification`, `created_at`) VALUES (5, 'login_credential', '1', '0', 0, 0, '2019-04-10 09:27:50');


#
# TABLE STRUCTURE FOR: payment_settings
#

DROP TABLE IF EXISTS `payment_settings`;

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(200) NOT NULL,
  `api_username` varchar(200) DEFAULT NULL,
  `api_secret_key` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `api_publishable_key` varchar(200) NOT NULL,
  `api_password` varchar(200) DEFAULT NULL,
  `api_signature` varchar(200) DEFAULT NULL,
  `api_email` varchar(200) DEFAULT NULL,
  `paypal_demo` varchar(100) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `payment_settings` (`id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'paypal', '', '', '', '', '', '', NULL, '', '', 'yes', '2018-07-12 00:26:13', '0000-00-00 00:00:00');
INSERT INTO `payment_settings` (`id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'stripe', NULL, '', '', '', NULL, NULL, NULL, '', '', 'no', '2018-07-12 00:26:26', '0000-00-00 00:00:00');
INSERT INTO `payment_settings` (`id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'payu', NULL, '', '', '', NULL, NULL, NULL, '', '', 'no', '2018-07-12 00:26:35', '0000-00-00 00:00:00');
INSERT INTO `payment_settings` (`id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'ccavenue', NULL, '', '', '', NULL, NULL, NULL, '', '', 'no', '2018-07-12 00:26:45', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: payslip_allowance
#

DROP TABLE IF EXISTS `payslip_allowance`;

CREATE TABLE `payslip_allowance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payslip_id` int(11) NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `cal_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: permission_category
#

DROP TABLE IF EXISTS `permission_category`;

CREATE TABLE `permission_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_group_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int(11) DEFAULT '0',
  `enable_add` int(11) DEFAULT '0',
  `enable_edit` int(11) DEFAULT '0',
  `enable_delete` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (1, 1, 'Student', 'student', 1, 1, 1, 1, '2018-06-22 10:47:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 1, 'Import Student', 'import_student', 1, 0, 0, 0, '2018-06-22 10:47:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (3, 1, 'Student Categories', 'student_categories', 1, 1, 1, 1, '2018-06-22 10:47:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (4, 1, 'Student Houses', 'student_houses', 1, 1, 1, 1, '2018-06-22 10:47:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (5, 2, 'Collect Fees', 'collect_fees', 1, 1, 0, 1, '2018-06-22 10:51:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (6, 2, 'Fees Carry Forward', 'fees_carry_forward', 1, 0, 0, 0, '2018-06-27 00:48:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (7, 2, 'Fees Master', 'fees_master', 1, 1, 1, 1, '2018-06-27 00:48:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (8, 2, 'Fees Group', 'fees_group', 1, 1, 1, 1, '2018-06-22 10:51:46');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (9, 3, 'Income', 'income', 1, 1, 1, 1, '2018-06-22 10:53:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2018-06-22 10:52:44');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (11, 3, 'Search Income', 'search_income', 1, 0, 0, 0, '2018-06-22 10:53:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2018-06-22 10:54:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2018-06-22 10:53:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (14, 4, 'Search Expense', 'search_expense', 1, 0, 0, 0, '2018-06-22 10:54:13');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (15, 5, 'Student Attendance', 'student_attendance', 1, 1, 1, 0, '2018-06-22 10:54:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (16, 5, 'Student Attendance Report', 'student_attendance_report', 1, 0, 0, 0, '2018-06-22 10:54:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (17, 6, 'Exam', 'exam', 1, 1, 1, 1, '2018-06-22 10:56:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (19, 6, 'Marks Register', 'marks_register', 1, 1, 1, 0, '2018-06-22 10:56:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (20, 6, 'Marks Grade', 'marks_grade', 1, 1, 1, 1, '2018-06-22 10:55:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (21, 7, 'Class Timetable', 'class_timetable', 1, 1, 1, 0, '2018-06-22 11:01:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (22, 7, 'Assign Subject', 'assign_subject', 1, 1, 1, 1, '2018-06-22 11:01:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (23, 7, 'Subject', 'subject', 1, 1, 1, 1, '2018-06-22 11:02:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (24, 7, 'Class', 'class', 1, 1, 1, 1, '2018-06-22 11:02:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (25, 7, 'Section', 'section', 1, 1, 1, 1, '2018-06-22 11:01:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (26, 7, 'Promote Student', 'promote_student', 1, 0, 0, 0, '2018-06-22 11:02:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1, '2018-06-22 11:03:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (28, 9, 'Books', 'books', 1, 1, 1, 1, '2018-06-22 11:04:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (29, 9, 'Issue Return Student', 'issue_return', 1, 0, 0, 0, '2018-06-22 11:03:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (30, 9, 'Add Staff Member', 'add_staff_member', 1, 0, 0, 0, '2018-07-02 12:07:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (31, 10, 'Issue Item', 'issue_item', 1, 0, 0, 0, '2018-06-22 11:04:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (32, 10, 'Item Stock', 'item_stock', 1, 1, 1, 1, '2018-06-22 11:05:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (33, 10, 'Item', 'item', 1, 1, 1, 1, '2018-06-22 11:05:40');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (34, 10, 'Store', 'store', 1, 1, 1, 1, '2018-06-22 11:06:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (35, 10, 'Supplier', 'supplier', 1, 1, 1, 1, '2018-06-22 11:06:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (37, 11, 'Routes', 'routes', 1, 1, 1, 1, '2018-06-22 11:09:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (38, 11, 'Vehicle', 'vehicle', 1, 1, 1, 1, '2018-06-22 11:09:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (39, 11, 'Assign Vehicle', 'assign_vehicle', 1, 1, 1, 1, '2018-06-27 05:09:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (40, 12, 'Hostel', 'hostel', 1, 1, 1, 1, '2018-06-22 11:10:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (41, 12, 'Room Type', 'room_type', 1, 1, 1, 1, '2018-06-22 11:10:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (42, 12, 'Hostel Rooms', 'hostel_rooms', 1, 1, 1, 1, '2018-06-25 06:53:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2018-06-22 11:11:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (44, 13, 'Email / SMS', 'email_sms', 1, 0, 0, 0, '2018-06-22 11:10:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (46, 13, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-06-22 11:11:23');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (47, 1, 'Student Report', 'student_report', 1, 0, 0, 0, '2018-07-03 11:19:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (48, 14, 'Transaction Report', 'transaction_report', 1, 0, 0, 0, '2018-07-06 12:13:32');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (49, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2018-07-06 12:13:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (53, 15, 'Languages', 'languages', 0, 1, 0, 0, '2018-06-22 11:13:18');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2018-07-05 09:38:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (55, 15, 'Session Setting', 'session_setting', 1, 1, 1, 1, '2018-06-22 11:14:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2018-07-05 09:38:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2018-07-05 09:38:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2018-07-05 09:38:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2018-07-05 09:38:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2018-07-05 09:38:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2018-07-09 04:20:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2018-07-09 04:20:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2018-06-22 11:16:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2018-06-22 11:16:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2018-06-22 11:17:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (66, 16, 'Event', 'event', 1, 1, 1, 1, '2018-06-22 11:17:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (67, 16, 'News', 'notice', 1, 1, 1, 1, '2018-07-03 09:09:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (68, 2, 'Fees Group Assign', 'fees_group_assign', 1, 0, 0, 0, '2018-06-22 10:50:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (69, 2, 'Fees Type', 'fees_type', 1, 1, 1, 1, '2018-06-22 10:49:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (70, 2, 'Fees Discount', 'fees_discount', 1, 1, 1, 1, '2018-06-22 10:50:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (71, 2, 'Fees Discount Assign', 'fees_discount_assign', 1, 0, 0, 0, '2018-06-22 10:50:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (72, 2, 'Fees Statement', 'fees_statement', 1, 0, 0, 0, '2018-06-22 10:48:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (73, 2, 'Search Fees Payment', 'search_fees_payment', 1, 0, 0, 0, '2018-06-22 10:50:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (74, 2, 'Search Due Fees', 'search_due_fees', 1, 0, 0, 0, '2018-06-22 10:50:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (75, 2, 'Balance Fees Report', 'balance_fees_report', 1, 0, 0, 0, '2018-06-22 10:48:50');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (76, 6, 'Exam Schedule', 'exam_schedule', 1, 1, 1, 0, '2018-06-22 10:55:40');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (77, 7, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2018-06-22 11:00:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (78, 17, 'Admission Enquiry', 'admission_enquiry', 1, 1, 1, 1, '2018-06-22 11:21:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (79, 17, 'Follow Up Admission Enquiry', 'follow_up_admission_enquiry', 1, 1, 0, 1, '2018-06-22 11:21:39');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2018-06-22 11:18:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2018-06-22 11:20:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2018-06-22 11:20:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2018-06-22 11:20:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (84, 17, 'Complain', 'complaint', 1, 1, 1, 1, '2018-07-03 09:10:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (85, 17, 'Setup Font Office', 'setup_font_office', 1, 1, 1, 1, '2018-06-22 11:19:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2018-06-22 11:23:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2018-06-22 11:23:12');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2018-06-22 11:23:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (89, 18, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2018-06-22 11:22:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1, '2018-06-22 11:22:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (91, 18, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2018-06-22 11:22:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (93, 19, 'Homework', 'homework', 1, 1, 1, 1, '2018-06-22 11:23:50');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (94, 19, 'Homework Evaluation', 'homework_evaluation', 1, 1, 0, 0, '2018-06-27 03:37:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (95, 19, 'Homework Report', 'homework_report', 1, 0, 0, 0, '2018-06-22 11:23:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (96, 20, 'Student Certificate', 'student_certificate', 1, 1, 1, 1, '2018-07-06 11:11:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (97, 20, 'Generate Certificate', 'generate_certificate', 1, 0, 0, 0, '2018-07-06 11:07:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (98, 20, 'Student ID Card', 'student_id_card', 1, 1, 1, 1, '2018-07-06 11:11:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (99, 20, 'Generate ID Card', 'generate_id_card', 1, 0, 0, 0, '2018-07-06 11:11:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2018-06-22 11:24:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2018-06-22 11:04:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (105, 1, 'Student Parent Login Details', 'student_parent_login_details', 1, 0, 0, 0, '2018-06-22 10:48:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (106, 22, 'Quick Session Change', 'quick_session_change', 1, 0, 0, 0, '2018-06-22 11:24:45');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (107, 1, 'Disable Student', 'disable_student', 1, 0, 0, 0, '2018-06-25 06:51:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (108, 18, 'Approve Leave Request', 'approve_leave_request', 1, 1, 1, 1, '2019-09-23 15:14:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (109, 18, 'Apply Leave', 'apply_leave', 1, 1, 1, 1, '2018-06-26 04:23:32');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1, '2018-07-02 10:47:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (111, 18, 'Department', 'department', 1, 1, 1, 1, '2018-06-26 04:27:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2018-06-26 04:27:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (113, 22, 'Fees Collection And Expense Monthly Chart', 'fees_collection_and_expense_monthly_chart', 1, 0, 0, 0, '2018-07-03 07:38:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (114, 22, 'Fees Collection And Expense Yearly Chart', 'fees_collection_and_expense_yearly_chart', 1, 0, 0, 0, '2018-07-03 07:38:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (115, 22, 'Monthly Fees Collection Widget', 'Monthly fees_collection_widget', 1, 0, 0, 0, '2018-07-03 07:43:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (116, 22, 'Monthly Expense Widget', 'monthly_expense_widget', 1, 0, 0, 0, '2018-07-03 07:43:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (117, 22, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2018-07-03 07:43:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2018-07-03 07:43:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (119, 1, 'Guardian Report', 'guardian_report', 1, 0, 0, 0, '2018-07-03 09:12:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (120, 1, 'Student History', 'student_history', 1, 0, 0, 0, '2018-07-03 09:12:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (121, 1, 'Student Login Credential', 'student_login_credential', 1, 0, 0, 0, '2018-07-03 09:12:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (122, 5, 'Attendance By Date', 'attendance_by_date', 1, 0, 0, 0, '2018-07-03 09:12:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (123, 9, 'Add Student', 'add_student', 1, 0, 0, 0, '2018-07-03 09:12:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (124, 11, 'Student Transport Report', 'student_transport_report', 1, 0, 0, 0, '2018-07-03 09:12:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (125, 12, 'Student Hostel Report', 'student_hostel_report', 1, 0, 0, 0, '2018-07-03 09:12:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (126, 15, 'User Status', 'user_status', 1, 1, 1, 1, '2019-06-25 01:29:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2018-07-03 09:12:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (128, 1, 'Student Timeline', 'student_timeline', 0, 1, 0, 1, '2018-07-05 08:38:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (129, 18, 'Staff Timeline', 'staff_timeline', 0, 1, 0, 1, '2018-07-05 08:38:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2018-07-09 04:47:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2018-07-09 04:47:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (132, 9, 'Journals', 'journals', 1, 1, 1, 1, '2019-06-24 12:26:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (133, 7, 'Batch', 'batch', 1, 1, 1, 1, '2019-08-09 06:40:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (134, 23, 'Add Event', 'add_event', 1, 1, 1, 1, '2019-09-30 08:40:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (135, 23, 'Add Category', 'add_admincategory', 1, 1, 1, 1, '2019-10-04 12:05:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (136, 23, 'Add Meeting', 'add_meeting', 1, 1, 1, 1, '2019-09-30 08:40:43');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (137, 23, 'Add Document', 'admin_document', 1, 1, 1, 1, '2019-10-04 22:51:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (138, 23, 'Mentor List', 'mentor_list', 1, 1, 1, 1, '2019-10-09 07:04:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (139, 9, 'e-Resources', 'e_resources', 1, 1, 1, 1, '2019-10-12 00:03:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (140, 18, 'Leisure Staff', 'leisure_staff', 1, 1, 1, 1, '2019-10-20 08:34:49');


#
# TABLE STRUCTURE FOR: permission_group
#

DROP TABLE IF EXISTS `permission_group`;

CREATE TABLE `permission_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int(11) DEFAULT '0',
  `system` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (1, 'Student Information', 'student_information', 1, 1, '2018-06-27 04:09:31');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 'Fees Collection', 'fees_collection', 1, 0, '2018-07-11 03:19:10');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (3, 'Income', 'income', 1, 0, '2018-06-27 01:19:05');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (4, 'Expense', 'expense', 1, 0, '2018-07-04 02:07:33');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (5, 'Student Attendance', 'student_attendance', 1, 0, '2018-07-02 08:18:08');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (6, 'Examination', 'examination', 1, 0, '2018-07-11 03:19:08');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (7, 'Academics', 'academics', 1, 1, '2018-07-02 07:55:43');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (8, 'Download Center', 'download_center', 1, 0, '2018-07-02 08:19:29');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (9, 'Library', 'library', 1, 0, '2019-09-30 13:16:18');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (10, 'Inventory', 'inventory', 1, 0, '2018-06-27 01:18:58');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (11, 'Transport', 'transport', 1, 0, '2018-06-27 08:21:26');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (12, 'Hostel', 'hostel', 1, 0, '2018-07-02 08:19:32');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (13, 'Communicate', 'communicate', 1, 0, '2018-07-02 08:20:00');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (14, 'Reports', 'reports', 1, 1, '2018-06-27 04:10:22');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (15, 'System Settings', 'system_settings', 1, 1, '2018-06-27 04:10:28');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (16, 'Front CMS', 'front_cms', 1, 0, '2018-07-10 05:46:54');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (17, 'Front Office', 'front_office', 1, 0, '2018-06-27 04:15:30');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (18, 'Human Resource', 'human_resource', 1, 1, '2018-06-27 04:11:02');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (19, 'Homework', 'homework', 1, 0, '2018-06-27 01:19:38');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (20, 'Certificate', 'certificate', 1, 0, '2018-06-27 08:21:29');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '2018-06-27 04:12:25');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, '2018-06-27 04:11:17');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (23, 'Administration', 'administration', 1, 0, '2019-10-04 11:27:09');


#
# TABLE STRUCTURE FOR: read_notification
#

DROP TABLE IF EXISTS `read_notification`;

CREATE TABLE `read_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: reference
#

DROP TABLE IF EXISTS `reference`;

CREATE TABLE `reference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: roles
#

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `is_system` int(1) NOT NULL DEFAULT '0',
  `is_superadmin` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (1, 'Admin', NULL, 0, 1, 0, '2018-06-30 10:39:11', '0000-00-00 00:00:00');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (2, 'Teacher', NULL, 0, 1, 0, '2018-06-30 10:39:14', '0000-00-00 00:00:00');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (3, 'Accountant', NULL, 0, 1, 0, '2018-06-30 10:39:17', '0000-00-00 00:00:00');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (4, 'Librarian', NULL, 0, 1, 0, '2018-06-30 10:39:21', '0000-00-00 00:00:00');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (6, 'Receptionist', NULL, 0, 1, 0, '2018-07-02 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (7, 'Super Admin', NULL, 0, 1, 1, '2018-07-11 09:11:29', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: roles_permissions
#

DROP TABLE IF EXISTS `roles_permissions`;

CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perm_cat_id` int(11) DEFAULT NULL,
  `can_view` int(11) DEFAULT NULL,
  `can_add` int(11) DEFAULT NULL,
  `can_edit` int(11) DEFAULT NULL,
  `can_delete` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=646 DEFAULT CHARSET=utf8;

INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (3, 1, 3, 1, 1, 1, 1, '2018-07-06 10:12:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (4, 1, 4, 1, 1, 1, 1, '2018-07-06 10:13:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (6, 1, 5, 1, 1, 0, 1, '2018-07-02 11:49:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (8, 1, 7, 1, 1, 1, 1, '2018-07-06 10:13:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (9, 1, 8, 1, 1, 1, 1, '2018-07-06 10:13:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (10, 1, 17, 1, 1, 1, 1, '2018-07-06 10:18:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (11, 1, 78, 1, 1, 1, 1, '2018-07-03 01:19:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (13, 1, 69, 1, 1, 1, 1, '2018-07-06 10:14:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (14, 1, 70, 1, 1, 1, 1, '2018-07-06 10:14:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (23, 1, 12, 1, 1, 1, 1, '2018-07-06 10:15:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (24, 1, 13, 1, 1, 1, 1, '2018-07-06 10:18:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (26, 1, 15, 1, 1, 1, 0, '2018-07-02 11:54:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (28, 1, 19, 1, 1, 1, 0, '2018-07-02 12:01:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (29, 1, 20, 1, 1, 1, 1, '2018-07-06 10:19:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (30, 1, 76, 1, 1, 1, 0, '2018-07-02 12:01:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (31, 1, 21, 1, 1, 1, 0, '2018-07-02 12:01:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (32, 1, 22, 1, 1, 1, 1, '2018-07-02 12:02:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (33, 1, 23, 1, 1, 1, 1, '2018-07-06 10:20:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (34, 1, 24, 1, 1, 1, 1, '2018-07-06 10:20:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (35, 1, 25, 1, 1, 1, 1, '2018-07-06 10:22:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (37, 1, 77, 1, 1, 1, 1, '2018-07-06 10:19:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (43, 1, 32, 1, 1, 1, 1, '2018-07-06 10:52:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (44, 1, 33, 1, 1, 1, 1, '2018-07-06 10:52:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (45, 1, 34, 1, 1, 1, 1, '2018-07-06 10:53:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (46, 1, 35, 1, 1, 1, 1, '2018-07-06 10:54:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (47, 1, 104, 1, 1, 1, 1, '2018-07-06 10:53:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (48, 1, 37, 1, 1, 1, 1, '2018-07-06 10:55:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (49, 1, 38, 1, 1, 1, 1, '2018-07-09 05:45:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (53, 1, 43, 1, 1, 1, 1, '2018-07-10 10:00:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (58, 1, 52, 1, 1, 0, 1, '2018-07-09 03:49:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (61, 1, 55, 1, 1, 1, 1, '2018-07-02 09:54:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (67, 1, 61, 1, 1, 0, 1, '2018-07-09 06:29:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (68, 1, 62, 1, 1, 0, 1, '2018-07-09 06:29:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (69, 1, 63, 1, 1, 0, 1, '2018-07-09 04:21:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (70, 1, 64, 1, 1, 1, 1, '2018-07-09 03:32:19');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (71, 1, 65, 1, 1, 1, 1, '2018-07-09 03:41:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (72, 1, 66, 1, 1, 1, 1, '2018-07-09 03:43:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (73, 1, 67, 1, 1, 1, 1, '2018-07-09 03:44:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (74, 1, 79, 1, 1, 0, 1, '2018-07-02 12:34:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (75, 1, 80, 1, 1, 1, 1, '2018-07-06 10:11:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (76, 1, 81, 1, 1, 1, 1, '2018-07-06 10:11:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (78, 1, 83, 1, 1, 1, 1, '2018-07-06 10:11:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (79, 1, 84, 1, 1, 1, 1, '2018-07-06 10:11:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (80, 1, 85, 1, 1, 1, 1, '2018-07-12 00:46:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (83, 1, 88, 1, 1, 1, 0, '2018-07-03 12:34:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (87, 1, 92, 1, 1, 1, 1, '2018-06-26 04:03:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (88, 1, 93, 1, 1, 1, 1, '2018-07-09 01:54:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (94, 1, 82, 1, 1, 1, 1, '2018-07-06 10:11:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (120, 1, 39, 1, 1, 1, 1, '2018-07-06 10:56:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (140, 1, 110, 1, 1, 1, 1, '2018-07-06 10:25:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (141, 1, 111, 1, 1, 1, 1, '2018-07-06 10:26:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (142, 1, 112, 1, 1, 1, 1, '2018-07-06 10:26:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (145, 1, 94, 1, 1, 0, 0, '2018-07-09 01:50:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (147, 2, 43, 1, 1, 1, 0, '2019-05-10 23:57:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (148, 2, 44, 1, 0, 0, 0, '2018-06-27 11:47:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (149, 2, 46, 1, 0, 0, 0, '2018-06-28 00:56:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (156, 1, 9, 1, 1, 1, 1, '2018-07-06 10:14:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (157, 1, 10, 1, 1, 1, 1, '2018-07-06 10:15:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (159, 1, 40, 1, 1, 1, 1, '2018-07-09 05:39:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (160, 1, 41, 1, 1, 1, 1, '2018-07-06 10:57:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (161, 1, 42, 1, 1, 1, 1, '2018-07-09 05:43:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (169, 1, 27, 1, 1, 0, 1, '2018-07-02 12:06:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (178, 1, 54, 1, 0, 1, 0, '2018-07-05 09:39:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (179, 1, 56, 1, 0, 1, 0, '2018-07-05 09:39:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (180, 1, 57, 1, 0, 1, 0, '2018-07-05 09:39:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (181, 1, 58, 1, 0, 1, 0, '2018-07-05 09:39:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (182, 1, 59, 1, 0, 1, 0, '2018-07-05 09:39:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (183, 1, 60, 1, 0, 1, 0, '2018-07-05 09:39:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (190, 1, 105, 1, 0, 0, 0, '2018-07-02 11:43:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (193, 1, 6, 1, 0, 0, 0, '2018-07-02 11:49:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (194, 1, 68, 1, 0, 0, 0, '2018-07-02 11:49:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (196, 1, 72, 1, 0, 0, 0, '2018-07-02 11:49:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (197, 1, 73, 1, 0, 0, 0, '2018-07-02 11:49:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (198, 1, 74, 1, 0, 0, 0, '2018-07-02 11:49:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (199, 1, 75, 1, 0, 0, 0, '2018-07-02 11:49:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (201, 1, 14, 1, 0, 0, 0, '2018-07-02 11:52:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (203, 1, 16, 1, 0, 0, 0, '2018-07-02 11:54:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (204, 1, 26, 1, 0, 0, 0, '2018-07-02 12:02:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (206, 1, 29, 1, 0, 0, 0, '2018-07-02 12:13:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (207, 1, 30, 1, 0, 0, 0, '2018-07-02 12:13:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (208, 1, 31, 1, 0, 0, 0, '2018-07-02 12:15:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (215, 1, 50, 1, 0, 0, 0, '2018-07-02 12:34:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (216, 1, 51, 1, 0, 0, 0, '2018-07-02 12:34:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (222, 1, 1, 1, 1, 1, 1, '2018-07-10 10:00:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (225, 1, 108, 1, 1, 1, 1, '2018-07-09 02:47:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (227, 1, 91, 1, 0, 0, 0, '2018-07-03 02:19:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (229, 1, 89, 1, 0, 0, 0, '2018-07-03 02:30:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (230, 10, 53, 0, 1, 0, 0, '2018-07-03 04:22:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (231, 10, 54, 0, 0, 1, 0, '2018-07-03 04:22:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (232, 10, 55, 1, 1, 1, 1, '2018-07-03 04:28:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (233, 10, 56, 0, 0, 1, 0, '2018-07-03 04:22:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (235, 10, 58, 0, 0, 1, 0, '2018-07-03 04:22:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (236, 10, 59, 0, 0, 1, 0, '2018-07-03 04:22:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (239, 10, 1, 1, 1, 1, 1, '2018-07-03 04:46:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (241, 10, 3, 1, 0, 0, 0, '2018-07-03 04:53:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (242, 10, 2, 1, 0, 0, 0, '2018-07-03 04:54:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (243, 10, 4, 1, 0, 1, 1, '2018-07-03 05:01:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (245, 10, 107, 1, 0, 0, 0, '2018-07-03 05:06:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (246, 10, 5, 1, 1, 0, 1, '2018-07-03 05:08:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (247, 10, 7, 1, 1, 1, 1, '2018-07-03 05:12:07');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (248, 10, 68, 1, 0, 0, 0, '2018-07-03 05:12:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (249, 10, 69, 1, 1, 1, 1, '2018-07-03 05:19:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (250, 10, 70, 1, 0, 0, 1, '2018-07-03 05:22:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (251, 10, 72, 1, 0, 0, 0, '2018-07-03 05:26:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (252, 10, 73, 1, 0, 0, 0, '2018-07-03 05:26:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (253, 10, 74, 1, 0, 0, 0, '2018-07-03 05:28:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (254, 10, 75, 1, 0, 0, 0, '2018-07-03 05:28:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (255, 10, 9, 1, 1, 1, 1, '2018-07-03 05:32:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (256, 10, 10, 1, 1, 1, 1, '2018-07-03 05:33:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (257, 10, 11, 1, 0, 0, 0, '2018-07-03 05:33:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (258, 10, 12, 1, 1, 1, 1, '2018-07-03 05:38:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (259, 10, 13, 1, 1, 1, 1, '2018-07-03 05:38:40');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (260, 10, 14, 1, 0, 0, 0, '2018-07-03 05:38:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (261, 10, 15, 1, 1, 1, 0, '2018-07-03 05:41:28');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (262, 10, 16, 1, 0, 0, 0, '2018-07-03 05:42:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (263, 10, 17, 1, 1, 1, 1, '2018-07-03 05:44:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (264, 10, 19, 1, 1, 1, 0, '2018-07-03 05:45:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (265, 10, 20, 1, 1, 1, 1, '2018-07-03 05:48:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (266, 10, 76, 1, 0, 0, 0, '2018-07-03 05:51:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (267, 10, 21, 1, 1, 1, 0, '2018-07-03 05:52:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (268, 10, 22, 1, 1, 1, 1, '2018-07-03 05:55:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (269, 10, 23, 1, 1, 1, 1, '2018-07-03 05:57:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (270, 10, 24, 1, 1, 1, 1, '2018-07-03 05:57:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (271, 10, 25, 1, 1, 1, 1, '2018-07-03 05:57:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (272, 10, 26, 1, 0, 0, 0, '2018-07-03 05:58:25');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (273, 10, 77, 1, 1, 1, 1, '2018-07-03 05:59:57');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (274, 10, 27, 1, 1, 0, 1, '2018-07-03 06:00:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (275, 10, 28, 1, 1, 1, 1, '2018-07-03 06:03:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (276, 10, 29, 1, 0, 0, 0, '2018-07-03 06:04:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (277, 10, 30, 1, 0, 0, 0, '2018-07-03 06:04:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (278, 10, 31, 1, 0, 0, 0, '2018-07-03 06:04:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (279, 10, 32, 1, 1, 1, 1, '2018-07-03 06:05:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (280, 10, 33, 1, 1, 1, 1, '2018-07-03 06:06:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (281, 10, 34, 1, 1, 1, 1, '2018-07-03 06:08:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (282, 10, 35, 1, 1, 1, 1, '2018-07-03 06:08:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (283, 10, 104, 1, 1, 1, 1, '2018-07-03 06:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (284, 10, 37, 1, 1, 1, 1, '2018-07-03 06:12:42');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (285, 10, 38, 1, 1, 1, 1, '2018-07-03 06:13:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (286, 10, 39, 1, 1, 1, 1, '2018-07-03 06:15:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (287, 10, 40, 1, 1, 1, 1, '2018-07-03 06:17:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (288, 10, 41, 1, 1, 1, 1, '2018-07-03 06:18:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (289, 10, 42, 1, 1, 1, 1, '2018-07-03 06:19:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (290, 10, 43, 1, 1, 1, 1, '2018-07-03 06:21:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (291, 10, 44, 1, 0, 0, 0, '2018-07-03 06:22:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (292, 10, 46, 1, 0, 0, 0, '2018-07-03 06:22:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (293, 10, 50, 1, 0, 0, 0, '2018-07-03 06:22:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (294, 10, 51, 1, 0, 0, 0, '2018-07-03 06:22:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (295, 10, 60, 0, 0, 1, 0, '2018-07-03 06:25:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (296, 10, 61, 1, 1, 1, 1, '2018-07-03 06:26:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (297, 10, 62, 1, 1, 1, 1, '2018-07-03 06:28:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (298, 10, 63, 1, 1, 0, 0, '2018-07-03 06:29:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (299, 10, 64, 1, 1, 1, 1, '2018-07-03 06:30:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (300, 10, 65, 1, 1, 1, 1, '2018-07-03 06:32:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (301, 10, 66, 1, 1, 1, 1, '2018-07-03 06:32:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (302, 10, 67, 1, 0, 0, 0, '2018-07-03 06:32:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (303, 10, 78, 1, 1, 1, 1, '2018-07-04 04:40:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (307, 1, 126, 1, 1, 1, 1, '2019-06-25 02:04:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (310, 1, 119, 1, 0, 0, 0, '2018-07-03 10:45:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (311, 1, 120, 1, 0, 0, 0, '2018-07-03 10:45:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (312, 1, 107, 1, 0, 0, 0, '2018-07-03 10:45:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (313, 1, 122, 1, 0, 0, 0, '2018-07-03 10:49:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (315, 1, 123, 1, 0, 0, 0, '2018-07-03 10:57:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (317, 1, 124, 1, 0, 0, 0, '2018-07-03 10:59:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (320, 1, 47, 1, 0, 0, 0, '2018-07-03 11:31:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (321, 1, 121, 1, 0, 0, 0, '2018-07-03 11:31:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (322, 1, 109, 1, 1, 1, 1, '2018-07-03 11:40:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (369, 1, 102, 1, 1, 1, 1, '2018-07-11 12:31:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (372, 10, 79, 1, 1, 0, 0, '2018-07-04 04:40:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (373, 10, 80, 1, 1, 1, 1, '2018-07-04 04:53:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (374, 10, 81, 1, 1, 1, 1, '2018-07-04 04:53:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (375, 10, 82, 1, 1, 1, 1, '2018-07-04 04:56:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (376, 10, 83, 1, 1, 1, 1, '2018-07-04 04:57:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (377, 10, 84, 1, 1, 1, 1, '2018-07-04 05:00:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (378, 10, 85, 1, 1, 1, 1, '2018-07-04 05:02:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (379, 10, 86, 1, 1, 1, 1, '2018-07-04 05:16:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (380, 10, 87, 1, 0, 0, 0, '2018-07-04 05:19:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (381, 10, 88, 1, 1, 1, 0, '2018-07-04 05:21:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (382, 10, 89, 1, 0, 0, 0, '2018-07-04 05:21:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (383, 10, 90, 1, 1, 0, 1, '2018-07-04 05:25:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (384, 10, 91, 1, 0, 0, 0, '2018-07-04 05:25:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (385, 10, 108, 1, 1, 1, 1, '2018-07-04 05:27:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (386, 10, 109, 1, 1, 1, 1, '2018-07-04 05:28:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (387, 10, 110, 1, 1, 1, 1, '2018-07-04 05:32:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (388, 10, 111, 1, 1, 1, 1, '2018-07-04 05:33:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (389, 10, 112, 1, 1, 1, 1, '2018-07-04 05:35:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (390, 10, 127, 1, 0, 0, 0, '2018-07-04 05:35:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (391, 10, 93, 1, 1, 1, 1, '2018-07-04 05:37:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (392, 10, 94, 1, 1, 0, 0, '2018-07-04 05:38:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (394, 10, 95, 1, 0, 0, 0, '2018-07-04 05:38:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (395, 10, 102, 1, 1, 1, 1, '2018-07-04 05:41:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (396, 10, 106, 1, 0, 0, 0, '2018-07-04 05:41:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (397, 10, 113, 1, 0, 0, 0, '2018-07-04 05:42:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (398, 10, 114, 1, 0, 0, 0, '2018-07-04 05:42:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (399, 10, 115, 1, 0, 0, 0, '2018-07-04 05:48:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (400, 10, 116, 1, 0, 0, 0, '2018-07-04 05:48:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (401, 10, 117, 1, 0, 0, 0, '2018-07-04 05:49:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (402, 10, 118, 1, 0, 0, 0, '2018-07-04 05:49:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (411, 1, 2, 1, 0, 0, 0, '2018-07-04 08:46:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (412, 1, 11, 1, 0, 0, 0, '2018-07-04 09:24:05');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (416, 2, 3, 1, 1, 1, 0, '2019-05-10 23:57:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (428, 2, 4, 1, 1, 1, 0, '2019-05-10 23:57:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (432, 1, 128, 0, 1, 0, 1, '2018-07-05 08:39:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (434, 1, 125, 1, 0, 0, 0, '2018-07-06 10:29:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (435, 1, 96, 1, 1, 1, 1, '2018-07-09 01:33:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (437, 1, 98, 1, 1, 1, 1, '2018-07-09 01:44:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (444, 1, 99, 1, 0, 0, 0, '2018-07-06 12:11:22');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (445, 1, 48, 1, 0, 0, 0, '2018-07-06 12:19:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (446, 1, 49, 1, 0, 0, 0, '2018-07-06 12:19:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (448, 1, 71, 1, 0, 0, 0, '2018-07-08 04:17:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (453, 1, 106, 1, 0, 0, 0, '2018-07-09 01:17:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (454, 1, 113, 1, 0, 0, 0, '2018-07-09 01:17:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (455, 1, 114, 1, 0, 0, 0, '2018-07-09 01:17:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (456, 1, 115, 1, 0, 0, 0, '2018-07-09 01:17:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (457, 1, 116, 1, 0, 0, 0, '2018-07-09 01:17:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (458, 1, 117, 1, 0, 0, 0, '2018-07-09 01:17:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (459, 1, 118, 1, 0, 0, 0, '2018-07-09 01:17:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (461, 1, 97, 1, 0, 0, 0, '2018-07-09 01:30:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (462, 1, 95, 1, 0, 0, 0, '2018-07-09 01:48:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (464, 1, 86, 1, 1, 1, 1, '2018-07-09 06:39:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (466, 1, 129, 0, 1, 0, 1, '2018-07-09 02:09:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (467, 1, 87, 1, 0, 0, 0, '2018-07-09 02:11:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (468, 1, 90, 1, 1, 0, 1, '2018-07-09 02:22:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (471, 1, 53, 0, 1, 0, 0, '2018-07-09 03:50:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (474, 1, 130, 1, 1, 0, 1, '2018-07-09 11:26:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (476, 1, 131, 1, 0, 0, 0, '2018-07-09 05:23:32');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (477, 2, 1, 1, 1, 1, 0, '2019-05-10 23:57:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (478, 2, 2, 1, 0, 0, 0, '2018-07-10 07:17:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (479, 2, 47, 1, 0, 0, 0, '2018-07-10 07:17:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (480, 2, 105, 1, 0, 0, 0, '2018-07-10 07:17:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (482, 2, 119, 1, 0, 0, 0, '2018-07-10 07:17:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (483, 2, 120, 1, 0, 0, 0, '2018-07-10 07:17:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (485, 2, 15, 1, 1, 1, 0, '2018-07-10 07:17:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (486, 2, 16, 1, 0, 0, 0, '2018-07-10 07:17:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (487, 2, 122, 1, 0, 0, 0, '2018-07-10 07:17:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (492, 2, 21, 1, 0, 0, 0, '2018-07-12 00:50:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (493, 2, 22, 1, 0, 0, 0, '2018-07-12 00:50:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (494, 2, 23, 1, 0, 0, 0, '2018-07-12 00:50:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (495, 2, 24, 1, 0, 0, 0, '2018-07-12 00:50:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (496, 2, 25, 1, 0, 0, 0, '2018-07-12 00:50:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (498, 2, 77, 1, 0, 0, 0, '2018-07-12 00:50:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (499, 2, 27, 1, 1, 0, 0, '2019-05-10 23:57:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (502, 2, 93, 1, 1, 1, 0, '2019-05-10 23:57:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (503, 2, 94, 1, 1, 0, 0, '2018-07-10 07:17:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (504, 2, 95, 1, 0, 0, 0, '2018-07-10 07:17:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (505, 3, 5, 1, 1, 0, 1, '2018-07-10 07:37:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (506, 3, 6, 1, 0, 0, 0, '2018-07-10 07:37:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (507, 3, 7, 1, 1, 1, 1, '2018-07-10 07:37:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (508, 3, 8, 1, 1, 1, 1, '2018-07-10 07:37:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (509, 3, 68, 1, 0, 0, 0, '2018-07-10 07:37:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (510, 3, 69, 1, 1, 1, 1, '2018-07-10 07:37:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (511, 3, 70, 1, 1, 1, 1, '2018-07-10 07:37:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (512, 3, 71, 1, 0, 0, 0, '2018-07-10 07:37:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (513, 3, 72, 1, 0, 0, 0, '2018-07-10 07:37:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (514, 3, 73, 1, 0, 0, 0, '2018-07-10 07:37:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (515, 3, 74, 1, 0, 0, 0, '2018-07-10 07:37:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (517, 3, 75, 1, 0, 0, 0, '2018-07-10 07:40:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (518, 3, 9, 1, 1, 1, 1, '2018-07-10 07:40:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (519, 3, 10, 1, 1, 1, 1, '2018-07-10 07:40:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (520, 3, 11, 1, 0, 0, 0, '2018-07-10 07:40:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (521, 3, 12, 1, 1, 1, 1, '2018-07-10 07:47:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (522, 3, 13, 1, 1, 1, 1, '2018-07-10 07:47:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (523, 3, 14, 1, 0, 0, 0, '2018-07-10 07:47:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (524, 3, 86, 1, 1, 1, 1, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (525, 3, 87, 1, 0, 0, 0, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (526, 3, 88, 1, 1, 1, 0, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (527, 3, 89, 1, 0, 0, 0, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (528, 3, 90, 1, 1, 0, 1, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (529, 3, 91, 1, 0, 0, 0, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (530, 3, 108, 1, 1, 1, 1, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (531, 3, 109, 1, 1, 1, 1, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (532, 3, 110, 1, 1, 1, 1, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (533, 3, 111, 1, 1, 1, 1, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (534, 3, 112, 1, 1, 1, 1, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (535, 3, 127, 1, 0, 0, 0, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (536, 3, 129, 0, 1, 0, 1, '2018-07-10 07:48:44');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (537, 3, 43, 1, 1, 1, 1, '2018-07-10 07:49:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (538, 3, 44, 1, 0, 0, 0, '2018-07-10 07:49:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (539, 3, 46, 1, 0, 0, 0, '2018-07-10 07:49:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (540, 3, 31, 1, 0, 0, 0, '2018-07-10 07:50:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (541, 3, 32, 1, 1, 1, 1, '2018-07-10 07:50:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (542, 3, 33, 1, 1, 1, 1, '2018-07-10 07:50:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (543, 3, 34, 1, 1, 1, 1, '2018-07-10 07:50:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (544, 3, 35, 1, 1, 1, 1, '2018-07-10 07:50:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (545, 3, 104, 1, 1, 1, 1, '2018-07-10 07:50:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (546, 3, 37, 1, 1, 1, 1, '2018-07-10 07:52:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (547, 3, 38, 1, 1, 1, 1, '2018-07-10 07:52:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (548, 3, 39, 1, 1, 1, 1, '2018-07-10 07:52:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (549, 3, 124, 1, 0, 0, 0, '2018-07-10 07:52:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (553, 6, 78, 1, 1, 1, 1, '2018-07-10 08:02:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (554, 6, 79, 1, 1, 0, 1, '2018-07-10 08:02:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (555, 6, 80, 1, 1, 1, 1, '2018-07-10 08:02:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (556, 6, 81, 1, 1, 1, 1, '2018-07-10 08:02:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (557, 6, 82, 1, 1, 1, 1, '2018-07-10 08:02:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (558, 6, 83, 1, 1, 1, 1, '2018-07-10 08:02:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (559, 6, 84, 1, 1, 1, 1, '2018-07-10 08:02:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (560, 6, 85, 1, 1, 1, 1, '2018-07-10 08:02:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (561, 6, 86, 1, 0, 0, 0, '2018-07-10 08:11:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (574, 6, 43, 1, 1, 1, 1, '2018-07-10 08:05:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (575, 6, 44, 1, 0, 0, 0, '2018-07-10 08:05:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (576, 6, 46, 1, 0, 0, 0, '2018-07-10 08:05:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (578, 6, 102, 1, 1, 1, 1, '2018-07-10 08:20:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (579, 4, 28, 1, 1, 1, 1, '2018-07-10 08:23:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (580, 4, 29, 1, 0, 0, 0, '2018-07-10 08:23:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (581, 4, 30, 1, 0, 0, 0, '2018-07-10 08:23:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (582, 4, 123, 1, 0, 0, 0, '2018-07-10 08:23:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (583, 4, 86, 1, 0, 0, 0, '2018-07-10 08:24:13');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (584, 4, 43, 1, 1, 1, 1, '2018-07-10 08:25:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (585, 4, 44, 1, 0, 0, 0, '2018-07-10 08:25:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (586, 4, 46, 1, 0, 0, 0, '2018-07-10 08:25:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (588, 2, 102, 1, 1, 1, 1, '2018-07-12 00:47:45');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (589, 2, 106, 1, 0, 0, 0, '2018-07-10 08:25:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (590, 2, 117, 1, 0, 0, 0, '2018-07-10 08:25:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (591, 3, 40, 1, 1, 1, 1, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (592, 3, 41, 1, 1, 1, 1, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (593, 3, 42, 1, 1, 1, 1, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (594, 3, 125, 1, 0, 0, 0, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (595, 3, 48, 1, 0, 0, 0, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (596, 3, 49, 1, 0, 0, 0, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (597, 3, 102, 1, 1, 1, 1, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (598, 3, 106, 1, 0, 0, 0, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (599, 3, 113, 1, 0, 0, 0, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (600, 3, 114, 1, 0, 0, 0, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (601, 3, 115, 1, 0, 0, 0, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (602, 3, 116, 1, 0, 0, 0, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (603, 3, 117, 1, 0, 0, 0, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (604, 3, 118, 1, 0, 0, 0, '2018-07-10 08:28:12');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (609, 6, 117, 1, 0, 0, 0, '2018-07-10 08:30:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (611, 2, 86, 1, 0, 0, 0, '2018-07-10 08:38:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (612, 1, 44, 1, 0, 0, 0, '2018-07-10 10:00:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (613, 1, 46, 1, 0, 0, 0, '2018-07-10 10:00:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (616, 1, 127, 1, 0, 0, 0, '2018-07-11 03:22:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (617, 2, 17, 1, 1, 1, 0, '2019-05-10 23:57:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (618, 2, 19, 1, 1, 1, 0, '2018-07-11 07:25:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (619, 2, 20, 1, 1, 1, 0, '2019-05-10 23:57:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (620, 2, 76, 1, 1, 1, 0, '2018-07-11 07:25:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (621, 2, 107, 1, 0, 0, 0, '2018-07-11 07:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (622, 2, 121, 1, 0, 0, 0, '2018-07-11 07:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (623, 2, 128, 0, 1, 0, 0, '2019-05-10 23:57:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (625, 1, 28, 1, 1, 1, 1, '2018-07-11 09:57:18');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (626, 6, 1, 1, 0, 0, 0, '2018-07-12 00:53:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (627, 6, 21, 1, 0, 0, 0, '2018-07-12 00:53:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (628, 6, 22, 1, 0, 0, 0, '2018-07-12 00:53:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (629, 6, 23, 1, 0, 0, 0, '2018-07-12 00:53:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (630, 6, 24, 1, 0, 0, 0, '2018-07-12 00:53:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (631, 6, 25, 1, 0, 0, 0, '2018-07-12 00:53:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (632, 6, 77, 1, 0, 0, 0, '2018-07-12 00:53:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (633, 6, 106, 1, 0, 0, 0, '2018-07-12 00:53:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (634, 4, 102, 1, 1, 1, 1, '2018-07-12 00:54:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (635, 4, 106, 1, 0, 0, 0, '2018-07-12 00:54:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (636, 4, 117, 1, 0, 0, 0, '2018-07-12 00:54:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (637, 2, 129, 0, 1, 0, 1, '2019-05-14 22:02:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (638, 1, 132, 1, 1, 1, 1, '2019-06-24 12:40:37');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (639, 1, 133, 1, 1, 1, 1, '2019-08-09 06:46:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (640, 1, 134, 1, 1, 1, 1, '2019-09-23 15:18:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (641, 1, 135, 1, 1, 1, 1, '2019-09-23 15:18:06');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (642, 1, 136, 1, 1, 1, 1, '2019-09-23 15:18:08');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (643, 1, 137, 1, 1, 1, 1, '2019-10-11 23:51:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (644, 1, 138, 1, 1, 1, 1, '2019-10-11 23:51:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (645, 1, 139, 1, 1, 1, 1, '2019-10-11 23:51:53');


#
# TABLE STRUCTURE FOR: room_types
#

DROP TABLE IF EXISTS `room_types`;

CREATE TABLE `room_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_type` varchar(200) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sch_settings
#

DROP TABLE IF EXISTS `sch_settings`;

CREATE TABLE `sch_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text,
  `lang_id` int(11) DEFAULT NULL,
  `dise_code` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `is_rtl` varchar(10) DEFAULT 'disabled',
  `timezone` varchar(30) DEFAULT 'UTC',
  `session_id` int(11) DEFAULT NULL,
  `start_month` varchar(40) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `theme` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cron_secret_key` varchar(100) NOT NULL,
  `fee_due_days` int(3) DEFAULT '0',
  `class_teacher` varchar(100) NOT NULL,
  `mobile_api_url` text NOT NULL,
  `app_primary_color_code` varchar(20) DEFAULT NULL,
  `app_secondary_color_code` varchar(20) DEFAULT NULL,
  `app_logo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lang_id` (`lang_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sch_settings` (`id`, `name`, `email`, `phone`, `address`, `lang_id`, `dise_code`, `date_format`, `currency`, `currency_symbol`, `is_rtl`, `timezone`, `session_id`, `start_month`, `image`, `theme`, `is_active`, `created_at`, `updated_at`, `cron_secret_key`, `fee_due_days`, `class_teacher`, `mobile_api_url`, `app_primary_color_code`, `app_secondary_color_code`, `app_logo`) VALUES (1, 'Santhiram College of Pharmacy', 'srcp07hc@gmail.com', '08514 - 276211', 'NH-18, Kurnool, Nandyal, Andhra Pradesh 518112', 4, 'SRCN', 'd-m-Y', 'INR', '₹', 'disabled', 'Asia/Kolkata', 14, '4', '1.jpg', 'default.jpg', 'no', '2019-05-08 20:30:42', '0000-00-00 00:00:00', '', 60, 'no', '', '#424242', '#eeeeee', '1.png');


#
# TABLE STRUCTURE FOR: school_houses
#

DROP TABLE IF EXISTS `school_houses`;

CREATE TABLE `school_houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_name` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sections
#

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `sections` (`id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'A', 'no', '2019-09-04 14:19:07', '0000-00-00 00:00:00');
INSERT INTO `sections` (`id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'B', 'no', '2019-05-08 23:40:37', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: send_notification
#

DROP TABLE IF EXISTS `send_notification`;

CREATE TABLE `send_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` text,
  `visible_student` varchar(10) NOT NULL DEFAULT 'no',
  `visible_staff` varchar(10) NOT NULL DEFAULT 'no',
  `visible_parent` varchar(10) NOT NULL DEFAULT 'no',
  `created_by` varchar(60) DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sessions
#

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (7, '2016-17', 'no', '2017-04-20 01:42:19', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (11, '2017-18', 'no', '2017-04-20 01:41:37', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (13, '2018-19', 'no', '2016-08-24 14:26:44', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (14, '2019-20', 'no', '2016-08-24 14:26:55', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (15, '2020-21', 'no', '2016-10-01 00:28:08', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (16, '2021-22', 'no', '2016-10-01 00:28:20', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (18, '2022-23', 'no', '2016-10-01 00:29:02', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (19, '2023-24', 'no', '2016-10-01 00:29:10', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (20, '2024-25', 'no', '2016-10-01 00:29:18', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (21, '2025-26', 'no', '2016-10-01 00:30:10', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (22, '2026-27', 'no', '2016-10-01 00:30:18', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (23, '2027-28', 'no', '2016-10-01 00:30:24', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (24, '2028-29', 'no', '2016-10-01 00:30:30', '0000-00-00 00:00:00');
INSERT INTO `sessions` (`id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (25, '2029-30', 'no', '2016-10-01 00:30:37', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: sms_config
#

DROP TABLE IF EXISTS `sms_config`;

CREATE TABLE `sms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `api_id` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `senderid` varchar(100) NOT NULL,
  `contact` text,
  `username` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'disabled',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: source
#

DROP TABLE IF EXISTS `source`;

CREATE TABLE `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: staff
#

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(200) NOT NULL,
  `department` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `work_exp` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `emergency_contact_no` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `account_title` varchar(200) NOT NULL,
  `bank_account_no` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `bank_branch` varchar(100) NOT NULL,
  `payscale` varchar(200) NOT NULL,
  `basic_salary` varchar(200) NOT NULL,
  `epf_no` varchar(200) NOT NULL,
  `contract_type` varchar(100) NOT NULL,
  `shift` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `joining_letter` varchar(200) NOT NULL,
  `resignation_letter` varchar(200) NOT NULL,
  `other_document_name` varchar(200) NOT NULL,
  `other_document_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `verification_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (1, '00', '1', '15', '', '', 'Super Admin', '', '', '', '', '', 'pharmagp@gmail.com', '1978-01-01', '', '0000-00-00', '0000-00-00', '', '', '', '1.JPG', '$2y$10$6BGaLuyDo/FDGFmZlHHjD.hQn9ovZaYFJgLSG.J3usTIopJ.LJq5.', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'resume1.pdf', '', '', 'Other Document', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (2, '01', '1', '3', '', '', 'Dr. C. Madhusudhana Chetty', '', '', '', '', '', 'drcmchetty@gmail.com', '1970-11-12', 'Married', '0000-00-00', '0000-00-00', '', '', '', '2.jpeg', '$2y$10$LKgzv3j9auVbw9pxUaBorOqhm4wb3Z046DEkV/NxuVb0ce2A0B2Yi', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (4, 'SRCP212', '6', '5', 'M.Pharm, Ph.D', '13 YEARS', 'SIVA SANKER REDDY', 'LINGAREDDYGARI', 'L.SAMBA SIVA REDDY', 'L.NIRMALA', '9885697242', '8331069909', 'shiva_s_rl@yahoo.co.in', '1980-12-23', 'Married', '2017-07-03', '0000-00-00', 'H.NO: 55,THIRUMALAGIRI TOWN SHIP, PANYAM-518112', 'H.NO: 55,THIRUMALAGIRI TOWN SHIP, PANYAM-518112', '', '4.jpg', '$2y$10$61Da6zJsBRCB7wOqLT1AxOotyBbdRffx3kDqnfOJTYsCKeVGSIj7y', 'Male', 'SAVINGS ACCOUNT', '37304024752', 'STATE BANK OF INDIA', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', 'resume4.doc', 'joining_letter4.JPG', 'resignation_letter4.JPG', 'Other Document', 'otherdocument4.pdf', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (5, 'SRCP112', '4', '5', 'M.Pharm.,Ph.D', '11 Years', 'DASTAGIRI REDDY', 'Y', 'Y MADDILETIREDDY', 'VENKATALAKSHAMMA', '9703980570', '6305672951', 'dastu1984@gmail.com', '1984-10-04', 'Married', '2017-01-02', '0000-00-00', 'Plot No:39, Tirumala giri township\r\nPanyam, Nandyal, Kurnool Dist', 'Plot No:39, Tirumala giri township\r\nPanyam, Nandyal, Kurnool Dist', '', '', '$2y$10$ampwMZDRJXqbdytfeZ/hMeaOI0vGbd.mHPjOSEBfCf/C0gDFk4df2', 'Male', 'SALARY ACCOUNT', '37314904882', 'STATE BANK OF INDIA', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (6, 'SRCP221', '6', '7', 'M.Pharma Ph.D', '10', 'NDVR', 'SARADHI', 'N PARTHA SARATHI', 'N LAKSHMI DEVI', '9618123118', '8500036061', 'saradhi2u@gmail.com', '1982-08-04', 'Married', '2017-06-10', '0000-00-00', 'H.No: 9-17, Park Road, Near Head Post Office, Nandyal - 518501', 'H.No: 9-17, Park Road, Near Head Post Office, Nandyal - 518501', '', '6.jpg', '$2y$10$Vq.H69GSMA9lG3FQr6ADEOyNDPz8Zt5uO6kAdUy8CoprIEWcZUdEa', 'Male', 'Savings ', '37306333474', 'State bank of India', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', 'uploads/staff_images/resume6.docx', '', '', 'Other Document', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (7, 'SRCP124', '4', '7', 'M.pharmacy', '7.4', 'sampath', 'katakam', 'chalapathi rao', 'lakshmi kumari', '8331819361', '8331819361', 'sampathkatakam@gmail.com', '1985-05-06', 'Single', '2015-11-20', '0000-00-00', 'kota street, athmakur bus stand, nandyal.', 'D.No. 10-76, thummalaputi vari street, kanigiri, prakasam (Dist).', '', '7.jpg', '$2y$10$lxjqBgR/S0ljzlRTmSplj.vGtZ2rF4.H0T5nIvX.cdoeHyqsZ.NOi', 'Male', 'saving accounts', '37313642102', 'state bank of india', 'SBIN0010577', 'RGMCET', '', '', '', 'permanent', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (8, 'SRCP131', '4', '8', 'M.Pharmacy', '4.7 years', 'GOUSIA', 'BEGUM', 'T MAHABOOB BASHA', 'S SOPHIA BEGUM', '9703067599', '9985991881', 'gousia009@gmail.com', '1989-12-02', 'Married', '2014-11-17', '0000-00-00', '19/90A maddigeri street, pattikonda, kurnool dist-518380,A.p', '19/90A maddigeri street, pattikonda, kurnool dist-518380,A.p', '', 'uploads/staff_images/8.JPG', '$2y$10$OpPuHeJdcmN5Defe2/nEzuWWg1VAps.x4KpE1a4XEaA8Zai2aRsU.', 'Female', 'SALARY ACCOUNT', '37320455598', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', 'resume8.docx', '', '', 'Other Document', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (9, 'SRCP226', '5', '7', 'M.Pharma(Pharma chemistry)', '6', 'Venkatramaiah', 'Talari', 'T.Yellappa', 'T.Lakshmidevi', '9030931068', '9030931068', 'venkatraaam@gmail.com', '1987-07-14', 'Married', '2017-10-03', '0000-00-00', 'hno-B/B-190 Bcamp Kurnool', 'hno B/B-190 Bcamp', '', '9.png', '$2y$10$amTCAMkLqVMnkSZw//b98.rL9XZJoUWGbzrUsMELGxQbiC5o5di1e', 'Male', 'Salary account', '37312642352', 'SBI ', 'SBIN0010577', 'RGMcet Nandyal', '', '', '', 'permanent', '', 'Nandyal', 'https://www.facebook.com/venkat.rams.311', '', 'https://www.linkedin.com/in/venkatramaiah-talari-a9a61a22/', '', '', '', '', 'Other Document', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (10, 'SRCP125', '4', '7', 'M pharmacy', '6.5 yrs', 'PAVANKUMAR', 'KROSURI', 'PULLAIAHCHARY', 'PARWATHI', '9441809414', '', 'pavankumarmph@gmail.com', '1988-06-03', 'Married', '2012-11-23', '0000-00-00', 'H.no. 28-1071-A1,Near muncipal elementary school,saibabanagar,nandyal', 'qtr.no.- 732, sdsc shar, sriharikota.', '', 'uploads/staff_images/10.jpg', '$2y$10$M7NnFyjXLV.G8wjx6qt9f./4Zo7vnhhwYUp2rRmMGg2tQ2AQcVqi2', 'Male', 'SALARY ACCOUNT', '37320448966', 'SBI', 'SBIN0010577', 'RGMCET BRANCH', '', '', '', '', '', '', 'pavankumarmph@gmail.com', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (11, 'SRCP135', '4', '8', 'M.PHARMACY(PHARMACEUTICS)', '8 MONTHS', 'sushma', 'priya', 'subbaiah', 'ramanamma', '8500018302', '8500018302', 'sushmapriyasampangi@gmail.com', '1995-03-18', 'Single', '2018-08-31', '0000-00-00', '24/248 A UPSTAIRS NGO\'S COLONY , NANDYAL, KURNOOL (DT)', '24/248 A UPSTAIRS NGO\'S COLONY , NANDYAL, KURNOOL (DT)', '', '', '$2y$10$Wwye1AlmzVJ/XwQkc9nS6eHuvSx.OKgYnw3zGiV5cl.IsCHZ4JEFG', 'Female', 'sampangi sushma priya', '32730823517', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (12, 'SRCP223', '6', '7', 'M.PHARM', '11 YEARS', 'NOOKALA', 'MADANA GOPAL', 'N NAGABHUSHANAM', 'N LAKSHMI DEVI', '9959606497', '', 'madanbangs@gmail.com', '1985-07-10', 'Single', '2014-11-17', '0000-00-00', 'c/o koteswara rao, kota street, nandyal, kurnool dt', 'h no 8-8,indira nagar,dornipadu( post& mandal), kurnool dt', '', 'uploads/staff_images/12.jpeg', '$2y$10$K6nlzdpk490z8WOmbnazAeQWvlbQnBX51vW4jHIDZIPJFVa6N0wOG', 'Male', 'SALARY ACCOUNT', '373296422794', 'SBI', 'SBIN0010577', 'RGMCET BRANCH, NANDYAL', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (13, 'SRCP122', '4', '7', 'M.Pharm Pharmaceutics', '9', 'D. Maheswara', 'Reddy', 'D. Balavenkata Reddy', 'D. Lakshmi devi', '9908068537', '9642712661', 'dagadamahesh@gmail.com', '1985-08-10', 'Married', '2016-06-20', '0000-00-00', 'H.No25/300, danial puram, Sangeeva Nagar gate, nandyal-518501', 'Ramapuram (V), Owk (M), Kurnool Dist-518122', '', 'uploads/staff_images/13.jpg', '$2y$10$WCKmy1b0VF97KOFVePZ8I.rBhaN7K4TSA.0cpzzrw3Bj6p7hc2LFG', 'Male', 'Salary', '30416607181', 'SBI', 'SBIN002770', 'owk', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (14, 'SRCP421', 'select', '7', 'M.PHARM  ', '09 years', 'BARU', 'VENKATARAMANA', 'BARU SIVANNA', 'BARU PARVATHI', '9441760856', '9441760856', 'visitramana@gmail.com', '1986-06-01', 'Married', '2017-07-10', '0000-00-00', 'H-NO 28-1154/A7 SAHIK NAGAR BACK SIDE OF MAZEED NONEPALLI NANADYAL', 'HNO 5-96 KUMMARIDEDDY STREET OWK POST MANDAL KURNOOL DT POATAL PIN 518122', '', '', '$2y$10$Cdo8RbHsSScud5DISr3Pk.TQEWQlxlk02Glfnp63BZUbqY2.TpXzW', 'Male', 'SALARY', '37314912191', 'RGMCET SBI', 'SBIN0010577', 'RGMCET', '', '', '', 'permanent', '', 'NERRAWADA', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (15, 'SRCP536', '10', '8', '', '', 'CHUPPALA', 'RENUKA THEJESHWINI', 'C. SRINIVASULU', 'C. RAJESHWARI', '9440613', '', 'FLAURANCE28@GMAIL.COM', '1993-06-02', '', '2019-01-09', '0000-00-00', '', '', '', '', '$2y$10$vdfVV8d7UVQIgEEtDFU6HO4Jd54z0EmCvch3ALyCGLmeJmceBuYSG', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (16, 'SRCP231', '5', '8', 'M.PHARMACY', '05 YEARS', 'SIMHAM', 'VENU', 'S PULLAIAH', 'S ADILAKSHMI', '9441959049', '9398300540', 'itsmevenu1989@gmail.com', '1989-06-09', 'Married', '2015-01-31', '0000-00-00', 'uppara peta, panyam', '49/50A-87A-3-6A, LAKSHMI NAGAR, KURNOOL', '', 'uploads/staff_images/16.jpg', '$2y$10$Q5bw6edQDTjKVgURwlPC5eoVa3PSUcyKJBJEK8vsnd1rX4Wz/O1um', 'Male', 'SALARY', '37301402333', 'STATE BANK OF INDIA', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (17, 'SRCP422', '7', '7', 'M.Pharmacy', '5 Years', 'Raghupathi', 'Niranjan Kumar', 'R. Siddaiah', 'R. padamavathi', '8125004838', '7032373990', 'niranjan3131@gmail.com', '1987-04-04', 'Married', '2014-04-10', '0000-00-00', '28-1060-6A, Behind Babulreddy Building, Saibaba Nagar, Nandyal, Kurnool dist, A.P. 518501', '51/100-6, Gandhi nagar, Kothapeta, Rayachoty, kadapa dist, A.P. 516269', '', '', '$2y$10$Od/U3TQHhVgDxJxXND0J8e2jbEsjw6AvqWn/XuY17Iag.NplfQMXe', 'Male', 'Salary account', '37320450918', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (18, 'SRCP432', '7', '8', 'M.Pharmacy', '1.5 Years', 'Shaik', 'Parveen', 'S Meeravali', 'S Rasool Bi', '6300640618', '9553662870', 'parveencology@gmail.com', '1989-06-21', 'Married', '2017-11-09', '0000-00-00', 'Noolu millu colony, Panyam, Kurnool Dist, A.P.', '6/39, Anumalaveedu post, Racharla mandal, prakasham dist, A.P. 523368', '', '', '$2y$10$MU55npg1MGvmYA.WZpWGJOqzzsdRs.3m1zVepGzv1N5P.LF0QeQDO', 'Female', 'Salary ', '37343410436', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (19, 'SRCP535', '10', '8', 'M.Pharmacy', '1 year', 'Sarithala', 'Sumiya', 'S. Mahaboob Basha', 'S Shameem', '9160022286', '9703973781', 's.sumiyamehatha908@gmail.com', '1993-06-20', 'Married', '2018-04-03', '0000-00-00', '1-24, vijaya nagar colony, velugodu, a.p', '1-199, Mudigubba, Anantapur, 515511', '', '', '$2y$10$d49vdYN2gRLZOtAxysS8DuBr7jC/aUwZpDDjsQzvh/Te/58rvg9q2', 'Female', 'Salary', '37680578947', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (20, 'SRCP522', '10', '7', 'Pharm.D', '5 Years', 'Chilamakuri', 'Bhargava Reddy', 'C N Venkata Subba Reddy', 'C Kalavathi', '9676736692', '7702815759', 'bhargav.pharma03@gmail.com', '1991-06-01', 'Married', '2017-07-05', '0000-00-00', 'C.o Amarnath, Irrigation department, NGO\'s Colony, Nandyal, Kurnool Dist, A.P', '1-99, main road, Sowderadinna village, Koilakuntla mandal, kurnool dist, A.P.', '', '', '$2y$10$X5o.IbiEaCMqbiXwjT86muZbcVbvXD.ZYfas0f5kd69Zcmlq/Um8e', 'Male', 'Salary', '', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (21, 'SRCP532', '10', '8', 'Pharm.D (P.B)', '2 Years', 'Akkam', 'Sandeep', 'A Jeevarathnam', 'A Jayamma', '9502424837', '9441028745', 'akkamsandeep@gmail.com', '1993-06-05', 'Single', '2018-01-05', '0000-00-00', 'Sankar boys hostal, near Medplus, Sanjeev nagar gate, Nandyal kurnool dist, A.P.', '3/45, Prakasham Palli, Kopparthi, C.K. Dinne, Kadapa, A.P.', '', '', '$2y$10$xOF98n1Hlbrz5zRykxnase4bL8eZvFAxfAZcLmqK3YpvWR7eHJnkS', 'Male', 'Salary', '38234234679', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (22, 'SRCP521', '10', '7', 'M.Pharmacy', '9 Years', 'Veerapu Reddy', 'Ramanarayana Reddy', 'V Pitchi Reddy', 'V Alevelamma', '9000623475', '', 'pharmarams@gmail.com', '1985-07-10', 'Single', '2018-07-02', '0000-00-00', '28/929A2, NGO\'s Colony, Nandyal, Kurnool Dist A.P.', 'Ramakuru village, Rapur Mandal, Nellore Dist, A.P', '', '', '$2y$10$rmI0WTb2E3r4CqnwDnZyLuMZ8yJt2DlT2xTWHXX4h7iBYrEZlutuK', 'Male', 'Salary', '20106152376', 'SBI', 'SBIN0020165', 'Palwancha', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (23, 'SRCP511', '4', '6', 'M.Pharamacy, Ph.D', '20', 'R.E', 'Ugadar', 'R Ethirajulu', 'R Jayamma', '8106869915', '', 'ugandarsrcp@gmail.com', '1968-01-15', 'Married', '2018-09-04', '0000-00-00', '203, Level 2, Block A, AV Heights, JJC Appartments, Station road, Nandyal Kurnool Dist, A.P', '12-108, Javali street, Newpet, palamner, Chittoor dist, A.P', '', '', '$2y$10$zV3lJYyMVDE1fPUUIMFQC.6RY6iEcbr9mrGI3jptnqn.WYampA1dO', 'Male', 'Salary', '', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (24, 'SRCP123', '4', '7', 'M.Pharmacy.,(Ph.D)', '8', 'VIJAYA KUMAR', 'VOLETI', 'NAGESWARA RAO', 'JAYASRI', '9885583630', '9985695355', 'vijay66vvk@gmail.com', '1986-01-23', 'Single', '2017-07-05', '0000-00-00', '4-195, NEAR TO RAMALAYAM, KRANTHI NAGAR,NANDYAL,KURNOOL DISTRICT,ANDHRA PRADESH,PIN:524001', '32-244,VASAVI NAGAR,ADDANKI,PRAKASAM DISTRICT,ANDHRA PRADESH,PIN 523201', '', 'uploads/staff_images/24.jpg', '$2y$10$9hmWVYv2WC2QSWF9jcc5XuiYRV34Bc0RIkwviphHZdaqlZcFaZpYW', 'Male', 'SALARY ACCOUNT', '37329229220', 'STATE BANK OF INDIA', 'SBIN0010577', 'RGMCET', '', '32500', '', 'permanent', '', '', '', '', '', '', '', 'uploads/staff_images/joining_letter24.jpg', '', 'uploads/staff_images/Other Doucment', 'otherdocument24.jpg', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (25, 'SRCP121', '4', '7', 'M.Pharmacy', '11 Years', 'Kota', 'Ravikumar', 'K Narayana', 'K Lakshmidevi', '9704129298', '', 'ravi445@gmail.com', '1979-10-20', 'Married', '2014-01-18', '0000-00-00', '25-205, sanjeev nagar, Nandyal, Kurnool dist, A.P.', '25-205, sanjeev nagar, Nandyal, Kurnool dist, A.P.', '', 'uploads/staff_images/25.jpg', '$2y$10$T7CMR1rBIrUKunf6eRxrmeYOPV0WESXI7wOs81yaQz5xzrgcErTAG', 'Male', 'Salary', '37320457595', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (26, 'SRCP211', '5', '6', 'M.Pharm, Ph.D', '18', 'Sreenivasulu', 'Munna', 'M Shesaiah', 'M Tholasamma', '9505811202', '8074675050', 'sreenivasulu_munna@yahoo.com', '1977-01-03', 'Married', '2017-06-28', '0000-00-00', 'Plat No.407, Erasi apartments, near Nandyal municipal office, Saleem nagar, Nandyal, Kurnool Dist, A.P. ', 'Flat no. G1, Varshitha highlands, sathyam G Nagar, Vaviletipadu, Nellore, A.P.', '', '', '$2y$10$RoDS6eLB4geFnttzGLdqteSpIh3LOmv91GN1GL3g9rSuIc1vcMDQG', 'Male', 'Salary', '37024303084', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (27, 'SRCP233', '5', '8', 'M.Pharmacy', '3 Years', 'Bujunuru', 'Mayuri', 'B Venkateswarlu', 'B Lakshmidevi', '9985018890', '', 'bmayuri99@gmail.com', '1992-05-13', 'Single', '2017-06-19', '0000-00-00', 'B/B 417, B-camp, Kurnool, A.P.', 'B/B 417, B-camp, Kurnool, A.P.', '', '', '$2y$10$g/B.QNl2qk6GCdpWg5ac7e8.1KM4I.YGiwPxLylDX9GBoZt3euHAS', 'Female', 'Salary', '37301404001', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');
INSERT INTO `staff` (`id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`) VALUES (28, 'SRCP321', '8', '7', 'M.Pharmacy', '8.5 Years', 'Nuka', 'Srinivasa Reddy', 'N Tirupal Reddy', 'N Obulamma', '7780449456', '9441137756', 'sreesri.142@gmail.com', '1982-06-13', 'Married', '2018-01-04', '0000-00-00', 'D.No 7-4-38, Balaji street, Allagadda, Kurnool Dist, A.P.', 'D.No 7-4-38, Balaji street, Allagadda, Kurnool Dist, A.P.', '', '', '$2y$10$QhW3JjsObSziXV9KuWi/7uRPluMqTKXPrZo6EbAyd.mPxY.rxp.xK', 'Male', 'Salary', '', 'SBI', 'SBIN0010577', 'RGMCET', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '');


#
# TABLE STRUCTURE FOR: staff_attendance
#

DROP TABLE IF EXISTS `staff_attendance`;

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `staff_attendance_type_id` int(11) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (1, '2019-08-12', 4, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (2, '2019-08-12', 5, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (3, '2019-08-12', 6, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (4, '2019-08-12', 7, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (5, '2019-08-12', 8, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (6, '2019-08-12', 9, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (7, '2019-08-12', 10, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (8, '2019-08-12', 11, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (9, '2019-08-12', 12, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (10, '2019-08-12', 13, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (11, '2019-08-12', 14, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (12, '2019-08-12', 15, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (13, '2019-08-12', 16, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (14, '2019-08-12', 17, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (15, '2019-08-12', 18, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (16, '2019-08-12', 19, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (17, '2019-08-12', 20, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (18, '2019-08-12', 21, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (19, '2019-08-12', 22, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (20, '2019-08-12', 23, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (21, '2019-08-12', 24, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (22, '2019-08-12', 25, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (23, '2019-08-12', 26, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (24, '2019-08-12', 27, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (25, '2019-08-12', 28, 1, '', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (26, '2019-10-13', 2, 1, '', 0, '0000-00-00 00:00:00', 0);


#
# TABLE STRUCTURE FOR: staff_attendance_type
#

DROP TABLE IF EXISTS `staff_attendance_type`;

CREATE TABLE `staff_attendance_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2018-05-06 20:56:16', '0000-00-00 00:00:00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'Holiday', 'H', 'yes', '0000-00-00 00:00:00', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: staff_designation
#

DROP TABLE IF EXISTS `staff_designation`;

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (1, 'Director', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (2, 'Administrative Officer', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (3, 'Principal', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (4, 'Vice Principal', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (5, 'HOD', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (6, 'Professor', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (7, 'Associate Professor', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (8, 'Assistant Professor', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (9, 'Lab Technician', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (10, 'Lab Assistant', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (11, 'Office Assistant', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (12, 'Librarian', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (13, 'Store In charge', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (14, 'Accountant', 'yes');
INSERT INTO `staff_designation` (`id`, `designation`, `is_active`) VALUES (15, 'Web Admin', 'yes');


#
# TABLE STRUCTURE FOR: staff_leave_details
#

DROP TABLE IF EXISTS `staff_leave_details`;

CREATE TABLE `staff_leave_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `alloted_leave` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (1, 1, 1, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (2, 1, 2, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (3, 1, 3, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (4, 1, 4, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (5, 1, 5, '10');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (6, 2, 1, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (7, 2, 2, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (8, 2, 3, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (9, 2, 4, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (10, 2, 5, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (11, 4, 1, '8');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (12, 4, 2, '8');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (13, 4, 3, '8');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (14, 4, 4, '8');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (15, 4, 5, '8');


#
# TABLE STRUCTURE FOR: staff_leave_request
#

DROP TABLE IF EXISTS `staff_leave_request`;

CREATE TABLE `staff_leave_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `substitute_staff_id` int(11) DEFAULT NULL,
  `leave_type_id` int(11) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_days` int(11) NOT NULL,
  `employee_remark` varchar(200) NOT NULL,
  `admin_remark` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_by` varchar(200) NOT NULL,
  `document_file` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (1, 1, 5, 4, '2019-08-10', '2019-08-10', 1, '', '', 'pending', 'Super Admin', '', '1970-01-01');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (2, 2, 5, 5, '2019-08-10', '2019-08-10', 1, '', '', 'approve', 'Super Admin', '', '2019-08-09');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (3, 4, 5, 5, '2019-08-12', '2019-08-12', 1, 'aaa', 'aaa', 'pending', 'Super Admin', 'Cartumo Tasks (2).docx', '2019-08-12');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (4, 2, 5, 5, '2019-08-13', '2019-08-13', 1, 'ss', 'ss', 'pending', 'Super Admin', '', '2019-08-12');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (5, 1, 5, 1, '2019-08-21', '2019-08-22', 2, 'require', '', 'approve', 'Super Admin', 'Cartumo Tasks (2).docx', '2019-08-13');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (6, 1, 5, 1, '2019-08-26', '2019-08-29', 4, 'ddd', 'aaa', 'disapprove', 'Super Admin', 'Cartumo Tasks (2).docx', '2019-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (7, 1, 5, 4, '2019-08-16', '2019-08-17', 2, 'sick', '', 'pending', 'Super Admin', '', '2019-08-12');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (8, 1, 5, 3, '2019-08-24', '2019-08-26', 3, '', '', 'pending', 'Super Admin', '', '2019-08-15');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (9, 1, 5, 3, '2019-08-22', '2019-08-28', 7, 'qq', 'qq', 'approve', 'Super Admin', '', '2019-08-15');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (10, 1, 8, 1, '2019-08-16', '2019-08-16', 1, '', '', 'pending', 'Super Admin', '', '2019-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (11, 2, 8, 2, '2019-09-16', '2019-09-19', 4, '', '', 'pending', 'Super Admin', '', '2019-08-28');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (12, 1, 8, 1, '2019-09-18', '2019-09-19', 2, '', '', 'approve', 'Super Admin', '', '2019-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (13, 1, 2, 2, '2019-08-28', '2019-08-29', 2, '', '', 'approve', 'Super Admin', '', '2019-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (14, 1, 9, 5, '2019-09-16', '2019-09-17', 2, '', '', 'approve', 'Super Admin', '', '2019-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (15, 10, 8, 0, '2019-09-17', '2019-09-18', 2, '', '', 'pending', 'Super Admin', '', '2019-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (16, 18, 9, 0, '2019-08-28', '2019-08-30', 3, '', '', 'approve', 'Super Admin', '', '2019-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (17, 1, 12, 4, '2019-08-21', '2019-08-23', 3, '', '', 'approve', 'Super Admin', '', '2019-08-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (18, 1, 0, 0, '2019-10-01', '2019-10-01', 1, '', '', 'pending', 'Super Admin', '', '2019-09-30');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (19, 4, 5, 0, '2019-10-15', '2019-10-15', 1, '', '', 'pending', 'Super Admin', '', '2019-10-15');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (20, 5, 0, 0, '2019-10-16', '2019-10-16', 1, '', '', 'pending', 'Super Admin', '', '2019-10-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (21, 1, 2, 1, '2019-11-04', '2019-11-15', 12, '', '', 'approve', 'Super Admin', '', '2019-10-16');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (22, 6, 0, 0, '2019-10-16', '2019-10-16', 1, '', '', 'pending', 'Super Admin', '', '2019-10-15');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (23, 14, 0, 0, '2019-10-16', '2019-10-16', 1, '', '', 'pending', 'Super Admin', '', '2019-10-15');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (24, 1, 2, 2, '2019-10-24', '2019-10-25', 2, '', '', 'pending', 'Super Admin', '', '2019-10-15');
INSERT INTO `staff_leave_request` (`id`, `staff_id`, `substitute_staff_id`, `leave_type_id`, `leave_from`, `leave_to`, `leave_days`, `employee_remark`, `admin_remark`, `status`, `applied_by`, `document_file`, `date`) VALUES (25, 4, 5, 1, '2019-10-23', '2019-10-24', 2, '', '', 'pending', 'Super Admin', '', '2019-10-15');


#
# TABLE STRUCTURE FOR: staff_payroll
#

DROP TABLE IF EXISTS `staff_payroll`;

CREATE TABLE `staff_payroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_salary` int(11) NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: staff_payslip
#

DROP TABLE IF EXISTS `staff_payslip`;

CREATE TABLE `staff_payslip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `basic` int(11) NOT NULL,
  `total_allowance` int(11) NOT NULL,
  `total_deduction` int(11) NOT NULL,
  `leave_deduction` int(11) NOT NULL,
  `tax` varchar(200) NOT NULL,
  `net_salary` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `month` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_date` date NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: staff_roles
#

DROP TABLE IF EXISTS `staff_roles`;

CREATE TABLE `staff_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (1, 7, 1, 0, '2019-05-08 19:57:15', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 2, 0, '2019-05-08 21:27:23', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (3, 2, 3, 0, '2019-05-10 23:31:11', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (4, 2, 4, 0, '2019-05-10 23:33:33', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (5, 2, 5, 0, '2019-05-10 23:35:52', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (6, 2, 6, 0, '2019-05-10 23:38:15', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (7, 2, 7, 0, '2019-05-10 23:41:22', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (8, 2, 8, 0, '2019-05-11 00:07:12', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (9, 2, 9, 0, '2019-05-11 00:08:26', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (10, 2, 10, 0, '2019-05-11 00:11:18', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (11, 2, 11, 0, '2019-05-11 00:11:19', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (12, 2, 12, 0, '2019-05-11 00:19:42', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (13, 2, 13, 0, '2019-05-11 00:24:29', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (14, 2, 14, 0, '2019-05-11 00:27:11', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (15, 2, 15, 0, '2019-05-11 00:28:33', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (16, 2, 16, 0, '2019-05-11 00:33:01', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (17, 2, 17, 0, '2019-05-11 02:14:56', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (18, 2, 18, 0, '2019-05-11 02:22:58', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (19, 2, 19, 0, '2019-05-11 04:53:51', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (20, 2, 20, 0, '2019-05-11 04:59:46', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (21, 2, 21, 0, '2019-05-11 05:06:21', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (22, 2, 22, 0, '2019-05-11 05:13:50', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (23, 2, 23, 0, '2019-05-11 05:26:45', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (24, 2, 24, 0, '2019-05-13 03:15:20', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (25, 2, 25, 0, '2019-05-13 03:18:46', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (26, 2, 26, 0, '2019-05-13 03:46:20', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (27, 2, 27, 0, '2019-05-13 03:52:47', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (28, 2, 28, 0, '2019-05-13 03:59:26', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (29, 2, 29, 0, '2019-05-14 03:36:59', '0000-00-00 00:00:00');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (30, 4, 30, 0, '2019-05-16 06:18:35', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: staff_timeline
#

DROP TABLE IF EXISTS `staff_timeline`;

CREATE TABLE `staff_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `staff_timeline` (`id`, `staff_id`, `title`, `timeline_date`, `description`, `document`, `status`, `date`) VALUES (1, 1, 'Website Development', '2019-05-09', 'Website development for Santhiram College of Pharmacy', '1.png', 'yes', '2019-05-09');


#
# TABLE STRUCTURE FOR: student_attendences
#

DROP TABLE IF EXISTS `student_attendences`;

CREATE TABLE `student_attendences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `attendence_type_id` (`attendence_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (13, 84, 1, '2019-09-27', 1, '', 'no', '2019-09-27 13:11:38', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (14, 85, 1, '2019-09-27', 4, '', 'no', '2019-09-27 13:11:38', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (15, 88, 1, '2019-09-27', 4, '', 'no', '2019-09-27 13:11:38', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (16, 91, 1, '2019-09-27', 6, '', 'no', '2019-09-27 13:11:38', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (17, 84, 2, '2019-09-27', 3, '', 'no', '2019-09-27 14:27:04', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (18, 85, 2, '2019-09-27', 3, '', 'no', '2019-09-27 14:27:04', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (19, 88, 2, '2019-09-27', 1, '', 'no', '2019-09-27 14:27:05', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (20, 91, 2, '2019-09-27', 1, '', 'no', '2019-09-27 14:27:05', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (21, 84, 2, '2019-09-28', 3, '', 'no', '2019-09-27 14:27:48', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (22, 85, 2, '2019-09-28', 4, '', 'no', '2019-09-27 14:27:48', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (23, 88, 2, '2019-09-28', 1, '', 'no', '2019-09-27 14:27:48', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (24, 91, 2, '2019-09-28', 1, '', 'no', '2019-09-27 14:27:48', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (25, 84, 1, '2019-09-28', 4, '', 'no', '2019-09-27 14:29:30', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (26, 85, 1, '2019-09-28', 1, '', 'no', '2019-09-27 14:29:30', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (27, 88, 1, '2019-09-28', 1, '', 'no', '2019-09-27 14:29:30', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (28, 91, 1, '2019-09-28', 1, '', 'no', '2019-09-27 14:29:31', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (29, 84, 1, '2019-09-13', 1, '', 'no', '2019-09-27 20:23:50', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (30, 85, 1, '2019-09-13', 1, '', 'no', '2019-09-27 20:23:50', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (31, 88, 1, '2019-09-13', 1, '', 'no', '2019-09-27 20:23:50', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (32, 91, 1, '2019-09-13', 1, '', 'no', '2019-09-27 20:23:50', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (33, 84, 1, '2019-09-15', 5, '', 'no', '2019-09-27 20:24:22', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (34, 85, 1, '2019-09-15', 5, '', 'no', '2019-09-27 20:24:22', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (35, 88, 1, '2019-09-15', 5, '', 'no', '2019-09-27 20:24:22', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (36, 91, 1, '2019-09-15', 5, '', 'no', '2019-09-27 20:24:22', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (37, 84, 1, '2019-09-16', 1, '', 'no', '2019-09-27 20:24:57', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (38, 85, 1, '2019-09-16', 1, '', 'no', '2019-09-27 20:24:57', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (39, 88, 1, '2019-09-16', 1, '', 'no', '2019-09-27 20:24:57', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (40, 91, 1, '2019-09-16', 1, '', 'no', '2019-09-27 20:24:57', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (41, 84, 1, '2019-09-18', 6, '', 'no', '2019-09-27 20:25:37', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (42, 85, 1, '2019-09-18', 1, '', 'no', '2019-09-27 20:25:37', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (43, 88, 1, '2019-09-18', 6, '', 'no', '2019-09-27 20:25:37', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (44, 91, 1, '2019-09-18', 1, '', 'no', '2019-09-27 20:25:37', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (45, 84, 1, '2019-09-29', 5, '', 'no', '2019-09-29 05:43:24', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (46, 85, 1, '2019-09-29', 5, '', 'no', '2019-09-29 05:43:24', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (47, 88, 1, '2019-09-29', 5, '', 'no', '2019-09-29 05:43:24', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (48, 91, 1, '2019-09-29', 5, '', 'no', '2019-09-29 05:43:24', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (49, 84, 1, '2019-10-03', 3, '', 'no', '2019-10-02 21:45:42', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (50, 85, 1, '2019-10-03', 4, '', 'no', '2019-10-02 21:45:42', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (51, 88, 1, '2019-10-03', 1, '', 'no', '2019-10-02 21:45:42', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (52, 91, 1, '2019-10-03', 1, '', 'no', '2019-10-02 21:45:42', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (53, 84, 2, '2019-10-03', 1, '', 'no', '2019-10-02 21:46:55', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (54, 85, 2, '2019-10-03', 1, '', 'no', '2019-10-02 21:46:55', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (55, 88, 2, '2019-10-03', 1, '', 'no', '2019-10-02 21:46:55', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (56, 91, 2, '2019-10-03', 1, '', 'no', '2019-10-02 21:46:55', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (57, 84, 6, '2019-10-03', 1, '', 'no', '2019-10-02 22:27:19', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (58, 85, 6, '2019-10-03', 1, '', 'no', '2019-10-02 22:27:19', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (59, 88, 6, '2019-10-03', 4, '', 'no', '2019-10-02 22:27:19', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (60, 91, 6, '2019-10-03', 1, '', 'no', '2019-10-02 22:27:19', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (61, 84, 2, '2019-10-13', 3, '', 'no', '2019-10-13 13:19:02', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (62, 85, 2, '2019-10-13', 4, '', 'no', '2019-10-13 13:19:02', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (63, 88, 2, '2019-10-13', 1, '', 'no', '2019-10-13 13:19:02', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (64, 91, 2, '2019-10-13', 3, '', 'no', '2019-10-13 13:19:02', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (65, 92, 2, '2019-10-13', 1, '', 'no', '2019-10-13 13:19:02', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (66, 84, 1, '2019-10-17', 3, '', 'no', '2019-10-17 12:57:20', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (67, 85, 1, '2019-10-17', 4, '', 'no', '2019-10-17 12:57:20', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (68, 88, 1, '2019-10-17', 1, '', 'no', '2019-10-17 12:57:20', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (69, 91, 1, '2019-10-17', 1, '', 'no', '2019-10-17 12:57:20', '0000-00-00 00:00:00');
INSERT INTO `student_attendences` (`id`, `student_session_id`, `subject_id`, `date`, `attendence_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (70, 92, 1, '2019-10-17', 1, '', 'no', '2019-10-17 12:57:20', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: student_doc
#

DROP TABLE IF EXISTS `student_doc`;

CREATE TABLE `student_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `doc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `student_doc` (`id`, `student_id`, `title`, `doc`) VALUES (1, 86, '12321', 'favicon_(1).ico');
INSERT INTO `student_doc` (`id`, `student_id`, `title`, `doc`) VALUES (2, 86, '13213', 'logo.jpg');
INSERT INTO `student_doc` (`id`, `student_id`, `title`, `doc`) VALUES (3, 86, '13213124', 'logo-inverse-mobile.png');
INSERT INTO `student_doc` (`id`, `student_id`, `title`, `doc`) VALUES (4, 84, 'qqq', '2_(1).jpg');


#
# TABLE STRUCTURE FOR: student_fees
#

DROP TABLE IF EXISTS `student_fees`;

CREATE TABLE `student_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) DEFAULT NULL,
  `feemaster_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `amount_discount` float(10,2) NOT NULL,
  `amount_fine` float(10,2) NOT NULL DEFAULT '0.00',
  `description` text,
  `date` date DEFAULT '0000-00-00',
  `payment_mode` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: student_fees_deposite
#

DROP TABLE IF EXISTS `student_fees_deposite`;

CREATE TABLE `student_fees_deposite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `amount_detail` text,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `student_fees_master_id` (`student_fees_master_id`),
  KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: student_fees_discounts
#

DROP TABLE IF EXISTS `student_fees_discounts`;

CREATE TABLE `student_fees_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) DEFAULT NULL,
  `fees_discount_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'assigned',
  `payment_id` varchar(50) DEFAULT NULL,
  `description` text,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `fees_discount_id` (`fees_discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: student_fees_master
#

DROP TABLE IF EXISTS `student_fees_master`;

CREATE TABLE `student_fees_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_system` int(1) NOT NULL DEFAULT '0',
  `student_session_id` int(11) DEFAULT NULL,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT '0.00',
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `fee_session_group_id` (`fee_session_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: student_session
#

DROP TABLE IF EXISTS `student_session`;

CREATE TABLE `student_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `batch_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `hostel_room_id` int(11) NOT NULL,
  `vehroute_id` int(10) DEFAULT NULL,
  `transport_fees` float(10,2) NOT NULL DEFAULT '0.00',
  `fees_discount` float(10,2) NOT NULL DEFAULT '0.00',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (5, 14, 5, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (6, 14, 6, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (7, 14, 7, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (8, 14, 8, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (9, 14, 9, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (10, 14, 10, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (11, 14, 11, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (12, 14, 12, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (13, 14, 13, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (14, 14, 14, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (15, 14, 15, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (16, 14, 16, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (17, 14, 17, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (18, 14, 18, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (19, 14, 19, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (20, 14, 20, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (21, 14, 21, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (22, 14, 22, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (23, 14, 23, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (24, 14, 24, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (25, 14, 25, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (26, 14, 26, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (27, 14, 27, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (28, 14, 28, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:04', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (29, 14, 29, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:39:04', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (30, 14, 30, 10, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-05-28 00:42:12', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (31, 14, 31, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:53:59', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (32, 14, 32, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (33, 14, 33, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (34, 14, 34, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (35, 14, 35, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (36, 14, 36, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (37, 14, 37, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (38, 14, 38, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (39, 14, 39, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (40, 14, 40, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (41, 14, 41, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (42, 14, 42, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (43, 14, 43, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (44, 14, 44, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (45, 14, 45, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (46, 14, 46, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (47, 14, 47, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (48, 14, 48, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (49, 14, 49, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (50, 14, 50, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (51, 14, 51, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (52, 14, 52, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (53, 14, 53, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (54, 14, 54, 12, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (55, 14, 55, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (56, 14, 56, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (57, 14, 57, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (58, 14, 58, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (59, 14, 59, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (60, 14, 60, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (61, 14, 61, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (62, 14, 62, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (63, 14, 63, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (64, 14, 64, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (65, 14, 65, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (66, 14, 66, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (67, 14, 67, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (68, 14, 68, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (69, 14, 69, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (70, 14, 70, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (71, 14, 71, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (72, 14, 72, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (73, 14, 73, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (74, 14, 74, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (75, 14, 75, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (76, 14, 76, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (77, 14, 77, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (78, 14, 78, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (79, 14, 79, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (80, 14, 80, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (81, 14, 81, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (82, 14, 82, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (83, 14, 83, 14, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (84, 14, 84, 1, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', '2019-09-10 21:05:41', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (85, 14, 85, 1, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', '2019-09-11 05:32:41', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (86, 14, 86, 1, 1, 2, 0, 0, NULL, '0.00', '0.00', 'no', '2019-09-10 07:31:41', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (87, 14, 87, 2, 1, 0, 0, 0, NULL, '0.00', '0.00', 'no', '2019-09-09 20:58:48', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (88, 14, 88, 1, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', '2019-09-10 07:30:47', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (89, 14, 89, 1, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', '2019-09-09 21:39:40', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (90, 14, 90, 1, 1, 4, 0, 0, NULL, '0.00', '0.00', 'no', '2019-09-10 08:39:48', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (91, 14, 91, 1, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', '2019-09-10 10:54:51', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (92, 14, 92, 1, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', '2019-10-09 08:38:09', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (93, 14, 93, 1, 2, 1, 0, 0, NULL, '0.00', '0.00', 'no', '2019-10-13 22:20:26', '0000-00-00 00:00:00');
INSERT INTO `student_session` (`id`, `session_id`, `student_id`, `class_id`, `section_id`, `batch_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `created_at`, `updated_at`) VALUES (94, 14, 94, 1, 2, 2, 0, 0, NULL, '0.00', '0.00', 'no', '2019-10-13 22:21:03', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: student_sibling
#

DROP TABLE IF EXISTS `student_sibling`;

CREATE TABLE `student_sibling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `sibling_student_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: student_timeline
#

DROP TABLE IF EXISTS `student_timeline`;

CREATE TABLE `student_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: student_transport_fees
#

DROP TABLE IF EXISTS `student_transport_fees`;

CREATE TABLE `student_transport_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `amount_discount` float(10,2) NOT NULL,
  `amount_fine` float(10,2) NOT NULL DEFAULT '0.00',
  `description` text,
  `date` date DEFAULT '0000-00-00',
  `is_active` varchar(255) DEFAULT 'no',
  `payment_mode` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: students
#

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `admission_no` varchar(100) DEFAULT NULL,
  `hall_no` varchar(100) DEFAULT NULL,
  `admission_date` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `rte` varchar(20) NOT NULL DEFAULT 'No',
  `physically_challenged` varchar(20) NOT NULL DEFAULT 'No',
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `cast` varchar(50) NOT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `current_address` text,
  `permanent_address` text,
  `category_id` varchar(100) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `school_house_id` int(11) NOT NULL,
  `blood_group` varchar(200) NOT NULL,
  `vehroute_id` int(11) NOT NULL,
  `hostel_room_id` int(11) NOT NULL,
  `adhar_no` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `mentor` int(11) NOT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `guardian_is` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) NOT NULL,
  `guardian_address` text,
  `guardian_email` varchar(100) NOT NULL,
  `father_pic` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `guardian_pic` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `previous_school` text,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `measurement_date` date NOT NULL,
  `app_key` text,
  `parent_app_key` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `disable_at` date NOT NULL,
  `note` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (5, 10, ' 956/2017', ' 17HC1T0005', ' 19/09/2017', ' DAPPILI ', 'SRINATH REDDY', '', 'No', NULL, ' 9985225892', ' sreenathreddy@gmail.com', NULL, NULL, NULL, ' Hindu', ' OC', ' 25/07/1998', ' Male', ' NEAR SARASWATHI HIGH SCHOOL BETHAMCHERLLA BETHAMCHERLLA KURNOOL AP 518599', ' NEAR SARASWATHI HIGH SCHOOL BETHAMCHERLLA BETHAMCHERLLA KURNOOL AP 518599', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' D SIVA REDDY', ' 9985225892', ' FARMER', ' SESHAMMA', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (6, 12, ' 957/2017', ' 17HC1T0006', ' 30/08/2017', ' DUDEKULA ', 'SIDDA HUSSAINI', '', 'No', NULL, ' 9182673874', ' siddahussain@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 30/04/1999', ' Male', ' GUNDAMPADU GUNDAMPADU GUNDAMPADU NANDYAL KURNOOL AP 518502', ' GUNDAMPADU GUNDAMPADU GUNDAMPADU NANDYAL KURNOOL AP 518502', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' CHINNA HUSSANI', ' 9490885090', ' FARMER', ' HUSENAMMA', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (7, 14, ' 958/2017', ' 17HC1T0007', ' 16/08/2017', ' G ', 'CHANDANA', '', 'No', NULL, ' 9701174012', ' chandanavls@gmail.com', NULL, NULL, NULL, ' Hindu', ' OC', ' 03/03/1999', ' Female', ' 1-173. OC COLONY BEEREPALLI HINDHUPURAM ANANTHAPURAM AP 515212', ' 1-173. OC COLONY BEEREPALLI HINDHUPURAM ANANTHAPURAM AP 515212', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' G SRINIVASA REDDY', ' 9701174012', ' PRIVETE EMPLOYE', ' G LINGAMMA', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (8, 16, ' 959/2017', ' 17HC1T0008', ' 16/08/2017', ' JYOTHI ', 'HARI THEJA', '', 'No', NULL, ' 8340003609', ' haritheja141@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 11/01/1998', ' Male', ' CHITHMAVATHI ROAD PUTTAPARTHI PUTTAPARTHI ANANTHAPURAM AP 515134', ' CHITHMAVATHI ROAD PUTTAPARTHI PUTTAPARTHI ANANTHAPURAM AP 515134', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' J KESHAVA', ' 8985529309', ' BUSINESS', ' J VENKATA LAKSHMI', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (9, 18, ' 960/2017', ' 17HC1T0009', ' 19/08/2017', ' KAMINI ', 'POOJITHA', '', 'No', NULL, ' 9397029712', ' poojithakamini123@gmail.com', NULL, NULL, NULL, ' Hindu', ' OC', ' 03/04/1999', ' Female', ' 26-371-C NEAR RAILWAYSTATION NANDYAL NANDYAL KURNOOL AP 518502', ' 26-371-C NEAR RAILWAYSTATION NANDYAL NANDYAL KURNOOL AP 518502', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' K NAGENDRA', ' 9397029712', ' FARMER', ' MADHAVI', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (10, 20, ' 961/2017', ' 17HC1T0010', ' 19/08/2017', ' KATIKA ', 'SHAHEEN', '', 'No', NULL, '', ' shaheen.katika@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 20/11/1999', ' Female', ' 13-160. POLICE STATION BACK SIDE PANYAM PANYAM KURNOOL AP 518112', ' 13-160. POLICE STATION BACK SIDE PANYAM PANYAM KURNOOL AP 518112', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' K BABU', '', ' COOLI', ' K MAHABOOB BI', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (11, 22, ' 962/2017', ' 17HC1T0011', ' 09/09/2017', ' K ', 'HARITHA', '', 'No', NULL, ' 9550154249', '', NULL, NULL, NULL, ' Hindu', ' VYSYAS', ' 11/09/1998', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' K GOPALA KRISHNA MURTHY', ' 9550154249', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (12, 24, ' 963/2017', ' 17HC1T0012', ' 07/10/2017', ' KURELLA ', 'SAI SHANMUKHA SHARMA', '', 'No', NULL, ' 9110305374', ' Saishanmukha22@gmail.com', NULL, NULL, NULL, ' Hindu', ' OC', ' 22/05/1999', ' Male', ' GUDDIPATIGADDA NANDYAL NANDYAL KURNOOL AP 518501', ' GUDDIPATIGADDA NANDYAL NANDYAL KURNOOL AP 518501', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' SUBBAIAH SHARMA', ' 9490212907', ' PUROHIT', ' VIJAYA LAKSHMI', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (13, 26, ' 964/2017', ' 17HC1T0014', ' 17/08/2017', ' MANDAKALLA ', 'MALIKBASHA', '', 'No', NULL, ' 8886717712', ' Smmalik7070@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 16/07/1998', ' Male', ' VELGODE VELGODE VELGODE VELGODE KURNOOL AP 518533', ' VELGODE VELGODE VELGODE VELGODE KURNOOL AP 518533', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' M MABOOB BASHA', ' 9989883176', ' FARMER', ' M NOORUN', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (14, 28, ' 965/2017', ' 17HC1T0015', ' 19/08/2017', ' MIDDE ', 'SRIVANI', '', 'No', NULL, ' 7702589965', ' shaikmalik786786143@gmail.com', NULL, NULL, NULL, ' Hindu', ' SC', ' 05/12/1999', ' Female', ' 15-847 BHAGATH SINGH NAGAR TADIPATRI TADIPATRI KURNOOL AP 515411', ' 15-847 BHAGATH SINGH NAGAR TADIPATRI TADIPATRI KURNOOL AP 515411', ' SC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' M KULLAYAPPA', ' 7702589965', ' WORKER', ' M LAKSHMI DEVI', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (15, 30, ' 966/2017', ' 17HC1T0016', ' 17/08/2017', ' MUTHUKURI ', 'AREEF', '', 'No', NULL, ' 9182397890', ' sreevanimidde2@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 06/10/1999', ' Male', ' 7-16A SANTH A BAGAR B KOTHAKOTA KOTHAKOTA KURNOOL AP 517370', ' 7-16A SANTH A BAGAR B KOTHAKOTA KOTHAKOTA KURNOOL AP 517370', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' M MABOOB BASHA', ' 9182397890', ' COOLI', ' M MUNNI', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (16, 32, ' 967/2017', ' 17HC1T0017', ' 16/06/2017', ' MUTTOJU ', 'HEMA SUNDARACHARI', '', 'No', NULL, ' 9010794042', ' areef2732@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 08/10/2000', ' Male', ' 1-11A PEDDADAVALAPURAM PEDDADAVALAPURAM BANDIATMAKUR KURNOOL AP 518533', ' 1-11A PEDDADAVALAPURAM PEDDADAVALAPURAM BANDIATMAKUR KURNOOL AP 518533', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' M VEERACHARI', ' 9010794042', ' FARMER', ' M BHAGYA LAKSHMI', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (17, 34, ' 968/2017', ' 17HC1T0018', ' 19/08/2017', ' N ', 'YAMUNA', '', 'No', NULL, ' 9490430585', ' sundarnani123@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 27/03/2000', ' Female', ' AMARAPURAM AMARAPURAM AMARAPURAM AMARAPURAM ANANTAPURAM 515281', ' AMARAPURAM AMARAPURAM AMARAPURAM AMARAPURAM ANANTAPURAM 515281', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' M NIJALINGAPPA', ' 9490430585', ' FARMER', ' T SHARADAMMA', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (18, 36, ' 969/2017', ' 17HC1T0019', ' 25/09/2017', ' NADDIMULA ', 'SHAIK KARISHMA', '', 'No', NULL, ' 9440990517', ' kalaarun097@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 06/09/2000', ' Male', ' 5-74A SANTHA PETA KOILAKUNTLA KOILAKUNTLA KURNOOL AP 518134', ' 5-74A SANTHA PETA KOILAKUNTLA KOILAKUNTLA KURNOOL AP 518134', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' N S MASTHAN VALI', ' 9440990517', '', ' N S HASEEN', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (19, 38, ' 970/2017', ' 17HC1T0020', ' 17/08/2017', ' NALABOTHULA ', 'SAI KAVYA', '', 'No', NULL, ' 8341466908', ' naddimullakarishma9@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 07/04/1996', ' Female', ' 46/181/B2 BUDHARPETA KURNOOL KURNOOL KURNOOL AP 518002', ' 46/181/B2 BUDHARPETA KURNOOL KURNOOL KURNOOL AP 518002', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' N MADHU SUDHAN', ' 8341466908', ' COOLI', ' N SREEDEVI', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (20, 40, ' 971/2017', ' 17HC1T0021', ' 25/09/2017', ' NANDYAL ', 'SHAIK JAWAD HUSSAIN', '', 'No', NULL, ' 9848444999', ' Nandyalajawadhussain001@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 02/11/2000', ' Male', ' 21-40G BALAKONDA HALL NANDYAL NANDYAL KURNOOL AP 518502', ' 21-40G BALAKONDA HALL NANDYAL NANDYAL KURNOOL AP 518502', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' N ABDUL RAJAK', ' 9848444999', ' LAB TECHNICIAN', ' AFSAR BANU', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (21, 42, ' 972/2017', ' 17HC1T0022', ' 08/12/2017', ' POLAMADA ', 'KEERTHI PRIYA', '', 'No', NULL, ' 9849934554', ' nsjhussain999@gmail.com', NULL, NULL, NULL, ' Hindu', ' OC', ' 05/07/2000', ' Female', ' 2-516-1 BALAGI COMPLEX NANDYAL NANDYAL KURNOOL AP 518502', ' 2-516-1 BALAGI COMPLEX NANDYAL NANDYAL KURNOOL AP 518502', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' P VENKATESWARLU', ' 9849934554', ' ELECTRICAL ENGINEER', ' P USHA RANI', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (22, 44, ' 973/2017', ' 17HC1T0023', ' 07/05/2017', ' POTHIREDDY ', 'SUDESHNA', '', 'No', NULL, ' 9959242332', ' keerthi1752@gmail.com', NULL, NULL, NULL, ' Hindu', ' OC', ' 03/07/2000', ' Female', ' 27-53 ANJANEYASWAMI TEMPLE NANDYAL VELGODE KURNOOL AP 518502', ' 27-53 ANJANEYASWAMI TEMPLE NANDYAL VELGODE KURNOOL AP 518502', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' P SRINIVASA REDDY', ' 9959242332', ' FARMER', ' P NAGESWARAMMA', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (23, 46, ' 974/2017', ' 17HC1T0024', ' 26/08/2017', ' SARASWATHI ', 'DIVYA TEJA', '', 'No', NULL, ' 8341839171', ' p.sudeshna123@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 06/08/1999', ' Female', ' 5-1464 SRIRAM NAGAR PRODDATUR PRODDATUR KADAPA AP 516001', ' 5-1464 SRIRAM NAGAR PRODDATUR PRODDATUR KADAPA AP 516001', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' S V SASIDHAR', ' 8341839171', ' CABLE OPERATAR', ' S SWARNALATHA', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (24, 48, ' 975/2017', ' 17HC1T0025', ' 08/12/2017', ' SHAIK ', 'SHAHINA', '', 'No', NULL, ' 9493836634', ' dteja699@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 29/10/1998', ' Female', ' 1-558. NEW BULIDINGS NANDHAVARAM BANAGANAPALLI KURNOOL AP 518124', ' 1-558. NEW BULIDINGS NANDHAVARAM BANAGANAPALLI KURNOOL AP 518124', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' SHAIK KHAJA HUSSAIN', ' 9493836634', ' COOLE', ' SHAIK KHAJABI', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (25, 50, ' 976/2017', ' 17HC1T0026', ' 07/07/2017', ' SHAIK ', 'YASMIN', '', 'No', NULL, ' 9440420270', ' rafimail73@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 18/12/1999', ' Female', ' SUB POST OFFICE NANDYAL NANDYAL KURNOOL AP 518502', ' SUB POST OFFICE NANDYAL NANDYAL KURNOOL AP 518502', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' SHAIK KHASIM BASHA', ' 9440420270', ' BUSINESS', ' SHAIK RUKSANA PARVEEN', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (26, 52, ' 977/2017', ' 17HC1T0027', ' 20/09/2017', ' SOMALA ', 'SAVITHRI', '', 'No', NULL, ' 9493073960', ' shaik.yasmin.r@gmail.com', NULL, NULL, NULL, ' Hindu', ' OC', ' 05/11/1999', ' Female', ' 9-664. RANGANAYAKA STREET PILER PILER CHITHOOR AP 517214', ' 9-664. RANGANAYAKA STREET PILER PILER CHITHOOR AP 517214', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' S PRABHAKAR REDDY', ' 9493073960', ' FARMER', ' S SUJATHA', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (27, 54, ' 978/2017', ' 17HC1T0028', ' 20/09/2017', ' SURISETTY ', 'SAI HARSHINI', '', 'No', NULL, ' 9440385147', ' savithrisomala@gmail.com', NULL, NULL, NULL, ' Hindu', '', ' 12/09/1999', ' Female', ' 2-516-9 BALAJI COMPLEX NANDYAL NANDYAL KURNOOL AP 518501', ' 2-516-9 BALAJI COMPLEX NANDYAL NANDYAL KURNOOL AP 518501', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' S VENKATESHWARLU', ' 9440385147', ' PROFESSOR', ' V PRASUNA', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:03', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (28, 56, ' 979/2017', ' 17HC1T0029', ' 20/09/2017', ' V S L L ', 'NARAYANA REDDY', '', 'No', NULL, ' 7702000446', ' vsllnarayanareddy134@gmail.com', NULL, NULL, NULL, ' Hindu', ' OC', ' 28/09/1999', ' Male', ' 28/777A2 NGOS COLONY NANDYAL NANDYAL KURNOOL AP 518502', ' 28/777A2 NGOS COLONY NANDYAL NANDYAL KURNOOL AP 518502', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' V JAGADESHWAR REDDY', ' 9440293198', ' FARMER', ' V JAYA SSREE', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:04', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (29, 58, ' 980/2017', ' 17HC1T0030', ' 21/06/2017', ' YALLALA ', 'ARAVINDA MANASA', '', 'No', NULL, ' 9985061144', ' vsllnarayanareddy134@gmail.com', NULL, NULL, NULL, ' Hindu', ' OC', ' 18/05/1999', ' Female', ' 76-11-46-13-4-1A KALLUR KALLUR KURNOOL KURNOOL AP 518003', ' 76-11-46-13-4-1A KALLUR KALLUR KURNOOL KURNOOL AP 518003', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' Y JAYA RAMUDU', ' 9985061144', ' LATE', ' GNANA PRASUNAMBA', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:39:04', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (30, 60, ' 981/2017', ' 17HC1T0002', ' 07/05/2017', ' BEKKEM PESARAVAI ', 'VENKATA BHARATH REDDY', '', 'No', NULL, ' 9040509410', ' bharathreddybekkam1089@gmail.com', NULL, NULL, NULL, ' Hindu', ' OC', ' 28/06/1999', ' Male', ' Jan-44 YALLUR YALLUR GOSPADU KURNOOL AP 518501', ' Jan-44 YALLUR YALLUR GOSPADU KURNOOL AP 518501', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' B P VENKATARAMANA REDDY', ' 9040509410', ' FARMER', ' VIJAYALAKSHMI', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-05-28 00:42:12', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (31, 62, ' 1052/2016', ' 16HC1T0001', '10/10/2016', ' AAKULA ', 'NOORJAHAN BEGUM', '', 'No', NULL, '', '', NULL, NULL, NULL, ' Hindu', ' -', ' 14/06/1998', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' A RASOOL', ' 9704098153', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:53:59', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (32, 64, ' 1053/2016', ' 16HC1T0002', '9/10/2016', ' Shaik ', 'Shaeida Begum', '', 'No', NULL, ' 9949078575', '', NULL, NULL, NULL, ' Muslim', ' EBC', ' 30/05/1998', ' Female', '', '', ' EBC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' Shaik mahaboob Basha', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (33, 66, ' 1054/2016', ' 16HC1T0003', '10/10/2016', ' BATHINI ', 'BHARGHAVI', '', 'No', NULL, ' 9440942151', '', NULL, NULL, NULL, ' Hindu', ' -', '', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' VENKATESWARLU', ' 9440942151', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (34, 68, ' 1055/2016', ' 16HC1T0004', '10/10/2016', ' BETHE ', 'MARIAMMA', '', 'No', NULL, ' 9550203802', '', NULL, NULL, NULL, ' Hindu', ' SC', ' 16/06/1997', ' Female', '', '', ' SC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' B OBULESU', ' 9550203802', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (35, 70, ' 1056/2016', ' 16HC1T0005', '10/10/2016', ' CHILAMAKURI ', 'DEEPTHI', '', 'No', NULL, ' 7036625871', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 17/04/1998', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (36, 72, ' 1057/2016', ' 16HC1T0006', '10/10/2016', ' DASARI ', 'POOJA', '', 'No', NULL, ' 9700249199', '', NULL, NULL, NULL, ' Hindu', ' -', ' 22/03/1998', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (37, 74, ' 1058/2016', ' 16HC1T0007', '10/10/2016', ' GADDAM ', 'DHARANI', '', 'No', NULL, ' 9493326193', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 11/06/1998', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' G TIMMA REDDY', ' 9493326193', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (38, 76, ' 1059/2016', ' 16HC1T0008', '10/10/2016', ' HALAHARVI ', 'RAGA SANDHYA', '', 'No', NULL, ' 7799626220', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 18/05/1999', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' THIPPANNA', ' 7799626220', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (39, 78, ' 1060/2016', ' 16HC1T0009', '9/10/2016', ' ILURU ', 'UMADEVI', '', 'No', NULL, ' 9441690630', '', NULL, NULL, NULL, ' Hindu', ' -', ' 07/09/1999', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' I RAMAKRISHNA', ' 9441690635', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (40, 80, ' 1061/2016', ' 16HC1T0010', '9/10/2016', ' KANAJANAHALLI ', 'SAMYUKTHA', '', 'No', NULL, '', '', NULL, NULL, NULL, ' Hindu', ' -', ' 16/06/1999', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' A MANTHESHULU', ' 9849423472', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (41, 82, ' 1062/2016', ' 16HC1T0011', '9/10/2016', ' KANALA ', 'MABICHAN', '', 'No', NULL, ' 9866420709', '', NULL, NULL, NULL, ' Hindu', ' -', ' 28/01/1996', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' K BIKARISAHEB', ' 9866420709', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (42, 84, ' 1063/2016', ' 16HC1T0012', '10/10/2016', ' KOTHAPETA ', 'MALLIKARJUNA', '', 'No', NULL, ' 9553766267', '', NULL, NULL, NULL, ' Hindu', ' -', ' 01/11/1998', ' Male', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' K RAMAANJANEYULU', ' 9553766267', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (43, 86, ' 1064/2016', ' 16HC1T0013', '10/10/2016', ' MALLU ', 'KEERTHANA', '', 'No', NULL, ' 9989954278', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 08/10/1999', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' M SRINIVASA REDDY', ' 9989941278', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (44, 88, ' 1065/2016', ' 16HC1T0016', '10/10/2016', ' NANDAVARAM ', 'RAMU', '', 'No', NULL, ' 9959393754', '', NULL, NULL, NULL, ' Hindu', ' -', ' 30/06/1998', ' Male', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' M SREERAMULU', ' 9959393754', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (45, 90, ' 1066/2016', ' 16HC1T0017', '10/10/2016', ' NANDINI PANDEY', '', '', 'No', NULL, ' 9491514516', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 08/11/1999', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' BAMBAM PANDEY', ' 9491514516', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (46, 92, ' 1067/2016', ' 16HC1T0018', '10/10/2016', ' NANDIVELUGU ', 'YAMINI SAROJINI', '', 'No', NULL, ' 9959319820', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 25/05/1999', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' N DURGA PRASAD', ' 9959319820', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (47, 94, ' 1068/2016', ' 16HC1T0019', '10/10/2016', ' NAYAKANTI ', 'HIMA BINDU', '', 'No', NULL, '', '', NULL, NULL, NULL, ' Hindu', ' SC', ' 13/08/1998', ' Female', '', '', ' SC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' N GANGA MAHESHWAR RAO', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (48, 96, ' 1069/2016', ' 16HC1T0020', '9/10/2016', ' PANNERU ', 'CHANDANA PRIYA', '', 'No', NULL, ' 8142026544', '', NULL, NULL, NULL, ' Hindu', ' -', ' 02/02/1998', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' P DHANUNJAYA chari0', ' 8142026544', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (49, 98, ' 1070/2016', ' 16HC1T0021', '9/10/2016', ' PEETLA ', 'DHANALAKSHMI', '', 'No', NULL, ' 8008906302', '', NULL, NULL, NULL, ' Hindu', ' -', ' 21/12/1997', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' SUDJAKAR', ' 8008906302', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (50, 100, ' 1071/2016', ' 16HC1T0022', '9/10/2016', ' POBBATHI ', 'MANASA', '', 'No', NULL, '', '', NULL, NULL, NULL, ' Hindu', ' SC', ' 19/09/1997', ' Female', '', '', ' SC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' JAYA MOHAN', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (51, 102, ' 1072/2016', ' 16HC1T0023', '9/10/2016', ' SHAIK ', 'MAHAMMAD ABBAS', '', 'No', NULL, ' 9052704833', '', NULL, NULL, NULL, ' Hindu', ' -', ' 06/12/1998', ' Male', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' MABHU MASTHAN', ' 9052704833', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (52, 104, ' 1073/2016', ' 16HC1T0024', '9/10/2016', ' THOTA ', 'NANDINI', '', 'No', NULL, '', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 25/05/1999', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' NILAKANTESHWARUDU', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (53, 106, ' 1074/2016', ' 16HC1T0025', '9/10/2016', ' TIRUPAATI ', 'AKHILA SAILA SREE', '', 'No', NULL, ' 9989256364', '', NULL, NULL, NULL, ' Hindu', ' SC', ' 03/02/1997', ' Female', '', '', ' SC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' T SRINIVASULU', ' 9989256364', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (54, 108, ' 1075/2016', ' 16HC1T0026', '9/10/2016', ' VADDU ', 'SARALA', '', 'No', NULL, ' 9989476476', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 07/06/1998', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' V CHANDRA SEKHAR REDDY', ' 9989476476', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 10:54:00', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (55, 110, ' 1051/2013', ' 13HC1T0002', ' 18/10/2013', ' BOGIREDDY BINDU PRIYANKA', '', '', 'No', NULL, ' 9989350289', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 13/09/1994', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' B PRATHAP REDDY', ' 9989350289', ' POLICE', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (56, 112, ' 1052/2013', ' 13HC1T0003', ' 10/05/2013', ' BOYA SREENIVASULU', '', '', 'No', NULL, ' 9573163777', '', NULL, NULL, NULL, ' Hindu', ' -', ' 07/04/1995', ' Male', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' B KOULUTLA', ' 9573163777', ' FARMER', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (57, 114, ' 1053/2013', ' 13HC1T0004', ' 18/10/2013', ' CHEEMALAPENTA ARCHANA', '', '', 'No', NULL, ' 9030567066', '', NULL, NULL, NULL, ' Hindu', ' SC', ' 06/03/1995', ' Female', '', '', ' SC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' JOHN PRASAD RAO', ' 9030567066', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (58, 116, ' 1054/2013', ' 13HC1T0005', ' 10/03/2013', ' DAMAM JYOTHI', '', '', 'No', NULL, ' 9948005412', '', NULL, NULL, NULL, ' Hindu', ' -', ' 06/12/1995', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' KASINATH', ' 9948005412', ' BUSINESS', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (59, 118, ' 1055/2013', ' 13HC1T0006', ' 10/05/2013', ' DASARANNAGARI SIVA SANKAR', '', '', 'No', NULL, ' 8790892586', '', NULL, NULL, NULL, ' Hindu', ' SC', ' 25/05/1995', ' Male', '', '', ' SC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' D YERRA MADHILETY', ' 8790892586', ' COOLI', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (60, 120, ' 1056/2013', ' 13HC1T0007', ' 16/09/2013', ' DEVI PRIYA P', '', '', 'No', NULL, '', '', NULL, NULL, NULL, ' Hindu', ' -', ' 22/02/1995', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' P SUNKANNA', '', ' ADVACATE', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (61, 122, ' 1057/2013', ' 13HC1T0008', ' 10/03/2013', ' DWARAKACHRLA GURUPRASANNA', '', '', 'No', NULL, ' 9491260933', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 08/10/1995', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' D NARAYANA REDDY', ' 9491260933', ' FARMER', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (62, 124, ' 105/2013', ' 13HC1T0009', ' 10/05/2013', ' E ALEKHYA GOUD', '', '', 'No', NULL, ' 9949486475', '', NULL, NULL, NULL, ' Hindu', ' -', ' 04/08/1995', ' Male', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' E SRINIVASA GOUD', ' 9949486475', ' FARMER', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (63, 126, ' 1059/2013', ' 13HC1T0010', ' 10/05/2013', ' SHAIK ALIYA BEGUM', '', '', 'No', NULL, ' 9885975163', '', NULL, NULL, NULL, ' Hindu', ' -', ' 27/08/1996', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' SMD ARSHAD HUSSAIN', ' 9885975963', ' COOLI', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (64, 128, ' 1060/2013', ' 13HC1T0011', ' 10/05/2013', ' GONTUMUKKALA HARISH', '', '', 'No', NULL, ' 8008176252', '', NULL, NULL, NULL, ' Hindu', ' -', ' 04/01/1993', ' Male', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' G VENKATESWARA RAO', ' 8008176252', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (65, 130, ' 1061/2013', ' 13HC1T0012', ' 18/10/2013', ' J SALMA SULTHANA', '', '', 'No', NULL, ' 8019600916', '', NULL, NULL, NULL, ' Hindu', ' -', ' 22/04/1994', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' J NOWSHAD', ' 8019600916', ' DRIVER', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (66, 132, ' 1062/2013', ' 13HC1T0013', ' 10/05/2013', ' KAMANI MOUNIKA', '', '', 'No', NULL, ' 9441690542', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 14/08/1995', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' K RAGHUNATHA REDDY', ' 9441690542', ' CULTIVATION', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (67, 134, ' 1063/2013', ' 13HC1T0014', ' 10/03/2013', ' KANCHI HEMA CHANDRA', '', '', 'No', NULL, ' 9652840596', '', NULL, NULL, NULL, ' Hindu', ' -', ' 29/06/1994', ' Male', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' ESHWARAYYA', ' 9652840596', ' GOVT TEACHER', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (68, 136, ' 1064/2013', ' 13HC1T0015', ' 10/10/2013', ' KOTA SUPRIYA', '', '', 'No', NULL, ' 9440350524', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 06/12/1995', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' K MAHESHWAR REDDY', ' 9440350524', ' FARMER', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (69, 138, ' 1065/2013', ' 13HC1T0016', ' 10/10/2013', ' KOYELAGUNDLA ANJANEYA', '', '', 'No', NULL, ' 9441686377', '', NULL, NULL, NULL, ' Hindu', ' ST', ' 07/03/1995', ' Male', '', '', ' ST', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' K VENKATESHWARLU', ' 9441686377', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (70, 140, ' 1066/2013', ' 13HC1T0017', ' 10/05/2013', ' KUMMARI ANJINEYULU', '', '', 'No', NULL, ' 8978539531', '', NULL, NULL, NULL, ' Hindu', ' -', ' 03/12/1992', ' Male', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' K RANGA RAO', ' 8978539531', ' COOLI', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (71, 142, ' 1067/2013', ' 13HC1T0018', ' 18/10/2013', ' KVC.CH.BRAMHAM', '', '', 'No', NULL, ' 9160275060', '', NULL, NULL, NULL, ' Hindu', ' SC', ' 24/10/1994', ' Male', '', '', ' SC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' K KONDAIAH', ' 9160275060', ' GOVT EMPLOYEE', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (72, 144, ' 1068/2013', ' 13HC1T0019', ' 10/03/2013', ' MALA MUNENDRA', '', '', 'No', NULL, ' 9885862454', '', NULL, NULL, NULL, ' Hindu', ' SC', ' 06/10/1995', ' Male', '', '', ' SC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' M BALAMUNI', ' 9885862454', ' FARMER', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (73, 146, ' 1069/2013', ' 13HC1T0020', ' 10/03/2013', ' MULAKALA VISHNU VARDHAN', '', '', 'No', NULL, ' 8790594601', '', NULL, NULL, NULL, ' Hindu', ' -', ' 06/04/1995', ' Male', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' C VENKATA SUBBAIAH', ' 8790594601', ' COOLI', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (74, 148, ' 1070/2013', ' 13HC1T0021', ' 18/10/2013', ' MULLA FARJANA', '', '', 'No', NULL, ' 9949612811', '', NULL, NULL, NULL, ' Hindu', ' -', ' 24/06/1995', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' M BALAMUNI', ' 9949612811', ' COOLI', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (75, 150, ' 1071/2013', ' 13HC1T0022', ' 10/03/2013', ' NOMULA SWATHI', '', '', 'No', NULL, ' 9948115744', '', NULL, NULL, NULL, ' Hindu', ' SC', ' 20/11/1995', ' Female', '', '', ' SC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' N SRENIVASULU', ' 9948115744', ' FACTORY SUPERVISIOR', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (76, 152, ' 1072/2013', ' 13HC1T0023', ' 10/03/2013', ' PALANENI ANUSHA', '', '', 'No', NULL, ' 9440045434', '', NULL, NULL, NULL, ' Hindu', ' -', ' 21/06/1994', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' P V RAMAJU', ' 9440045434', ' SENIOUR ASST APSPDCL', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (77, 154, ' 1073/2013', ' 13HC1T0024', ' 10/03/2013', ' S NAHIDA', '', '', 'No', NULL, ' 9701191641', '', NULL, NULL, NULL, ' Hindu', ' -', ' 19/01/1994', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' S FAROOQ AHAMED', ' 9701191641', ' PRIVATE EMPLOYE', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (78, 156, ' 1074/2013', ' 13HC1T0025', ' 18/10/2013', ' SHAIK LATHIFA SAMREEN', '', '', 'No', NULL, ' 9391697994', '', NULL, NULL, NULL, ' Hindu', ' -', ' 06/02/1996', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' S SHAJAHAN', ' 9391697994', ' ADVOCATE', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (79, 158, ' 1075/2013', ' 13HC1T0026', ' 18/10/2013', ' SIDDEM PRIYANKA', '', '', 'No', NULL, ' 9704099234', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 06/08/1995', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' S NARAYANA', ' 9704099234', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (80, 160, ' 1076/2013', ' 13HC1T0027', ' 10/04/2013', ' SITAKKAGARI KRUPA', '', '', 'No', NULL, ' 9985496273', '', NULL, NULL, NULL, ' Hindu', ' OC', ' 03/06/1994', ' Female', '', '', ' OC', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' REDDYPPA REDDY', ' 9985496273', ' CHURCH FATHER', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (81, 162, ' 1077/2013', ' 13HC1T0028', ' 09/03/2013', ' TALARI.SAILAJA', '', '', 'No', NULL, ' 9849859557', '', NULL, NULL, NULL, ' Hindu', ' -', ' 21/11/1996', ' Female', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' SRINIVASULU', ' 9849859557', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (82, 164, ' 1078/2013', ' 13HC1T0029', ' 26/09/2013', ' VADITHYA JAGADEESH NAIK', '', '', 'No', NULL, ' 8977442548', '', NULL, NULL, NULL, ' Hindu', ' ST', ' 23/11/1992', ' Male', '', '', ' ST', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' SITHARAM NAIK', ' 8977442548', ' HEAD MESSINGER', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (83, 166, ' 1079/2013', ' 13HC1T0030', ' 25/09/2013', ' VUKKISALA HARI KRISHNA', '', '', 'No', NULL, ' 9908398413', '', NULL, NULL, NULL, ' Hindu', ' -', ' 16/07/1995', ' Male', '', '', ' -', 0, 0, '', 0, 0, '', '', '', '', 0, '', '', ' VENKATA RAMANA', ' 9908398413', ' WEVER', '', '', '', '', '', '', '', '', '', '', '', '', 'yes', '', '', '', '0000-00-00', NULL, NULL, '2019-06-20 11:04:57', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (84, 168, '232', '1231231', '2019-08-29', '111', '333AA', 'No', 'No', 'uploads/student_images/no_image.png', '', '', NULL, NULL, NULL, '', '', '2019-08-13', 'Male', '', '', '1', 0, 0, '', 0, 0, '', '', '', '', 0, '', 'father', '111', '3213231', '', '222', '123131231', '', '111', 'Father', '3213231', '', '', '', '', '', '', 'yes', '', '', '', '2019-08-29', NULL, NULL, '2019-09-10 21:05:41', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (85, 170, '23213', '1231', '2019-08-29', 'dfd', 'dfasdAA', 'No', 'Yes', 'uploads/student_images/no_image.png', '', '', NULL, NULL, NULL, '', '', '2019-08-20', 'Male', '', '', '3', 0, 0, '', 0, 0, '', '', '', '', 0, '', 'father', 'dfd', '21322321', '', 'dasf', '1231231', '', 'dfd', 'Father', '21322321', '', '', '', '', '', '', 'yes', '', '', '', '2019-08-29', NULL, NULL, '2019-09-11 05:32:41', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (86, 172, '1111', '1', '2019-08-29', 'qqq', 'qqqAB', 'Yes', 'Yes', 'uploads/student_images/no_image.png', '2321312', 'demo@example.com', NULL, NULL, NULL, '', '', '2019-08-23', 'Male', '', '', '', 0, 0, '', 0, 0, '123d22312', '1312', '', '', 0, '', 'father', 'fsdf', '13213123132', '', 'dsfsfsd', '1231312321', '', 'fsdf', 'Father', '13213123132', '', '', '', '', '', '', 'yes', '', '', '', '2019-08-29', NULL, NULL, '2019-09-10 21:00:21', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (87, 174, '222', '12132', '2019-09-10', 'iwan', 'osei', 'No', 'No', 'uploads/student_images/no_image.png', '', '', NULL, NULL, NULL, '', '', '2019-09-12', 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', 0, '', 'father', 'famal', '18883994939', '', '', '', '', 'famal', 'Father', '18883994939', '', '', '', '', '', '', 'yes', '', '', '', '2019-09-10', NULL, NULL, '2019-09-09 20:58:49', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (88, 176, '11103', '123456789', '2019-09-10', 'Nick', 'nameAA', 'No', 'No', 'uploads/student_images/no_image.png', '', '', NULL, NULL, NULL, '', '', '2019-09-11', 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', 0, '', 'father', 'fathere', '3213141231', '', '', '', '', 'fathere', 'Father', '3213141231', '', '', '', '', '', '', 'yes', '', '', '', '2019-09-10', NULL, NULL, '2019-09-10 20:57:55', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (89, 178, '23231', '123121231', '2019-09-10', 'dfadfasdf', 'dfasdf', 'No', 'No', 'uploads/student_images/no_image.png', '', '', NULL, NULL, NULL, '', '', '2019-09-04', 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', 0, '', 'father', 'asdfadf', '1232131231', '', '', '', '', 'asdfadf', 'Father', '1232131231', '', '', '', '', '', '', 'no', '', '', '', '2019-09-10', NULL, NULL, '2019-09-10 11:14:22', '0000-00-00 00:00:00', '2019-09-10', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (90, 180, '231', '4343', '2019-09-10', 'fasfaf', 'lastAC', 'No', 'No', 'uploads/student_images/no_image.png', '', '', NULL, NULL, NULL, '', '', '2019-09-04', 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', 0, '', 'father', 'aaa', '', '', '', '', '', 'aaa', 'Father', '324342', '', '', '', '', '', '', 'yes', '', '', '', '2019-09-10', NULL, NULL, '2019-09-10 21:05:08', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (91, 182, '111111', '1111111', '2019-09-10', 'first', 'nameAA', 'No', 'No', NULL, '23123123', '', NULL, NULL, NULL, ' Hindu', '', '1995-05-25', 'Male', '', '', '3', 0, 0, '', 0, 0, '', '', '', '', 0, '', 'father', 'aaa', '121312', '', '', '', '', 'aaa', 'Father', '324342', '', '', '', '', '', '', 'yes', '', '', '', '2019-09-12', NULL, NULL, '2019-09-10 21:02:26', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (92, 184, '3434', '2342342', '2019-10-09', 'ddfd', 'sdfs', 'Yes', 'No', 'uploads/student_images/no_image.png', '1234561230', 'demo@example.com', NULL, NULL, NULL, '', '', '2019-10-15', 'Male', '', '', '2', 0, 0, '', 0, 0, 'fdsf', 'fdds', 'dfs', 'dfs', 16, 'fds', 'father', 'fsdfds', '1234561230', '', '', '', '', 'fsdfds', 'Father', '1234561230', '', '', '', '', '', '', 'yes', '', '', '', '2019-10-09', NULL, NULL, '2019-10-09 08:46:42', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (93, 186, '2313', '131231', '2019-10-14', 'qqqqqq', 'qqqq', 'No', 'No', 'uploads/student_images/no_image.png', '1234567890', 'demo2@example.com', NULL, NULL, NULL, '', '', '2019-10-16', 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', 0, '', 'father', 'ewewew', '1234567890', '', '', '', '', 'ewewew', 'Father', '1234567890', '', '', '', '', '', '', 'yes', '', '', '', '2019-10-14', NULL, NULL, '2019-10-13 22:20:26', '0000-00-00 00:00:00', '0000-00-00', '');
INSERT INTO `students` (`id`, `parent_id`, `admission_no`, `hall_no`, `admission_date`, `firstname`, `lastname`, `rte`, `physically_challenged`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `mentor`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `app_key`, `parent_app_key`, `created_at`, `updated_at`, `disable_at`, `note`) VALUES (94, 188, '232423', '2324323', '2019-10-14', 'rererere', 'ererere', 'No', 'No', 'uploads/student_images/no_image.png', '1234567890', 'demo2@example.com', NULL, NULL, NULL, '', '', '2019-10-23', 'Female', '', '', '', 0, 0, '', 0, 0, '', '', '', '', 0, '', 'father', 'wwerewer', '1234567890', '', '', '', '', 'wwerewer', 'Father', '1234567890', '', '', '', '', '', '', 'yes', '', '', '', '2019-10-14', NULL, NULL, '2019-10-13 22:21:03', '0000-00-00 00:00:00', '0000-00-00', '');


#
# TABLE STRUCTURE FOR: subjects
#

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'Pharmaceutical Engineering', '15R00301', 'Theory', 'no', '2019-05-08 23:54:52', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'Physical Pharmacy –I', '15R00302', 'Theory', 'no', '2019-05-08 23:55:09', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'Pharmaceutical Organic Chemistry – III', '15R00303', 'Theory', 'no', '2019-05-08 23:55:26', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'Pharmaceutical Microbiology', '15R00304', 'Theory', 'no', '2019-05-08 23:55:45', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'Environmental Studies', '15A01101', 'Theory', 'no', '2019-05-08 23:56:10', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (6, 'Pharmaceutical Engineering Lab', '15R00305', 'Practical', 'no', '2019-05-09 00:05:47', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (7, 'Physical Pharmacy –I Lab', '15R00306', 'Practical', 'no', '2019-05-09 00:06:14', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (8, 'Pharmaceutical Organic Chemistry – III Lab', '15R00307', 'Practical', 'no', '2019-05-09 00:06:37', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (9, 'Pharmaceutical Microbiology Lab', '15R00308', 'Practical', 'no', '2019-05-09 00:07:00', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (10, 'Pharmaceutical Analysis – I', '15R00401', 'Theory', 'no', '2019-05-09 00:07:35', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (11, 'Pharmacognosy – II', '15R00402', 'Theory', 'no', '2019-05-09 00:08:15', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (12, 'Pharmaceutical Technology – I', '15R00403', 'Theory', 'no', '2019-05-09 00:08:53', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (13, 'Physical Pharmacy –II', '15R00404', 'Theory', 'no', '2019-05-09 00:09:16', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (14, 'Pathophysiology', '15R00405', 'Theory', 'no', '2019-05-09 00:09:32', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (15, 'Pharmaceutical Analysis – I Lab', '15R00406', 'Practical', 'no', '2019-05-09 00:10:04', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (16, 'Pharmacognosy – II Lab', '15R00407', 'Practical', 'no', '2019-05-09 00:10:29', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (17, 'Pharmaceutical Technology – I Lab', '15R00408', 'Practical', 'no', '2019-05-09 00:11:15', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (18, 'Physical Pharmacy –II Lab', '15R00409', 'Practical', 'no', '2019-05-09 00:26:39', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (19, 'Comprehensive Online Exams-I', '15R00410', 'Practical', 'no', '2019-05-09 00:27:14', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (20, 'Medicinal Chemistry-I', '15R00501', 'Theory', 'no', '2019-05-09 00:27:46', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (21, 'Pharmacology-I', '15R00502', 'Theory', 'no', '2019-05-09 00:28:28', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (22, 'Pharmaceutical Technology-II', '15R00503', 'Theory', 'no', '2019-05-09 00:29:27', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (23, 'Pharmaceutical Biotechnology', '15R00504', 'Theory', 'no', '2019-05-09 00:29:54', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (24, 'MOOCS - I (Application of spectroscopic methods in molecular structure Determination)', '15R00505', 'Theory', 'no', '2019-05-09 00:30:19', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (25, 'Medicinal Chemistry-I Lab', '15R00506', 'Practical', 'no', '2019-05-09 00:30:45', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (26, 'Pharmacology-I Lab', '15R00507', 'Practical', 'no', '2019-05-09 00:31:07', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (27, 'Pharmaceutical Technology-II Lab', '15R00508', 'Practical', 'no', '2019-05-09 00:31:35', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (28, 'Pharmaceutical Biotechnology Lab', '15R00509', 'Practical', 'no', '2019-05-09 00:32:04', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (29, 'Audit course –Social Values & Ethics', '15A99501', 'Practical', 'no', '2019-05-09 00:32:48', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (30, 'Pharmacology-II', '15R00601', 'Theory', 'no', '2019-05-09 00:33:47', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (31, 'Pharmaceutical Analysis-II', '15R00602', 'Theory', 'no', '2019-05-09 00:34:12', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (32, 'Biopharmaceutics & Pharmacokinetics', '15R00603', 'Theory', 'no', '2019-05-09 00:34:38', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (33, 'Pharmaceutical Jurisprudence', '15R00604', 'Theory', 'no', '2019-05-09 00:34:56', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (34, 'CBCC-I Pharmacy Administration', '15R00605', 'Theory', 'no', '2019-05-09 00:35:24', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (35, 'CBCC-I Clinical Trials', '15R00606', 'Theory', 'no', '2019-05-09 00:36:04', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (36, 'CBCC-I Cosmetic Technology', '15R00607', 'Theory', 'no', '2019-05-09 00:36:37', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (37, 'Pharmacology-II Lab', '15R00608', 'Practical', 'no', '2019-05-09 00:36:58', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (38, 'Pharmaceutical Analysis-II Lab', '15R00609', 'Practical', 'no', '2019-05-09 00:37:16', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (39, 'Biopharmaceutics & Pharmacokinetics Lab', '15R00610', 'Practical', 'no', '2019-05-09 00:37:42', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (40, 'Advanced English Language Communication Skills (AELCS) Lab', '15A52602', 'Practical', 'no', '2019-05-09 00:38:15', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (41, 'Comprehensive Online Exam - II', '15R00611', 'Practical', 'no', '2019-05-09 00:38:32', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (42, 'Novel Drug Delivery Systems', '15R00701', 'Theory', 'no', '2019-05-09 00:38:58', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (43, 'Pharmacology -III', '15R00702', 'Theory', 'no', '2019-05-09 00:39:12', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (44, 'Clinical and Hospital Pharmacy', '15R00703', 'Theory', 'no', '2019-05-09 00:39:29', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (45, 'Medicinal Chemistry-II', '15R00704', 'Theory', 'no', '2019-05-09 00:39:43', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (46, 'CBCC-II Chemistry of Natural Products', '15R00705', 'Theory', 'no', '2019-05-09 00:40:00', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (47, 'CBCC-II Computer Aided Drug Design', '15R00706', 'Theory', 'no', '2019-05-09 00:40:21', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (48, 'CBCC-II Pharmacovigilance.', '15R00707', 'Theory', 'no', '2019-05-09 00:42:00', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (49, 'Novel Drug Delivery Systems Lab', '15R00708', 'Practical', 'no', '2019-05-09 00:42:19', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (50, 'Clinical and Hospital Pharmacy Lab', '15R00709', 'Practical', 'no', '2019-05-09 00:42:35', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (51, 'Medicinal Chemistry-II Lab', '15R00710', 'Practical', 'no', '2019-05-09 00:43:52', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (52, 'MOOCS -II (Biostatistics and Design of Experiments)', '15R00801', 'Theory', 'no', '2019-05-09 00:43:22', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (53, 'MOOCS - III ( Intellectual Property Rights)', '15R00802', 'Theory', 'no', '2019-05-09 00:44:31', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (54, 'Comprehensive viva voice', '15R00803', 'Practical', 'no', '2019-05-09 00:44:52', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (55, 'Technical Seminar', '15R00804', 'Practical', 'no', '2019-05-09 00:45:09', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (56, 'Project Work', '15R00805', 'Practical', 'no', '2019-05-09 00:45:33', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (57, 'Human Anatomy and Physiology I', 'BP101T', 'Theory', 'no', '2019-05-09 01:15:50', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (58, 'Pharmaceutical Analysis I', 'BP102T', 'Theory', 'no', '2019-05-09 01:16:06', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (59, 'Pharmaceutics I', 'BP103T', 'Theory', 'no', '2019-05-09 01:16:21', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (60, 'Pharmaceutical Inorganic Chemistry', 'BP104T', 'Theory', 'no', '2019-05-09 01:16:38', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (61, 'Communication skills', 'BP105T', 'Theory', 'no', '2019-05-09 01:16:54', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (62, 'Remedial Biology', 'BP106RBT', 'Theory', 'no', '2019-05-09 01:17:14', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (63, 'Remedial Mathematics', 'BP106RMT', 'Theory', 'no', '2019-05-09 01:17:35', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (64, 'Human Anatomy and Physiology Lab', 'BP107P', 'Practical', 'no', '2019-05-09 01:17:54', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (65, 'Pharmaceutical Analysis I Lab', 'BP108P', 'Practical', 'no', '2019-05-09 01:20:43', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (66, 'Pharmaceutics I Lab', 'BP109P', 'Practical', 'no', '2019-05-09 01:18:37', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (67, 'Pharmaceutical Inorganic Chemistry Lab', 'BP110P', 'Practical', 'no', '2019-05-09 01:18:58', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (68, 'Communication skills Lab', 'BP111P', 'Practical', 'no', '2019-05-09 01:19:21', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (69, 'Remedial Biology Lab', 'BP112RBP', 'Practical', 'no', '2019-05-09 01:19:39', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (70, 'Comprehensive Viva-Voce – I', 'BP113CV', 'Practical', 'no', '2019-05-09 01:20:00', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (71, 'Pharmacotherapeutics- III', '14T00401', 'Theory', 'no', '2019-05-09 01:22:11', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (72, 'Hospital Pharmacy', '14T00402', 'Theory', 'no', '2019-05-09 01:22:26', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (73, 'Clinical Pharmacy', '14T00403', 'Theory', 'no', '2019-05-09 01:22:39', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (74, 'Biostatistics & Research Methodology', '14T00404', 'Theory', 'no', '2019-05-09 01:22:52', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (75, 'BPPK', '14T00405', 'Theory', 'no', '2019-05-09 01:24:07', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (76, 'Clinical Toxicology', '14T00406', 'Theory', 'no', '2019-05-09 01:24:29', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (77, 'Pharmacotherapeutics- III Lab', '14T00407', 'Practical', 'no', '2019-05-09 01:25:02', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (78, 'Hospital Pharmacy Lab', 'Hospital Pharmacy', 'Practical', 'no', '2019-05-09 01:25:32', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (79, 'Clinical Pharmacy Lab', '14T00409', 'Practical', 'no', '2019-05-09 01:26:30', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (80, 'BPPK Lab', '14T00410', 'Practical', 'no', '2019-05-09 01:27:18', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (81, 'Clinical Research', '14T00501', 'Theory', 'no', '2019-05-09 01:27:50', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (82, 'Pharmacoepidemiology and Pharmacoeconomics', '14T00502', 'Theory', 'no', '2019-05-09 01:28:05', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (83, 'Clinical Pharmacokinetics & Therapeutic Drug monitoring', '14T00503', 'Theory', 'no', '2019-05-09 01:28:28', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (84, 'Clerkship', '', 'Practical', 'no', '2019-05-09 01:28:38', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (85, 'Project work (Six Months)', '', 'Practical', 'no', '2019-05-09 01:30:47', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (86, 'Human Anatomy and Physiology', '17T00101', 'Theory', 'no', '2019-05-09 01:31:55', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (87, 'Pharmaceutics', '17T00102', 'Theory', 'no', '2019-05-09 01:32:12', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (88, 'Medicinal Biochemistry', '17T00103', 'Theory', 'no', '2019-05-09 01:32:24', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (89, 'Pharmaceutical Organic Chemistry', '17T00104', 'Theory', 'no', '2019-05-09 01:32:37', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (90, 'Ph Inorganic Chemistry', '17T00105', 'Theory', 'no', '2019-05-09 01:33:23', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (91, 'Remedial Mathematics/Biology', '17T00106', 'Theory', 'no', '2019-05-09 01:33:45', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (92, 'HAP Lab', '17T00107', 'Practical', 'no', '2019-05-09 01:34:54', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (93, 'Pharmaceutics Lab', '17T00108', 'Practical', 'no', '2019-05-09 01:35:13', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (94, 'Medicinal Biochemistry Lab', '17T00109', 'Practical', 'no', '2019-05-09 01:35:37', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (95, 'Pharmaceutical Organic Chemistry Lab', '17T00110', 'Practical', 'no', '2019-05-09 01:35:57', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (96, 'Ph Inorganic Chemistry Lab', '17T00111', 'Practical', 'no', '2019-05-09 01:36:28', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (97, 'Remedial  Biology', '17T00112', 'Practical', 'no', '2019-05-09 01:36:52', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (98, 'Patho physiology', '17T00201', 'Theory', 'no', '2019-05-09 02:03:24', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (99, 'Ph Microbiology', '17T00202', 'Theory', 'no', '2019-05-09 01:38:32', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (100, 'Pharmacognosy & Phytopharmaceuticals', '17T00203', 'Theory', 'no', '2019-05-09 01:38:49', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (101, 'Ph Cology-I', '17T00204', 'Theory', 'no', '2019-05-09 01:39:16', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (102, 'Community Pharmacy', '17T00205', 'Theory', 'no', '2019-05-09 01:39:30', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (103, 'Pharmacotherapeutics-I', '17T00206', 'Theory', 'no', '2019-05-09 01:39:42', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (104, 'Ph Microbiology Lab', '17T00207', 'Practical', 'no', '2019-05-09 01:40:15', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (105, 'Pharmacognosy & Phytopharmaceuticals Lab', '17T00208', 'Practical', 'no', '2019-05-09 01:40:32', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (106, 'Pharmacotherapeutics-I Lab', '17T00209', 'Practical', 'no', '2019-05-09 01:40:47', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (107, 'Ph Cology-II', '17T00301', 'Theory', 'no', '2019-05-09 01:41:11', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (108, 'Ph Analysis', '17T00302', 'Theory', 'no', '2019-05-09 01:41:30', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (109, 'Pharmacotherapeutics-II', '17T00303', 'Theory', 'no', '2019-05-09 01:42:50', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (110, 'Ph Jurisprudence', '17T00304', 'Theory', 'no', '2019-05-09 02:00:14', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (111, 'Medicinal Chemistry', '17T00305', 'Theory', 'no', '2019-05-09 02:00:34', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (112, 'Pharmaceutical Formulations', '17T00306', 'Theory', 'no', '2019-05-09 02:00:55', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (113, 'Ph Cology-II Lab', '17T00307', 'Practical', 'no', '2019-05-09 02:01:27', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (114, 'Ph Analysis Lab', '17T00308', 'Practical', 'no', '2019-05-09 02:01:48', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (115, 'Pharmacotherapeutics-II Lab', '17T00309', 'Practical', 'no', '2019-05-09 02:02:07', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (116, 'Medicinal Chemistry Lab', '17T00310', 'Practical', 'no', '2019-05-09 02:02:26', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (117, 'Pharmaceutical Formulations Lab', '17T00311', 'Practical', 'no', '2019-05-09 02:02:48', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (118, 'Modern Pharmaceutical Analytical Techniques', '17S01101', 'Theory', 'no', '2019-05-09 02:04:03', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (119, 'Advanced Pharmaceutical Analysis', '17S07101', 'Theory', 'no', '2019-05-09 02:04:15', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (120, 'Pharmaceutical Validation', '17S07102', 'Theory', 'no', '2019-05-09 02:04:39', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (121, 'Food Analysis', '17S07103', 'Theory', 'no', '2019-05-09 02:05:10', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (122, 'Pharmaceutical Analysis Practicals', '17S07104', 'Practical', 'no', '2019-05-09 02:05:33', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (123, 'Food Analysis Practical - I', '17S07105', 'Practical', 'no', '2019-05-09 02:05:50', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (124, 'Seminar/Assignment', '17S07106', 'Practical', 'no', '2019-05-09 02:06:03', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (125, 'Advanced Instrumental Analysis', '17S07201', 'Theory', 'no', '2019-05-09 02:07:11', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (126, 'Modern Bio-Analytical Techniques', '17S07202', 'Theory', 'no', '2019-05-09 02:07:23', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (127, 'Quality Control And Quality Assurance', '17S07203', 'Theory', 'no', '2019-05-09 02:07:39', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (128, 'Herbal and Cosmetic Analysis', '17S07204', 'Theory', 'no', '2019-05-09 02:09:48', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (129, 'Pharmaceutical Analysis Practical II', '17S07205', 'Practical', 'no', '2019-05-09 02:10:06', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (130, 'Pharmaceutical Analysis Practical III', '17S07206', 'Practical', 'no', '2019-05-09 02:10:24', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (131, 'Seminar/Assignment 2', '17S07207', 'Practical', 'no', '2019-05-09 02:10:43', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (132, 'Research Methodology and Biostatistics', '17S01301', 'Theory', 'no', '2019-05-09 02:11:11', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (133, 'Journal Club', '17S07301', 'Theory', 'no', '2019-05-09 02:11:32', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (134, 'Teaching Assignment', '17S07302', 'Theory', 'no', '2019-05-09 02:11:46', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (135, 'Comprehensive viva voce', '17S07303', 'Practical', 'no', '2019-05-09 02:12:02', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (136, 'Discussion / Presentation (Proposal presentation)', '17S07304', 'Practical', 'no', '2019-05-09 02:12:18', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (137, 'Research Work', '17S07305', 'Practical', 'no', '2019-05-09 02:12:32', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (138, 'Journal  Club', '17S07401', 'Theory', 'no', '2019-05-09 02:13:27', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (139, 'Research  work', '17S07402', 'Practical', 'no', '2019-05-09 02:13:55', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (140, 'Discussion/ Final Presentation', '17S07403', 'Theory', 'no', '2019-05-09 02:14:12', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (141, 'Drug Delivery System', '17S03101', 'Theory', 'no', '2019-05-09 06:11:06', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (142, 'Modern Pharmaceutics', '17S03102', 'Theory', 'no', '2019-05-09 06:11:23', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (143, 'Regulatory Affair', '17S03103', 'Theory', 'no', '2019-05-09 06:11:37', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (144, 'Modern Pharmaceutical Analytical Techniques Practical', '17S01105', 'Practical', 'no', '2019-05-09 06:12:30', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (145, 'Drug Delivery Systems Practicals - I', '17S03104', 'Practical', 'no', '2019-05-09 06:12:46', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (146, 'Seminar/ Assignment', '17S03105', 'Practical', 'no', '2019-05-09 06:14:27', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (147, 'Molecular Pharmaceutics', '17S03201', 'Theory', 'no', '2019-05-09 06:14:52', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (148, 'Advanced Biopharmaceutics & Pharmacokinetics', '17S03202', 'Theory', 'no', '2019-05-09 06:15:13', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (149, 'Computer Aided Drug Delivery System', '17S03203', 'Theory', 'no', '2019-05-09 06:15:26', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (150, 'Cosmetic and Cosmeceuticals', '17S03204', 'Theory', 'no', '2019-05-09 06:15:39', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (151, 'Nano Technology & Targeted Dds (Ntds) Practicals - II', '17S03205', 'Practical', 'no', '2019-05-09 06:15:56', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (152, 'Advanced Biopharmaceutics & Pharmacokinetics Practicals - III', '17S03206', 'Practical', 'no', '2019-05-09 06:16:09', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (153, 'Seminar  /Assignment', '17S03207', 'Practical', 'no', '2019-05-09 06:17:02', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (154, 'Journal   Club', '17S03301', 'Theory', 'no', '2019-05-09 06:18:08', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (155, 'TeachingAssignment', '17S03302', 'Theory', 'no', '2019-05-09 06:18:23', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (156, 'Comprehensive vivavoce', '17S03303', 'Practical', 'no', '2019-05-09 06:18:46', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (157, 'Discussion / Presentation', '17S03304', 'Theory', 'no', '2019-05-09 06:18:57', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (158, 'ResearchWork', '17S03305', 'Theory', 'no', '2019-05-09 06:19:12', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (159, 'Pharmaceutical Formulation Development', '17S08101', 'Theory', 'no', '2019-05-09 06:20:06', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (160, 'Novel drugdelivery systems', '17S08102', 'Theory', 'no', '2019-05-09 06:20:25', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (161, 'Intellectual Property Rights', '17S08103', 'Theory', 'no', '2019-05-09 06:20:36', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (162, 'Pharmaceutical Formulation Development Practical - I', '17S08104', 'Practical', 'no', '2019-05-09 06:21:15', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (163, 'Seminar/  Assignment', '17S08105', 'Practical', 'no', '2019-05-09 06:21:35', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (164, 'Advanced Biopharmaceutics and Pharmacokinetics', '17S08201', 'Theory', 'no', '2019-05-09 06:21:56', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (165, 'Scale up and Technology Transfer', '17S08202', 'Theory', 'no', '2019-05-09 06:22:10', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (166, 'Pharmaceutical Production Technology', '17S08203', 'Theory', 'no', '2019-05-09 06:22:22', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (167, 'Entrepreneurship Management', '17S08204', 'Theory', 'no', '2019-05-09 23:54:11', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (168, 'Industrial Pharmacy Practical II', '17S08205', 'Practical', 'no', '2019-05-09 23:54:34', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (169, 'Industrial Pharmacy Practical III', '17S08206', 'Practical', 'no', '2019-05-09 23:54:55', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (170, 'Seminar   /Assignment', '17S08207', 'Practical', 'no', '2019-05-09 23:55:22', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (171, 'JournalClub', '17S08301', 'Theory', 'no', '2019-05-09 23:57:32', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (172, 'Teach Assignment', '17S08302', 'Theory', 'no', '2019-05-09 23:58:01', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (173, 'Comprehensivevivavoce', '17S08303', 'Practical', 'no', '2019-05-09 23:58:32', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (174, 'Discussion - Presentation', '17S08304', 'Practical', 'no', '2019-05-10 00:27:16', '0000-00-00 00:00:00');
INSERT INTO `subjects` (`id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (175, 'ReshWork', '17S08305', 'Practical', 'no', '2019-05-10 00:28:34', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: teacher_subjects
#

DROP TABLE IF EXISTS `teacher_subjects`;

CREATE TABLE `teacher_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `class_section_id` (`class_section_id`),
  KEY `session_id` (`session_id`),
  KEY `subject_id` (`subject_id`),
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `teacher_subjects` (`id`, `session_id`, `class_section_id`, `subject_id`, `teacher_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (1, 14, 1, 1, 4, NULL, 'no', '2019-08-01 01:11:10', '0000-00-00 00:00:00');
INSERT INTO `teacher_subjects` (`id`, `session_id`, `class_section_id`, `subject_id`, `teacher_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (2, 14, 1, 2, 4, NULL, 'no', '2019-08-01 01:11:10', '0000-00-00 00:00:00');
INSERT INTO `teacher_subjects` (`id`, `session_id`, `class_section_id`, `subject_id`, `teacher_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (3, 14, 1, 6, 6, NULL, 'no', '2019-08-01 01:11:10', '0000-00-00 00:00:00');
INSERT INTO `teacher_subjects` (`id`, `session_id`, `class_section_id`, `subject_id`, `teacher_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (4, 14, 2, 1, 12, NULL, 'no', '2019-10-20 09:51:52', '0000-00-00 00:00:00');
INSERT INTO `teacher_subjects` (`id`, `session_id`, `class_section_id`, `subject_id`, `teacher_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (5, 14, 2, 2, 6, NULL, 'no', '2019-10-20 09:51:52', '0000-00-00 00:00:00');
INSERT INTO `teacher_subjects` (`id`, `session_id`, `class_section_id`, `subject_id`, `teacher_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (6, 14, 2, 6, 17, NULL, 'no', '2019-10-20 09:51:52', '0000-00-00 00:00:00');
INSERT INTO `teacher_subjects` (`id`, `session_id`, `class_section_id`, `subject_id`, `teacher_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (7, 14, 2, 8, 21, NULL, 'no', '2019-10-20 09:51:53', '0000-00-00 00:00:00');
INSERT INTO `teacher_subjects` (`id`, `session_id`, `class_section_id`, `subject_id`, `teacher_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (8, 14, 2, 17, 18, NULL, 'no', '2019-10-20 09:51:53', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: timetables
#

DROP TABLE IF EXISTS `timetables`;

CREATE TABLE `timetables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_subject_id` int(20) DEFAULT NULL,
  `day_name` varchar(50) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (1, 1, 'Monday', '08:00 AM', '09:30 AM', '102', 'no', '2019-08-08 09:46:16', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'Tuesday', '09:40 AM', '11:10 AM', '113', 'no', '2019-08-08 09:46:16', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (3, 1, 'Wednesday', '11:30 AM', '01:00 PM', '113', 'no', '2019-08-08 09:46:17', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (4, 1, 'Thursday', '', '', '', 'no', '2019-08-08 09:46:17', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (5, 1, 'Friday', '', '', '', 'no', '2019-08-08 09:46:17', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (6, 1, 'Saturday', '08:00 AM', '09:30 AM', '116', 'no', '2019-08-08 09:47:34', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (7, 1, 'Sunday', '', '', '', 'no', '2019-08-08 09:46:17', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (8, 1, 'Monday', '11:04 AM', '11:34 AM', '103', 'no', '2019-08-08 09:46:16', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (9, 1, 'Tuesday', '', '', '', 'no', '2019-08-08 09:46:17', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (10, 1, 'Wednesday', '', '', '', 'no', '2019-08-08 09:46:17', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (11, 1, 'Thursday', '', '', '', 'no', '2019-08-08 09:46:17', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (12, 1, 'Friday', '', '', '', 'no', '2019-08-08 09:46:17', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (13, 1, 'Saturday', '', '', '', 'no', '2019-08-08 09:46:17', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (14, 1, 'Sunday', '', '', '', 'no', '2019-08-08 09:46:17', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (15, 2, 'Monday', '08:00 AM', '09:30 AM', '105', 'no', '2019-08-08 10:07:23', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (16, 2, 'Monday', '', '', '', 'no', '2019-08-08 10:07:23', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (17, 2, 'Tuesday', '', '', '', 'no', '2019-08-08 10:07:23', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (18, 2, 'Tuesday', '', '', '', 'no', '2019-08-08 10:07:23', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (19, 2, 'Wednesday', '', '', '', 'no', '2019-08-08 10:07:23', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (20, 2, 'Wednesday', '', '', '', 'no', '2019-08-08 10:07:24', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (21, 2, 'Thursday', '', '', '', 'no', '2019-08-08 10:07:24', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (22, 2, 'Thursday', '', '', '', 'no', '2019-08-08 10:07:24', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (23, 2, 'Friday', '08:00 AM', '09:30 AM', '105', 'no', '2019-08-08 10:07:24', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (24, 2, 'Friday', '11:30 AM', '01:00 PM', '108', 'no', '2019-08-08 10:07:24', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (25, 2, 'Saturday', '', '', '', 'no', '2019-08-08 10:07:24', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (26, 2, 'Saturday', '', '', '', 'no', '2019-08-08 10:07:24', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (27, 2, 'Sunday', '', '', '', 'no', '2019-08-08 10:07:24', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (28, 2, 'Sunday', '', '', '', 'no', '2019-08-08 10:07:24', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (29, 4, 'Monday', '08:00 AM', '09:30 AM', '125', 'no', '2019-10-20 11:17:43', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (30, 4, 'Monday', '11:10 AM', '01:00 PM', '125', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (31, 4, 'Tuesday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (32, 4, 'Tuesday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (33, 4, 'Wednesday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (34, 4, 'Wednesday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (35, 4, 'Thursday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (36, 4, 'Thursday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (37, 4, 'Friday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (38, 4, 'Friday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (39, 4, 'Saturday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (40, 4, 'Saturday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (41, 4, 'Sunday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');
INSERT INTO `timetables` (`id`, `teacher_subject_id`, `day_name`, `start_time`, `end_time`, `room_no`, `is_active`, `created_at`, `updated_at`) VALUES (42, 4, 'Sunday', '', '', '', 'no', '2019-10-20 11:17:44', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: transport_route
#

DROP TABLE IF EXISTS `transport_route`;

CREATE TABLE `transport_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_title` varchar(100) DEFAULT NULL,
  `no_of_vehicle` int(11) DEFAULT NULL,
  `fare` float(10,2) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: userlog
#

DROP TABLE IF EXISTS `userlog`;

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (1, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 73.0.3683.103, Mac OS X', '2019-05-08 19:58:28');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Firefox 67.0, Mac OS X', '2019-05-08 20:35:19');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (3, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 73.0.3683.103, Mac OS X', '2019-05-08 22:03:42');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (4, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 73.0.3683.103, Mac OS X', '2019-05-08 22:06:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (5, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 73.0.3683.103, Mac OS X', '2019-05-08 22:07:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (6, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 73.0.3683.103, Mac OS X', '2019-05-08 22:17:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (7, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-08 23:09:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (8, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-08 23:16:11');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (9, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-08 23:31:53');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (10, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 73.0.3683.103, Mac OS X', '2019-05-09 03:33:12');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (11, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-09 06:08:37');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (12, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-09 23:28:38');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (13, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-09 23:30:05');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (14, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-10 00:24:50');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (15, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-10 13:22:23');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (16, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-10 23:22:40');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (17, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.108, Windows 10', '2019-05-10 23:23:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (18, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-10 23:25:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (19, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-10 23:25:31');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (20, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-10 23:27:49');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (21, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-10 23:39:46');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (22, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-10 23:44:26');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (23, 'saradhi2u@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-10 23:49:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (24, 'sampathkatakam@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.108, Windows 10', '2019-05-10 23:50:16');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (25, 'shiva_s_rl@yahoo.co.in', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-10 23:50:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (26, 'dastu1984@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-10 23:51:17');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (27, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-10 23:54:40');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (28, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-10 23:54:51');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (29, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-10 23:55:16');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (30, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.108, Windows 10', '2019-05-10 23:58:08');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (31, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-10 23:58:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (32, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-10 23:58:42');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (33, 'gousia009@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.108, Windows 10', '2019-05-11 00:12:46');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (34, 'pavankumarmph@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:12:49');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (35, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:13:12');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (36, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 73.0.3683.103, Windows 10', '2019-05-11 00:13:16');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (37, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:13:23');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (38, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:13:33');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (39, 'sushmapriyasampangi@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-11 00:14:05');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (40, 'gousia009@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.108, Windows 10', '2019-05-11 00:14:45');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (41, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:21:09');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (42, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.108, Windows 10', '2019-05-11 00:21:19');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (43, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-11 00:24:41');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (44, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:25:29');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (45, 'dagadamahesh@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 73.0.3683.103, Windows 10', '2019-05-11 00:26:51');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (46, 'shiva_s_rl@yahoo.co.in', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:27:31');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (47, 'visitramana@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:29:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (48, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:29:48');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (49, 'madanbangs@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:31:10');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (50, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:31:29');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (51, 'itsmevenu1989@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 10', '2019-05-11 00:35:32');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (52, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-11 02:04:04');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (53, 'niranjan3131@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-11 02:15:58');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (54, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-11 02:16:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (55, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-12 10:35:48');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (56, 'niranjan3131@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-12 10:46:11');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (57, 'niranjan3131@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-12 10:50:57');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (58, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-12 10:54:24');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (59, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-12 13:56:09');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (60, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-12 23:45:33');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (61, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-13 02:09:23');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (62, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-13 03:01:03');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (63, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-13 03:11:54');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (64, 'ravi445@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-13 03:19:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (65, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-13 03:39:57');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (66, 'sreenivasulu_munna@yahoo.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-13 03:47:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (67, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-13 03:48:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (68, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-13 23:31:07');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (69, 'niranjan3131@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-14 01:05:00');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (70, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-14 01:16:04');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (71, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-14 03:32:06');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (72, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-14 21:22:36');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (73, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-14 21:35:10');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (74, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-14 21:36:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (75, 'niranjan3131@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-14 22:03:01');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (76, 'niranjan3131@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 73.0.3683.90, Android', '2019-05-15 01:44:06');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (77, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-15 03:25:41');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (78, 'niranjan3131@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-15 03:27:18');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (79, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-15 03:28:59');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (80, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-15 03:45:41');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (81, 'niranjan3131@gmail.com', 'Teacher', '103.108.220.41', 'Chrome 74.0.3729.157, Windows 7', '2019-05-15 06:31:04');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (82, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-15 16:39:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (83, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Firefox 67.0, Mac OS X', '2019-05-15 16:52:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (84, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.157, Windows 7', '2019-05-15 23:43:13');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (85, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.157, Windows 10', '2019-05-16 02:07:53');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (86, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.157, Windows 10', '2019-05-16 03:16:50');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (87, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.157, Windows 7', '2019-05-16 04:49:26');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (88, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-16 05:20:29');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (89, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-16 06:06:21');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (90, 'hussainbanaganapalla@gmail.com', 'Librarian', '103.108.220.41', 'Chrome 74.0.3729.157, Windows 7', '2019-05-16 06:20:12');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (91, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Mac OS X', '2019-05-16 12:11:48');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (92, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 73.0.3683.103, Windows 8.1', '2019-05-16 19:31:52');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (93, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.157, Windows 10', '2019-05-16 23:42:38');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (94, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.157, Windows 10', '2019-05-17 02:09:28');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (95, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 73.0.3683.103, Windows 8.1', '2019-05-17 23:46:01');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (96, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.157, Windows 7', '2019-05-18 06:59:42');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (97, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.131, Windows 7', '2019-05-21 08:47:17');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (98, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 7', '2019-05-26 05:42:07');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (99, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.157, Android', '2019-05-26 18:09:50');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (100, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 7', '2019-05-27 00:32:38');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (101, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 7', '2019-05-27 04:03:40');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (102, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 10', '2019-05-27 23:02:16');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (103, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 7', '2019-05-27 23:30:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (104, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.157, Windows 10', '2019-05-27 23:30:35');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (105, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 10', '2019-05-28 14:16:50');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (106, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 7', '2019-05-30 01:32:45');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (107, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 7', '2019-05-30 04:07:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (108, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 10', '2019-05-31 00:04:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (109, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 10', '2019-05-31 01:17:34');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (110, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 10', '2019-05-31 07:51:09');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (111, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 10', '2019-06-10 02:39:18');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (112, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 7', '2019-06-10 05:26:58');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (113, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Mac OS X', '2019-06-10 05:34:06');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (114, 'drcmchetty@gmail.com', 'Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 7', '2019-06-12 01:24:38');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (115, 'pharmagp@gmail.com', 'Super Admin', '49.207.184.11', 'Chrome 74.0.3729.169, Mac OS X', '2019-06-18 03:45:00');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (116, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 10', '2019-06-18 03:49:23');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (117, 'drcmchetty@gmail.com', 'Admin', '49.207.184.11', 'Chrome 74.0.3729.169, Mac OS X', '2019-06-18 04:05:14');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (118, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 10', '2019-06-19 08:02:45');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (119, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 10', '2019-06-19 21:37:58');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (120, 'drcmchetty@gmail.com', 'Admin', '106.77.168.90', 'Chrome 74.0.3729.169, Windows 7', '2019-06-20 10:38:36');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (121, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 74.0.3729.169, Windows 10', '2019-06-20 10:41:49');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (122, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 75.0.3770.100, Windows 10', '2019-06-20 19:38:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (123, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 75.0.3770.100, Windows 10', '2019-06-21 09:17:09');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (124, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 75.0.3770.100, Windows 10', '2019-06-21 20:37:10');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (125, 'drcmchetty@gmail.com', 'Admin', '157.49.252.165', 'Chrome 75.0.3770.101, Android', '2019-06-22 05:44:11');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (126, 'pharmagp@gmail.com', 'Super Admin', '103.108.220.41', 'Chrome 75.0.3770.100, Windows 10', '2019-06-22 22:43:47');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (127, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 75.0.3770.100, Windows 10', '2019-06-23 09:32:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (128, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 75.0.3770.100, Windows 10', '2019-06-23 12:50:15');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (129, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 75.0.3770.100, Windows 10', '2019-06-23 21:20:08');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (130, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 75.0.3770.100, Windows 10', '2019-06-24 09:00:31');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (131, 'drcmchetty@gmail.com', 'Admin', '127.0.0.1', 'Firefox 67.0, Windows 10', '2019-06-24 13:04:20');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (132, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 75.0.3770.100, Windows 10', '2019-06-24 23:54:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (133, 'drcmchetty@gmail.com', 'Admin', '127.0.0.1', 'Firefox 67.0, Windows 10', '2019-06-25 01:49:53');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (134, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-07-29 11:32:57');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (135, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-07-31 22:45:51');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (136, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-08-01 13:24:23');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (137, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-08-01 22:46:32');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (138, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-08-05 07:56:57');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (139, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-08-05 12:41:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (140, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-08-07 06:41:24');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (141, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-08-07 08:51:56');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (142, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-08-08 07:18:35');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (143, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-08-08 19:28:31');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (144, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-08-09 06:47:02');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (145, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 75.0.3770.142, Windows 10', '2019-08-09 21:13:06');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (146, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 76.0.3809.100, Windows 10', '2019-08-12 00:28:24');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (147, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 76.0.3809.100, Windows 10', '2019-08-12 06:37:18');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (148, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 76.0.3809.100, Windows 10', '2019-08-12 20:08:11');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (149, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 76.0.3809.100, Windows 10', '2019-08-15 11:17:34');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (150, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 76.0.3809.100, Windows 10', '2019-08-15 20:43:48');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (151, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 76.0.3809.100, Windows 10', '2019-08-16 08:02:02');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (152, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-08-28 10:05:12');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (153, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-08-29 07:03:45');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (154, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-08-29 11:45:21');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (155, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-08-30 09:20:26');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (156, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-08-30 19:38:42');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (157, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-02 10:09:43');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (158, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-04 07:14:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (159, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-04 11:15:15');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (160, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-09 07:15:35');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (161, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-09 16:56:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (162, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-10 01:03:09');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (163, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-10 07:13:17');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (164, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-10 20:27:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (165, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-11 05:31:49');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (166, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-13 12:17:13');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (167, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-13 22:44:56');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (168, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 76.0.3809.132, Windows 10', '2019-09-19 10:56:26');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (169, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-23 13:02:08');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (170, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-23 21:57:40');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (171, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-24 20:10:43');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (172, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-26 01:12:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (173, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-26 06:37:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (174, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-26 19:36:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (175, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-27 01:36:51');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (176, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-27 07:53:07');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (177, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-27 11:09:42');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (178, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-27 19:45:29');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (179, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-28 07:41:21');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (180, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-28 10:03:03');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (181, 'pharmagp@gmail.com', 'Super Admin', '::1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-28 22:41:50');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (182, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-29 05:42:56');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (183, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-29 12:13:20');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (184, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-29 18:58:15');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (185, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-30 06:51:52');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (186, 'drcmchetty@gmail.com', 'Admin', '127.0.0.1', 'Firefox 69.0, Windows 10', '2019-09-30 08:33:34');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (187, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-09-30 19:50:38');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (188, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-01 06:38:56');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (189, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-01 11:42:23');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (190, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-02 12:51:41');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (191, 'drcmchetty@gmail.com', 'Admin', '127.0.0.1', 'Firefox 69.0, Windows 10', '2019-10-02 14:30:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (192, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-02 20:57:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (193, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-03 12:20:29');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (194, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-04 10:47:12');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (195, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-04 17:55:26');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (196, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-04 23:00:56');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (197, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-05 06:27:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (198, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-06 18:38:20');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (199, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-07 21:23:18');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (200, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-08 12:33:19');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (201, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-09 05:53:12');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (202, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-10 14:06:05');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (203, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-10 21:33:42');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (204, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-11 07:08:54');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (205, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-11 22:59:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (206, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-12 09:40:15');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (207, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-13 02:11:14');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (208, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-13 05:10:28');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (209, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-13 20:23:08');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (210, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.90, Windows 10', '2019-10-14 05:24:29');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (211, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-14 19:49:04');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (212, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-14 22:46:57');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (213, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-15 02:01:39');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (214, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-15 07:05:00');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (215, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-15 19:38:34');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (216, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-16 01:02:31');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (217, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-16 06:44:47');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (218, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-16 21:26:08');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (219, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-17 12:55:11');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (220, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-18 07:37:46');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (221, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-18 15:23:05');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (222, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-19 00:05:31');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (223, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-20 06:38:59');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (224, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-20 21:16:21');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (225, 'pharmagp@gmail.com', 'Super Admin', '127.0.0.1', 'Chrome 77.0.3865.120, Windows 10', '2019-10-20 23:28:49');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (9, 5, 'std5', '95571l', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (10, 5, 'parent5', 'm5x026', '5', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (11, 6, 'std6', 'jcsm25', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (12, 6, 'parent6', 'b4k8bz', '6', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (13, 7, 'std7', 'c6yizl', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (14, 7, 'parent7', '64n1wy', '7', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (15, 8, 'std8', '502bwh', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (16, 8, 'parent8', 'lixale', '8', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (17, 9, 'std9', 'sbpcpu', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (18, 9, 'parent9', 'bnfqz1', '9', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (19, 10, 'std10', 'j5lcgi', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (20, 10, 'parent10', 'k762pr', '10', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (21, 11, 'std11', '6at7wo', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (22, 11, 'parent11', 'yt72ei', '11', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (23, 12, 'std12', '2hkrv3', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (24, 12, 'parent12', 'jkazg6', '12', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (25, 13, 'std13', '25oo5z', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (26, 13, 'parent13', '8duu4l', '13', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (27, 14, 'std14', '5aqeh6', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (28, 14, 'parent14', 'ko2z8c', '14', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (29, 15, 'std15', 'cq1ljg', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (30, 15, 'parent15', 'w07scm', '15', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (31, 16, 'std16', 'n46gf4', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (32, 16, 'parent16', 'tz4lds', '16', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (33, 17, 'std17', 'idlj1t', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (34, 17, 'parent17', 'r6yvgp', '17', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (35, 18, 'std18', '87fkis', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (36, 18, 'parent18', 'mlhnoy', '18', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (37, 19, 'std19', '2i58kz', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (38, 19, 'parent19', 'rg7utp', '19', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (39, 20, 'std20', 'h9hxgs', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (40, 20, 'parent20', '6sa19j', '20', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (41, 21, 'std21', 'pn8fec', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (42, 21, 'parent21', 'l769vd', '21', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (43, 22, 'std22', 'wiilrn', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (44, 22, 'parent22', '4n0yan', '22', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (45, 23, 'std23', '0d87yg', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (46, 23, 'parent23', 'bq2s5o', '23', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (47, 24, 'std24', '8hma7s', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (48, 24, 'parent24', 'mn8xjk', '24', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (49, 25, 'std25', 'jfr2pp', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (50, 25, 'parent25', 'tcf2ie', '25', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (51, 26, 'std26', 'aybk6t', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (52, 26, 'parent26', '2t3veb', '26', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (53, 27, 'std27', 'k0qbdu', '', 'student', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (54, 27, 'parent27', 'ire1b2', '27', 'parent', '', 'yes', '2019-05-28 00:39:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (55, 28, 'std28', 'j3b3jj', '', 'student', '', 'yes', '2019-05-28 00:39:04', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (56, 28, 'parent28', 'clql02', '28', 'parent', '', 'yes', '2019-05-28 00:39:04', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (57, 29, 'std29', 'pkgg3d', '', 'student', '', 'yes', '2019-05-28 00:39:04', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (58, 29, 'parent29', 'ag5ifh', '29', 'parent', '', 'yes', '2019-05-28 00:39:04', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (59, 30, 'std30', 'tb3hbo', '', 'student', '', 'yes', '2019-05-28 00:42:12', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (60, 30, 'parent30', 'nyetpj', '30', 'parent', '', 'yes', '2019-05-28 00:42:12', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (61, 31, 'std31', '38dmi8', '', 'student', '', 'yes', '2019-06-20 10:53:59', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (62, 31, 'parent31', 'n9q3m1', '31', 'parent', '', 'yes', '2019-06-20 10:53:59', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (63, 32, 'std32', '4uct1p', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (64, 32, 'parent32', '1h9av1', '32', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (65, 33, 'std33', 'katt84', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (66, 33, 'parent33', 'ucsqiq', '33', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (67, 34, 'std34', 'sx941t', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (68, 34, 'parent34', '7orvl8', '34', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (69, 35, 'std35', 'pwfgw6', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (70, 35, 'parent35', 'exjr6j', '35', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (71, 36, 'std36', 'ngdn9c', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (72, 36, 'parent36', 'ydoe2w', '36', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (73, 37, 'std37', 'vaboxn', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (74, 37, 'parent37', '2ht3m9', '37', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (75, 38, 'std38', '215cpu', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (76, 38, 'parent38', 'mzks98', '38', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (77, 39, 'std39', 'zayhah', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (78, 39, 'parent39', 'xcxnqf', '39', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (79, 40, 'std40', 'kwas55', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (80, 40, 'parent40', 'hkjbuz', '40', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (81, 41, 'std41', 'av21v7', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (82, 41, 'parent41', 'wwj25n', '41', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (83, 42, 'std42', '3ijtf3', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (84, 42, 'parent42', 'rol5n1', '42', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (85, 43, 'std43', 'qmc0ql', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (86, 43, 'parent43', 's1vwkl', '43', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (87, 44, 'std44', 'w5qmag', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (88, 44, 'parent44', 'zowdbe', '44', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (89, 45, 'std45', 'u29svt', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (90, 45, 'parent45', 'sayib2', '45', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (91, 46, 'std46', 'aiownv', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (92, 46, 'parent46', '77atmw', '46', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (93, 47, 'std47', 'ty2whi', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (94, 47, 'parent47', 'k2w9cd', '47', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (95, 48, 'std48', '4024s6', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (96, 48, 'parent48', 'npnj47', '48', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (97, 49, 'std49', 'f0vgok', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (98, 49, 'parent49', '50qc1t', '49', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (99, 50, 'std50', 'k4xb37', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (100, 50, 'parent50', '428fx4', '50', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (101, 51, 'std51', 'pimbyu', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (102, 51, 'parent51', 'w62p5f', '51', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (103, 52, 'std52', 'a5gkx9', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (104, 52, 'parent52', '75aiek', '52', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (105, 53, 'std53', 'zvpw2j', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (106, 53, 'parent53', 'hlb9g8', '53', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (107, 54, 'std54', 'svrtp4', '', 'student', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (108, 54, 'parent54', 'tdl8q5', '54', 'parent', '', 'yes', '2019-06-20 10:54:00', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (109, 55, 'std55', 'am0hm0', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (110, 55, 'parent55', 'ovcu5b', '55', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (111, 56, 'std56', 'atclbp', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (112, 56, 'parent56', 'du2tj5', '56', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (113, 57, 'std57', 'xejx82', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (114, 57, 'parent57', 'j1j64r', '57', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (115, 58, 'std58', 'wbry21', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (116, 58, 'parent58', '8xjtbs', '58', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (117, 59, 'std59', 'rluwnl', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (118, 59, 'parent59', 'kibih0', '59', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (119, 60, 'std60', 's9kdy7', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (120, 60, 'parent60', '6u1d1q', '60', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (121, 61, 'std61', 'kun7pq', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (122, 61, 'parent61', 'k71bpj', '61', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (123, 62, 'std62', 'dh24gy', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (124, 62, 'parent62', 'lnfg90', '62', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (125, 63, 'std63', 'i83qad', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (126, 63, 'parent63', '8141ur', '63', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (127, 64, 'std64', '0hwcwl', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (128, 64, 'parent64', '89825b', '64', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (129, 65, 'std65', '3tnk0d', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (130, 65, 'parent65', '0nzjv9', '65', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (131, 66, 'std66', 'yplr4e', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (132, 66, 'parent66', '76w4fs', '66', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (133, 67, 'std67', 'rcuh3q', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (134, 67, 'parent67', '2babu1', '67', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (135, 68, 'std68', 'yxadvl', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (136, 68, 'parent68', '66k2ba', '68', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (137, 69, 'std69', 'mta93q', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (138, 69, 'parent69', 'an6du6', '69', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (139, 70, 'std70', 'ye4db4', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (140, 70, 'parent70', 'ddorrp', '70', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (141, 71, 'std71', '18btqb', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (142, 71, 'parent71', '1i1cee', '71', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (143, 72, 'std72', 'y7fdlu', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (144, 72, 'parent72', 'aj4dak', '72', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (145, 73, 'std73', 'r58fco', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (146, 73, 'parent73', '1zh7ge', '73', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (147, 74, 'std74', 'jq9nlx', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (148, 74, 'parent74', 'dbedqh', '74', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (149, 75, 'std75', 'qxoq9n', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (150, 75, 'parent75', 'irqhz4', '75', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (151, 76, 'std76', '0ghh31', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (152, 76, 'parent76', 'wl3hsf', '76', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (153, 77, 'std77', 'os7exn', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (154, 77, 'parent77', 'vj2djz', '77', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (155, 78, 'std78', 'er2afr', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (156, 78, 'parent78', 'ufmioc', '78', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (157, 79, 'std79', 'wpnbp4', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (158, 79, 'parent79', 'vzwde5', '79', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (159, 80, 'std80', 'ksnlrc', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (160, 80, 'parent80', '3bwg6u', '80', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (161, 81, 'std81', '91juw3', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (162, 81, 'parent81', 'sejb1a', '81', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (163, 82, 'std82', '35ht5c', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (164, 82, 'parent82', 'k6hvel', '82', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (165, 83, 'std83', 'k732vy', '', 'student', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (166, 83, 'parent83', 'zj9gl1', '83', 'parent', '', 'yes', '2019-06-20 11:04:57', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (167, 84, 'std84', 'ucru8y', '', 'student', '', 'yes', '2019-08-28 13:59:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (168, 0, 'parent84', '9iiu78', '84', 'parent', '', 'yes', '2019-08-28 13:59:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (169, 85, 'std85', 'jrkodj', '', 'student', '', 'yes', '2019-08-29 08:54:11', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (170, 0, 'parent85', 'kms8dq', '85', 'parent', '', 'yes', '2019-08-29 08:54:11', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (171, 86, 'std86', 'v6ap7t', '', 'student', '', 'yes', '2019-08-29 12:11:39', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (172, 0, 'parent86', '9sjxag', '86', 'parent', '', 'yes', '2019-08-29 12:11:39', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (173, 87, 'std87', 'nkpkl8', '', 'student', '', 'yes', '2019-09-09 20:58:48', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (174, 0, 'parent87', 'm44x71', '87', 'parent', '', 'yes', '2019-09-09 20:58:48', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (175, 88, 'std88', 'rkmngp', '', 'student', '', 'yes', '2019-09-09 21:16:06', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (176, 0, 'parent88', 'ynep88', '88', 'parent', '', 'yes', '2019-09-09 21:16:06', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (177, 89, 'std89', 'lfs1mn', '', 'student', '', 'no', '2019-09-10 11:14:22', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (178, 0, 'parent89', 'tgq7uf', '89', 'parent', '', 'yes', '2019-09-09 21:39:40', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (179, 90, 'std90', 'ahw7pe', '', 'student', '', 'yes', '2019-09-10 08:39:48', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (180, 0, 'parent90', 'g4k1dp', '90', 'parent', '', 'yes', '2019-09-10 08:39:48', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (181, 91, 'std91', 'dzv6ph', '', 'student', '', 'yes', '2019-09-10 10:54:51', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (182, 91, 'parent91', 'chzmde', '91', 'parent', '', 'yes', '2019-09-10 10:54:51', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (183, 92, 'std92', 'e8ue6b', '', 'student', '', 'yes', '2019-10-09 08:38:09', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (184, 0, 'parent92', '69gl2p', '92', 'parent', '', 'yes', '2019-10-09 08:38:09', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (185, 93, 'std93', 'je5c5g', '', 'student', '', 'yes', '2019-10-13 22:20:26', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (186, 0, 'parent93', 'myz9k0', '93', 'parent', '', 'yes', '2019-10-13 22:20:26', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (187, 94, 'std94', 'g95vim', '', 'student', '', 'yes', '2019-10-13 22:21:03', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`, `updated_at`) VALUES (188, 0, 'parent94', 'ezmmtp', '94', 'parent', '', 'yes', '2019-10-13 22:21:03', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: users_authentication
#

DROP TABLE IF EXISTS `users_authentication`;

CREATE TABLE `users_authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expired_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: vehicle_routes
#

DROP TABLE IF EXISTS `vehicle_routes`;

CREATE TABLE `vehicle_routes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `route_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: vehicles
#

DROP TABLE IF EXISTS `vehicles`;

CREATE TABLE `vehicles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `manufacture_year` varchar(4) DEFAULT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: visitors_book
#

DROP TABLE IF EXISTS `visitors_book`;

CREATE TABLE `visitors_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `no_of_pepple` int(11) NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` mediumtext NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: visitors_purpose
#

DROP TABLE IF EXISTS `visitors_purpose`;

CREATE TABLE `visitors_purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

