<?php

require_once 'conexion.php';

class Areas {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

 
        public function listarareas(){
        $stmt=$this->objPdo->prepare('SELECT * from area ;');
        $stmt->execute();
        $lareas = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lareas;
    }

        public function listarareasxId($id){
        $stmt=$this->objPdo->prepare('SELECT * from area where id_area = :id;');
        $stmt->execute(array('id' => $id ));
        $lareas = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lareas[0];
    }

        public function obtenerAreaId($id){
        $stmt=$this->objPdo->prepare('SELECT * from area where id_area = :id;');
        $stmt->execute(array('id' => $id ));
        $lareas = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lareas[0];
    }

    public function registrarArea($nombre, $descripcion) {

        $stmt = $this->objPdo->prepare("INSERT INTO area ( nombre_area, descripcion_area, estado_area) 
                        VALUES(:nombre, :descripcion, '1')");
        $rows = $stmt->execute(array(
                                    'nombre' => $nombre,
                                    'descripcion' => $descripcion,
                                    ));
    }   

    public function actualizarArea($nombre, $descripcion, $id_area){
        $stmt = $this->objPdo->prepare('UPDATE area set nombre_area = :nombre, descripcion_area = :descripcion where id_area = :id_area');
        $rows = $stmt->execute(array(
                                    'nombre' => $nombre,
                                    'descripcion' => $descripcion,
                                    'id_area' => $id_area));
    }   





}