<?php
require_once "Estadosalud.php";

if(isset($_POST['operacion'])){

    $estadoSalud = new Estadosalud();

    if($_POST['operacion'] == 'listar'){

        $data = $estadoSalud->Listarestado();

        if($data){
            $numeroFila = 1;
            $datosEstado = "";
            
            foreach($data as $registro){

                $datosEstado = $registro['codigo'] .' '.$registro['idmatricula'];

                echo"
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
                            <a href='#' data-idestadosalud='{$registro['idmatricula']}' class='btn btn-sm btn-danger eliminar'><i class='bi bi-trash3'></i></a>
                            <a href='#' data-idestadosalud='{$registro['idmatricula']}' class='btn btn-sm btn-danger editar'><i class='bi bi-pencil'></i></a>
                        </td>
                    </tr>
                ";
                $numeroFila++;
            }
        }
    }
}