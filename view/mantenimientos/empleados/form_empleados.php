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
  <link rel="stylesheet" type="text/css" href="assets/plugins/ionicons/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="assets/plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2.css">
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
        EMPLEADOS
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
              <h3 class="box-title"><?php echo ($_GET['id'] == null) ? 'NUEVO' : 'EDITAR' ; ?> EMPLEADOS</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" id="formcliente" name="formcliente" method="POST">

              <div class="box-body">
                <input type="hidden" name="tipo_persona" value="1">
                <input type="hidden" name="id" value="<?php echo $_GET['id'] ?>">
              </div>

              <div class="box-body" id="div_natural" <?php echo ($ver_natural == true) ? '' : 'hidden' ; ?>>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">DNI</label>

                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" onkeypress="return soloNumeros(event)" maxlength="8" id="dni" name="dni" placeholder="DNI" value="<?php echo $ocliente->dni ?>" >
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Nombres</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="nombres" name="nombres" placeholder="Nombres" value="<?php echo $ocliente->nombres_per ?>" >
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Apellido Paterno</label>

                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="apellidopat" name="apellidopat" placeholder="Apellido Paterno" value="<?php echo $ocliente->apellidopat_per ?>" >
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Apellido Materno</label>

                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="apellidomat" name="apellidomat" placeholder="Apellido Materno" value="<?php echo $ocliente->apellidomat_per ?>" >
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-md-2 control-label">Sexo</label>
                  <div class="col-md-10">
                    <select class=" form-control" name="sexo" id="sexo">
                      <option value="1" <?php ($ocliente->sexo == 1)? 'selected' : ''?>>Masculino</option>
                      <option value="2" <?php ($ocliente->sexo == 2)? 'selected' : ''?>>Femenino</option>
                    </select>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Fecha Nac.</label>
                  <div class="col-sm-10">
                  <?php
                      list($anio_nac, $mes_nac, $dia_nac) = explode('-', $ocliente->fechanac_per);
                      $fechanac = $dia_nac.'/'.$mes_nac.'/'.$anio_nac;
                  ?>
                    <input type="text"  class="form-control" id="fechanac" name="fechanac" placeholder="Fecha Nac." data-inputmask="'alias': 'dd/mm/yyyy'" value="<?php echo $fechanac ?>" >
                  </div>
                </div>

              </div>


              <div class="box-body" id="div_juridico" <?php echo ($ver_juridico == true) ? '' : 'hidden' ; ?>>
                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">RUC</label>
                  <div class="col-sm-10">
                      <input type="text" style='text-transform:uppercase' class="form-control" id="ruc" name="ruc" placeholder="RUC" value="<?php echo $ocliente->ruc_per ?>" >
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Razon social</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="razon_social" name="razon_social" placeholder="Razon social" value="<?php echo $ocliente->razonsoc_per ?>" >
                  </div>
                </div>



              </div>


              <div class="box-body">

                <div class="form-group" hidden="">
                  <label for="text" class="col-sm-2 control-label">
                           Empleado
                  </label>
                  <div class="col-sm-10">
                      <input type="checkbox" name="empleado" id="empleado" checked  >
                  </div>
                </div>
                <div class="form-group" id="div_empleado" <?php echo ($ocliente->empleado == '0' or $ocliente->empleado == null ) ? 'hidden' : '' ; ?> >
                  <label for="text" class="col-sm-2 control-label">Area</label>

                  <div class="col-sm-10">
                    <select class="form-control" name="area" id="area">
                    <?php foreach ($lareas as $area): ?>
                      <option <?php echo ($area->id_area == $ocliente->area_id) ? 'selected' : '' ; ?> value="<?php echo $area->id_area ?>"><?php echo $area->nombre_area ?></option>
                    <?php endforeach ?>
                    </select>
                  </div>
                </div>
                <div class="form-group" hidden>
                  <label for="text" class="col-sm-2 control-label">
                           Proveedor
                  </label>
                  <div class="col-sm-10">

                      <input type="checkbox" name="proveedor" id="proveedor" >
                  </div>
                </div>

                <div class="form-group" id="div_referencia" <?php echo ($ocliente->caract_ref == null) ? 'hidden' : '' ; ?> >
                  <label for="text" class="col-sm-2 control-label">Referencia</label>

                  <div class="col-sm-10">
                    <select class="form-control" name="caract_ref" id="caract_ref">
                    <?php foreach ($lreferencias as $referencia): ?>
                      <option <?php echo ($referencia->idcaracteristica == $ocliente->caract_ref) ? 'selected' : '' ; ?> value="<?php echo $referencia->idcaracteristica ?>"><?php echo $referencia->nombre_caracteristica ?></option>
                    <?php endforeach ?>
                    </select>
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Dirección</label>

                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="direccion" name="direccion" placeholder="Dirección" value="<?php echo $ocliente->direccion_per ?>" >
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Correo</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="correo" name="correo" placeholder="Correo" value="<?php echo $ocliente->correo_per ?>" >
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Teléfono Fijo</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="telefonofij" name="telefonofij" onkeypress="return soloNumeros(event)" maxlength="11" placeholder="Teléfono Fijo" value="<?php echo $ocliente->telefonofij_per ?>" >
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Celular</label>
                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="telefonocel" name="telefonocel" onkeypress="return soloNumeros(event)" maxlength="9"placeholder="Celular" value="<?php echo $ocliente->telefonocel_per ?>" >
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Facebook</label>

                  <div class="col-sm-10">
                    <input type="text" style='text-transform:uppercase' class="form-control" id="facebook" name="facebook" placeholder="Facebook" value="<?php echo $ocliente->facebook_per ?>" >
                  </div>
                </div>

                <div class="form-group">
                  <label for="text" class="col-sm-2 control-label">Procedencia</label>

                  <div class="col-sm-3">
                    <select class="form-control select2" style="width: 100%;" name="departamento" id="departamento">
                      <option selected="selected">Departamento</option>
                      <?php foreach ($ldepartamentos as $departamento): ?>
                        <option  <?php echo ($departamento->departamento_ubi == $ocliente->departamento_ubi) ? 'selected' : '' ; ?>  value="<?php echo $departamento->departamento_ubi ?>"><?php echo $departamento->departamento_ubi ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                  <div class="col-sm-3">
                    <select class="form-control select2" id="provincia" name="provincia" style="width: 100%;">
                      <option selected="selected">Provincia</option>
                      <?php if (isset($_GET['id'])): ?>
                        <?php foreach ($lprovincias as $provincia): ?>
                          <option value='<?php echo $provincia->provincia_ubi ?>' <?php echo ($provincia->provincia_ubi == $ocliente->provincia_ubi) ? 'selected' : '' ; ?> ><?php echo $provincia->provincia_ubi ?></option>
                        <?php endforeach ?>
                      <?php endif ?>
                    </select>
                  </div>
                  <div class="col-sm-4">
                    <select class="form-control select2" name="distrito" id="distrito" style="width: 100%;">
                      <option selected="selected">Distrito</option>
                      <?php if (isset($_GET['id'])): ?>
                        <?php foreach ($ldistritos as $distrito): ?>
                          <option value="<?php echo $distrito->id_ubigeo ?>" <?php echo ($distrito->id_ubigeo == $ocliente->ubigeo_id_ubi) ? 'selected' : '' ; ?>><?php echo $distrito->distrito_ubi ?></option>
                        <?php endforeach ?>
                      <?php endif ?>
                    </select>
                  </div>
                </div>
              </div>


              <!-- /.box-body -->
              <div class="box-footer">
                <a href="index.php?page=mantenimientos&accion=panelempleados" class="btn btn-danger" role="button">Regresar <span class="glyphicon glyphicon-arrow-left"></span></a>
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
<!-- InputMask -->
<script src="assets/plugins/input-mask/jquery.inputmask.js"></script>
<script src="assets/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="assets/plugins/input-mask/jquery.inputmask.extensions.js"></script>

<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="assets/plugins/select2/select2.js"></script>

<!-- AdminLTE App -->
<script src="assets/dist/js/app.min.js"></script>
<script src="js/bootbox.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/empleados.js"></script>
<script src="js/validaciones.js"></script>
<script src="js/ubigeo.js"></script>

</body>
</html>
