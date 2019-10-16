<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<style type="text/css">
    td {
        /*max-width:100%;*/
        white-space:nowrap;
    }
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-book"></i> <?php echo $this->lang->line('library'); ?></h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">

            <!-- left column -->
            <div class="col-md-12">

                <!-- general form elements -->
                <div class="box box-primary" id="bklist">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('book_list'); ?></h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="mailbox-controls">
                            <!-- Check all button -->
                            <div class="pull-right">
                            </div><!-- /.pull-right -->
                        </div>
                        <div class="table-responsive mailbox-messages">

                            <div class="download_label"><?php echo $this->lang->line('book_list'); ?></div>
                            <table id="" class="table table-striped table-bordered table-hover report-table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('book_title'); ?></th>
                                        <th><?php echo $this->lang->line('author'); ?></th>
                                        <th><?php echo $this->lang->line('publisher'); ?></th>
                                        <th><?php echo $this->lang->line('isbn_no'); ?></th>
                                        <th><?php echo $this->lang->line('book_no'); ?></th>
                                        <th><?php echo $this->lang->line('from_acc_no'); ?></th>
                                        <th><?php echo $this->lang->line('to_acc_no'); ?></th>
                                        <th><?php echo $this->lang->line('edition'); ?></th>
                                        <th><?php echo $this->lang->line('volume'); ?></th>
                                        <th><?php echo $this->lang->line('year'); ?></th>
                                        <th><?php echo $this->lang->line('bookprice'); ?></th>
                                        <th><?php echo $this->lang->line('no_of_pages'); ?></th>
                                        <th><?php echo $this->lang->line('department'); ?></th>
                                        <th><?php echo $this->lang->line('book_type'); ?></th>
                                        <th><?php echo $this->lang->line('category'); ?></th>
                                        <th><?php echo $this->lang->line('rack_no'); ?></th>
                                        <th><?php echo $this->lang->line('qty'); ?></th>
                                        <th><?php echo $this->lang->line('available'); ?></th>
                                        <th><?php echo $this->lang->line('issue_book'); ?></th>
                                        <th><?php echo $this->lang->line('reference_book'); ?></th>
                                        <th><?php echo $this->lang->line('damaged'); ?></th>
                                        <th><?php echo $this->lang->line('missed'); ?></th>
                                        <th><?php echo $this->lang->line('supplier'); ?></th>
                                        <th><?php echo $this->lang->line('invoice_no'); ?></th>
                                        <th><?php echo $this->lang->line('invoice_date'); ?></th>
                                        <th class="no-print text text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $count = 1;
                                    if (!empty($listbook)) {

                                        foreach ($listbook as $book) {

                                            ?>
                                            <tr>
                                                <td class="mailbox-name">
                                                    <a href="#" data-toggle="popover" class="detail_popover"><?php echo $book['book_title'] ?></a>
                                                    <div class="fee_detail_popover" style="display: none">
                                                        <?php
                                                        if ($book['description'] == "") {
                                                            ?>
                                                            <p class="text text-danger"><?php echo $this->lang->line('no_description'); ?></p>
                                                        <?php
                                                    } else {
                                                        ?>
                                                            <p class="text text-info"><?php echo $book['description']; ?></p>
                                                        <?php
                                                    }
                                                    ?>
                                                    </div>
                                                </td>

                                                <td class="mailbox-name"> <?php echo $book['author'] ?></td>
                                                <td class="mailbox-name"> <?php echo $book['publisher'] ?></td>
                                                <td class="mailbox-name"> <?php echo $book['isbn_no'] ?></td>
                                                <td class="mailbox-name"> <?php echo $book['book_no'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['from_acc_no'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['to_acc_no'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['edition'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['volume'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['year'] ?></td>
                                                <td class="mailbox-name"><?php echo ($currency_symbol . $book['bookprice']); ?></td>
                                                <td class="mailbox-name"><?php echo $book['no_of_pages'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['department'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['book_type'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['category'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['rack_no'] ?></td>
                                                <td class="mailbox-name"> <?php echo $book['qty'] ?></td>
                                                <td class="mailbox-name"> <?php echo $book['qty'] - $book['total_issue'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['issue_book'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['reference_book'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['damaged'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['missed'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['supplier'] ?></td>
                                                <td class="mailbox-name"><?php echo $book['invoice_no'] ?></td>
                                                <td class="mailbox-name"> <?php
                                                        if($book['invoice_date'] != '1970-01-01') echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($book['invoice_date']));
                                                    ?>
                                                </td>
                                                <td class="mailbox-date no-print text text-right">
                                                    <?php if ($this->rbac->hasPrivilege('books', 'can_edit')) { ?>
                                                        <a href="<?php echo base_url(); ?>admin/book/edit/<?php echo $book['id'] ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                            <i class="fa fa-pencil"></i>
                                                        </a>
                                                    <?php }
                                                if ($this->rbac->hasPrivilege('books', 'can_delete')) { ?>
                                                        <a href="<?php echo base_url(); ?>admin/book/delete/<?php echo $book['id'] ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('<?php echo $this->lang->line('delete_confirm') ?>');">
                                                            <i class="fa fa-remove"></i>
                                                        </a>
                                                    <?php } ?>
                                                </td>
                                            </tr>
                                            <?php
                                            $count++;
                                        }
                                    }
                                    ?>
                                </tbody>
                            </table><!-- /.table -->
                        </div><!-- /.mail-box-messages -->
                    </div><!-- /.box-body -->
                    <div class="box-footer">
                        <div class="mailbox-controls">
                            <!-- Check all button -->
                            <div class="pull-right">
                            </div><!-- /.pull-right -->
                        </div>
                    </div>
                </div>
            </div>
            <!--/.col (left) -->
            <!-- right column -->
        </div>
        <div class="row">
            <!-- left column -->
            <!-- right column -->
            <div class="col-md-12">
                <!-- Horizontal Form -->
                <!-- general form elements disabled -->
            </div>
            <!--/.col (right) -->
        </div> <!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<script type="text/javascript">
    $(document).ready(function() {
        var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';
        $('#postdate').datepicker({
            // format: "dd-mm-yyyy",
            format: date_format,
            autoclose: true
        });
        $("#btnreset").click(function() {
            /* Single line Reset function executes on click of Reset Button */
            $("#form1")[0].reset();
        });

        var tbl = $('.report-table');


        var table = $('.report-table').DataTable({
            "aaSorting": [],
            scrollX: true,
            scrollY: true,
            autoWidth: true,
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
            ]
        });

    });
</script>



<script type="text/javascript">
    var base_url = '<?php echo base_url() ?>';

    function Popup(data) {

        var frame1 = $('<iframe />');
        frame1[0].name = "frame1";
        frame1.css({
            "position": "absolute",
            "top": "-1000000px"
        });
        $("body").append(frame1);
        var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
        frameDoc.document.open();
        //Create a new HTML document.
        frameDoc.document.write('<html>');
        frameDoc.document.write('<head>');
        frameDoc.document.write('<title></title>');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/bootstrap/css/bootstrap.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/font-awesome.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/ionicons.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/AdminLTE.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/skins/_all-skins.min.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/iCheck/flat/blue.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/morris/morris.css">');


        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/datepicker/datepicker3.css">');
        frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/daterangepicker/daterangepicker-bs3.css">');
        frameDoc.document.write('</head>');
        frameDoc.document.write('<body>');
        frameDoc.document.write(data);
        frameDoc.document.write('</body>');
        frameDoc.document.write('</html>');
        frameDoc.document.close();
        setTimeout(function() {
            window.frames["frame1"].focus();
            window.frames["frame1"].print();
            frame1.remove();
        }, 500);


        return true;
    }


    $("#print_div").click(function() {
        Popup($('#bklist').html());
    });


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