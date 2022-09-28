<?php

require_once 'conexion.php';

class Clientes {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }


        public function listarclientes(){
        $stmt=$this->objPdo->prepare("SELECT * from persona;");
        $stmt->execute();
        $lclientes = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lclientes;
    }
        public function listarEmpleados(){
        $stmt=$this->objPdo->prepare("SELECT * FROM persona p where p.tipo_per = '1';");
        $stmt->execute();
        $lclientes = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lclientes;
    }

        public function listarclientesxId($id){
        $stmt=$this->objPdo->prepare('SELECT * from persona where id_per = :id;');
        $stmt->execute(array('id' => $id ));
        $lclientes = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lclientes[0];
    }

        public function obtenerClienteId($id){
        $stmt=$this->objPdo->prepare('SELECT * from persona p inner join ubigeo u on p.ubigeo_id_ubi = u.id_ubigeo where p.id_per = :id;');
        $stmt->execute(array('id' => $id ));
        $lclientes = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lclientes[0];
    }

    public function registrarCliente($dni, $nombres_per, $apellidopat_per, $apellidomat_per, $sexo, $fechanac_per, $direccion_per, $telefonocel_per, $correo_per, $telefonofij_per, $facebook_per, $tipo_per, $ruc_per, $razonsoc_per, $empleado, $area_id, $claveusu_per, $estadocli_per, $perfil_id_per, $ubigeo_id_ubi, $proveedor, $caract_ref, $user_reg, $fh_reg) {

        $stmt = $this->objPdo->prepare("INSERT INTO persona ( dni, nombres_per, apellidopat_per, apellidomat_per, sexo, fechanac_per, direccion_per, telefonocel_per, correo_per, telefonofij_per, facebook_per, tipo_per, ruc_per, razonsoc_per, empleado, area_id, claveusu_per ,estadocli_per, perfil_id_per, ubigeo_id_ubi, proveedor, caract_ref, user_reg, fh_reg)
                        VALUES(:dni, :nombres_per, :apellidopat_per, :apellidomat_per, :sexo, :fechanac_per, :direccion_per, :telefonocel_per, :correo_per, :telefonofij_per, :facebook_per, :tipo_per, :ruc_per, :razonsoc_per, :empleado, :area_id, :claveusu_per, :estadocli_per, :perfil_id_per, :ubigeo_id_ubi, :proveedor, :caract_ref, :user_reg, :fh_reg)");
        $rows = $stmt->execute(array(
                                    'dni' => $dni,
                                    'nombres_per' => $nombres_per,
                                    'apellidopat_per' => $apellidopat_per,
                                    'apellidomat_per' => $apellidomat_per,
                                    'sexo' => $sexo,
                                    'fechanac_per' => $fechanac_per,
                                    'direccion_per' => $direccion_per,
                                    'telefonocel_per' => $telefonocel_per,
                                    'correo_per' => $correo_per,
                                    'telefonofij_per' => $telefonofij_per,
                                    'facebook_per' => $facebook_per,
                                    'tipo_per' => $tipo_per,
                                    'ruc_per' => $ruc_per,
                                    'razonsoc_per' => $razonsoc_per,
                                    'empleado' => $empleado,
                                    'area_id' => $area_id,
                                    'claveusu_per' => $claveusu_per,
                                    'estadocli_per' => $estadocli_per,
                                    'perfil_id_per' => $perfil_id_per,
                                    'ubigeo_id_ubi' => $ubigeo_id_ubi,
                                    'proveedor' => $proveedor,
                                    'caract_ref' => $caract_ref,
                                    'user_reg' => $user_reg,
                                    'fh_reg' => $fh_reg,
                                    ));
    }

    public function actualizarCliente($dni, $nombres_per, $apellidopat_per, $apellidomat_per, $sexo, $fechanac_per, $direccion_per, $telefonocel_per, $correo_per, $telefonofij_per, $facebook_per, $tipo_per, $ruc_per, $razonsoc_per, $empleado, $area_id, $claveusu_per, $estadocli_per, $perfil_id_per, $ubigeo_id_ubi, $proveedor, $caract_ref, $user_reg, $fh_reg, $id_per){
        $stmt = $this->objPdo->prepare('UPDATE persona
   SET  dni= :dni, nombres_per= :nombres_per, apellidopat_per= :apellidopat_per, apellidomat_per= :apellidomat_per,
       sexo= :sexo, fechanac_per= :fechanac_per, direccion_per= :direccion_per, telefonocel_per= :telefonocel_per, correo_per=:correo_per,
       telefonofij_per= :telefonofij_per, facebook_per= :facebook_per, tipo_per= :tipo_per, ruc_per= :ruc_per, razonsoc_per= :razonsoc_per,
       empleado= :empleado, area_id= :area_id, claveusu_per= :claveusu_per, estadocli_per= :estadocli_per, perfil_id_per= :perfil_id_per,
       ubigeo_id_ubi= :ubigeo_id_ubi, proveedor= :proveedor, user_reg= :user_reg, fh_reg= :fh_reg, caract_ref= :caract_ref
 WHERE id_per= :id_per ');
        $rows = $stmt->execute(array(
                                    'dni' => $dni,
                                    'nombres_per' => $nombres_per,
                                    'apellidopat_per' => $apellidopat_per,
                                    'apellidomat_per' => $apellidomat_per,
                                    'sexo' => $sexo,
                                    'fechanac_per' => $fechanac_per,
                                    'direccion_per' => $direccion_per,
                                    'telefonocel_per' => $telefonocel_per,
                                    'correo_per' => $correo_per,
                                    'telefonofij_per' => $telefonofij_per,
                                    'facebook_per' => $facebook_per,
                                    'tipo_per' => $tipo_per,
                                    'ruc_per' => $ruc_per,
                                    'razonsoc_per' => $razonsoc_per,
                                    'empleado' => $empleado,
                                    'area_id' => $area_id,
                                    'claveusu_per' => $claveusu_per,
                                    'estadocli_per' => $estadocli_per,
                                    'perfil_id_per' => $perfil_id_per,
                                    'ubigeo_id_ubi' => $ubigeo_id_ubi,
                                    'proveedor' => $proveedor,
                                    'caract_ref' => $caract_ref,
                                    'user_reg' => $user_reg,
                                    'fh_reg' => $fh_reg,
                                    'id_per' => $id_per,
                                    ));
    }





}
