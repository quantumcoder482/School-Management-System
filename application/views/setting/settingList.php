<style type="text/css">


    .modal-dialog2 {margin: 1% auto;}
.color_box {
  float: left;
 width: 10px;
    height: 10px;
  margin: 5px;
  border: 1px solid rgba(0, 0, 0, .2);
}
</style>

<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1><i class="fa fa-gears"></i> <?php echo $this->lang->line('system_settings'); ?></h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">

            <div class="col-md-3">
                <div class="box box-primary">
                    <div class="box-body text-center">

                        
                        <?php
if ($settinglist[0]['image'] == "") {
    ?>
                            <img src="<?php echo base_url() ?>uploads/school_content/logo/images.png" class="img-thumbnail" alt="Logo" width="304" height="236">
                            <?php
} else {
    ?>
                            <img src="<?php echo base_url() ?>uploads/school_content/logo/<?php echo $settinglist[0]['image']; ?>" class="img-thumbnail" alt="Logo" width="304" height="236">
                            <?php
}
?>
                        <br/>
                        <br/>
                        <a href="#schsetting" role="button" class="btn btn-primary btn-sm upload_logo" data-toggle="tooltip" data-logo_type="logo" title="<?php echo $this->lang->line('edit_logo'); ?>" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><i class="fa fa-picture-o"></i> <?php echo $this->lang->line('edit_logo'); ?></a>
                        <br/>
                        <br/>
                        <div class="clearfix">
                            
                        </div>

                        <hr/>
  <?php
if ($settinglist[0]['app_logo'] == "") {
    ?>
                            <img src="<?php echo base_url() ?>uploads/school_content/logo/images.png" class="img-thumbnail" alt="Logo" width="304" height="236">
                            <?php
} else {
    ?>
                            <img src="<?php echo base_url() ?>uploads/school_content/logo/app_logo/<?php echo $settinglist[0]['app_logo']; ?>" class="img-thumbnail" alt="Logo" width="304" height="236">
                            <?php
}
?>
                        <br/>
                        <br/>
                        <a href="#schsetting" role="button" class="btn btn-primary btn-sm upload_logo" data-toggle="tooltip" data-logo_type="app_logo"  title="<?php echo $this->lang->line('edit'); ?> <?php echo $this->lang->line('mobile_app_logo'); ?>" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><i class="fa fa-picture-o"></i> <?php echo $this->lang->line('edit'); ?> <?php echo $this->lang->line('mobile_app_logo'); ?></a>

                    </div>
                </div>
            </div><!--./col-md-3-->
            <div class="col-md-9">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-gear"></i> <?php echo $this->lang->line('general_settings'); ?></h3>
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <!-- Button to trigger modal -->
                                <a href="#schsetting" role="button" class="btn btn-primary btn-sm checkbox-toggle pull-right edit_setting" data-toggle="tooltip" title="<?php echo $this->lang->line('edit_setting'); ?>" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><i class="fa fa-pencil"></i> <?php echo $this->lang->line('edit'); ?></a>
                            </div>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="mailbox-controls">
                        </div>
                        <div class="table-responsive mailbox-messages">
                            <table class="table table-bordered table-hover table-striped">
                                <?php //echo $this->session->userdata['admin']['date_format'];
