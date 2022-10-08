<?php 
//! Para reportes de clientes
require_once 'conexion.php';
class Clientesv2 {
    private $conexion;

    public function __construct() {
        try{
            $this->conexion = new Conexion();
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
    public function listarClientes(){
        try{
            $resultado = $this->conexion->query('SELECT * FROM persona');
            if(!$resultado){ $this->conexion->errorInfo()[2]; }
            return $resultado->fetchAll(PDO::FETCH_OBJ);
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
}