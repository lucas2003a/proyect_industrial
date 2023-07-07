<?php
require_once "Conexion.php";

class Estadosalud extends Conexion{

    private $accesoBD;
    
    public function __construct()
    {
        $this->accesoBD = parent::getConexion();
    }

    public function Listarestado($idmatricula = 0){
        try{
            $consulta = $this->accesoBD->prepare("spu_obtenerestadosalud(?)");
            $consulta->execute(array($idmatricula));
        }

        catch(Exception $e){
            die($e->getMessage());
        }
    }
}