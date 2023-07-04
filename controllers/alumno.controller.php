<?php
require_once "../models/Alumno.php";

if(isset($_POST['operacion'])){
    
    $alumno = new Alumno();

    if($_POST['operacion'] == 'obtener'){

        $registro = $alumno->Obteneralumno($_POST['$idusuario']);
        echo json_encode($registro);
    }
}
