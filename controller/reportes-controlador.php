<?php
//Para Procesar ACCIONES - VAMOS INTERSECTARLAS
if(isset($_POST['action'])){
    include_once '../model/clases/clientes_v2.php';
    include_once '../model/clases/productsuc_v2.php';
    include_once '../model/clases/ventas_v2.php';

    try{
        $action = $_POST['action'];
        switch($action){
            case "listarClientes": listarClientes();break; 
            case "listarProductoSuc": listarProductoSuc();break;
            case "listarventas": listarVentas();break;
            
        }
    }catch(Exception $e){
        echo json_encode(["ok"=> false, "message"=> "Ocurrió un error procesando tu petición.", "real_error"=>$e->getMessage()]); die();    
    }
}


function _reporteclientesAction(){
    include_once 'controller/validar-sesion.php';
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
    //Cargandole scripts a la página
    $_SESSION['scriptsPage'] = array('misfunc.js','reportes/reporteClientes.js');
    require_once 'view/reportes/reporteclientes.php';
}
function listarClientes(){
    try{
        $clientes = new Clientesv2();
	    $listadoClientes = $clientes->listarclientes();
        echo json_encode(array("ok"=>true,"clientes"=>$listadoClientes));
    }catch(Exception $e){
        throw new Exception($e->getMessage());    
    }
}

//sucursal producto
function _reportesucursalprodAction(){
    include_once 'controller/validar-sesion.php';
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
    //Cargandole scripts a la página
    $_SESSION['scriptsPage'] = array('misfunc.js','reportes/reporteproductsuc.js');
    require_once 'view/reportes/reportesucursalprod.php';
}

function listarProductoSuc(){
    try{
        $productsuc = new Productosv2();
	    $listadoProductsuc = $productsuc->listarProductoSuc();
        echo json_encode(array("ok"=>true,"productsuc"=>$listadoProductsuc));
    }catch(Exception $e){
        throw new Exception($e->getMessage());    
    }
}

//VENTAS POR EMPLEADO
function _reportesventasempAction(){
    include_once 'controller/validar-sesion.php';
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
    //Cargandole scripts a la página
    $_SESSION['scriptsPage'] = array('misfunc.js','reportes/reporteVenta.js');
    require_once 'view/reportes/reporteventas.php';
}
function listarVentas(){
    try{
        $ventas = new Ventasv2();
	    $listadoVentasEm = $ventas->listarVentas();
        echo json_encode(array("ok"=>true,"productsuc"=>$listadoVentasEm));
    }catch(Exception $e){
        throw new Exception($e->getMessage());    
    }
}