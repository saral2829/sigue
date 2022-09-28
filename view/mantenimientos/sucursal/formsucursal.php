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
  <!-- DataTables -->
  <link rel="stylesheet" href="assets/plugins/datatables/dataTables.bootstrap.css">  
  <!-- Theme style -->
  <link rel="stylesheet" href="assets/dist/css/AdminLTE.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="assets/dist/css/skins/_all-skins.min.css">

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
         SUCURSAL
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title"><?php echo ($_GET['id'] == null) ? 'NUEVA' : 'EDITAR' ; ?>SUCURSAL</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" id="formsucursal" name="formsucursal" method="POST">
              <div class="box-body">
                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Razon social</label>
                    <input type="hidden" name="idsucursal" value="<?php echo $_GET['id'] ?>">
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="razon_social" name="razon_social" placeholder="Razon social" value="<?php echo $osucursal->razonsoc_suc ?>">
                  </div>
                </div>
                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Dirección</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección" value="<?php echo $osucursal->direccion_suc ?>">
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Teléfono</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Teléfono" value="<?php echo $osucursal->telefono_suc ?>">
                  </div>
                </div>
                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Celular</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="celular" name="celular" placeholder="Celular" value="<?php echo $osucursal->celular_suc ?>">
                  </div>
                </div>
                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Procedencia</label>

                  <div class="col-sm-3">
                    <select class="form-control select2" style="width: 100%;" name="departamento" id="departamento">
                      <option selected="selected">Departamento</option>
                      <option></option>
                      
                    </select>
                  </div>
                  <div class="col-sm-3">
                    <select class="form-control select2" id="provincia" name="provincia" style="width: 100%;">
                      <option selected="selected">Provincia</option>
                     
                    </select>
                  </div>
                  <div class="col-sm-4">
                    <select class="form-control select2" name="distrito" id="distrito" style="width: 100%;">
                      <option selected="selected">Distrito</option>
                      
                    </select>
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <a href="index.php?page=mantenimientos&accion=panelsucursal" class="btn btn-danger" role="button">Regresar <span class="glyphicon glyphicon-arrow-left"></span></a>
                <button type="submit" class="btn btn-info pull-right">Guardar <span class="glyphicon glyphicon-floppy-disk"></span></button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
        </div>
        <div class="col-md-2"></div> 
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
<!-- AdminLTE App -->
<script src="assets/dist/js/app.min.js"></script>
<script src="js/bootbox.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/sucursales.js"></script>

</script>
</body>
</html>
