<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/*
  | -------------------------------------------------------------------
  | AUTO-LOADER
  | -------------------------------------------------------------------
  | This file specifies which systems should be loaded by default.
  |
  | In order to keep the framework as light-weight as possible only the
  | absolute minimal resources are loaded by default. For example,
  | the database is not connected to automatically since no assumption
  | is made regarding whether you intend to use it.  This file lets
  | you globally define which systems you would like loaded with every
  | request.
  |
  | -------------------------------------------------------------------
  | Instructions
  | -------------------------------------------------------------------
  |
  | These are the things you can load automatically:
  |
  | 1. Packages
  | 2. Libraries
  | 3. Drivers
  | 4. Helper files
  | 5. Custom config files
  | 6. Language files
  | 7. Models
  |
 */

/*
  | -------------------------------------------------------------------
  |  Auto-load Packages
  | -------------------------------------------------------------------
  | Prototype:
  |
  |  $autoload['packages'] = array(APPPATH.'third_party', '/usr/local/shared');
  |
 */
$autoload['packages'] = array();

/*
  | -------------------------------------------------------------------
  |  Auto-load Libraries
  | -------------------------------------------------------------------
  | These are the classes located in system/libraries/ or your
  | application/libraries/ directory, with the addition of the
  | 'database' library, which is somewhat of a special case.
  |
  | Prototype:
  |
  |	$autoload['libraries'] = array('database', 'email', 'session');
  |
  | You can also supply an alternative library name to be assigned
  | in the controller:
  |
  |	$autoload['libraries'] = array('user_agent' => 'ua');
 */
$autoload['libraries'] = array('database', 'email','session', 'form_validation', 'upload', 'pagination',
   'Customlib', 'Role', 'Smsgateway', 'QDMailer','Adler32','Aes');

/*
  | -------------------------------------------------------------------
  |  Auto-load Drivers
  | -------------------------------------------------------------------
  | These classes are located in system/libraries/ or in your
  | application/libraries/ directory, but are also placed inside their
  | own subdirectory and they extend the CI_Driver_Library class. They
  | offer multiple interchangeable driver options.
  |
  | Prototype:
  |
  |	$autoload['drivers'] = array('cache');
 */
$autoload['drivers'] = array();

/*
  | -------------------------------------------------------------------
  |  Auto-load Helper Files
  | -------------------------------------------------------------------
  | Prototype:
  |
  |	$autoload['helper'] = array('url', 'file');
 */
$autoload['helper'] = array('url', 'file', 'menu', 'security');

/*
  | -------------------------------------------------------------------
  |  Auto-load Config files
  | -------------------------------------------------------------------
  | Prototype:
  |
  |	$autoload['config'] = array('config1', 'config2');
  |
  | NOTE: This item is intended for use ONLY if you have created custom
  | config files.  Otherwise, leave it blank.
  |
 */
$autoload['config'] = array();

/*
  | -------------------------------------------------------------------
  |  Auto-load Language files
  | -------------------------------------------------------------------
  | Prototype:
  |
  |	$autoload['language'] = array('lang1', 'lang2');
  |
  | NOTE: Do not include the "_lang" part of your file.  For example
  | "codeigniter_lang.php" would be referenced as array('codeigniter');
  |
 */
$autoload['language'] = array();

/*
  | -------------------------------------------------------------------
  |  Auto-load Models
  | -------------------------------------------------------------------
  | Prototype:
  |
  |	$autoload['model'] = array('first_model', 'second_model');
  |
  | You can also supply an alternative model name to be assigned
  | in the controller:
  |
  |	$autoload['model'] = array('first_model' => 'first');
 */
$autoload['model'] = array('session_model', 'class_model', 'staff_model', 'section_model', 'setting_model', 'classsection_model', 'category_model', 'student_model', 'feemaster_model', 'feecategory_model', 'feetype_model', 'studentfee_model', 'stuattendence_model', 'attendencetype_model', 'studentsession_model', 'language_model', 'admin_model', 'smsconfig_model', 'langpharses_model', 'subject_model', 'teacher_model', 'teachersubject_model', 'exam_model', 'mark_model', 'examschedule_model', 'examresult_model', 'expense_model', 'expensehead_model', 'studenttransportfee_model', 'book_model', 'grade_model', 'timetable_model', 'hostel_model', 'route_model', 'content_model', 'user_model', 'notification_model', 'paymentsetting_model','payroll_model', 'roomtype_model','department_model','designation_model', 'hostelroom_model', 'vehicle_model', 'vehroute_model', 'librarian_model', 'accountant_model','homework_model', 'librarymanagement_model', 'librarymember_model', 'bookissue_model', 'parent_model', 'feegroup_model', 'feegrouptype_model', 'feesessiongroup_model', 'studentfeemaster_model', 'feediscount_model','emailconfig_model','income_model','incomehead_model','itemcategory_model','schoolhouse_model','item_model','messages_model','itemstore_model','itemsupplier_model','notificationsetting_model','itemstock_model','itemissue_model','userlog_model','cms_program_model','cms_menu_model','cms_media_model','cms_page_model','cms_menuitems_model','cms_page_content_model','role_model','calendar_model','userpermission_model','staffroles_model','staffattendancemodel','rolepermission_model','Certificate_model','classteacher_model','Generatecertificate_model','Student_id_card_model','timeline_model','Generateidcard_model','Module_model','Journal_model','batch_model', 'Admincategory_model', 'Admindocument_model','Event_model','Meeting_model','Eresource_model');