<?php 
//Para reportes de clientes
require_once 'conexion.php';
class Ventasv2 {
    private $conexion;

    public function __construct() {
        try{
            $this->conexion = new Conexion();
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }

    public function listarVentas(){
        try{
            $resultado = $this->conexion->query('select dni,nombres_per,apellidopat_per,apellidomat_per, VE.total,V.fh_reg,
            from persona PE join venta_detalles V on PE.id_per=V.emp_reg
            join ventas VE on V.venta_id=VE.venta_id');
            if(!$resultado){ $this->conexion->errorInfo()[2]; }
            return $resultado->fetchAll(PDO::FETCH_OBJ);
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
}