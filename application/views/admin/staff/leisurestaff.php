<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>

<div class="content-wrapper" style="min-height: 946px;">  
    <section class="content-header">
        <h1><i class="fa fa-sitemap"></i> <?php echo $this->lang->line('human_resource'); ?></h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                    </div>
                    <div class="box-body">
                        <?php if ($this->session->flashdata('msg')) { ?>  <?php echo $this->session->flashdata('msg') ?> <?php } ?>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <form role="form" action="<?php echo site_url('admin/staff/leisurestafflist') ?>" method="post" class="">
                                        <?php echo $this->customlib->getCSRF(); ?>
                                        <div class="col-md-4">
                                            <div class="form-group"> 
                                                <label><?php echo $this->lang->line("day") ?></label><small class="req"> *</small>
                                                <select name="day" class="form-control">
                                                    <option value="">Select</option>
                                                    <?php foreach ($daynameList as $key => $value) {
                                                        ?>
                                                        <option value="<?php echo $key ?>" <?php if(set_value('day', $day)==$key) echo "selected"; ?> ><?php echo $value; ?></option>
                                                    <?php }
                                                    ?>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('day'); ?></span>
                                            </div>  
                                        </div>
                                        <div class="col-md-4">
                                            <div class="bootstrap-timepicker">
                                                <div class="form-group">
                                                    <label><?php echo $this->lang->line("start_time") ?></label><small class="req"> *</small>
                                                    <div class="input-group">
                                                        <input type="text" name="stime" class="form-control timepicker" id="stime" value="<?php echo set_value('stime', $stime); ?>">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-clock-o"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <span class="text-danger"><?php echo form_error('stime'); ?></span>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="bootstrap-timepicker">
                                                <div class="form-group">
                                                    <label><?php echo $this->lang->line("end_time") ?></label><small class="req"> *</small>
                                                    <div class="input-group">
                                                        <input type="text" name="etime" class="form-control timepicker" id="etime" value="<?php echo set_value('etime', $etime); ?>">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-clock-o"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <span class="text-danger"><?php echo form_error('etime'); ?></span>
                                            </div>
                                        </div>

                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <button type="submit" name="search" value="search_day" class="btn btn-primary btn-sm pull-right checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php
                if (isset($resultlist)) {
                    ?>
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">

                            <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="false"><i class="fa fa-newspaper-o"></i> <?php echo $this->lang->line('card'); ?> <?php echo $this->lang->line('view'); ?></a></li>
                            <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="true"><i class="fa fa-list"></i> <?php echo $this->lang->line('list'); ?>  <?php echo $this->lang->line('view'); ?></a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="download_label"><?php echo "Leisure Staff List"; ?></div>
                            <div class="tab-pane  table-responsive no-padding" id="tab_2">
                                <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th><?php echo $this->lang->line('staff_id'); ?></th>
                                            <th><?php echo $this->lang->line('name'); ?></th>
                                            <th><?php echo $this->lang->line('role'); ?></th>
                                            <th><?php echo $this->lang->line('department'); ?></th>
                                            <th><?php echo $this->lang->line('designation'); ?></th>
                                            <th><?php echo $this->lang->line('mobile_no'); ?></th>

                                            <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        if (empty($resultlist)) {
                                            ?>
                                            <tr>
                                                <td colspan="12" class="text-danger text-center"><?php echo $this->lang->line('no_record_found'); ?></td>
                                            </tr> 
                                            <?php
                                        } else {
                                            $count = 1;
                                            foreach ($resultlist as $staff) {
                                                ?>
                                                <tr>
                                                    <td><?php echo $staff['employee_id']; ?></td>
                                                    <td>
                                                        <a href="<?php echo base_url(); ?>admin/staff/profile/<?php echo $staff['id']; ?>"><?php echo $staff['name'] . " " . $staff['surname']; ?>
                                                        </a>
                                                    </td>

                                                    <td><?php echo $staff['user_type']; ?></td>
                                                    <td><?php echo $staff['department']; ?></td>
                                                    <td><?php echo $staff['designation']; ?></td>
                                                    <td><?php echo $staff['contact_no']; ?></td>

                                                    <td class="pull-right">
                                                        <a href="<?php echo base_url(); ?>admin/staff/profile/<?php echo $staff['id'] ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('show'); ?>" >
                                                            <i class="fa fa-reorder"></i>
                                                        </a>
                                                        <!-- <a href="<?php echo base_url(); ?>admin/staff/edit/<?php echo $staff['id'] ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                            <i class="fa fa-pencil"></i>
                                                        </a> -->
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
                            <div class="tab-pane active" id="tab_1">
                                <div class="mediarow">   
                                    <div class="row">   
                                        <?php if (empty($resultlist)) {
                                            ?>
                                            <div class="alert alert-info"><?php echo $this->lang->line('no_record_found'); ?></div>
                                            <?php
                                        } else {
                                            $count = 1;
                                            foreach ($resultlist as $staff) {
                                                ?>
                                                <div class="col-lg-3 col-md-6 col-sm-6 img_div_modal">
                                                    <div class="staffinfo-box">
                                                        <div class="staffleft-box">
                                                            <?php
                                                            if (!empty($staff["image"])) {
                                                                $image = $staff["image"];
                                                            } else {
                                                                $image = "no_image.png";
                                                            }
                                                            ?>
                                                            <img src="<?php echo base_url() . "uploads/staff_images/" . $image ?>" />
                                                        </div>
                                                        <div class="staffleft-content">
                                                            <h5><span   data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["name"] . " " . $staff["surname"]; ?></span></h5>

                                                            <p><font   data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["employee_id"] ?></font></p>

                                                            <p><font  data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["contact_no"] ?></font></p>

                                                            <p><font  data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php
                                                            if (!empty($staff["location"])) {
                                                                echo $staff["location"] . ",";
                                                            }
                                                            ?></font><font  data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"> <?php echo $staff["department"]; ?></font></p>

                                                            <p class="staffsub" ><span  data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["user_type"] ?></span> 

                                                                <span  data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><?php echo $staff["designation"] ?></span></p>
                                                        </div>
                                                        <div class="overlay3">
                                                            <div class="stafficons">

                                                                <a title="Show" href="<?php echo base_url() . "admin/staff/profile/" . $staff["id"] ?>"><i class="fa fa-navicon"></i></a>
            <?php if ($this->rbac->hasPrivilege('staff', 'can_edit')) { ?>
                                                                        <!-- <a title="Edit" href="<?php echo base_url() . "admin/staff/edit/" . $staff["id"] ?>"><i class=" fa fa-pencil"></i></a> -->
                                                <?php } ?>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div><!--./col-md-3-->
        <?php }
    }
    ?>


                                    </div><!--./col-md-3-->
                                </div><!--./row-->  
                            </div><!--./mediarow-->  


                        </div>                                                          
                    </div>                                                         
                </div>
    <?php
}
?>
        </div>  
</div> 
</section>
</div>

<link rel="stylesheet" href="<?php echo base_url() ?>backend/plugins/timepicker/bootstrap-timepicker.min.css">
<script src="<?php echo base_url() ?>backend/plugins/timepicker/bootstrap-timepicker.min.js"></script>

<script type="text/javascript">

    $(function() {

        $(".timepicker").timepicker({
            showInputs: false,
            defaultTime: false,
            explicitMode: false,
            minuteStep: 1
        });
    });

</script>