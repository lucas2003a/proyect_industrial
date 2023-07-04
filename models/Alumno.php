<?php
require_once "Conexion.php";

class ALumno extends Conexion{

    private $accesoBD;

    public function __construct()
    {
        $this->accesoBD = parent::getConexion();
    }

    public function Obteneralumno($idusuario = 0){
        try{
            $consulta = $this->accesoBD->prepare("CALL spu_obtener_alumno(?)");
            $consulta->execute(array($idusuario));
            return $consulta->fetch(PDO::FETCH_ASSOC);
        }

        catch(Exception $e){
            die($e->getMessage());
        }
    }
}