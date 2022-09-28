
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
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"> -->
  <link rel="stylesheet" href="assets/plugins/font-awesome/font-awesome-4.7.0/css/font-awesome.css">
  <!-- Ionicons -->
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
  <link rel="stylesheet" href="assets/plugins/ionicons/css/ionicons.min.css">
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
<!-- ../../../ -->
  <link rel="stylesheet" type="text/css" href="assets/plugins/selectize/css/selectize.css">
<!--   <link rel="stylesheet" type="text/css" href="assets/plugins/selectize/css/selectize.default.css"> -->
  <link rel="stylesheet" type="text/css" href="assets/plugins/selectize/css/selectize.bootstrap3.css">

  <link rel="stylesheet" type="text/css" href="assets/plugins/sweetalert2/sweetalert2.min.css">

  <!-- Theme style -->
  <link rel="stylesheet" href="assets/dist/css/AdminLTE.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
  folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="assets/dist/css/skins/_all-skins.min.css">

<!--   <link rel="stylesheet" type="text/css" href="css/custom/jquery-ui.css">
  <link rel="stylesheet" type="text/css" href="css/custom/style.css"> -->
  <link rel="stylesheet" type="text/css" href="css/custom/autocomplete.css">

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
          <!-- FORMULARIO DE PEDIDO -->
        </h1>
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-md-12">

            <!-- Horizontal Form -->

            <div class="box box-solid box-success">
              <div class="box-header">
                <h3 class="box-title"><b>Formulario de Pedidos</b>
                </h3>
              </div>
              <!-- /.box-header -->
              <div class="box-body">
                <div class="form form-horizontal">
                  <div class="row col-md-12">
                    <div class="form-group ">
                      <label for="inputEmail3" class="col-md-2 col-sm-2 control-label">Sucursal: </label>
                      <div class="col-md-5 col-sm-5">
                        <select  id="sucursal" style="width: 100%">
                          <option></option>
                          <?php foreach ($lsucursales as $sucursal): ?>
                            <option value="<?php echo $sucursal->id_sucursal ?>"><?php echo $sucursal->razonsoc_suc ?></option>
                          <?php endforeach ?>
                        </select>
                      </div>
                    </div>
                    <hr>
                    <div class="form-group">
                      <label for="inputEmail3" class="col-md-2 col-sm-2 control-label ">Busqueda:</label>
                      <div class="col-md-4 col-sm-4">
                        <label style="margin-top: 6px;">
                          <input type="radio" name="tipo_busqueda" value="prod" class=" tipo_busqueda" checked>
                          POR PRODUCTO
                        </label>
                      </div>
                      <div class="col-md-4 col-sm-4">
                        <label style="margin-top: 6px;">
                          <input type="radio" name="tipo_busqueda" value="prov" class=" tipo_busqueda" >
                          POR PROVEEDOR
                        </label>
                      </div>
                      <div class="col-md-2 col-sm-2">
                        <button class="btn btn-primary" id="btn_buscar"><i class="fa fa-fw fa-search"></i> Busqueda</button>
                      </div>
                    </div>

                    <hr>
                    <div class="form-group">
                      <div class="col-md-2 col-sm-2 col-xs-2">
                        <label class="col-md-2 col-sm-2 control-label">Producto: </label>
                      </div>
                      <div class="col-md-6 col-sm-4">
                        <input type="text" class="form-control" id="nom_producto" name="nom_producto" >
                        <input type="hidden" id="producto" name="producto" value="">
                        <input type="hidden" id="nom_proveedor">
                        <input type="hidden" id="id_proveedor">
                      </div>
                    </div>

                    <hr>

                    <div class="form-group">
                      <div class="col-md-4 col-sm-4 col-xs-8">
                        <select class="form-control"id="tipo_cantidad">
                          <option selected disabled >TIPO CANTIDAD</option>
                          <option>Unidades</option>
                        </select><br>
                      </div>

                      <div class="col-md-4 col-sm-4 col-xs-6">
                        <input type="text" class="form-control" id="cantidad" placeholder="CANTIDAD">
                        <br>
                      </div>

                      <div class="col-md-offset-2 col-md-2 col-sm-4 col-xs-12 pull-right">
                        <button class="btn btn-block btn-warning" id="btn_aniadir">Agregar <span class="glyphicon glyphicon-plus-sign"></span></button>
                      </div>

                    </div>

                    <hr>

                    <div class="col-md-12 table-responsive">
                      <table id="tabla_detalle" class="table table-responsive table-bordered table-striped">
                        <thead>
                        <tr>
                          <th>Producto</th>
                          <th>Proveedor</th>
                          <!-- <th>Precio</th> -->
                          <th>Unidad</th>
                          <th>Cantidad</th>
                          <th>Acciones</th>
                        </tr>
                        </thead>
                        <tbody >

                      </table>

                    </div>

                    <button class="btn btn-primary pull-right" id="btn_guardar"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>

                  </div>



                </div>


              </div>
              <!-- /.box-body -->
            </div>
            <!-- /.box -->

            <div id="modales"></div>


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
    <script src="assets/plugins/jQueryUI/jquery-ui.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="assets/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- Select2 -->
    <script src="assets/plugins/select2/select2.full.min.js"></script>
    <script src="assets/plugins/select2/i18n/es.js"></script>
    <!-- InputMask -->
    <script src="assets/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="assets/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="assets/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <!-- date-range-picker -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script> -->
    <script src="assets/plugins/moment/moment.min.js"></script>
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
    <script src="js/bootbox.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="assets/dist/js/demo.js"></script>
    <!-- Page script -->
    <script src="assets/plugins/selectize/js/standalone/selectize.js"></script>
    <script src="assets/plugins/sweetalert2/sweetalert2.min.js"></script>


    <script src="js/compras/compras_pedidos.js"></script>

</body>
</html>
