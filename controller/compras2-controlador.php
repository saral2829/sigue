<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include 'controller/validar-sesion.php';
require 'model/clases/sucursales.php';
require 'model/clases/productos.php';
require 'model/clases/unidadmedida.php';

function _panelpedidoAction(){
    

    require 'view/compras/pedido/panel_pedido.php';

}

function _formpedidoAction(){
	$sucursales = new Sucursales();

	$lsucursales = $sucursales->listarsucursales();
	
	require 'view/compras/pedido/formpedido.php';
}


function _buscarproductoAction(){

	$proveedor = $_POST['proveedor'];

	$term = $_GET['term'];

	$productos = new Productos();

	$response = array();

	if ($proveedor == null) {
		$lproductos = $productos->buscarProductosTerm('%'.$term.'%');
	} else {
		$lproductos = $productos->buscarProductosProveedorTerm('%'.$term.'%');
	}
	
	$response = $lproductos;

    header('Content-Type: application/json');
    echo json_encode($response);

}


function _buscarproductoremotoAction(){

	$proveedor = $_POST['proveedor'];

	$term = $_GET['q'];

	$productos = new Productos();

	$response = array();

	$lproductos = $productos->buscarProductosTermRemote('%'.$term.'%');
	
	$results = array('total_count' => count($lproductos), "incomplete_results" => false, 'items' => $lproductos );

	$response = $results;

    header('Content-Type: application/json');
    echo json_encode($response);

}


function _obtenerunidadesmedidaAction(){
	$idproducto = $_POST['id'];

	$unidades = new Unidades();

	$lunidadesproducto = $unidades->listarUnidadesProducto($idproducto);
	
	$select .= '<option disabled selected>TIPO CANTIDAD</option>';

	foreach ($lunidadesproducto as $producto) {
		$select.='<option value='.$producto->idunidad.'>'.$producto->unidadmed_ume.'</option>';
	}

	$response = array();

	$response['options'] = $select;

    header('Content-Type: application/json');
    echo json_encode($response);	
}

function _aniadirproductosAction(){
	$idproducto = $_POST['producto'];
	$tipo_cantidad = $_POST['tipo_cantidad'];
	$cantidad = $_POST['cantidad'];

	$productos = new Productos();

	$oproducto = $productos->producotId($idproducto);

	$response = array();

	$proveedor = ($oproducto->tipo_per == 2) ? $oproducto->razonsoc_per : $oproducto->apellidopat_per.' '.$oproducto->apellidomat_per.' '.$oproducto->nombres_per ;

	$response['proveedor'] = $proveedor;
	$response['oproducto'] = $oproducto;
	
    header('Content-Type: application/json');
    echo json_encode($response);	

}

function _registrarpedidoAction(){

	$sucursal = $_POST['idsucursal'];
	$detalle = json_decode($_POST['detalle']);


	
	$response = array();

    header('Content-Type: application/json');
    echo json_encode($detalle);	

}
