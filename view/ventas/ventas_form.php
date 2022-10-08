<div class="row">
  <div class="col-md-5">
    <div class="form-horizontal">
      <div class="box-body">
        <div class="form-group">
          <label for="tipo_busq" class="col-sm-3 control-label">Búsqueda: </label>
          <div class="col-sm-9 col-md-9">
            <select name="tipo_busq" id="tipo_busq" class="select_2" style="width: 100%">
              <option value="1">Registro Manual</option>
              <option value="2">Código de Barras</option>
            </select>
          </div>
           
        </div>
        <hr>
        <div class="busq-codigo" <?php echo ($tipo_busq == '2') ? "" : "hidden" ?> style="text-align: center;">
          <div class="form-group">
            <button class="btn btn-info " type="button" id="btn_start">Start/Stop the scanner</button>
            <div id="scanner-container"></div>
          </div>

        </div>
        <div class="busq-manual"<?php echo ($tipo_busq == '1') ? "" : "hidden" ?>>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-3 control-label">Sucursal: </label>
            <div class="col-sm-9 col-md-9">
              <?php if ($_SESSION['idperfil_per_sigue'] == 1): ?>
                <select id="sucursal" class="select_2" style="width: 100%">
                  <?php foreach ($lsucursales as $suc): ?>
                  <option value="<?php echo $suc->id_sucursal ?>"><?php echo $suc->razonsoc_suc ?></option>
                  <?php endforeach?>
                </select>
              <?php else: ?>
                <p class="form-control-static"><?php echo $_SESSION['razonsoc_suc'] ?></p>
                <input type="hidden" id="sucursal" value="<?php echo $_SESSION['suc_id'] ?>">
              <?php endif?>

            </div>
          </div>

          <div class="form-group">
            <label for="inputEmail3" class="col-sm-3 control-label">Almacen: </label>
            <div class="col-sm-9 col-md-9">
              <select id="almacen" class="select_2" style="width: 100%">

              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-3 control-label">Busqueda: </label>
            <div class="col-sm-9 col-md-9">
              <div class="input-group input-group-sm">
                <input type="text" class="form-control" id="term">
                <span class="input-group-btn">
                  <button type="button" class="btn btn-warning btn-flat" id="btn_buscar"><i class="fa fa-search"></i> Buscar!</button>
                </span>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-3 control-label">Producto: </label>
            <div class="col-sm-9 col-md-9">
              <p class="form-control-static" id="nom_producto">-----</p>
              <input type="hidden" id="id_producto">
              <input type="hidden" id="id_proveedor">
              <input type="hidden" id="nom_proveedor">
              <input type="hidden" id="nombre_producto">
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-3 control-label">Precio: </label>
            <div class="col-sm-5 col-md-5">
              <p id="span_precio_venta">------</p>
              <input type="hidden" id="precio_venta">
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-3 control-label">Unidad: </label>
            <div class="col-sm-5 col-md-5">
              <select class="form-control" id="unidad"></select>
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-3 control-label">Stock: </label>
            <div class="col-sm-5 col-md-5">
              <p class="form-control-static" id="span_stock">-----</p>
              <input type="hidden" id="stock">
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-3 control-label">Cantidad: </label>
            <div class="col-sm-5 col-md-5">
              <input type="text" class="form-control cantidad" id="cantidad">
            </div>
            <button class="btn btn-success btn-sm" id="btn_agregar"><i class="fa fa-fw fa-plus"></i> Agregar</button>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-3 control-label">Mensaje: </label>
            <div class="col-sm-5 col-md-5">
              <p class="form-control-static" id="mensaje"></p>
            </div>

          </div>
        </div>
        
      </div>

    </div>
  </div>

  <div class="col-md-7">
    <div class="form-horizontal">
      <div class="box-body">
        <div class="form-group">

          <table id="tabla_detalle" class="table table-bordered table-condensed">
            <thead>
              <tr>
                <th>Producto</th>
                <th>Unidad</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Sub total</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody></tbody>
            <tfoot>
              <tr>
                <td colspan="4"><b>Total</b></td>
                <td colspan="2" style="background-color: #cddc3954;"><p id="span_total"></p></td>
                <td style="display: none;" id="total"></td>
              </tr>
            </tfoot>
          </table>

        </div>
      </div>
    </div>
    <div class="box-footer">
      <button type="button" id="btn_guardar" class="btn btn-primary pull-right"><i class="fa fa-fw fa-save"></i> Vender</button>
    </div>

  </div>


</div>
<style>
#scanner-container video {
  max-width: 100%;
  width: 100%;
}

#scanner-container {
  width: 400px;
  height: 300px;
  margin: 0 auto;
  display:flex;
}
#scanner-container canvas.drawingBuffer {
  position: absolute;
  width: 400px;
  height: 300px;
}
</style>
<script>
  

</script>
