<?php

require_once "../models/Horario.php";

if(isset($_POST['operacion'])){

    $horario = new Horario();

    
    if($_POST['operacion'] == 'listarH'){
        
        $data = $horario->ObtenerHorarios($_POST['idseccion'],$_POST['dia']);

        $resultado=[
            "status" => false,
            "mensajeH" => "",
            "horarioHTML" => ""
        ];

        if($data){

            $resultado["status"] = true;
            $resultado["mensajeH"] = "Horario cargado correctamente";
            $resultado["horarioHTML"] = generarHorario($data);
            

        }else{
            $resultado["mensajeH"] = "Error al cargar el horario";
            $resultado["horarioHTML"] = generarErrorCARD();
        }

        echo json_encode($resultado);

    }
}

function generarHorario($data){

    $numeroCard = 1;
    $estadoRegistro = "";
    $cardHTML = "";
    
    foreach($data as $registro){
        
        $estadoRegistro = $registro['curso'] . '' . $registro['nroaula'];

        $cardHTML .= "
        <div class='horario-item'>
        
            <div class='horario-item-main'>
                <h1 class='horario-item-nombre fw-bolder' name='curso' id='curso'>{$registro['curso']}</h1>
                <h2 class='horario-item-horainicio' id='horainicio' name='horainicio'>{$registro['horainicio']}</h2>
                <h2 class='horario-item-horatermino' id='horatermino' name='horatermino'>{$registro['horatermino']}</h2>
                <h2 class='horario-item-aula' id='nroaula' name='nroaula'>{$registro['nroaula']}</h2>
                <a href='#' type='button' class='btn btn-primary btn-leer'>Leer mas..</a>
                    <div class='horario-item-like'>
                        <i class='fa-regular fa-heart' id='vacio' arian-hidden='true'></i>
                        <i class='fa fa-heart' id='lleno' aria-hidden='true'></i>
                        <p class='horario-item-like-count'>11</p>
                    </div>
            </div>
        </div>

        ";
        $numeroCard++;

    }
    echo json_encode($cardHTML); 
}

function generarErrorCARD(){

        $cardErrorHTML = "
        <div class='horario-item'>
        
            <div class='horario-item-main'>
                <h1 class='horario-item-nombre fw-bolder' name='curso' id='curso'>No hemos encontrado el horario</h1>
            </div>
        </div>

        ";

    echo json_encode($cardErrorHTML); 
}