        <div  id="modal_categoria"  tabindex="-1" role="dialog" class="modal fade">
        <form class="form-horizontal" name="form_registro" id="form_registro" method="POST">
          <div class="modal-dialog  modal-lg">
            <div class="modal-content">
              <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><b><?php echo $titulo ?></b></h4>
              </div>
              <div class="modal-body">
              <div class="box-body">

              <div class="col-md-6">
                <?php if ($categoria_padre != null): ?>
                  <div class="form-group">
                  <!-- col-sm-offset-3 -->
                    <label class="col-md-12 ">Subcategoria de : <?php echo $ocategoria->nombre_categoria ?> </label>
                  </div>                
                <?php endif ?>

                <div class="form-group">
                  <label for="nombre_categoria" class="col-sm-3 control-label">Nombre categoria: </label>

                  <div class="col-sm-9">
                    <input type="text" class="form-control" name="nombre_categoria" value="<?php echo $nombre_categoria ?>" placeholder="Nombre categoria">
                  </div>
                </div>

                <div class="form-group">
                  <label for="descripcion_categoria" class="col-sm-3 control-label">Descripcion categoria: </label>

                  <div class="col-sm-9">
                    <textarea class="form-control" name="descripcion_categoria"  placeholder="Descripcion de categoria"><?php echo $descripcion_categoria ?></textarea>
                  </div>
                </div>

                <div class="form-group">
                <label for="chk_estado" class="col-sm-3 control-label">Estado: </label>
                  <div class=" col-sm-9">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" <?php echo $vigencia ?> name="chk_estado"> Activo
                      </label>
                    </div>
                  </div>
                </div>

                <input type="hidden" name="id_padre" id="id_padre" value="<?php echo $categoria_padre ?>">
                <input type="hidden" name="id" id="id" value="<?php echo $id; ?>">

              </div>
         
              <div class="col-md-6">
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
                <button type="submit" class="btn btn-primary">Guardar</button>
              </div>

            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
          </form>
        </div>
        <!-- /.modal -->
