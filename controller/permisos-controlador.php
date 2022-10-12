<?php

include 'controller/validar-sesion.php';
require 'model/clases/permisos.php';
require 'model/clases/clientes.php';

function _panelpermisosAction(){

  $empleados  = new clientes();
  $lempleados = $empleados->listarEmpleados();
	
  $permisos = new permisos();
  $lperfiles = $permisos->listarPerfiles();

  require 'view/permisos/panel_permisos.php';
}
function _formpermisoAction(){
	if(isset($_GET['id'])){
		$id_empleado = $_GET['id'];

		if ($id_empleado != null) {
			$empleados  = new clientes();
			$oempleado = $empleados->obtenerClienteId($id_empleado);

      $permisos = new permisos();
      $lperfiles = $permisos->listarPerfiles();
		}
	}

	require 'view/permisos/form_permisos.php';
}

function _gestionarpermisoAction(){

	$response = array();

	$perfil = $_POST['perfil'];
	$idempleado = $_POST['idempleado'];

  $permisos  = new permisos();

	if (isset($idempleado)) {
		$upermisos = $permisos->actualizarPerfil($perfil, $idempleado);
		$msj = 'Se actualizaron los permisos correctamente';
	} else {
		
		$msj = 'Error';
	}

	$response['msj'] = $msj;
	
	header('Content-Type: application/json');
	echo json_encode($response);
}