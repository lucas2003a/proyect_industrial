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
              $('#nomusuario').text(response.datos.nomusuario);
              $('#nombres').text(response.datos.nombres);
              $('#correo').text(response.datos.correo);
              $('#celular').text(response.datos.celular);
              $("#profesion").text(response.datos.profesio);
              $('#grado').text(response.datos.grado);
              $('#seccion').text(response.datos.seccion);
              $('#turno').text(response.datos.turno)
              $('#nombres_apo').text(response.datos.nombres_apo);
              $('#celular_apo').text(response.datos.celular_apo);
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
