<?php

require_once 'conexion.php';

class Ubigeos {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

 
        public function listarDepartamentos(){
        $stmt=$this->objPdo->prepare('SELECT u.departamento_ubi FROM ubigeo u group by u.departamento_ubi order by u.departamento_ubi ;');
        $stmt->execute();
        $ldepartamentos = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $ldepartamentos;
    }

        public function listarProvinciasDepartamento($departamento){
        $stmt=$this->objPdo->prepare('SELECT u.provincia_ubi FROM ubigeo u where u.departamento_ubi like :departamento group by u.provincia_ubi order by u.provincia_ubi ;');
        $stmt->execute(array('departamento' => $departamento));
        $lprovinvicias = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lprovinvicias;
    }

        public function listarDistritoProvincia($provincia){
        $stmt=$this->objPdo->prepare('SELECT u.distrito_ubi, u.id_ubigeo FROM ubigeo u  where u.provincia_ubi like :provincia group by u.distrito_ubi, u.id_ubigeo order by u.distrito_ubi ;');
        $stmt->execute(array('provincia' => $provincia));
        $ldistritos = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $ldistritos;
    }

}