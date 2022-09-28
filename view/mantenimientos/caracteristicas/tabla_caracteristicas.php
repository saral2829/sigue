                    <?php foreach ($lcaracteristicas as $item): ?>
                      <tr class="caract" data-id="<?php echo $item->idcaracteristica ?>">
                        <td><?php echo $nro; ?></td>
                        <?php $txt_ref = ($item->ref_proveedor == '1') ? '<span class="label label-danger">Ref</span>' : '' ; ?>
                        <td><?php echo $item->nombre_caracteristica.' '.$txt_ref; ?></td>
                        <td><span class="label label-<?php echo ($item->estado == 1) ? 'success' : 'danger' ; ?>"><?php echo ($item->estado == 1) ? 'Activo' : 'Inactivo' ; ?></span></td>
                        <td><button type="button" class="btn btn-success btn-xs edit" data-tipo="1" data-id="<?php echo $item->idcaracteristica ?>"><i class="fa fa-fw fa-edit"></i></button></td>
                      </tr>                    
                      <?php $nro++; endforeach ?>
