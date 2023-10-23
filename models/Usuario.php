<?php
require_once "Conexion.php";

class Usuario extends Conexion{

    private $accesoBD;

    public function __construct()
    {
            $this->accesoBD = parent::getConexion();
    }
    
    public function login($nomusuario = ""){
        try{
            $consulta = $this->accesoBD->prepare("call spu_usuarios_login(?)");
            $consulta->execute(array($nomusuario));

            return $consulta->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

/* MODIFICA LA BASE DE DATOS, NO PUEDE HABER UN ALUMNO SIN USUSARIO, POR LO TANTO PRIMERO CREA AL USUARIO LUEGO AL ALUMNO, 
TAMBIEN LA MATRICULA NO DEBE INCLUIR UN ID ALUMNO, YA QUE PRIMERO DEBE EXISTIR LOA MATRICULA Y LUEGO EL ALUMNO.
SERIA ENTONCES QUE EL ALUMNO TENGAN INCLUIDO EL ID MATRICULA.
 */
}