<div class="row">
	<div class="col-md-6">
		<div class="form-horizontal">
			<div class="box-body">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">Sucursal: </label>
					<div class="col-sm-10 col-md-10">
						<select class="form-control" id="sucursal">
							<option value="-1">Todos</option>
							<?php foreach ($lsucursales as $suc): ?>
								<option value="<?php echo $suc->id_sucursal ?>"><?php echo $suc->razonsoc_suc ?></option>
							<?php endforeach ?>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">Busqueda: </label>
					<div class="col-sm-10 col-md-10">
						<div class="input-group input-group-sm">
                <input type="text" class="form-control" id="term">
                    <span class="input-group-btn">
                      <button type="button" class="btn btn-warning btn-flat" id="btn_buscar"><i class="fa fa-search"></i> Buscar!</button>
                    </span>
             </div>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">Producto: </label>
					<div class="col-sm-10 col-md-10">
						<p class="form-control-static" id="nom_producto">-----</p>
						<input type="hidden" id="id_producto">
						<input type="hidden" id="id_proveedor">
						<input type="hidden" id="nom_proveedor">
						<input type="hidden" id="nombre_producto">
					</div>
				</div>

				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">Unidad: </label>
					<div class="col-sm-5 col-md-5">
						<select class="form-control" id="unidad"></select>
					</div>
				</div>

				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">Cantidad: </label>
					<div class="col-sm-5 col-md-5">
						<input type="text" class="form-control" id="cantidad">
					</div>
					<button class="btn btn-success btn-sm" id="btn_agregar"><i class="fa fa-fw fa-plus"></i> Agregar</button>
				</div>

				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">Almacen Ing: </label>
					<div class="col-sm-5 col-md-5">
						<select class="form-control" id="almacen">
							<?php foreach ($lalmacenes as $alm): ?>
								<option value="<?php echo $alm->alm_id ?>"><?php echo $alm->alm_nombre ?></option>
							<?php endforeach ?>
						</select>
					</div>
				</div>

<!-- 				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">Password</label>

					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword3" placeholder="Password">
					</div>
				</div> -->

			</div>
			<!-- /.box-body -->
<!-- 			<div class="box-footer">
				<button type="submit" class="btn btn-default">Cancel</button>
				<button type="submit" class="btn btn-info pull-right">Sign in</button>
			</div> -->
			<!-- /.box-footer -->
		</div>
	</div>

	<div class="col-md-6">
		<div class="form-horizontal">
			<div class="box-body">
				<div class="form-group">

					<table id="tabla_detalle" class="table table-bordered table-condensed">
						<thead>
							<tr>
								<th>Producto</th>
								<th>Proveedor</th>
								<th>Unidad</th>
								<th>Cantidad</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>

				</div>
			</div>
		</div>
			<div class="box-footer">
				<button type="button" id="btn_guardar" class="btn btn-primary pull-right"><i class="fa fa-fw fa-save"></i> Comprar</button>
			</div>

	</div>


</div>
