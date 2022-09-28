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
<!--   <link rel="stylesheet" href="../ css/ionicons.min.css"> -->
  <link rel="stylesheet" type="text/css" href="assets/plugins/ionicons/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="assets/plugins/datatables/dataTables.bootstrap.css">  
  <link rel="stylesheet" type="text/css" href="assets/plugins/datatables/extensions/Responsive/css/dataTables.responsive.css">

  <link rel="stylesheet" type="text/css" href="css/skin-win8/ui.fancytree.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="assets/plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="assets/dist/css/AdminLTE.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="assets/dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet" type="text/css" href="css/personalizado.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
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
         MANTENIMIENTO
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">LISTADO DE PRODUCTOS</h3>
              <a href="index.php?page=productos&accion=formproductos"><button type="button" class="btn btn-primary btn-sm pull-right"><strong><i class="fa fa-plus-circle" aria-hidden="true"></i> NUEVO</strong></button></a>
            </div>
            <!-- /.box-header -->
        <div class="form-horizontal">
          <div class="box-body">
            <div class="box-body" >
              <div class="form form-horizontal">
                <div class="form-group">
                  <label class="control-label col-md-2 col-sm-3">Buscar: </label>
                  <div class="col-sm-9 col-md-8">
                    <div class="input-group input-group-sm">
                      <input type="text" class="form-control" id="term" placeholder="Buscar producto...">
                      <span class="input-group-btn">
                        <button type="button" class="btn btn-success btn-flat" id="btn_buscar"><i class="fa fa-search"></i> Buscar!</button>
                      </span>
                    </div>
                  </div>
                </div> 

                <div class="form-group">
                  <label class="control-label col-md-2 col-sm-3">Caracteristicas: </label>
                  <div class="col-sm-4 col-md-4">
                    <select class="form-control select2" id="caract_padre" style="width: 100%">
                      <option value="-1">Todos</option>
                      <?php foreach ($lcaracteristicas as $carac): ?>
                        <option  value="<?php echo $carac->idcaracteristica ?>"><?php echo $carac->nombre_caracteristica ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                  <div class="col-md-4 col-sm-4">
                    <select class="form-control select2" id="caracteristica" style="width: 100%">
                      
                    </select>
                  </div>

                </div>

              </div>




            </div>
          </div>
          </div>  
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->


      <div class="row">
        <div class="col-md-12">
          <!-- Custom Tabs -->

          <div class="box box-success box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Resultados</h3>

<!--               <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div> -->
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body" >
              <div id="resultados"></div>
            </div>
            <div id="cargando" class="overlay" hidden>
              <i class="fa fa-refresh fa-spin"></i>
            </div>            
          </div>

<!-- 
          <div class="box box-danger box-solid">
            <div class="box-header">
              <h3 class="box-title">Loading state</h3>
            </div>
            <div class="box-body">
              The body of the box
            </div>

            <div class="overlay">
              <i class="fa fa-refresh fa-spin"></i>
            </div>

          </div> -->


        </div>
      </div>


    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->




  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Versión</b> 1.0.0
    </div>
    <strong>Copyright &copy; 2017 <a href="http://apps.gruva.net/" target="_blank">Gruva Apps</a>.</strong> Todos los derechos reservados.
  </footer>



</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="assets/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/datatables/extensions/Responsive/js/dataTables.responsive.js"></script>
<!-- Select2 -->
<script src="assets/plugins/select2/select2.full.min.js"></script>
<!-- AdminLTE App -->
<script src="assets/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<!-- <script src="assets/dist/js/demo.js"></script> -->
<script src="js/lenguaje_datatable.js"></script>
<script src="js/mantenimiento/productos.js"></script>
<script src="js/bootbox.min.js"></script>

<!-- <script type="text/javascript">
  $(document).ready(function() {
    $("#example1").DataTable(
        {
          "oLanguage": spanishtable,
        responsive: {
            details: {
                type: 'column'
            }
        },
        columnDefs: [ {
            className: 'control',
            orderable: false,
            targets:   0
        } ],
        order: [ 1, 'asc' ]



        }
      );
  });

</script> -->
</body>
</html>
