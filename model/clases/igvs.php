<?php

require_once 'conexion.php';

class Igvs {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

 
        public function listarigvs(){
        $stmt=$this->objPdo->prepare('SELECT * from igv ;');
        $stmt->execute();
        $ligvs = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $ligvs;
    }

        public function listarigvsxId($id){
        $stmt=$this->objPdo->prepare('SELECT * from igv where id_igv = :id;');
        $stmt->execute(array('id' => $id ));
        $ligvs = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $ligvs[0];
    }

        public function obtenerIgvId($id){
        $stmt=$this->objPdo->prepare('SELECT * from igv where id_igv = :id;');
        $stmt->execute(array('id' => $id ));
        $ligvs = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $ligvs[0];
    }

    public function registrarIgv($valor, $fecha) {

        $stmt = $this->objPdo->prepare("INSERT INTO igv (valor_igv, fecha_igv) 
                        VALUES(:valor, :fecha)");
        $rows = $stmt->execute(array(
                                    'valor' => $valor,
                                    'fecha' => $fecha,
                                    ));
    }   

    public function actualizarIgv($valor, $descripcion, $id_area){
        $stmt = $this->objPdo->prepare('UPDATE igv set valor_igv = :valor, fecha_igv = :fecha where id_igv = :id_igv');
        $rows = $stmt->execute(array(
                                    'valor' => $valor,
                                    'fecha' => $fecha,
                                    'id_igv' => $id_igv));
    }   





}