document.addEventListener('DOMContentLoaded',async function(){
    let DatosNuevos = true;
    let idseccionDatos;
    //lee el archivo asincornía, ubicado en test/asincronia.
  

  async function obtenerDatosAlumnos(){

    var ParamAlumno = {operacion: 'obtener'};

    try{
      
        const result = await fetch('../controllers/alumno.controller.php',{
        method: 'POST',
        headers: {'Content-Type':'application/x-www-form-urlencoded'},
        body: new URLSearchParams(ParamAlumno)
      })

      if(!result){
        //throw new Error('error en la solicitud');
        console.log('error en la solicitud');
      }

      const data = await result.json();

      if(data){
        idseccionDatos = data.datos.idseccion;
        
        const diaHoy = obtenerDiaHorario();

        obtenerHorario(idseccionDatos,diaHoy);
      }else{
        console.log('Error al cargar los datos');
      }

    }catch(error){
      console.log('Error en obtener los datos',error)
    }

  }


     
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

 
  async function obtenerHorario(idseccionDatos,diaHoy){

    var ParamHorario = {
      operacion: 'listarH',
      idseccion: idseccionDatos,
      dia: diaHoy
    };

    try{
      const result = await fetch('../controllers/horario.controller.php',{
        method: 'POST',
        headers:{'Content-Type':'application/x-www-form-urlencoded'},
        body: new URLSearchParams(ParamHorario),
      })

      if(!result){
        console.log('Error en la solicitud');
      }else{
        console.log('Se realizó la solicitud');

      }

      const data = await result.json();

      if(data){
        console.log('horario:', data);
        horario = document.getElementById('horario-contenido');
        horario.innerHTML = data; 
      }else{
        console.log('Error al cargar los datos')
      }

    }catch(error){
      console.log('Error al obtener los datos:',error);
    }
  }

 obtenerDatosAlumnos();


 
});

