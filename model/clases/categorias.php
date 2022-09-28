<?php

require_once 'conexion.php';

class Categorias {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

        public function listarcategorias(){
        $stmt=$this->objPdo->prepare('SELECT * from categorias order by idcategoria ;');
        $stmt->execute();
        $lproductos = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproductos;
    }

        public function obtenerCategoriaId($id){
        $stmt=$this->objPdo->prepare('SELECT * from categorias where idcategoria = :id;');
        $stmt->execute(array('id' => $id ));
        $ocategoria = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $ocategoria[0];
    }

        public function listarCategoriasHijo($id){
        $stmt=$this->objPdo->prepare("SELECT idcategoria as id, nombre_categoria as title, 'true' as folder,  'true' as lazy, nombre_categoria as nombre, descripcion_categoria as descripcion, vigencia_categoria as vigencia, * from categorias where categoria_padre = :id;");
        $stmt->execute(array('id' => $id ));
        $lproductos = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproductos;
    }

    public function registrarCategoria($nombre_categoria, $descripcion_categoria, $vigencia_categoria, $categoria_padre) {

        $stmt = $this->objPdo->prepare("INSERT INTO categorias ( nombre_categoria, descripcion_categoria, vigencia_categoria, categoria_padre ) 
                        VALUES(:nombre_categoria, :descripcion_categoria, :vigencia_categoria, :categoria_padre)");
        $rows = $stmt->execute(array(
                                    'nombre_categoria' => $nombre_categoria,
                                    'descripcion_categoria' => $descripcion_categoria,
                                    'vigencia_categoria' => $vigencia_categoria,
                                    'categoria_padre' => $categoria_padre,                                         
                                    ));
    }  

    public function actualizarCategoria($nombre_categoria, $descripcion_categoria, $vigencia_categoria, $categoria_padre, $id){

        $stmt = $this->objPdo->prepare("UPDATE public.categorias
   SET nombre_categoria= :nombre_categoria, descripcion_categoria= :descripcion_categoria, vigencia_categoria= :vigencia_categoria, categoria_padre= :categoria_padre WHERE idcategoria = :id;");
        $rows = $stmt->execute(array(
                                    'nombre_categoria' => $nombre_categoria,
                                    'descripcion_categoria' => $descripcion_categoria,
                                    'vigencia_categoria' => $vigencia_categoria,
                                    'categoria_padre' => $categoria_padre,
                                    'id' => $id,                                    
                                    ));
    } 



}