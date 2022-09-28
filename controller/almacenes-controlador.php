<?php

include 'controller/validar-sesion.php';
require 'model/clases/almacenes.php';
require 'model/clases/caracteristicas.php';
require 'model/clases/productos.php';
require 'model/clases/sucursales.php';


function _panelAction(){
	
	$caracteristicas = new Caracteristicas();

	$lcaracteristicas = $caracteristicas->listarCatarcteristicasPadre();

	// $almacenes = new Almacenes();

	// $lalmacenes = $almacenes->listar();

	$sucursales = new Sucursales();
	$lsucursales = $sucursales->listarsucursales();

	// print_r($lsucursales);

	require 'view/almacen/almacen_panel.php';
}


function _cargarcaractAction(){
	
	$id = $_POST['id'];

	$caracteristicas = new Caracteristicas();

	$lcaracteristicas = $caracteristicas->listarValoresIdCateristica($id);

	foreach ($lcaracteristicas as $carc) {
		$options .= '<option value='.$carc->idcaracteristica.'>'.$carc->nombre_caracteristica.'</option>';
	}

	$response = array();

	$response['options'] = $options;

    header('Content-Type: application/json');
    echo json_encode($response);

}


function _cargartablaAction(){
	$term = '%'.$_POST['term'].'%';
	$carac = $_POST['caract'];
	$alm_id = $_POST['almacen'];

	$caract_padre = $_POST['caract_padre'];

	$almacenes = new Almacenes();
	$productos = new Productos();

	if ($caract_padre == '-1') {
		$lproductos = $almacenes->buscarProdxTermAlm($term, $alm_id);
		
	} else {
		$lproductos = $almacenes->buscarProductoCaracTerm($term, $carac, $alm_id);		
	}
	//print_r($lproductos);
	require 'view/almacen/almacen_tabla.php';
}

function _panelmovAction(){
	
	$sucursales = new Sucursales();
	$lsucursales = $sucursales->listarsucursales();

	require 'view/almacen/movimientos/mov_panel.php';
}

function _listaralmacenesAction(){
	$sucursal = $_POST['sucursal'];

	$almacenes = new Almacenes();

	if ($sucursal == '-1') {
		$lalmacenes = $almacenes->listar();
	} else {
		$lalmacenes = $almacenes->listarxSuc($sucursal);
	}

	foreach ($lalmacenes as $alm) {
		$options .= '<option value='.$alm->alm_id.'>'.$alm->alm_nombre.'</option>';
	}

	$response = array();

	$response['options'] = $options;

    header('Content-Type: application/json');
    echo json_encode($response);	
	
}


function _listaralmacenesdispAction(){
	$almacen_origen = $_POST['almacen'];

	$almacenes = new Almacenes();


	$lalmacenes = $almacenes->listar();

	foreach ($lalmacenes as $alm) {
		$disabled = ($almacen_origen == $alm->alm_id) ? 'disabled' : '' ;
		$options .= '<option value='.$alm->alm_id.' '.$disabled.'  >'.$alm->alm_nombre.'</option>';
	}

	$response = array();

	$response['options'] = $options;

    header('Content-Type: application/json');
    echo json_encode($response);	
	
}

function _buscarproductoxtermAction(){
	$term = '%'.$_POST['term'].'%';
	$alm_id = $_POST['almacen'];

	$almacenes = new Almacenes();

	$productos = new Productos();

	$lproductos = $almacenes->buscarProdxTermAlm($term, $alm_id);

	$titulo_modal = 'Resultados de busqueda';

	$nro =1;

	require 'view/almacen/movimientos/modal_prod_busq.php';
}


function _registrarmovimientosAction(){
	$litems = json_decode($_POST['litems']);

	$emp_reg = $_SESSION['id_persona_sigue'];
	$fh_reg = date('Y-m-d H:i:s');
	
	$almacenes = new Almacenes();

    $completados = 0;
    $total = count($litems);


	foreach ($litems as $item) {
		$oprodalm_origen = $almacenes->obtenerProdxAlmProId($item->almacen_origen, $item->id_producto);
		$nuevo_total = $oprodalm_origen->cantidad - $item->cantidad;

		$procede = false;

		if ($nuevo_total >= 0 ) {
			$procede = true;
		}


		if ($procede == true) {

			$oprodalm_destino = $almacenes->obtenerProdxAlmProId($item->almacen_destino, $item->id_producto);

			if ($oprodalm_destino == null) {
	                $registrar_prodalmacen = $almacenes->registrarComprasAlmacen($item->almacen_destino, $item->id_producto, $item->cantidad, null, null,null, null, $item->id_unidad, $emp_reg, $fh_reg);
	                if ($registrar_prodalmacen == true) {
	                	//$oprodalm_destino = $almacenes->obtenerProdxAlmProId($item->almacen_destino, $item->id_producto);
	                	 $restar_al_origen = $almacenes->restarCantidadProdAlmacen($item->almacen_origen, $item->id_producto, $item->cantidad);
	                }
	            
	            if ($registrar_prodalmacen == true and  $restar_al_origen == true) {
	                $completados ++;
	            }

			}else{
				$aniadir_al_destino = $almacenes->sumarCantidadProdAlmacen($item->almacen_destino, $item->id_producto, $item->cantidad);
				if ($aniadir_al_destino == true) {
					$restar_al_origen = $almacenes->restarCantidadProdAlmacen($item->almacen_origen, $item->id_producto, $item->cantidad);
				}

	            if ($aniadir_al_destino == true and  $restar_al_origen == true) {
	                $completados ++;
	            }				
	            
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


function _modalprecioAction(){
	$prod_id = $_POST['producto'];
	$alm_id = $_POST['almacen'];

	$productos = new Productos();
	$almacenes = new Almacenes();

	$oproducto = $productos->producotId($prod_id);

	$oprecio = $almacenes->obtenerProdxAlmProId($alm_id, $prod_id);

	// print_r($oprecio);

	$titulo_modal = 'Precio de producto';	

	require 'view/almacen/precio_modal.php';
}


function _actualizarprecioAction(){

	$prod_id = $_POST['prod_id'];
	$alm_id = $_POST['almacen'];
	$precio = $_POST['precio'];

	$almacenes = new Almacenes();

	$actualizar = $almacenes->actualizarPrecioVentaxProdAlm($alm_id, $prod_id, $precio);

	if ($actualizar == true) {
		$msj = 'Actualizado correctamente';

	} else {
		$msj = 'Ocurrió un error';
	}
	
	$response = array();

    $response['msj'] = $msj;

    header('Content-Type: application/json');
    echo json_encode($response);

}

function _modalcantidadAction(){

	$alm_id = $_POST['almacen'];
	$prod_id = $_POST['prod_id'];
	$cantidad_mov = $_POST['cantidad'];

	$titulo_modal = 'Actualizar cantidad';

	$almacenes = new Almacenes();

	$oproducto = $almacenes->obtenerProdxAlmProId($alm_id, $prod_id);

	$disponible = $oproducto->cantidad - $cantidad_mov;
	$stock_actual = $oproducto->cantidad;
	//print_r($oproducto);
	// print_r($disponible);

	require 'view/almacen/movimientos/cantidad_modal.php';
}