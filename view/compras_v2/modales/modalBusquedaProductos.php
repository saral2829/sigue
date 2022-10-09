<!-- PARA QUE EL ARCHIVO NO SE HAGA TAN GRANDE, SEPARO LOS COMPONENTES, EN ESTE CASO ESCRIBIRÉ UN MODAL APARTE, NO HAY NIGUN PROBLEMA AL FINAL EL JS, PUEDE MANIPULARLO-->
<style>
    @media (min-width: 768px) {
        .modal-xl {
            width: 90%;
            max-width:1200px;
        }
    }
</style>
<div id="modal_buscar_producto" tabindex="-1" role="dialog" class="modal fade" style="overflow-y: scroll;">
    <div class="form-horizontal">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text"><b>SELECCIONA UN PRODUCTO PARA AGREGARLO A LA LISTA</b></h4>
                </div>
                <div class="modal-body">
                    <div class="box-body">
                        <div class="col-md-12">
                            <div class="form-group">
                                <table id="tabla_productos" class="table table-responsive table-hover table-condensed table-bordered text-center" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Producto</th>
                                            <th>Caracteristicas</th>
                                            <th>Categoría</th>
                                            <th>Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-fw fa-sign-out"></i> Salir</button>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<!-- /.modal -->