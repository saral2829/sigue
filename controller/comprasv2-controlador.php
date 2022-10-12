<?php
//! En el primer proceso de compras, hay un error, busca si el producto se encuentra en la base de datos dentro de un almacén, está bien, pero si no encuentra datos se queda, además que el proceso de traer y listar datos me parece demasiado engorroso, por lo cual escribiré una mejor(a mi parecer) solución.
//Para Procesar COMPRASv2
if(isset($_POST['action'])){
    include_once  '../model/clases-v2/sucursales_v2.php';
    include_once  '../model/clases-v2/almacen_v2.php';
    include_once  '../model/clases-v2/productos_v2.php';
    include_once  '../model/clases-v2/compra_v2.php';
    try{
        $action = $_POST['action'];
        switch($action){
            case "listarSucursales": listarSucursales();break;
            case "listarAlamacenxSucursal": listarAlmacenxSucursal($_POST['idsucursal']);break;
            case "listarProductosCaracteristicas": listarProductosCCaracteristicias();break;
            case "obtenerUnidadesProductos": obtenerUnidades($_POST['idproducto']);break;
            case "registrarCompra": registrarCompra($_POST['listadoProductos'],$_POST['idAlmacen'],$_POST['idSucursal']);break;
        }
    }catch(Exception $e){
        echo json_encode(["ok"=> false, "message"=> "Ocurrió un error procesando tu petición.", "real_error"=>$e->getMessage()]); die();    
    }
}


function _comprarproductoAction(){
    //! Mostrando la página que quiero ver
    include_once 'controller/validar-sesion.php';
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
    //Cargandole scripts a la página
    $_SESSION['scriptsPage'] = array('misfunc.js','compras-v2/comprarProducto.js');
    require_once 'view/compras_v2/comprarProducto.php';
}
function listarSucursales(){
    try{
        $sucursales = (new Sucursalesv2)->listarSucursales();
        echo json_encode(array("ok"=>true,"sucursales"=>$sucursales));
    }catch(Exception $e){
        throw new Exception($e->getMessage());
    }
}
function listarAlmacenxSucursal($idSucursal){
    try{
        //! Si es porque quiere todos los sucursales
        if($idSucursal == 0) $almacenes = (new Almacenv2)->listarAlmacenes();
        else $almacenes = (new Almacenv2)->listarAlmacenxSucursal($idSucursal);
        echo json_encode(array("ok"=>true,"almacenes"=>$almacenes));        
    }catch(Exception $e){
        throw new Exception($e->getMessage());
    }
}
function listarProductosCCaracteristicias(){
    try{
        //! Si es porque quiere todos los sucursales
        $prod_v2 = new _Productosv2;
        $productos = $prod_v2->listarProductos();
        //! Ahora listar con sus características
        foreach($productos as $producto){
            $caracteristicas = $prod_v2->obtenerCaracteristicasProducto($producto->idproducto);
            $producto->caracteristicas = '';
            foreach($caracteristicas as $c){
                $producto->caracteristicas .= "<strong>$c->nombre_caract :</strong> $c->valor_caract </br>"; 
            }
        }
        
        echo json_encode(array("ok"=>true,"productos"=>$productos));        
    }catch(Exception $e){
        throw new Exception($e->getMessage());
    }
}
function obtenerUnidades($idProducto){
    try{
        //! Si es porque quiere todos los sucursales
        $unidades = (new _Productosv2)->obtenerUnidadesMedida($idProducto);
        echo json_encode(array("ok"=>true,"unidades"=>$unidades));        
    }catch(Exception $e){
        throw new Exception($e->getMessage());
    }
}
function registrarCompra($listado,$idAlmacen, $idSucursal){
    try{
        $productos = json_decode($listado);
        $sucursalID = $idSucursal === 0 ? '-1' : $idSucursal;
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        $emp_reg = $_SESSION['id_persona_sigue'];
        // $id =  (new Comprav2)->registrarCompra($productos,$idAlmacen,$sucursalID,$emp_reg);
        if((new Comprav2)->registrarCompra($productos,$idAlmacen,$idSucursal,$emp_reg)){
            echo json_encode(array('ok'=>true, "message"=>"Agregado correctamente." ));
        }
    }catch(Exception $e){
        throw new Exception($e->getMessage());
    }
}