<div class="row row-eq">
    <?php
    //print_r($enquiry_data);
    $admin = $this->customlib->getLoggedInUserData();
    // print_r($admin);
    ?>
    <div class="col-lg-8 col-md-8 col-sm-8 paddlr">
        <!-- general form elements -->
        <form id="evaluation_data" method="post" class="ptt10" style="min-height: 500px;">
            <?php if (!empty($report)) { ?>
                <div class="alert alert-info"><?php echo $this->lang->line('homework_already_evaluated'); ?></div>
            <?php } ?>
            <div class="row">
                <?php

                function searchForId($id, $array) {
                    foreach ($array as $key => $val) {
                        if ($val['student_id'] === $id) {
                            return true;
                        }
                    }
                    return false;
                }
                ?>
                <div class="dual-list list-left dualbglist-left col-md-5 col-sm-5">
                    <div class="test">
                        <label><?php echo $this->lang->line('student_lists'); ?></label>
                        <div class="dualbg text-right">
                            <div class="row">
                                <div class="col-md-10 col-sm-9 col-xs-10">

                                    <div class="input-group">
                                        <span class="input-group-addon glyphicon glyphicon-search" style="top: 0px;"></span>
                                        <input type="text" name="SearchDualList" class="form-control listinput-h" placeholder="Search" />
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-sm selector checkleft" title="select all" style="border-radius: 0;"><i class="glyphicon glyphicon-unchecked"></i></a>
                                    </div>

                                </div>
                            </div>
                            <select multiple=""  class="list-group form-control" id="slist">
                                <?php
                                foreach ($studentlist as $key => $value) {
                                    if (searchForId($value["id"], $report) == false) {
                                        ?>
                                        <option class="list-group-item" value="<?php echo $value["id"] ?>"><?php echo $value["firstname"] ?></option>

                                    <?php }
                                }
                                ?>
                                <!--li class="list-group-item">Dapibus ac facilisis in</li>
                                <li class="list-group-item">Morbi leo risus</li>
                                <li class="list-group-item">Porta ac consectetur ac</li>
                                <li class="list-group-item">Vestibulum at eros</li-->
                            </select>
                        </div>
                    </div>
                </div>
                <div class="list-arrows col-md-1 col-sm-1 text-center">
                    <a class="btn btn-default btn-sm move-left">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>

                    <a class="btn btn-default btn-sm move-right mDMt10">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>

                <div class="dual-list list-right dualbglist-left col-md-5 col-sm-5">
                    <div class="test">
                        <label><?php echo $this->lang->line('homework_completed'); ?></label>
                        <div class="dualbg">
                            <div class="row">
                                <div class="col-md-2 col-sm-2 col-xs-2">
                                    <div class="btn-group">
                                        <a class="btn btn-default btn-sm selector" style="border-radius: 0;" title="select all"><i class="glyphicon glyphicon-unchecked" ></i></a>
                                    </div>
                                </div>
                                <div class="col-md-10 col-sm-9 col-xs-10">
                                    <div class="input-group">
                                        <input type="text" name="SearchDualList" class="form-control listinput-h" placeholder="Search" />
                                        <span class="input-group-addon glyphicon glyphicon-search" style="top: 0px;"></span>
                                    </div>
                                </div>
                            </div>
                            <select class="list-group form-control"  multiple="" id="hlist" name="evaluation_student_list[]">
                                <?php
                                if (!empty($report)) {
                                    foreach ($studentlist as $key => $value) {
                                        if (searchForId($value["id"], $report) == true) {
                                            ?>
                                            <option class="list-group-item active"  value="<?php echo $value["id"] ?>"><?php echo $value["firstname"] ?></option>

                                        <?php
                                        }
                                    }
                                }
                                ?>
                                <!--  <li class="list-group-item">Cras justo odio</li>
                                 <li class="list-group-item">Dapibus ac facilisis in</li>
                                 <li class="list-group-item">Morbi leo risus</li>
                                 <li class="list-group-item">Porta ac consectetur ac</li>
                                 <li class="list-group-item">Vestibulum at eros</li> -->
                            </select>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <!--  <div class="col-lg-5 col-md-5 col-sm-5">
                     <div class="form-group">
                         <label>Student List --r</label>
                       
                         <select id="student_list" multiple="" size="15" name="student_list[]" class="form-control">
                             <option value="" selected=""><?php echo $this->lang->line('select') ?></option>
                <?php foreach ($studentlist as $key => $value) {
                    ?>
                                   <option value="<?php echo $value["id"] ?>"><?php echo $value["firstname"] ?></option>   
<?php } ?>
                         </select>
                         <span class="text-danger" id="date_error"></span>
                     </div>
                 </div>
                     <div class="list-arrows text-center col-md-1 col-lg-1 col-sm-2">
                     <a href="#" class="btn btn-default btn-sm move-left" onclick="listbox_moveacross('student_list', 'evaluation_student_list')"><i class="fa fa-angle-left"></i></a>
                     <a href="#" class="btn btn-default btn-sm move-right" onclick="listbox_moveacross('evaluation_student_list', 'student_list')"><i class="fa fa-angle-right"></i></a>
                 </div>
                 <div class="col-md-5 col-lg-5 col-sm-5">
                     <div class="form-group">
                         <label></label>
                       
                         <select id="evaluation_student_list" size="15" multiple="" name="evaluation_student_list[]" class="form-control">
                            
                         </select>
                     </div>
                 </div> -->

                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="row">   
                        <div class="col-md-3 col-sm-5 col-xs-4">  
                            <div class="form-group">
                                <label class="pt5"><?php echo $this->lang->line('evaluation_date'); ?></label>
                            </div>
                        </div> 
                        <div class="col-md-3 col-sm-4 col-xs-4">      
                            <div class="form-group">  
                                <input type="text" id="evaluation_date" name="evaluation_date" class="form-control modalddate97" value="<?php
                                       if (!empty($report)) {
                                           print_r(date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($report[0]['date'])));
                                       } else {
                                          echo set_value('date', date($this->customlib->getSchoolDateFormat())); 
                                       }
                                       ?>" readonly="">
                                <input type="hidden" name="homework_id" value="<?php echo $result["id"] ?>">
                                <?php
                                if (!empty($report)) {
                                    foreach ($report as $key => $report_value) {
                                        ?>
                                        <input type="hidden" name="evalid[]" value="<?php echo $report_value["evalid"] ?>">
    <?php }
}
?>

                                <span class="text-danger" id="date_error"></span>
                            </div>
                        </div>   
                        <div class="col-md-2 col-sm-3 col-xs-4 pull-right" style="margin-right: -8px;"> 
