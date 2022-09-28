        <div  id="modal_pedido"  tabindex="-1" role="dialog" class="modal fade">
        <div class="form-horizontal">
          <div class="modal-dialog  modal-lg">
            <div class="modal-content">
              <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text"><b><?php echo $titulo ?></b></h4>
              </div>
              <div class="modal-body">
              <div class="box-body">

              <div class="col-md-12">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Producto: </label>
                  <div class="col-sm-7">
                    <input type="text" class="form-control" id="term" placeholder="Buscar producto...">
                  </div>
                  <div>
                    <button class="btn btn-success" id="btm_buscar_modal"><i class="fa fa-fw fa-search"></i> Buscar</button>
                  </div>
                </div>
                <div id="resultados"></div>
<!-- 
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Descripcion categoria: </label>

                  <div class="col-sm-9">
                  </div>
                </div> -->

              </div>
         

              </div>
              <!-- /.box-body -->
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>
                <button type="submit" class="btn btn-primary">Guardar</button>
              </div>

            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
          </div>
        </div>
        <!-- /.modal -->
