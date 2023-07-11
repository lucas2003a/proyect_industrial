<?php
require_once "../models/Estadosalud.php";

if(isset($_POST['operacion'])){
    $estadoSalud = new Estadosalud();

    if($_POST['operacion'] == 'listar'){
        $data = $estadoSalud->Listarestado($_POST['idmatricula']);

        if($data){
            $numeroFila = 1;
            $datosEstado = "";
            $tablaHTML = ""; // Variable para almacenar la estructura HTML de la tabla

            foreach($data as $registro){
                $datosEstado = $registro['codigo'] .' '.$registro['idmatricula'];

                $tablaHTML .= "
                    <tr>
                        <td>{$numeroFila}</td>
                        <td>{$registro['codigo']}</td>
                        <td>{$registro['idmatricula']}</td>
                        <td>{$registro['edad']}</td>
                        <td>{$registro['enfermedad']}</td>
                        <td>{$registro['alergias']}</td>
                        <td>{$registro['traumas']}</td>
                        <td>{$registro['vacunas']}</td>
                        <td>
                            <a href='#' data-idestadosalud='{$registro['idmatricula']}' class='btn btn-sm btn-danger eliminar'><i class='fa-solid fa-trash'></i></a>
                            <a href='#' data-idestadosalud='{$registro['idmatricula']}' class='btn btn-sm btn-info editar'><i class='fa-solid fa-pencil'></i></i></a>
                        </td>
                    </tr>
                ";
                $numeroFila++;
            }

            echo $tablaHTML; // Imprimir la estructura HTML de la tabla en lugar de codificarla en JSON
        }
    }
}