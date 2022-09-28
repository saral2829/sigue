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

  <link rel="stylesheet" type="text/css" href="css/skin-win8/ui.fancytree.css">

  <!-- Theme style -->
  <link rel="stylesheet" href="assets/dist/css/AdminLTE.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="assets/dist/css/skins/_all-skins.css">
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
        <div class="col-md-6">
          
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">LISTADO DE CATEGORIAS</h3>
              <button type="button" id="btn_nuevo" class="btn btn-primary pull-right"><strong>NUEVO</strong></button>
            </div>
            <!-- /.box-header -->
        

            <div class="box-body">

              <div class="col-sm-12">
<!-- 
              <button id="button1">Test</button>
              <hr> -->
              <div id="tree"></div>
<!--               <div id="status">Ready.</div>
              <hr>
              <div id="version"></div> -->
                
              </div>


            </div>







            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

        <div class="col-md-6" id="div_infocat" hidden>
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Informacion categoria</h3>
              <button type="button" id="btn_editar" class="btn btn-primary pull-right"><strong>Editar</strong></button>
            </div>
            <div class="form form-horizontal">
              <div class="box-body">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Nombre: </label>
                  <div class="col-sm-10">
                    <span for="inputEmail3" class="col-sm-10 span_info" id="span_nombre"></span>
                  </div>
                </div>

                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Descripcion: </label>
                  <div class="col-sm-10">
                    <span for="inputEmail3" class="col-sm-10 span_info" id="span_descripcion"></span>
                  </div>
                </div>

                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Vigencia: </label>
                  <div class="col-sm-10">
                    <span for="inputEmail3" class="col-sm-10 span_info" id="span_vigencia"></span>
                  </div>
                </div>

              </div>             
            </div>
          
          </div>
        </div>



        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <div id="divmodal_categoria"></div>



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
<script src="assets/plugins/jQueryUI/jquery-ui.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="assets/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<!-- <script src="assets/dist/js/demo.js"></script> -->
<script src="js/lenguaje_datatable.js"></script>

<script src="js/jquery.fancytree.js"></script>
<!-- <script src="js/jquery-ui.custom.js"></script> -->
<script src="js/bootbox.min.js"></script>
<!-- <script src="js/data.js"></script> -->
<script src="js/categorias.js"></script>



</body>
</html>
