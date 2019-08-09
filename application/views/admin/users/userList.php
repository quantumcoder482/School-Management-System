<style type="text/css">
    .material-switch>input[type="checkbox"] {
        display: none;
    }

    .material-switch>label {
        cursor: pointer;
        height: 0px;
        position: relative;
        width: 40px;
    }

    .material-switch>label::before {
        background: rgb(0, 0, 0);
        box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
        border-radius: 8px;
        content: '';
        height: 16px;
        margin-top: -8px;
        position: absolute;
        opacity: 0.3;
        transition: all 0.4s ease-in-out;
        width: 40px;
    }

    .material-switch>label::after {
        background: rgb(255, 255, 255);
        border-radius: 16px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
        content: '';
        height: 24px;
        left: -4px;
        margin-top: -8px;
        position: absolute;
        top: -4px;
        transition: all 0.3s ease-in-out;
        width: 24px;
    }

    .material-switch>input[type="checkbox"]:checked+label::before {
        background: inherit;
        opacity: 0.5;
    }

    .material-switch>input[type="checkbox"]:checked+label::after {
        background: inherit;
        left: 20px;
    }
</style>

<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-gears"></i> <?php echo $this->lang->line('system_settings'); ?>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">

            <div class="col-md-12">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs pull-right">

                        <li><a href="#tab_staff" data-toggle="tab"><?php echo $this->lang->line('staff') ?></a></li>
                        <li><a href="#tab_parent" data-toggle="tab"><?php echo $this->lang->line('parent') ?></a></li>
                        <li class="active"><a href="#tab_students" data-toggle="tab"><?php echo $this->lang->line('student') ?></a></li>

                        <li class="pull-left header"><i class="fa fa-users"></i> <?php echo $this->lang->line('users'); ?></li>
                    </ul>
                    <div class="tab-content">

                        <div class="tab-pane active table-responsive" id="tab_students">
                            <div class="download_label"><?php echo $this->lang->line('users'); ?></div>
                            <div id="ib_student_hidden" style="display: none;">
                                <a href="#" id="delete_multiple_students" class="btn btn-danger"><i class="fa fa-trash"></i> <?php echo $this->lang->line('delete'); ?></a>
                                <hr>
                            </div>
                            <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="no-sort"><input id="student_select_all" type="checkbox" value="" name="" class="student-i-checks" /></th>
                                        <th><?php echo $this->lang->line('admission_no'); ?></th>
                                        <th><?php echo $this->lang->line('student_name'); ?></th>
                                        <th><?php echo $this->lang->line('username'); ?></th>
                                        <th><?php echo $this->lang->line('class'); ?></th>
                                        <th><?php echo $this->lang->line('father_name'); ?></th>

                                        <th><?php echo $this->lang->line('mobile_no'); ?></th>

                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (!empty($studentList)) {
                                        $count = 1;
                                        foreach ($studentList as $student) {
                                            ?>
                                            <tr>
                                                <td><input type="checkbox" id="student_<?php echo $student['id']; ?>" class="student-i-checks"></td>
                                                <td><?php echo $student['admission_no']; ?></td>
                                                <td>
                                                    <a href="<?php echo base_url(); ?>student/view/<?php echo $student['id']; ?>"><?php echo $student['firstname'] . " " . $student['lastname']; ?>
                                                    </a>
                                                </td>
                                                <td><?php echo $student['username']; ?></td>
                                                <td><?php echo $student['class'] . "(" . $student['section'] . ")" ?></td>
                                                <td><?php echo $student['father_name']; ?></td>

                                                <td><?php echo $student['mobileno']; ?></td>

                                                <td class="pull-right">
                                                    <div class="material-switch pull-right">

                                                        <input id="student<?php echo $student['user_tbl_id'] ?>" name="someSwitchOption001" type="checkbox" data-role="student" class="chk" data-rowid="<?php echo $student['user_tbl_id'] ?>" value="checked" <?php if ($student['user_tbl_active'] == "yes") echo "checked='checked'"; ?> />
                                                        <label for="student<?php echo $student['user_tbl_id'] ?>" class="label-success"></label>
                                                    </div>

                                                </td>
                                            </tr>
                                            <?php
                                            $count++;
                                        }
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.tab-pane -->
                        <div class="tab-pane table-responsive" id="tab_parent">
                            <div class="download_label"><?php echo $this->lang->line('users'); ?></div>
                            <div id="ib_act_hidden" style="display: none;">
                                <a href="#" id="delete_multiple_parents" class="btn btn-danger"><i class="fa fa-trash"></i> <?php echo $this->lang->line('delete'); ?></a>
                                <hr>
                            </div>
                            <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <!-- <th class="no-sort"><input id="parent_select_all" type="checkbox" class="i-checks" /></th> -->
                                        <th><?php echo $this->lang->line('guardian_name'); ?></th>
                                        <th><?php echo $this->lang->line('guardian_phone'); ?></th>
                                        <th><?php echo $this->lang->line('username'); ?></th>

                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (!empty($parentList)) {

                                        $count = 1;
                                        foreach ($parentList as $parent) {
                                            ?>
                                            <tr>
                                                <!-- <td><input type="checkbox" id="parent_<?php echo $parent->id; ?>" class="i-checks"> </td> -->
                                                <td><?php echo $parent->guardian_name; ?></td>
                                                <td><?php echo $parent->guardian_phone; ?></td>
                                                <td><?php echo $parent->username; ?></td>
                                                <td class="pull-right">
                                                    <div class="material-switch pull-right">

                                                        <input id="parent<?php echo $parent->id ?>" name="someSwitchOption001" type="checkbox" class="chk" data-rowid="<?php echo $parent->parent_id ?>" data-role="parent" value="checked" <?php if ($parent->is_active == "yes") echo "checked='checked'"; ?> />
                                                        <label for="parent<?php echo $parent->id ?>" class="label-success"></label>
                                                    </div>

                                                </td>
                                            </tr>

                                        <?php
                                    }
                                }

                                //                                    if (!empty($parentList)) {
                                //                                        $count = 1;
                                //                                        foreach ($parentList as $parent) {
                                //                                            if (!empty($parent->siblings)) {
                                //                                                $sibling = $parent->siblings;
                                //                                                
                                ?>
                                    <!--                                                <tr>
    <td>//<?php echo $sibling[0]['guardian_name']; ?></td>
    <td>//<?php echo $sibling[0]['guardian_phone']; ?></td>
    <td>//<?php echo $sibling[0]['guardian_address']; ?></td>
    <td class="pull-right">
        <div class="material-switch pull-right">

            <input id="parent//<?php echo $parent->id ?>" name="someSwitchOption001" type="checkbox" class="chk" data-rowid="<?php echo $parent->id ?>" value="checked" <?php if ($parent->is_active == "yes") echo "checked='checked'"; ?> />
            <label for="parent//<?php echo $parent->id ?>" class="label-success"></label>
        </div>

    </td>
</tr>-->
                                    <?php
                                    //                                            }
                                    //
                                    //
                                    //                                            $count++;
                                    //                                        }
                                    //                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane table-responsive" id="tab_staff">
                            <div class="download_label"><?php echo $this->lang->line('users'); ?></div>
                            <div id="ib_staff_hidden" style="display: none;">
                                <a href="#" id="delete_multiple_staff" class="btn btn-danger"><i class="fa fa-trash"></i> <?php echo $this->lang->line('delete'); ?></a>
                                <hr>
                            </div>
                            <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th><input id="staff_select_all" type="checkbox" class="staff-i-checks" /></th>
                                        <th><?php echo $this->lang->line('staff_id'); ?></th>
                                        <th><?php echo $this->lang->line('name'); ?></th>
                                        <th><?php echo $this->lang->line('email'); ?></th>
                                        <th><?php echo $this->lang->line('role'); ?></th>
                                        <th><?php echo $this->lang->line('designation'); ?></th>
                                        <th><?php echo $this->lang->line('department'); ?></th>
                                        <th><?php echo $this->lang->line('phone'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('action'); ?>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (!empty($staffList)) {
                                        $count = 1;
                                        foreach ($staffList as $staff) {
                                            if ($staff['id'] != $currentUserId) {
                                                ?>
                                                <tr>
                                                    <td><input type="checkbox" id="staff_<?php echo $staff['id']; ?>" class="staff-i-checks"> </td>
                                                    <td class="mailbox-name"> <?php echo $staff['employee_id'] ?></td>
                                                    <td class="mailbox-name"> <a href="<?php echo base_url(); ?>admin/staff/profile/<?php echo $staff['id']; ?>"><?php echo $staff['name'] ?></a></td>
                                                    <td class="mailbox-name"> <?php echo $staff['email'] ?></td>
                                                    <td class="mailbox-name"> <?php echo $staff['role'] ?></td>
                                                    <td class="mailbox-name"> <?php echo $staff['designation'] ?></td>
                                                    <td class="mailbox-name"> <?php echo $staff['department'] ?></td>

                                                    <td class="mailbox-name"> <?php echo $staff['contact_no'] ?></td>
                                                    <td class="pull-right">
                                                        <div class="material-switch pull-right">

                                                            <input id="staff<?php echo $staff['id'] ?>" name="someSwitchOption001" type="checkbox" class="chk" data-rowid="<?php echo $staff['id'] ?>" data-role="staff" value="checked" <?php if ($staff['is_active'] == 1) echo "checked='checked'"; ?> />
                                                            <label for="staff<?php echo $staff['id'] ?>" class="label-success"></label>
                                                        </div>

                                                    </td>
                                                </tr>
                                            <?php
                                        }
                                    }
                                    $count++;
                                }
                                ?>
                                </tbody>
                            </table>
                        </div>

                        <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                </div>
            </div>
        </div>
    </section>
</div>


<script type="text/javascript">
    $(document).ready(function() {
        $(document).on('click', '.chk', function() {
            var checked = $(this).is(':checked');
            var rowid = $(this).data('rowid');
            var role = $(this).data('role');
            if (checked) {
                if (!confirm('Are you sure you active account?')) {
                    $(this).removeAttr('checked');
                } else {
                    var status = "yes";
                    changeStatus(rowid, status, role);

                }
            } else if (!confirm('Are you sure you deactive account?')) {
                $(this).prop("checked", true);
            } else {
                var status = "no";
                changeStatus(rowid, status, role);

            }

        });

        // Delete multiple items

        var active_tab = 'students';
        $tab = localStorage.getItem('tabname') ? localStorage.getItem('tabname') : active_tab;

        if ($tab == 'staff') {
            $('.nav-tabs a[href="#tab_staff"]').tab('show');
            localStorage.setItem('tabname', '');
        } else {
            $('.nav-tabs a[href="#tab_students"]').tab('show');
            localStorage.setItem('tabname', '');
        }


        var selected_student = [];
        var ib_student_hidden = $("#ib_student_hidden");

        function ib_student_trigger() {
            if (selected_student.length > 0) {
                ib_student_hidden.show(200);
            } else {
                ib_student_hidden.hide(200);
            }
        }


        function listen_change_student() {


            var i_checks = $('.student-i-checks');
            i_checks.iCheck({
                checkboxClass: 'icheckbox_square-blue',
            });


            i_checks.on('ifChanged', function(event) {

                var id = $(this)[0].id;

                var index = $.inArray(id, selected_student);

                if ($(this).iCheck('update')[0].checked) {

                    if (id == 'student_select_all') {

                        //   ib_dt.rows().select();

                        i_checks.iCheck('check');

                        return;
                    }

                    selected_student.push(id);

                    //  $(this).closest('tr').toggleClass('selected');

                    ib_student_trigger();

                } else {

                    if (id == 'student_select_all') {

                        i_checks.iCheck('uncheck');

                        return;
                    }

                    selected_student.splice(index, 1);

                    //  $(this).closest('tr').toggleClass('selected');

                    ib_student_trigger();

                }

            });

        }

        listen_change_student();



        $("#delete_multiple_students").click(function(e) {

            e.preventDefault();
            console.log(selected_student);

            var base_url = '<?php echo base_url() ?>';
            if (confirm('Are you sure you delete accounts?')) {
                $.ajax({
                    type: "POST",
                    url: base_url + "admin/users/deletestudents",
                    data: {
                        ids: selected_student
                    },
                    dataType: "json",
                    success: function(data) {
                        successMsg(data.msg);
                        setTimeout(() => {
                            location.reload();
                        }, 1000);

                    }
                });

            }
        });




        //  remove multiple staffs


        var selected_staff = [];
        var ib_staff_hidden = $("#ib_staff_hidden");

        function ib_staff_trigger() {
            if (selected_staff.length > 0) {
                ib_staff_hidden.show(200);
            } else {
                ib_staff_hidden.hide(200);
            }
        }


        function listen_change_staff() {


            var i_checks = $('.staff-i-checks');
            i_checks.iCheck({
                checkboxClass: 'icheckbox_square-blue',
            });


            i_checks.on('ifChanged', function(event) {

                var id = $(this)[0].id;

                var index = $.inArray(id, selected_staff);

                if ($(this).iCheck('update')[0].checked) {

                    if (id == 'staff_select_all') {

                        //   ib_dt.rows().select();

                        i_checks.iCheck('check');

                        return;
                    }

                    selected_staff.push(id);

                    //  $(this).closest('tr').toggleClass('selected');

                    ib_staff_trigger();

                } else {

                    if (id == 'staff_select_all') {

                        i_checks.iCheck('uncheck');

                        return;
                    }

                    selected_staff.splice(index, 1);

                    //  $(this).closest('tr').toggleClass('selected');

                    ib_staff_trigger();

                }

            });

        }

        listen_change_staff();



        $("#delete_multiple_staff").click(function(e) {

            e.preventDefault();
            console.log(selected_staff);
            localStorage.setItem('tabname', 'staff');

            var base_url = '<?php echo base_url() ?>';
            if (confirm('Are you sure you delete accounts?')) {
                $.ajax({
                    type: "POST",
                    url: base_url + "admin/users/deletestaffs",
                    data: {
                        ids: selected_staff
                    },
                    dataType: "json",
                    success: function(data) {
                        successMsg(data.msg);
                        setTimeout(() => {
                            location.reload();
                        }, 1000);

                    }
                });

            }
        });

        function changeStatus(rowid, status, role) {


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

    });
</script>