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

  <link rel="stylesheet" href="assets/plugins/font-awesome/font-awesome-4.7.0/css/font-awesome.css">
  <!-- Ionicons -->
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
  <link rel="stylesheet" href="assets/plugins/ionicons/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="assets/plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" type="text/css" href="assets/plugins/datatables/extensions/Responsive/css/dataTables.responsive.css">

  <!-- daterange picker -->
  <link rel="stylesheet" href="assets/plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="assets/plugins/bootstrap-datepicker-1.6.4/css/bootstrap-datepicker3.css">
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
   <link rel="stylesheet" type="text/css" href="assets/plugins/sweetalert2/sweetalert2.min.css">

   <link rel="shortcut icon" href="assets/dist/img/jp.ico">
   <!--  sidebar-collapse -->
 </head>
 <body class="hold-transition skin-blue sidebar-mini ">
   <div class="wrapper">
    <?php include_once __DIR__ . "/../navbar.php"; ?>

     <!-- Left side column. contains the logo and sidebar -->
     <?php include_once __DIR__ . "/../menu.php"; ?>

     <!-- Content Wrapper. Contains page content -->
     <div class="content-wrapper">
       <!-- Content Header (Page header) -->
       <section class="content-header">
         <h1><i class="fa fa-fw fa-money"></i>
          VENTAS
         </h1>
       </section>
       <!-- Main content -->
       <section class="content">

           <div class="row">
                   <div class="col-md-12">
                     <!-- Custom Tabs -->
                     <div class="nav-tabs-custom">
                       <ul class="nav nav-tabs">
                         <li class="active"><a href="#tab_formulalrio" data-toggle="tab"><i class="fa fa-fw fa-money"></i>Formulario</a></li>
                         <li><a href="#tab_historico" data-toggle="tab"><i class="fa fa-fw fa-list"></i> Historico</a></li>
                       </ul>
                       <div class="tab-content">
                         <div class="tab-pane active" id="tab_formulalrio">
                         	<?php require 'view/ventas/ventas_form.php'; ?>
                         </div>
                         <!-- /.tab-pane -->
                         <div class="tab-pane" id="tab_historico">

                             <div class="form-horizontal">
                                 <div class="form-group">
                                   <label class="col-md-2 form-control-static control-label">Fecha:</label>
                                   <div class="col-md-6">
                                       <div class="input-group input-group-sm">
                                           <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                           <input type="text" id="fecha" class="form-control" value="<?php echo date('d/m/Y'); ?>">
                                               <span class="input-group-btn">
                                                 <button type="button" class="btn btn-info btn-flat" id="btn_mostrar"><i class="fa fa-fw fa-search"></i> Mostar</button>
                                               </span>
                                         </div>
                                   </div>

                                 </div>
                             </div>
                             <div id="resultados"></div>

                         </div>
                         <!-- /.tab-pane -->
                       </div>
                       <!-- /.tab-content -->
                     </div>
                     <!-- nav-tabs-custom -->
                   </div>
                   <!-- /.col -->

                 </div>



      <div id="modales"></div>

    </section>
    <!-- /.content -->
  </div>

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0.0
    </div>
    <strong>Copyright &copy; 2017 <a href="http://apps.gruva.net/" target="_blank">Gruva Apps</a>.</strong> Todos los derechos reservados.
  </footer>


</div>



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
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script> -->
<script src="assets/plugins/moment/moment.min.js"></script>
<script src="assets/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="assets/plugins/bootstrap-datepicker-1.6.4/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/bootstrap-datepicker-1.6.4/locales/bootstrap-datepicker.es.min.js">

</script>
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
<!-- DataTables -->
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/datatables/extensions/Responsive/js/dataTables.responsive.js"></script>
<script src="js/lenguaje_datatable.js"></script>
<!-- <script src="js/bootbox.min.js"></script> -->

<script src="assets/plugins/sweetalert2/sweetalert2.js"></script>


<!-- AdminLTE App -->
<script src="assets/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<!-- <script src="assets/dist/js/demo.js"></script> -->
<!-- Page script -->
<script src="js/ventas/ventas.js"></script>

<script>
    $(document).ready(function() {
        $('#fecha').datepicker({
            language: "es",
            autoclose: true,
            todayHighlight: true
        });
    });
</script>

</body>
</html>
