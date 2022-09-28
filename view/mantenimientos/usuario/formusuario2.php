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

<?php include_once __DIR__ . "/../../navbar.php"; ?>
<?php include_once __DIR__ . "/../../menu.php"; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        USUARIO
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
              <h3 class="box-title">NUEVO USUARIO</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" id="formusuario" name="formusuario" method="POST">

              <div class="box-body">

                <div class="box-body">  
                
                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">DNI</label>
                    <input type="hidden" name="id" value="<?php echo $_GET['id'] ?>">
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="dni" name="dni" placeholder="DNI" value="<?php echo $ousuario->dni ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Nombres</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="nombres" name="nombres" placeholder="Nombres" value="<?php echo $ousuario->nombres_per ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Apellido Paterno</label>

                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="apellidopat" name="apellidopat" placeholder="Apellido Paterno" value="<?php echo $ousuario->apellidopat_per ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Apellido Materno</label>

                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="apellidomat" name="apellidomat" placeholder="Apellido Materno" value="<?php echo $ousuario->apellidomat_per ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Sexo</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="sexo" name="sexo" placeholder="sexo" value="<?php echo $ousuario->sexo ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Fecha Nac.</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="fechanac" name="fechanac" placeholder="Fecha Nac." value="<?php echo $ousuario->fechanac_per ?>" required>
                  </div>
                </div>

              </div>


              <div class="box-body">
                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">RUC</label>
                      <input type="hidden" name="idusuario" value="<?php echo $_GET['id'] ?>">
                  <div class="col-sm-10">
                      <input type="text" style='text-transform:uppercase' class="form-control" id="ruc" name="ruc" placeholder="RUC" value="<?php echo $ousuario->ruc_per ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Razon social</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="razon_social" name="razon_social" placeholder="Razon social" value="<?php echo $ousuario->razonsoc_per ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Marca</label>

                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="marca" name="marca" placeholder="marca" value="<?php echo $ousuario->marca ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">
                           Empleado 
                  </label>
                  <div class="col-sm-10">
                      <input type="checkbox" name="condicion" value="<?php echo $ocliente->condicion_per ?>" required>
                  </div>
                </div>
  
              </div>


              <div class="box-body"> 
                
                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Dirección</label>

                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="direccion" name="direccion" placeholder="Dirección" value="<?php echo $ousuario->direccion_per ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Correo</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="correo" name="correo" placeholder="Correo" value="<?php echo $ousuario->correo_per ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Teléfono Fijo</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="telefonofij" name="telefonofij" placeholder="Teléfono Fijo" value="<?php echo $ousuario->telefonofij_per ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Celular</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="telefonocel" name="telefonocel" placeholder="Celular" value="<?php echo $ousuario->telefonocel_per ?>" required>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Facebook</label>

                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="facebook" name="facebook" placeholder="Facebook" value="<?php echo $ousuario->facebook_per ?>" required>
                  </div>
                </div>                

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Procedencia</label>

                  <div class="col-sm-3">
                    <select class="form-control select2" style="width: 100%;">
                      <option selected="selected">Departamento</option>
                      <option>Amazonas</option>
                      <option>Anchash</option>
                      <option>Apurimac</option>
                      <option>Arequipa</option>
                      <option>Ayacucho</option>
                      <option>Cajamarca</option>
                    </select>
                  </div>
                  <div class="col-sm-3">
                    <select class="form-control select2" style="width: 100%;">
                      <option selected="selected">Provincia</option>
                      <option>Amazonas</option>
                      <option>Anchash</option>
                      <option>Apurimac</option>
                      <option>Arequipa</option>
                      <option>Ayacucho</option>
                      <option>Cajamarca</option>
                    </select>
                  </div>
                  <div class="col-sm-4">
                    <select class="form-control select2" style="width: 100%;">
                      <option selected="selected">Distrito</option>
                      <option>Amazonas</option>
                      <option>Anchash</option>
                      <option>Apurimac</option>
                      <option>Arequipa</option>
                      <option>Ayacucho</option>
                      <option>Cajamarca</option>
                    </select>
                  </div>
                </div> 

              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <a href="index.php?page=mantenimientos&accion=panelusuario" class="btn btn-danger" role="button">Regresar <span class="glyphicon glyphicon-arrow-left"></span></a>
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
<!-- AdminLTE App -->
<script src="assets/dist/js/app.min.js"></script>
<script src="js/bootbox.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/usuarios.js"></script>

</body>
</html>
