            <div class="box box-success">
              <div class="box-header with-border">
                <h3 class="box-title">Listado valores</h3>
                <button type="button" data-tipo="2" class="btn btn-primary pull-right btn_aniadir"><strong>Añadir</strong></button>
              </div>
              <div class="box-body">
                <table class="table no-margin ">
                  <thead>
                    <tr >
                      <th>#</th>
                      <th>Item</th>
                      <th>Estado</th>
                      <th>Accion</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($lvalores as $item): ?>
                      <tr>
                        <td><?php echo $nro; ?></td>
                        <td><?php echo $item->nombre_caracteristica; ?></td>
                        <td><span class="label label-<?php echo ($item->estado == 1) ? 'success' : 'danger' ; ?>"><?php echo ($item->estado == 1) ? 'Activo' : 'Inactivo' ; ?></span></td>
                        <td><button type="button" class="btn btn-success btn-xs edit" data-tipo="2" data-id="<?php echo $item->idcaracteristica ?>"><i class="fa fa-fw fa-edit"></i></button></td>
                      </tr>                    
                      <?php $nro++; endforeach ?>

                    </tbody>
                  </table>
                </div>

            </div>
            <div class="box-body">
            </div>