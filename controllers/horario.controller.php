<?php

require_once "Horario.php";

if(isset($_POST['operacion'])){

    $horario = new Horario();
    
    if($_POST['operacion'] == 'listarH'){
        
        $registro = $horario->ObtenerHorarios($_POST['idsecccion'],$_POST['dia']);
        return json_encode($registro);
    }
}