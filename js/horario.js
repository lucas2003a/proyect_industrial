document.addEventListener('DOMContentLoaded',() => {
    const controllerAlumno = `../controllers/alumno.controller.php`;
    let DatosNuevos = true;
    let idseccionDatos;
    //lee el archivo asincornía, ubicado en test/asincronia.
     
  function obtenerDiaActual(){

    const diaSemana = ['DOMINGO','LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO'];
    const fechaActual = new Date();
    const nombreDia = diaSemana[fechaActual.getDay()];

    return nombreDia;
  }

  const diaHoy= obtenerDiaActual();
  console.log("hoy fuera de alumno es:", diaHoy);



  function obtenerDiaHorario(){
  
    const diaHoy = obtenerDiaActual();
    console.log('Hoy es:',diaHoy)

    const horarioLinks = document.querySelectorAll('.horario-link');

    horarioLinks.forEach(enlace =>{
      enlace.addEventListener('click',function(event){

        const diaSeleccionado = event.target.getAttribute('value');

        obtenerHorario(idseccionDatos,diaSeleccionado);

        //Actualiza el contenido del enlace de dia seleccionado
        event.target.textContent = diaSeleccionado;
      })
    })
  }

 
  function obtenerHorario(idseccionDatos,diaHoy){

    let ParamHorario = {
      operacion: 'listarH',
      idseccion: idseccionDatos,
      dia: diaHoy
    };

    try{

      fetch(controllerAlumno,{
        method: 'POST',
        /*headers:{'Content-Type':'application/x-www-form-urlencoded'},
        body: new URLSearchParams(ParamHorario),*/
        body: ParamHorario
      })
        .then(result => result.json())
        .then(data => {
          if(data){
            console.log('horario:', data);
            horario = document.getElementById('horario-contenido');
            horario.innerHTML = data; 
          }else{
            console.log('Error al cargar los datos')
          }
        })
    }catch(error){
      console.log('Error al obtener los datos:',error);
    }
  }
  function obtenerDatosAlumnos(){

    //var ParamAlumno = {operacion: 'obtener'};

    const parametros = new FormData();

    parametros.append("operacion","obtener");

    try{
      
        fetch(controllerAlumno,{
        method: 'POST',
        /*headers: {'Content-Type':'application/x-www-form-urlencoded'},
        body: new URLSearchParams(ParamAlumno)*/
        body: parametros
      })
          .then(result => result.json())
          .then(data =>{      
            if(data){

              console.log("si se obtuvo");
              
              idseccionDatos = data.datos.idseccion;
        
              const diaHoy = obtenerDiaHorario();

              obtenerHorario(idseccionDatos,diaHoy);
            
            }else{
              console.log('Error al cargar los datos');
            }

          })
    }catch(error){
          console.log('Error en obtener los datos',error)
    }
  }


 obtenerDatosAlumnos();


 
});

