              <table id="tabla_productos" class="table table-bordered table-hover table-responsive"  width="100%">
                <thead>
                <tr>

                  <th>Nro</th>
                  <th>PRODUCTO</th>
                  <th>CATEGORIA</th>
                  <th>PROVEEDOR</th>
                  <th>CARACT.</th>
                  <th>UNIDADES</th>
                  <th>ESTADO</th>
                  <th>ACCIONES</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($lproductos as $producto): ?>
                  <tr>

                    <td><?php echo $nro ?></td>
                    <td><?php echo $producto->nombre_producto ?></td>
                    <td><?php echo $producto->nombre_categoria ?></td>
                    <td><?php echo ($producto->tipo_per == 1) ? $producto->nombres_per : $producto->razonsoc_per ; ?></td>
                    <td>
                      <ul>
                      <?php $lcaractertiscitcas = $productos->obtenerProductoCaracteristicas($producto->idproducto); ?>
                      <?php foreach ($lcaractertiscitcas as $caract): ?>
                       <li><?php echo '<b>'.$caract->nombre_caract.' : </b>'.$caract->valor_caract ?></li> 
                      <?php endforeach ?>
                      
                      
                      </ul>                      

                    </td>
                    <td>
                      <?php $lunidades = $productos->obtenerProductoUnidades($producto->idproducto); ?>
                      <ul>
                        <?php foreach ($lunidades as $unidad): ?>
                          <li><?php echo $unidad->unidadmed_ume ?></li>
                        <?php endforeach ?>
                      </ul>
                    </td>
                    <td>
                      <span class='label label-<?php echo ($producto->estado == 1) ? 'success' : 'danger' ;  ?>'><?php echo ($producto->estado == 1) ? 'Activo' : 'Inactivo' ; ?></span>
                    </td>
                    <td>
                      <!-- <button type="button" class="btn btn-success btn-xs"><i class="fa fa-eye"></i></button> -->
                      <a href="index.php?page=productos&accion=formproductos&id=<?php echo $producto->idproducto ?>" type="button" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="bottom" title="Editar"><i class="fa fa-edit"></i></a>
                    </td>       
                  </tr>
                <?php
                  $nro++ ;
                  endforeach ?>

<!--                 <tr>
                  <td>Misc</td>
                  <td>PSP browser</td>
                  <td>PSP</td>
                  <td>-</td>
                  <td align="center"><a type="button" class="btn btn-success btn-xs"><i class="fa fa-eye"></i><a></td>
                  <td align="center"><a type="button" class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i></a></td>
                  <td align="center"><a type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a></td>
                </tr> -->
                </tbody>

              </table>