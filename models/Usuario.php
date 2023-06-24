<?php

require_once "Conexion.php";

class Usuario extends Conexion{

    private $accesoBD;

    public function __construct()
    {
            $this->accesoBD = parent::getConexion();
    }
    
    public function iniciarSesion($nomusuario = ""){
        try{
            $consulta = $this->accesoBD->prepare("CALL spu_usuarios_login(?)");
            $consulta->execute(array($nomusuario));

            return $consulta->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}