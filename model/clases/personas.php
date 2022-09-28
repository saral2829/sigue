<?php

require_once 'conexion.php';

class Personas {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

        public function listarProveedores(){
        $stmt=$this->objPdo->prepare("SELECT * from persona where proveedor = '1' ;");
        $stmt->execute();
        $lproveedores = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproveedores;
    }
}