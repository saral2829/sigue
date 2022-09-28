<div  id="modal_registro"  tabindex="-1" role="dialog" class="modal fade">
  <div class="form-horizontal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-primary">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title text"><b><?php echo $titulo_modal ?></b></h4>
          </div>
          <div class="modal-body">
            <div class="box-body">

              <div class="col-md-12">
                <div class="form-group">
                  <table id="tabla_resultados" class="table table-responsive table-hover table-condensed table-bordered">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>Producto</th>
                        <th>Caracteristicas</th>
                        <th>Accion</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($lproductos as $prod): ?>
                        <tr>
                          <td><?php echo $nro++; ?></td>
                          <td><?php echo $prod->nombre_producto ?></td>
                          <td>
                            <ul>
                            <?php $lcaractertiscitcas = $productos->obtenerProductoCaracteristicas($prod->idproducto); ?>
                            <?php foreach ($lcaractertiscitcas as $caract): ?>
                             <li><?php echo '<b>'.$caract->nombre_caract.' : </b>'.$caract->valor_caract ?></li> 
                            <?php endforeach ?>
                            
                            
                            </ul>                      

                          </td>                          
                          <td><button class="btn btn-success btn-xs seleccionar" data-id="<?php echo $prod->idproducto ?>"><i class="fa fa-fw fa-check-square-o"></i> Selec.</button></td>
                        </tr>
                      <?php endforeach ?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-fw fa-sign-out"></i> Salir</button>
<!--           <button type="submit" class="btn btn-primary">Guardar</button> -->
        </div>

      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
</div>
<!-- /.modal -->
