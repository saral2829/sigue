<table id="tabla_busqueda" class="table table-responsive table-hover table-bordered">
    <thead>
        <td><b>Producto</b></td>
        <td><b>Proveedor</b></td>
        <td><b>Caract</b></td>
        <td><b>Accion</b></td>
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
    			<td><button class="btn btn-sm btn-success seleccionar" data-id="<?php echo $prod->idproducto ?>">Selec.</button></td>
    		</tr>
    	<?php endforeach ?>
    </tbody>
</table>
