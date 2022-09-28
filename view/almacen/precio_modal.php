<div  id="modal_precio"  tabindex="-1" role="dialog" class="modal fade">
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
                  <label class="form-control-static col-md-2 col-xs-2">Precio: </label>
                  <div class="col-md-10 col-xs-8">
                    <p class="form-control-static" id="span_precio"><?php echo $oprecio->precio_venta ?></p>
                    <input type="text" class="form-control" id="precio" style="display: none;" value="<?php echo $oprecio->precio_venta ?>">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-md-10 col-xs-8 col-md-offset-2 col-xs-offset-2">
                    <input type="checkbox" id="editar"> Editar
                  </div>
                </div>

              </div>
            </div>
            <!-- /.box-body -->
          </div>
        <div class="modal-footer" id="div_footer">
          <button type="button" class="btn btn-danger pull-left" data-dismiss="modal"><i class="fa fa-fw fa-sign-out"></i> Salir</button>
          <!-- <button type="submit" class="btn btn-primary">Guardar</button> -->
        </div>

      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
</div>
<!-- /.modal -->
