<?php

require_once 'conexion.php';

class Sucursales {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

 
        public function listarsucursales(){
        $stmt=$this->objPdo->prepare('SELECT * from sucursal ;');
        $stmt->execute();
        $lsucursales = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lsucursales;
    }

        public function listarsucursalesxId($id){
        $stmt=$this->objPdo->prepare('SELECT * from sucursal where id_sucursal = :id;');
        $stmt->execute(array('id' => $id ));
        $lsucursales = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lsucursales[0];
    }

        public function obtenerSucursalId($id){
        $stmt=$this->objPdo->prepare('SELECT * from sucursal where id_sucursal = :id;');
        $stmt->execute(array('id' => $id ));
        $lsucursales = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lsucursales[0];
    }

    public function registrarSucursal($razon_social, $nombre, $direccion, $telefono, $celular) {

        $stmt = $this->objPdo->prepare("INSERT INTO sucursal ( razonsoc_suc, direccionsuc_suc, direccionalm_suc, telefonofij_suc, telefonocel_suc,  estado_suc, ubigeo_id_ubi, idalmacen ) 
                        VALUES(:razon_social, :direccion, :direccion , :telefono, :celular, '1', 1, 1)");
        $rows = $stmt->execute(array(
                                    'razon_social' => $razon_social,
                                    'direccion' => $direccion,
                                    'telefono' => $telefono,
                                    'celular' => $celular,                                         
                                    ));
    }   

    public function actualizarSucursal($razon_social, $direccion, $telefono, $celular, $id_sucursal){
        $stmt = $this->objPdo->prepare('UPDATE sucursal set razonsoc_suc = :razon_social, direccionsuc_suc = :direccion, direccionalm_suc = :direccion, telefonofij_suc = :telefono, telefonocel_suc = :celular where id_sucursal = :id_sucursal');
        $rows = $stmt->execute(array(
                                    'razon_social' => $razon_social,
                                    'direccion' => $direccion,
                                    'telefono' => $telefono,
                                    'celular' => $celular,
                                    'id_sucursal' => $id_sucursal));
    }   





}