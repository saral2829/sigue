<?php include_once(__DIR__ . '/../header.php'); ?>


<!--Incluye el reto de tu HTML-->
<section class="content-header">
    <h1>
        Comprar producto
    </h1>
</section>
<!-- Main content -->
<section class="content">
    <!-- TODO EL CONTENIDO QUE TU ESCRIBAS IRÁ ACÁ -->
    <div class="row">
        <div class="col-md-12">
            <!-- Horizontal Form -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Comprar producto (Sin pedido)</h3>
                </div>
                <div class="box-body">
                    <!--CONTENIDO REAL-->
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="" class="control-label">Sucursal:</label>
                                <div class="">
                                    <select class="form-control" id="select_sucursal">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="" class="control-label">Almacen (Donde se hará ingreso del producto): </label>
                                <div class="">
                                    <select class="form-control" id="select_almacen">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="">
                                    <label for="">Búsqueda de sus productos</label>
                                    <button class="btn btn-success form-control" id="abrirModalProductos">
                                        <i class="fa fa-search"></i> Buscar productos
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="" class="control-label">Producto elegido:</label>
                                <div class="">
                                    <input type="text" name="producto_elegido" id="producto_elegido" class="form-control" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="" class="control-label">Unidad:</label>
                                <select name="" class="form-control" id="select_unidad_producto_elegido"></select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="" class="control-label">Cantidad:</label>
                                <input type="number" class="form-control" id="cantidad_unidad_elegido" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="" class="control-label"></label>
                                <button class="btn btn-warning form-control" id="btnAgregarProductoElegido"><i class="fa fa-plus"></i> Agregar el producto</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <table id="tabla_productos_elegidos" class="table table-responsive table-hover table-condensed table-bordered text-center" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>ID Producto</th>
                                            <th>Producto</th>
                                            <th>Categoría</th>
                                            <th>Unidad</th>
                                            <th>Cantidad</th>
                                            <th>Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class="col-md-12">
                            <button class="btn btn-success" id="comprarProductos">
                                <i class="fa fa-save"></i> Comprar productos
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php include_once(__DIR__ . '/modales/modalBusquedaProductos.php') ?>
    <div id="modal_espera"></div>
</section>



<?php include_once(__DIR__ . '/../footer.php'); ?>