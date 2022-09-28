<?php

require_once 'conexion.php';

class Usuarios {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

 
        public function validarUsuario($dni, $pass){
        $stmt=$this->objPdo->prepare('SELECT * from persona where dni = :dni and claveusu_per = :pass ;');
        $stmt->execute(array('dni' => $dni,
                            'pass' => $pass));
        $usuarios = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $usuarios[0];
    }


    public function listarusuarios(){
        $stmt=$this->objPdo->prepare("SELECT * from persona where empleado='1';");
        $stmt->execute();
        $lusuarios = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lusuarios;
    }

    
    public function obtenerUsuariosId($id){
        $stmt=$this->objPdo->prepare("SELECT * from persona where id_per=id;");
       $stmt->execute(array('id' => $id ));
        $lusuarios= $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lusuarios[0];
    }
}

?>