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
        $stmt=$this->objPdo->prepare('SELECT * from sucursal s inner join ubigeo u on s.ubigeo_id_ubi = u.id_ubigeo where s.id_sucursal = :id;');
        $stmt->execute(array('id' => $id ));
        $lsucursales = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lsucursales[0];
    }

    public function registrarSucursal($razon_social, $direccion_suc, $direccion_alm, $telefono_fij, $telefono_cel, $ubigeo_id_ubi) {

        $stmt = $this->objPdo->prepare("INSERT INTO sucursal ( razonsoc_suc, direccionsuc_suc, direccionalm_suc, telefonofij_suc, telefonocel_suc,  estado_suc, ubigeo_id_ubi, idalmacen ) 
                        VALUES(:razon_social, :direccion_suc, :direccion_alm , :telefono_fij, :telefono_cel, '1', :ubigeo_id_ubi, 1)");
        $rows = $stmt->execute(array(
                                    'razon_social' => $razon_social,
                                    'direccion_suc' => $direccion_suc,
                                    'direccion_alm' => $direccion_alm,
                                    'telefono_fij' => $telefono_fij,
                                    'telefono_cel' => $telefono_cel,
                                    'ubigeo_id_ubi' => $ubigeo_id_ubi,                                         
                                    ));
    }   

    public function actualizarSucursal($razon_social, $direccion_suc, $direccion_alm, $telefono_fij, $telefono_cel, $ubigeo_id_ubi, $id_sucursal){
        $stmt = $this->objPdo->prepare('UPDATE sucursal set razonsoc_suc = :razon_social, direccionsuc_suc = :direccion_suc, direccionalm_suc = :direccion_alm, telefonofij_suc = :telefono_fij, telefonocel_suc = :telefono_cel, ubigeo_id_ubi = :ubigeo_id_ubi where id_sucursal = :id_sucursal');
        $rows = $stmt->execute(array(
                                    'razon_social' => $razon_social,
                                    'direccion_suc' => $direccion_suc,
                                    'direccion_alm' => $direccion_alm,
                                    'telefono_fij' => $telefono_fij,
                                    'telefono_cel' => $telefono_cel,
                                    'ubigeo_id_ubi' => $ubigeo_id_ubi, 
                                    'id_sucursal' => $id_sucursal));
    }   





}