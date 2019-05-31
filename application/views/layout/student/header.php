<!DOCTYPE html>
<html <?php echo $this->customlib->getRTL(); ?>>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo $this->customlib->getAppName(); ?></title>        
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <meta name="theme-color" content="#424242" />
        <link href="<?php echo base_url(); ?>backend/images/s-favican.png" rel="shortcut icon" type="image/x-icon">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/style-main.css">

        <?php
        $this->load->view('layout/theme');
        ?>
        <?php
        if ($this->customlib->getRTL() != "") {
            ?>
            <!-- Bootstrap 3.3.5 RTL -->
            <link rel="stylesheet" href="<?php echo base_url(); ?>backend/rtl/bootstrap-rtl/css/bootstrap-rtl.min.css"/>  
            <!-- Theme RTL style -->
            <link rel="stylesheet" href="<?php echo base_url(); ?>backend/rtl/dist/css/AdminLTE-rtl.min.css" />
            <link rel="stylesheet" href="<?php echo base_url(); ?>backend/rtl/dist/css/ss-rtlmain.css">
            <link rel="stylesheet" href="<?php echo base_url(); ?>backend/rtl/dist/css/skins/_all-skins-rtl.min.css" />

            <?php
        } else {
            
        }
        ?>
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/font-awesome.min.css">      
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/ionicons.min.css">       

        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/iCheck/flat/blue.css">      
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/morris/morris.css">       
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css">        
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/datepicker/datepicker3.css">       
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/daterangepicker/daterangepicker-bs3.css">      
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/sweet-alert/sweetalert2.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/custom_style.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/datepicker/css/bootstrap-datetimepicker.css">
        <!--file dropify-->
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/dropify.min.css">
        <!--file nprogress-->
        <link href="<?php echo base_url(); ?>backend/dist/css/nprogress.css" rel="stylesheet">
        <!--print table-->
        <link href="<?php echo base_url(); ?>backend/dist/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="<?php echo base_url(); ?>backend/dist/datatables/css/buttons.dataTables.min.css" rel="stylesheet">
        <link href="<?php echo base_url(); ?>backend/dist/datatables/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <!--print table mobile support-->
        <link href="<?php echo base_url(); ?>backend/dist/datatables/css/responsive.dataTables.min.css" rel="stylesheet">
        <link href="<?php echo base_url(); ?>backend/dist/datatables/css/rowReorder.dataTables.min.css" rel="stylesheet">
        <script src="<?php echo base_url(); ?>backend/custom/jquery.min.js"></script>
        <script src="<?php echo base_url(); ?>backend/dist/js/moment.min.js"></script>
        <script src="<?php echo base_url(); ?>backend/datepicker/js/bootstrap-datetimepicker.js"></script>
        <script src="<?php echo base_url(); ?>backend/datepicker/date.js"></script>       
        <script src="<?php echo base_url(); ?>backend/dist/js/jquery-ui.min.js"></script>
        <script src="<?php echo base_url(); ?>backend/js/sstoast.js"></script>

        <!-- fullCalendar -->
        <link rel="stylesheet" href="<?php echo base_url() ?>backend/fullcalendar/dist/fullcalendar.min.css">
        <link rel="stylesheet" href="<?php echo base_url() ?>backend/fullcalendar/dist/fullcalendar.print.min.css" media="print">

        <script type="text/javascript">
            var baseurl = "<?php echo base_url(); ?>";
        </script>

    </head>
    <body class="hold-transition skin-blue fixed sidebar-mini">
        <div class="wrapper">
            <header class="main-header" id="alert">              
                <a href="<?php echo base_url(); ?>user/user/dashboard" class="logo">                  
                    <span class="logo-mini">S S</span>                   
                    <span class="logo-lg"><img src="<?php echo base_url(); ?>backend/images/s_logo.png" alt="<?php echo $this->customlib->getAppName() ?>" /></span>
                </a>             
                <nav class="navbar navbar-static-top" role="navigation">                  
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <div class="col-md-5 col-sm-3 col-xs-5">   
                        <span href="#" class="sidebar-session">
                            <?php echo $this->setting_model->getCurrentSchoolName(); ?>
                        </span>
                    </div>   
                    <div class="col-md-7 col-sm-9 col-xs-7">
                        <div class="pull-right"> 
                            <div class="navbar-custom-menu">
                                <ul class="nav navbar-nav headertopmenu"> 

                                    <li class="cal15"><a href="<?php echo base_url() ?>user/calendar/"><i class="fa fa fa-calendar"></i></a></li>

                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle todoicon" data-toggle="dropdown">
                                            <i class="fa fa-check-square-o"></i>
                                            <?php
                                            $userdata = $this->customlib->getLoggedInUserData();
                                            $count = $this->customlib->countincompleteTask($userdata["id"]);
                                            if ($count > 0) {
                                                ?>

                                                <span class="todo-indicator"><?php echo $count ?></span>
                                            <?php } ?>
                                        </a>
                                        <ul class="dropdown-menu menuboxshadow">

                                            <li class="todoview plr10 ssnoti"><?php echo "Today you have " . $count . " pending task." ?><a href="<?php echo base_url() ?>user/calendar/" class="pull-right pt0">View all</a></li>
                                            <li>
                                                <ul class="todolist">
                                                    <?php
                                                    $tasklist = $this->customlib->getincompleteTask($userdata["id"]);
                                                    foreach ($tasklist as $key => $value) {
                                                        ?>
                                                        <li><div class="checkbox">
                                                                <label><input type="checkbox" id="newcheck<?php echo $value["id"] ?>" onclick="markc('<?php echo $value["id"] ?>')" name="eventcheck"  value="<?php echo $value["id"]; ?>"><?php echo $value["event_title"] ?></label>
                                                            </div></li>
                                                    <?php } ?>

                                                </ul>
                                            </li>
                                        </ul>
                                    </li><?php
                                    $student_data = $this->customlib->getLoggedInUserData();
                                    $file = $student_data["image"];

                                    $image = $student_data["image"];
                                    if (!empty($image)) {

                                        $file = $image;
                                    } else {

                                        $file = "uploads/student_images/no_image.png";
                                    }
                                    ?>
                                    <li class="dropdown user-menu">
                                        <a class="dropdown-toggle" style="padding: 15px 13px;" data-toggle="dropdown" href="#" aria-expanded="false">
                                            <img src="<?php echo base_url() . $file; ?>" class="topuser-image" alt="User Image">
                                        </a>
                                        <ul class="dropdown-menu dropdown-user menuboxshadow">

                                            <li> 
                                                <div class="sstopuser">
                                                    <div class="ssuserleft">   
                                                        <img src="<?php echo base_url() . $file; ?>" alt="User Image">
                                                    </div>

                                                    <div class="sstopuser-test">
                                                        <h4 style="text-transform: capitalize;"><?php echo $this->customlib->getStudentSessionUserName(); ?></h4>
                                                        <h5><?php echo $this->lang->line("student"); ?></h5>
                                                        <!--p>demo</p-->
                                                    </div>
                                                    <div class="divider"></div>
                                                    <div class="sspass">  
                                                        <a class="" href="<?php echo base_url(); ?>user/user/changepass"><i class="fa fa-key"></i> <?php echo $this->lang->line('change_password'); ?></a> <a class="pull-right" href="<?php echo base_url(); ?>site/logout"><i class="fa fa-sign-out fa-fw"></i> <?php echo $this->lang->line('logout'); ?></a>
                                                    </div>  
                                                </div><!--./sstopuser--></li>

                                        </ul>                             
                                    </li>   
                                </ul>
                            </div>

                            <!--div class="navbar-custom-menu">
                                <ul class="nav navbar-nav"> 

                                    <li class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false"><?php echo $this->customlib->getStudentSessionUserName(); ?>
                                            <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-user">
                                            <li ><a href="<?php echo base_url(); ?>user/user/changepass"><i class="fa fa-key"></i> <?php echo $this->lang->line('change_password'); ?></a>
                                            </li>
                                            <li class="divider"></li>
                                            <li><a href="<?php echo base_url(); ?>site/logout"><i class="fa fa-sign-out fa-fw"></i> <?php echo $this->lang->line('logout'); ?></a>
                                            </li>
                                        </ul>                         
                                    </li>   
                                </ul>
                            </div-->
                        </div>
                    </div>
                </nav>
            </header>
            <aside class="main-sidebar" id="alert2">               
                <section class="sidebar">  

                    <ul class="sessionul fixedmenu">    

                        <li class="removehover accurrent">

                            <a data-toggle="modal" data-target="#user_sessionModal"><?php echo $this->lang->line('current_session') . ": " . $this->setting_model->getCurrentSessionName(); ?><i class="fa fa-pencil pull-right"></i></a>
                        </li>   
                    </ul>                
                    <ul class="sidebar-menu verttop38" id="sibe-box">

                        <li class="<?php echo set_Topmenu('Dashboard'); ?>"><a href="<?php echo base_url(); ?>user/user/dashboard"><i class="fa fa-user-plus"></i> <?php echo $this->lang->line('my_profile'); ?></a></li>
                        <?php
                        if ($this->module_lib->hasActive('fees_collection')) {
                            ?>
                            <li class="<?php echo set_Topmenu('user/user/getfees'); ?>"><a href="<?php echo base_url(); ?>user/user/getfees"><i class="fa fa-user-plus"></i> <?php echo $this->lang->line('fees'); ?></a></li>
                            <?php
                        }

                        if ($this->module_lib->hasActive('academics')) {
                            ?>

                            <li class="<?php echo set_Topmenu('Time_table'); ?>"><a href="<?php echo base_url(); ?>user/timetable"><i class="fa fa-calendar-times-o"></i> <?php echo $this->lang->line('class_timetable'); ?></a></li>
                            <?php
                        }

                        if ($this->module_lib->hasActive('homework')) {
                            ?>
                            <li class="<?php echo set_Topmenu('Homework'); ?>"><a href="<?php echo base_url(); ?>user/homework"><i class="fa fa-calendar-times-o"></i> <?php echo $this->lang->line('homework'); ?></a></li>
                            <?php
                        }
                        if ($this->module_lib->hasActive('download_center')) {
                            ?>
                            <li class="treeview <?php echo set_Topmenu('Downloads'); ?>">
                                <a href="#">
                                    <i class="fa fa-download"></i> <span><?php echo $this->lang->line('download_center'); ?></span> <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                <ul class="treeview-menu">
                                    <li class="<?php echo set_Submenu('content/assignment'); ?>"><a href="<?php echo base_url(); ?>user/content/assignment"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('assignments'); ?></a></li>
                                    <li class="<?php echo set_Submenu('content/studymaterial'); ?>"><a href="<?php echo base_url(); ?>user/content/studymaterial"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('study_material'); ?></a></li>
                                    <li class="<?php echo set_Submenu('content/syllabus'); ?>"><a href="<?php echo base_url(); ?>user/content/syllabus"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('syllabus'); ?></a></li>
                                    <li class="<?php echo set_Submenu('content/other'); ?>"><a href="<?php echo base_url(); ?>user/content/other"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('other_downloads'); ?></a></li>
                                </ul>
                            </li>
                            <?php
                        }
                        if ($this->module_lib->hasActive('student_attendance')) {
                            ?>
                            <li class="treeview <?php echo set_Topmenu('Attendence'); ?>"><a href="<?php echo base_url(); ?>user/attendence"><i class="fa fa-calendar-check-o"></i> <?php echo $this->lang->line('attendance'); ?></a></li>
                            <?php
                        }

                        if ($this->module_lib->hasActive('examination')) {
                            ?>
                            <li class="treeview <?php echo set_Topmenu('Examinations'); ?>">
                                <a href="#">
                                    <i class="fa fa-map-o"></i> <span><?php echo $this->lang->line('examinations'); ?></span> <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                <ul class="treeview-menu">
                                    <li class="<?php echo set_Submenu('mark/marklist'); ?>"><a href="<?php echo base_url(); ?>user/mark/marklist"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('report_card'); ?></a></li>
                                    <li class="<?php echo set_Submenu('examSchedule/index'); ?>"><a href="<?php echo base_url(); ?>user/examschedule"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('exam_schedule'); ?></a></li>
                                </ul>
                            </li>
                            <?php
                        }

                        if ($this->module_lib->hasActive('communicate')) {
                            ?>
                            <li class="treeview <?php echo set_Submenu('user/notification'); ?>">
                                <a href="<?php echo base_url(); ?>user/notification">
                                    <i class="fa fa-envelope"></i> <span><?php echo $this->lang->line('notice_board'); ?></span>
                                    <?php
                                    $ntf = $this->customlib->getStudentunreadNotification();
                                    if ($ntf) {
                                        ?>
                                        <small class="label pull-right bg-red">
                                            <?php echo $ntf; ?>
                                        </small>
                                        <?php
                                    }
                                    ?>
                                </a>
                            </li>
                            <?php
                        }


                        if ($this->module_lib->hasActive('academics')) {
                            ?>
                            <li class="<?php echo set_Topmenu('Subjects'); ?>"><a href="<?php echo base_url(); ?>user/subject"><i class="fa fa-language"></i> <?php echo $this->lang->line('subjects'); ?></a></li>

                            <li class="<?php echo set_Topmenu('Teachers'); ?>"><a href="<?php echo base_url(); ?>user/teacher"><i class="fa fa-user-secret"></i> <?php echo $this->lang->line('teachers'); ?></a></li>
                            <?php
                        }

                        if ($this->module_lib->hasActive('library')) {
                            ?>
                            <li class="treeview <?php echo set_Topmenu('Library'); ?>">
                                <a href="#">
                                    <i class="fa fa-book"></i> <span><?php echo $this->lang->line('library'); ?></span> <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                <ul class="treeview-menu">
                                    <li class="<?php echo set_Submenu('book/index'); ?>">
                                        <a href="<?php echo base_url(); ?>user/book">
                                            <i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('books'); ?></a>
                                    </li>
                                    <li class="<?php echo set_Submenu('book/issue'); ?>">
                                        <a href="<?php echo base_url(); ?>user/book/issue">
                                            <i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('book_issued'); ?></a>
                                    </li>
                                </ul>
                            </li>
                            <?php
                        }
                        if ($this->module_lib->hasActive('transport')) {
                            ?>
                            <li class="<?php echo set_Submenu('route/index'); ?>"><a href="<?php echo base_url(); ?>user/route"><i class="fa fa-bus"></i> <?php echo $this->lang->line('transport_routes'); ?></a></li>
                            <?php
                        }
                        if ($this->module_lib->hasActive('hostel')) {
                            ?>
                            <li class="<?php echo set_Submenu('hostelroom/index'); ?>"><a href="<?php echo base_url(); ?>user/hostelroom"><i class="fa fa-building-o"></i> <?php echo $this->lang->line('hostel_rooms'); ?></a></li>

                        <?php }
                        ?>

                    </ul>
                </section>              
            </aside> 