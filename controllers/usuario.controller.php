<?php
session_start();

require_once "../models/Usuario.php";

if(isset($_POST['operacion'])){

    $usuario = new Usuario();

    if($_POST['operacion'] == 'login'){
        
        $registro = $usuario->iniciarSesion($_POST['nomusuario']);
        $_SESSION["login"] = false;
        $resultado = [
            "status" => false,
            "mensaje" => ""
        ];

        if($registro){

            $claveEncriptada = $registro["claveacceso"];

            if(password_verify($_POST['claveingresada'],$claveEncriptada)){
                $resultado["status"] = true;
                $resultado["mensaje"] = "Bienvenido al sistema";
            }else{
                $resultado["mensaje"] = "La contraseña no existe";
            }
        }else{
            $resultado["mensaje"] = "No existe el usuario";
        }

        echo json_encode($resultado);
    }
}

if(isset($_GET['operacion'])){
    
    if($_GET['operacion'] == "finalizar")
    {
        session_destroy();
        session_destroy();
        header('location:../views/login');
    }
}