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

function _panelpedidoAction(){


    require 'view/compras/pedido/panel_pedido.php';

}

function _formpedidoAction(){
	$sucursales = new Sucursales();

	$lsucursales = $sucursales->listarsucursales();

	require 'view/compras/pedido/formpedido.php';
}


function _modalbusquedaAction(){

	$titulo = 'Modal de busqueda productos';
	require 'view/compras/pedido/pedido_modal.php';
}

function _buscarxtermAction(){
  $term = $_POST['term'];

  $productos = new Productos();

  $lproductos = $productos->buscarProductosTerm('%'.$term.'%');

  //print_r($lproductos);

  require 'view/compras/pedido/tabla_busqueda.php';

}


function _obtenerproductoAction(){
	$prod_id = $_POST['id'];
    $alm_id = $_POST['almacen'];


    $almacenes = new Almacenes();
	$productos = new Productos();

	// $oproducto = $productos->producotId($id);

    $oproducto = $almacenes->obtenerProdxAlmProId($alm_id, $prod_id);    
    $lunidades = $productos->obtenerUnidProducto($prod_id);

    foreach ($lunidades as $uni) {
        $options .= '<option value='.$uni->idunidad.'>'.$uni->unidadmed_ume.'</option>';
    }
    //var_dump($oproducto);

    $nom_proveedor = ($oproducto->tipo_per == 1) ? $oproducto->apellidopat_per.' '.$oproducto->apellidomat_per.' '.$oproducto->nombres_per : $oproducto->razonsoc_per ;
    $id_proveedor = $oproducto->idproveedor;

  	$response = array();
  	$response['nombre_producto'] = $oproducto->nombre_producto;
    $response['id_producto'] = $oproducto->idproducto;
    $response['options'] = $options;
    $response['nom_proveedor'] = $nom_proveedor;
    $response['id_proveedor'] = $id_proveedor;
    $response['stock'] = $oproducto->cantidad;
    $response['almacen'] = $oproducto->alm_id;

    header('Content-Type: application/json');
    echo json_encode($response);

}

function _registrarpedidoAction(){
    $sucursal = $_POST['sucursal'];

    $litems = json_decode($_POST['litems']);
    $emp_reg = $_SESSION['id_persona_sigue'];
	$fh_reg = date('Y-m-d H:i:s');



    $compras = new Compras();

    $total = count($litems);
    $cantidad = 0;

    foreach ($litems as $item) {
        // $lpedidos[$item->id_proveedor][] = array('id_producto' => $item->id_producto , 'id_proveedor' => $item->id_proveedor, 'id_unidad' => $item->id_unidad, 'cantidad' => $item->cantidad );

        $obtenerPedido = $compras->buscarPedidoxcontenido($item->id_proveedor, $sucursal, $emp_reg, $fh_reg);
        if ($obtenerPedido == null) {
            $registrarPedido = $compras->registrarPedido($item->id_proveedor, $sucursal, $emp_reg, $fh_reg);
            $obtenerPedido = $compras->buscarPedidoxcontenido($item->id_proveedor, $sucursal, $emp_reg, $fh_reg);
            $id_pedido = $obtenerPedido->pec_id;
        } else {
            $id_pedido = $obtenerPedido->pec_id;
        }

        $registrarDetalle = $compras->registrarDetallePedido($id_pedido, $item->id_producto, $item->id_unidad, $item->cantidad, $emp_reg, $fh_reg);

        if ($registrarDetalle == true) {
            $cantidad ++;
        }
    }

        if ($total == $cantidad) {
            $msj = 'Registrado correctamente';
            $tipo = 'success';
            $procede = true;
        } else {
            $msj = 'Ocurrió un error en la petición';
            $tipo = 'error';
            $procede = false;
        }

        $response = array();

        $response['msj'] = $msj;
        $response['tipo'] = $tipo;
        $response['procede'] = $procede;

        header('Content-Type: application/json');
        echo json_encode($response);
}


function _panelcomprasAction(){

    $sucursales = new Sucursales();
    $lsucursales = $sucursales->listarsucursales();

    $almacenes = new Almacenes();
    $lalmacenes = $almacenes->listar();
    //print_r($lalmacenes);
    require 'view/compras/compra/compra_panel.php';
}

function _buscarpedidotermAction(){
    $term = $_POST['term'];
    $tipo_busqueda = $_POST['tipo_busqueda'];

    $compras = new Compras();

    if ($tipo_busqueda == 1) {
        $lpedidos = $compras->buscarPedidoEstadoTerm('%'.$term.'%');
    } else {
        $lpedidos = $compras->buscarPedidoDetTem('%'.$term.'%');
    }

    $titulo_modal = 'Resultado de busqueda';
    require 'view/compras/compra/compra_modal.php';
}


function _buscarproductoxtermAction(){

    $term = $_POST['term'];

    $productos = new Productos();

    $lproductos = $productos->buscarProductosTerm('%'.$term.'%');

    $nro = 1;

    $titulo_modal = 'Modal de busqueda productos';

    require 'view/compras/compra/modalprod_busqueda.php';

}

function _registrarcompraAction(){

    $suc_id = $_POST['sucursal'];
    $alm_id = $_POST['almacen'];

    $emp_reg = $_SESSION['id_persona_sigue'];
    $fh_reg = date('Y-m-d H:i:s');

    $litems = json_decode($_POST['litems']);

    $compras = new Compras();

    $registrar = $compras->registrarCompra($suc_id, $emp_reg, $fh_reg);

    $completados = 0;
    $total = count($litems);

    if ($registrar == true) {
        $idcompra = $compras->obtenerIdCompra($suc_id, $emp_reg, $fh_reg);

        foreach ($litems as $item) {
            $registrar_det = $compras->registrarCompraDetalle($idcompra, $item->id_producto, $item->id_proveedor, $item->id_unidad, $item->cantidad, $emp_reg, $fh_reg);
            $almacenes = new Almacenes();

            $oproducto = $almacenes->obtenerxProducto($item->id_producto, $alm_id);

            if ($oproducto == null) {
                // alm_id, pro_id, cantidad, stock_max, stock_min, precio_compra, precio_venta, unidad_principal, emp_reg, fh_reg
                $registrar_almacen = $almacenes->registrarComprasAlmacen($alm_id, $item->id_producto, $item->cantidad, null, null,null, null, $item->id_unidad, $emp_reg, $fh_reg);
            } else {

                $registrar_almacen = $almacenes->sumarCantidadProdAlmacen($alm_id, $item->id_producto, $item->cantidad);
            }

            if ($registrar_almacen == true) {
                $completados ++;
            }

        }

    }


    if ($completados == $total) {
        $msj = 'Compra realizada correctamente';
        $procede = true;
    } else {
        $msj = 'Ocurrió un error en la petición';
        $procede = false;
    }


    $response = array();

    $response['msj'] = $msj;
    $response['procede'] = $procede;

    header('Content-Type: application/json');
    echo json_encode($response);

}

function _almacenesxsucAction(){
    $suc_id = $_POST['suc_id'];

    $almacenes = new Almacenes();

    if ($suc_id == '-1') {
        $lalmacenes = $almacenes->listar();
    } else {
        $lalmacenes = $almacenes->listarxSuc($suc_id);
    }

    foreach ($lalmacenes as $alm) {
        $options .= '<option value='.$alm->alm_id.'>'.$alm->alm_nombre.'</option>';
    }


    $response = array();
    $response['options'] = $options;

    header('Content-Type: application/json');
    echo json_encode($response);

}
