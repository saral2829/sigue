<?php

require_once 'conexion.php';

class Menu {

    private $objPdo;

    public function __construct() {

        $this->objPdo = new Conexion(1);
    }

 
        public function getmenuxperfil($perfil){
        $stmt=$this->objPdo->prepare('
            SELECT *, (select i.icono_descr from iconos i where i.id_icono=m.id_icono  ) as icono FROM menu_perfil mp
            inner join menu m on mp.id_menu = m.id_menu 
            where mp.id_perfil = :perfil order by m.orden asc ;');
        $stmt->execute(array('perfil' =>$perfil));
        $menunav = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $menunav;
    }


}