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
         UNIDADES DE MEDIDA
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">LISTADO DE UNIDADES DE MEDIDA</h3>
              <a href="index.php?page=mantenimientos&accion=formunidadmedida"><button type="button" class="btn btn-primary pull-right"><strong>NUEVO</strong></button></a>
            </div>
            <!-- /.box-header -->

          <div class="box-body">
            <div class="box-body">
              <table id="example1" class="table table-bordered table-hover table-responsive">
                <thead>
                <tr>
                  <th>ID</th>
                  <th>UNIDAD MED</th>
                  <th>ABREVIATURA</th>
                  <th>VIGENCIA</th>
                  <th>ACCIONES</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($lunidades as $unidad): ?>
                  <tr>
                    <td><?php echo $unidad->id_unidadmedida ?></td>
                    <td><?php echo strtoupper($unidad->unidadmed_ume); ?></td>
                    <td><?php echo strtoupper($unidad->abreviatura_ume) ?></td>
                    <td><?php echo ($unidad->vigencia_ume == '1') ? '<b>Activo</b>' : '<b>Inactivo</b>' ; ?></td>
                    <td>
                      <a href="index.php?page=mantenimientos&accion=formunidadmedida&id=<?php echo $unidad->id_unidadmedida ?>" type="button" class="btn btn-success btn-xs"><i class="fa fa-pencil"></i><a>
                    </td>       
                  </tr>
                <?php
                  $nro = $nro + 1 ;
                  endforeach ?>
                </tbody>

              </table>
            </div>
          </div>

            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Versi??n</b> 1.0.0
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
<!-- AdminLTE for demo purposes -->
<script src="assets/dist/js/demo.js"></script>
<!-- Lenguaje -->
<script src="js/lenguaje_datatable.js"></script>

<script type="text/javascript">
  $(document).ready(function() {
    $("#example1").DataTable(
        {
          "oLanguage": spanishtable,
          "scrollX": true
        }
      );
  });

</script>
</body>
</html>
