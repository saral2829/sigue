              <table id="tabla_productos" class="table table-bordered table-hover table-responsive"  width="100%">
                <thead>
                <tr>

                  <th>Nro</th>
                  <th>PRODUCTO</th>
                  <th>CATEGORIA</th>
                  <th>PROVEEDOR</th>
                  <th>CARACT.</th>
                  <th>UNIDADES</th>
                  <th>COD.BARRAS</th>
                  <th>ESTADO</th>
                  <th>ACCIONES</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($lproductos as $producto): ?>
                  <tr>

                    <td><?php echo $nro ?></td>
                    <td><?php echo $producto->nombre_producto ?></td>
                    <td><?php echo $producto->nombre_categoria ?></td>
                    <td><?php echo ($producto->tipo_per == 1) ? $producto->nombres_per : $producto->razonsoc_per; ?></td>
                    <td>
                      <ul>
                      <?php $lcaractertiscitcas = $productos->obtenerProductoCaracteristicas($producto->idproducto);?>
                      <?php foreach ($lcaractertiscitcas as $caract): ?>
                       <li><?php echo '<b>' . $caract->nombre_caract . ' : </b>' . $caract->valor_caract ?></li>
                      <?php endforeach?>


                      </ul>

                    </td>
                    <td>
                      <?php $lunidades = $productos->obtenerProductoUnidades($producto->idproducto);?>
                      <ul>
                        <?php foreach ($lunidades as $unidad): ?>
                          <li><?php echo $unidad->unidadmed_ume ?></li>
                        <?php endforeach?>
                      </ul>
                    </td>
                    <td>
                      <?php if (isset($producto->code_bar)) {?>
                      <a href="#" id="vercodigo" type="button" class="btn btn-info btn-xs vercodigo" codebar="<?php echo $producto->code_bar ?>" nombre="<?php echo $producto->nombre_producto ?>" data-toggle="tooltip" data-placement="bottom" title="Ver"><i class="fa fa-eye"></i></a>
                      <?php } else {?>
                        <a href="#" producto="<?php echo $producto->idproducto ?>" id="agregarcodigo" type="button" class="btn btn-success btn-xs" data-toggle="tooltip" data-placement="bottom" title="Agregar"><i class="fa fa-plus"></i></a>
                      <?php }?>

                    <td>
                      <span class='label label-<?php echo ($producto->estado == 1) ? 'success' : 'danger'; ?>'><?php echo ($producto->estado == 1) ? 'Activo' : 'Inactivo'; ?></span>
                    </td>
                    <td>
                      <!-- <button type="button" class="btn btn-success btn-xs"><i class="fa fa-eye"></i></button> -->
                      <a href="index.php?page=productos&accion=formproductos&id=<?php echo $producto->idproducto ?>" type="button" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="bottom" title="Editar"><i class="fa fa-edit"></i></a>
                    </td>
                  </tr>
                <?php
$nro++;
endforeach?>

<!--                 <tr>
                  <td>Misc</td>
                  <td>PSP browser</td>
                  <td>PSP</td>
                  <td>-</td>
                  <td align="center"><a type="button" class="btn btn-success btn-xs"><i class="fa fa-eye"></i><a></td>
                  <td align="center"><a type="button" class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i></a></td>
                  <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a></td>
                </tr> -->
                </tbody>

              </table>
              <div  id="modal_codebar"  tabindex="-1" role="dialog" class="modal fade">
                <div class="modal-dialog ">
                  <div class="modal-content">
                    <div class="modal-header bg-primary">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title"><b>Nombre del Producto: <span id="cod_nombre"></span></b></h4>
                    </div>
                    <div class="modal-body">
                    <div class="box-body" style="text-align: center;">

                      <img src="" style=" padding: 1em; border: 1px solid black; border-radius: 10px"/>
                    <div class="col-md-12">

                    </div>

                    </div>
                    <!-- /.box-body -->
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>
                      <button type="button" id="btn_descargar" class="btn btn-primary">Descargar</button>
                    </div>

                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->

              </div>
              <!-- /.modal -->

              <script>
                /*
                $("#vercodigo").click(function(e){
                  e.preventDefault();
                    var codebar = $(this).attr("codebar");
                    alert(codebar);
                });
                */
               const botones = document.querySelectorAll("#vercodigo");
                botones.forEach(boton => {
                  //Agregar listener
                  boton.addEventListener("click", function (e) {
                    e.preventDefault();
                    var codebar = $(this).attr("codebar");
                    var nombre = $(this).attr("nombre");

                    cargarmodal(codebar, nombre);

                  });
                });

                function cargarmodal(codebar, nombre){
                  $("#modal_codebar img").attr("src","assets/codeBar/barcode.php?text="+codebar+"&size=40&codetype=Code39&print=true");
                  $("#modal_codebar #cod_nombre").text(nombre);
                  $("#modal_codebar").modal("show");
                };

                $("#modal_codebar #btn_descargar").click(function(e){

                  var url = $("#modal_codebar img").attr("src");
                  var nombre = $("#modal_codebar #cod_nombre").text();

                  var a = document.createElement('a');
                  a.download = nombre;
                  a.target = '_blank';
                  a.href= url;

                  a.click();

                });
                const addCodigos = document.querySelectorAll("#agregarcodigo");
                addCodigos.forEach(cod => {
                  //Agregar listener
                  cod.addEventListener("click", function (e) {
                    e.preventDefault();
                    var id = $(this).attr("producto");

                    var options = {
                      type: "POST",
                      url: "index.php?page=productos&accion=generarcodebar",
                      data:{ id: id},
                      datatype: 'json',
                      success:
                      function (response) {
                        bootbox.alert(response.msj, function (result) {
                          window.location.href = "index.php?page=productos&accion=panelproductos";
                        });
                      },
                    };
                    $.ajax(options);

                  });
                });
              </script>
