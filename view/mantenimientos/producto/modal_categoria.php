        <div  id="modal_categoria"  tabindex="-1" role="dialog" class="modal fade">
        <form class="form-horizontal" name="form_registro" id="form_registro" method="POST">
          <div class="modal-dialog ">
            <div class="modal-content">
              <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><b><?php echo $titulo ?></b></h4>
              </div>
              <div class="modal-body">
              <div class="box-body">

                       
              <div class="col-md-12">
              <?php if ($modo == 'edit'): ?>
                <div class="form-group">
                  <div class="col-sm-9">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="chk_cambiar" id="chk_cambiar"> Cambiar categoria
                      </label>
                    </div>
                  </div>
                </div>
                
              <?php endif ?>

                <div id="tree_modal"></div>
              </div>

              </div>
              <!-- /.box-body -->
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>
                <button type="button" id="btn_indicar" class="btn btn-primary">Indicar</button>
              </div>

            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
          </form>
        </div>
        <!-- /.modal -->
