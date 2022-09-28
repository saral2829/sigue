<?php

require_once 'conexion.php';

class Proveedores {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

 
        public function listarproveedores(){
        $stmt=$this->objPdo->prepare("SELECT * from persona where proveedor='1';");
        $stmt->execute();
        $lproveedores = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproveedores;
    }

        public function listarproveedoresxId($id){
        $stmt=$this->objPdo->prepare('SELECT * from persona where id_per = :id;');
        $stmt->execute(array('id' => $id ));
        $lproveedores = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproveedores[0];
    }

        public function obtenerProveedorId($id){
        $stmt=$this->objPdo->prepare('SELECT * from persona where id_per = :id;');
        $stmt->execute(array('id' => $id ));
        $lproveedores = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproveedores[0];
    }

    public function registrarProveedor($dni, $nombres, $apellidopat, $apellidomat, $sexo, $fechanac, $direccion, $telefonocel, $correo, $telefonofij, $facebook, $tipo, $ruc, $razonsoc, $condicion, $area, $claveusu, $estadocli, $perfil, $ubigeo, $proveedor, $marca) {

        $stmt = $this->objPdo->prepare("INSERT INTO persona ( dni, nombres_per, apellidopat_per, apellidomat_per, sexo, fechanac_per, direccion_per, telefonocel_per, correo_per, telefonofij_per, facebook_per, tipo_per, ruc_per, razonsoc_per, condicion_per, area_id, claveusu_per ,estadocli_per, perfil_id_per, ubigeo_id_ubi, proveedor, marca) 
                        VALUES(:dni, :nombres, :apellidopat, :apellidomat, :sexo, :fechanac, :direccion, :telefonocel, :correo, :telefonofij, :facebook, :tipo, :ruc, :razonsoc, :condicion, :area, :claveusu, :estadocli, :perfil, :ubigeo, '1', :marca)");
        $rows = $stmt->execute(array(
                                    'dni' => $dni,
                                    'nombres' => $nombres,
                                    'apellidopat' => $apellidopat,
                                    'apellidomat' => $apellidomat,
                                    'sexo' => $sexo,
                                    'fechanac' => $fechanac,
                                    'direccion' => $direccion,
                                    'telefonocel' => $telefonocel,
                                    'correo' => $correo,
                                    'telefonofij' => $telefonofij,
                                    'facebook' => $facebook,
                                    'tipo' => $tipo,
                                    'ruc' => $ruc,
                                    'razonsoc' => $razonsoc,
                                    'condicion' => $condicion,
                                    'area' => $area,
                                    'claveusu' => $claveusu,
                                    'estadocli' => $estadocli,
                                    'perfil' => $perfil,
                                    'ubigeo' => $ubigeo,
                                    'marca' => $marca,                                         
                                    ));
    }   

    public function actualizarProveedor($dni, $nombres, $apellidopat, $apellidomat, $sexo, $fechanac, $direccion, $telefonocel, $correo, $telefonofij, $facebook, $tipo, $ruc, $razonsoc, $condicion, $area, $claveusu, $estadocli, $perfil, $ubigeo, $proveedor, $marca, $id_per){
        $stmt = $this->objPdo->prepare('UPDATE persona set dni = :dni, nombres_per = :nombres, apellidopat_per = :apellidopat, apellidomat_per = :apellidomat, sexo = :sexo, fechanac_per = :fechanac, direccion_per = :direccion, telefonocel_per = :telefonocel, correo_per = :correo, telefonofij_per = :telefonofij, facebook_per = :facebook, tipo_per = :tipo, ruc_per = :ruc, razonsoc_per = :razonsoc, condicion_per = :condicion, area_id = :area, claveusu_per = :claveusu, estadocli_per = :estadocli, perfil_id_per = :perfil, ubigeo_id_ubi = :ubigeo, proveedor = :proveedor, marca = :marca where id_per = :id_per');
        $rows = $stmt->execute(array(
                                    'dni' => $dni,
                                    'nombres' => $nombres,
                                    'apellidopat' => $apellidopat,
                                    'apellidomat' => $apellidomat,
                                    'sexo' => $sexo,
                                    'fechanac' => $fechanac,
                                    'direccion' => $direccion,
                                    'telefonocel' => $telefonocel,
                                    'correo' => $correo,
                                    'telefonofij' => $telefonofij,
                                    'facebook' => $facebook,
                                    'tipo' => $tipo,
                                    'ruc' => $ruc,
                                    'razonsoc' => $razonsoc,
                                    'condicion' => $condicion,
                                    'area' => $area,
                                    'claveusu' => $claveusu,
                                    'estadocli' => $estadocli,
                                    'perfil' => $perfil,
                                    'ubigeo' => $ubigeo,
                                    'proveedor' => $proveedor,
                                    'marca' => $marca,
                                    'id_per' => $id));
    }   





}