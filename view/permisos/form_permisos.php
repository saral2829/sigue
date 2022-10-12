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

  <link rel="shortcut icon" href="assets/dist/img/jp.ico">

</head>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <?php include_once __DIR__ . "/../navbar.php"; ?>
    <?php include_once __DIR__ . "/../menu.php"; ?>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          PERMISOS
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
                <h3 class="box-title"><?php echo ($_GET['id'] == null) ? 'NUEVA' : 'EDITAR'?> PERMISOS DE USUARIOS</h3>
              </div>
              <!-- /.box-header -->
              <!-- form start -->
              <form class="form-horizontal" id="formpermiso" name="formpermiso" method="POST">
                <div class="box-body">
                  <div class="form-group">
                    <label for="text" class="col-sm-2 control-label">Nombres</label>
                    <input type="hidden" name="idempleado" value="<?php echo $_GET['id'] ?>">
                    <div class="col-sm-10">
                      <input type="text" style='text-transform:uppercase' class="form-control" id="nombre" name="nombre"
                        placeholder="Nombre"
                        value="<?php echo $oempleado->nombres_per.' '.$oempleado->apellidopat_per.' ' .$oempleado->apellidomat_per?>"
                        readonly>
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="text" class="col-sm-2 control-label">Sucursal</label>

                    <div class="col-sm-10">
                      <input type="text" style='text-transform:uppercase' class="form-control" id="descripcion"
                        name="descripcion" placeholder="Sucursal"
                        value="<?php echo /*$oarea->descripcion_area*/'Sucursal' ?>" required>
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="text" class="col-sm-2 control-label" for='perfil'>Permisos</label>

                    <div class="col-sm-10">
                      <select name="perfil" id="perfil" class='form-control select2'>
                        <?php foreach($lperfiles as $perfil):?>
                        <option value="<?php echo $perfil->id_perfil?>"
                          <?php echo ($perfil->id_perfil == $oempleado->perfil_id_per)? 'selected': ''?>>
                          <?php echo $perfil->nombre_perfil?></option>
                        <?php endforeach?>
                      </select>
                    </div>
                  </div>
                </div>

                <!-- /.box-body -->
                <div class="box-footer">
                  <a href="index.php?page=permisos&accion=panelpermisos" class="btn btn-danger" role="button">Regresar
                    <span class="glyphicon glyphicon-arrow-left"></span></a>
                  <button type="submit" class="btn btn-info pull-right">Guardar <span
                      class="glyphicon glyphicon-floppy-disk"></span></button>
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
        <b>Version</b> 1.0.0
      </div>
      <strong>Copyright &copy; 2017 <a href="http://apps.gruva.net/" target="_blank">Gruva Apps</a>.</strong> Todos los
      derechos reservados.
    </footer>

    <!-- jQuery 2.2.3 -->
    <script src="assets/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>

    <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="assets/plugins/datatables/dataTables.bootstrap.min.js"></script>

    <!-- Select2 -->
    <!--<script src="assets/plugins/select2/select2.full.min.js"></script>-->
    <!-- Slimscroll -->
    <!--<script src="assets/plugins/slimScroll/jquery.slimscroll.min.js"></script>-->
    <!-- FastClick -->
    <!--<script src="assets/plugins/fastclick/fastclick.js"></script>-->

    <!-- AdminLTE App -->
    <script src="assets/dist/js/app.min.js"></script>
    <!-- Page script -->
    <script src="js/bootbox.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="js/permisos.js"></script>


</body>

</html>