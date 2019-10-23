<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Migration_Version_420 extends CI_Migration {

    public function __construct() {
        parent::__construct();
    }

    public function up() {

        $this->db->query("CREATE TABLE `users_authentication` (
        `id` int(11) NOT NULL auto_increment,
        `users_id` int(11) NOT NULL,
        `token` varchar(250),
        `expired_at` DATETIME NOT NULL,
        `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
        `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
        PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;");

        $this->db->query("ALTER TABLE `events`
        ADD COLUMN `role_id` int(11) DEFAULT NULL AFTER `event_for`;");


        $this->db->query("ALTER TABLE `languages`
        ADD COLUMN `code` varchar(10) DEFAULT NULL AFTER `language`;");

        $this->db->query("ALTER TABLE `notification_setting`
        ADD COLUMN `display_notification` int(11) DEFAULT '0' AFTER `is_sms`,
        ADD COLUMN `is_notification` int(11) DEFAULT '0' AFTER `display_notification`;");

        $this->db->query("ALTER TABLE `sch_settings`
        ADD COLUMN `mobile_api_url` varchar(200) DEFAULT NULL AFTER `class_teacher`,
        ADD COLUMN `app_primary_color_code` varchar(50) DEFAULT NULL AFTER `mobile_api_url`,
        ADD COLUMN `app_secondary_color_code` varchar(50) DEFAULT NULL AFTER `app_primary_color_code`,
        ADD COLUMN `app_logo` varchar(200) DEFAULT NULL AFTER `app_secondary_color_code`;");

        $this->db->query("ALTER TABLE `students`
        ADD COLUMN `app_key` text NOT NULL AFTER `measurement_date`,
        ADD COLUMN `parent_app_key` text NOT NULL AFTER `app_key`;");

		$this->db->query("update notification_setting SET display_notification = 1 WHERE type = 'exam_result';");
        $this->db->query("update notification_setting SET display_notification = 1 WHERE type = 'fee_submission';");
        $this->db->query("update notification_setting SET display_notification = 1 WHERE type = 'absent_attendence';");

        $this->db->query("update sch_settings SET app_primary_color_code = '#880e4f';");
		$this->db->query("update sch_settings SET app_secondary_color_code = '#eeeeee';");
		$this->db->query("update sch_settings SET app_logo = 'default.png';");
    }

    function down() {
        
    }

}
