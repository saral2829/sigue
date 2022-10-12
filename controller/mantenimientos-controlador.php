<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include 'controller/validar-sesion.php';
require 'model/clases/sucursales.php';
require 'model/clases/proveedores.php';
require 'model/clases/areas.php';
require 'model/clases/usuarios.php';
require 'model/clases/clientes.php';
require 'model/clases/igvs.php';
require 'model/clases/caracteristicas.php';
require 'model/clases/ubigeo.php';
require 'model/clases/unidadmedida.php';


//INICIO SUCURSAL

function _panelsucursalAction(){

	$sucursales = new Sucursales();
	$lsucursales = $sucursales->listarsucursales();
	
  require 'view/mantenimientos/sucursal/panel_sucursal.php';
}

function _formsucursalAction(){
	$ubigeos = new Ubigeos();
	$ldepartamentos = $ubigeos->listarDepartamentos();

	if(isset($_GET['id'])){
		$id_sucursal = $_GET['id'];
		if ($id_sucursal != null) {

			$sucursales = new Sucursales();
			$osucursal = $sucursales->obtenerSucursalId($id_sucursal);

			$ldistritos = $ubigeos->listarDistritoProvincia($osucursal->provincia_ubi);
			$lprovincias = $ubigeos->listarProvinciasDepartamento($osucursal->departamento_ubi);
		}
	}else{
		$_GET['id']=null;
		$id_sucursal=null;
		$osucursal=(object)array(
			"razonsoc_suc"=> "",
			"direccionsuc_suc"=>"",
			"direccionalm_suc"=>"",
			"telefonofij_suc"=>"",
			"telefonocel_suc"=> "",
			"departamento_ubi" => "",
			"provincia_ubi"=> "",
			"ubigeo_id_ubi" => "",
		);
	}
	require 'view/mantenimientos/sucursal/formsucursal.php';
}

function _gestionarsucursalAction(){

	$razon_social = $_POST['razon_social'];
	$direccion_suc = $_POST['direccion_suc'];
	$direccion_alm = $_POST['direccion_alm'];
	$telefono_fij = $_POST['telefono_fij'];
	$telefono_cel = $_POST['telefono_cel'];
	$idsucursal = $_POST['idsucursal'];
	$ubigeo_id_ubi = $_POST['distrito'];


	$sucursales = new Sucursales();

	if ($idsucursal == null) {
		$regsucursal = $sucursales->registrarSucursal($razon_social, $direccion_suc, $direccion_alm, $telefono_fij, $telefono_cel, $ubigeo_id_ubi);
		$msj = 'Surcursal registrada con éxito';
	} else {
		$uptsucursal = $sucursales->actualizarSucursal($razon_social, $direccion_suc, $direccion_alm, $telefono_fij, $telefono_cel, $ubigeo_id_ubi, $idsucursal);
		$msj = 'Sucursal actualizada correctamente';
	}
	$response = array();

	$response['msj'] = $msj;

	header('Content-Type: application/json');
	echo json_encode($response);
}

//FIN SUCURSAL

//INICIO CLIENTE

function _panelclienteAction(){

	$clientes = new Clientes();
	$lclientes = $clientes->listarclientes();

	require 'view/mantenimientos/cliente/panel_cliente.php';
}

function _formclienteAction(){
	
	$caracteristicas =  new Caracteristicas();
	$lreferencias = $caracteristicas->listarReferenciasProveedor();

	$areas = new Areas();
	$lareas = $areas->listarareas();
	
	$ver_natural = true;
	$ver_juridico = false;

	$ubigeos = new Ubigeos();
	$ldepartamentos = $ubigeos ->listarDepartamentos();
		
	if(isset($_GET['id'])){
		$id_cliente = $_GET['id'];
		
		if ($id_cliente != null) {

			$clientes = new Clientes();

			$ocliente = $clientes->obtenerClienteId($id_cliente);

			if ($ocliente->tipo_per == '2') {
				$ver_natural = false;
				$ver_juridico = true;
			}

			$ldistritos = $ubigeos->listarDistritoProvincia($ocliente->provincia_ubi);
			$lprovincias = $ubigeos->listarProvinciasDepartamento($ocliente->departamento_ubi);

		}
	}else{
		$_GET['id'] = null;
		$id_cliente = null;
		$ocliente =  (object)array(
			"dni" => "",
			"nombres_per" => "",
			"apellidopat_per" => "",
			"apellidomat_per" => "",
			"sexo" => "",
			"fechanac_per" => date('Y-m-d'),
			"direccion_per" => "",
			"telefonocel_per" => "",
			"correo_per" => "",
			"telefonofij_per" => "",
			"facebook_per" => "",
			"tipo_per" =>"",

			"ruc_per" => "",
			"razonsoc_per" => "",
			"empleado" => "",
			"area_id" => "",
			"estadocli_per" => "",
			"perfil_id_per" => "",
			"ubigeo_id_ubi" => "",
			"proveedor" => "",
			
			"user_reg" => "",
			"fh_reg"=> "",
			"caract_ref" => "",
			"per_suc_id" => "",
					
			"departamento_ubi" => "",
			"provincia_ubi" => "",
			
		);
	}
	
	require 'view/mantenimientos/cliente/formcliente.php';
}

