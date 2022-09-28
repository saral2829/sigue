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
                  <table id="tabla_resultados" class="table table-responsive">
                    <thead>
                      <tr>
                        <th>Nro Pedido</th>
                        <th>Proveedor</th>
                        <th>Sucursal</th>
                        <th>Accion</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($lpedidos as $ped): ?>
                        <tr>
                          <td><?php echo $ped->pec_id ?></td>
                          <td><?php echo $ped->razonsoc_per ?></td>
                          <td><?php echo $ped->razonsoc_suc ?></td>
                          <td><button class="btn btn-success btn-xs"><i class="fa fa-fw fa-check-square-o"></i> Selec.</button></td>
                        </tr>
                      <?php endforeach ?>
                    </tbody>
                  </table>
                </div>

<!--                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Producto: </label>
                  <div class="col-sm-7">
                    <input type="text" class="form-control" id="term" placeholder="Buscar producto...">
                  </div>
                  <div>
                    <button class="btn btn-success" id="btm_buscar_modal"><i class="fa fa-fw fa-search"></i> Buscar</button>
                  </div>
                </div> -->
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
