        <div  id="modal_caracteriticas"  tabindex="-1" role="dialog" class="modal fade">
        <form class="form-horizontal" name="form_registro" id="form_registro" method="POST">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><b><?php echo $titulo ?></b></h4>
              </div>
              <div class="modal-body">
              <div class="box-body">

              <div class="col-md-12">
                <?php if ($ocaract->caracteristica_padre != null): ?>
                  <div class="form-group">
                  <!-- col-sm-offset-3 -->
                    <label class="col-md-12 ">Valor de : <?php echo $caract_padre->nombre_caracteristica ?> </label>
                  </div>                
                <?php endif ?>

                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Nombre <?php echo $txt_tipo ?>: </label>

                  <div class="col-sm-9">
                    <input type="text" class="form-control" name="nombre_caracteristica" value="<?php echo $ocaract->nombre_caracteristica ?>" placeholder="Nombre <?php echo $txt_tipo ?>">
                  </div>
                </div>

                <div class="form-group">
                <label class="col-sm-3 control-label">Estado: </label>
                  <div class=" col-sm-9">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" <?php echo $vigencia ?> name="chk_estado"> Activo
                      </label>
                    </div>
                  </div>
                </div>

                <?php if ($tipo == 1): ?>
                <div class="form-group">
                <label class="col-sm-3 control-label">Referencia de proveedor: </label>
                  <div class=" col-sm-9">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" <?php echo $referencia ?> name="chk_referencia"> Referencia
                     </label>
                    </div><code><b>Solo se puede referenciar un item</b></code>
                  </div>
                </div>                  
                <?php endif ?>




                <input type="hidden" name="id_padre" id="id_padre" value="<?php echo $id_padre ?>">
                <input type="hidden" name="id" id="id" value="<?php echo $id; ?>">

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
