<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include 'controller/validar-sesion.php';
require 'model/clases/caracteristicas.php';


function _panelcaracteristicasAction(){
	require 'view/mantenimientos/caracteristicas/panel_caracteristicas.php';
}

function _cargarcaracteristicasAction(){
	$caracteristicas = new Caracteristicas();
	$lcaracteristicas = $caracteristicas->listarCatarcteristicasPadre();

	$nro = 1;
	require 'view/mantenimientos/caracteristicas/tabla_caracteristicas.php';
}

function _infocaractAction(){
	$id = $_POST['id'];
	$caracteristicas = new Caracteristicas();

	$lvalores = $caracteristicas->listarValoresIdCateristica($id);
	$nro = 1;
	require 'view/mantenimientos/caracteristicas/info_caracteristicas.php';
}

function _modalcaracteristicasAction(){
	
	$modo = $_POST['modo'];
	$tipo = $_POST['tipo'];
	$id = $_POST['id'];
	$id_padre = ($tipo == 1) ? null : $_POST['id_padre'] ;
	$txt_tipo = ($tipo == 1) ? 'caracteristica' : 'valor' ;
	
	if ($modo == 'add') {
		$titulo = 'Añadir '.$txt_tipo;
		$vigencia = 'checked';
		$ocaract = (object) array(
			"caracteristica_padre" => null,
			"nombre_caracteristica" => "",
		);
		$referencia = null;
		$id = null;
		$_POST['id']= null;

	} else {
		$caracteristicas = new Caracteristicas();

		$ocaract = $caracteristicas->obtenerCaracteristicaId($id);
		$caract_padre = $caracteristicas->obtenerCaracteristicaId($ocaract->caracteristica_padre);
		$vigencia = ($ocaract->estado == 1) ? 'checked' : '' ;
		$referencia = ($ocaract->ref_proveedor == 1) ? 'checked' : '' ;

		$titulo = 'Editar '.$txt_tipo;
	}

	

	require 'view/mantenimientos/caracteristicas/modal_caracteriticas.php';

}

function _registrarcaracteristicaAction(){
	$response = array();
	
	$id = $_POST['id'];
	$nombre_caracteristica = strtoupper($_POST['nombre_caracteristica']);
	$caracteristica_padre = $_POST['id_padre'] ;
	$estado = (isset($_POST['chk_estado'])) ? '1' : '0' ;
	$referencia = (isset($_POST['chk_referencia'] )) ? '1' : '0' ;
	$tipo_caracteristica = ($_POST['id_padre'] == null ) ? 1 : 2 ;

	

	$caracteristicas = new Caracteristicas();


	$c_previo = $caracteristicas->buscarCaractPrevia($nombre_caracteristica);
	
	if (count($c_previo) == 0) {
		if ($referencia == '1') {
			$uptreferencias = $caracteristicas->resetarTodasReferencias();
		}

		if ($id == null) {
			$regcaracteristica = $caracteristicas->registrarCaracteristica($nombre_caracteristica, $tipo_caracteristica, $caracteristica_padre, $estado, $referencia);
			$msj = 'registrado';
		} else {
			$uptcaracteristica = $caracteristicas->actualizarCaracteristica($nombre_caracteristica, $tipo_caracteristica, $caracteristica_padre, $estado, $referencia, $id);
			$msj = 'actualizado';
		}
		
	} else {
		$msj = '<b>La caracteristica ya esta registrada<b>';
	}

	$response['msj'] = $msj;
	$response['tipo'] = $tipo_caracteristica;
	if ($tipo_caracteristica == 1) {
		$response['url'] = 'index.php?page=caracteristicas&accion=panelcaracteristicas';
	}

    header('Content-Type: application/json');
    echo json_encode($response);

}
