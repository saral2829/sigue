<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

include 'controller/validar-sesion.php';
require 'model/clases/productos.php';
require 'model/clases/caracteristicas.php';
require 'model/clases/personas.php';
require 'model/clases/categorias.php';
require 'model/clases/unidadmedida.php';

function _panelproductosAction()
{
    $caracteristicas = new Caracteristicas();
    $lcaracteristicas = $caracteristicas->listarCatarcteristicasPadre();

    require 'view/mantenimientos/producto/panel_productos.php';
}

function _cargarcaractAction()
{
    $id = $_POST['id'];

    $caracteristicas = new Caracteristicas();
    $lcaracteristicas = $caracteristicas->listarValoresIdCateristica($id);
    $options = '';

    foreach ($lcaracteristicas as $carc) {
        $options .= '<option value=' . $carc->idcaracteristica . '>' . $carc->nombre_caracteristica . '</option>';
    }

    $response = array();
    $response['options'] = $options;

    header('Content-Type: application/json');
    echo json_encode($response);

}

function _cargartablaAction()
{
    $term = '%' . $_POST['term'] . '%';
    $carac = $_POST['caract'];
    $caract_padre = $_POST['caract_padre'];

    $productos = new Productos();

    if ($caract_padre == '-1') {
        $lproductos = $productos->buscarProductosTerm($term);
    } else {
        // $lproductos = $productos->buscarProductoCaracTerm($term, $carac);
        $lproductos = $productos->buscarProductoCaracteristicacaId($term, $carac);

    }

    $nro = 1;

    require 'view/mantenimientos/producto/tabla_productos.php';

}

function _formproductosAction()
{
    $caracteristicas = new Caracteristicas();
    $lcaracteristicas = $caracteristicas->listarCatarcteristicasPadreActivo();

    $personas = new Personas();
    $lproveedores = $personas->listarProveedores();

    $unidades = new Unidades();
    $lunidades = $unidades->listarUnidades();

    if (isset($_GET['id'])) {
        $id = $_GET['id'];

        if ($id != null) {
            $modo_form = 'edit';

            $productos = new Productos();
            $lunidadesproducto = $productos->obtenerUnidadProducto($id);

            $oproducto = $productos->obtenerProductosId($id);
            $lcaract = $productos->obtenerCaractProducto($id);

            foreach ($lcaract as $c) {
                $padres[] = $c->id_caracteristica_padre;
            }

            foreach ($lunidadesproducto as $u) {
                $unids[] = $u->id_unidadmedida;
            }
        }
    } else {
        $modo_form = 'add';
        $id = null;
        $_GET['id'] = null;
        $oproducto = (object) array(
            "nombre_producto" => "",
            "idproveedor" => null,
            "estado" => '1',
            "nombre_categoria" => "",
        );
    }

    require 'view/mantenimientos/producto/formproductos.php';
}

function _modalcategoriaAction()
{

    $data = $_POST['data'];
    $modo = $_POST['modo'];
    $categorias = new Categorias();

    $titulo = 'Indicar Categoria';

    require 'view/mantenimientos/producto/modal_categoria.php';
}
function _generarcodebarAction()
{
    $id = $_POST['id'];
    $productos = new Productos();
    $response = array();

    //$oproduct = $productos->obtenerProductoId($id);

    //Generando codigo para el codeBar al registrar

    $permitted_chars = '0123456789';
    do {
        $code_bar = substr(str_shuffle($permitted_chars), 0, 7);
        
    } while ($productos->verificarCodebar($code_bar));
    

    //fin generando codigo para el codebar

    $genCodeBar = $productos->generarcodebarProducto($id, $code_bar);

    $msj = 'Codigo generado correctamente';
    $response['msj'] = $msj;

    header('Content-Type: application/json');
    echo json_encode($response);

}

function _valorescaracteristicaAction()
{

    $id = $_POST['caract'];

    $caracteristicas = new Caracteristicas();

    $lvalores = $caracteristicas->listarValoresIdCateristica($id);
    $html = "";
    $html .= '<option value="-1">Seleccionar</option>';

    foreach ($lvalores as $valor) {
        $html .= '<option value=' . $valor->idcaracteristica . '>' . $valor->nombre_caracteristica . '</option>';
    }

    echo $html;
}

