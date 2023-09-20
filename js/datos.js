/* DATOS DEL PERFIL */
document.addEventListener('DOMContentLoaded', function() {
    let datosNuevos = true;
    let idAlumnoact = -1;
    obtenerDatosAlumno();
  
    function obtenerDatosAlumno() {
      let xhr = new XMLHttpRequest();
      xhr.open('POST', '../controllers/alumno.controller.php', true);
      xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          let response = JSON.parse(xhr.responseText);
          console.log(response);
          if (response.status) {
            let nombres = response.datos.nombres;
            let apellidos = response.datos.apellidos;
            let nombreCompleto = nombres + ' ' + apellidos;
            document.getElementById('nomalumno').textContent = nombreCompleto;
            document.getElementById('nomusuario').textContent = response.datos.nomusuario;
            document.getElementById('nombres').textContent = response.datos.nombres;
            document.getElementById('apellidos').textContent = response.datos.apellidos;
            document.getElementById('documento_nro').textContent = response.datos.documento_nro;
            document.getElementById('correo').textContent = response.datos.correo;
            document.getElementById('celular').textContent = response.datos.celular;
            document.getElementById('profesion').textContent = response.datos.profesion;
            document.getElementById('grado').textContent = response.datos.grado;
            document.getElementById('seccion').textContent = response.datos.seccion;
            document.getElementById('turno').textContent = response.datos.turno;
            document.getElementById('nombres_apo').textContent = response.datos.nombres_apo;
            document.getElementById('celular_apo').textContent = response.datos.celular_apo;
            // Actualizar otros elementos HTML con los datos del alumno si es necesario
            window.idmatriculaDatos = response.datos.idmatricula;
            window.idseccionDatos = response.datos.idseccion;
          } else {
            alert(response.mensaje);
          }
        }
      };
      xhr.send('operacion=obtener');
    }
  
    document.getElementById('estado-salud').addEventListener('click', function(e) {
      e.preventDefault();
      let xhr = new XMLHttpRequest();
      xhr.open('POST', '../controllers/estadosalud.controller.php', true);
      xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          let response = JSON.parse(xhr.responseText);
          document.getElementById('tabla-salud').getElementsByTagName('tbody')[0].innerHTML = response;
        }
      };
      xhr.send('operacion=listar&idmatricula=' + idmatriculaDatos);
    });
  
    let horarioLinks = document.getElementsByClassName('horario-link');
    for (let i = 0; i < horarioLinks.length; i++) {
      horarioLinks[i].addEventListener('click', function() {
        let diaSeleccionado = this.getAttribute('value');
        let xhr = new XMLHttpRequest();
        xhr.open('POST', '../controllers/horario.controller.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
          if (xhr.readyState === 4 && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            document.getElementById('horario-contenido').innerHTML = result;
          }
        };
        xhr.send('operacion=listarH&idseccion=' + idseccionDatos + '&dia=' + diaSeleccionado);
      });
    }
  });