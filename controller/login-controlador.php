<?php

session_start();
/*
 * Script para validar el inicio de sesion
 * 
 */
require 'model/clases/usuarios.php';
require 'model/clases/almacenes.php';
require 'model/clases/sucursales.php';
require_once 'class.inputfilter.php';

//include 'controller/validar-sesion.php';

function _formAction(){

    unset($_SESSION['id_persona_sigue']);    
    unset($_SESSION['idperfil_per_sigue']);
    unset($_SESSION['usuario']);

    // $sucursales = new Sucursales();

    // $lsucursales = $sucursales->listarsucursales();

    require 'login.php';
}



function _loginAction() {
    $filter = new InputFilter();

    $dni = $filter->process($_POST["dni"]);
    $pass = $filter->process($_POST["pass"]);

    $usuarios = new Usuarios();
    $usuario = $usuarios->validarUsuario($dni, $pass);

    if ($usuario) {

        $_SESSION['id_persona_sigue'] = $usuario->id_per; // Guarda nombre de usuario
        $_SESSION['idperfil_per_sigue'] = $usuario->perfil_id_per ;
        $_SESSION['usuario'] = $usuario->nombres_per;
        $_SESSION['suc_id'] = $usuario->per_suc_id;
        $_SESSION['razonsoc_suc'] = $usuario->razonsoc_suc;
        // $_SESSION['perfil'] = $usuario->perfil_desc_hosp ;

        header("location: index.php");
    } else {
        header("location: index.php?page=login&accion=form");
    }
}

function _cerrarAction() {
    // if (isset($_SESSION['id_persona_sigue'])) {


        unset($_SESSION['id_persona_sigue']);
        unset($_SESSION['idperfil_per_sigue']);
        unset($_SESSION['usuario']);
        
        header("location: index.php?page=login&accion=form");
        die;
    // }
}

?>