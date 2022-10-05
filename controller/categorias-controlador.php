<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include 'controller/validar-sesion.php';
require 'model/clases/categorias.php';

function _panelcategoriasAction(){
	$categorias = new Categorias();
	$lcategorias = $categorias->listarcategorias();

  require 'view/mantenimientos/categoria/panel_categorias.php';

}

function _formcategoriasAction()
{
	require 'view/mantenimientos/categoria/form_categorias.php';
}


function _cargarcategoriasAction(){

	$response = array();
	$categorias = new Categorias();

	$modal = $_GET['modal'];
	$lcategorias = $categorias->listarcategorias();


	foreach ($lcategorias as $cat) {
		if ($cat->categoria_padre == null) {
			$listado[] = array('title' => $cat->nombre_categoria, 'id'=> $cat->idcategoria, "isExpanded" => true, "tooltip" => "Bookmarks", "folder" => true, 'lazy'=> true, 'children' =>'', 'nombre' => $cat->nombre_categoria, 'descripcion' => $cat->descripcion_categoria, 'vigencia' => $cat->vigencia_categoria, 'categoria_padre' => null );
							
		}
	}
		if ($modal == 'true') {
			$listado_extra = array('title' => 'Nueva categoria', 'id'=> null, "isExpanded" => true, "tooltip" => "Bookmarks",  'children' =>'', 'categoria_padre' => null);

			array_push($listado, $listado_extra);
		}

    header('Content-Type: application/json');
    echo json_encode($listado);		
}


function _cargarcategoriashijoAction()
{
	$id = $_GET['id'];
	$modal = $_GET['modal'];

	$categorias = new Categorias();
	$lcategoriashijos = $categorias->listarCategoriasHijo($id);

		if ($modal == 'true') {
			$listado_extra = array('title' => 'Nueva categoria', 'id'=> null, "isExpanded" => true, "tooltip" => "Bookmarks", 'children' =>'',  'categoria_padre' => $id);

			array_push($lcategoriashijos, $listado_extra);
		}

    header('Content-Type: application/json');
    echo json_encode($lcategoriashijos);	
}



function _modalcategoriaAction(){
	
	$data = $_POST['data'];
	$modo = $_POST['modo'];
	$categorias = new Categorias();

	if ($modo == 'add') {
		$titulo = 'Añadir categoria';
		$nombre_categoria = "";
		$descripcion_categoria = "";
		$vigencia = 'checked';	
		$id =  null;
		$categoria_padre = null;

	} else {
		$titulo = 'Editar categoria';
		$nombre_categoria = $data['nombre'];
		$descripcion_categoria = $data['descripcion'];
		$vigencia = ($data['vigencia'] == 1) ? 'checked' : '' ;	
		$id =  $data['id'];
		$categoria_padre = $data['categoria_padre'];

		if ($categoria_padre != null) {
			$ocategoria = $categorias->obtenerCategoriaId($categoria_padre);
		}

	}
	
	require 'view/mantenimientos/categoria/modal_categorias.php';
}

function _registrarcategoriaAction(){
	$response = array();

	$id = $_POST['id'];
	$nombre_categoria = $_POST['nombre_categoria'];
	$descripcion_categoria = $_POST['descripcion_categoria'];
	$vigencia_categoria = (isset($_POST['chk_estado'])) ? '1' : '0' ;
	$categoria_padre = ($_POST['id_padre'] == null) ? null : $_POST['id_padre'] ;

	if (isset($chk_cambiar)) {
		$categoria_padre = $_POST['nuevo_padre'];
	}
	$categorias = new Categorias();
	if ($id == null) {

		$regcategoria = $categorias->registrarCategoria($nombre_categoria, $descripcion_categoria, $vigencia_categoria, $categoria_padre);	
		$response['msj'] = 'Categorìa registrada correctamente';
	} else {
		$uptcategoria = $categorias->actualizarCategoria($nombre_categoria, $descripcion_categoria, $vigencia_categoria, $categoria_padre, $id);
		$response['msj'] = 'Categorìa actualizada correctamente';
	}

	$response['url'] = 'index.php?page=categorias&accion=panelcategorias';

	header('Content-Type: application/json');
	echo json_encode($response);
}