<?php if ($this->rbac->hasPrivilege('homework_evaluation', 'can_add')) { ?> 
                                <div class="form-group">
                                    <input type="submit" name="" class="btn btn-info" value="<?php echo $this->lang->line('save'); ?>" />
                                </div>
<?php } ?>
                        </div> 
                    </div>  
                </div>    

            </div><!-- /.row--> 

        </form>
    </div><!--/.col (left) -->
    <div class="col-lg-4 col-md-4 col-sm-4 col-eq">
        <div class="taskside">
<?php //print_r($enquiry_data);   ?>
            <h4><?php echo $this->lang->line('summary'); ?></h4>
            <div class="box-tools pull-right">
            </div><!-- /.box-tools -->
            <h5 class="pt0 task-info-created">
                <!--small class="text-dark">Homework Date <span class="text-dark"><?php print_r(date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($result['homework_date']))); ?></span> <i class="fa fa-clock-o" data-toggle="tooltip" data-title="Created at 31.05.2018 13:00:09"></i></small-->
            </h5>

            <hr class="taskseparator" />
            <div class="task-info task-single-inline-wrap task-info-start-date">
                <h5><i class="fa task-info-icon fa-fw fa-lg fa-calendar-plus-o pull-left fa-margin"></i>
                    <span><?php echo $this->lang->line('homework_date'); ?></span>:<?php print_r(date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($result['homework_date']))); ?>                                      
                </h5>
            </div>
            <div class="task-info task-single-inline-wrap task-info-start-date">
                <h5><i class="fa task-info-icon fa-fw fa-lg fa-calendar-plus-o pull-left fa-margin"></i>
                    <span><?php echo $this->lang->line('submission_date'); ?></span>:<?php print_r(date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($result['submit_date']))); ?>                                      
                </h5>
            </div>
            <?php if (!empty($report)) { ?>
                <div class="task-info task-single-inline-wrap task-info-start-date">
                    <h5><i class="fa task-info-icon fa-fw fa-lg fa-calendar-plus-o pull-left fa-margin"></i>
                        <span><?php echo $this->lang->line('evaluation_date'); ?></span>:<?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($report[0]['date'])); ?>                                       
                    </h5>
                </div>
