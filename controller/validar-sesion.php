<?php
/*
 * Script para validar, en cada formulario,
 * que haya una sesion activa, de lo contrario,
 * inciar sesion
 */
session_start();

if(isset($_SESSION['id_persona_sigue'])){
    
}else{
    header("location: index.php?page=login&accion=form");
}

?>