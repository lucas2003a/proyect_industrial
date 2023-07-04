/* DATOS DEL PERFIL */
$(document).ready(function(){
    let datosNuevos = true;
    let idAlumnoact = -1;

    function Mostrardatos(){

        const idUsuarioEdit = $(this).data("idusuario");

        $.ajax({
            url: '../controller/alumno.controller.php',
            type: 'POST',
            data: {
                operacion: 'obtener',
                idusuario: idUsuarioEdit,
            },
            dataType: 'JSON',
            succes: function(result){
                console.log(result);

                datosNuevos = false;

                idUsuarioEdit = result['idusuario'];
                $("#usuario").val(result['#usuario'])
            }
        });
    }
});