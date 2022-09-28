<?php

require_once 'conexion.php';

class Compras {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

 

}