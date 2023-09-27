<?php
session_start();

require_once "../models/Alumno.php";

if (isset($_POST['operacion'])) {
    $alumno = new Alumno();

    if ($_POST['operacion'] == 'obtener') {
        $resultado = [
            "status" => false,
            "mensaje" => ""
        ];

        if (isset($_SESSION['login']) && $_SESSION['login'] === true && isset($_SESSION['idusuario'])) {
            $idusuario = $_SESSION['idusuario'];
            $registro = $alumno->Obteneralumno($idusuario);

            if ($registro) {
                $resultado["status"] = true;
                $resultado["mensaje"] = "Datos del alumno obtenidos correctamente";
                $resultado["datos"] = $registro;

            } else {
                $resultado["mensaje"] = "No se encontraron datos del alumno";
            }
        } else {
            $resultado["mensaje"] = "Acceso no autorizado";
        }
        echo json_encode($resultado);
    }
}