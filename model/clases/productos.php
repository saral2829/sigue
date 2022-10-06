<?php

require_once 'conexion.php';

class Productos {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion();
    }
 
        public function listarproductos(){
        $stmt=$this->objPdo->prepare('SELECT * from productos p 
            inner join categorias c on p.idcategoria = c.idcategoria 
            inner join persona pr on p.idproveedor = pr.id_per
            ;');
        $stmt->execute();
        $lproductos = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproductos;
    }


        public function producotId($idproducto){
        $stmt=$this->objPdo->prepare('SELECT * from productos pr 
                                inner join persona p on pr.idproveedor= p.id_per
                                where pr.idproducto = :idproducto');
        $stmt->execute(array('idproducto' => $idproducto ));
        $lproductos = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproductos[0];
    }  

        public function obtenerCaractProducto($id){
        $stmt=$this->objPdo->prepare('SELECT c1.idcaracteristica as id_caracteristica_padre, c1.nombre_caracteristica as caracteristica_padre, c.idcaracteristica as idvalor  ,c.nombre_caracteristica as valor from producto_caracteristica pc
            inner join productos p on pc.idproducto = p.idproducto
            inner join caracteristicas c on pc.idcaracteristica = c.idcaracteristica
            inner join caracteristicas c1 on c.caracteristica_padre = c1.idcaracteristica
            where p.idproducto =:id
            ;');
        $stmt->execute(array('id' => $id ));
        $lproductos = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproductos;
    }

        public function obtenerUnidProducto($id){
        $stmt=$this->objPdo->prepare('SELECT * from producto_unidadmedida pu 
                                    inner join unidad_medida u on u.id_unidadmedida = pu.idunidad
                                    inner join productos p on pu.idproducto = p.idproducto
                                    where pu.idproducto = :id ;');
        $stmt->execute(array('id' => $id ));
        $lproductos = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproductos;
    }


        public function obtenerUnidadProducto($id){
        $stmt=$this->objPdo->prepare('SELECT * from producto_unidadmedida pu 
            inner join productos p on pu.idproducto = p.idproducto
            inner join unidad_medida u on pu.idunidad = u.id_unidadmedida
            where pu.idproducto =:id
            ;');
        $stmt->execute(array('id' => $id ));
        $lproductos = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproductos;
    }


        public function buscarProductoUnidad($id, $idunidad){
        $stmt=$this->objPdo->prepare('SELECT * from producto_unidadmedida pu 
            inner join productos p on pu.idproducto = p.idproducto
            inner join unidad_medida u on pu.idunidad = u.id_unidadmedida
            where pu.idproducto =:id and pu.idunidad = :idunidad
            ;');
        $stmt->execute(array('id' => $id, 'idunidad' => $idunidad,));
        $oproductoUnidad = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $oproductoUnidad[0];
    }

    public function actualizarProducto($nombre_producto, $idcategoria, $idproveedor, $estado, $user_reg, $fh_reg, $id){

        $stmt = $this->objPdo->prepare("UPDATE public.productos
   SET nombre_producto= :nombre_producto, idcategoria= :idcategoria, idproveedor= :idproveedor, estado= :estado, user_reg = :user_reg, fh_reg = :fh_reg WHERE idproducto = :id;");
        $rows = $stmt->execute(array(
                                    'nombre_producto' => $nombre_producto,
                                    'idcategoria' => $idcategoria,
                                    'idproveedor' => $idproveedor,
                                    'estado' => $estado,
                                    'user_reg' => $user_reg,
                                    'fh_reg' => $fh_reg,
                                    'id' => $id,                                    
                                    ));
    } 


        public function obtenerProductosId($id){
        $stmt=$this->objPdo->prepare('SELECT * from productos p 
            inner join categorias c on p.idcategoria = c.idcategoria 
            inner join persona pr on p.idproveedor = pr.id_per where p.idproducto = :id;');
        $stmt->execute(array('id' => $id ));
        $oproducto = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $oproducto[0];
    }

        public function obtenerProductoReg($nombre_producto, $idcategoria, $idproveedor, $estado, $user_reg, $fh_reg){
        $stmt=$this->objPdo->prepare('SELECT * from productos p where p.nombre_producto = :nombre_producto and p.idcategoria = :idcategoria and p.idproveedor = :idproveedor and estado = :estado and user_reg = :user_reg and fh_reg = :fh_reg            
            ;');
        $stmt->execute(array(
                            'nombre_producto' => $nombre_producto,
                            'idcategoria' => $idcategoria,
                            'idproveedor' => $idproveedor,
                            'estado' => $estado,
                            'user_reg' => $user_reg,
                            'fh_reg' => $fh_reg,
                                    ));
        $oproducto = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $oproducto[0];
    }
    public function registrarProducto($nombre_producto, $idcategoria, $idproveedor, $estado, $user_reg, $fh_reg){

        $stmt = $this->objPdo->prepare("INSERT INTO public.productos(nombre_producto, idcategoria, idproveedor, estado,  user_reg, fh_reg) VALUES (:nombre_producto, :idcategoria, :idproveedor, :estado, :user_reg, :fh_reg);");
        $rows = $stmt->execute(array(
                                    'nombre_producto' => $nombre_producto,
                                    'idcategoria' => $idcategoria,
                                    'idproveedor' => $idproveedor,
                                    'estado' => $estado,
                                    'user_reg' => $user_reg,
                                    'fh_reg' => $fh_reg,
                                    ));
    } 

    public function actualizarProducto2($nombre_producto, $idcategoria, $idproveedor, $estado, $user_reg, $fh_reg, $id){

        $stmt = $this->objPdo->prepare("UPDATE public.productos SET nombre_producto= :nombre_producto, idcategoria= :idcategoria, idproveedor= :idproveedor, estado= :estado, user_reg= :user_reg, fh_reg= :fh_reg WHERE idproducto = :id);");
        $rows = $stmt->execute(array(
                                    'nombre_producto' => $nombre_producto,
                                    'idcategoria' => $idcategoria,
                                    'idproveedor' => $idproveedor,
                                    'estado' => $estado,
                                    'user_reg' => $user_reg,
                                    'fh_reg' => $fh_reg,
                                    'id' => $id,
                                    ));
    }


   //  public function actualizarProducto($nombre_producto, $idcategoria, $idproveedor, $estado, $user_reg, $fh_reg, $id){

   //      $stmt = $this->objPdo->prepare("UPDATE public.productos
   // SET nombre_producto= :nombre_producto, idcategoria= :idcategoria, idproveedor= :idproveedor, estado= :estado, user_reg = :user_reg, fh_reg = :fh_reg WHERE idproducto = :id;");
   //      $rows = $stmt->execute(array(
   //                                  'nombre_producto' => $nombre_producto,
   //                                  'idcategoria' => $idcategoria,
   //                                  'idproveedor' => $idproveedor,
   //                                  'estado' => $estado,
   //                                  'user_reg' => $user_reg,
   //                                  'fh_reg' => $fh_reg,
   //                                  'id' => $id,                                    
   //                                  ));
   //  } 


    public function registrarProductoCaracteristica($idproducto, $idcaracteristica){

        $stmt = $this->objPdo->prepare("INSERT INTO public.producto_caracteristica(idproducto, idcaracteristica) VALUES (:idproducto, :idcaracteristica);");
        $rows = $stmt->execute(array(
                                    'idproducto' => $idproducto,
                                    'idcaracteristica' => $idcaracteristica,
                                    ));
    } 


    public function registrarProductoUnidad($idproducto, $idunidad){

        $stmt = $this->objPdo->prepare("INSERT INTO public.producto_unidadmedida(idproducto, idunidad) VALUES (:idproducto, :idunidad);");
        $rows = $stmt->execute(array(
                                    'idproducto' => $idproducto,
                                    'idunidad' => $idunidad,
                                    ));
    } 




    public function eliminarProductoCaractIdProducto($id){

        $stmt = $this->objPdo->prepare("DELETE from public.producto_caracteristica where idproducto = :id;");
        $rows = $stmt->execute(array('id' => $id));
    } 



//busquedas 

    public function buscarProductosTerm($term){
        $stmt=$this->objPdo->prepare("SELECT *, 'Nombre: '||p.nombre_producto||' - Talla: ' as label  FROM productos p inner join categorias c on p.idcategoria = c.idcategoria inner join persona pe on p.idproveedor = pe.id_per where p.nombre_producto ILIKE  :term ;");
        $stmt->execute(array('term' => $term ));
        $lproducto = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproducto;
    }

    public function buscarProductosTermRemote($term){
        $stmt=$this->objPdo->prepare("SELECT *, p.idproducto as id, p.nombre_producto as full_name, p.nombre_producto as name  FROM productos p where p.nombre_producto ILIKE  :term ;");
        $stmt->execute(array('term' => $term ));
        $lproducto = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproducto;
    }

    public function buscarProductoNombre($term){
        $stmt=$this->objPdo->prepare("SELECT * FROM productos p where p.nombre_producto = :term ;");
        $stmt->execute(array('term' => $term ));
        $lproducto = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproducto;
    }
    public function buscarProductoIdProducto($producto, $proveedor){
        $stmt=$this->objPdo->prepare("SELECT * FROM productos p where p.idproveedor = :proveedor and p.nombre_producto = :producto ;");
        $stmt->execute(array(
                                'producto' => $producto,
                                'proveedor' => $proveedor,
                            ));
        $lproducto = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproducto;
    }
    public function buscarProductoCaracteristicacaId($producto, $caracteristica){
        $stmt=$this->objPdo->prepare("SELECT * FROM producto_caracteristica pc inner join productos p on pc.idproducto = p.idproducto where p.nombre_producto = :producto and pc.idcaracteristica = :caracteristica ;");
        $stmt->execute(array(
                                'producto' => $producto,
                                'caracteristica' => $caracteristica,
                            ));
        $lproducto = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproducto;
    }

    public function buscarProductoCaracteristicacaIdGrupo($producto, $caracteristica){
        $stmt=$this->objPdo->prepare("SELECT * FROM producto_caracteristica pc inner join productos p on pc.idproducto = p.idproducto where p.nombre_producto = :producto and pc.idcaracteristica in ($caracteristica) ;");
        $stmt->execute(array(
                                'producto' => $producto,
                            ));
        $lproducto = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $lproducto;
    }


    public function obtenerProductoCaracteristicas($producto){
        $stmt=$this->objPdo->prepare("SELECT *,  c2.nombre_caracteristica as nombre_caract, c1.nombre_caracteristica as valor_caract FROM producto_caracteristica pc 
            inner join caracteristicas c1 on pc.idcaracteristica = c1.idcaracteristica
            inner join caracteristicas c2 on c1.caracteristica_padre = c2.idcaracteristica
            where pc.idproducto = :producto ;");
        $stmt->execute(array(
                                'producto' => $producto,
                            ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    }


    public function obtenerProductoUnidades($producto){
        $stmt=$this->objPdo->prepare("SELECT * from producto_unidadmedida pu 
            inner join unidad_medida u on pu.idunidad = u.id_unidadmedida
            where pu.idproducto = :producto ;");
        $stmt->execute(array(
                                'producto' => $producto,
                            ));
        $resultado = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $resultado;
    }


}