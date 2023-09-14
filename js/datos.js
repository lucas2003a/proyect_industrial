/* DATOS DEL PERFIL */
$(document).ready(function(){
    let datosNuevos = true;
    let idAlumnoact = -1;

    obtenerDatosAlumno();
    
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

            window.idmatriculaDatos = response.datos.idmatricula; //var define una varibe glogal fuera de una funcion, pero window define una variable global aun dentro de un codigo
            window.idseccionDatos = response.datos.idseccion;

          } else {
            alert(response.mensaje);
          }
        },
        error: function(xhr, status, error) {
          console.log(xhr.responseText);
        }
      });
    }

    $('#estado-salud').click(function(e) {
      e.preventDefault();
      
      $.ajax({
        url: '../controllers/estadosalud.controller.php',
        type: 'POST',
        data: {
          operacion: 'listar',
          idmatricula: idmatriculaDatos
        },
        dataType: 'JSON',
        success: function(response) {
          $('#tabla-salud tbody').html(response);
        }
      });
    }); 
    
    function obtenerHorarios(idseccionDatos,dia){
      
      $.ajax({
        url: '../controllers/horario.controller.php',
        type: 'POST',
        data: {
          operacion: 'listarH',
          idseccion: idseccionDatos,
          dia: dia
        },
        dataType: 'JSON',
        success: function(result){

          console.log("se cargo correctamente.");
          
          $('#horario-contenido').html(result);
        
        },
        error: function(){

          console.log("Error al cargar horarios.");
          console.log(diaActual);
        } 
      });
    };

    function obtenerDiaActual(){
       
      var fechaActual = new Date();
      var numeroDia = fechaActual.getDay();
      var diaSemana = ["DOMINGO","LUNES","MARTES","MIERCOLES","JUEVES","VIERNES","SÁBADO"];
      var diaActual = diaSemana[numeroDia];
      return (diaActual === "SÁBADO" || diaActual === "DOMINGO") ? null : diaActual;
  
    }

    $('.horario-link').click(function(){

      var diaSeleccionado = $(this).attr('value');

      obtenerHorarios(diaSeleccionado);

    });

    var diaActual = obtenerDiaActual();

    if(diaActual !== "SÁBADO" && diaActual !== "DOMINGO"){

          obtenerHorarios(diaActual);

    }
});
