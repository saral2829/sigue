<?php

require_once 'conexion.php';

class Ventas {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

    public function obtenerVentaxDet($suc_id, $total, $emp_reg, $fh_reg, $tipo_venta){
        $stmt=$this->objPdo->prepare("SELECT * FROM ventas v
            WHERE suc_id = :suc_id and total = :total and emp_reg= :emp_reg and fh_reg = :fh_reg and tipo_venta = :tipo_venta ");
        $stmt->execute(array(
                                'suc_id' => $suc_id,
                                'total' => $total,
                                'emp_reg' => $emp_reg,
                                'fh_reg' => $fh_reg,
                                'tipo_venta' => $tipo_venta,
                            ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado[0];
    }

    public function obtenerVentaxId($id){
        $stmt=$this->objPdo->prepare("SELECT *, v.fh_reg as fh_venta FROM ventas v
            INNER JOIN sucursal s on v.suc_id= s.id_sucursal
            INNER JOIN persona p on v.emp_reg = p.id_per
            WHERE v.venta_id = :id ");
        $stmt->execute(array(
                                'id' => $id,
                            ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado[0];
    }

    public function obtenerDetalleVentaxId($id){
        $stmt=$this->objPdo->prepare("SELECT * FROM venta_detalles vd
            INNER JOIN productos p on vd.prod_id = p.idproducto
            WHERE vd.venta_id = :id ");
        $stmt->execute(array(
                                'id' => $id,
                            ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    }

    public function listarventasxFecha($fecha){
        $stmt=$this->objPdo->prepare("SELECT * FROM ventas v
            INNER JOIN sucursal s on v.suc_id = s.id_sucursal
            INNER JOIN persona p on v.emp_reg = p.id_per
            WHERE v.fh_reg::date = :fecha ");
        $stmt->execute(array(
                                'fecha' => $fecha,
                            ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    }

    public function registrarVenta($suc_id, $total, $emp_reg, $fh_reg, $tipo_venta){
        $sentence = $this->objPdo->prepare("INSERT INTO public.ventas(suc_id, total, emp_reg, fh_reg, tipo_venta)
            VALUES (:suc_id, :total, :emp_reg, :fh_reg, :tipo_venta);");
        $resultado = $sentence->execute(array(
                                        'suc_id' => $suc_id,
                                        'total' => $total,
                                        'emp_reg' => $emp_reg,
                                        'fh_reg' => $fh_reg,
                                        'tipo_venta' => $tipo_venta,
                                    ));
        return $resultado;
    }

    public function registrarDetalleVenta($venta_id, $prod_id, $alm_id, $unidad_id, $cantidad, $precio_unitario, $subtotal, $emp_reg, $fh_reg){
        $sentence = $this->objPdo->prepare("INSERT INTO public.venta_detalles(
            venta_id, prod_id, alm_id, unidad_id, cantidad, precio_unitario,
            subtotal, emp_reg, fh_reg)
    VALUES (:venta_id, :prod_id, :alm_id, :unidad_id, :cantidad, :precio_unitario, :subtotal, :emp_reg, :fh_reg);");
        $resultado = $sentence->execute(array(
                                        'venta_id' => $venta_id,
                                        'prod_id' => $prod_id,
                                        'alm_id' => $alm_id,
                                        'unidad_id' => $unidad_id,
                                        'cantidad' => $cantidad,
                                        'precio_unitario' => $precio_unitario,
                                        'subtotal' => $subtotal,
                                        'emp_reg' => $emp_reg,
                                        'fh_reg' => $fh_reg,
                                    ));
        return $resultado;
    }


}
