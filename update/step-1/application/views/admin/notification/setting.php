

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-gears"></i> <?php echo $this->lang->line('system_settings'); ?>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- left column -->
                <form id="form1" action="<?php echo site_url('admin/notification/setting') ?>"  id="employeeform" name="employeeform" method="post" accept-charset="utf-8">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-commenting-o"></i> <?php echo $this->lang->line('notification_setting'); ?></h3>
                        </div>
                        <div class="around10">
                            <?php if ($this->session->flashdata('msg')) { ?>
                                <?php echo $this->session->flashdata('msg') ?>
                            <?php } ?> 
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover ">
                                <thead>
                                <th><?php echo $this->lang->line('event'); ?></th>
                                <th><?php echo $this->lang->line('option'); ?></th>
                                <th><?php echo $this->lang->line('sample_message'); ?></th>
                                </thead>
                                <tbody>

                                    <?php
                                    $content = array($this->lang->line('student_admission') => "Dear Edward Thomas your admission is confirm in Class: Class 1st Section: A for Session: 2018-19 for more detail contact System Admin",
                                        $this->lang->line('fees_submission') => 'Fees received for Edward Thomas Fees Amount Rs. 1500/- Received by Mount Carmel School',
                                        $this->lang->line('absent_student') => 'Absent Notice :Edward Thomas was absent on date 25/03/2018 from Mount Carmel School',
                                        $this->lang->line('exam_result') => 'Edward Thomas is pass in Mid Term Exam with total marks 521 out of 600',
                                        $this->lang->line('login_credential') => 'Hello Edward Thomas your login details for Url: https://demo.smart-school.in Username: std437 Password: kh8f3ak'
                                    );
                                    $last_key = count($notificationMethods);
                                    $i = 1;
                                    foreach ($notificationMethods as $note_key => $note_value) {


                                        $mail_checked = "";
                                        $sms_checked = "";
                                        $post_back = checkExists($notificationlist, $note_key);
                                        if ($post_back) {
                                            $mail_checked = ($post_back['is_mail']) ? "checked=checked" : "";
                                            $sms_checked = ($post_back['is_sms']) ? "checked=checked" : "";
                                            $notification_checked = ($post_back['is_notification']) ? "checked=checked" : "";
                                            $display_notification = ($post_back['display_notification']) ? 1 : 0;
                                        }

                                        $hr = "";

                                        if ($i != $last_key) {
                                            $hr = "<hr>";
                                        }
                                        ?>

                                        <tr>
                                            <td>
                                                <?php echo $note_value; ?>
                                            </td>
                                            <td>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="<?php echo $note_key ?>_mail" value="1" <?php echo $mail_checked; ?>> <?php echo $this->lang->line('email'); ?>
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="<?php echo $note_key ?>_sms" value="1" <?php echo $sms_checked; ?>> <?php echo $this->lang->line('sms'); ?>
                                                </label>
                                                <?php 
if($display_notification){
    ?>

                                                 <label class="checkbox-inline">
                                                    <input type="checkbox" name="<?php echo $note_key ?>_notification" value="1" <?php echo $notification_checked; ?>> <?php echo $this->lang->line('mobile_app'); ?>
                                                </label>
    <?php

}
                                                 ?>
                                            </td>
                                            <td> 
                                                <?php
                                                if (!empty($note_value)) {
                                                    echo $content[$note_value];
                                                }
                                                ?> 
                                                <input type="hidden" name="key_array[]" value="<?php echo $note_key ?>">
                                            </td>
                                        </tr>     

  <?php
                                        // echo $hr;
                                        $i++;
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>  
                        <div class="box-footer">
                            <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                        </div>   
                </form>                 
            </div>

        </div>
</div><!--./wrapper-->

</section><!-- /.content -->
</div>

<?php

function checkExists($notificationlist, $key) {

    foreach ($notificationlist as $not_key => $not_value) {
        if ($not_value->type == $key) {
            return array(
                'is_mail' => $not_value->is_mail,
                'is_sms' => $not_value->is_sms,
                'is_notification' => $not_value->is_notification,
                'display_notification' => $not_value->display_notification,
            );
        }
    }
    return false;
}
?>