<?php $currency_symbol = $this->customlib->getSchoolCurrencyFormat(); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-object-group"></i> <?php echo $this->lang->line('activities'); ?></h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <?php if ($this->rbac->hasPrivilege('add_event', 'can_add')) { ?>
                <div class="col-md-4">

                    <!-- Horizontal Form -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('add_event'); ?></h3>
                        </div><!-- /.box-header -->

                        <form id="form1" action="<?php echo base_url() ?>admin/event"  id="eventform" name="eventform" method="post" accept-charset="utf-8" enctype="multipart/form-data">

                            <div class="box-body">
                                <?php if ($this->session->flashdata('msg')) { ?>
                                    <?php echo $this->session->flashdata('msg') ?>
                                <?php } ?>
                                <?php
                            if (isset($error_message)) {
                            echo "<div class='alert alert-danger'>" . $error_message . "</div>";
                            }
                            ?>
                                <?php echo $this->customlib->getCSRF(); ?>

                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('event_name'); ?></label><small class="req"> *</small>
                                    <input autofocus="" id="event_name" name="event_name" placeholder="" type="text" class="form-control"  value="<?php echo set_value('event_name'); ?>" />
                                    <span class="text-danger"><?php echo form_error('event_name'); ?></span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('event'); ?> <?php echo $this->lang->line('in_charge'); ?></label><small class="req"> *</small>
                                    <input autofocus="" id="in_charge" name="in_charge" placeholder="" type="text" class="form-control"  value="<?php echo set_value('in_charge'); ?>" />
                                    <span class="text-danger"><?php echo form_error('in_charge'); ?></span>
                                </div>
                                <div class="form-group">
                                    <label for="committee_id"><?php echo $this->lang->line('select'); ?> <?php echo $this->lang->line('committee'); ?></label><small class="req"> *</small>

                                    <select autofocus="" id="committee_id" name="committee_id" class="form-control" >
                                        <option value=""><?php echo $this->lang->line('select'); ?></option>
                                        <?php
                                        foreach ($committeelist as $committee) {
                                            ?>
                                            <option value="<?php echo $committee['id'] ?>"<?php
                                            if (set_value('committee_id') == $committee['id']) {
                                                echo "selected = selected";
                                            }
                                            ?>><?php echo $committee['committee_name'] ?></option>

                                            <?php
                                        }
                                        ?>
                                    </select>
                                    <span class="text-danger"><?php echo form_error('committee_id'); ?></span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('description'); ?></label>
                                    <textarea class="form-control" id="description" name="description" placeholder="" rows="3" placeholder="Enter ..."><?php echo set_value('description'); ?></textarea>
                                    <span class="text-danger"></span>
                                </div>
                                <div class="form-group">
                                    <label><?php echo $this->lang->line('date_of_the_event_from_to'); ?></label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" autocomplete="off" name="event_date" class="form-control pull-right" id="event_date">
                                    </div>
                                    <span class="text-danger"><?php echo form_error('event_date'); ?></span>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('attach_document'); ?></label>
                                    <input id="attachment_file" name="attachment_file" placeholder="" type="file" class="filestyle form-control" data-height="40"  value="<?php echo set_value('attachment_file'); ?>" />
                                    <span class="text-danger"><?php echo form_error('attachment_file'); ?></span>
                                </div>
                            </div><!-- /.box-body -->

                            <div class="box-footer">
                                <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                            </div>
                        </form>
                    </div>

                </div><!--/.col (right) -->
                <!-- left column -->
            <?php } ?>

            <div class="col-md-<?php
            if ($this->rbac->hasPrivilege('add_event', 'can_add')) {
                echo "8";
            } else {
                echo "12";
            }
            ?> ">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"> <?php echo $this->lang->line('event_list'); ?></h3>
                        <div class="box-tools pull-right">
                        </div><!-- /.box-tools -->
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="table-responsive mailbox-messages">
                            <div class="download_label"><?php echo $this->lang->line('event_list'); ?></div>
                            <table class="table table-hover table-striped table-bordered example">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('event_name'); ?></th>
                                        <th><?php echo $this->lang->line('event'); ?> <?php echo $this->lang->line('in_charge'); ?></th>
                                        <th><?php echo $this->lang->line('committee'); ?></th>
                                        <th><?php echo $this->lang->line('from'); ?></th>
                                        <th><?php echo $this->lang->line('to'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (empty($eventlist)) {
                                        ?>

                                        <?php
                                    } else {
                                        foreach ($eventlist as $event) {
                                            ?>
                                            <tr>
                                                <td class="mailbox-name">
                                                    <a href="#" data-toggle="popover" class="detail_popover"><?php echo $event['event_name'] ?></a>

                                                    <div class="fee_detail_popover" style="display: none">
                                                        <?php
                                                        if ($event['description'] == "") {
                                                            ?>
                                                            <p class="text text-danger"><?php echo $this->lang->line('no_description'); ?></p>
                                                            <?php
                                                        } else {
                                                            ?>
                                                            <p class="text text-info"><?php echo $event['description']; ?></p>
                                                            <?php
                                                        }
                                                        ?>
                                                    </div>
                                                </td>
                                                <td class="mailbox-name"><?php echo $event['in_charge']; ?></td>
                                                <td class="mailbox-name"><?php echo $event['committee_name']; ?></td>
                                                <td class="mailbox-name"><?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($event['date_from'])); ?></td>
                                                <td class="mailbox-name"><?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($event['date_to'])); ?></td>

                                                <td class="mailbox-date pull-right"">
                                                    <?php if ($event['attachment']) {
                                                        ?>
                                                        <a href="<?php echo base_url(); ?>admin/event/download/<?php echo $event['attachment'] ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('download'); ?>">
                                                            <i class="fa fa-download"></i>
                                                        </a>
                                                    <?php }
                                                    ?>
        <?php if ($this->rbac->hasPrivilege('add_event', 'can_edit')) { ?>
                                                        <a href="<?php echo base_url(); ?>admin/event/edit/<?php echo $event['id'] ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                            <i class="fa fa-pencil"></i>
                                                        </a>
        <?php } if ($this->rbac->hasPrivilege('add_event', 'can_delete')) { ?>
                                                        <a href="<?php echo base_url(); ?>admin/event/delete/<?php echo $event['id'] ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('<?php echo $this->lang->line('delete_confirm') ?>');">
                                                            <i class="fa fa-remove"></i>
                                                        </a>
        <?php } ?>
                                                </td>
                                            </tr>
                                            <?php
                                        }
                                    }
                                    ?>

                                </tbody>
                            </table><!-- /.table -->



                        </div><!-- /.mail-box-messages -->
                    </div><!-- /.box-body -->
                </div>
            </div><!--/.col (left) -->
            <!-- right column -->

        </div>
        <div class="row">
            <!-- left column -->

            <!-- right column -->
            <div class="col-md-12">

            </div><!--/.col (right) -->
        </div>   <!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<script type="text/javascript">
    $(document).ready(function () {

        var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';

        $('#date').datepicker({
            //  format: "dd-mm-yyyy",
            format: date_format,
            autoclose: true
        });

        $('#event_date').daterangepicker({
            autoUpdateInput: false,
            format: date_format,
            autoclose: true,
            locale: {
                cancelLabel: 'Clear'
            }
        });

        $('#event_date').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
        });

        $('#event_date').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });

        $("#btnreset").click(function () {
            $("#form1")[0].reset();
        });


        $('.detail_popover').popover({
            placement: 'right',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function () {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });


    });
</script>