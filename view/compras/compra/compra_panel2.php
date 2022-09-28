
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
          COMPRAR
        </h1>
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-md-12">

            <!-- Horizontal Form -->
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">REGISTRO DE COMPRA</h3>
              </div>
              <div class="form-horizontal">
                <div class="box-body">
                  <!-- radio -->
                  <div class="form-group">

                    <div class="col-md-2 col-sm-6">
                      <input type="text" class="form-control" placeholder="SERIE - N°DOC" disabled="">
                    </div>  
                    <div class="col-lg-3">
                     <select id="cboTipVen" name="cboTipVen" class="form-control" onchange="ocultarDiv(this.value,'divContCred');">
                       <option value="0" selected="">COMPRA CONTADO</option>
                       <option value="1">COMPRA CREDITO</option>
                     </select>
                   </div>
                 </div>
                 <hr>
                 <div class="col-md-12">
                   <div class="form-group form-horizontal">
                    <div class="radio col-md-6 col-sm-6">
                      <label>
                        <input type="radio" name="tipo_busqueda" id="tipo_busqueda" value="1" checked="">
                        Pedido/Proveedor 
                      </label>
                    </div>
                    <div class="radio col-md-6 col-sm-6">
                      <label>
                        <input type="radio" name="tipo_busqueda" id="tipo_busqueda" value="2">
                        Producto
                      </label>
                    </div>
                  </div>                   
                 </div>


                 <div class="box-tools">
                  <div class="input-group input-group-sm" style="width: 100%;">
                    <input type="text" id="table_search" class="form-control pull-right" placeholder="BUSCAR PEDIDO POR NRO DE PEDIDO - PROVEEDOR - PRODUCTO">
                    <div class="input-group-btn">
                      <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                    </div>
                  </div>

                </div>

                <div class="box-body">
                  <div>
                    <button type="submit" class="btn btn-primary pull-right" id="btn_filtrar">FILTRAR <span class="glyphicon glyphicon-filter"></span></button> 
                  </div>
                </div>

                <div>
                 <div class="col-lg-2">
                  <select class="form-control">
                    <option value="0">TIPO CANTIDAD</option>
                    <option value="1">UNIDADES</option>
                    <option value="2">CAJAS</option>
                  </select>
                </div>
                <div class="col-lg-1">
                  <input type="text" class="form-control" placeholder="CANTIDAD">
                </div>
                <div class="col-lg-2" style="display:none;">
                  <div class="input-group">
                    <span class="input-group-addon">S/.</span>
                    <input type="hidden" class="form-control" placeholder="PRECIO">
                  </div>
                </div>
                <div class="col-lg-2">
                  <div class="input-group">
                    <span class="input-group-addon">S/.</span>
                    <input type="text" class="form-control" placeholder="PRECIO">
                  </div>
                </div>
                <div class="col-lg-2"><input class="form-control" placeholder="LOTE"></div>
                <div class="form col-lg-2">
                 <div class="input-group">
                  <input class="form-control col-lg-2" placeholder="FECHA">
                  <a class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></a>
                </div>
              </div><br><br>
              <div class="col-lg-2 form pull-right">
                <a href="#divcarrito" class="btn btn-primary col-lg-12"><span class="glyphicon glyphicon-shopping-cart"></span> Agregar</a>
              </div>
            </div>    
          </div>

          <div class="panel panel-default" id="divConCliSel" name="divConCliSel">
            <div class="panel-heading">
              <h3 class="panel-title">Descrición de los datos de Proveedor</h3>
            </div>
            <div class="panel-body"><input type="hidden" id="txtRucCli" name="txtRucCli" value="">
              ----------------------
            </div>
          </div>

          <hr>

          <div class="box-body table-responsive no-padding">
            <table id="example1" class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th>CODIGO BARRA</th>
                  <th>DESCRIPCIÓN</th>
                  <th>PRECIO</th>          
                  <th>C. UNID</th>
                  <th>C. CAJA</th>
                  <th>IMPORTE</th>
                  <th>OPCIÓN</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>PANTALON SODA</td>
                  <td>20.00</td>
                  <td>10</td>
                  <td>0</td>
                  <td>200.00</td>
                  <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>BLUSA SODA</td>
                    <td>10.00</td>
                    <td>10</td>
                    <td>0</td>
                    <td>100.00</td>
                    <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>PANTALON MILK</td>
                      <td>20.00</td>
                      <td>10</td>
                      <td>0</td>
                      <td>200.00</td>
                      <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></td>
                      </tr>
                      <tr>
                        <td>4</td>
                        <td>RELOJ GUESS</td>
                        <td>400.00</td>
                        <td>10</td>
                        <td>0</td>
                        <td>4000.00</td>
                        <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></td>
                        </tr>
                        <tr>
                          <td>5</td>
                          <td>PANTALON SODA</td>
                          <td>20.00</td>
                          <td>10</td>
                          <td>0</td>
                          <td>200.00</td>
                          <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>

                    <hr>

                    <div class="col-lg-12" style="display: block;">
                      <div class="form-group">
                        <label class="control-label col-lg-1 bja-5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inicial:</label>
                        <div class="form col-lg-2">
                          <div class="input-group">
                            <span class="input-group-addon">S/.</span>
                            <input type="text" class="form-control col-lg-2" placeholder="MONTO" >
                          </div>
                        </div>
                        <label class="control-label col-lg-1 bja-5px">&nbsp;&nbsp;&nbsp;&nbsp;1<sup>er</sup>&nbsp;Letra:</label>
                        <div class="form col-lg-2">
                         <div class="input-group">
                          <input type="text" class="form-control col-lg-2" placeholder="FECHA">
                          <a class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></a>
                        </div>
                      </div>
                      <label class="control-label col-lg-1 bja-5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cada:</label>
                      <div class="form col-lg-2">
                       <div class="input-group">
                        <input type="text" class="form-control col-lg-2" placeholder="NUMERO">
                        <span class="input-group-addon">días</span>
                      </div>
                    </div>
                    <label class="control-label col-lg-1 bja-5px">N<sup>ro</sup>&nbsp;Letras:</label>
                    <div class="form col-lg-2">
                     <div class="input-group">
                      <input type="text" class="form-control col-lg-2" placeholder="NUMERO">
                      <span class="input-group-addon">Letras</span>
                    </div>
                  </div><br><br>
                  <div class="form col-lg-2 pull-right">
                    <a href="#divLetras" class="btn btn-warning col-lg-12"><span class="glyphicon glyphicon-cog"></span> Generar Letras</a>
                  </div><br><br>
                </div> 


                <table width="100%" class="table table-bordered">
                  <tbody><tr style="background-color: lightblue;">
                    <td align="center"><strong>N° Letra</strong></td>
                    <td align="center"><strong>Monto</strong></td>
                    <td align="center"><strong>Saldo</strong></td>
                    <td align="center"><strong>Fecha Vencimiento</strong></td>
                  </tr>
                  <tr>
                    <td align="center">0</td>
                    <td align="center">S/.200.00</td>
                    <td align="center">S/.36.00</td>
                    <td align="center">7-07-2018</td>
                  </tr><tr>
                    <td align="center">1</td>
                    <td align="center">S/.18.00</td>
                    <td align="center">S/.18.00</td>
                    <td align="center">07-07-2018</td>
                  </tr><tr>
                    <td align="center">2</td>
                    <td align="center">S/.18.00</td>
                    <td align="center">S/.0.00</td>
                    <td align="center">27-07-2018</td>
                  </tr></tbody>
                </table>

                <div class="form-group">
                  <label class="control-label col-lg-4 bja-5px">Numero&nbsp;de&nbsp;operación&nbsp;bancaria&nbsp;de&nbsp;pago&nbsp;de&nbsp;inicial:</label>
                  <div class="form col-lg-8">
                    <div class="input-group">
                     <span class="input-group-addon">NUM:</span>
                     <input type="text" class="form-control" placeholder="NUMERO">
                   </div>
                 </div>
               </div>

               <hr>
             </div>
             <div id="modales"></div>
             <!-- /.box-body -->
             <div class="box-footer">
              <button type="submit" class="btn btn-default">Limpiar</button>
              <button type="submit" class="btn btn-info pull-right">Guardar Compra <span class="glyphicon glyphicon-floppy-disk"></span></button>
            </div>
          </div> 
        </div>
        <!-- /.box-header -->
      </div>
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

<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>
<script src="js/compras/compras.js"></script>

</body>
</html>
