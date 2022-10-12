<?php 
//Para reportes de clientes
require_once __DIR__.'/../clases/conexion.php';
class Almacenv2 {
    private $conexion;

    public function __construct() {
        try{
            $this->conexion = new Conexion();
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }

    public function listarAlmacenes(){
        try{
            $resultado = $this->conexion->query('SELECT * FROM almacenes;');
            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
            return $resultado->fetchAll(PDO::FETCH_OBJ);
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
    public function listarAlmacenxSucursal($idSucursal){
        try{
            $resultado = $this->conexion->query("SELECT * FROM almacenes WHERE suc_id = $idSucursal;");
            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
            return $resultado->fetchAll(PDO::FETCH_OBJ);
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
}