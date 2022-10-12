<?php 
//Para reportes de clientes
require_once __DIR__.'/../clases/conexion.php';
class Sucursalesv2 {
    private $conexion;

    public function __construct() {
        try{
            $this->conexion = new Conexion();
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }

    public function listarSucursales(){
        try{
            $resultado = $this->conexion->query('SELECT * FROM sucursal;');
            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
            return $resultado->fetchAll(PDO::FETCH_OBJ);
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }

}