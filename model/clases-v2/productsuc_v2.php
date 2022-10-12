<?php 
//Para reportes de clientes
require_once __DIR__.'/../clases/conexion.php';
class Productosv2 {
    private $conexion;

    public function __construct() {
        try{
            $this->conexion = new Conexion();
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }

    public function listarProductoSuc(){
        try{
            $resultado = $this->conexion->query('select PR.idproducto,nombre_producto,razonsoc_suc,alm_nombre,cantidad
            from sucursal S join almacen_productos AL on S.idalmacen=AL.alm_id
            join productos PR ON AL.prod_id = PR.idproducto
            join almacenes ALM ON S.idalmacen=ALM.alm_id');
            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
            return $resultado->fetchAll(PDO::FETCH_OBJ);
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
}