?>
                                <tbody>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('school_name'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo $settinglist[0]['name'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('address'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo $settinglist[0]['address'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('phone'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo $settinglist[0]['phone'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('email'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo $settinglist[0]['email'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('school_code'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo $settinglist[0]['dise_code'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('session'); ?></strong></td>
                                        <td class="mailbox-name">
                                            <?php echo $settinglist[0]['current_session']['session']; ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('session_start_month'); ?></strong></td>
                                        <td class="mailbox-name">
                                            <?php
foreach ($monthList as $key => $value) {
    if ($key == $settinglist[0]['start_month']) {
        echo $value;
    }

}
?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('teacher_restricted_mode'); ?></strong></td>
                                        <td class="mailbox-name"> <?php
if ($settinglist[0]['class_teacher'] == "yes") {
    echo "Enabled ";
} else {
    echo "Disabled ";
}
?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('language'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo $settinglist[0]['language'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('language_rtl_text_mode'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo ucfirst($settinglist[0]['is_rtl']); ?></td>
                                    </tr>

                                    <tr>
                                        <td><strong><?php echo $this->lang->line('timezone'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo $settinglist[0]['timezone'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('date_format'); ?></strong></td>
                                        <td class="mailbox-name">
                                            <?php
foreach ($dateFormatList as $k => $f_v) {
    if ($k == $settinglist[0]['date_format']) {
        echo $f_v;
        break;
    }
}
?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('currency'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo $settinglist[0]['currency'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('currency_symbol'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo $settinglist[0]['currency_symbol'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('fee_due_days'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo $settinglist[0]['fee_due_days'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('mobile_app_api_url'); ?></strong></td>
                                        <td class="mailbox-name"> <?php echo $settinglist[0]['mobile_api_url'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('app_primary_color_code'); ?></strong></td>
                                        <td> <div class="color_box" style="background: <?php echo $settinglist[0]['app_primary_color_code'] ?>"></div><?php echo $settinglist[0]['app_primary_color_code'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo $this->lang->line('app_secondary_color_code'); ?></strong></td>
                                        <td> <div class="color_box" style="background: <?php echo $settinglist[0]['app_secondary_color_code'] ?>"></div><?php echo $settinglist[0]['app_secondary_color_code'] ?></td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">

                            <hr style="width: 98.9%; margin: 32px auto 20px;" />
                            <div class="col-md-12 col-sm-12">
                                <label for="input-type"><?php echo $this->lang->line('current_theme'); ?></label></div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-sm-3 col-xs-6">
                                <img class="<?php echo ($settinglist[0]['theme'] == "default.jpg") ? "radioactive" : ""; ?> img-responsive radioborder" src="<?php echo base_url(); ?>backend/images/default.jpg">
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-6">
                                <img class="<?php echo ($settinglist[0]['theme'] == "red.jpg") ? "radioactive" : ""; ?> img-responsive radioborder" src="<?php echo base_url(); ?>backend/images/red.jpg">
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-6">
                                <img class="<?php echo ($settinglist[0]['theme'] == "blue.jpg") ? "radioactive" : ""; ?> img-responsive radioborder" src="<?php echo base_url(); ?>backend/images/blue.jpg">

                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-6">

                                <img class="<?php echo ($settinglist[0]['theme'] == "gray.jpg") ? "radioactive" : ""; ?> img-responsive radioborder" src="<?php echo base_url(); ?>backend/images/gray.jpg">
                            </div>
                        </div>



                    </div>
                </div>
            </div><!--./col-md-9-->


        </div>

    </section>
</div>



<div id="schsetting" class="modal fade " role="dialog">
    <div class="modal-dialog modal-dialog2 modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><?php echo $this->lang->line('system_settings'); ?></h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <form role="form" id="schsetting_form"  action="<?php echo site_url('schsettings/ajaxedit') ?>">
                        <input type="hidden" name="sch_id" value="0">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('school_name'); ?></label><small class="req"> *</small>

                            <input class="form-control" id="name" name="sch_name" placeholder="" type="text"  />
                            <span class="text-danger"><?php echo form_error('name'); ?></span>

                        </div>

                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1">
                                <?php echo $this->lang->line('school_code'); ?></label>

                            <input id="dise_code" name="sch_dise_code" placeholder="" type="text" class="form-control"  />
                            <span class="text-danger"><?php echo form_error('dise_code'); ?></span>
                        </div>

                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('address'); ?></label><small class="req"> *</small>

                            <textarea class="form-control" style="resize: none;" rows="2" id="address" name="sch_address" placeholder=""></textarea>
                            <span class="text-danger"><?php echo form_error('address'); ?></span>

                        </div>

                        <div class="clearfix"></div>

                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('phone'); ?></label><small class="req"> *</small>

                            <input class="form-control" id="phone" name="sch_phone" placeholder="" type="text"/>
                            <span class="text-danger"><?php echo form_error('phone'); ?></span>
                        </div>

                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('email'); ?></label>
                            <small class="req"> *</small>
                            <input class="form-control" id="email" name="sch_email" placeholder="" type="text"/>
                            <span class="text-danger"><?php echo form_error('email'); ?></span>
                        </div>

                        <div class="clearfix"></div>

                        <div class="form-group  col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('session'); ?></label><small class="req"> *</small>

                            <select  id="session_id" name="sch_session_id" class="form-control" >
                                <option value=""><?php echo $this->lang->line('select'); ?></option>
                                <?php
foreach ($sessionlist as $session) {
    ?>
                                    <option value="<?php echo $session['id'] ?>"><?php echo $session['session'] ?></option>
                                    <?php
}
?>
                            </select>
                            <span class="text-danger"><?php echo form_error('session_id'); ?></span>
                        </div>
                        <div class="form-group  col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('session_start_month'); ?></label><small class="req"> *</small>

                            <select  id="start_month" name="sch_start_month" class="form-control" >
                                <option value=""><?php echo $this->lang->line('select'); ?></option>
                                <?php
foreach ($monthList as $key => $month) {
    ?>
                                    <option value="<?php echo $key ?>"><?php echo $month ?></option>
                                    <?php
}
?>
                            </select>
                            <span class="text-danger"><?php echo form_error('session_id'); ?></span>
                        </div>
                        <div class="form-group  col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <label for="IsSmallBusiness"><?php echo $this->lang->line('teacher_restricted_mode'); ?></label>
                            <div class="clearfix"></div>
                            <label class="radio-inline">
                                <input type="radio" name="class_teacher" value="no" ><?php echo $this->lang->line('disabled'); ?>
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="class_teacher" checked value="yes"><?php echo $this->lang->line('enabled'); ?>
                            </label>
                        </div>

                        <div class="clearfix"></div>

                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('language'); ?></label><small class="req"> *</small>

                            <select  id="language_id" name="sch_lang_id" class="form-control" >
                                <option value="">--Select--</option>
                                <?php
foreach ($languagelist as $language) {
    ?>
                                    <option value="<?php echo $language['id'] ?>"><?php echo $language['language'] ?></option>
                                    <?php
}
?>
                            </select>
                            <span class="text-danger"><?php echo form_error('language_id'); ?></span>
                        </div>


                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="IsSmallBusiness"><?php echo $this->lang->line('language_rtl_text_mode'); ?></label>
                            <div class="clearfix"></div>
                            <label class="radio-inline">
                                <input type="radio" name="sch_is_rtl" value="disabled" ><?php echo $this->lang->line('disabled'); ?>
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sch_is_rtl" value="enabled"><?php echo $this->lang->line('enabled'); ?>
                            </label>
                        </div>

                        <div class="clearfix"></div>


                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('timezone'); ?></label><small class="req"> *</small>

                            <select  id="language_id" name="sch_timezone" class="form-control" >
                                <option value="">--Select--</option>
                                <?php
foreach ($timezoneList as $key => $timezone) {
    ?>
                                    <option value="<?php echo $key ?>" ><?php echo $timezone ?></option>
                                    <?php
}
?>
                            </select>
                            <span class="text-danger"><?php echo form_error('timezone'); ?></span>
                        </div>

                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('date_format'); ?></label><small class="req"> *</small>

                            <select  id="date_format" name="sch_date_format" class="form-control" >
                                <option value=""><?php echo $this->lang->line('select'); ?></option>
                                <?php
foreach ($dateFormatList as $key => $dateformat) {
    ?>
                                    <option value="<?php echo $key ?>"><?php echo $dateformat; ?></option>
                                    <?php
}
?>
                            </select>
                            <span class="text-danger"><?php echo form_error('date_format'); ?></span>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('currency'); ?></label><small class="req"> *</small>


                            <select  id="currency" name="sch_currency" class="form-control" >
                                <option value=""><?php echo $this->lang->line('select'); ?></option>
                                <?php
foreach ($currencyList as $currency) {
    ?>
                                    <option value="<?php echo $currency ?>"><?php echo $currency; ?></option>

                                    <?php
}
?>
                            </select>
                            <span class="text-danger"><?php echo form_error('currency'); ?></span>
                        </div>

                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('currency_symbol'); ?></label><small class="req"> *</small>

                            <input id="currency_symbol" name="sch_currency_symbol" placeholder="" type="text" class="form-control" />
                            <span class="text-danger"><?php echo form_error('currency_symbol'); ?></span>
                        </div>
                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('fee_due_days'); ?></label><small class="req"> *</small>

                            <input type="number" name="fee_due_days" id="fee_due_days" class="form-control">

                            <span class="text-danger"><?php echo form_error('fee_due_days'); ?></span>
                        </div>
                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('mobile_app_api_url'); ?></label>
                            <input type="text" name="mobile_api_url" id="mobile_api_url" class="form-control">
                            <span class="text-danger"><?php echo form_error('mobile_api_url'); ?></span>
                        </div>
                           <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('app_primary_color_code'); ?></label>

                            <input type="text" name="app_primary_color_code" id="app_primary_color_code" class="form-control">

                            <span class="text-danger"><?php echo form_error('app_primary_color_code'); ?></span>
                        </div>
                        <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?php echo $this->lang->line('app_secondary_color_code'); ?></label>
                            <input type="text" name="app_secondary_color_code" id="app_secondary_color_code" class="form-control">
                            <span class="text-danger"><?php echo form_error('app_secondary_color_code'); ?></span>
                        </div>
                       <!--  <div class="form-group  col-xs-12 col-sm-12 col-md-12 col-lg-6">
                         <label for="exampleInputFile"><?php echo $this->lang->line('mobile_app_logo'); ?></label>
                                    <div><input class="filestyle form-control" type='file' name="file"  />
                                    </div>
                                    <span class="text-danger"><?php echo form_error('file'); ?></span>
                        </div> -->

                        <div class="clearfix"></div>
                        <hr/>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <label for="input-type"><?php echo $this->lang->line('current_theme'); ?></label>

                                <div id="input-type">
                                    <div class="row">
                                        <div class="col-sm-3 col-xs-6">
                                            <label class="radio-img">
                                                <input name="theme"  value="default.jpg" type="radio" />
                                                <img src="<?php echo base_url(); ?>backend/images/default.jpg">
                                            </label>
                                        </div>
                                        <div class="col-sm-3 col-xs-6">
                                            <label class="radio-img">

                                                <input name="theme"  value="red.jpg" type="radio" />
                                                <img src="<?php echo base_url(); ?>backend/images/red.jpg">
                                            </label>
                                        </div>
                                        <div class="col-sm-3 col-xs-6">
                                            <label class="radio-img">

                                                <input name="theme" value="blue.jpg" type="radio" />
                                                <img src="<?php echo base_url(); ?>backend/images/blue.jpg">
                                            </label>
                                        </div>
                                        <div class="col-sm-3 col-xs-6">
                                            <label class="radio-img">

                                                <input name="theme" value="gray.jpg" type="radio" />
                                                <img src="<?php echo base_url(); ?>backend/images/gray.jpg">
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                            <button type="button" class="btn btn-primary submit_schsetting pull-right" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"> <?php echo $this->lang->line('save'); ?></button>
                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="modal-uploadfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><?php echo $this->lang->line('edit_logo'); ?></h4>
            </div>
            <div class="modal-body upload_logo_body">
                <!-- ==== -->
                <form class="box_upload boxupload has-advanced-upload" method="post" action="<?php echo site_url('schsettings/ajax_editlogo') ?>" enctype="multipart/form-data">
                    <input value="<?php echo $settinglist[0]['id'] ?>" type="hidden" name="id" id="id_logo"/>
                    <input type="file" name="file" id="file">
                    <!-- Drag and Drop container-->
                    <div class="box__input upload-area"  id="uploadfile">
 <i class="fa fa-download box__icon"></i>
                         <label><strong>Choose a file</strong><span class="box__dragndrop"> or <span>Drag</span>it here</span>.</label>

                    </div>

                </form>
            </div>

        </div>
    </div>
</div>



<script type="text/javascript">
    var base_url = '<?php echo base_url(); ?>';
    var logo_type = "logo";
    $('.upload_logo').on('click', function (e) {
        e.preventDefault();
        var $this = $(this);
      logo_type=$this.data('logo_type');
        $this.button('loading');
        $('#modal-uploadfile').modal({
            show: true,
            backdrop: 'static',
            keyboard: false
        });
    });
// set focus when modal is opened
    $('#modal-uploadfile').on('shown.bs.modal', function () {
        $('.upload_logo').button('reset');
    });


    $('.edit_setting').on('click', function (e) {
        e.preventDefault();
        var $this = $(this);
        $this.button('loading');
        $.ajax({
            url: base_url + '/schsettings/getSchsetting',
            type: 'POST',
            data: {},
            dataType: "json",
            success: function (result) {
                $('input[name="sch_id"]').val(result.id);
                $('input[name="sch_name"]').val(result.name);
                $('input[name="sch_dise_code"]').val(result.dise_code);
                $('input[name="sch_phone"]').val(result.phone);
                $('input[name="sch_email"]').val(result.email);
                $('input[name="fee_due_days"]').val(result.fee_due_days);
                $('input[name="sch_currency_symbol"]').val(result.currency_symbol);
                $('input[name="mobile_api_url"]').val(result.mobile_api_url);
                $('input[name="app_primary_color_code"]').val(result.app_primary_color_code);
                $('input[name="app_secondary_color_code"]').val(result.app_secondary_color_code);
                $('textarea[name="sch_address"]').text(result.address);
                $("input[name=sch_is_rtl][value=" + result.is_rtl + "]").attr('checked', 'checked');
                $("input[name=class_teacher][value=" + result.class_teacher + "]").attr('checked', 'checked');
                $("input[name=theme][value='" + result.theme + "']").attr('checked', 'checked');
                $('select[name="sch_session_id"] option[value="' + result.session_id + '"]').attr("selected", "selected");
                $('select[name="sch_start_month"] option[value="' + result.start_month + '"]').attr("selected", "selected");
                $('select[name="sch_lang_id"] option[value="' + result.lang_id + '"]').attr("selected", "selected");
                $('select[name="sch_timezone"] option[value="' + result.timezone + '"]').attr("selected", "selected");
                $('select[name="sch_date_format"] option[value="' + result.date_format + '"]').attr("selected", "selected");
                $('select[name="sch_currency"] option[value="' + result.currency + '"]').attr("selected", "selected");

                $('#schsetting').modal({
                    show: true,
                    backdrop: 'static',
                    keyboard: false
                });
            },
            error: function () {
                console.log("error on form");
            }

        }).done(function () {
            $this.button('reset');
        });

    });


    $(document).on('click', '.submit_schsetting', function (e) {
        var $this = $(this);
        $this.button('loading');
        $.ajax({
            url: '<?php echo site_url("schsettings/ajax_schedit") ?>',
            type: 'POST',
            data: $('#schsetting_form').serialize(),
            dataType: 'json',

            success: function (data) {

                if (data.status == "fail") {
                    var message = "";
                    $.each(data.error, function (index, value) {

                        message += value;
                    });
                    errorMsg(message);
                } else {
                    successMsg(data.message);
                    window.location.reload(true);
                }

                $this.button('reset');
            }
        });
    });


</script>


<script type="text/javascript">
    $(function () {



        // Drag enter
        $('.upload-area').on('dragenter', function (e) {
            e.stopPropagation();
            e.preventDefault();
            $("h1").text("Drop");
        });

        // Drag over
        $('.upload-area').on('dragover', function (e) {
            e.stopPropagation();
            e.preventDefault();
            $("h1").text("Drop");
        });

        // Drop
        $('.upload-area').on('drop', function (e) {
            e.stopPropagation();
            e.preventDefault();

            $("h1").text("Upload");

            var file = e.originalEvent.dataTransfer.files;
            var fd = new FormData();

            fd.append('file', file[0]);
            fd.append("id", $('#id_logo').val());
            fd.append("logo_type", logo_type);

            uploadData(fd);
        });

        // Open file selector on div click
        $("#uploadfile").click(function () {
            $("#file").click();
        });

        // file selected
        $("#file").change(function () {
            var fd = new FormData();

            var files = $('#file')[0].files[0];

            fd.append('file', files);
            fd.append("id", $('#id_logo').val());
             fd.append("logo_type", logo_type);
            uploadData(fd);
        });
    });

// Sending AJAX request and upload file
    function uploadData(formdata) {

        $.ajax({
            url: '<?php echo site_url('schsettings/ajax_editlogo') ?>',
            type: 'post',
            data: formdata,
            contentType: false,
            processData: false,
            dataType: 'json',
            cache: false,

            beforeSend: function () {
            $('#modal-uploadfile').addClass('modal_loading');
            },
            success: function (response) {
                if (response.success) {
                    successMsg(response.message);
                    window.location.reload(true);
                }else{

                      errorMsg(response.error.file);
                }

            },
            error: function (xhr) { // if error occured

            },
            complete: function () {
$('#modal-uploadfile').removeClass('modal_loading');

            }


        });
    }

</script>
