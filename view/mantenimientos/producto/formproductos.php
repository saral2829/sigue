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
  <!-- Select2 -->
  <link rel="stylesheet" href="assets/plugins/select2/select2.min.css">
  <link rel="stylesheet" type="text/css" href="css/skin-win8/ui.fancytree.css">

  <!-- Theme style -->
  <link rel="stylesheet" href="assets/dist/css/AdminLTE.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
  folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="assets/dist/css/skins/_all-skins.min.css">

  <link rel="shortcut icon" href="assets/dist/img/jp.ico">
  <link rel="stylesheet" type="text/css" href="css/personalizado.css">

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
          <form class="form-horizontal" name="form_registro" id="form_registro">
            <div class="col-md-12">
              <div class="box box-solid box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title"><b>Formulario de producto</b></h3>
                </div>
                <div class="box-body">
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">

                      <label for="inputEmail3" class="col-sm-2 col-md-2 control-label">Nombre:</label>

                      <div class="col-sm-8 col-md-8">
                        <input style="text-transform: uppercase;" type="nombre" required class="form-control" name="nombre_producto" id="nombre_producto" placeholder="Nombre de producto" value="<?php echo isset ($nombre_producto)?$oproducto->nombre_producto:'' ?>">
                        <input type="hidden" name="idproducto" value="<?php echo isset( $_GET['id'] )?$_GET['id'] :''?>" >
                        <input type="hidden" id="idprod_repetido">
                      </div><br class="hidden-xs"><br>
                      <span class="col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2" id="span_producto"></span>
                    </div>


                    <div class="form-group">

                      <div class="col-sm-10 col-sm-offset-2">
                        <button type="button" class="btn btn-warning" id="indicar_categoria"><i class="fa fa-fw fa-indent"></i> Indicar categoria</button>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Categoria:</label>
                      <div class="col-sm-8 col-md-8">
                      <input type="hidden" name="idcategoria" id="idcategoria" value="<?php echo isset($idcategoria )? $oproducto->idcategoria:'' ?>">
                        <span class="span_info" id="span_categoria"><?php echo isset($nombre_categoria)? $oproducto->nombre_categoria:'' ?></span>
                      </div>
                    </div>


                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 col-md-2 control-label ">Proveedor:</label>
                      <div class="col-sm-8">
                        <select name="proveedor" id="proveedor" class="form-control col-md-12 col-sm-12 select2" style="width: 100%" required>
                        <option disabled selected >Selecciona un proveedor</option>
                        <?php foreach ($lproveedores as $proveedor): ?>

                          <option <?php echo isset($proveedor->id_per)? (($oproducto->idproveedor == $proveedor->id_per) ? 'selected' : '' ):''; ?> 
                          value="<?php echo isset($id_per)? $proveedor->id_per : ''?>" ><?php echo ($proveedor->tipo_per == 1) ? strtoupper($proveedor->nombres_per.' '.$proveedor->apellidopat_per.' '.$proveedor->apellidomat_per) : strtoupper($proveedor->razonsoc_per) ;  ?></option>
                        <?php endforeach ?>

                        </select>
                      </div>
                      <br class="hidden-xs"><br>
                      <span class="col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2" id="span_proveedor"></span>

                      <input type="hidden" id="proveedor_repetido">
                    </div>

                    <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" name="estado" <?php echo ($oproducto->estado == '1' or !isset($id)) ? 'checked' : '' ; ?>> Activo
                          </label>
                        </div>
                      </div>
                    </div>

                  </div>
                  <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                      <label for="inputEmail3" class="col-sm-2 col-md-2 control-label">Caracter. </label>

                      <div class="col-sm-4 col-md-4">
                        <select id="caract" class="form-control select2">
                          <option value="-1" selected >Seleccionar</option>
                          <?php foreach ($lcaracteristicas as $cat): ?>
                            <?php if (isset($_GET['id'])): ?>
                              <option <?php echo (in_array($cat->idcaracteristica, $padres) == true) ? 'hidden' : '' ; ?> value="<?php echo $cat->idcaracteristica ?>"><?php echo $cat->nombre_caracteristica ?></option>

                            <?php else: ?>
                              <option value="<?php echo $cat->idcaracteristica ?>"><?php echo $cat->nombre_caracteristica ?></option>

                            <?php endif ?>

                          <?php endforeach ?>
                        </select>

                      </div>
                      <div class="col-sm-4 col-md-4">
                        <select class="form-control col-md-3 select2" id="valor" >
                        <option value="-1" selected >Seleccionar</option>
                        </select>

                      </div>
                     <div class="col-sm-2">
                     <button type="button" id="add_caract" class="btn btn-success"><i class="fa fa-fw fa-plus"></i></button>
                      </div>

                    </div>

                    <div class="form-group col-md-12">
                      <!-- <div id="tabla_caract"></div> -->
                      <table id="tabla_caract" class="table table-bordered ">
                      <thead>
                        <th></th>
                        <th width="40%">Caracteristicas</th>
                        <th width="50%">Valor</th>
                        <th width="10%">Accion</th>
                      </thead>
                        <tbody>
                          <?php if (isset($_GET['id'])): ?>
                            <?php foreach ($lcaract as $caract): ?>
                              <tr>
                                <td><i style="color: #c7254e" class="fa fa-fw fa-warning"></i></td>
                                <td hidden><?php echo $caract->id_caracteristica_padre ?></td>
                                <td><?php echo $caract->caracteristica_padre ?></td>
                                <td hidden><?php echo $caract->idvalor ?></td>
                                <td><?php echo $caract->valor ?></td>
                                <td hidden>true</td>
                                <td><button data-caract="<?php echo $caract->id_caracteristica_padre ?>" type="button" class="btn btn-danger  remover btn-xs"><i class="fa fa-fw fa-minus"></i></button></td>
                              </tr>
                            <?php endforeach ?>
                          <?php endif ?>

                        </tbody>
                      </table>
                      <hr>
                    </div>

                    <div class="form-group">
                      <label for="inputEmail3" class="col-sm-2 col-md-2 control-label">Unidades Medida </label>

                      <div class="col-sm-6 col-md-6">
                        <select id="s_unidades" class="form-control select2">
                          <option value="-1" selected >Seleccionar</option>
                          <?php foreach ($lunidades as $unidad): ?>
                            <?php if (isset($_GET['id'])): ?>
                              <option <?php echo (in_array($unidad->id_unidadmedida, $unids) == true) ? 'hidden' : '' ; ?> value="<?php echo $unidad->id_unidadmedida ?>"><?php echo $unidad->unidadmed_ume ?></option>

                            <?php else: ?>
                              <option value="<?php echo $unidad->id_unidadmedida ?>"><?php echo $unidad->unidadmed_ume ?></option>

                            <?php endif ?>

                          <?php endforeach ?>
                        </select>

                      </div>
                     <div class="col-sm-2 col-md-2">
                     <button type="button" id="add_unidad" class="btn btn-success"><i class="fa fa-fw fa-plus"></i></button>
                      </div>

                    </div>


                    <div class="form-group col-md-12">
                      <!-- <div id="tabla_caract"></div> -->
                      <table id="tabla_unidades" class="table table-bordered ">
                      <thead>
                        <th>Unidad</th>
                        <th width="10%">Accion</th>
                      </thead>
                        <tbody>
                         <?php if (isset($_GET['id'])): ?>
                            <?php foreach ($lunidadesproducto as $unidad): ?>
                              <tr>
                                <td hidden><?php echo $unidad->id_unidadmedida ?></td>
                                <td><?php echo $unidad->unidadmed_ume ?></td>
                                <td><button data-unidad="<?php echo $unidad->id_unidadmedida ?>" type="button" class="btn btn-danger  remover btn-xs"><i class="fa fa-fw fa-minus"></i></button></td>
                              </tr>
                            <?php endforeach ?>
                          <?php endif ?>

                        </tbody>
                      </table>
                    </div>


                  </div>

                </div>
                <input type="hidden" id="modo_form" value="<?php echo $modo_form ?>">
                <div class="box-footer">
                  <a href="index.php?page=productos&accion=panelproductos" type="button" class="btn btn-danger"><i class="fa fa-fw fa-sign-out"></i> Cancelar</a>
                  <button <?php ($modo_form != 'edit') ? 'edit' : '' ; ?> id="btn_registrar" type="submit" class="btn btn-primary pull-right"><i class="fa fa-fw fa-save"></i> Guardar</button>
                </div>


              </div>
            </div>

            <div id="div_verificar">
              <input type="hidden" id="total_items">
              <input type="hidden" id="items_repetidos">
            </div>


          </form>
        </div>

      </section>

    </div>
    <div id="divmodal_categoria"></div>
    <footer class="main-footer">
      <div class="pull-right hidden-xs">
        <b>Version</b> 1.0.0
      </div>
      <strong>Copyright &copy; 2017 <a href="http://apps.gruva.net/" target="_blank">Gruva Apps</a>.</strong> Todos los derechos reservados.
    </footer>

  </div>
    <!-- jQuery 2.2.3 -->
    <script src="assets/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="assets/plugins/jQueryUI/jquery-ui.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- Select2 -->
    <script src="assets/plugins/select2/select2.js"></script>
    <!-- Slimscroll -->
    <script src="assets/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="assets/plugins/fastclick/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="assets/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="js/bootbox.min.js"></script>
    <script src="js/jquery.fancytree.js"></script>
    <script src="js/productos.js"></script>

    <script src="js/validacion_productos.js"></script>

    <script>
      $(document).ready(function() {
          $('.select2').select2({
            language: "es",
             placeholder: "Selecciona una opcion",
          });

      });
    </script>
</body>
</html>
