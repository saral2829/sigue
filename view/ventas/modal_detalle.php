<div  id="modal_detalle"  tabindex="-1" role="dialog" class="modal fade">
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
                    <label class="col-md-2 col-xs-2 control-label">Nro Pedido</label>
                    <div class="col-md-4 col-xs-6">
                        <p class="form-control-static">-------</p>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-2 col-xs-2 control-label">Sucursal</label>
                    <div class="col-md-4 col-xs-6">
                        <p class="form-control-static"><?php echo $oventa->razonsoc_suc ?></p>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-2 col-xs-2 control-label">Registrado por:</label>
                    <div class="col-md-10 col-xs-10">
                        <p class="form-control-static"><?php echo $oventa->apellidopat_per.' '.$oventa->apellidomat_per.' '.$oventa->nombres_per ?></p>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-2 col-xs-2 control-label">Registrado el:</label>
                    <div class="col-md-10 col-xs-10">
                        <p class="form-control-static"><?php echo $oventa->fh_venta ?></p>
                    </div>
                  </div>
                <div class="form-group">
                  <table id="tabla_resultados" class="table table-bordered table-condensed">
                    <thead>
                      <tr>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Sub total</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($detalle as $det): ?>
                        <tr>
                          <td><?php echo $det->nombre_producto ?></td>
                          <td><?php echo $det->cantidad ?></td>
                          <td><?php echo $det->precio_unitario ?></td>
                          <td><?php echo $det->subtotal ?></td>
                        </tr>
                      <?php endforeach ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2"></td>
                            <td><b>Total</b></td>
                            <td style="background-color: #cddc3954;" ><?php echo $oventa->total ?></td>
                        </tr>
                    </tfoot>
                  </table>
                </div>


              </div>
            </div>
            <!-- /.box-body -->
          </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-fw fa-sign-out"></i> Salir</button>
        </div>

      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
</div>
<!-- /.modal -->
