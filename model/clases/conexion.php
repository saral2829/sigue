<?php

class Conexion extends PDO
{

    private $type = 'pgsql';
    private $host = 'localhost';
    private $port = '5432';
    private $db = 'bd_sigue';
    private $user = 'postgres';
    private $pass = 'sarybell28'; //Cambiar a la que estaba antes

    public function __construct()
    {

        try {
            parent::__construct($this->type . ':host=' . $this->host . ';port=' . $this->port . ';dbname=' . $this->db, $this->user, $this->pass);
            $this->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo 'Ha surgido un error y no se puede conectar a la base de datos. Detalle: ' . $e->getMessage();
            exit;
        }
    }
}
