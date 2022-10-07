<?php

require_once 'conexion.php';

class Compras {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

    public function buscarPedidoxcontenido($id_proveedor, $sucursal, $emp_reg, $fh_reg){
     $sentence=$this->objPdo->prepare("SELECT * FROM pedido_compras pc
         WHERE pc.idproveedor = :id_proveedor and pc.suc_id = :sucursal and pc.emp_reg = :emp_reg and fh_reg = :fh_reg;");
     $sentence->execute(array(
                                'id_proveedor' => $id_proveedor,
                                'sucursal' => $sucursal,
                                'emp_reg' => $emp_reg,
                                'fh_reg' => $fh_reg,
                            ));
     $resultado = $sentence->fetchAll(PDO::FETCH_OBJ);
     return $resultado[0];
    }

    public function buscarPedidoEstadoTerm($term){
        $sentence=$this->objPdo->prepare("SELECT * FROM pedido_compras pc 
            INNER JOIN persona pe on pc.idproveedor = pe.id_per
            INNER JOIN sucursal s on pc.suc_id = s.id_sucursal
            WHERE pc.pec_id::CHARACTER VARYING ilike :term or pe.razonsoc_per ilike :term;");
        $sentence->execute(array(
                                 'term' => $term,
        ));
        $resultado = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    }

    public function buscarPedidoDetTem($term){
        $sentence=$this->objPdo->prepare("SELECT pc.pec_id, s.razonsoc_suc, pe.razonsoc_per, pc.fh_reg  FROM pedido_compras pc 
            INNER JOIN pedido_compra_det pcd on pc.pec_id = pcd.id_pedido
            INNER JOIN productos p on pcd.id_producto = p.idproducto
            INNER JOIN sucursal s on pc.suc_id = s.id_sucursal
            INNER JOIN persona pe on pc.idproveedor = pe.id_per
            WHERE p.nombre_producto ilike :term
            GROUP BY pc.pec_id, s.razonsoc_suc, pe.razonsoc_per, pc.fh_reg;");
        $sentence->execute(array(
                            'term' => $term,
        ));
        $resultado = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    }

    public function obtenerIdCompra($suc_id, $emp_reg, $fh_reg){
        $sentence=$this->objPdo->prepare("SELECT * FROM compras WHERE suc_id = :suc_id and emp_reg = :emp_reg and fh_reg = :fh_reg ;");
        $sentence->execute(array(
                                    'suc_id' => $suc_id,
                                    'emp_reg' => $emp_reg,
                                    'fh_reg' => $fh_reg,
                                ));
        $resultado = $sentence->fetchAll(PDO::FETCH_OBJ);
        return $resultado[0]->comp_id;
    }

    public function registrarPedido($id_proveedor, $sucursal, $emp_reg, $fh_reg){
     $sentence = $this->objPdo->prepare("INSERT INTO public.pedido_compras(
        suc_id, emp_reg, fh_reg, idproveedor) VALUES (:sucursal, :emp_reg,:fh_reg, :id_proveedor);");
     $resultado = $sentence->execute(array(
                                 'id_proveedor' => $id_proveedor,
                                 'sucursal' => $sucursal,
                                 'emp_reg' => $emp_reg,
                                 'fh_reg' => $fh_reg,
                                 ));
     return $resultado;
    }


    public function registrarCompra($suc_id, $emp_reg, $fh_reg){
        $sentence = $this->objPdo->prepare("INSERT INTO public.compras(
                suc_id, emp_reg, fh_reg)
                VALUES (:suc_id, :emp_reg, :fh_reg);");
        $resultado = $sentence->execute(array(
                                             'suc_id' => $suc_id,
                                             'emp_reg' => $emp_reg,
                                             'fh_reg' => $fh_reg,
                                     ));
        return $resultado;
    }

    public function registrarCompraDetalle($comp_id, $prod_id, $prov_id, $uni_id, $cantidad, $emp_reg, $fh_reg){
        $sentence = $this->objPdo->prepare("INSERT INTO public.compras_det(
            comp_id, prod_id, prov_id, uni_id, cantidad, emp_reg, fh_reg)
            VALUES (:comp_id, :prod_id, :prov_id, :uni_id, :cantidad, :emp_reg, :fh_reg);");
        $resultado = $sentence->execute(array(
                                             'comp_id' => $comp_id,
                                             'prod_id' => $prod_id,
                                             'prov_id' => $prov_id,
                                             'uni_id' => $uni_id,
                                             'cantidad' => $cantidad,
                                             'emp_reg' => $emp_reg,
                                             'fh_reg' => $fh_reg,
                                     ));
        return $resultado;
    }

}
