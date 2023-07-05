/* DATOS DEL PERFIL */
$(document).ready(function(){
    let datosNuevos = true;
    let idAlumnoact = -1;

    function obtenerDatosAlumno() {
        $.ajax({
          url: '../controllers/alumno.controller.php',
          type: 'POST',
          data: { operacion: 'obtener' },
          dataType: 'JSON',
          success: function(response) {
            console.log(response);
            if (response.status) {
              $('#nomusuario').text(response.datos.usuario);
              $('#doc_nro').text(response.datos.idalumno);
              // Actualizar otros elementos HTML con los datos del alumno si es necesario
            } else {
              alert(response.mensaje);
            }
          },
          error: function(xhr, status, error) {
            console.log(xhr.responseText);
          }
        });
    }
    obtenerDatosAlumno();
});
