<?php include_once(__DIR__ . '/../header.php'); ?>


<!--Incluye el reto de tu HTML-->
<section class="content-header">
    <h1>
        REPORTE VENTAS POR VENDEDOR
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
                    <h3 class="box-title">Listado de Ventas por Vendedo</h3>
                </div>
                <div class="box-body">
                    <!--CONTENIDO REAL-->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive" style="width:100%">
                                <table class="table table-hover" style="width: 100%;" id="dataTableVentas" cellspacing="0">
                                    <thead>
                                        <th>DNI</th>
                                        <th>VENDEDOR</th>
                                        <th>TOTAL S/. </th>
                                        <th>FECHA</th>
                                        <!-- <th>TEL. CEL.</th> -->
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="modal_espera"></div>
</section>



<?php include_once(__DIR__ . '/../footer.php'); ?>