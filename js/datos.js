document.addEventListener('DOMContentLoaded',function(){

    let datosNuevos = true;
    let idAlumnoActualizar = -1;
    let idmatricualaDatos;
    let idseccionDatos;

    obtenerDatosAlumno();

    function obtenerDatosAlumno(){
        fetch('../controllers/alumno.controller.php',
        {
            method: 'POST',
            body: JSON.stringify({
                operacion: 'obtener'
            }),
            headers: {
                'Content-type':'application/json'
            }
        })

        .then(response => response.json())
        .then(data => {
            console.log(data);
            if(data.status){
                
                const {nombres, apellidos} = data.datos;
                const nombreCompleto = '${nombres} ${apellidos}';

                document.getElementById('nomalumno').textContent = nombreCompleto;
                document.getElementById('nomusuario').textContent = data.datos.nomusuario;
                document.getElementById('nombres').textContent = data.datos.nombres;
                document.getElementById('apellidos').textContent = data.datos.apellidos;
                document.getElementById('documento_nro').textContent = data.datos.documento_nro;
                document.getElementById('correo').textContent = data.datos.correo;
                document.getElementById('celular').textContent = data.datos.celular;
                document.getElementById('profesion').textContent = data.datos.profesion;
                document.getElementById('grado').textContent = data.datos.grado; 
                document.getElementById('seccion').textContent = data.datos.seccion; 
                document.getElementById('turno').textContent = data.datos.turno; 
                document.getElementById('nombres_apo').textContent = data.datos.nombres_apo; 
                document.getElementById('celular_apo').textContent = data.datos.celular.apo;
                
                idmatricualaDatos = data.datos.idmatricula;
                idseccionDatos = data.datos.idseccion;

            }else{
                alert(data.mensaje);
            }
        })
    }
});