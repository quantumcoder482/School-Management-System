<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-flask"></i> <?php echo $this->lang->line('homework'); ?>
    </section>
    <!-- Main content -->
    <section class="content">       
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                <!--div class="box-tools pull-right">
                          <a href="<?php echo base_url(); ?>admin/teacher/assignteacher" class="btn btn-primary btn-sm"  data-toggle="tooltip" title="<?php echo $this->lang->line('assign_subjects'); ?>" >
                              <i class="fa fa-plus"></i> <?php echo $this->lang->line('add'); ?>
                          </a>
                      </div-->
            </div>
            <form  class="assign_teacher_form" action="<?php echo base_url(); ?>homework/evaluation_report" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12">
                            <?php if ($this->session->flashdata('msg')) { ?>
                                <?php echo $this->session->flashdata('msg') ?>
                            <?php } ?>
                            <?php echo $this->customlib->getCSRF(); ?>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><?php echo $this->lang->line('class'); ?></label><small class="req"> *</small>
                                <select autofocus="" id="class_id" name="class_id" class="form-control" >
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                    <?php
                                    foreach ($classlist as $class) {
                                        ?>
                                        <option <?php
                                        if ($class_id == $class["id"]) {
                                            echo "selected";
                                        }
                                        ?> value="<?php echo $class['id'] ?>"><?php echo $class['class'] ?></option>
                                            <?php
                                            $count++;
                                        }
                                        ?>
                                </select>
                                <span class="class_id_error text-danger"><?php echo form_error('class_id'); ?></span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><?php echo $this->lang->line('section'); ?></label><small class="req"> *</small>
                                <select  id="section_id" name="section_id" class="form-control" >
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                </select>
                                <span class="section_id_error text-danger"></span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><?php echo $this->lang->line('subject'); ?></label>
                                <select  id="subject_id" name="subject_id" class="form-control" >
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                </select>
                                <span class="section_id_error text-danger"></span>
                            </div>
                        </div>
                    </div>
                    <button type="submit" id="search_filter" name="search" value="search_filter" class="btn btn-primary btn-sm checkbox-toggle pull-right"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>                 
                </div>
            </form>
        </div>
        <div class="col-md-12" id="errorinfo">

        </div>
        <div class="box box-info" id="box_display">
            <div class="box-header with-border">
                <h3 class="box-title"><i class="fa fa-users"> </i> <?php echo $this->lang->line('evaluation_report'); ?></h3>
            </div>
            <div class="box-body table-responsive">
                <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?php echo $this->lang->line('subject') ?></th>
                            <th><?php echo $this->lang->line('homework_date'); ?> </th>
                            <th><?php echo $this->lang->line('submission_date'); ?></th>
                            <th><?php echo $this->lang->line('complete') . "/" . $this->lang->line('incomplete'); ?></th>
                            <th><?php echo $this->lang->line('complete'); ?>%</th>
                            <th class="text-right"><?php echo $this->lang->line('action') ?></th>
                        </tr>

                    </thead>
                    <tbody>
                        <?php
                        if (!empty($resultlist)) {

                            foreach ($resultlist as $key => $homework) {

                                // print_r($homework["report"]);
                                ?>
                                <tr>
                                    <td><?php echo $homework["name"]; ?></td>
                                    <td><?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($homework['homework_date'])); ?></td>
                                    <td><?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($homework['submit_date'])); ?></td>
        <?php //foreach ($report as $rkey => $rvalue) {
        ?>
                                    <td><?php echo $homework["report"][$key]["completed"] . "/" . ($homework["report"][$key]["total"] - $homework["report"][$key]["completed"]) ?></td> 
                                    <td><?php echo $homework["report"][$key]["percentage"] ?></td>   
                                <?php //}  ?>
                                    <td class="pull-right"><a class="btn btn-default btn-xs" onclick="report(<?php echo $homework['id']; ?>);" title="" data-target="#report" data-toggle="modal"  data-original-title="Evaluation Report"><i class="fa fa-reorder"></i></a></td>
                                </tr>
    <?php }
}
?>
                    </tbody>
                </table>         
            </div>           
        </div>       
    </section>
</div>

<div class="modal fade" id="report" tabindex="-1" role="dialog" aria-labelledby="evaluation">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal-media-content">
            <div class="modal-header modal-media-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="box-title"><?php echo $this->lang->line('homework_evaluation'); ?></h4>
            </div>
            <div class="modal-body pt0 pb0" id="evaluation_details">
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(document).on('change', '#class_id,#classid', function (e) {
            $('#section_id,#sectionid').html("");
            var class_id = $(this).val();
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            var url = "<?php
$userdata = $this->customlib->getUserData();
if (($userdata["role_id"] == 2)) {
    echo "getClassTeacherSection";
} else {
    echo "getByClass";
}
?>";
            $.ajax({
                type: "GET",
                url: base_url + "sections/" + url,
                data: {'class_id': class_id},
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, obj)
                    {
                        div_data += "<option value=" + obj.section_id + ">" + obj.section + "</option>";
                    });

                    $('#section_id,#sectionid').append(div_data);
                }
            });
        });
        $(document).on('change', '#section_id,#sectionid', function (e) {
            $('#subject_id,#subjectid').html("");
            var section_id = $(this).val();
            var class_id = $('#class_id').val();
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "POST",
                url: base_url + "admin/teacher/getSubjctByClassandSection",
                data: {'class_id': class_id, 'section_id': section_id},
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, obj)
                    {
                        div_data += "<option value=" + obj.subject_id + ">" + obj.name + " (" + obj.type + ")" + "</option>";
                    });

                    $('#subject_id,#subjectid').append(div_data);
                }
            });
        });
    });

    function report(id) {
        $.ajax({
            url: '<?php echo base_url(); ?>homework/getreport/' + id,
            //dataType:"json",
            success: function (res) {



                $('#evaluation_details').html(res);

            }
        });

    }

    getSectionByClass('<?php echo $class_id ?>', '<?php echo $section_id ?>');
    getSubjectByClassandSection('<?php echo $class_id ?>', '<?php echo $section_id ?>', '<?php echo $subject_id ?>');
    function getSectionByClass(class_id, section_id) {
        if (class_id != "" && section_id != "") {
            $('#section_id').html("");
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            var url = "<?php
$userdata = $this->customlib->getUserData();
if (($userdata["role_id"] == 2)) {
    echo "getClassTeacherSection";
} else {
    echo "getByClass";
}
?>";
            $.ajax({
                type: "GET",
                url: base_url + "sections/" + url,
                data: {'class_id': class_id},
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, obj)
                    {
                        var sel = "";
                        if (section_id == obj.section_id) {
                            sel = "selected";
                        }
                        div_data += "<option value=" + obj.section_id + " " + sel + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                }
            });
        }
    }

    function getSubjectByClassandSection(class_id, section_id, subject_id) {
        console.log("rrrr");
        if (class_id != "" && section_id != "" && subject_id != "") {
            $('#subject_id').html("");
            //  var class_id = $('#class_id').val();
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "POST",
                url: base_url + "admin/teacher/getSubjctByClassandSection",
                data: {'class_id': class_id, 'section_id': section_id},
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, obj)
                    {
                        var sel = "";
                        if (subject_id == obj.subject_id) {
                            sel = "selected";
                        }
                        div_data += "<option value=" + obj.subject_id + " " + sel + ">" + obj.name + " (" + obj.type + ")" + "</option>";
                    });

                    $('#subject_id').append(div_data);
                }
            });
        }
    }
</script>