function _gestionarclienteAction(){

	$idcliente = $_POST['id'];
	$tipo_per = $_POST['tipo_persona'];
	$dni = ($tipo_per == '1') ? $_POST['dni'] : null ;
	$nombres_per = ($tipo_per == '1') ? $_POST['nombres']: null;
	$apellidopat_per = ($tipo_per == '1') ? $_POST['apellidopat']: null;
	$apellidomat_per = ($tipo_per == '1') ? $_POST['apellidomat'] : null;
	$sexo = ($tipo_per == '1') ? $_POST['sexo'] : null;

	if($tipo_per == '1' && isset($_POST['fechanac'])){
		list($dia_nac, $mes_nac, $anio_nac) = explode('/', $_POST['fechanac']);
	
		$fechanac_per = $anio_nac.'-'.$mes_nac.'-'.$dia_nac ;
	}else{
		$fechanac_per = null;
	}

	$direccion_per = $_POST['direccion'];
	$correo_per = $_POST['correo'];
	$telefonofij_per = $_POST['telefonofij'];
	$telefonocel_per = $_POST['telefonocel'];
	$facebook_per = $_POST['facebook'];
	
	$ruc_per = ($tipo_per == '2') ? $_POST['ruc'] : null;
	$razonsoc_per = ($tipo_per == '2') ? $_POST['razon_social'] : null;
	
	$empleado = (isset($_POST['empleado'])) ? '1' : '0' ;
	$area_id = (isset($_POST['empleado'])) ? $_POST['area'] : null;
	
	$claveusu_per = null;
	$estadocli_per = 1;
	$perfil_id_per = null ;
	$ubigeo_id_ubi = $_POST['distrito'];

	$user_reg = $_SESSION['id_persona_sigue'];
	$fh_reg = date('Y-m-d H:i:s');

	$clientes = new Clientes();

	if ($idcliente == null) {
		$caract_ref = null ;
		$proveedor = '0' ;
				
		$regcliente = $clientes->registrarCliente(
			$dni, 
			$nombres_per, 
			$apellidopat_per, 
			$apellidomat_per, 
			$sexo, 
			$fechanac_per, 
			$direccion_per, 
			$telefonocel_per, 
			$correo_per, 
			$telefonofij_per, 
			$facebook_per, 
			$tipo_per, 
			$ruc_per, 
			$razonsoc_per, 
			$empleado, 
			$area_id, 
			$claveusu_per, 
			$estadocli_per, 
			$perfil_id_per, 
			$ubigeo_id_ubi, 
			$proveedor, 
			$caract_ref, 
			$user_reg, 
			$fh_reg
		);

		$msj = 'Cliente registrado correctamente';

	} else {
		$caract_ref = (isset($_POST['proveedor'])) ? $_POST['caract_ref'] : null ;
		$proveedor = (isset($_POST['proveedor'])) ? '1' : '0' ;
		//$perfil_id_per = ($_POST['empleado'] == 'on') ? $_POST['perfil_id'] : null ;

		$uptcliente = $clientes->actualizarCliente(
			$dni, 
			$nombres_per, 
			$apellidopat_per, 
			$apellidomat_per, 
			$sexo, 
			$fechanac_per, 
			$direccion_per, 
			$telefonocel_per, 
			$correo_per, 
			$telefonofij_per, 
			$facebook_per, 
			$tipo_per, 
			$ruc_per, 
			$razonsoc_per, 
			$empleado, 
			$area_id, 
			$claveusu_per, 
			$estadocli_per, 
			$perfil_id_per, 
			$ubigeo_id_ubi, 
			$proveedor, 
			$caract_ref, 
			$user_reg, 
			$fh_reg,
			$idcliente);


		$msj = 'Cliente actualizado correctamente';

	}


	$response = array();


	$response['msj'] = $msj;

    header('Content-Type: application/json');
    echo json_encode($response);


}

