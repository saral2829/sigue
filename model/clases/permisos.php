<?php

require_once 'conexion.php';

class permisos {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

 
        public function listarPerfiles(){
        $stmt=$this->objPdo->prepare("SELECT * from perfil;");
        $stmt->execute();
        $lperfiles = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lperfiles;
    }  

    public function actualizarPerfil($perfil, $id){
        $stmt = $this->objPdo->prepare('UPDATE persona set perfil_id_per = :perfil  where id_per = :id;');
        $rows = $stmt->execute(array(
                                    'perfil' => $perfil,
                                    'id' => $id));
    }   





}