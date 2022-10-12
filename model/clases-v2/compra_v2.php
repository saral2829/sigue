<?php 
require_once __DIR__.'/../clases/conexion.php';
class Comprav2 {
    private $conexion;

    public function __construct() {
        try{
            $this->conexion = new Conexion();
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }

    public function registrarCompra($productos,$idAlmacen,$idSucursal,$emp_reg){
        try{
            $this->conexion->beginTransaction();
            $resultado = $this->conexion->query("INSERT INTO compras(suc_id,emp_reg,fh_reg) values($idSucursal,$emp_reg,now()) RETURNING comp_id");
            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
            $idCompra = $resultado->fetch(PDO::FETCH_OBJ)->comp_id;
            $this->registrarProductos($productos,$idCompra,$emp_reg,$idAlmacen);
            $this->conexion->commit();
            return true;
        }catch(Exception $e){
            $this->conexion->rollBack();
            throw new Exception($e->getMessage());
        }
    }
    public function registrarProductos($productos,$idCompra,$emp_reg,$idAlmacen){
        try{
            foreach($productos as $producto){
                $this->registrarCompraDetalle($producto,$idCompra,$emp_reg);
                $respuestaProductoAlmacen = $this->buscarProductoEnAlmacen($producto->idproducto,$idAlmacen);
                if($respuestaProductoAlmacen['ok']){
                    //! si ok es true, es porque existe y podemos modificar la cantidad
                    $this->sumarCantidadCompra($producto,$idAlmacen);
                }else{
                    //! si ok es falso es porque no existe y tenemos que crearlo
                    $this->registrarCompraAlmacen($producto,$idAlmacen,$emp_reg);
                }
            }
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
    public function registrarCompraDetalle($producto,$idCompra,$emp_reg){
        try{
            $resultado = $this->conexion->query("INSERT INTO public.compras_det(
                    comp_id, prod_id, prov_id, uni_id, cantidad, emp_reg, fh_reg)
                    VALUES ($idCompra, $producto->idproducto, $producto->idproveedor, $producto->idunidadproducto, $producto->cantidadAgregar, $emp_reg, now());");
            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
    public function buscarProductoEnAlmacen($idproducto,$idAlmacen){
        try{
            $resultado = $this->conexion->query("SELECT * FROM almacen_productos a WHERE a.prod_id = $idproducto AND a.alm_id = $idAlmacen;");
            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
            $productos = $resultado->fetchAll(PDO::FETCH_OBJ);
            if(count($productos) > 0){
                return ["ok" => true, "producto" => $productos[0]]; 
            }
            return ["ok" => false ];
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
    public function registrarCompraAlmacen($producto,$idAlmacen,$emp_reg){
        try{
            $resultado = $this->conexion->query("INSERT INTO public.almacen_productos(
                    alm_id,
                    prod_id,
                    cantidad, 
                    stock_max, stock_min, precio_compra, precio_venta, unidad_principal, emp_reg, fh_reg) 
                    VALUES ($idAlmacen, $producto->idproducto, $producto->cantidadAgregar, null, null, null, null, $producto->idunidadproducto, $emp_reg, now());");
            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
    public function sumarCantidadCompra($producto,$idAlmacen){
        try{
            $resultado = $this->conexion->query("UPDATE public.almacen_productos 
                SET cantidad= cantidad + $producto->cantidadAgregar
                WHERE alm_id=$idAlmacen and prod_id=$producto->idproducto;");
            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
        
    }
}