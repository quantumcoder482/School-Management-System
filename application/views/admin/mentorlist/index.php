<?php $currency_symbol = $this->customlib->getSchoolCurrencyFormat(); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-object-group"></i> <?php echo $this->lang->line('administration'); ?></h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">

            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"> <?php echo $this->lang->line('mentor_list'); ?></h3>
                        <div class="box-tools pull-right">
                        </div><!-- /.box-tools -->
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="row" style="padding: 20px">
                            <form action="<?php echo base_url() ?>admin/mentorlist"  id="mentorform" name="mentorform" method="post" accept-charset="utf-8" >
                                <div class="form-group">
                                    <label for="mentor"><?php echo $this->lang->line('select'); ?> <?php echo $this->lang->line('mentor'); ?>
                                    <select autofocus="" id="mentor" name="mentor" class="form-control" >
                                        <option value=""><?php echo $this->lang->line('select'); ?></option>
                                        <?php
                                        foreach ($mentorlist as $mentor) {
                                            ?>
                                            <option value="<?php echo $mentor['id'] ?>"<?php
                                            if (set_value('mentor') == $mentor['id']) {
                                                echo "selected = selected";
                                            }
                                            ?>><?php echo $mentor['name']. ' '. $mentor['surname'] ?></option>

                                            <?php
                                        }
                                        ?>
                                    </select>
                                    <span class="text-danger"><?php echo form_error('mentor'); ?></span>
                                </div>
                            </form>
                        </div>
                        <div class="row" style="padding:20px">
                            <div class="table-responsive mailbox-messages">

                            <table class="table table-hover table-striped table-bordered example">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('hall_no'); ?></th>
                                        <th><?php echo $this->lang->line('student').' '.$this->lang->line('name'); ?></th>
                                        <th><?php echo $this->lang->line('class'); ?></th>
                                        <th><?php echo $this->lang->line('section'); ?></th>
                                        <th><?php echo $this->lang->line('batch'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (empty($studentlist)) {
                                        ?>

                                        <?php
                                    } else {
                                        foreach ($studentlist as $student) {
                                            ?>
                                            <tr>
                                                <td class="mailbox-name"><?php echo $student['hall_no']; ?></td>
                                                <td class="mailbox-name">
                                                    <a href="<?php echo base_url(); ?>student/view/<?php echo $student['id']; ?>">
                                                        <?php echo $student['firstname'] . " " . $student['lastname']; ?>
                                                    </a>
                                                </td>
                                                <td class="mailbox-name"><?php echo $student['class']; ?></td>
                                                <td class="mailbox-name"><?php echo $student['section']; ?></td>
                                                <td class="mailbox-name"><?php echo $student['batch']; ?></td>

                                            </tr>
                                            <?php
                                        }
                                    }
                                    ?>

                                </tbody>
                            </table><!-- /.table -->



                        </div><!-- /.mail-box-messages -->
                        </div>
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

        $("#btnreset").click(function () {
            $("#form1")[0].reset();
        });

        $(document).on("change", "#mentor", function(e){
            e.preventDefault();
            $("#mentorform").submit();
        })


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