function _registrarprductoAction()
{

    $id = $_REQUEST['idproducto'];
    $nombre_producto = strtoupper($_POST['nombre_producto']);
    $idcategoria = $_POST['idcategoria'];
    $idproveedor = $_POST['proveedor'];

    $estado = (isset($_POST['estado'])) ? '1' : '0';

    $caracteristicas = $_POST['caracteristicas'];

    $user_reg = $_SESSION['id_persona_sigue'];
    $fh_reg = date('Y-m-d H:i:s');

    $det_caract = json_decode($_POST['caracteristicas']);
    $unidades_medida = json_decode($_POST['unidades']);

    $response = array();

    $productos = new Productos();

    if ($id == null) {

        //Generando codigo para el codeBar al registrar

        $permitted_chars = '0123456789';
        do {
            $code_bar = substr(str_shuffle($permitted_chars), 0, 7);
            
        } while ($productos->verificarCodebar($code_bar));
        

        //fin generando codigo para el codebar

        $regproducto = $productos->registrarProducto($nombre_producto, $idcategoria, $idproveedor, $estado, $user_reg, $fh_reg, $code_bar);

        $obtproducto = $productos->obtenerProductoReg($nombre_producto, $idcategoria, $idproveedor, $estado, $user_reg, $fh_reg);
        $idproducto = $obtproducto->idproducto;

        for ($i = 0; $i < count($det_caract); $i++) {
            $regProductoCaract = $productos->registrarProductoCaracteristica($idproducto, $det_caract[$i]->valor);
        }

        for ($j = 0; $j < count($unidades_medida); $j++) {
            $regProductoUni = $productos->registrarProductoUnidad($idproducto, $unidades_medida[$j]->id_unidad);
        }

        $msj = 'Registrado correctamente';
    } else {
        $lcaract = $productos->obtenerCaractProducto($id);
        $coincidencias = 0;
        for ($i = 0; $i < count($det_caract); $i++) {
            foreach ($lcaract as $ca) {
                if ($ca->idvalor == $det_caract[$i]->valor) {
                    $coincidencias = $coincidencias + 1;
                }
            }
        }

        $modificar = (count($det_caract) == count($lcaract) && $coincidencias == count($det_caract)) ? false : true;

        $uptproducto = $productos->actualizarProducto($nombre_producto, $idcategoria, $idproveedor, $estado, $user_reg, $fh_reg, $id);

        if ($modificar == true) {

            $delproductocaract = $productos->eliminarProductoCaractIdProducto($id);
            $idproducto = $id;
            for ($i = 0; $i < count($det_caract); $i++) {
                $regProductoCaract = $productos->registrarProductoCaracteristica($idproducto, $det_caract[$i]->valor);
                //$msj2 = $nombre_producto;
            }

        }

        $lunids = $productos->obtenerUnidProducto($id);
        $coincidencias_unidades = 0;
        for ($i = 0; $i < count($unidades_medida); $i++) {
            foreach ($lunids as $ca) {
                if ($ca->id_unidadmedida == $unidades_medida[$i]->id_unidad) {
                    $coincidencias_unidades = $coincidencias_unidades + 1;
                }
            }
        }

        $modificar_uni = (count($unidades_medida) == count($lunids) && $coincidencias == count($unidades_medida)) ? false : true;

        if ($modificar_uni == true) {

            $idproducto = $id;

            for ($j = 0; $j < count($unidades_medida); $j++) {
                $oproductoUnidad = $productos->buscarProductoUnidad($idproducto, $unidades_medida[$j]->id_unidad);
                if ($oproductoUnidad == null) {
                    $regUnidad = $productos->registrarProductoUnidad($idproducto, $unidades_medida[$j]->id_unidad);
                }

            }

        }

        $response['modificar'] = $modificar;

        $response['array'] = $det_caract;
        $response['array2'] = $lcaract;
        $response['cantidad'] = count($det_caract);
        $response['guardado'] = count($lcaract);
        $response['coincidencias'] = $coincidencias;

        $msj = '<b>Actualizado correctamente</b>';
    }

    $response['msj'] = $msj;

    header('Content-Type: application/json');
    echo json_encode($response);
}

function _verificarproductoAction()
{
    $term = $_POST['term'];
    $tipo = $_POST['tipo'];
    $productos = new Productos();

    switch ($tipo) {
        case 1:
            $bproducto = $productos->buscarProductoNombre(strtoupper($term));
            $existe = (count($bproducto) > 0) ? true : false;
            $msj = ($existe == true) ? '<code><i class="fa fa-fw fa-warning"></i><b>Existe un producto con el mismo nombre</b></code>' : '<code class="code_success"><i class="fa fa-fw fa-check-circle"></i><b>Producto nuevo </b></code>';
            $span = '#span_producto';
            break;

        case 3:
            $detalle = json_decode($term);
            $producto = strtoupper($detalle->producto);
            $proveedor = $detalle->proveedor;
            $bproducto = $productos->buscarProductoIdProducto($producto, $proveedor);
            $existe = (count($bproducto) > 0) ? true : false;
            $msj = ($existe == true) ? '<code><i class="fa fa-fw fa-warning"></i><b>Existe un producto con el mismo proveedor</b></code>' : '<code class="code_success"><i class="fa fa-fw fa-check-circle"></i><b>Proveedor sin producto asignado</b></code>';
            $span = '#span_proveedor';
            break;

        // case 4:
        //     $detalle = json_decode($term);
        //     $producto = strtoupper($detalle->producto);
        //     $caracteristica = $detalle->caracteristica;
        //     $bproducto = $productos->buscarProductoCaracteristicacaId($producto, $caracteristica);
        //     $existe = (count($bproducto) > 0) ? true : false ;
        //     $msj =  ($existe == true) ? '<i style="color: #c7254e" class="fa fa-fw fa-warning"></i>' : '<i style="color: #009688;" class="fa fa-fw fa-check-circle"></i>';
        //     break;

        case 4:

            $contador = 0;
            $valor = $_POST['valor'];
            $arreglo = "";
            $detalle = json_decode($term);
            foreach ($detalle as $det) {
                if ($det->existe == true) {
                    $arreglo .= $det->valor . ',';
                    $contador = $contador + 1;
                }
            }

            $arreglo .= $valor . ',';

            $valores = substr($arreglo, 0, -1);

            $producto = strtoupper($_POST['producto']);
            $bproductos = $productos->buscarProductoCaracteristicacaIdGrupo($producto, $valores);

            $existe = false;

            foreach ($bproductos as $prod) {
                if ($prod->idcaracteristica == $valor) {
                    $existe = true;
                }
            }

            $msj = ($existe == true) ? '<i style="color: #c7254e" class="fa fa-fw fa-warning"></i>' : '<i style="color: #009688;" class="fa fa-fw fa-check-circle"></i>';

            break;

    }

    $response = array();
    $response['existe'] = $existe;
    $response['span'] = $span;
    $response['msj'] = $msj;
    header('Content-Type: application/json');
    echo json_encode($response);
}
