<?php

require_once 'conexion.php';

class Almacenes {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }

    public function listar(){
        $stmt=$this->objPdo->prepare("SELECT * FROM almacenes ;");
        $stmt->execute();
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    } 

    public function listarxSuc($suc){
        $stmt=$this->objPdo->prepare("SELECT * FROM almacenes a WHERE a.suc_id = :suc ;");
        $stmt->execute(array(
                                'suc' => $suc ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    } 
    public function obtenerxProducto($prod_id){
        $stmt=$this->objPdo->prepare("SELECT * FROM almacen_productos a WHERE a.prod_id = :prod_id");
        $stmt->execute(array(
                                'prod_id' => $prod_id ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado[0];
    }


    public function buscarProductoCaracTerm($term, $carac, $almacen){
        $stmt=$this->objPdo->prepare("SELECT * FROM producto_caracteristica pc 
            INNER JOIN productos p on pc.idproducto = p.idproducto
            INNER JOIN caracteristicas c on pc.idcaracteristica = c.idcaracteristica
            INNER JOIN almacen_productos ap on pc.idproducto = ap.prod_id
            INNER JOIN almacenes a on ap.alm_id = a.alm_id
            INNER JOIN persona per on p.idproveedor = per.id_per
            WHERE pc.idcaracteristica = :carac and p.nombre_producto ilike :term and a.alm_id = :almacen");
        $stmt->execute(array(
                                'carac' => $carac,
                                'term' => $term,
                                'almacen' => $almacen
                            ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    }

    public function buscarProdxTermAlm($term, $almacen){
        $stmt=$this->objPdo->prepare("SELECT * FROM almacen_productos ap
            INNER JOIN productos p on ap.prod_id = p.idproducto
            INNER JOIN almacenes a on ap.alm_id = a.alm_id
            INNER JOIN persona per on p.idproveedor = per.id_per
            WHERE p.nombre_producto ilike :term and a.alm_id = :almacen");
        $stmt->execute(array(
                                'term' => $term,
                                'almacen' => $almacen
                            ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    }


    public function buscarProdxTermSuc($term, $suc_id){
        $stmt=$this->objPdo->prepare("SELECT * FROM almacen_productos ap
            INNER JOIN productos p on ap.prod_id = p.idproducto
            INNER JOIN almacenes a on ap.alm_id = a.alm_id
            INNER JOIN persona per on p.idproveedor = per.id_per
            WHERE p.nombre_producto ilike :term and a.suc_id = :suc_id");
        $stmt->execute(array(
                                'term' => $term,
                                'suc_id' => $suc_id
                            ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    }

    public function obtenerProdxAlmProId($alm_id, $prod_id){
        $stmt=$this->objPdo->prepare("SELECT * FROM almacen_productos ap
            INNER JOIN productos p on ap.prod_id = p.idproducto
            INNER JOIN almacenes a on ap.alm_id = a.alm_id
            INNER JOIN persona per on p.idproveedor = per.id_per
            WHERE ap.alm_id = :alm_id  and ap.prod_id = :prod_id");
        $stmt->execute(array(
                                'prod_id' => $prod_id,
                                'alm_id' => $alm_id
                            ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        // echo var_dump($resultado);die();
        return $resultado[0];
    }
    
    public function productoalmcodigobar($code_bar){
        $stmt=$this->objPdo->prepare("SELECT * FROM almacen_productos ap
            INNER JOIN productos p on ap.prod_id = p.idproducto
            INNER JOIN almacenes a on ap.alm_id = a.alm_id
            INNER JOIN persona per on p.idproveedor = per.id_per
            WHERE p.code_bar = :code_bar");
        $stmt->execute(array(
                                'code_bar' => $code_bar,
                            ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado[0];
    }

    public function registrarComprasAlmacen($alm_id, $prod_id, $cantidad, $stock_min, $stock_max, $precio_compra, $precio_venta, $unidad_principal, $emp_reg, $fh_reg){
        $sentence = $this->objPdo->prepare("INSERT INTO public.almacen_productos(
             alm_id, prod_id, cantidad, stock_max, stock_min, precio_compra, precio_venta, unidad_principal, emp_reg, fh_reg) VALUES (:alm_id, :prod_id, :cantidad, :stock_min, :stock_max, :precio_compra, :precio_venta, :unidad_principal, :emp_reg, :fh_reg);");
        $resultado = $sentence->execute(array(
                                            'alm_id' => $alm_id,
                                            'prod_id' => $prod_id,
                                            'cantidad' => $cantidad,
                                            'stock_min' => $stock_min,
                                            'stock_max' => $stock_max,
                                            'precio_compra' => $precio_compra,
                                            'precio_venta' => $precio_venta,
                                            'unidad_principal' => $unidad_principal,
                                            'emp_reg' => $emp_reg,
                                            'fh_reg' => $fh_reg,
                                        ));
        return $resultado;
    }

    public function sumarCantidadProdAlmacen($alm_id, $prod_id, $cantidad){
        $sentence = $this->objPdo->prepare("UPDATE public.almacen_productos 
            SET cantidad= cantidad + :cantidad
            WHERE alm_id=:alm_id and prod_id=:prod_id;");
        $resultado = $sentence->execute(array(
                                            'alm_id' => $alm_id,
                                            'prod_id' => $prod_id,
                                            'cantidad' => $cantidad,
                                        ));
        return $resultado;
    }

    public function restarCantidadProdAlmacen($alm_id, $prod_id, $cantidad){
        $sentence = $this->objPdo->prepare("UPDATE public.almacen_productos 
            SET cantidad= cantidad - :cantidad
            WHERE alm_id=:alm_id and prod_id=:prod_id;");
        $resultado = $sentence->execute(array(
                                            'alm_id' => $alm_id,
                                            'prod_id' => $prod_id,
                                            'cantidad' => $cantidad,
                                        ));
        return $resultado;
    }


    public function actualizarPrecioVentaxProdAlm($alm_id, $prod_id, $precio){
        $sentence = $this->objPdo->prepare("UPDATE public.almacen_productos 
            SET precio_venta= :precio
            WHERE alm_id=:alm_id and prod_id=:prod_id;");
        $resultado = $sentence->execute(array(
                                            'alm_id' => $alm_id,
                                            'prod_id' => $prod_id,
                                            'precio' => $precio,
                                        ));
        return $resultado;
    }

    public function actualizarcantidadxProdAlm($alm_id, $prod_id, $cantidad){
        $sentence = $this->objPdo->prepare("UPDATE public.almacen_productos 
            SET cantidad= :cantidad
            WHERE alm_id=:alm_id and prod_id=:prod_id;");
        $resultado = $sentence->execute(array(
                                            'alm_id' => $alm_id,
                                            'prod_id' => $prod_id,
                                            'cantidad' => $cantidad,
                                        ));
        return $resultado;
    }

}