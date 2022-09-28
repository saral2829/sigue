<table id="tabla_busqueda" class="table table-responsive table-hover table-bordered" style="width:100%">
    <thead>
        <td><b>Producto</b></td>
        <td><b>Proveedor</b></td>
        <td><b>Caract</b></td>
        <td><b>Cantidad</b></td>
        <td><b>Precio Venta</b></td>
        <td><b>Acciones</b></td>
    </thead>
    <tbody>
    	<?php foreach ($lproductos as $prod): ?>
    		<tr>
    			<td><?php echo $prod->nombre_producto ?></td>
    			<td><?php echo $prod->razonsoc_per ?></td>
                <td>
                  <ul>
                  <?php $lcaractertiscitcas = $productos->obtenerProductoCaracteristicas($prod->idproducto); ?>
                  <?php foreach ($lcaractertiscitcas as $caract): ?>
                   <li><?php echo '<b>'.$caract->nombre_caract.' : </b>'.$caract->valor_caract ?></li> 
                  <?php endforeach ?>
                  </ul>                      
                </td>
    			<td>
              <?php
                //$oprod_alm = $almacenes->obtenerxProducto($prod->idproducto);
                $cantidad = ($prod->cantidad == null) ? '0000' : $prod->cantidad ;
                echo $cantidad;
              ?>

          </td>
          <td><?php echo $prod->precio_venta ?></td>
          <td><button class="btn btn-primary btn-xs precio" data-id="<?php echo $prod->idproducto ?>">Precio</button></td>
    		</tr>
    	<?php endforeach ?>
    </tbody>
</table>