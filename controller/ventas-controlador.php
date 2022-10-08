<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include 'controller/validar-sesion.php';
require 'model/clases/sucursales.php';
require 'model/clases/productos.php';
require 'model/clases/unidadmedida.php';
require 'model/clases/compras.php';
require 'model/clases/almacenes.php';
require 'model/clases/ventas.php';

function _panelAction()
{
    $sucursales = new Sucursales();
    $lsucursales = $sucursales->listarsucursales();
    $tipo_busq = '1';
    require 'view/ventas/ventas_panel.php';
}

function _listaralmacenesxsucAction()
{
    $suc = $_POST['suc'];

    $almacenes = new Almacenes();

    $lalmacenes = $almacenes->listarxSuc($suc);
    $options = "";

    foreach ($lalmacenes as $alm) {
        $options .= '<option value=' . $alm->alm_id . '>' . $alm->alm_nombre . '</option>';
    }

    $response = array();

    $response['options'] = $options;

    header('Content-Type: application/json');
    echo json_encode($response);

}

function _buscarproductoxtermAction()
{
    $term = '%' . $_POST['term'] . '%';
    $almacen = $_POST['almacen'];
    // $perfil_id = $_SESSION['idperfil_per_sigue'];

    // if ($perfil_id == 1) {
    //     $suc_id = $_POST['sucursal'];
    // } else {
    //     $suc_id = $_SESSION['suc_id'];
    // }

    $almacenes = new Almacenes();

    $productos = new Productos();

    // $lproductos = $almacenes->buscarProdxTermSuc($term, $suc_id);
    $lproductos = $almacenes->buscarProdxTermAlm($term, $almacen);

    $titulo_modal = 'Resultados de busqueda';

    $nro = 1;
    // print_r($osucursal);
    require 'view/almacen/movimientos/modal_prod_busq.php';
}

function _obtenerproductoalmAction()
{
    $prod_id = $_POST['id'];
    $alm_id = $_POST['almacen'];

    $productos = new Productos();
    $almacenes = new Almacenes();

    //$oproducto = $productos->producotId($id);

    $oproducto = $almacenes->obtenerProdxAlmProId($alm_id, $prod_id);
    $lunidades = $productos->obtenerUnidProducto($prod_id);
    $options = "";

    foreach ($lunidades as $uni) {
        $options .= '<option value=' . $uni->idunidad . '>' . $uni->unidadmed_ume . '</option>';
    }
    // var_dump($oproducto);

    $nom_proveedor = ($oproducto->tipo_per == 1) ? $oproducto->apellidopat_per . ' ' . $oproducto->apellidomat_per . ' ' . $oproducto->nombres_per : $oproducto->razonsoc_per;
    $id_proveedor = $oproducto->idproveedor;

    $response = array();
    $response['nombre_producto'] = $oproducto->nombre_producto;
    $response['id_producto'] = $oproducto->idproducto;
    $response['options'] = $options;
    $response['nom_proveedor'] = $nom_proveedor;
    $response['id_proveedor'] = $id_proveedor;
    $response['precio_venta'] = $oproducto->precio_venta;
    $response['stock'] = $oproducto->cantidad;
    $response['almacen'] = $oproducto->alm_id;

    header('Content-Type: application/json');
    echo json_encode($response);
}

function _obtenerproductoalmcodigobar()
{
    $code_bar = $_POST['codebar'];
    $almacenes = new Almacenes();
    $oproducto = $almacenes->productoalmcodigobar($code_bar);
    
    $lunidades = $productos->obtenerUnidProducto($oproducto->idproducto);
    $options = "";

    foreach ($lunidades as $uni) {
        $options .= '<option value=' . $uni->idunidad . '>' . $uni->unidadmed_ume . '</option>';
    }
    // var_dump($oproducto);

    $nom_proveedor = ($oproducto->tipo_per == 1) ? $oproducto->apellidopat_per . ' ' . $oproducto->apellidomat_per . ' ' . $oproducto->nombres_per : $oproducto->razonsoc_per;
    $id_proveedor = $oproducto->idproveedor;

    $response = array();
    $response['nombre_producto'] = $oproducto->nombre_producto;
    $response['id_producto'] = $oproducto->idproducto;
    $response['options'] = $options;
    $response['nom_proveedor'] = $nom_proveedor;
    $response['id_proveedor'] = $id_proveedor;
    $response['precio_venta'] = $oproducto->precio_venta;
    $response['stock'] = $oproducto->cantidad;
    $response['almacen'] = $oproducto->alm_id;

    header('Content-Type: application/json');
    echo json_encode($response);
}

function _registrarventaAction()
{

    $total = $_POST['total'];
    $suc_id = $_POST['suc_id'];

    $tipo_venta = 1; //1--contado, 2---credito

    $emp_reg = $_SESSION['id_persona_sigue'];
    $fh_reg = date('Y-m-d H:i:s');

    $litems = json_decode($_POST['litems']);

    $ventas = new Ventas();

    $almacenes = new Almacenes();

    $registrar_venta = $ventas->registrarVenta($suc_id, $total, $emp_reg, $fh_reg, $tipo_venta);

    if ($registrar_venta == true) {
        $oventa = $ventas->obtenerVentaxDet($suc_id, $total, $emp_reg, $fh_reg, $tipo_venta);
        $venta_id = $oventa->venta_id;

        $total_items = count($litems);
        $registrados = 0;
        foreach ($litems as $item) {
            $prod_id = $item->prod_id;
            $unidad_id = $item->unidad_id;
            $cantidad = $item->cantidad;
            $precio_unitario = $item->precio_venta;
            $subtotal = $item->subtotal;
            $alm_id = $item->almacen;

            $reg_detventa = $ventas->registrarDetalleVenta($venta_id, $prod_id, $alm_id, $unidad_id, $cantidad, $precio_unitario, $subtotal, $emp_reg, $fh_reg);

            if ($reg_detventa == true) {
                $restar_almacen = $almacenes->restarCantidadProdAlmacen($alm_id, $prod_id, $cantidad);
                $registrados++;
            }

            if ($total_items == $registrados) {
                $msj = 'Venta registrada correctamente';
                $procede = true;
                $tipo = 'success';
            } else {
                $msj = 'Ha ocurrido un error en el registro';
                $procede = false;
                $tipo = 'error';
            }

        }
    } else {

        $msj = 'Ocurrió un error en la petición';
        $procede = false;
        $tipo = 'error';

    }

    $response['msj'] = $msj;
    $response['tipo'] = $tipo;
    $response['procede'] = $procede;

    header('Content-Type: application/json');
    echo json_encode($response);

}

function _listarhistoricoAction()
{
    $fecha = $_POST['fecha'];

    list($dia, $mes, $anio) = explode('/', $fecha);

    $new_fecha = $anio . '-' . $mes . '-' . $dia;

    $ventas = new Ventas();

    $lventas = $ventas->listarventasxFecha($new_fecha);

    //print_r($lventas);

    require 'view/ventas/ventas_historico.php';
}

function _modaldetalleAction()
{
    $id = $_POST['id'];

    $ventas = new Ventas();

    $oventa = $ventas->obtenerVentaxId($id);

    $detalle = $ventas->obtenerDetalleVentaxId($id);

    $titulo_modal = 'Detalle de Venta';

    require 'view/ventas/modal_detalle.php';

}