//FIN CLIENTE

//INICIO PROVEEDOR

function _panelproveedorAction(){

	$proveedores = new Proveedores();
	$lproveedores = $proveedores->listarproveedores();
  
	require 'view/mantenimientos/proveedor/panel_proveedor.php';
}

function _formproveedorAction(){

	$caracteristicas =  new Caracteristicas();
	$lreferencias = $caracteristicas->listarReferenciasProveedor();

	$areas = new Areas();
	$lareas = $areas->listarareas();

	$ver_natural = true;
	$ver_juridico = false;

	$ubigeos = new Ubigeos();
	$ldepartamentos = $ubigeos->listarDepartamentos();

	if(isset($_GET['id'])) {
		$id_proveedor = $_GET['id'];
		if ($id_proveedor != null) {

			$clientes = new Proveedores();
	
			$ocliente = $clientes->obtenerProveedorId($id_proveedor);
	
			if ($ocliente->tipo_per == '2') {
				$ver_natural = false;
				$ver_juridico = true;
			}
	
			$ldistritos = $ubigeos->listarDistritoProvincia($ocliente->provincia_ubi);
			$lprovincias = $ubigeos->listarProvinciasDepartamento($ocliente->departamento_ubi);
	
		}
	}else{
		$_GET['id'] = null;
		$id_cliente = null;
		$ocliente =  (object)array(
			"dni" => "",
			"nombres_per" => "",
			"apellidopat_per" => "",
			"apellidomat_per" => "",
			"sexo" => "",
			"fechanac_per" => date('Y-m-d'),
			"direccion_per" => "",
			"telefonocel_per" => "",
			"correo_per" => "",
			"telefonofij_per" => "",
			"facebook_per" => "",
			"tipo_per" =>"",

			"ruc_per" => "",
			"razonsoc_per" => "",
			"empleado" => "",
			"area_id" => "",
			"estadocli_per" => "",
			"perfil_id_per" => "",
			"ubigeo_id_ubi" => "",
			"proveedor" => "",
			
			"user_reg" => "",
			"fh_reg"=> "",
			"caract_ref" => "",
			"per_suc_id" => "",
					
			"departamento_ubi" => "",
			"provincia_ubi" => "",
			
		);
	}

	require 'view/mantenimientos/proveedor/formproveedor.php';

}

