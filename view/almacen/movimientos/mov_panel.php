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
<!--  sidebar-collapse -->
 </head>
<body class="hold-transition skin-blue sidebar-mini ">
	<div class="wrapper">
    <?php include_once __DIR__ . "/../../navbar.php"; ?>

	    <!-- Left side column. contains the logo and sidebar -->
      <?php include_once __DIR__ . "/../../menu.php"; ?>


	    <!-- Content Wrapper. Contains page content -->
	    <div class="content-wrapper">
	      <!-- Content Header (Page header) -->
	      <section class="content-header">
	        <h1>
	          MOVIMIENTOS
	        </h1>
	      </section>
	      <!-- Main content -->
	      <section class="content">


      <div class="row">
        <div class="col-md-12">
          <!-- Custom Tabs -->

          <div class="box box-success box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Panel</h3>

<!--               <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div> -->
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body" >


<div class="row">
  <div class="col-md-6">
    <div class="form-horizontal">
      <div class="box-body">
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-3 control-label">Sucursal: </label>
          <div class="col-sm-9 col-md-9">
            <select id="sucursal" style="width: 100%">
              <option value="-1" >Sin sucursal</option>
              <?php foreach ($lsucursales as $suc): ?>
                <option value="<?php echo $suc->id_sucursal ?>"><?php echo $suc->razonsoc_suc ?></option>
              <?php endforeach ?>
            </select>
          </div>
        </div>

        <div class="form-group">
          <label for="inputPassword3" class="col-sm-3 control-label">Almacen Ing: </label>
          <div class="col-sm-5 col-md-5">
            <select class="form-control select_2" id="almacen" style="width: 100%">
              <?php foreach ($lalmacenes as $alm): ?>
                <option value="<?php echo $alm->alm_id ?>"><?php echo $alm->alm_nombre ?></option>
              <?php endforeach ?>
            </select>
          </div>
        </div>

        <div class="form-group">
          <label for="inputPassword3" class="col-sm-3 control-label">Busqueda: </label>
          <div class="col-sm-9 col-md-9">
            <div class="input-group input-group-sm">
                <input type="text" class="form-control" id="term" placeholder="Buscar producto...">
                    <span class="input-group-btn">
                      <button type="button" class="btn btn-warning btn-flat" id="btn_buscar"><i class="fa fa-search"></i> Buscar!</button>
                    </span>
             </div>           
          </div>
        </div>        
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-3 control-label">Producto: </label>
          <div class="col-sm-9 col-md-9">
            <p class="form-control-static" id="nom_producto">-----</p>  
            <input type="hidden" id="id_producto">
            <input type="hidden" id="id_proveedor">
            <input type="hidden" id="nom_proveedor">
            <input type="hidden" id="nombre_producto">
          </div>
        </div>

        <div class="form-group">
          <label for="inputPassword3" class="col-sm-3 control-label">Stock: </label>
          <div class="col-sm-5 col-md-5">
            <p class="form-control-static" id="span_stock"></p>
            <input type="hidden" id="stock">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-3 control-label">Unidad: </label>
          <div class="col-sm-5 col-md-5">
            <select class="form-control" id="unidad"></select>
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-3 control-label">Cantidad: </label>
          <div class="col-sm-5 col-md-5">
            <input type="text" class="form-control cantidad" id="cantidad" data-tipo_form="panel">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-3 control-label">Alm destino: </label>
          <div class="col-sm-5 col-md-5">
            <select id="almacen_destino" style="width: 100%">
              
            </select>
          </div>
          <button class="btn btn-success btn-sm" id="btn_agregar" disabled><i class="fa fa-fw fa-plus"></i> Agregar</button>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-3 control-label">Mensaje: </label>
          <div class="col-sm-5 col-md-5">
            <p class="form-control-static" id="mensaje"></p>          
          </div>
        </div>        
        

      </div>

    </div>    
  </div>  

  <div class="col-md-6">
    <div class="form-horizontal">
      <div class="box-body">
        <div class="form-group">

          <table id="tabla_detalle" class="table table-bordered table-condensed">
            <thead>
              <tr>
                <th>Producto</th>
                <th>Proveedor</th>
                <th>Unidad</th>
                <th>Cantidad</th>
                <th>Origen</th>
                <th>Destino</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody></tbody>
          </table>

        </div>
      </div>
    </div>
      <div class="box-footer">
        <button type="button" id="btn_guardar" class="btn btn-primary pull-right"><i class="fa fa-fw fa-save"></i> Mover</button>
      </div>

  </div>


</div>





            </div>
          </div>
        </div>
      </div>

      <div id="modal_espera"></div>
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
<!-- DataTables -->
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/datatables/extensions/Responsive/js/dataTables.responsive.js"></script>
<script src="js/lenguaje_datatable.js"></script>
<script src="js/bootbox.min.js"></script>

<!-- AdminLTE App -->
<script src="assets/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="assets/dist/js/demo.js"></script>
<!-- Page script -->
<script src="js/misfunc.js"></script>
<script src="js/almacen/movimientos.js"></script>
</body>
</html>