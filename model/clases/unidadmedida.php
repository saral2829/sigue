<?php

require_once 'conexion.php';

class Unidades {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

 
    public function listarUnidades(){
        $stmt=$this->objPdo->prepare('SELECT * from unidad_medida u ;');
        $stmt->execute();
        $lsucursales = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lsucursales;
    }

    public function listarUnidadesProducto($producto){
        $stmt=$this->objPdo->prepare('SELECT * from producto_unidadmedida pu inner join unidad_medida u on pu.idunidad = u.id_unidadmedida where pu.idproducto = :producto ;');
        $stmt->execute(array('producto' => $producto ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    }
    public function obtenerUnidadMedidaId($id_unidadmedida){
        $stmt=$this->objPdo->prepare('SELECT * from unidad_medida u where u.id_unidadmedida = :id_unidadmedida ;');
        $stmt->execute(array('id_unidadmedida' => $id_unidadmedida ));
        $unidad = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $unidad[0];
    }

    public function registrarUnidadMedida($unidadmed_ume, $abreviatura_ume, $vigencia_ume){
        $stmt = $this->objPdo->prepare("INSERT INTO public.unidad_medida( unidadmed_ume, abreviatura_ume, vigencia_ume) VALUES (:unidadmed_ume, :abreviatura_ume, :vigencia_ume);");
        $rows = $stmt->execute(array(
                                    'unidadmed_ume' => $unidadmed_ume,
                                    'abreviatura_ume' => $abreviatura_ume,
                                    'vigencia_ume' => $vigencia_ume,                                       
                                    ));
    } 


    public function actualizarUnidadMedida($unidadmed_ume, $abreviatura_ume, $vigencia_ume, $id_unidadmedida){
        $stmt = $this->objPdo->prepare("UPDATE public.unidad_medida SET  unidadmed_ume= :unidadmed_ume, abreviatura_ume= :abreviatura_ume, vigencia_ume= :vigencia_ume WHERE id_unidadmedida = :id_unidadmedida;");
        $rows = $stmt->execute(array(
                                    'unidadmed_ume' => $unidadmed_ume,
                                    'abreviatura_ume' => $abreviatura_ume,
                                    'vigencia_ume' => $vigencia_ume,
                                    'id_unidadmedida' => $id_unidadmedida,                                      
                                    ));
    } 


}