function _gestionarproveedorAction(){

	$id = $_POST['id'];
	$tipo_per = $_POST['tipo_persona'];
	$dni = ($tipo_per == '1') ? $_POST['dni'] : null ;
	$nombres_per = ($tipo_per == '1') ? $_POST['nombres']: null;
	$apellidopat_per = ($tipo_per == '1') ? $_POST['apellidopat']: null;
	$apellidomat_per = ($tipo_per == '1') ? $_POST['apellidomat'] : null;
	$sexo = ($tipo_per == '1') ? $_POST['sexo'] : null;

	if($tipo_per == '1' && isset($_POST['fechanac'])){
		list($dia_nac, $mes_nac, $anio_nac) = explode('/', $_POST['fechanac']);
	
		$fechanac_per = $anio_nac.'-'.$mes_nac.'-'.$dia_nac ;
	}else{
		$fechanac_per = null;
	}
	$direccion_per = $_POST['direccion'];
	$telefonocel_per = $_POST['telefonocel'];
	$correo_per = $_POST['correo'];
	$telefonofij_per = $_POST['telefonofij'];
	$facebook_per = $_POST['facebook'];
	$ruc_per = ($tipo_per == '2') ? $_POST['ruc'] : null;
	$razonsoc_per = ($tipo_per == '2') ? $_POST['razon_social'] : null;
	$empleado = '0';
	$area_id = null;
	$claveusu_per = null;
	$estadocli_per = 1;
	$perfil_id_per = null ;
	$ubigeo_id_ubi = $_POST['distrito'];
	$proveedor = '1' ;
	$caract_ref = null ;
	$user_reg = $_SESSION['id_persona_sigue'];
	$fh_reg = date('Y-m-d H:i:s');	

	$clientes = new Clientes();

	if ($id == null) {
		$regcliente = $clientes->registrarCliente(
			$dni, 
			$nombres_per, 
			$apellidopat_per, 
			$apellidomat_per, 
			$sexo, 
			$fechanac_per, 
			$direccion_per, 
			$telefonocel_per, 
			$correo_per, 
			$telefonofij_per, 
			$facebook_per, 
			$tipo_per, 
			$ruc_per, 
			$razonsoc_per, 
			$empleado, 
			$area_id, 
			$claveusu_per, 
			$estadocli_per, 
			$perfil_id_per, 
			$ubigeo_id_ubi, 
			$proveedor, 
			$caract_ref, 
			$user_reg, 
			$fh_reg);
		$msj = 'Empleado registrado correctamente';

	} else {
		$uptcliente = $clientes->actualizarCliente(
			$dni, //
			$nombres_per, // 
			$apellidopat_per, //
			$apellidomat_per, //
			$sexo, //
			$fechanac_per, // 
			$direccion_per, //
			$telefonocel_per, //
			$correo_per, //
			$telefonofij_per, // 
			$facebook_per, //
			$tipo_per, //
			$ruc_per, //
			$razonsoc_per, // 
			$empleado, //
			$area_id, //
			$claveusu_per, // 
			$estadocli_per, //
			$perfil_id_per, //
			$ubigeo_id_ubi, //
			$proveedor, //
			$caract_ref, //
			$user_reg, //
			$fh_reg, //
			$id); //


		$msj = 'Empleado actualizado correctamente';

	}


	$response = array();


	$response['msj'] = $msj;

    header('Content-Type: application/json');
    echo json_encode($response);


}

//FIN PROVEEDOR


//INICIO IGV

function _paneligvAction(){

	$igvs = new Igvs();
	$ligvs = $igvs->listarigvs();

  require 'view/mantenimientos/igv/panel_igv.php';

}

function _formigvAction(){
	if(isset($_GET['id'])){
		$id_igv = $_GET['id'];

		if ($id_igv != null) {
			$igvs = new Igvs();
			$oigv = $igvs->obtenerIgvId($id_igv);
		}
	}else{
		$_GET['id'] = null;
		$oigv = (object) array(
			"valor_igv" => "",
			"fecha_igv" => date('Y-m-d'),
			"nombres_per" => $_SESSION['usuario'],
			"id_per" => $_SESSION['id_persona_sigue']
		);
	}
	

	require 'view/mantenimientos/igv/formigv.php';
}

function _gestionarigvAction(){

	$response = array();

	$valor = strtoupper($_POST['valor']);
	$fecha = strtoupper($_POST['fecha']);
	$idigv = $_POST['idigv'];

	$igvs = new Igvs();

	if ($idigv== null) {
		$regigv= $igvs->registrarIgv($valor, $fecha, $_SESSION['id_persona_sigue']);
		$msj = 'Se registró con éxito';
	} else {
		$uptigv = $igvs->actualizarIgv($valor, $fecha, $_SESSION['id_persona_sigue'], $idigv);
		$msj = 'Se actualizo correctamente';
	}

	$response['msj'] = $msj;

    header('Content-Type: application/json');
    echo json_encode($response);
}

//FIN IGV

function _panelusuarioAction(){

	$usuarios = new Usuarios();

	$lusuarios = $usuarios->listarusuarios();

    require 'view/mantenimientos/usuario/panel_usuario.php';


}

function _formusuarioAction(){

	$id_usuario = $_GET['id'];

	if ($id_usuario != null) {

		$usuarios = new Usuarios();

		$ousuario = $usuarios->obtenerUsuariosId($id_usuario);

	}


	require 'view/mantenimientos/usuario/formusuario.php';
}

//INICIO AREA

function _panelareaAction(){
	$areas = new Areas();
	$lareas = $areas->listarareas();

  require 'view/mantenimientos/area/panel_area.php';
}

function _formareaAction(){
	if(isset($_GET['id'])){
		$id_area = $_GET['id'];

		if ($id_area != null) {
			$areas = new Areas();
			$oarea = $areas->obtenerAreaId($id_area);
		}
	}else{
		$_GET['id'] = null;
		$oarea = (object)array(
			"nombre_area" => "",
			"descripcion_area" => "",
		);
	}

	require 'view/mantenimientos/area/formarea.php';
}

