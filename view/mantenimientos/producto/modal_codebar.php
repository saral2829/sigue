        <div  id="modal_codebar"  tabindex="-1" role="dialog" class="modal fade">
          <div class="modal-dialog ">
            <div class="modal-content">
              <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><b>Codigo de Barras</b></h4>
              </div>
              <div class="modal-body">
              <div class="box-body">
                <img src="assets/codeBar/barcode.php?text=<?php $code_bar?>&size=40&codetype=Code39&print=true"/>
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
          </form>
        </div>
        <!-- /.modal -->
