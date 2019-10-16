<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-book"></i> <?php echo $this->lang->line('library'); ?> </h1>
    </section>

    <!-- Main content -->

    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- Horizontal Form -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><?php echo $this->lang->line('add_book'); ?></h3>
                        <div class="pull-right box-tools impbtn">
                            <a href="<?php echo site_url('admin/book/import') ?>">
                                <button class="btn btn-primary btn-sm"><i class="fa fa-upload"></i> <?php echo $this->lang->line('import_book'); ?></button>
                            </a>
                        </div>
                    </div><!-- /.box-header -->
                    <!-- form start -->

                    <form id="form1" action="<?php echo site_url('admin/book/create') ?>" id="employeeform" name="employeeform" method="post" accept-charset="utf-8">
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
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('book_title'); ?></label><small class="req"> *</small>
                                <input autofocus="" id="book_title" name="book_title" placeholder="" type="text" class="form-control" value="<?php echo set_value('book_title'); ?>" />
                                <span class="text-danger"><?php echo form_error('book_title'); ?></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('author'); ?></label><small class="req"> *</small>
                                <input id="author" name="author" placeholder="" type="text" class="form-control" value="<?php echo set_value('author'); ?>" />
                                <span class="text-danger"><?php echo form_error('author'); ?></span>
                            </div>
                            <div class="clearfix"></div>

                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('publisher'); ?></label><small class="req"> *</small>
                                <input id="publisher" name="publisher" placeholder="" type="text" class="form-control" value="<?php echo set_value('publisher'); ?>" />
                                <span class="text-danger"><?php echo form_error('publisher'); ?></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('isbn_no'); ?></label><small class="req"> *</small>
                                <input id="isbn_no" name="isbn_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('isbn_no'); ?>" />
                                <span class="text-danger"><?php echo form_error('isbn_no'); ?></span>
                            </div>
                            <div class="clearfix"></div>

                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('book_no'); ?></label><small class="req"> *</small>
                                <input id="book_no" name="book_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('book_no'); ?>" />
                                <span class="text-danger"><?php echo form_error('book_no'); ?></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('from_acc_no'); ?></label><small class="req"> *</small>
                                <input id="from_acc_no" name="from_acc_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('from_acc_no'); ?>" />
                                <span class="text-danger"><?php echo form_error('from_acc_no'); ?></span>
                            </div>
                            <div class="clearfix"></div>

                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('to_acc_no'); ?></label><small class="req"> *</small>
                                <input id="to_acc_no" name="to_acc_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('to_acc_no'); ?>" />
                                <span class="text-danger"><?php echo form_error('to_acc_no'); ?></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('edition'); ?></label>
                                <input id="edition" name="edition" placeholder="" type="text" class="form-control" value="<?php echo set_value('edition'); ?>" />
                                <span class="text-danger"><?php echo form_error('edition'); ?></span>
                            </div>
                            <div class="clearfix"></div>

                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('volume'); ?></label>
                                <input id="volume" name="volume" placeholder="" type="text" class="form-control" value="<?php echo set_value('volume'); ?>" />
                                <span class="text-danger"><?php echo form_error('volume'); ?></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('year'); ?></label>
                                <input id="year" name="year" placeholder="" type="text" class="form-control" value="<?php echo set_value('year'); ?>" />
                                <span class="text-danger"><?php echo form_error('year'); ?></span>
                            </div>
                            <div class="clearfix"></div>

                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('bookprice'); ?></label>
                                <input id="bookprice" name="bookprice" placeholder="" type="text" class="form-control" value="<?php echo set_value('bookprice'); ?>" />
                                <span class="text-danger"><?php echo form_error('bookprice'); ?></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('no_of_pages'); ?></label>
                                <input id="no_of_pages" name="no_of_pages" placeholder="" type="text" class="form-control" value="<?php echo set_value('no_of_pages'); ?>" />
                                <span class="text-danger"><?php echo form_error('no_of_pages'); ?></span>
                            </div>
                            <div class="clearfix"></div>

                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('department'); ?></label>
                                <input id="department" name="department" placeholder="" type="text" class="form-control" value="<?php echo set_value('department'); ?>" />
                                <span class="text-danger"><?php echo form_error('department'); ?></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('book_type'); ?></label>
                                <input id="book_type" name="book_type" placeholder="" type="text" class="form-control" value="<?php echo set_value('book_type'); ?>" />
                                <span class="text-danger"><?php echo form_error('book_type'); ?></span>
                            </div>
                            <div class="clearfix"></div>

                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('category'); ?></label>
                                <input id="category" name="category" placeholder="" type="text" class="form-control" value="<?php echo set_value('category'); ?>" />
                                <span class="text-danger"><?php echo form_error('category'); ?></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('rack_no'); ?></label>
                                <input id="rack_no" name="rack_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('rack_no'); ?>" />
                                <span class="text-danger"><?php echo form_error('rack_no'); ?></span>
                            </div>
                            <div class="clearfix"></div>

                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('qty'); ?></label>
                                <input id="qty" name="qty" placeholder="" type="text" class="form-control" value="<?php echo set_value('qty'); ?>" />
                                <span class="text-danger"><?php echo form_error('qty'); ?></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('supplier'); ?></label>
                                <input id="supplier" name="supplier" placeholder="" type="text" class="form-control" value="<?php echo set_value('supplier'); ?>" />
                                <span class="text-danger"><?php echo form_error('supplier'); ?></span>
                            </div>
                            <div class="clearfix"></div>

                            <div class="col-md-offset-1 col-md-2">
                                <label><?php echo $this->lang->line('issue_book'); ?></label>
                                <div class="radio" style="margin-top: 2px;">
                                    <label><input class="radio-inline" type="radio" name="issue_book" value="yes" <?php
                                        echo set_value('issue_book') == "yes" ? "checked" : "";
                                        ?>><?php echo $this->lang->line('yes'); ?></label>
                                    <label><input class="radio-inline" checked="checked" type="radio" name="issue_book" value="no" <?php
                                        echo set_value('issue_book') == "no" ? "checked" : "";
                                        ?>><?php echo $this->lang->line('no'); ?></label>
                                </div>
                                <span class="text-danger"><?php echo form_error('issue_book'); ?></span>
                            </div>
                            <div class="col-md-offset-1 col-md-2">
                                <label><?php echo $this->lang->line('reference_book'); ?></label>
                                <div class="radio" style="margin-top: 2px;">
                                    <label><input class="radio-inline" type="radio" name="reference_book" value="yes" <?php
                                        echo set_value('reference_book') == "yes" ? "checked" : "";
                                        ?>><?php echo $this->lang->line('yes'); ?></label>
                                    <label><input class="radio-inline" checked="checked" type="radio" name="reference_book" value="no" <?php
                                        echo set_value('reference_book') == "no" ? "checked" : "";
                                        ?>><?php echo $this->lang->line('no'); ?></label>
                                </div>
                                <span class="text-danger"><?php echo form_error('reference_book'); ?></span>
                            </div>
                            <div class="col-md-offset-1 col-md-2">
                                <label><?php echo $this->lang->line('damaged'); ?></label>
                                <div class="radio" style="margin-top: 2px;">
                                    <label><input class="radio-inline" type="radio" name="damaged" value="yes" <?php
                                        echo set_value('damaged') == "yes" ? "checked" : "";
                                        ?>><?php echo $this->lang->line('yes'); ?></label>
                                    <label><input class="radio-inline" checked="checked" type="radio" name="damaged" value="no" <?php
                                        echo set_value('damaged') == "no" ? "checked" : "";
                                        ?>><?php echo $this->lang->line('no'); ?></label>
                                </div>
                                <span class="text-danger"><?php echo form_error('damaged'); ?></span>
                            </div>
                            <div class="col-md-offset-1 col-md-2">
                                <label><?php echo $this->lang->line('missed'); ?></label>
                                <div class="radio" style="margin-top: 2px;">
                                    <label><input class="radio-inline" type="radio" name="missed" value="yes" <?php
                                        echo set_value('missed') == "yes" ? "checked" : "";
                                        ?>><?php echo $this->lang->line('yes'); ?></label>
                                    <label><input class="radio-inline" checked="checked" type="radio" name="missed" value="no" <?php
                                        echo set_value('missed') == "no" ? "checked" : "";
                                        ?>><?php echo $this->lang->line('no'); ?></label>
                                </div>
                                <span class="text-danger"><?php echo form_error('missed'); ?></span>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('invoice_no'); ?></label>
                                <input id="invoice_no" name="invoice_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('invoice_no'); ?>" />
                                <span class="text-danger"><?php echo form_error('invoice_no'); ?></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('invoice_date'); ?></label>
                                <input id="invoice_date" name="invoice_date" placeholder="" type="text" class="form-control" value="<?php echo set_value('invoice_date'); ?>" />
                                <span class="text-danger"><?php echo form_error('invoice_date'); ?></span>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('description'); ?></label>
                                <textarea class="form-control" id="description" name="description" placeholder="" rows="3" placeholder="Enter ..."><?php echo set_value('description'); ?></textarea>
                                <span class="text-danger"><?php echo form_error('description'); ?></span>
                            </div>
                        </div><!-- /.box-body -->

                        <div class="box-footer">

                            <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                        </div>
                    </form>
                </div>

            </div>
            <!--/.col (right) -->

        </div>
        <div class="row">

            <div class="col-md-12">
            </div>
            <!--/.col (right) -->
        </div> <!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<script type="text/javascript">
    $(document).ready(function() {



        $("#btnreset").click(function() {
            /* Single line Reset function executes on click of Reset Button */
            $("#form1")[0].reset();
        });

    });
    $(document).ready(function() {
        var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';
        $('#invoice_date').datepicker({
            //   format: "dd-mm-yyyy",
            format: date_format,
            autoclose: true
        });

    });
</script>
<script>
    $(document).ready(function() {
        $('.detail_popover').popover({
            placement: 'right',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function() {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });

    });
</script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/js/savemode.js"></script>