function _gestionarareaAction(){

	$response = array();

	$nombre = strtoupper($_POST['nombre']);
	$descripcion = strtoupper($_POST['descripcion']);
	$idarea = $_POST['idarea'];

	$areas = new Areas();

	if ($idarea== null) {
		$regarea= $areas->registrarArea($nombre, $descripcion);
		$msj = 'Se registró con éxito';
	} else {
		$uptarea = $areas->actualizarArea($nombre, $descripcion, $idarea);
		$msj = 'Se actualizo correctamente';
	}

	$response['msj'] = $msj;
	
	header('Content-Type: application/json');
	echo json_encode($response);
}

//FIN AREA

function _provinciasDepartamentoAction(){
	$departamento = $_POST['departamento'];

	$ubigeos = new Ubigeos();

	$lprovincias = $ubigeos->listarProvinciasDepartamento($departamento);

	$html = '<option>Provincia</option>';

	foreach ($lprovincias as $prov) {
		$html .= '<option value="'.$prov->provincia_ubi.'">'.$prov->provincia_ubi.'</option>';
	}

	echo $html;

}

function _distritosProvinciaAction(){
	$provincia = $_POST['provincia'];

	$ubigeos = new Ubigeos();

	$ldistritos = $ubigeos->listarDistritoProvincia($provincia);

	$html = '<option>Distrito</option>';

	foreach ($ldistritos as $dist) {
		$html .= '<option value="'.$dist->id_ubigeo.'">'.$dist->distrito_ubi.'</option>';
	}
	echo $html;
}

//INICIO UNIDADES DE MEDIDA 

function _panelunidadmedidaAction(){

	$unidades = new Unidades();
	$lunidades = $unidades->listarUnidades();

	require 'view/mantenimientos/unidad_medida/panel_unidadmedida.php';

}

function _formunidadmedidaAction(){
	if(isset($_GET['id'])){
		$unidades = new Unidades();
		$id_unidadmedida = $_GET['id'];

		if ($id_unidadmedida != null) {
			$ounidad = $unidades->obtenerUnidadMedidaId($id_unidadmedida);
			$vigencia = ($ounidad->vigencia_ume == '1') ? 'checked' : '' ;
		}
	}else{
		$_GET['id'] = null;
		$ounidad = (object) array(
			"unidadmed_ume" => "",
			"abreviatura_ume" => "",
		);
		$vigencia = 'checked';
	}
	


	require 'view/mantenimientos/unidad_medida/formunidadmedida.php';
}

function _registrarunidadmedidaAction(){

	$id_unidadmedida = $_POST['id_unidadmedida'];
	$unidadmed_ume = $_POST['unidad_medida'];
	$abreviatura_ume = $_POST['abreviatura'];
	$vigencia_ume = (isset($_POST['chk_estado'])) ? '1' : '2' ;

	$unidades = new Unidades();

	if ($id_unidadmedida == null) {
		$regunidad_medida = $unidades->registrarUnidadMedida($unidadmed_ume, $abreviatura_ume, $vigencia_ume);

		$msj = 'Unidad de Medidad agregada correctamente';

	} else {
		$uptunidad_medida = $unidades->actualizarUnidadMedida($unidadmed_ume, $abreviatura_ume, $vigencia_ume, $id_unidadmedida);

		$msj = 'Unidad de Medidad actualizada correctamente';

	}

	$response = array();

	$response['msj'] = $msj;
	$response['url'] = 'index.php?page=mantenimientos&accion=panelunidadmedida';
    header('Content-Type: application/json');
    echo json_encode($response);

}

//FIN UNIDADES DE MEDIDA

//INICIO EMPLEADOS

