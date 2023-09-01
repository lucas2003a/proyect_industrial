<?php

require_once "Conexion.php";

class Horario extends Conexion{

    private $accesoBD;

    public function __construct()
    {
        $this->accesoBD = parent::getConexion();
    }

    public function ObtenerHorarios($idseccion,$dia){

        try{

            $consulta = $this->accesoBD->prepare("CALL spu_obtener_horarios(?,?)");
            $consulta->execute(array($idseccion,$dia));

            return $consulta->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}