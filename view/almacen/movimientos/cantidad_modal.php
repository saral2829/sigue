<div  id="modal_cantidad"  tabindex="-1" role="dialog" class="modal fade">
  <div class="form-horizontal">
    <div class="modal-dialog">
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
                  <label class="form-control-static col-md-2 col-xs-2">Producto: </label>
                  <div class="col-md-10 col-xs-8">
                    <p class="form-control-static"><?php echo $oproducto->nombre_producto ?></p>
                    <input type="hidden" id="prod_id" value="<?php echo $oproducto->idproducto ?>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="form-control-static col-md-2 col-xs-2">Cantidad: </label>
                  <div class="col-md-4 col-xs-4">
                    <input type="text" class="form-control cantidad" id="cantidad_modal" data-tipo_form="modal" value="<?php echo $cantidad_mov ?>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="form-control-static col-md-2 col-xs-2">Disponible: </label>
                  <div class="col-md-10 col-xs-8">
                    <p class="form-control-static" id="span_disponible_modal"><?php echo $disponible ?></p>
                    <input type="hidden" id="disponible_modal" value="<?php echo $disponible ?>">
                    <input type="hidden" id="stock_actual_modal" value="<?php echo $stock_actual ?>">
                  </div>
                </div>

              </div>
            </div>
            <!-- /.box-body -->
          </div>
        <div class="modal-footer" id="div_footer">
          <button type="button" class="btn btn-danger pull-left" data-dismiss="modal"><i class="fa fa-fw fa-sign-out"></i> Salir</button>
          <button type="button" id="btn_upt_cantidad" class="btn btn-primary">Guardar</button>
        </div>

      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
</div>
<!-- /.modal -->