function _panelempleadosAction(){

  $empleados  = new clientes();
  $lempleados = $empleados->listarEmpleados();
  require 'view/mantenimientos/empleados/panel_empleados.php';
}
function _formempleadosAction(){

	$caracteristicas =  new Caracteristicas();
	$lreferencias = $caracteristicas->listarReferenciasProveedor();

	$areas = new Areas();
	$lareas = $areas->listarareas();

	$ver_natural = true;
	$ver_juridico = false;

	$ubigeos = new Ubigeos();
	$ldepartamentos = $ubigeos->listarDepartamentos();

	if(isset($_GET['id'])){
		$id_cliente = $_GET['id'];
		if ($id_cliente != null) {
			$clientes = new Clientes();
			$ocliente = $clientes->obtenerClienteId($id_cliente);
	
			$ldistritos = $ubigeos->listarDistritoProvincia($ocliente->provincia_ubi);
			$lprovincias = $ubigeos->listarProvinciasDepartamento($ocliente->departamento_ubi);
	
		}	 
	}else{
		$_GET['id'] = null;
		$id_cliente = null;
		$ocliente =  (object)array(
			"dni" => "",
			"nombres_per" => "",
			"apellidopat_per" => "",
			"apellidomat_per" => "",
			"sexo" => "",
			"fechanac_per" => date('Y-m-d'),
			"ruc_per" => "",
			"razonsoc_per" => "",
			"empleado" => "",
			"proveedor" => "",
			"area_id" => "",
			"caract_ref" => "",
			"caract_ref" => "",
			"direccion_per" => "",
			"correo_per" => "",
			"telefonofij_per" => "",
			"telefonocel_per" => "",
			"facebook_per" => "",
			"departamento_ubi" => "",
			"provincia_ubi" => "",
			"ubigeo_id_ubi" => "",
		);
	}
  require 'view/mantenimientos/empleados/form_empleados.php';
}
function _gestionarempleadoAction(){
	$id = $_POST['id'];
	$dni = $_POST['dni'];
	$nombres_per = $_POST['nombres'];
	$apellidopat_per = $_POST['apellidopat'];
	$apellidomat_per =$_POST['apellidomat'];
	$sexo = $_POST['sexo'];
	list($dia_nac, $mes_nac, $anio_nac) = explode('/', $_POST['fechanac']);
	$fechanac_per = $anio_nac.'-'.$mes_nac.'-'.$dia_nac;
	
	$direccion_per = $_POST['direccion'];
	$telefonocel_per = $_POST['telefonocel'];
	$correo_per = $_POST['correo'];
	$telefonofij_per = $_POST['telefonofij'];
	$facebook_per = $_POST['facebook'];
	$tipo_per = '1';
	$ruc_per = null;
	$razonsoc_per = null;
	$empleado = '1';
	$area_id = $_POST['area'];
	$claveusu_per = $_POST['dni'];
	$estadocli_per = 1;
	$perfil_id_per = 2;
	$ubigeo_id_ubi = $_POST['distrito'];
	$proveedor = '0' ;
	$caract_ref = null ;
	$user_reg = $_SESSION['id_persona_sigue'];
	$fh_reg = date('Y-m-d H:i:s');	

	$clientes = new Clientes();

	if ($id == null) {
		$regcliente = $clientes->registrarCliente(
			$dni, 
			$nombres_per, 
			$apellidopat_per, 
			$apellidomat_per, 
			$sexo, 
			$fechanac_per, 
			$direccion_per, 
			$telefonocel_per, 
			$correo_per, 
			$telefonofij_per, 
			$facebook_per, 
			$tipo_per, 
			$ruc_per, 
			$razonsoc_per, 
			$empleado, 
			$area_id, 
			$claveusu_per, 
			$estadocli_per, 
			$perfil_id_per, 
			$ubigeo_id_ubi, 
			$proveedor, 
			$caract_ref, 
			$user_reg, 
			$fh_reg);
		$msj = 'Empleado registrado correctamente';

	} else {
		$uptcliente = $clientes->actualizarCliente(
			$dni, //
			$nombres_per, // 
			$apellidopat_per, //
			$apellidomat_per, //
			$sexo, //
			$fechanac_per, // 
			$direccion_per, //
			$telefonocel_per, //
			$correo_per, //
			$telefonofij_per, // 
			$facebook_per, //
			$tipo_per, //
			$ruc_per, //
			$razonsoc_per, // 
			$empleado, //
			$area_id, //
			$claveusu_per, // 
			$estadocli_per, //
			$perfil_id_per, //
			$ubigeo_id_ubi, //
			$proveedor, //
			$caract_ref, //
			$user_reg, //
			$fh_reg, //
			$id); //


		$msj = 'Empleado actualizado correctamente';

	}

	$response = array();


	$response['msj'] = $msj;

    header('Content-Type: application/json');
    echo json_encode($response);


}

//FIN EMPLEADOS

function _panelpreciosAction(){
	
	require 'view/mantenimientos/precios/precio_panel.php';
}