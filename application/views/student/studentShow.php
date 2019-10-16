<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<div class="content-wrapper" style="min-height: 946px;">
    <div class="row">
        <div class="col-md-12">
            <section class="content-header" style="padding-right: 0;">
                <h1>
                    <i class="fa fa-user-plus"></i> <?php echo $this->lang->line('student_information'); ?> <small><?php echo $this->lang->line('student1'); ?></small></h1>

            </section>
        </div>

        <div>
            <a id="sidebarCollapse" class="studentsideopen"><i class="fa fa-navicon"></i></a>
            <aside class="studentsidebar">
                <div class="stutop" id="">
                    <!-- Create the tabs -->
                    <div class="studentsidetopfixed">
                        <p class="classtap"><?php echo $student["class"]; ?> <a href="#" data-toggle="control-sidebar" class="studentsideclose"><i class="fa fa-times"></i></a></p>
                        <ul class="nav nav-justified studenttaps">
                            <?php foreach ($class_section as $skey => $svalue) {
                                ?>
                                <li <?php if ($student["section_id"] == $svalue["section_id"]) {
                                            echo "class='active'";
                                        } ?>><a href="#section<?php echo $svalue["section_id"] ?>" data-toggle="tab"><?php print_r($svalue["section"]); ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <?php foreach ($class_section as $skey => $snvalue) {
                            ?>
                            <div class="tab-pane <?php if ($student["section_id"] == $snvalue["section_id"]) {
                                                            echo "active";
                                                        } ?>" id="section<?php echo $snvalue["section_id"]; ?>">
                                <?php foreach ($studentlistbysection as $stkey => $stvalue) {
                                        if ($stvalue['section_id'] == $snvalue["section_id"]) {
                                            ?>
                                        <div class="studentname">
                                            <a class="" href="<?php echo base_url() . "student/view/" . $stvalue["id"] ?>">
                                                <div class="icon"><img src="<?php if (!empty($stvalue["image"])) {
                                                                                            echo base_url() . $stvalue["image"];
                                                                                        } else {
                                                                                            echo base_url() . "uploads/student_images/no_image.png";
                                                                                        } ?>" alt="User Image"></div>
                                                <div class="student-tittle"><?php echo $stvalue["firstname"] . " " . $stvalue["lastname"]; ?></div>
                                            </a>
                                        </div>
                                <?php
                                        }
                                    } ?>
                            </div>
                        <?php } ?>
                        <div class="tab-pane" id="sectionB">
                            <h3 class="control-sidebar-heading">Recent Activity 2</h3>
                        </div>

                        <div class="tab-pane" id="sectionC">
                            <h3 class="control-sidebar-heading">Recent Activity 3</h3>
                        </div>
                        <div class="tab-pane" id="sectionD">
                            <h3 class="control-sidebar-heading">Recent Activity 3</h3>
                        </div>
                        <!-- /.tab-pane -->
                    </div>
                </div>
            </aside>
        </div>
        <!-- /.control-sidebar -->
    </div>

    <section class="content">
        <div class="row">
            <div class="col-md-3">
                <div class="box box-primary" <?php if ($student["is_active"] == "no") {
                                                    echo "style='background-color:#f0dddd;'";
                                                } ?>>
                    <div class="box-body box-profile">
                        <img class="profile-user-img img-responsive img-circle" src="<?php if (!empty($student['image'])) {
                                                                                            echo base_url() . $student['image'];
                                                                                        } else {
                                                                                            echo base_url() . "uploads/student_images/no_image.png";
                                                                                        } ?>" alt="User profile picture">
                        <h3 class="profile-username text-center"><?php echo $student['firstname'] . " " . $student['lastname']; ?></h3>
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item listnoback">
                                <b><?php echo $this->lang->line('admission_no'); ?></b> <a class="pull-right text-aqua"><?php echo $student['admission_no']; ?></a>
                            </li>
                            <li class="list-group-item listnoback">
                                <b><?php echo $this->lang->line('hall_no'); ?></b> <a class="pull-right text-aqua"><?php echo $student['hall_no']; ?></a>
                            </li>
                            <li class="list-group-item listnoback">
                                <b><?php echo $this->lang->line('class'); ?></b> <a class="pull-right text-aqua"><?php echo $student['class'] . " (" . $session . ")"; ?></a>
                            </li>
                            <li class="list-group-item listnoback">
                                <b><?php echo $this->lang->line('section'); ?></b> <a class="pull-right text-aqua"><?php echo $student['section']; ?></a>
                            </li>
                            <li class="list-group-item listnoback">
                                <b><?php echo $this->lang->line('batch'); ?></b> <a class="pull-right text-aqua"><?php echo $student['batch']; ?></a>
                            </li>
                            <li class="list-group-item listnoback">
                                <b><?php echo $this->lang->line('rte'); ?></b> <a class="pull-right text-aqua"><?php echo $student['rte']; ?></a>
                            </li>
                            <li class="list-group-item listnoback">
                                <b><?php echo $this->lang->line('physically_challenged'); ?></b> <a class="pull-right text-aqua"><?php echo $student['physically_challenged']; ?></a>
                            </li>
                            <li class="list-group-item listnoback">
                                <b><?php echo $this->lang->line('gender'); ?></b> <a class="pull-right text-aqua"><?php echo $this->lang->line(strtolower($student['gender'])); ?></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <?php
                if (!empty($siblings)) {
                    ?>
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('sibling'); ?></h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <?php

                                foreach ($siblings as $sibling_key => $sibling_value) {
                                    ?>
                                <div class="box box-widget widget-user-2">
                                    <!-- Add the bg color to the header using any of the bg-* classes -->
                                    <div class="siblingview">
                                        <img class="" src="<?php echo base_url() . $sibling_value->image; ?>" alt="User Avatar">
                                        <h4><a href="<?php echo site_url('student/view/' . $sibling_value->id) ?>"><?php echo $sibling_value->firstname . " " . $sibling_value->lastname ?></a></h4>
                                    </div>
                                    <div class="box-footer no-padding">
                                        <ul class="list-group list-group-unbordered">
                                            <li class="list-group-item">


                                                <b><?php echo $this->lang->line('admission_no'); ?></b> <a class="pull-right text-aqua"><?php echo $sibling_value->admission_no; ?></a>
                                            </li>

                                            <li class="list-group-item">
                                                <b><?php echo $this->lang->line('class'); ?></b> <a class="pull-right text-aqua"><?php echo $sibling_value->class; ?></a>
                                            </li>
                                            <li class="list-group-item">
                                                <b><?php echo $this->lang->line('section'); ?></b> <a class="pull-right text-aqua"><?php echo $sibling_value->section; ?></a>

                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            <?php
                                }

                                ?>


                        </div>
                        <!-- /.box-body -->

                    </div>

                <?php

                }

                ?>

            </div>
            <div class="col-md-9">

                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#activity" data-toggle="tab" aria-expanded="true"><?php echo $this->lang->line('profile'); ?></a></li>
                        <?php

                        if ($this->module_lib->hasActive('fees_collection')) {
                            if (($this->rbac->hasPrivilege('collect_fees', 'can_view') ||
                                $this->rbac->hasPrivilege('search_fees_payment', 'can_view') ||
                                $this->rbac->hasPrivilege('search_due_fees', 'can_view') ||
                                $this->rbac->hasPrivilege('fees_statement', 'can_view') ||
                                $this->rbac->hasPrivilege('balance_fees_report', 'can_view') ||
                                $this->rbac->hasPrivilege('fees_carry_forward', 'can_view') ||
                                $this->rbac->hasPrivilege('fees_master', 'can_view') ||
                                $this->rbac->hasPrivilege('fees_group', 'can_view') ||
                                $this->rbac->hasPrivilege('fees_type', 'can_view') ||
                                $this->rbac->hasPrivilege('fees_discount', 'can_view') ||
                                $this->rbac->hasPrivilege('accountants', 'can_view'))) {

                                ?>
                                <li class=""><a href="#fee" data-toggle="tab" aria-expanded="true"><?php echo $this->lang->line('fees'); ?></a></li>
                            <?php }
                            }
                            if ($this->module_lib->hasActive('student_attendance')) {
                                if (($this->rbac->hasPrivilege('student_attendance', 'can_view') ||
                                    $this->rbac->hasPrivilege('student_attendance_report', 'can_view') ||
                                    $this->rbac->hasPrivilege('attendance_by_date', 'can_view'))) {
                                    ?>
                                <li class=""><a href="#attendance" data-toggle="tab" aria-expanded="true"><?php echo $this->lang->line('attendance'); ?></a></li>

                            <?php }
                            }

                            if ($this->module_lib->hasActive('examination')) {
                                if (($this->rbac->hasPrivilege('exam', 'can_view') ||
                                    $this->rbac->hasPrivilege('exam_schedule', 'can_view') ||
                                    $this->rbac->hasPrivilege('marks_register', 'can_view') ||
                                    $this->rbac->hasPrivilege('marks_grade', 'can_view'))) {
                                    ?>
                                <li class=""><a href="#exam" data-toggle="tab" aria-expanded="true"><?php echo $this->lang->line('exam'); ?></a></li>
                        <?php }
                        } ?>
                        <li class=""><a href="#documents" data-toggle="tab" aria-expanded="true"><?php echo $this->lang->line('documents'); ?></a></li>
                        <?php
                        if ($this->rbac->hasPrivilege('student_timeline', 'can_add')) {
                            ?>
                            <li class=""><a href="#timelineh" data-toggle="tab" aria-expanded="true"><?php echo $this->lang->line('timeline') ?></a></li>
                        <?php } ?>




                        <?php if ($student["is_active"] == "yes") { ?>
                            <?php

                                if ($this->rbac->hasPrivilege('disable_student', 'can_view')) {
                                    ?>
                                <li class="pull-right">
                                    <a href="<?php echo base_url() . "student/disablestudent/" . $student["id"] ?>" onclick="disable('<?php echo $student["id"] ?>')" class="text-red" data-toggle="tooltip" title="<?php echo "Disable"; ?>">
                                        <i class="fa fa-thumbs-o-down"></i><?php //echo "Disable Student"; 
                                                                                    ?>
                                    </a>
                                </li>
                            <?php }

                                if ($this->rbac->hasPrivilege('student_login_credential', 'can_view')) {
                                    ?>


                                <li class="pull-right">
                                    <a href="#" class="schedule_modal text-green" data-toggle="tooltip" title="<?php echo $this->lang->line('login_details'); ?>"><i class="fa fa-key"></i>
                                        <?php //echo $this->lang->line('login_details'); 
                                                ?>
                                    </a>
                                </li>
                            <?php }
                                if ($this->rbac->hasPrivilege('student', 'can_edit')) {
                                    ?>

                                <li class="pull-right">
                                    <a href="<?php echo base_url() . "student/edit/" . $student["id"] ?>" class="" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>"><i class="fa fa-pencil"></i>
                                        <?php //echo $this->lang->line('login_details'); 
                                                ?>
                                    </a>
                                </li>
                            <?php }
                            } else { ?>

                            <li class="pull-right"><a href="<?php echo site_url("student/delete/" . $student['id']) ?>" data-toggle="tooltip" title="<?php echo "Delete"; ?>" title="<?php echo $this->lang->line('delete'); ?>" class="text-red" onclick="return confirm('Are you sure you want to delete this Student? All related data can not be recovered!');"><i class="fa fa-trash"></i> <?php //echo $this->lang->line('delete'); 
                                                                                                                                                                                                                                                                                                                                                                                                    ?> <?php //echo $this->lang->line('student'); 
                                                                                                                                                                                                                                                                                                                                                                                                                                                    ?></a></li>.
                            <li class="pull-right">
                                <a href="<?php echo base_url() . "student/enablestudent/" . $student["id"] ?>" onclick="enable('<?php echo $student["id"] ?>')" class="text-green" data-toggle="tooltip" title="<?php echo "Enable"; ?>">
                                    <i class="fa fa-thumbs-o-up"></i><?php //echo "Enable Student"; 
                                                                            ?>
                                </a>
                            </li>

                        <?php } ?>

                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="activity">
                            <div class="tshadow mb25 bozero">
                                <div class="table-responsive around10 pt0">
                                    <table class="table table-hover table-striped tmb0">
                                        <tbody>
                                            <tr>
                                                <td class="col-md-4"><?php echo $this->lang->line('admission_date'); ?></td>
                                                <td class="col-md-5">
                                                    <?php if (!empty($student['admission_date'])) {
                                                        echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($student['admission_date']));
                                                    } ?></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $this->lang->line('date_of_birth'); ?></td>
                                                <td><?php if (!empty($student['admission_date'])) {
                                                        echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($student['dob']));
                                                    } ?></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $this->lang->line('category'); ?></td>
                                                <td>
                                                    <?php
                                                    foreach ($category_list as $value) {
                                                        if ($student['category_id'] == $value['id']) {
                                                            echo $value['category'];
                                                        }
                                                    }
                                                    ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $this->lang->line('mobile_no'); ?></td>
                                                <td><?php echo $student['mobileno']; ?></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $this->lang->line('cast'); ?></td>
                                                <td><?php echo $student['cast']; ?></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $this->lang->line('religion'); ?></td>
                                                <td><?php echo $student['religion']; ?></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $this->lang->line('email'); ?></td>
                                                <td><?php echo $student['email']; ?></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tshadow mb25 bozero">
                                <h3 class="pagetitleh2"><?php echo $this->lang->line('address'); ?> <?php echo $this->lang->line('detail'); ?></h3>
                                <div class="table-responsive around10 pt0">
                                    <table class="table table-hover table-striped tmb0">
                                        <tbody>
                                            <tr>
                                                <td><?php echo $this->lang->line('current_address'); ?></td>
                                                <td><?php echo $student['current_address']; ?></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $this->lang->line('permanent_address'); ?></td>
                                                <td><?php echo $student['permanent_address']; ?></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tshadow mb25 bozero">
                                <h3 class="pagetitleh2"><?php echo $this->lang->line('parent'); ?> / <?php echo $this->lang->line('guardian_details'); ?> </h3>
                                <div class="table-responsive around10 pt10">
                                    <table class="table table-hover table-striped tmb0">
                                        <tr>
                                            <td class="col-md-4"><?php echo $this->lang->line('father_name'); ?></td>
                                            <td class="col-md-5"><?php echo $student['father_name']; ?></td>
                                            <td rowspan="3"><img class="profile-user-img img-responsive img-circle" src="<?php if (!empty($student["father_pic"])) {
                                                                                                                                echo base_url() . $student["father_pic"];
                                                                                                                            } else {
                                                                                                                                echo base_url() . "uploads/student_images/no_image.png";
                                                                                                                            } ?>"></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('father_phone'); ?></td>
                                            <td><?php echo $student['father_phone']; ?></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('father_occupation'); ?></td>
                                            <td><?php echo $student['father_occupation']; ?></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('mother_name'); ?></td>
                                            <td><?php echo $student['mother_name']; ?></td>
                                            <td rowspan="3"><img class="profile-user-img img-responsive img-circle" src="<?php if (!empty($student["mother_pic"])) {
                                                                                                                                echo base_url() . $student["mother_pic"];
                                                                                                                            } else {
                                                                                                                                echo base_url() . "uploads/student_images/no_image.png";
                                                                                                                            } ?>"></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('mother_phone'); ?></td>
                                            <td><?php echo $student['mother_phone']; ?></td>

                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('mother_occupation'); ?></td>
                                            <td><?php echo $student['mother_occupation']; ?></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('guardian_name'); ?></td>
                                            <td><?php echo $student['guardian_name']; ?></td>
                                            <td rowspan="3"><img class="profile-user-img img-responsive img-circle" src="<?php if (!empty($student["guardian_pic"])) {
                                                                                                                                echo base_url() . $student["guardian_pic"];
                                                                                                                            } else {
                                                                                                                                echo base_url() . "uploads/student_images/no_image.png";
                                                                                                                            } ?>"></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('guardian_email'); ?></td>
                                            <td><?php echo $student['guardian_email']; ?></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('guardian_relation'); ?></td>
                                            <td><?php echo $student['guardian_relation']; ?></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('guardian_phone'); ?></td>
                                            <td><?php echo $student['guardian_phone']; ?></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('guardian_occupation'); ?></td>
                                            <td><?php echo $student['guardian_occupation']; ?></td>
                                        </tr>
                                        <tr>
                                            <td><?php echo $this->lang->line('guardian_address'); ?></td>
                                            <td><?php echo $student['guardian_address']; ?></td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <?php

                            if ($this->module_lib->hasActive('transport')) {

                                if ($student['vehroute_id'] != 0) {
                                    ?>
                                    <div class="tshadow mb25  bozero">
                                        <h3 class="pagetitleh2"><?php echo $this->lang->line('route') . " " . $this->lang->line('details') ?></h3>

                                        <div class="table-responsive around10 pt0">
                                            <table class="table table-hover table-striped tmb0">
                                                <tbody>

                                                    <tr>
                                                        <td class="col-md-4"><?php echo $this->lang->line('route'); ?></td>
                                                        <td class="col-md-5"><?php echo $student['route_title']; ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-4"><?php echo $this->lang->line('vehicle_no'); ?></td>
                                                        <td class="col-md-5"><?php echo $student['vehicle_no']; ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td><?php echo $this->lang->line('driver_name'); ?></td>
                                                        <td><?php echo $student['driver_name']; ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td><?php echo $this->lang->line('driver_contact'); ?></td>
                                                        <td><?php echo $student['driver_contact']; ?></td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                            <?php
                                }
                            }
                            ?>
                            <?php

                            if ($this->module_lib->hasActive('hostel')) {

                                if ($student['hostel_room_id'] != 0) {
                                    ?>
                                    <div class="tshadow mb25  bozero">
                                        <h3 class="pagetitleh2"><?php echo $this->lang->line('hostel') . " " . $this->lang->line('details') ?></h3>

                                        <div class="table-responsive around10 pt0">
                                            <table class="table table-hover table-striped tmb0">
                                                <tbody>

                                                    <tr>
                                                        <td class="col-md-4"><?php echo $this->lang->line('hostel'); ?></td>
                                                        <td class="col-md-5"><?php echo $student['hostel_name']; ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-4"><?php echo $this->lang->line('room_no'); ?></td>
                                                        <td class="col-md-5"><?php echo $student['room_no']; ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-4"><?php echo $this->lang->line('room_type'); ?></td>
                                                        <td class="col-md-5"><?php echo $student['room_type']; ?></td>
                                                    </tr>


                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                            <?php
                                }
                            }
                            ?>


                            <div class="tshadow mb25  bozero">
                                <h3 class="pagetitleh2"><?php echo $this->lang->line('miscellaneous_details'); ?></h3>
                                <div class="table-responsive around10 pt0">
                                    <table class="table table-hover table-striped tmb0">
                                        <tbody>
                                            <tr>
                                                <td class="col-md-4"><?php echo $this->lang->line('mentor'); ?></td>
                                                <td class="col-md-5"><?php echo $student['mentor_name'] . ' ' . $student['mentor_surname']; ?></td>
                                            </tr>
                                            <tr>
                                                <td class="col-md-4"><?php echo $this->lang->line('blood_group'); ?></td>
                                                <td class="col-md-5"><?php echo $student['blood_group']; ?></td>
                                            </tr>
                                            <tr>
                                                <td class="col-md-4"><?php echo $this->lang->line('house'); ?></td>
                                                <td class="col-md-5"><?php echo $student['house_name']; ?></td>
                                            </tr>
                                            <tr>
                                                <td class="col-md-4"><?php echo $this->lang->line('height'); ?></td>
                                                <td class="col-md-5"><?php echo $student['height']; ?></td>
                                            </tr>
                                            <tr>
                                                <td class="col-md-4"><?php echo $this->lang->line('weight'); ?></td>
                                                <td class="col-md-5"><?php echo $student['weight']; ?></td>
                                            </tr>
                                            <tr>
                                                <td class="col-md-4"><?php echo $this->lang->line('measurement_date'); ?></td>
                                                <td class="col-md-5"><?php if (!empty($student['measurement_date'])) {
                                                                            echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($student['measurement_date']));
                                                                        } ?></td>
                                            </tr>
                                            <tr>
                                                <td class="col-md-4"><?php echo $this->lang->line('previous_school_details'); ?></td>
                                                <td class="col-md-5"><?php echo $student['previous_school']; ?></td>
                                            </tr>
                                            <tr>
                                                <td class="col-md-4"><?php echo $this->lang->line('adhar_no'); ?></td>
                                                <td class="col-md-5"><?php echo $student['adhar_no']; ?></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $this->lang->line('local_identification_no'); ?></td>
                                                <td><?php echo $student['samagra_id']; ?></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $this->lang->line('bank_account_no'); ?></td>
                                                <td><?php echo $student['bank_account_no']; ?></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $this->lang->line('bank_name'); ?></td>
                                                <td><?php echo $student['bank_name']; ?></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $this->lang->line('ifsc_code'); ?></td>
                                                <td><?php echo $student['ifsc_code']; ?></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane" id="fee">
                            <?php
                            if (empty($student_due_fee) && empty($student_discount_fee)) {
                                ?>
                                <div class="alert alert-danger">
                                    <?php echo $this->lang->line('no_record_found'); ?>
                                </div>
                            <?php
                            } else {
                                ?>
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped">

                                        <thead>
                                            <tr>
                                                <th><?php echo $this->lang->line('fees_group'); ?></th>
                                                <th><?php echo $this->lang->line('fees_code'); ?></th>
                                                <th class="text text-left"><?php echo $this->lang->line('due_date'); ?></th>
                                                <th class="text text-left"><?php echo $this->lang->line('status'); ?></th>
                                                <th class="text text-right"><?php echo $this->lang->line('amount'); ?> <span><?php echo "(" . $currency_symbol . ")"; ?></span></th>
                                                <th class="text text-left"><?php echo $this->lang->line('payment_id'); ?></th>
                                                <th class="text text-left"><?php echo $this->lang->line('mode'); ?></th>
                                                <th class="text text-left"><?php echo $this->lang->line('date'); ?></th>
                                                <th class="text text-right"><?php echo $this->lang->line('discount'); ?> <span><?php echo "(" . $currency_symbol . ")"; ?></span></th>
                                                <th class="text text-right"><?php echo $this->lang->line('fine'); ?> <span><?php echo "(" . $currency_symbol . ")"; ?></span></th>
                                                <th class="text text-right"><?php echo $this->lang->line('paid'); ?> <span><?php echo "(" . $currency_symbol . ")"; ?></span></th>
                                                <th class="text text-right"><?php echo $this->lang->line('balance'); ?></th>


                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                                $total_amount = 0;
                                                $total_deposite_amount = 0;
                                                $total_fine_amount = 0;
                                                $total_discount_amount = 0;
                                                $total_balance_amount = 0;
                                                $alot_fee_discount = 0;

                                                foreach ($student_due_fee as $key => $fee) {

                                                    foreach ($fee->fees as $fee_key => $fee_value) {
                                                        $fee_paid = 0;
                                                        $fee_discount = 0;
                                                        $fee_fine = 0;
                                                        $alot_fee_discount = 0;


                                                        if (!empty($fee_value->amount_detail)) {
                                                            $fee_deposits = json_decode(($fee_value->amount_detail));

                                                            foreach ($fee_deposits as $fee_deposits_key => $fee_deposits_value) {
                                                                $fee_paid = $fee_paid + $fee_deposits_value->amount;
                                                                $fee_discount = $fee_discount + $fee_deposits_value->amount_discount;
                                                                $fee_fine = $fee_fine + $fee_deposits_value->amount_fine;
                                                            }
                                                        }
                                                        $total_amount = $total_amount + $fee_value->amount;
                                                        $total_discount_amount = $total_discount_amount + $fee_discount;
                                                        $total_deposite_amount = $total_deposite_amount + $fee_paid;
                                                        $total_fine_amount = $total_fine_amount + $fee_fine;
                                                        $feetype_balance = $fee_value->amount - ($fee_paid + $fee_discount);
                                                        $total_balance_amount = $total_balance_amount + $feetype_balance;
                                                        ?>
                                                    <?php
                                                                if ($feetype_balance > 0 && strtotime($fee_value->due_date) < strtotime(date('Y-m-d'))) {
                                                                    ?>
                                                        <tr class="danger font12">
                                                        <?php
                                                                    } else {
                                                                        ?>
                                                        <tr class="dark-gray">
                                                        <?php
                                                                    }
                                                                    ?>


                                                        <td><?php
                                                                        echo $fee_value->name;
                                                                        ?></td>
                                                        <td><?php echo $fee_value->code; ?></td>
                                                        <td class="text text-left">

                                                            <?php
                                                                        if ($fee_value->due_date == "0000-00-00") { } else {

                                                                            echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($fee_value->due_date));
                                                                        }
                                                                        ?>
                                                        </td>
                                                        <td class="text text-left">
                                                            <?php
                                                                        if ($feetype_balance == 0) {
                                                                            ?><span class="label label-success"><?php echo $this->lang->line('paid'); ?></span><?php
                                                                                                                } else if (!empty($fee_value->amount_detail)) {
                                                                                                                    ?><span class="label label-warning"><?php echo $this->lang->line('partial'); ?></span><?php
                                                                                                                                                                    } else {
                                                                                                                                                                        ?><span class="label label-danger"><?php echo $this->lang->line('unpaid'); ?></span><?php
                                                                                                                                                                }
                                                                                                                                                                ?>

                                                        </td>
                                                        <td class="text text-right"><?php echo $fee_value->amount; ?></td>

                                                        <td class="text text-left"></td>
                                                        <td class="text text-left"></td>
                                                        <td class="text text-left"></td>


                                                        <td class="text text-right"><?php
                                                                                                echo (number_format($fee_discount, 2, '.', ''));
                                                                                                ?></td>
                                                        <td class="text text-right"><?php
                                                                                                echo (number_format($fee_fine, 2, '.', ''));
                                                                                                ?></td>
                                                        <td class="text text-right"><?php
                                                                                                echo (number_format($fee_paid, 2, '.', ''));
                                                                                                ?></td>
                                                        <td class="text text-right"><?php
                                                                                                $display_none = "ss-none";
                                                                                                if ($feetype_balance > 0) {
                                                                                                    $display_none = "";
                                                                                                    echo (number_format($feetype_balance, 2, '.', ''));
                                                                                                }
                                                                                                ?>

                                                        </td>




                                                        </tr>

                                                        <?php
                                                                    if (!empty($fee_value->amount_detail)) {

                                                                        $fee_deposits = json_decode(($fee_value->amount_detail));

                                                                        foreach ($fee_deposits as $fee_deposits_key => $fee_deposits_value) {
                                                                            ?>
                                                                <tr class="white-td">
                                                                    <td class="text-left"></td>
                                                                    <td class="text-left"></td>
                                                                    <td class="text-left"></td>
                                                                    <td class="text-left"></td>
                                                                    <td class="text-right"><img src="<?php echo base_url(); ?>backend/images/table-arrow.png" alt="" /></td>
                                                                    <td class="text text-left">


                                                                        <a href="#" data-toggle="popover" class="detail_popover"> <?php echo $fee_value->student_fees_deposite_id . "/" . $fee_deposits_value->inv_no; ?></a>
                                                                        <div class="fee_detail_popover" style="display: none">
                                                                            <?php
                                                                                                if ($fee_deposits_value->description == "") {
                                                                                                    ?>
                                                                                <p class="text text-danger"><?php echo $this->lang->line('no_description'); ?></p>
                                                                            <?php
                                                                                                } else {
                                                                                                    ?>
                                                                                <p class="text text-info"><?php echo $fee_deposits_value->description; ?></p>
                                                                            <?php
                                                                                                }
                                                                                                ?>
                                                                        </div>


                                                                    </td>
                                                                    <td class="text text-left"><?php echo $fee_deposits_value->payment_mode; ?></td>
                                                                    <td class="text text-center">

                                                                        <?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($fee_deposits_value->date)); ?>
                                                                    </td>
                                                                    <td class="text text-right"><?php echo (number_format($fee_deposits_value->amount_discount, 2, '.', '')); ?></td>
                                                                    <td class="text text-right"><?php echo (number_format($fee_deposits_value->amount_fine, 2, '.', '')); ?></td>
                                                                    <td class="text text-right"><?php echo (number_format($fee_deposits_value->amount, 2, '.', '')); ?></td>


                                                                    <td></td>



                                                                </tr>
                                                        <?php
                                                                        }
                                                                    }
                                                                    ?>
                                                <?php
                                                        }
                                                    }
                                                    ?>
                                                <?php
                                                    if (!empty($student_discount_fee)) {

                                                        foreach ($student_discount_fee as $discount_key => $discount_value) {
                                                            ?>
                                                        <tr class="dark-light">
                                                            <td align="left"> <?php echo $this->lang->line('discount'); ?> </td>
                                                            <td align="left">
                                                                <?php echo $discount_value['code']; ?>
                                                            </td>
                                                            <td align="left"></td>
                                                            <td align="left" class="text text-left">
                                                                <?php
                                                                            if ($discount_value['status'] == "applied") {
                                                                                ?>
                                                                    <a href="#" data-toggle="popover" class="detail_popover">

                                                                        <?php echo $this->lang->line('discount_of') . " " . $currency_symbol . $discount_value['amount'] . " " . $this->lang->line($discount_value['status']) . " : " . $discount_value['payment_id']; ?>

                                                                    </a>
                                                                    <div class="fee_detail_popover" style="display: none">
                                                                        <?php
                                                                                        if ($discount_value['student_fees_discount_description'] == "") {
                                                                                            ?>
                                                                            <p class="text text-danger"><?php echo $this->lang->line('no_description'); ?></p>
                                                                        <?php
                                                                                        } else {
                                                                                            ?>
                                                                            <p class="text text-danger"><?php echo $discount_value['student_fees_discount_description'] ?></p>
                                                                        <?php
                                                                                        }
                                                                                        ?>

                                                                    </div>
                                                                <?php
                                                                            } else {
                                                                                echo '<p class="text text-danger">' . $this->lang->line('discount_of') . " " . $currency_symbol . $discount_value['amount'] . " " . $this->lang->line($discount_value['status']);
                                                                            }
                                                                            ?>

                                                            </td>
                                                            <td></td>
                                                            <td class="text text-left"></td>
                                                            <td class="text text-left"></td>
                                                            <td class="text text-left"></td>
                                                            <td class="text text-right">
                                                                <?php
                                                                            $alot_fee_discount = $alot_fee_discount;
                                                                            ?>
                                                            </td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>

                                                        </tr>
                                                <?php
                                                        }
                                                    }
                                                    ?>

                                                <tr class="box box-solid total-bg">
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td class="text text-right"><?php echo $this->lang->line('grand_total'); ?></td>
                                                    <td class="text text-right"><?php
                                                                                    echo ($currency_symbol . number_format($total_amount, 2, '.', ''));
                                                                                    ?></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>


                                                    <td class="text text-right"><?php
                                                                                    echo ($currency_symbol . number_format($total_discount_amount + $alot_fee_discount, 2, '.', ''));
                                                                                    ?></td>
                                                    <td class="text text-right"><?php
                                                                                    echo ($currency_symbol . number_format($total_fine_amount, 2, '.', ''));
                                                                                    ?></td>
                                                    <td class="text text-right"><?php
                                                                                    echo ($currency_symbol . number_format($total_deposite_amount, 2, '.', ''));
                                                                                    ?></td>

                                                    <td class="text text-right"><?php
                                                                                    echo ($currency_symbol . number_format($total_balance_amount - $alot_fee_discount, 2, '.', ''));
                                                                                    ?></td>

                                                </tr>
                                        </tbody>
                                    </table>
                                </div>
                            <?php
                            }
                            ?>

                        </div>

                        <div class="tab-pane" id="attendance">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="box box-primary">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                                        </div>
                                        <div class="box box-body" style="padding:30px">
                                            <div class="row">
                                                <div class="col-md-3" style="text-align: center">
                                                    <b>Attendance Date</b>
                                                </div>
                                                <div class="form-inline col-md-3">
                                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('from'); ?></label>
                                                    <input id="from_date" name="from_date" placeholder="" type="text" class="form-control" value="<?php echo set_value('from_date'); ?>" />
                                                </div>
                                                <div class="form-inline col-md-3">
                                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('to'); ?></label>
                                                    <input id="to_date" name="to_date" placeholder="" type="text" class="form-control" value="<?php echo set_value('to_date'); ?>" />
                                                </div>
                                                <div class="col-md-3" style="text-align: left">
                                                    <button type="submit" id="search" name="search" value="search" class="btn btn-primary btn-sm checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box box-info" id="attendencelist">
                                        <div class="box-header with-border">
                                            <div class="row">
                                                <div class="col-md-4 col-sm-4">
                                                    <h3 class="box-title"><i class="fa fa-users"></i> <?php echo $this->lang->line('attendance'); ?> <?php echo $this->lang->line('report'); ?></h3>
                                                </div>
                                                <div class="col-md-8 col-sm-8">
                                                    <div class="lateday">
                                                        <?php
                                                        foreach ($attendencetypeslist as $key_type => $value_type) {
                                                            ?>
                                                            &nbsp;&nbsp;
                                                            <b>
                                                                <?php
                                                                    $att_type = str_replace(" ", "_", strtolower($value_type['type']));
                                                                    if (strip_tags($value_type["key_value"]) != "E") {

                                                                        echo $this->lang->line($att_type) . ": " . $value_type['key_value'] . "";
                                                                    }
                                                                    ?>
                                                            </b>
                                                        <?php
                                                        }
                                                        ?>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="box-body table-responsive">
                                            <div class="mailbox-controls">
                                                <div class="pull-right">
                                                </div>
                                            </div>
                                            <table class="table table-striped table-bordered table-hover report-table">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>
                                                            <?php echo $this->lang->line('subject'); ?>
                                                        </th>
                                                        <th><br /><span data-toggle="tooltip" title="<?php echo "Gross Present Percentage(%)"; ?>">%</span></th>

                                                        <?php
                                                        foreach ($attendencetypeslist as $key => $value) {
                                                            if (strip_tags($value["key_value"]) != "E") {
                                                                ?>
                                                                <th colspan=""><br/><span data-toggle="tooltip" title="<?php echo "Total " . $value["type"]; ?>"><?php echo strip_tags($value["key_value"]); ?>

                                                                    </span></th>

                                                        <?php }
                                                        }
                                                        ?>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="8" class="text-danger text-center"><?php echo $this->lang->line('no_record_found'); ?></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>

                        <div class="tab-pane" id="documents">
                            <div class="timeline-header no-border">
                                <button type="button" data-student-session-id="<?php echo $student['student_session_id'] ?>" class="btn btn-xs btn-primary pull-right myTransportFeeBtn"> <i class="fa fa-upload"></i> <?php echo $this->lang->line('upload_documents'); ?></button>

                                <!-- <h2 class="page-header"><?php //echo $this->lang->line('documents');        
                                                                ?> <?php //echo $this->lang->line('list');        
                                                                                                                    ?></h2> -->
                                <div class="table-responsive" style="clear: both;">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <?php echo $this->lang->line('title'); ?>
                                                </th>
                                                <th>
                                                    <?php echo $this->lang->line('file'); ?> <?php echo $this->lang->line('name'); ?>
                                                </th>
                                                <th class="mailbox-date text-right">
                                                    <?php echo $this->lang->line('action'); ?>
                                                </th>
                                            </tr>
                                        </thead>
                                        <div class="row">
                                            <tbody>
                                                <?php
                                                if (empty($student_doc)) {
                                                    ?>
                                                    <tr>
                                                        <td colspan="5" class="text-danger text-center"><?php echo $this->lang->line('no_record_found'); ?></td>
                                                    </tr>
                                                    <?php
                                                    } else {
                                                        foreach ($student_doc as $value) {
                                                            ?>
                                                        <tr>
                                                            <td><?php echo $value['title']; ?></td>
                                                            <td><?php echo $value['doc']; ?></td>
                                                            <td class="mailbox-date pull-right">
                                                                <a href="<?php echo base_url(); ?>student/download/<?php echo $value['student_id'] . "/" . $value['doc']; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('download'); ?>">
                                                                    <i class="fa fa-download"></i>
                                                                </a>
                                                                <a href="<?php echo base_url(); ?>student/doc_delete/<?php echo $value['id'] . "/" . $value['student_id']; ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('<?php echo $this->lang->line('delete_confirm') ?>');">
                                                                    <i class="fa fa-remove"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                <?php
                                                    }
                                                }
                                                ?>
                                            </tbody>
                                    </table>
                                </div>
                            </div>
                            </table>
                        </div>

                        <div class="tab-pane" id="timelineh">
                            <div> <?php if ($this->rbac->hasPrivilege('student_timeline', 'can_add')) {  ?>
                                    <input type="button" id="myTimelineButton" class="btn btn-sm btn-primary pull-right " value="<?php echo $this->lang->line('add') ?>" />

                                <?php } ?>
                            </div>


                            <br />
                            <div class="timeline-header no-border">
                                <div id="timeline_list">
                                    <?php
                                    if (empty($timeline_list)) {
                                        ?>
                                        <br />
                                        <div class="alert alert-info"><?php echo $this->lang->line("no_record_found") ?></div>



                                    <?php
                                    } else { ?>

                                        <ul class="timeline timeline-inverse">
                                            <?php
                                                foreach ($timeline_list as $key => $value) {


                                                    ?>
                                                <li class="time-label">
                                                    <span class="bg-blue"> <?php
                                                                                    echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($value['timeline_date']));
                                                                                    ?></span>
                                                </li>
                                                <li>
                                                    <i class="fa fa-list-alt bg-blue"></i>
                                                    <div class="timeline-item">
                                                        <?php if ($this->rbac->hasPrivilege('student_timeline', 'can_delete')) {  ?>
                                                            <span class="time"><a class="defaults-c text-right" data-toggle="tooltip" title="" onclick="delete_timeline('<?php echo $value['id']; ?>')" data-original-title="Delete"><i class="fa fa-trash"></i></a></span>
                                                        <?php } ?>
                                                        <?php if (!empty($value["document"])) { ?>
                                                            <span class="time"><a class="defaults-c text-right" style="color:#0084B4" data-toggle="tooltip" title="" href="<?php echo base_url() . "admin/timeline/download/" . $value["id"] . "/" . $value["document"] ?>" data-original-title="Download"><i class="fa fa-download"></i></a></span>
                                                        <?php } ?>
                                                        <h3 class="timeline-header text-aqua"> <?php echo $value['title']; ?> </h3>
                                                        <div class="timeline-body">
                                                            <?php echo $value['description']; ?>

                                                        </div>

                                                    </div>
                                                </li>

                                            <?php }  ?>
                                            <li><i class="fa fa-clock-o bg-gray"></i></li>
                                        <?php } ?>
                                        </ul>
                                </div>


                                <!-- <h2 class="page-header"><?php //echo $this->lang->line('documents');        
                                                                ?> <?php //echo $this->lang->line('list');        
                                                                                                                    ?></h2> -->

                            </div>

                        </div>

                        <div class="tab-pane" id="exam">
                            <div class="">
                                <?php
                                if (empty($examSchedule)) {
                                    ?>
                                    <div class="alert alert-danger">
                                        No Exam Found.
                                    </div>
                                    <?php
                                    } else {
                                        foreach ($examSchedule as $key => $value) {
                                            ?>
                                        <h4 class="pagetitleh"><?php echo $value['exam_name']; ?></h4>
                                        <?php
                                                if (empty($value['exam_result'])) {
                                                    ?>
                                            <div class="alert alert-info"><?php echo $this->lang->line('no_result_prepare'); ?></div>
                                        <?php
                                                } else {
                                                    ?>
                                            <div class="table-responsive borgray around10">
                                                <div class="download_label"><?php echo $this->lang->line('exam_marks_report'); ?>
                                                </div>
                                                <table class="table table-striped table-bordered table-hover example">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <?php echo $this->lang->line('subject'); ?>
                                                            </th>
                                                            <th>
                                                                <?php echo $this->lang->line('full_marks'); ?>
                                                            </th>
                                                            <th>
                                                                <?php echo $this->lang->line('passing_marks'); ?>
                                                            </th>
                                                            <th>
                                                                <?php echo $this->lang->line('obtain_marks'); ?>
                                                            </th>
                                                            <th class="text text-right">
                                                                <?php echo $this->lang->line('result'); ?>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php
                                                                    $obtain_marks = 0;
                                                                    $total_marks = 0;
                                                                    $result = "Pass";
                                                                    $exam_results_array = $value['exam_result'];

                                                                    $s = 0;
                                                                    foreach ($exam_results_array as $result_k => $result_v) {
                                                                        $total_marks = $total_marks + $result_v['full_marks'];
                                                                        ?>
                                                            <tr>
                                                                <td> <?php
                                                                                        echo $result_v['exam_name'] . " (" . substr($result_v['exam_type'], 0, 2) . ".) ";
                                                                                        ?></td>
                                                                <td><?php echo $result_v['full_marks']; ?></td>
                                                                <td><?php echo $result_v['passing_marks']; ?></td>
                                                                <td>
                                                                    <?php
                                                                                    if ($result_v['attendence'] == "pre") {
                                                                                        echo $get_marks_student = $result_v['get_marks'];
                                                                                        $passing_marks_student = $result_v['passing_marks'];
                                                                                        if ($result == "Pass") {
                                                                                            if ($get_marks_student < $passing_marks_student) {
                                                                                                $result = "Fail";
                                                                                            }
                                                                                        }
                                                                                        $obtain_marks = (int) $obtain_marks + (int) $result_v['get_marks'];
                                                                                    } else {
                                                                                        $result = "Fail";
                                                                                        echo ($result_v['attendence']);
                                                                                    }
                                                                                    ?>
                                                                </td>
                                                                <td class="text text-center">
                                                                    <?php
                                                                                    if ($result_v['attendence'] == "pre") {
                                                                                        $passing_marks_student = $result_v['passing_marks'];

                                                                                        if ($get_marks_student < $passing_marks_student) {
                                                                                            echo "<span class='label pull-right bg-red'>" . $this->lang->line('fail') . "</span>";
                                                                                        } else {
                                                                                            echo "<span class='label pull-right bg-green'>Pass</span>";
                                                                                        }
                                                                                    } else {
                                                                                        echo "<span class='label pull-right bg-red'>" . $this->lang->line('fail') . "</span>";
                                                                                        $s++;
                                                                                    }
                                                                                    ?>
                                                                </td>
                                                            </tr>
                                                        <?php
                                                                        if ($s == count($exam_results_array)) {
                                                                            $obtain_marks = 0;
                                                                        }
                                                                    }
                                                                    ?>

                                                        <tr class="hide">

                                                            <td><?php echo $this->lang->line('exam') . ": " . $value['exam_name']; ?></td>
                                                            <td>
                                                                <?php
                                                                            if ($result == "Pass") {
                                                                                ?>
                                                                    <b class='text text-success'><?php echo $this->lang->line('result') . ": " . $result; ?></b>
                                                                <?php
                                                                            } else {
                                                                                ?>
                                                                    <b class='text text-danger'><?php echo $this->lang->line('result') . ": " . $result; ?></b>
                                                                <?php
                                                                            }
                                                                            ?></td>
                                                            <td><?php
                                                                            echo $this->lang->line('grand_total') . ": " . $obtain_marks . "/" . $total_marks;;
                                                                            ?></td>
                                                            <td><?php
                                                                            $foo = ($obtain_marks * 100) / $total_marks;
                                                                            echo $this->lang->line('percentage') . ": " . number_format((float) $foo, 2, '.', '') . "%";
                                                                            ?></td>
                                                            <td><?php
                                                                            if (!empty($gradeList)) {
                                                                                foreach ($gradeList as $key => $value) {
                                                                                    if ($foo >= $value['mark_from'] && $foo <= $value['mark_upto']) {
                                                                                        ?>
                                                                            <?php echo $this->lang->line('grade') . " : " . $value['name']; ?>
                                                                <?php
                                                                                        break;
                                                                                    }
                                                                                }
                                                                            }
                                                                            ?></td>

                                                        </tr>

                                                        <tr class="hide">
                                                            <td><?php echo $this->lang->line('name') . ": " . $student['firstname'] . " " . $student['lastname']; ?></td>
                                                            <td><?php echo $this->lang->line('hall_no') . ": " . $student['hall_no']; ?></td>
                                                            <td><?php echo $this->lang->line('admission_no') . ": " . $student['admission_no']; ?></td>
                                                            <td><?php echo $this->lang->line('class') . ": " . $student['class'] . "(" . $student["section"] . ")"; ?></td>
                                                            <td></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12" style="margin-bottom: 10px">
                                                    <div class="bgtgray">
                                                        <?php
                                                                    $foo = "";
                                                                    ?>

                                                        <div class="col-sm-3 col-xs-6">
                                                            <div class="description-block">
                                                                <h5 class="description-header"><?php echo $this->lang->line('result'); ?>:
                                                                    <span class="description-text">
                                                                        <?php
                                                                                    if ($result == "Pass") {
                                                                                        ?>
                                                                            <b class='text text-success'><?php echo $result; ?></b>
                                                                        <?php
                                                                                    } else {
                                                                                        ?>
                                                                            <b class='text text-danger'><?php echo $result; ?></b>
                                                                        <?php
                                                                                    }
                                                                                    ?>
                                                                    </span>
                                                                </h5>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3 col-xs-6">
                                                            <div class="description-block">
                                                                <h5 class="description-header"><?php echo $this->lang->line('grand_total'); ?>:
                                                                    <span class="description-text"><?php echo $obtain_marks . "/" . $total_marks; ?></span>

                                                                </h5>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3 col-xs-6">
                                                            <div class="description-block">
                                                                <h5 class="description-header"><?php echo $this->lang->line('percentage'); ?>:
                                                                    <span class="description-text"><?php
                                                                                                                $foo = ($obtain_marks * 100) / $total_marks;
                                                                                                                echo number_format((float) $foo, 2, '.', '') . "%";
                                                                                                                ?>
                                                                    </span>
                                                                </h5>
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-3 col-xs-6">
                                                            <div class="description-block">
                                                                <h5 class="description-header">
                                                                    <span class="description-text"><?php
                                                                                                                if (!empty($gradeList)) {
                                                                                                                    foreach ($gradeList as $key => $value) {
                                                                                                                        if ($foo >= $value['mark_from'] && $foo <= $value['mark_upto']) {
                                                                                                                            ?>
                                                                                    <?php echo $this->lang->line('grade') . ": " . $value['name']; ?>
                                                                        <?php
                                                                                                break;
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                    ?></span>
                                                                </h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php }
                                                ?>
                                <?php
                                    }
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</div>
<script type="text/javascript">
    $("#myTimelineButton").click(function() {
        $("#reset").click();
        $('.transport_fees_title').html("<b><?php echo $this->lang->line('add'); ?> <?php echo $this->lang->line('timeline'); ?></b>");
        $('#myTimelineModal').modal({
            backdrop: 'static',
            keyboard: false,
            show: true

        });
    });
    $(".myTransportFeeBtn").click(function() {
        $("span[id$='_error']").html("");
        $('#transport_amount').val("");
        $('#transport_amount_discount').val("0");
        $('#transport_amount_fine').val("0");
        var student_session_id = $(this).data("student-session-id");
        $('.transport_fees_title').html("<b>Upload Document</b>");
        $('#transport_student_session_id').val(student_session_id);
        $('#myTransportFeesModal').modal({
            backdrop: 'static',
            keyboard: false,
            show: true

        });
    });
</script>
<div class="modal fade" id="myTimelineModal" role="dialog">
    <div class="modal-dialog modal-sm400">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title title text-center transport_fees_title"></h4>
            </div>
            <div class="">
                <div class="">
                    <div class="">

                        <form id="timelineform" name="timelineform" method="post" enctype="multipart/form-data">
                            <?php echo $this->customlib->getCSRF(); ?>
                            <div id='timeline_hide_show'>
                                <input type="hidden" name="student_id" value="<?php echo $student["id"] ?>" id="student_id">
                                <h4></h4>
                                <div class=" col-md-12">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('title'); ?></label><small class="req"> *</small>
                                        <input id="timeline_title" name="timeline_title" placeholder="" type="text" class="form-control" />
                                        <span class="text-danger"><?php echo form_error('timeline_title'); ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                                        <input id="timeline_date" value="<?php echo set_value('timeline_date', date($this->customlib->getSchoolDateFormat())); ?>" name="timeline_date" placeholder="" type="text" class="form-control" />
                                        <span class="text-danger"><?php echo form_error('timeline_date'); ?></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('description'); ?></label>
                                        <textarea id="timeline_desc" name="timeline_desc" placeholder="" class="form-control"></textarea>
                                        <span class="text-danger"><?php echo form_error('description'); ?></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('attach_document'); ?></label>
                                        <div class="" style="margin-top:-5px; border:0; outline:none;"><input id="timeline_doc_id" name="timeline_doc" placeholder="" type="file" class="filestyle form-control" data-height="40" value="<?php echo set_value('timeline_doc'); ?>" />
                                            <span class="text-danger"><?php echo form_error('timeline_doc'); ?></span></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('visible'); ?></label>
                                        <input id="visible_check" checked="checked" name="visible_check" value="yes" placeholder="" type="checkbox" />

                                    </div>


                                </div>
                            </div>
                            <div class="modal-footer" style="clear:both">
                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal"><?php echo $this->lang->line('cancel'); ?></button>
                                <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                                <button type="reset" id="reset" style="display: none" class="btn btn-info pull-right">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myTransportFeesModal" role="dialog">
    <div class="modal-dialog modal-sm400">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title title text-center transport_fees_title"></h4>
            </div>
            <div class="">
                <div class="">
                    <div class="">
                        <input type="hidden" class="form-control" id="transport_student_session_id" value="0" readonly="readonly" />
                        <form id="form1" action="<?php echo site_url('student/create_doc') ?>" id="employeeform" name="employeeform" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                            <?php echo $this->customlib->getCSRF(); ?>
                            <div id='upload_documents_hide_show'>
                                <input type="hidden" name="student_id" value="<?php echo $student_doc_id; ?>" id="student_id">
                                <h4><?php echo $this->lang->line('upload_documents1'); ?></h4>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('title'); ?><small class="req"> *</small></label>
                                        <input id="first_title" name="first_title" placeholder="" type="text" class="form-control" value="<?php echo set_value('first_title'); ?>" />
                                        <span class="text-danger"><?php echo form_error('first_title'); ?></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('Documents'); ?></label>
                                        <div class="" style="margin-top:-5px; border:0; outline:none;"><input id="first_doc_id" name="first_doc" placeholder="" type="file" class="filestyle form-control" data-height="40" value="<?php echo set_value('first_doc'); ?>" />
                                            <span class="text-danger"><?php echo form_error('first_doc'); ?></span></div>
                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer" style="clear:both">
                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal"><?php echo $this->lang->line('cancel'); ?></button>
                                <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="scheduleModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title_logindetail"></h4>
            </div>
            <div class="modal-body_logindetail">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $this->lang->line('cancel'); ?></button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(e) {
        $("#timelineform").on('submit', (function(e) {
            var student_id = $("#student_id").val();

            e.preventDefault();
            $.ajax({
                url: "<?php echo site_url("admin/timeline/add") ?>",
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function(data) {

                    if (data.status == "fail") {

                        var message = "";
                        $.each(data.error, function(index, value) {

                            message += value;
                        });
                        errorMsg(message);
                    } else {

                        successMsg(data.message);

                        $.ajax({
                            url: '<?php echo base_url(); ?>admin/timeline/student_timeline/' + student_id,
                            success: function(res) {
                                $('#timeline_list').html(res);
                                $('#myTimelineModal').modal('toggle');
                            },
                            error: function() {
                                alert("Fail")
                            }
                        });
                        //window.location.reload(true);
                    }

                },
                error: function(e) {
                    alert("Fail");
                    console.log(e);
                }
            });


        }));
    });

    function delete_timeline(id) {

        var student_id = $("#student_id").val();
        if (confirm('<?php echo $this->lang->line("delete_confirm") ?>')) {

            $.ajax({
                url: '<?php echo base_url(); ?>admin/timeline/delete_timeline/' + id,
                success: function(res) {
                    $.ajax({
                        url: '<?php echo base_url(); ?>admin/timeline/student_timeline/' + student_id,
                        success: function(res) {
                            $('#timeline_list').html(res);

                        },
                        error: function() {
                            alert("Fail")
                        }
                    });

                },
                error: function() {
                    alert("Fail")
                }
            });
        }

    }

    function disable(id, status, role) {
        if (confirm("Are you sure you want to disable this record.")) {
            var student_id = '<?php echo $student["id"] ?>';
            $.ajax({
                type: "post",
                url: base_url + "student/getUserLoginDetails",
                data: {
                    'student_id': student_id
                },
                dataType: "json",
                success: function(response) {

                    var userid = response.id;



                    changeStatus(userid, 'no', 'student');

                }
            });

        } else {
            return false;
        }

    }

    function enable(id, status, role) {
        if (confirm("Are you sure you want to enable this record.")) {
            var student_id = '<?php echo $student["id"] ?>';
            $.ajax({
                type: "post",
                url: base_url + "student/getUserLoginDetails",
                data: {
                    'student_id': student_id
                },
                dataType: "json",
                success: function(response) {

                    var userid = response.id;



                    changeStatus(userid, 'yes', 'student');

                }
            });

        } else {
            return false;
        }

    }

    function changeStatus(rowid, status = 'no', role = 'student') {

        //  alert(rowid);
        var base_url = '<?php echo base_url() ?>';

        $.ajax({
            type: "POST",
            url: base_url + "admin/users/changeStatus",
            data: {
                'id': rowid,
                'status': status,
                'role': role
            },
            dataType: "json",
            success: function(data) {
                successMsg(data.msg);
            }
        });
    }

    $(document).ready(function() {
        $.extend($.fn.dataTable.defaults, {
            searching: false,
            ordering: false,
            paging: false,
            bSort: false,
            info: false
        });
    });

    $(document).on('click', '.schedule_modal', function() {
        $('.modal-title_logindetail').html("");
        $('.modal-title_logindetail').html("<?php echo $this->lang->line('login_details'); ?>");
        var base_url = '<?php echo base_url() ?>';
        var student_id = '<?php echo $student["id"] ?>';
        var student_first_name = '<?php echo $student["firstname"] ?>';
        var student_last_name = '<?php echo $student["lastname"] ?>';
        $.ajax({
            type: "post",
            url: base_url + "student/getlogindetail",
            data: {
                'student_id': student_id
            },
            dataType: "json",
            success: function(response) {
                var data = "";
                data += '<div class="col-md-12">';
                data += '<div class="table-responsive">';
                data += '<p class="lead text text-center">' + student_first_name + ' ' + student_last_name + '</p>';
                data += '<table class="table table-hover">';
                data += '<thead>';
                data += '<tr>';
                data += '<th>' + "<?php echo $this->lang->line('user_type'); ?>" + '</th>';
                data += '<th class="text text-center">' + "<?php echo $this->lang->line('username'); ?>" + '</th>';
                data += '<th class="text text-center">' + "<?php echo $this->lang->line('password'); ?>" + '</th>';
                data += '</tr>';
                data += '</thead>';
                data += '<tbody>';
                $.each(response, function(i, obj) {
                    data += '<tr>';
                    data += '<td><b>' + firstToUpperCase(obj.role) + '</b></td>';
                    data += '<input type=hidden name=userid id=userid value=' + obj.id + '>';
                    data += '<td class="text text-center">' + obj.username + '</td> ';
                    data += '<td class="text text-center">' + obj.password + '</td> ';
                    data += '</tr>';
                });
                data += '</tbody>';
                data += '</table>';
                data += '<b class="lead text text-danger" style="font-size:14px;"> ' + "<?php echo $this->lang->line('login_url'); ?>" + ': ' + base_url + 'site/userlogin</b>';
                data += '</div>  ';
                data += '</div>  ';
                $('.modal-body_logindetail').html(data);
                $("#scheduleModal").modal('show');
            }
        });
    });

    function firstToUpperCase(str) {
        return str.substr(0, 1).toUpperCase() + str.substr(1);
    }
</script>
<script>
    $(document).ready(function() {

        $('.detail_popover').popover({
            placement: 'right',
            title: '',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function() {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });
        var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';

        $("#timeline_date").datepicker({
            format: date_format,
            autoclose: true

        });

        $('#from_date').datepicker({
            //   format: "dd-mm-yyyy",
            format: date_format,
            autoclose: true
        });

        $('#to_date').datepicker({
            //   format: "dd-mm-yyyy",
            format: date_format,
            autoclose: true
        });



        var tbl = $('.report-table');

        var table = $('.report-table').DataTable({
            "aaSorting": [],
            // "serverSide": true,
            "ajax": {
                "url": '<?php echo base_url(); ?>admin/stuattendence/ajaxAttendanceList',
                "type": "POST",
                "data": function (d) {
                    d.student_id = $("#student_id").val();
                    d.from_date = $('#from_date').val();
                    d.to_date = $('#to_date').val();
                }
            },
            rowReorder: {
                selector: 'td:nth-child(2)'
            },
            dom: "Bfrtip",
            buttons: [
                {
                    extend: 'copyHtml5',
                    text: '<i class="fa fa-files-o"></i>',
                    titleAttr: 'Copy',
                    title: $('.download_label').html(),
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'excelHtml5',
                    text: '<i class="fa fa-file-excel-o"></i>',
                    titleAttr: 'Excel',

                    title: $('.download_label').html(),
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'csvHtml5',
                    text: '<i class="fa fa-file-text-o"></i>',
                    titleAttr: 'CSV',
                    title: $('.download_label').html(),
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'pdfHtml5',
                    text: '<i class="fa fa-file-pdf-o"></i>',
                    titleAttr: 'PDF',
                    title: $('.download_label').html(),
                    orientation:'landscape',
                    pageSize: 'A2',
                    alignment: "center",
                    exportOptions: {
                        columns: ':visible',
                    }
                },
                {
                    extend: 'print',
                    text: '<i class="fa fa-print"></i>',
                    titleAttr: 'Print',
                    title: $('.download_label').html(),
                    customize: function ( win ) {
                        $(win.document.body)
                            .css( 'font-size', '10pt' );

                        $(win.document.body).find( 'table' )
                            .addClass( 'compact' )
                            .css( 'font-size', 'inherit' );
                    },
                    exportOptions: {
                        columns: ':visible',
                    }
                },
                {
                    extend: 'colvis',
                    text: '<i class="fa fa-columns"></i>',
                    titleAttr: 'Columns',
                    title: $('.download_label').html(),
                    postfixButtons: ['colvisRestore']
                },
            ],
            "bSort": true,
            "order": [[ 0, 'desc' ]],
        });


        $(document).on('click', '#search', function(e) {
            e.preventDefault();
            table.ajax.reload();
        });

    });
</script>