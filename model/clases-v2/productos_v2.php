<?php 
require_once __DIR__.'/../clases/conexion.php';
class _Productosv2 {
    private $conexion;

    public function __construct() {
        try{
            $this->conexion = new Conexion();
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }

    public function listarProductos(){
        try{
            $resultado = $this->conexion->query("SELECT *, 'Nombre: '||p.nombre_producto||' - Talla: ' as label  FROM productos p
            inner join categorias c on p.idcategoria = c.idcategoria
            inner join persona pe on p.idproveedor = pe.id_per;");

            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
            return $resultado->fetchAll(PDO::FETCH_OBJ);
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
    public function obtenerCaracteristicasProducto($idProducto){
        try{
            $resultado = $this->conexion->query("SELECT *,  c2.nombre_caracteristica as nombre_caract, c1.nombre_caracteristica as valor_caract FROM producto_caracteristica pc
            inner join caracteristicas c1 on pc.idcaracteristica = c1.idcaracteristica
            inner join caracteristicas c2 on c1.caracteristica_padre = c2.idcaracteristica
            where pc.idproducto = $idProducto;");
            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
            return $resultado->fetchAll(PDO::FETCH_OBJ);
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
    public function obtenerUnidadesMedida($idProducto){
        try{
            $resultado = $this->conexion->query("SELECT * from producto_unidadmedida pu inner join unidad_medida u on pu.idunidad = u.id_unidadmedida where pu.idproducto = $idProducto;");
            if(!$resultado){ throw new Exception($this->conexion->errorInfo()[2]); }
            return $resultado->fetchAll(PDO::FETCH_OBJ);
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
    }
}