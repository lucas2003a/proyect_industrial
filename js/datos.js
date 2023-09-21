/* DATOS DEL PERFIL */ 
let datosNuevos = true; 
let idAlumnoact = -1;
let idmatriculaDatos;
let idseccionDatos; 
obtenerDatosAlumnos(); 
 
function obtenerDatosAlumnos(){
  
  var ParamAlumnos = {operacion: 'obtener'}

  fetch('../controllers/alumno.controller.php',{
    method:'POST',
    headers: {'Content-Type':'application/x-www-form-urlencoded',}, 
    // por defecto esta es la configuracion  del header para las solicitudes post en formato HTML
    // si se espera que el servidor RECIVA datos en formato JSON puedes cambiarlo assí 'Content-Type':'application/json'
    // en tal caso deberias configurar el servidor para poder recivir datos en JSON
    body: new URLSearchParams(ParamAlumnos),
  })

  .then((result) => result.json())
  .then((data) =>{
    console.log(data);
    if(data.status){
      actualizarDatos(data);
    }else{
      console.log("Error al obtener los datos:", error);
    }
  })

  function actualizarDatos(data){

    if(data.status){

      let nombres = data.datos.nombres;
      let apellidos = data.datos.apellidos;
      let NombresCompletos = nombres + ' ' + apellidos;

      document.getElementById('nomalumno').textContent = NombresCompletos;
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
      document.getElementById('celular_apo').textContent = data.datos.celular_apo;

      idmatriculaDatos = data.datos.idmatricula;
      idseccionDatos = data.datos.idseccion;

    }else{
      console.log('Error al implementar datos:', error);
    }
  }
  
  const EstadoSaludElement = document.getElementById('estado-salud');

  if(EstadoSaludElement){

    EstadoSaludElement.addEventListener('click',(e)=>{
      cargarEstadosalud();
    })
  }

  function cargarEstadosalud(){

    var ParamEstadoSalud ={
      operacion : 'listar',
      idmatricula: idmatriculaDatos
    }

    fetch('../controllers/estadosalud.controller.php',{
      method: 'POST',
      headers:{
        'Content-Type':'application/x-www-form-urlencoded',
      },
      body: new URLSearchParams(ParamEstadoSalud)
    })

    .then((result) => result.json())
    .then((data) =>{
      if(data){
        console.log("si exite");

        const tbodyEstadoSalud = document.getElementById('tabla-salud').getElementsByTagName('tbody')[0];

        tbodyEstadoSalud.innerHTML = data;

      }else{
        console.log("no existe");
      }
    })
    .catch((error) =>{
      console.log("Error al obtener datos de salud:", error);
    })
  }
}

 /*
document.querySelectorAll('.horario-link').forEach((link) => { 
  link.addEventListener('click', () => { 
    const diaSeleccionado = link.getAttribute('value'); 
    fetch('../controllers/horario.controller.php', { 
      method: 'POST', 
      body: JSON.stringify({ 
        operacion: 'listarH', 
        idseccion: idseccionDatos, 
        dia: diaSeleccionado, 
      }), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }, 
    }) 
      .then((response) => response.json()) 
      .then((data) => { 
        document.getElementById('horario-contenido').innerHTML = data; 
      }) 
      .catch((error) => console.log(error)); 
  }); 
});

/*
  function actualizarElementos(datos) {
    for (const [key, value] of Object.entries(datos)) {
      const elemento = document.getElementById(key);
      if (elemento) {
        elemento.textContent = value;
      }
    }
  }

  document.getElementById('estado-salud').addEventListener('click', async function (e) {
    e.preventDefault();
    try {
      const response = await fetch(`../controllers/estadosalud.controller.php?operacion=listar&idmatricula=${idmatriculaDatos}`);
      if (response.ok) {
        const data = await response.text();
        document.getElementById('tabla-salud').getElementsByTagName('tbody')[0].innerHTML = data;
      }
    } catch (error) {
      console.error('Error al obtener datos de salud:', error);
    }
  });

  const horarioLinks = document.querySelectorAll('.horario-link');
  horarioLinks.forEach((link) => {
    link.addEventListener('click', async function () {
      const diaSeleccionado = link.getAttribute('value');
      try {
        const response = await fetch(`../controllers/horario.controller.php?operacion=listarH&idseccion=${idseccionDatos}&dia=${diaSeleccionado}`);
        if (response.ok) {
          const result = await response.json();
          document.getElementById('horario-contenido').innerHTML = result;
        }
      } catch (error) {
        console.error('Error al obtener horario:', error);
      }
    });
  });
});*/