<?php } ?>
            <div class="task-info task-single-inline-wrap ptt10">
                <label><span><?php echo $this->lang->line('created_by'); ?></span>: <?php echo $created_by; ?></label>
                <label><span><?php echo $this->lang->line('evaluated_by'); ?></span>: <?php echo $evaluated_by; ?></label>            
                <label><span><?php echo $this->lang->line('class') ?></span>: <?php echo $result['class']; ?></label>
                <label><span><?php echo $this->lang->line('section') ?></span>: <?php echo $result['section']; ?></label>
                <label><span><?php echo $this->lang->line('subject') ?></span>: <?php echo $result['name']; ?></label>
                <?php if (!empty($result["document"])) { ?>
                <label><a href="<?php echo base_url() . "homework/download/" . $result["id"] . "/" . $result["document"] ?>"><?php echo $this->lang->line('download') ?> <i class="fa fa-download"></i></a></label>
                <?php } ?>
                <label><span><?php echo $this->lang->line('description'); ?></span>: <br/><?php echo $result['description']; ?></label>



            </div> 
        </div>
    </div>  
</div>

<script type="text/javascript">
    $(function () {

        $('body').on('click', '.list-group .list-group-item', function () {
            $(this).removeClass('active');
            $(this).toggleClass('active');
            //  $(this).attr('selected');
            // $('select option[value="' + this.value + '"]').attr("selected", "true");
            //$(this).selected = true;
        });
        $('.list-arrows a').click(function () {
            var $button = $(this), actives = '';
            if ($button.hasClass('move-left')) {
                actives = $('#hlist option.active');
                actives.clone().appendTo('#slist');
                actives.remove();
            } else if ($button.hasClass('move-right')) {
                //actives = $('.list-left ul li.active');
                actives = $('#slist option.active');
                actives.clone().appendTo('#hlist');
                actives.remove();

            }
        });
        $('.dual-list .selector').click(function () {

            var $checkBox = $(this);
            if (!$checkBox.hasClass('selected')) {
                $checkBox.addClass('selected').closest('.test').find('select option:not(.active)').addClass('list-group-item active');
                // $checkBox.addClass('selected').closest('.test').find('select option').attr('selected','selected');
                $checkBox.children('i').removeClass('glyphicon-unchecked').addClass('glyphicon-check');
            } else {
                $checkBox.removeClass('selected').closest('.test').find('select option.active').removeClass('active');
                // $checkBox.addClass('selected').closest('.test').find('select option').attr('selected','false');
                $checkBox.children('i').removeClass('glyphicon-check').addClass('glyphicon-unchecked');
            }
        });
        $('[name="SearchDualList"]').keyup(function (e) {
            var code = e.keyCode || e.which;
            if (code == '9')
                return;
            if (code == '27')
                $(this).val(null);
            var $rows = $(this).closest('.dual-list').find('.list-group option');
            var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
            $rows.show().filter(function () {
                var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                return !~text.indexOf(val);
            }).hide();
        });

    });
</script>
<script>
    $(document).ready(function () {
        var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';
        $('#evaluation_date').datepicker({
            format: date_format,
            autoclose: true
        });

        $("#evaluation_data").on('submit', (function (e) {
            $("#hlist").find('option.active').attr("selected", "selected");

            e.preventDefault();
            $.ajax({
                url: "<?php echo site_url("homework/add_evaluation") ?>",
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function (res)
                {

                    if (res.status == "fail") {

                        var message = "";
                        $.each(res.error, function (index, value) {

                            message += value;
                        });
                        errorMsg(message);

                    } else {

                        successMsg(res.message);

                        window.location.reload(true);
                    }
                }
            });
        }));

    });




    function listbox_moveacross(sourceID, destID) {
        var src = document.getElementById(sourceID);
        var dest = document.getElementById(destID);

        for (var count = 0; count < src.options.length; count++) {

            if (src.options[count].selected == true) {
                var option = src.options[count];

                var newOption = document.createElement("option");
                newOption.value = option.value;
                newOption.text = option.text;
                newOption.selected = true;
                try {
                    dest.add(newOption, null); //Standard
                    src.remove(count, null);
                } catch (error) {
                    dest.add(newOption); // IE only
                    src.remove(count);
                }
                count--;
            }
        }
    }


</script>