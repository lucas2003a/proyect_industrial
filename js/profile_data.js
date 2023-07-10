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
              let nombres = response.datos.nombres;
              let apellidos = response.datos.apellidos;
              let nombreCompleto = nombres + ' ' + apellidos;

              $('#nomalumno').text(nombreCompleto);
              $('#nomusuario').text(response.datos.nomusuario);
              $('#nombres').text(response.datos.nombres);
              $('#apellidos').text(response.datos.apellidos);
              $('#documento_nro').text(response.datos.documento_nro)
              $('#correo').text(response.datos.correo);
              $('#celular').text(response.datos.celular);
              $("#profesion").text(response.datos.profesion);
              $('#grado').text(response.datos.grado);
              $('#seccion').text(response.datos.seccion);
              $('#turno').text(response.datos.turno)
              $('#nombres_apo').text(response.datos.nombres_apo);
              $('#celular_apo').text(response.datos.celular_apo);
              // Actualizar otros elementos HTML con los datos del alumno si es necesario

              ObtenerEstadosalud(response.datos.idmatricula);
            } else {
              alert(response.mensaje);
            }
          },
          error: function(xhr, status, error) {
            console.log(xhr.responseText);
          }
        });
    }

    function ObtenerEstadosalud(idmatricula){

      $.ajax({
        url: '../controllers/estadosalud.controller.php',
        type: 'POST',
        data: { operacion : 'listar',
                idmatricula : idmatricula
              },
        dataType :'JSON',
        success: function(result){
          $("#table-salud tbody").html(result);
        }
      });
    }
    $("#estado-salud").click(function(){
      ObtnerEstadosalud()
    });
    obtenerDatosAlumno();
});
