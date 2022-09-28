<?php

require_once 'conexion.php';

class Caracteristicas {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

        public function listarCatarcteristicasPadre(){
        $stmt=$this->objPdo->prepare('SELECT * from caracteristicas where caracteristica_padre is null ;');
        $stmt->execute();
        $lcaracteristicas = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lcaracteristicas;
    }

        public function buscarCaractPrevia($nombre_caracteristica){
        $stmt=$this->objPdo->prepare('SELECT * from caracteristicas c where c.nombre_caracteristica = :nombre_caracteristica ;');
        $stmt->execute(array(
                            'nombre_caracteristica' => $nombre_caracteristica 
                        ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado[0];
    }


        public function listarCatarcteristicasPadreActivo(){
        $stmt=$this->objPdo->prepare("SELECT * from caracteristicas where caracteristica_padre is null and estado = '1' ;");
        $stmt->execute();
        $lcaracteristicas = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lcaracteristicas;
    }    

        public function listarReferenciasProveedor(){
        $stmt=$this->objPdo->prepare("SELECT * from caracteristicas c where c.caracteristica_padre = (select c2.idcaracteristica from caracteristicas c2 where ref_proveedor = '1' )");
        $stmt->execute();
        $lvalores = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lvalores;
    }

        public function listarValoresIdCateristica($id){
        $stmt=$this->objPdo->prepare('SELECT * from caracteristicas c where c.caracteristica_padre = :id ;');
        $stmt->execute(array('id' => $id));
        $lvalores = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lvalores;
    }
        public function obtenerCaracteristicaId($id){
        $stmt=$this->objPdo->prepare('SELECT * from caracteristicas c where c.idcaracteristica = :id ;');
        $stmt->execute(array('id' => $id));
        $caract = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $caract[0];
    }

    public function registrarCaracteristica($nombre_caracteristica, $tipo_caracteristica, $caracteristica_padre, $estado, $referencia){

        $stmt = $this->objPdo->prepare("INSERT INTO public.caracteristicas(
            nombre_caracteristica, tipo_caracteristica, caracteristica_padre, estado, ref_proveedor) VALUES (:nombre_caracteristica, :tipo_caracteristica, :caracteristica_padre, :estado, :referencia)");
        $rows = $stmt->execute(array(
                                    'nombre_caracteristica' => $nombre_caracteristica,
                                    'tipo_caracteristica' => $tipo_caracteristica,
                                    'caracteristica_padre' => $caracteristica_padre,
                                    'estado' => $estado,
                                    'referencia' => $referencia,                                         
                                    ));
    }  

    public function actualizarCaracteristica($nombre_caracteristica, $tipo_caracteristica, $caracteristica_padre, $estado, $referencia, $id){

        $stmt = $this->objPdo->prepare("UPDATE public.caracteristicas SET nombre_caracteristica= :nombre_caracteristica, tipo_caracteristica= :tipo_caracteristica, caracteristica_padre= :caracteristica_padre, estado= :estado, ref_proveedor = :referencia WHERE  idcaracteristica = :id;");
        $rows = $stmt->execute(array(
                                    'nombre_caracteristica' => $nombre_caracteristica,
                                    'tipo_caracteristica' => $tipo_caracteristica,
                                    'caracteristica_padre' => $caracteristica_padre,
                                    'estado' => $estado,
                                    'referencia' => $referencia,
                                    'id' => $id,
                                    ));
    }


    public function resetarTodasReferencias(){

        $stmt = $this->objPdo->prepare("UPDATE public.caracteristicas SET ref_proveedor= '0'");
        $rows = $stmt->execute();
    }



}    