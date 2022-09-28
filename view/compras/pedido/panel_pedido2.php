
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Inversiones JP | SIGUE</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="assets/plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="assets/plugins/datepicker/datepicker3.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="assets/plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="assets/plugins/colorpicker/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="assets/plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="assets/plugins/select2/select2.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="assets/plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="assets/dist/css/AdminLTE.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="assets/dist/css/skins/_all-skins.min.css">

  <link rel="shortcut icon" href="assets/dist/img/jp.ico">

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<?php include_once __DIR__ . "/../../navbar.php"; ?>
<?php include_once __DIR__ . "/../../menu.php"; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        PEDIDO
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">

            <!-- Horizontal Form -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">REGISTRO DE PEDIDO</h3>
            </div>
            <form class="form-horizontal">
              <div class="box-body">
                  <!-- radio -->
                  <div class="form-group">
                    <div class="col-sm-3">
                      <input type="text" class="form-control" placeholder="SERIE - N°DOC" disabled="">
                    </div>

                    <div class="col-sm-4">  
                      <label>
                        <input type="radio" name="r1" class="minimal" checked>
                      </label>
                      <label>
                      POR PRODUCTO
                      </label>
                    </div>

                    <div class="col-sm-5">  
                      <label>
                        <input type="radio" name="r1" class="minimal">
                      </label>
                      <label>
                        POR PROVEEDOR
                      </label>
                    </div>
  
                  </div>
                
                <hr>
                
                  <div class="box-tools">
                    <div class="input-group input-group-sm" style="width: 100%;">
                      <input type="text" name="table_search" class="form-control pull-right" placeholder="BUSCAR PROVEEDOR">
                      <div class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                      </div>
                    </div>
                  </div>

                </br>

                  <div class="form-group">
                    <label for="text" class="col-sm-2 control-label">Datos del Proveedor</label>
                    <div class="col-sm-10">
                      <textarea class="form-control" rows="1" placeholder="Datos ..." disabled=""></textarea>
                    </div>
                  </div>
                <hr>

                  <div class="input-group input-group-sm" style="width: 100%;">
                    <input type="text" name="table_search" class="form-control pull-right" placeholder="BUSCAR PRODUCTO">
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                    </div>
                  </div></br>

                  <div class="box-body">
                    <div class="row">
                      <div class="col-lg-4">
                        <select class="form-control"> 
                          <option>TIPO CANTIDAD</option>
                          <option>UNIDADES</option>
                          <option>CAJAS</option>
                        </select> 
                        </br>                     
                      </div>

                      <div class="col-lg-4">
                          <input type="text" class="form-control" placeholder="CANT"></br>
                      </div>                

                      <div class="col-lg-4">
                        <button type="submit" class="btn btn-primary pull-right">AGREGAR <span class="glyphicon glyphicon-plus-sign"></span></button> 
                      </div>
                    </div>
                  </div>
                <hr>

                  <div class="box-body table-responsive no-padding">
                    <table id="example1" class="table table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>CODIGO BARRA</th>
                          <th>DESCRIPCIÓN</th>
                          <th>PRECIO</th>          
                          <th>C. UNID</th>
                          <th>C. CAJA</th>
                          <th>IMPORTE</th>
                          <th>OPCIÓN</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1</td>
                          <td>PANTALON SODA</td>
                          <td>20.00</td>
                          <td>10</td>
                          <td>0</td>
                          <td>200.00</td>
                          <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>BLUSA SODA</td>
                          <td>10.00</td>
                          <td>10</td>
                          <td>0</td>
                          <td>100.00</td>
                          <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></td>
                        </tr>
                        <tr>
                          <td>3</td>
                          <td>PANTALON MILK</td>
                          <td>20.00</td>
                          <td>10</td>
                          <td>0</td>
                          <td>200.00</td>
                          <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></td>
                        </tr>
                        <tr>
                          <td>4</td>
                          <td>RELOJ GUESS</td>
                          <td>400.00</td>
                          <td>10</td>
                          <td>0</td>
                          <td>4000.00</td>
                          <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></td>
                        </tr>
                        <tr>
                          <td>5</td>
                          <td>PANTALON SODA</td>
                          <td>20.00</td>
                          <td>10</td>
                          <td>0</td>
                          <td>200.00</td>
                          <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>

                <hr>
                    <!-- /.box-body -->
                    <div class="box-footer">
                      <button type="submit" class="btn btn-default">Limpiar</button>
                      <button type="submit" class="btn btn-info pull-right">Guardar Pedido <span class="glyphicon glyphicon-floppy-disk"></span></button>
                    </div>
              </div> 
            </form>
            <!-- /.box-header -->
          </div>
        </div> 
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0.0
    </div>
    <strong>Copyright &copy; 2017 <a href="http://apps.gruva.net/" target="_blank">Gruva Apps</a>.</strong> Todos los derechos reservados.
  </footer>

  
<!-- jQuery 2.2.3 -->
<script src="assets/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- Select2 -->
<script src="assets/plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="assets/plugins/input-mask/jquery.inputmask.js"></script>
<script src="assets/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="assets/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="assets/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="assets/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- bootstrap color picker -->
<script src="assets/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="assets/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- Slimscroll -->
<script src="assets/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="assets/plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="assets/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="assets/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="assets/dist/js/demo.js"></script>
<!-- Page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>
<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
</script>

</body>
</html>
