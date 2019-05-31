<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Version_410 extends CI_Migration {

    function __construct() {
        parent::__construct();
    }

    public function up() {
        $this->db->query("ALTER TABLE accountants CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;");
        $this->db->query("ALTER TABLE librarians CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;");

        $this->db->query("CREATE TABLE `certificates` (
  `id` int(11) NOT NULL auto_increment,
  `certificate_name` varchar(100) NOT NULL,
  `certificate_text` text NOT NULL,
  `left_header` varchar(100) NOT NULL,
  `center_header` varchar(100) NOT NULL,
  `right_header` varchar(100) NOT NULL,
  `left_footer` varchar(100) NOT NULL,
  `right_footer` varchar(100) NOT NULL,
  `center_footer` varchar(100) NOT NULL,
  `background_image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

        $this->db->query("CREATE TABLE `class_teacher` (
  `id` int(11) NOT NULL auto_increment,
  `class_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

        $this->db->query("CREATE TABLE `complaint` (
  `id` int(11) NOT NULL auto_increment,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

        $this->db->query("CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL auto_increment,
  `complaint_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

        $this->db->query("CREATE TABLE `content_for` (
  `id` int(11) NOT NULL auto_increment,
  `role` varchar(50) NULL,
  `content_id` int(11) NULL,
  `user_id` int(11) NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  KEY `content_id`(`content_id`),
  KEY `user_id`(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `department` (
  `id` int(11) NOT NULL auto_increment,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `dispatch_receive` (
  `id` int(11) NOT NULL auto_increment,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` mediumtext NOT NULL,
  `reference` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `note` mediumtext NOT NULL,
  `source` varchar(50) NOT NULL,
  `email` varchar(50) NULL,
  `assigned` varchar(100) NOT NULL,
  `class` int(11) NOT NULL,
  `no_of_child` varchar(11) NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `enquiry_type` (
  `id` int(11) NOT NULL auto_increment,
  `enquiry_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `events` (
  `id` int(11) NOT NULL auto_increment,
  `event_title` varchar(200) NOT NULL,
  `event_description` varchar(300) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `follow_up` (
  `id` int(11) NOT NULL auto_increment,
  `enquiry_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");



        $this->db->query("CREATE TABLE `front_cms_media_gallery` (
  `id` int(11) NOT NULL auto_increment,
  `image` varchar(300) NULL,
  `thumb_path` varchar(300) NULL,
  `dir_path` varchar(300) NULL,
  `img_name` varchar(300) NULL,
  `thumb_name` varchar(300) NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` mediumtext NOT NULL,
  `vid_title` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");



        $this->db->query("CREATE TABLE `front_cms_menu_items` (
  `id` int(11) NOT NULL auto_increment,
  `menu_id` int(11) NOT NULL,
  `menu` varchar(100) NULL,
  `page_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ext_url` mediumtext NULL,
  `open_new_tab` int(11) NULL DEFAULT '0',
  `ext_url_link` mediumtext NULL,
  `slug` varchar(200) NULL,
  `weight` int(11) NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  `description` mediumtext NULL,
  `is_active` varchar(10) NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `front_cms_menus` (
  `id` int(11) NOT NULL auto_increment,
  `menu` varchar(100) NULL,
  `slug` varchar(200) NULL,
  `description` mediumtext NULL,
  `open_new_tab` int(10) NOT NULL DEFAULT '0',
  `ext_url` mediumtext NOT NULL,
  `ext_url_link` mediumtext NOT NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");



        $this->db->query("CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL auto_increment,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int(1) NULL DEFAULT '0',
  `title` varchar(250) NULL,
  `url` varchar(250) NULL,
  `type` varchar(50) NULL,
  `slug` varchar(200) NULL,
  `meta_title` mediumtext NULL,
  `meta_description` mediumtext NULL,
  `meta_keyword` mediumtext NULL,
  `feature_image` varchar(200) NOT NULL,
  `description` longtext NULL,
  `publish_date` date NOT NULL,
  `publish` int(10) NULL DEFAULT '0',
  `sidebar` int(10) NULL DEFAULT '0',
  `is_active` varchar(10) NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

        $this->db->query("CREATE TABLE `front_cms_page_contents` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` int(11) NULL,
  `content_type` varchar(50) NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`page_id`) REFERENCES `front_cms_pages` (`id`) ON DELETE CASCADE,
  KEY `page_id`(`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `front_cms_programs` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(50) NULL,
  `slug` varchar(255) NULL,
  `url` mediumtext NULL,
  `title` varchar(200) NULL,
  `date` date NULL,
  `event_start` date NULL,
  `event_end` date NULL,
  `event_venue` mediumtext NULL,
  `description` mediumtext NULL,
  `is_active` varchar(10) NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `meta_title` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `meta_keyword` mediumtext NOT NULL,
  `feature_image` mediumtext NOT NULL,
  `publish_date` date NOT NULL,
  `publish` varchar(10) NULL DEFAULT '0',
  `sidebar` int(10) NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `front_cms_program_photos` (
  `id` int(11) NOT NULL auto_increment,
  `program_id` int(11) NULL,
  `media_gallery_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`program_id`) REFERENCES `front_cms_programs` (`id`) ON DELETE CASCADE,
  KEY `program_id`(`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

        $this->db->query("CREATE TABLE `front_cms_settings` (
  `id` int(11) NOT NULL auto_increment,
  `theme` varchar(50) NULL,
  `is_active_rtl` int(10) NULL DEFAULT '0',
  `is_active_front_cms` int(11) NULL DEFAULT '0',
  `is_active_sidebar` int(1) NULL DEFAULT '0',
  `logo` varchar(200) NULL,
  `contact_us_email` varchar(100) NULL,
  `complain_form_email` varchar(100) NULL,
  `sidebar_options` mediumtext NOT NULL,
  `fb_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `pinterest_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `google_analytics` mediumtext NULL,
  `footer_text` varchar(500) NULL,
  `fav_icon` varchar(250) NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");




        $this->db->query("CREATE TABLE `general_calls` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_dureation` varchar(50) NOT NULL,
  `note` mediumtext NOT NULL,
  `call_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");



        $this->db->query("CREATE TABLE `homework` (
  `id` int(11) NOT NULL auto_increment,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `homework_evaluation` (
  `id` int(11) NOT NULL auto_increment,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `id_card` (
  `id` int(11) NOT NULL auto_increment,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type`(`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");






        $this->db->query("CREATE TABLE `payslip_allowance` (
  `id` int(11) NOT NULL auto_increment,
  `payslip_id` int(11) NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `cal_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");




        $this->db->query("CREATE TABLE `permission_category` (
  `id` int(11) NOT NULL auto_increment,
  `perm_group_id` int(11) NULL,
  `name` varchar(100) NULL,
  `short_code` varchar(100) NULL,
  `enable_view` int(11) NULL DEFAULT '0',
  `enable_add` int(11) NULL DEFAULT '0',
  `enable_edit` int(11) NULL DEFAULT '0',
  `enable_delete` int(11) NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");



        $this->db->query("CREATE TABLE `permission_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int(11) NULL DEFAULT '0',
  `system` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `reference` (
  `id` int(11) NOT NULL auto_increment,
  `reference` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

        $this->db->query("CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NULL,
  `slug` varchar(150) NULL,
  `is_active` int(11) NULL DEFAULT '0',
  `is_system` int(1) NOT NULL DEFAULT '0',
  `is_superadmin` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `notification_roles` (
  `id` int(11) NOT NULL auto_increment,
  `send_notification_id` int(11) NULL,
  `role_id` int(11) NULL,
  `is_active` int(11) NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`send_notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  KEY `role_id`(`role_id`),
  KEY `send_notification_id`(`send_notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");




        $this->db->query("CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `role_id` int(11) NULL,
  `perm_cat_id` int(11) NULL,
  `can_view` int(11) NULL,
  `can_add` int(11) NULL,
  `can_edit` int(11) NULL,
  `can_delete` int(11) NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `school_houses` (
  `id` int(11) NOT NULL auto_increment,
  `house_name` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");



        $this->db->query("CREATE TABLE `source` (
  `id` int(11) NOT NULL auto_increment,
  `source` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");




        $this->db->query("CREATE TABLE `staff` (
  `id` int(11) NOT NULL auto_increment,
  `employee_id` varchar(200) NOT NULL,
  `department` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `work_exp` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact_no` varchar(200) NULL,
  `emergency_contact_no` varchar(200) NOT NULL,
  `email` varchar(200) NULL,
  `dob` date NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(200) NULL,
  `note` varchar(200) NOT NULL,
  `image` varchar(200) NULL,
  `password` varchar(250) NOT NULL,
  `gender` varchar(50) NULL,
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
  UNIQUE KEY `employee_id`(`employee_id`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");



        $this->db->query("CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL auto_increment,
  `date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `staff_attendance_type_id` int(11) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `staff_attendance_type` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

        $this->db->query("CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL auto_increment,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

        $this->db->query("CREATE TABLE `staff_leave_details` (
  `id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `alloted_leave` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");



        $this->db->query("CREATE TABLE `staff_leave_request` (
  `id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `staff_payroll` (
  `id` int(11) NOT NULL auto_increment,
  `basic_salary` int(11) NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `staff_payslip` (
  `id` int(11) NOT NULL auto_increment,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `staff_roles` (
  `id` int(11) NOT NULL auto_increment,
  `role_id` int(11) NULL,
  `staff_id` int(11) NULL,
  `is_active` int(11) NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `role_id`(`role_id`),
  KEY `staff_id`(`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `staff_timeline` (
  `id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `student_timeline` (
  `id` int(11) NOT NULL auto_increment,
  `student_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

        $this->db->query("CREATE TABLE `visitors_book` (
  `id` int(11) NOT NULL auto_increment,
  `source` varchar(100) NULL,
  `purpose` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `no_of_pepple` int(11) NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` mediumtext NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


        $this->db->query("CREATE TABLE `visitors_purpose` (
  `id` int(11) NOT NULL auto_increment,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;");


   $this->db->query("ALTER TABLE `contents` 
  ADD COLUMN `cls_sec_id` int(10) NOT NULL AFTER `class_id`,
  ADD COLUMN `created_by` int(11) NOT NULL AFTER `file`;");


   $this->db->query("ALTER TABLE `expenses`   
  ADD COLUMN `invoice_no` varchar(200) NOT NULL AFTER `name`;");


   $this->db->query("ALTER TABLE `fee_groups` 
  ADD COLUMN `is_system` int(1) NOT NULL DEFAULT '0' AFTER `name`;");

   $this->db->query("ALTER TABLE `feetype` 
  ADD COLUMN `is_system` int(1) NOT NULL DEFAULT '0' AFTER `id`;");



  $this->db->query("ALTER TABLE `income`  
  ADD COLUMN `invoice_no` varchar(200) NOT NULL AFTER `name`;");



   $this->db->query("ALTER TABLE `read_notification`   
  ADD COLUMN `staff_id` int(11) NULL AFTER `parent_id` ;");



  $this->db->query("ALTER TABLE `sch_settings` 
  ADD COLUMN `cron_secret_key` varchar(100) NOT NULL AFTER `updated_at`,
  ADD COLUMN `fee_due_days` int(3) NULL DEFAULT '0' AFTER `cron_secret_key`,
  ADD COLUMN `class_teacher` varchar(100) NOT NULL DEFAULT 'no' AFTER `fee_due_days`;");


  $this->db->query("ALTER TABLE `send_notification`   
  ADD COLUMN `visible_staff` varchar(10) NOT NULL DEFAULT 'no' AFTER `visible_student`;");


   $this->db->query("ALTER TABLE `student_attendences`   
  ADD COLUMN `remark` varchar(200) NOT NULL AFTER `attendence_type_id`;");




 $this->db->query("ALTER TABLE  `student_session` 
  ADD COLUMN  `hostel_room_id` int(11) NOT NULL AFTER `route_id`;");


 $this->db->query("ALTER TABLE  `students` 
  ADD COLUMN `route_id` int(11) NOT NULL  AFTER `category_id`,
  ADD COLUMN `school_house_id` int(11) NOT NULL AFTER `route_id`,
  ADD COLUMN `blood_group` varchar(200) NOT NULL AFTER `school_house_id`,
  ADD COLUMN `vehroute_id` int(11) NOT NULL AFTER `blood_group`,
  ADD COLUMN `hostel_room_id` int(11) NOT NULL AFTER `vehroute_id`,
  ADD COLUMN `parent_id` int(11) NOT NULL  AFTER `id`,
  ADD COLUMN `father_pic` varchar(200) NOT NULL AFTER `guardian_email`,
  ADD COLUMN `mother_pic` varchar(200) NOT NULL AFTER `father_pic`,
  ADD COLUMN `guardian_pic` varchar(200) NOT NULL AFTER `mother_pic`, 
  ADD COLUMN `height` varchar(100) NOT NULL AFTER `previous_school`,
  ADD COLUMN `weight` varchar(100) NOT NULL AFTER `height`,
  ADD COLUMN `measurement_date` date NOT NULL AFTER `weight`,
  ADD COLUMN `disable_at` date NOT NULL AFTER `updated_at`,
  ADD COLUMN `note` varchar(200) NOT NULL AFTER `disable_at`;");



   $this->db->query("ALTER TABLE `student_fees_master` 
  ADD COLUMN `is_system` int(1) NOT NULL DEFAULT '0' AFTER `id`,  
  ADD COLUMN `amount` float(10,2) NULL DEFAULT 0.00 AFTER `fee_session_group_id`;");


 $this->db->query("ALTER TABLE `send_notification` 
DROP COLUMN `visible_teacher`;");


  $this->db->query("INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES
(1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2018-04-20 14:54:49'),
(2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2018-04-20 14:54:55');");




  $this->db->query("INSERT INTO `payment_settings` (`id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'paypal', '', '', '', '', '', '', NULL, '', '', 'yes', '2018-07-12 05:26:13', '0000-00-00 00:00:00'),
(2, 'stripe', NULL, '', '', '', NULL, NULL, NULL, '', '', 'no', '2018-07-12 05:26:26', '0000-00-00 00:00:00'),
(3, 'payu', NULL, '', '', '', NULL, NULL, NULL, '', '', 'no', '2018-07-12 05:26:35', '0000-00-00 00:00:00'),
(4, 'ccavenue', NULL, '', '', '', NULL, NULL, NULL, '', '', 'no', '2018-07-12 05:26:45', '0000-00-00 00:00:00');");


  $this->db->query("INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES
(1, 1, 'Student', 'student', 1, 1, 1, 1, '2018-06-22 15:47:11'),
(2, 1, 'Import Student', 'import_student', 1, 0, 0, 0, '2018-06-22 15:47:19'),
(3, 1, 'Student Categories', 'student_categories', 1, 1, 1, 1, '2018-06-22 15:47:36'),
(4, 1, 'Student Houses', 'student_houses', 1, 1, 1, 1, '2018-06-22 15:47:53'),
(5, 2, 'Collect Fees', 'collect_fees', 1, 1, 0, 1, '2018-06-22 15:51:03'),
(6, 2, 'Fees Carry Forward', 'fees_carry_forward', 1, 0, 0, 0, '2018-06-27 05:48:15'),
(7, 2, 'Fees Master', 'fees_master', 1, 1, 1, 1, '2018-06-27 05:48:57'),
(8, 2, 'Fees Group', 'fees_group', 1, 1, 1, 1, '2018-06-22 15:51:46'),
(9, 3, 'Income', 'income', 1, 1, 1, 1, '2018-06-22 15:53:21'),
(10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2018-06-22 15:52:44'),
(11, 3, 'Search Income', 'search_income', 1, 0, 0, 0, '2018-06-22 15:53:00'),
(12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2018-06-22 15:54:06'),
(13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2018-06-22 15:53:47'),
(14, 4, 'Search Expense', 'search_expense', 1, 0, 0, 0, '2018-06-22 15:54:13'),
(15, 5, 'Student Attendance', 'student_attendance', 1, 1, 1, 0, '2018-06-22 15:54:49'),
(16, 5, 'Student Attendance Report', 'student_attendance_report', 1, 0, 0, 0, '2018-06-22 15:54:26'),
(17, 6, 'Exam', 'exam', 1, 1, 1, 1, '2018-06-22 15:56:02'),
(19, 6, 'Marks Register', 'marks_register', 1, 1, 1, 0, '2018-06-22 15:56:19'),
(20, 6, 'Marks Grade', 'marks_grade', 1, 1, 1, 1, '2018-06-22 15:55:25'),
(21, 7, 'Class Timetable', 'class_timetable', 1, 1, 1, 0, '2018-06-22 16:01:36'),
(22, 7, 'Assign Subject', 'assign_subject', 1, 1, 1, 1, '2018-06-22 16:01:57'),
(23, 7, 'Subject', 'subject', 1, 1, 1, 1, '2018-06-22 16:02:17'),
(24, 7, 'Class', 'class', 1, 1, 1, 1, '2018-06-22 16:02:35'),
(25, 7, 'Section', 'section', 1, 1, 1, 1, '2018-06-22 16:01:10'),
(26, 7, 'Promote Student', 'promote_student', 1, 0, 0, 0, '2018-06-22 16:02:47'),
(27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1, '2018-06-22 16:03:19'),
(28, 9, 'Books', 'books', 1, 1, 1, 1, '2018-06-22 16:04:04'),
(29, 9, 'Issue Return Student', 'issue_return', 1, 0, 0, 0, '2018-06-22 16:03:41'),
(30, 9, 'Add Staff Member', 'add_staff_member', 1, 0, 0, 0, '2018-07-02 17:07:00'),
(31, 10, 'Issue Item', 'issue_item', 1, 0, 0, 0, '2018-06-22 16:04:51'),
(32, 10, 'Item Stock', 'item_stock', 1, 1, 1, 1, '2018-06-22 16:05:17'),
(33, 10, 'Item', 'item', 1, 1, 1, 1, '2018-06-22 16:05:40'),
(34, 10, 'Store', 'store', 1, 1, 1, 1, '2018-06-22 16:06:02'),
(35, 10, 'Supplier', 'supplier', 1, 1, 1, 1, '2018-06-22 16:06:25'),
(37, 11, 'Routes', 'routes', 1, 1, 1, 1, '2018-06-22 16:09:17'),
(38, 11, 'Vehicle', 'vehicle', 1, 1, 1, 1, '2018-06-22 16:09:36'),
(39, 11, 'Assign Vehicle', 'assign_vehicle', 1, 1, 1, 1, '2018-06-27 10:09:20'),
(40, 12, 'Hostel', 'hostel', 1, 1, 1, 1, '2018-06-22 16:10:49'),
(41, 12, 'Room Type', 'room_type', 1, 1, 1, 1, '2018-06-22 16:10:27'),
(42, 12, 'Hostel Rooms', 'hostel_rooms', 1, 1, 1, 1, '2018-06-25 11:53:03'),
(43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2018-06-22 16:11:17'),
(44, 13, 'Email / SMS', 'email_sms', 1, 0, 0, 0, '2018-06-22 16:10:54'),
(46, 13, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-06-22 16:11:23'),
(47, 1, 'Student Report', 'student_report', 1, 0, 0, 0, '2018-07-03 16:19:36'),
(48, 14, 'Transaction Report', 'transaction_report', 1, 0, 0, 0, '2018-07-06 17:13:32'),
(49, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2018-07-06 17:13:53'),
(53, 15, 'Languages', 'languages', 0, 1, 0, 0, '2018-06-22 16:13:18'),
(54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2018-07-05 14:38:35'),
(55, 15, 'Session Setting', 'session_setting', 1, 1, 1, 1, '2018-06-22 16:14:15'),
(56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2018-07-05 14:38:41'),
(57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2018-07-05 14:38:47'),
(58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2018-07-05 14:38:51'),
(59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2018-07-05 14:38:55'),
(60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2018-07-05 14:38:59'),
(61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2018-07-09 09:20:06'),
(62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2018-07-09 09:20:26'),
(63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2018-06-22 16:16:02'),
(64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2018-06-22 16:16:21'),
(65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2018-06-22 16:17:02'),
(66, 16, 'Event', 'event', 1, 1, 1, 1, '2018-06-22 16:17:20'),
(67, 16, 'News', 'notice', 1, 1, 1, 1, '2018-07-03 14:09:34'),
(68, 2, 'Fees Group Assign', 'fees_group_assign', 1, 0, 0, 0, '2018-06-22 15:50:42'),
(69, 2, 'Fees Type', 'fees_type', 1, 1, 1, 1, '2018-06-22 15:49:34'),
(70, 2, 'Fees Discount', 'fees_discount', 1, 1, 1, 1, '2018-06-22 15:50:10'),
(71, 2, 'Fees Discount Assign', 'fees_discount_assign', 1, 0, 0, 0, '2018-06-22 15:50:17'),
(72, 2, 'Fees Statement', 'fees_statement', 1, 0, 0, 0, '2018-06-22 15:48:56'),
(73, 2, 'Search Fees Payment', 'search_fees_payment', 1, 0, 0, 0, '2018-06-22 15:50:27'),
(74, 2, 'Search Due Fees', 'search_due_fees', 1, 0, 0, 0, '2018-06-22 15:50:35'),
(75, 2, 'Balance Fees Report', 'balance_fees_report', 1, 0, 0, 0, '2018-06-22 15:48:50'),
(76, 6, 'Exam Schedule', 'exam_schedule', 1, 1, 1, 0, '2018-06-22 15:55:40'),
(77, 7, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2018-06-22 16:00:52'),
(78, 17, 'Admission Enquiry', 'admission_enquiry', 1, 1, 1, 1, '2018-06-22 16:21:24'),
(79, 17, 'Follow Up Admission Enquiry', 'follow_up_admission_enquiry', 1, 1, 0, 1, '2018-06-22 16:21:39'),
(80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2018-06-22 16:18:58'),
(81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2018-06-22 16:20:57'),
(82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2018-06-22 16:20:21'),
(83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2018-06-22 16:20:04'),
(84, 17, 'Complain', 'complaint', 1, 1, 1, 1, '2018-07-03 14:10:55'),
(85, 17, 'Setup Font Office', 'setup_font_office', 1, 1, 1, 1, '2018-06-22 16:19:24'),
(86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2018-06-22 16:23:31'),
(87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2018-06-22 16:23:12'),
(88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2018-06-22 16:23:10'),
(89, 18, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2018-06-22 16:22:54'),
(90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1, '2018-06-22 16:22:51'),
(91, 18, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2018-06-22 16:22:34'),
(93, 19, 'Homework', 'homework', 1, 1, 1, 1, '2018-06-22 16:23:50'),
(94, 19, 'Homework Evaluation', 'homework_evaluation', 1, 1, 0, 0, '2018-06-27 08:37:21'),
(95, 19, 'Homework Report', 'homework_report', 1, 0, 0, 0, '2018-06-22 16:23:54'),
(96, 20, 'Student Certificate', 'student_certificate', 1, 1, 1, 1, '2018-07-06 16:11:07'),
(97, 20, 'Generate Certificate', 'generate_certificate', 1, 0, 0, 0, '2018-07-06 16:07:16'),
(98, 20, 'Student ID Card', 'student_id_card', 1, 1, 1, 1, '2018-07-06 16:11:28'),
(99, 20, 'Generate ID Card', 'generate_id_card', 1, 0, 0, 0, '2018-07-06 16:11:49'),
(102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2018-06-22 16:24:41'),
(104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2018-06-22 16:04:33'),
(105, 1, 'Student Parent Login Details', 'student_parent_login_details', 1, 0, 0, 0, '2018-06-22 15:48:01'),
(106, 22, 'Quick Session Change', 'quick_session_change', 1, 0, 0, 0, '2018-06-22 16:24:45'),
(107, 1, 'Disable Student', 'disable_student', 1, 0, 0, 0, '2018-06-25 11:51:34'),
(108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 1, 1, 1, '2018-07-02 15:47:41'),
(109, 18, 'Apply Leave', 'apply_leave', 1, 1, 1, 1, '2018-06-26 09:23:32'),
(110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1, '2018-07-02 15:47:56'),
(111, 18, 'Department', 'department', 1, 1, 1, 1, '2018-06-26 09:27:07'),
(112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2018-06-26 09:27:07'),
(113, 22, 'Fees Collection And Expense Monthly Chart', 'fees_collection_and_expense_monthly_chart', 1, 0, 0, 0, '2018-07-03 12:38:15'),
(114, 22, 'Fees Collection And Expense Yearly Chart', 'fees_collection_and_expense_yearly_chart', 1, 0, 0, 0, '2018-07-03 12:38:15'),
(115, 22, 'Monthly Fees Collection Widget', 'Monthly fees_collection_widget', 1, 0, 0, 0, '2018-07-03 12:43:35'),
(116, 22, 'Monthly Expense Widget', 'monthly_expense_widget', 1, 0, 0, 0, '2018-07-03 12:43:35'),
(117, 22, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2018-07-03 12:43:35'),
(118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2018-07-03 12:43:35'),
(119, 1, 'Guardian Report', 'guardian_report', 1, 0, 0, 0, '2018-07-03 14:12:29'),
(120, 1, 'Student History', 'student_history', 1, 0, 0, 0, '2018-07-03 14:12:29'),
(121, 1, 'Student Login Credential', 'student_login_credential', 1, 0, 0, 0, '2018-07-03 14:12:29'),
(122, 5, 'Attendance By Date', 'attendance_by_date', 1, 0, 0, 0, '2018-07-03 14:12:29'),
(123, 9, 'Add Student', 'add_student', 1, 0, 0, 0, '2018-07-03 14:12:29'),
(124, 11, 'Student Transport Report', 'student_transport_report', 1, 0, 0, 0, '2018-07-03 14:12:29'),
(125, 12, 'Student Hostel Report', 'student_hostel_report', 1, 0, 0, 0, '2018-07-03 14:12:29'),
(126, 15, 'User Status', 'user_status', 1, 0, 0, 0, '2018-07-03 14:12:29'),
(127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2018-07-03 14:12:29'),
(128, 1, 'Student Timeline', 'student_timeline', 0, 1, 0, 1, '2018-07-05 13:38:52'),
(129, 18, 'Staff Timeline', 'staff_timeline', 0, 1, 0, 1, '2018-07-05 13:38:52'),
(130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2018-07-09 09:47:17'),
(131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2018-07-09 09:47:17');");



  $this->db->query("INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES
(1, 'Student Information', 'student_information', 1, 1, '2018-06-27 09:09:31'),
(2, 'Fees Collection', 'fees_collection', 1, 0, '2018-07-11 08:19:10'),
(3, 'Income', 'income', 1, 0, '2018-06-27 06:19:05'),
(4, 'Expense', 'expense', 1, 0, '2018-07-04 07:07:33'),
(5, 'Student Attendance', 'student_attendance', 1, 0, '2018-07-02 13:18:08'),
(6, 'Examination', 'examination', 1, 0, '2018-07-11 08:19:08'),
(7, 'Academics', 'academics', 1, 1, '2018-07-02 12:55:43'),
(8, 'Download Center', 'download_center', 1, 0, '2018-07-02 13:19:29'),
(9, 'Library', 'library', 1, 0, '2018-06-28 16:43:14'),
(10, 'Inventory', 'inventory', 1, 0, '2018-06-27 06:18:58'),
(11, 'Transport', 'transport', 1, 0, '2018-06-27 13:21:26'),
(12, 'Hostel', 'hostel', 1, 0, '2018-07-02 13:19:32'),
(13, 'Communicate', 'communicate', 1, 0, '2018-07-02 13:20:00'),
(14, 'Reports', 'reports', 1, 1, '2018-06-27 09:10:22'),
(15, 'System Settings', 'system_settings', 1, 1, '2018-06-27 09:10:28'),
(16, 'Front CMS', 'front_cms', 1, 0, '2018-07-10 10:46:54'),
(17, 'Front Office', 'front_office', 1, 0, '2018-06-27 09:15:30'),
(18, 'Human Resource', 'human_resource', 1, 1, '2018-06-27 09:11:02'),
(19, 'Homework', 'homework', 1, 0, '2018-06-27 06:19:38'),
(20, 'Certificate', 'certificate', 1, 0, '2018-06-27 13:21:29'),
(21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '2018-06-27 09:12:25'),
(22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, '2018-06-27 09:11:17');");


  $this->db->query("INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, 0, 1, 0, '2018-06-30 15:39:11', '0000-00-00 00:00:00'),
(2, 'Teacher', NULL, 0, 1, 0, '2018-06-30 15:39:14', '0000-00-00 00:00:00'),
(3, 'Accountant', NULL, 0, 1, 0, '2018-06-30 15:39:17', '0000-00-00 00:00:00'),
(4, 'Librarian', NULL, 0, 1, 0, '2018-06-30 15:39:21', '0000-00-00 00:00:00'),
(6, 'Receptionist', NULL, 0, 1, 0, '2018-07-02 05:39:03', '0000-00-00 00:00:00'),
(7, 'Super Admin', NULL, 0, 1, 1, '2018-07-11 14:11:29', '0000-00-00 00:00:00');");


  $this->db->query("INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES
(3, 1, 3, 1, 1, 1, 1, '2018-07-06 15:12:08'),
(4, 1, 4, 1, 1, 1, 1, '2018-07-06 15:13:01'),
(6, 1, 5, 1, 1, 0, 1, '2018-07-02 16:49:46'),
(8, 1, 7, 1, 1, 1, 1, '2018-07-06 15:13:29'),
(9, 1, 8, 1, 1, 1, 1, '2018-07-06 15:13:53'),
(10, 1, 17, 1, 1, 1, 1, '2018-07-06 15:18:56'),
(11, 1, 78, 1, 1, 1, 1, '2018-07-03 06:19:43'),
(13, 1, 69, 1, 1, 1, 1, '2018-07-06 15:14:15'),
(14, 1, 70, 1, 1, 1, 1, '2018-07-06 15:14:39'),
(23, 1, 12, 1, 1, 1, 1, '2018-07-06 15:15:38'),
(24, 1, 13, 1, 1, 1, 1, '2018-07-06 15:18:28'),
(26, 1, 15, 1, 1, 1, 0, '2018-07-02 16:54:21'),
(28, 1, 19, 1, 1, 1, 0, '2018-07-02 17:01:10'),
(29, 1, 20, 1, 1, 1, 1, '2018-07-06 15:19:50'),
(30, 1, 76, 1, 1, 1, 0, '2018-07-02 17:01:10'),
(31, 1, 21, 1, 1, 1, 0, '2018-07-02 17:01:38'),
(32, 1, 22, 1, 1, 1, 1, '2018-07-02 17:02:05'),
(33, 1, 23, 1, 1, 1, 1, '2018-07-06 15:20:17'),
(34, 1, 24, 1, 1, 1, 1, '2018-07-06 15:20:39'),
(35, 1, 25, 1, 1, 1, 1, '2018-07-06 15:22:35'),
(37, 1, 77, 1, 1, 1, 1, '2018-07-06 15:19:50'),
(43, 1, 32, 1, 1, 1, 1, '2018-07-06 15:52:05'),
(44, 1, 33, 1, 1, 1, 1, '2018-07-06 15:52:29'),
(45, 1, 34, 1, 1, 1, 1, '2018-07-06 15:53:59'),
(46, 1, 35, 1, 1, 1, 1, '2018-07-06 15:54:34'),
(47, 1, 104, 1, 1, 1, 1, '2018-07-06 15:53:08'),
(48, 1, 37, 1, 1, 1, 1, '2018-07-06 15:55:30'),
(49, 1, 38, 1, 1, 1, 1, '2018-07-09 10:45:27'),
(53, 1, 43, 1, 1, 1, 1, '2018-07-10 15:00:31'),
(58, 1, 52, 1, 1, 0, 1, '2018-07-09 08:49:43'),
(61, 1, 55, 1, 1, 1, 1, '2018-07-02 14:54:16'),
(67, 1, 61, 1, 1, 0, 1, '2018-07-09 11:29:19'),
(68, 1, 62, 1, 1, 0, 1, '2018-07-09 11:29:19'),
(69, 1, 63, 1, 1, 0, 1, '2018-07-09 09:21:38'),
(70, 1, 64, 1, 1, 1, 1, '2018-07-09 08:32:19'),
(71, 1, 65, 1, 1, 1, 1, '2018-07-09 08:41:21'),
(72, 1, 66, 1, 1, 1, 1, '2018-07-09 08:43:09'),
(73, 1, 67, 1, 1, 1, 1, '2018-07-09 08:44:47'),
(74, 1, 79, 1, 1, 0, 1, '2018-07-02 17:34:53'),
(75, 1, 80, 1, 1, 1, 1, '2018-07-06 15:11:23'),
(76, 1, 81, 1, 1, 1, 1, '2018-07-06 15:11:23'),
(78, 1, 83, 1, 1, 1, 1, '2018-07-06 15:11:23'),
(79, 1, 84, 1, 1, 1, 1, '2018-07-06 15:11:23'),
(80, 1, 85, 1, 1, 1, 1, '2018-07-12 05:46:00'),
(83, 1, 88, 1, 1, 1, 0, '2018-07-03 17:34:20'),
(87, 1, 92, 1, 1, 1, 1, '2018-06-26 09:03:43'),
(88, 1, 93, 1, 1, 1, 1, '2018-07-09 06:54:20'),
(94, 1, 82, 1, 1, 1, 1, '2018-07-06 15:11:23'),
(120, 1, 39, 1, 1, 1, 1, '2018-07-06 15:56:28'),
(140, 1, 110, 1, 1, 1, 1, '2018-07-06 15:25:08'),
(141, 1, 111, 1, 1, 1, 1, '2018-07-06 15:26:28'),
(142, 1, 112, 1, 1, 1, 1, '2018-07-06 15:26:28'),
(145, 1, 94, 1, 1, 0, 0, '2018-07-09 06:50:40'),
(147, 2, 43, 1, 1, 1, 1, '2018-06-30 13:16:24'),
(148, 2, 44, 1, 0, 0, 0, '2018-06-27 16:47:09'),
(149, 2, 46, 1, 0, 0, 0, '2018-06-28 05:56:41'),
(156, 1, 9, 1, 1, 1, 1, '2018-07-06 15:14:53'),
(157, 1, 10, 1, 1, 1, 1, '2018-07-06 15:15:12'),
(159, 1, 40, 1, 1, 1, 1, '2018-07-09 10:39:40'),
(160, 1, 41, 1, 1, 1, 1, '2018-07-06 15:57:09'),
(161, 1, 42, 1, 1, 1, 1, '2018-07-09 10:43:14'),
(169, 1, 27, 1, 1, 0, 1, '2018-07-02 17:06:58'),
(178, 1, 54, 1, 0, 1, 0, '2018-07-05 14:39:22'),
(179, 1, 56, 1, 0, 1, 0, '2018-07-05 14:39:22'),
(180, 1, 57, 1, 0, 1, 0, '2018-07-05 14:39:22'),
(181, 1, 58, 1, 0, 1, 0, '2018-07-05 14:39:22'),
(182, 1, 59, 1, 0, 1, 0, '2018-07-05 14:39:22'),
(183, 1, 60, 1, 0, 1, 0, '2018-07-05 14:39:22'),
(190, 1, 105, 1, 0, 0, 0, '2018-07-02 16:43:25'),
(193, 1, 6, 1, 0, 0, 0, '2018-07-02 16:49:46'),
(194, 1, 68, 1, 0, 0, 0, '2018-07-02 16:49:46'),
(196, 1, 72, 1, 0, 0, 0, '2018-07-02 16:49:46'),
(197, 1, 73, 1, 0, 0, 0, '2018-07-02 16:49:46'),
(198, 1, 74, 1, 0, 0, 0, '2018-07-02 16:49:46'),
(199, 1, 75, 1, 0, 0, 0, '2018-07-02 16:49:46'),
(201, 1, 14, 1, 0, 0, 0, '2018-07-02 16:52:03'),
(203, 1, 16, 1, 0, 0, 0, '2018-07-02 16:54:21'),
(204, 1, 26, 1, 0, 0, 0, '2018-07-02 17:02:05'),
(206, 1, 29, 1, 0, 0, 0, '2018-07-02 17:13:54'),
(207, 1, 30, 1, 0, 0, 0, '2018-07-02 17:13:54'),
(208, 1, 31, 1, 0, 0, 0, '2018-07-02 17:15:36'),
(215, 1, 50, 1, 0, 0, 0, '2018-07-02 17:34:53'),
(216, 1, 51, 1, 0, 0, 0, '2018-07-02 17:34:53'),
(222, 1, 1, 1, 1, 1, 1, '2018-07-10 15:00:31'),
(225, 1, 108, 1, 1, 1, 1, '2018-07-09 07:47:26'),
(227, 1, 91, 1, 0, 0, 0, '2018-07-03 07:19:27'),
(229, 1, 89, 1, 0, 0, 0, '2018-07-03 07:30:53'),
(230, 10, 53, 0, 1, 0, 0, '2018-07-03 09:22:55'),
(231, 10, 54, 0, 0, 1, 0, '2018-07-03 09:22:55'),
(232, 10, 55, 1, 1, 1, 1, '2018-07-03 09:28:42'),
(233, 10, 56, 0, 0, 1, 0, '2018-07-03 09:22:55'),
(235, 10, 58, 0, 0, 1, 0, '2018-07-03 09:22:55'),
(236, 10, 59, 0, 0, 1, 0, '2018-07-03 09:22:55'),
(239, 10, 1, 1, 1, 1, 1, '2018-07-03 09:46:43'),
(241, 10, 3, 1, 0, 0, 0, '2018-07-03 09:53:56'),
(242, 10, 2, 1, 0, 0, 0, '2018-07-03 09:54:39'),
(243, 10, 4, 1, 0, 1, 1, '2018-07-03 10:01:24'),
(245, 10, 107, 1, 0, 0, 0, '2018-07-03 10:06:41'),
(246, 10, 5, 1, 1, 0, 1, '2018-07-03 10:08:18'),
(247, 10, 7, 1, 1, 1, 1, '2018-07-03 10:12:07'),
(248, 10, 68, 1, 0, 0, 0, '2018-07-03 10:12:53'),
(249, 10, 69, 1, 1, 1, 1, '2018-07-03 10:19:46'),
(250, 10, 70, 1, 0, 0, 1, '2018-07-03 10:22:40'),
(251, 10, 72, 1, 0, 0, 0, '2018-07-03 10:26:46'),
(252, 10, 73, 1, 0, 0, 0, '2018-07-03 10:26:46'),
(253, 10, 74, 1, 0, 0, 0, '2018-07-03 10:28:34'),
(254, 10, 75, 1, 0, 0, 0, '2018-07-03 10:28:34'),
(255, 10, 9, 1, 1, 1, 1, '2018-07-03 10:32:22'),
(256, 10, 10, 1, 1, 1, 1, '2018-07-03 10:33:09'),
(257, 10, 11, 1, 0, 0, 0, '2018-07-03 10:33:09'),
(258, 10, 12, 1, 1, 1, 1, '2018-07-03 10:38:40'),
(259, 10, 13, 1, 1, 1, 1, '2018-07-03 10:38:40'),
(260, 10, 14, 1, 0, 0, 0, '2018-07-03 10:38:53'),
(261, 10, 15, 1, 1, 1, 0, '2018-07-03 10:41:28'),
(262, 10, 16, 1, 0, 0, 0, '2018-07-03 10:42:12'),
(263, 10, 17, 1, 1, 1, 1, '2018-07-03 10:44:30'),
(264, 10, 19, 1, 1, 1, 0, '2018-07-03 10:45:45'),
(265, 10, 20, 1, 1, 1, 1, '2018-07-03 10:48:51'),
(266, 10, 76, 1, 0, 0, 0, '2018-07-03 10:51:21'),
(267, 10, 21, 1, 1, 1, 0, '2018-07-03 10:52:45'),
(268, 10, 22, 1, 1, 1, 1, '2018-07-03 10:55:00'),
(269, 10, 23, 1, 1, 1, 1, '2018-07-03 10:57:16'),
(270, 10, 24, 1, 1, 1, 1, '2018-07-03 10:57:49'),
(271, 10, 25, 1, 1, 1, 1, '2018-07-03 10:57:49'),
(272, 10, 26, 1, 0, 0, 0, '2018-07-03 10:58:25'),
(273, 10, 77, 1, 1, 1, 1, '2018-07-03 10:59:57'),
(274, 10, 27, 1, 1, 0, 1, '2018-07-03 11:00:36'),
(275, 10, 28, 1, 1, 1, 1, '2018-07-03 11:03:09'),
(276, 10, 29, 1, 0, 0, 0, '2018-07-03 11:04:03'),
(277, 10, 30, 1, 0, 0, 0, '2018-07-03 11:04:03'),
(278, 10, 31, 1, 0, 0, 0, '2018-07-03 11:04:03'),
(279, 10, 32, 1, 1, 1, 1, '2018-07-03 11:05:42'),
(280, 10, 33, 1, 1, 1, 1, '2018-07-03 11:06:32'),
(281, 10, 34, 1, 1, 1, 1, '2018-07-03 11:08:03'),
(282, 10, 35, 1, 1, 1, 1, '2018-07-03 11:08:41'),
(283, 10, 104, 1, 1, 1, 1, '2018-07-03 11:10:43'),
(284, 10, 37, 1, 1, 1, 1, '2018-07-03 11:12:42'),
(285, 10, 38, 1, 1, 1, 1, '2018-07-03 11:13:56'),
(286, 10, 39, 1, 1, 1, 1, '2018-07-03 11:15:39'),
(287, 10, 40, 1, 1, 1, 1, '2018-07-03 11:17:22'),
(288, 10, 41, 1, 1, 1, 1, '2018-07-03 11:18:54'),
(289, 10, 42, 1, 1, 1, 1, '2018-07-03 11:19:31'),
(290, 10, 43, 1, 1, 1, 1, '2018-07-03 11:21:15'),
(291, 10, 44, 1, 0, 0, 0, '2018-07-03 11:22:06'),
(292, 10, 46, 1, 0, 0, 0, '2018-07-03 11:22:06'),
(293, 10, 50, 1, 0, 0, 0, '2018-07-03 11:22:59'),
(294, 10, 51, 1, 0, 0, 0, '2018-07-03 11:22:59'),
(295, 10, 60, 0, 0, 1, 0, '2018-07-03 11:25:05'),
(296, 10, 61, 1, 1, 1, 1, '2018-07-03 11:26:52'),
(297, 10, 62, 1, 1, 1, 1, '2018-07-03 11:28:53'),
(298, 10, 63, 1, 1, 0, 0, '2018-07-03 11:29:37'),
(299, 10, 64, 1, 1, 1, 1, '2018-07-03 11:30:27'),
(300, 10, 65, 1, 1, 1, 1, '2018-07-03 11:32:51'),
(301, 10, 66, 1, 1, 1, 1, '2018-07-03 11:32:51'),
(302, 10, 67, 1, 0, 0, 0, '2018-07-03 11:32:51'),
(303, 10, 78, 1, 1, 1, 1, '2018-07-04 09:40:04'),
(307, 1, 126, 1, 0, 0, 0, '2018-07-03 14:56:13'),
(310, 1, 119, 1, 0, 0, 0, '2018-07-03 15:45:00'),
(311, 1, 120, 1, 0, 0, 0, '2018-07-03 15:45:00'),
(312, 1, 107, 1, 0, 0, 0, '2018-07-03 15:45:12'),
(313, 1, 122, 1, 0, 0, 0, '2018-07-03 15:49:37'),
(315, 1, 123, 1, 0, 0, 0, '2018-07-03 15:57:03'),
(317, 1, 124, 1, 0, 0, 0, '2018-07-03 15:59:14'),
(320, 1, 47, 1, 0, 0, 0, '2018-07-03 16:31:12'),
(321, 1, 121, 1, 0, 0, 0, '2018-07-03 16:31:12'),
(322, 1, 109, 1, 1, 1, 1, '2018-07-03 16:40:54'),
(369, 1, 102, 1, 1, 1, 1, '2018-07-11 17:31:47'),
(372, 10, 79, 1, 1, 0, 0, '2018-07-04 09:40:04'),
(373, 10, 80, 1, 1, 1, 1, '2018-07-04 09:53:09'),
(374, 10, 81, 1, 1, 1, 1, '2018-07-04 09:53:50'),
(375, 10, 82, 1, 1, 1, 1, '2018-07-04 09:56:54'),
(376, 10, 83, 1, 1, 1, 1, '2018-07-04 09:57:55'),
(377, 10, 84, 1, 1, 1, 1, '2018-07-04 10:00:26'),
(378, 10, 85, 1, 1, 1, 1, '2018-07-04 10:02:54'),
(379, 10, 86, 1, 1, 1, 1, '2018-07-04 10:16:18'),
(380, 10, 87, 1, 0, 0, 0, '2018-07-04 10:19:49'),
(381, 10, 88, 1, 1, 1, 0, '2018-07-04 10:21:20'),
(382, 10, 89, 1, 0, 0, 0, '2018-07-04 10:21:51'),
(383, 10, 90, 1, 1, 0, 1, '2018-07-04 10:25:01'),
(384, 10, 91, 1, 0, 0, 0, '2018-07-04 10:25:01'),
(385, 10, 108, 1, 1, 1, 1, '2018-07-04 10:27:46'),
(386, 10, 109, 1, 1, 1, 1, '2018-07-04 10:28:26'),
(387, 10, 110, 1, 1, 1, 1, '2018-07-04 10:32:43'),
(388, 10, 111, 1, 1, 1, 1, '2018-07-04 10:33:21'),
(389, 10, 112, 1, 1, 1, 1, '2018-07-04 10:35:06'),
(390, 10, 127, 1, 0, 0, 0, '2018-07-04 10:35:06'),
(391, 10, 93, 1, 1, 1, 1, '2018-07-04 10:37:14'),
(392, 10, 94, 1, 1, 0, 0, '2018-07-04 10:38:02'),
(394, 10, 95, 1, 0, 0, 0, '2018-07-04 10:38:44'),
(395, 10, 102, 1, 1, 1, 1, '2018-07-04 10:41:02'),
(396, 10, 106, 1, 0, 0, 0, '2018-07-04 10:41:39'),
(397, 10, 113, 1, 0, 0, 0, '2018-07-04 10:42:37'),
(398, 10, 114, 1, 0, 0, 0, '2018-07-04 10:42:37'),
(399, 10, 115, 1, 0, 0, 0, '2018-07-04 10:48:45'),
(400, 10, 116, 1, 0, 0, 0, '2018-07-04 10:48:45'),
(401, 10, 117, 1, 0, 0, 0, '2018-07-04 10:49:43'),
(402, 10, 118, 1, 0, 0, 0, '2018-07-04 10:49:43'),
(411, 1, 2, 1, 0, 0, 0, '2018-07-04 13:46:10'),
(412, 1, 11, 1, 0, 0, 0, '2018-07-04 14:24:05'),
(416, 2, 3, 1, 1, 1, 1, '2018-07-10 12:17:12'),
(428, 2, 4, 1, 1, 1, 1, '2018-07-05 07:40:38'),
(432, 1, 128, 0, 1, 0, 1, '2018-07-05 13:39:50'),
(434, 1, 125, 1, 0, 0, 0, '2018-07-06 15:29:26'),
(435, 1, 96, 1, 1, 1, 1, '2018-07-09 06:33:54'),
(437, 1, 98, 1, 1, 1, 1, '2018-07-09 06:44:17'),
(444, 1, 99, 1, 0, 0, 0, '2018-07-06 17:11:22'),
(445, 1, 48, 1, 0, 0, 0, '2018-07-06 17:19:35'),
(446, 1, 49, 1, 0, 0, 0, '2018-07-06 17:19:35'),
(448, 1, 71, 1, 0, 0, 0, '2018-07-08 09:17:06'),
(453, 1, 106, 1, 0, 0, 0, '2018-07-09 06:17:33'),
(454, 1, 113, 1, 0, 0, 0, '2018-07-09 06:17:33'),
(455, 1, 114, 1, 0, 0, 0, '2018-07-09 06:17:33'),
(456, 1, 115, 1, 0, 0, 0, '2018-07-09 06:17:33'),
(457, 1, 116, 1, 0, 0, 0, '2018-07-09 06:17:33'),
(458, 1, 117, 1, 0, 0, 0, '2018-07-09 06:17:33'),
(459, 1, 118, 1, 0, 0, 0, '2018-07-09 06:17:33'),
(461, 1, 97, 1, 0, 0, 0, '2018-07-09 06:30:16'),
(462, 1, 95, 1, 0, 0, 0, '2018-07-09 06:48:41'),
(464, 1, 86, 1, 1, 1, 1, '2018-07-09 11:39:48'),
(466, 1, 129, 0, 1, 0, 1, '2018-07-09 07:09:30'),
(467, 1, 87, 1, 0, 0, 0, '2018-07-09 07:11:59'),
(468, 1, 90, 1, 1, 0, 1, '2018-07-09 07:22:50'),
(471, 1, 53, 0, 1, 0, 0, '2018-07-09 08:50:44'),
(474, 1, 130, 1, 1, 0, 1, '2018-07-09 16:26:36'),
(476, 1, 131, 1, 0, 0, 0, '2018-07-09 10:23:32'),
(477, 2, 1, 1, 1, 1, 1, '2018-07-11 12:26:27'),
(478, 2, 2, 1, 0, 0, 0, '2018-07-10 12:17:12'),
(479, 2, 47, 1, 0, 0, 0, '2018-07-10 12:17:12'),
(480, 2, 105, 1, 0, 0, 0, '2018-07-10 12:17:12'),
(482, 2, 119, 1, 0, 0, 0, '2018-07-10 12:17:12'),
(483, 2, 120, 1, 0, 0, 0, '2018-07-10 12:17:12'),
(485, 2, 15, 1, 1, 1, 0, '2018-07-10 12:17:12'),
(486, 2, 16, 1, 0, 0, 0, '2018-07-10 12:17:12'),
(487, 2, 122, 1, 0, 0, 0, '2018-07-10 12:17:12'),
(492, 2, 21, 1, 0, 0, 0, '2018-07-12 05:50:27'),
(493, 2, 22, 1, 0, 0, 0, '2018-07-12 05:50:27'),
(494, 2, 23, 1, 0, 0, 0, '2018-07-12 05:50:27'),
(495, 2, 24, 1, 0, 0, 0, '2018-07-12 05:50:27'),
(496, 2, 25, 1, 0, 0, 0, '2018-07-12 05:50:27'),
(498, 2, 77, 1, 0, 0, 0, '2018-07-12 05:50:27'),
(499, 2, 27, 1, 1, 0, 1, '2018-07-10 12:17:12'),
(502, 2, 93, 1, 1, 1, 1, '2018-07-10 12:17:12'),
(503, 2, 94, 1, 1, 0, 0, '2018-07-10 12:17:12'),
(504, 2, 95, 1, 0, 0, 0, '2018-07-10 12:17:12'),
(505, 3, 5, 1, 1, 0, 1, '2018-07-10 12:37:30'),
(506, 3, 6, 1, 0, 0, 0, '2018-07-10 12:37:30'),
(507, 3, 7, 1, 1, 1, 1, '2018-07-10 12:37:30'),
(508, 3, 8, 1, 1, 1, 1, '2018-07-10 12:37:30'),
(509, 3, 68, 1, 0, 0, 0, '2018-07-10 12:37:30'),
(510, 3, 69, 1, 1, 1, 1, '2018-07-10 12:37:30'),
(511, 3, 70, 1, 1, 1, 1, '2018-07-10 12:37:30'),
(512, 3, 71, 1, 0, 0, 0, '2018-07-10 12:37:30'),
(513, 3, 72, 1, 0, 0, 0, '2018-07-10 12:37:30'),
(514, 3, 73, 1, 0, 0, 0, '2018-07-10 12:37:30'),
(515, 3, 74, 1, 0, 0, 0, '2018-07-10 12:37:30'),
(517, 3, 75, 1, 0, 0, 0, '2018-07-10 12:40:38'),
(518, 3, 9, 1, 1, 1, 1, '2018-07-10 12:40:38'),
(519, 3, 10, 1, 1, 1, 1, '2018-07-10 12:40:38'),
(520, 3, 11, 1, 0, 0, 0, '2018-07-10 12:40:38'),
(521, 3, 12, 1, 1, 1, 1, '2018-07-10 12:47:00'),
(522, 3, 13, 1, 1, 1, 1, '2018-07-10 12:47:00'),
(523, 3, 14, 1, 0, 0, 0, '2018-07-10 12:47:00'),
(524, 3, 86, 1, 1, 1, 1, '2018-07-10 12:48:44'),
(525, 3, 87, 1, 0, 0, 0, '2018-07-10 12:48:44'),
(526, 3, 88, 1, 1, 1, 0, '2018-07-10 12:48:44'),
(527, 3, 89, 1, 0, 0, 0, '2018-07-10 12:48:44'),
(528, 3, 90, 1, 1, 0, 1, '2018-07-10 12:48:44'),
(529, 3, 91, 1, 0, 0, 0, '2018-07-10 12:48:44'),
(530, 3, 108, 1, 1, 1, 1, '2018-07-10 12:48:44'),
(531, 3, 109, 1, 1, 1, 1, '2018-07-10 12:48:44'),
(532, 3, 110, 1, 1, 1, 1, '2018-07-10 12:48:44'),
(533, 3, 111, 1, 1, 1, 1, '2018-07-10 12:48:44'),
(534, 3, 112, 1, 1, 1, 1, '2018-07-10 12:48:44'),
(535, 3, 127, 1, 0, 0, 0, '2018-07-10 12:48:44'),
(536, 3, 129, 0, 1, 0, 1, '2018-07-10 12:48:44'),
(537, 3, 43, 1, 1, 1, 1, '2018-07-10 12:49:49'),
(538, 3, 44, 1, 0, 0, 0, '2018-07-10 12:49:49'),
(539, 3, 46, 1, 0, 0, 0, '2018-07-10 12:49:49'),
(540, 3, 31, 1, 0, 0, 0, '2018-07-10 12:50:38'),
(541, 3, 32, 1, 1, 1, 1, '2018-07-10 12:50:38'),
(542, 3, 33, 1, 1, 1, 1, '2018-07-10 12:50:38'),
(543, 3, 34, 1, 1, 1, 1, '2018-07-10 12:50:38'),
(544, 3, 35, 1, 1, 1, 1, '2018-07-10 12:50:38'),
(545, 3, 104, 1, 1, 1, 1, '2018-07-10 12:50:38'),
(546, 3, 37, 1, 1, 1, 1, '2018-07-10 12:52:17'),
(547, 3, 38, 1, 1, 1, 1, '2018-07-10 12:52:17'),
(548, 3, 39, 1, 1, 1, 1, '2018-07-10 12:52:17'),
(549, 3, 124, 1, 0, 0, 0, '2018-07-10 12:52:17'),
(553, 6, 78, 1, 1, 1, 1, '2018-07-10 13:02:18'),
(554, 6, 79, 1, 1, 0, 1, '2018-07-10 13:02:18'),
(555, 6, 80, 1, 1, 1, 1, '2018-07-10 13:02:18'),
(556, 6, 81, 1, 1, 1, 1, '2018-07-10 13:02:18'),
(557, 6, 82, 1, 1, 1, 1, '2018-07-10 13:02:18'),
(558, 6, 83, 1, 1, 1, 1, '2018-07-10 13:02:18'),
(559, 6, 84, 1, 1, 1, 1, '2018-07-10 13:02:18'),
(560, 6, 85, 1, 1, 1, 1, '2018-07-10 13:02:18'),
(561, 6, 86, 1, 0, 0, 0, '2018-07-10 13:11:10'),
(574, 6, 43, 1, 1, 1, 1, '2018-07-10 13:05:33'),
(575, 6, 44, 1, 0, 0, 0, '2018-07-10 13:05:33'),
(576, 6, 46, 1, 0, 0, 0, '2018-07-10 13:05:33'),
(578, 6, 102, 1, 1, 1, 1, '2018-07-10 13:20:33'),
(579, 4, 28, 1, 1, 1, 1, '2018-07-10 13:23:54'),
(580, 4, 29, 1, 0, 0, 0, '2018-07-10 13:23:54'),
(581, 4, 30, 1, 0, 0, 0, '2018-07-10 13:23:54'),
(582, 4, 123, 1, 0, 0, 0, '2018-07-10 13:23:54'),
(583, 4, 86, 1, 0, 0, 0, '2018-07-10 13:24:13'),
(584, 4, 43, 1, 1, 1, 1, '2018-07-10 13:25:14'),
(585, 4, 44, 1, 0, 0, 0, '2018-07-10 13:25:14'),
(586, 4, 46, 1, 0, 0, 0, '2018-07-10 13:25:14'),
(588, 2, 102, 1, 1, 1, 1, '2018-07-12 05:47:45'),
(589, 2, 106, 1, 0, 0, 0, '2018-07-10 13:25:37'),
(590, 2, 117, 1, 0, 0, 0, '2018-07-10 13:25:37'),
(591, 3, 40, 1, 1, 1, 1, '2018-07-10 13:28:12'),
(592, 3, 41, 1, 1, 1, 1, '2018-07-10 13:28:12'),
(593, 3, 42, 1, 1, 1, 1, '2018-07-10 13:28:12'),
(594, 3, 125, 1, 0, 0, 0, '2018-07-10 13:28:12'),
(595, 3, 48, 1, 0, 0, 0, '2018-07-10 13:28:12'),
(596, 3, 49, 1, 0, 0, 0, '2018-07-10 13:28:12'),
(597, 3, 102, 1, 1, 1, 1, '2018-07-10 13:28:12'),
(598, 3, 106, 1, 0, 0, 0, '2018-07-10 13:28:12'),
(599, 3, 113, 1, 0, 0, 0, '2018-07-10 13:28:12'),
(600, 3, 114, 1, 0, 0, 0, '2018-07-10 13:28:12'),
(601, 3, 115, 1, 0, 0, 0, '2018-07-10 13:28:12'),
(602, 3, 116, 1, 0, 0, 0, '2018-07-10 13:28:12'),
(603, 3, 117, 1, 0, 0, 0, '2018-07-10 13:28:12'),
(604, 3, 118, 1, 0, 0, 0, '2018-07-10 13:28:12'),
(609, 6, 117, 1, 0, 0, 0, '2018-07-10 13:30:48'),
(611, 2, 86, 1, 0, 0, 0, '2018-07-10 13:38:49'),
(612, 1, 44, 1, 0, 0, 0, '2018-07-10 15:00:31'),
(613, 1, 46, 1, 0, 0, 0, '2018-07-10 15:00:31'),
(616, 1, 127, 1, 0, 0, 0, '2018-07-11 08:22:46'),
(617, 2, 17, 1, 1, 1, 1, '2018-07-11 12:25:14'),
(618, 2, 19, 1, 1, 1, 0, '2018-07-11 12:25:14'),
(619, 2, 20, 1, 1, 1, 1, '2018-07-11 12:25:14'),
(620, 2, 76, 1, 1, 1, 0, '2018-07-11 12:25:14'),
(621, 2, 107, 1, 0, 0, 0, '2018-07-11 12:26:27'),
(622, 2, 121, 1, 0, 0, 0, '2018-07-11 12:26:27'),
(623, 2, 128, 0, 1, 0, 1, '2018-07-11 12:26:27'),
(625, 1, 28, 1, 1, 1, 1, '2018-07-11 14:57:18'),
(626, 6, 1, 1, 0, 0, 0, '2018-07-12 05:53:47'),
(627, 6, 21, 1, 0, 0, 0, '2018-07-12 05:53:47'),
(628, 6, 22, 1, 0, 0, 0, '2018-07-12 05:53:47'),
(629, 6, 23, 1, 0, 0, 0, '2018-07-12 05:53:47'),
(630, 6, 24, 1, 0, 0, 0, '2018-07-12 05:53:47'),
(631, 6, 25, 1, 0, 0, 0, '2018-07-12 05:53:47'),
(632, 6, 77, 1, 0, 0, 0, '2018-07-12 05:53:47'),
(633, 6, 106, 1, 0, 0, 0, '2018-07-12 05:53:47'),
(634, 4, 102, 1, 1, 1, 1, '2018-07-12 05:54:23'),
(635, 4, 106, 1, 0, 0, 0, '2018-07-12 05:54:23'),
(636, 4, 117, 1, 0, 0, 0, '2018-07-12 05:54:23');");


        $users_query = "select
        users.id as `parent_id`,
        SUBSTRING_INDEX(SUBSTRING_INDEX(users.childs, ',', numbers.n), ',', -1) `id`
        from
        (select 1 n union all
        select 2 union all select 3 union all
        select 4 union all select 5) numbers INNER JOIN users
        on CHAR_LENGTH(users.childs)
        -CHAR_LENGTH(REPLACE(users.childs, ',', '')) >= numbers.n-1 WHERE role ='parent'
        order by
        id, n";
        $query_query_result = $this->db->query($users_query);

        $res = $query_query_result->result_array();

        $this->db->update_batch('students', $res, 'id');


        $this->db->query('set @row_num = 1000;');
        $query = "select @row_num := @row_num + 1 as employee_id,result.`name`, result.`email`,result.`address`,result.`dob`,result.`sex`,result.`phone`,result.`image`,result.`role` from  (
(select `username` as `name`, `email`,`password`,null as `address`,null as `dob`,null as `sex`,null as `phone`,null as `image`, 'superadmin' as role from admin) 
union
(select `name`,`password`,null as `email`,`address`,`dob`,`sex`,`phone`,`image`, 'accountant' as role from accountants) 
union
(select `name`,`password`,null as `email`,`address`,`dob`,`sex`,`phone`,`image`,'teacher' as role from teachers)
union 
(select `name`,`password`,null as `email`,`address`,`dob`,`sex`,`phone`,`image`,'librarians' as role from librarians)) as result;";
        $query = $this->db->query($query);
        $role_array = array();
        foreach ($query->result() as $result) {
            $staff_array = array(
                'employee_id' => $result->employee_id,
                'name' => $result->name,
                'email' => $result->email,
                'permanent_address' => $result->address,
                'dob' => $result->dob,
                'gender' => $result->sex,
                'contact_no' => $result->phone,
                'image' => $result->image,
                'is_active' => 1
               
            );

            if ($result->role == 'superadmin'){
              $staff_array['password']='$2y$10$ogyKZRN1xK7DMgpa2jMmNO/LbrUJIQkP1UQuleA6r8cR028S0Rnl.';
                  
            }
            
            $this->db->insert('staff', $staff_array);
            $insert_id = $this->db->insert_id();
            if ($result->role == 'superadmin') {
                $role_array[] = array('role_id' => 7, 'staff_id' => $insert_id);
            } elseif ($result->role == 'accountant') {
                $role_array[] = array('role_id' => 3, 'staff_id' => $insert_id);
            } elseif ($result->role == 'teacher') {
                $role_array[] = array('role_id' => 2, 'staff_id' => $insert_id);
            } elseif ($result->role == 'librarians') {
                $role_array[] = array('role_id' => 4, 'staff_id' => $insert_id);
            }
        }
        $this->db->insert_batch('staff_roles', $role_array);
  $this->db->query("INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2018-05-07 01:56:16', '0000-00-00 00:00:00'),
(5, 'Holiday', 'H', 'yes', '0000-00-00 00:00:00', '0000-00-00 00:00:00');");

  $this->db->query("INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES
(1, 'default', 1, 'Home', 'page/home', 'page', 'home', '', '', '', '', '<p>home page</p>', '0000-00-00', 1, NULL, 'no', '2018-07-11 18:04:33'),
(2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<p>\r\n[form-builder:complain]</p>', '0000-00-00', 1, 1, 'no', '2018-05-09 15:14:34'),
(54, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2018-05-18 14:46:04'),
(76, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<title></title>\r\n<section class=\"contact\">\r\n<div class=\"container spacet50 spaceb50\">\r\n<div class=\"row\">\r\n<div class=\"col-md-12 col-sm-12\">[form-builder:contact_us]<!--./row--></div>\r\n<!--./col-md-12--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>', '0000-00-00', 0, NULL, 'no', '2018-07-11 18:03:41');");
        $this->db->query("update  students SET is_active = 'yes';");
        $this->db->query("delete FROM `users` WHERE role not in ('student','parent');");
        $this->db->query("DROP TABLE IF EXISTS `accountants`,`admin`,`lang_keys`,`lang_pharses`,`librarians`,`teachers`;");
       
    }

    public function down() {
        
    }

}
?>