<div class="row">
    <div class="col-md-12">
        <div class="form-horizontal">
            <div class="box-body">
                <table id="tabla_historica" class="table table-striped table-bordered table-hover table-condensed" style="width : 100%">
                    <thead>
                        <tr>
                            <td><b>Sucursal</b></td>
                            <td><b>Total</b></td>
                            <td><b>Empleado Reg.</b></td>
                            <td><b>Detalle</b></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lventas as $venta): ?>
                            <tr>
                                <td><?php echo $venta->razonsoc_suc ?></td>
                                <td><?php echo $venta->total ?></td>
                                <td><?php echo $venta->nombres_per.' '.$venta->apellidopat_per.' '.$venta->apellidomat_per ?></td>
                                <td><button type='button' class='btn btn-xs btn-success detalle_historico' data-id="<?php echo $venta->venta_id ?>">Detalle</button>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
