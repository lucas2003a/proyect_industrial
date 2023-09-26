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

      if(data){
        console.log('horario:',data);
        horario = document.getElementById('horario-contenido');
        horario.innerHTML = data;
      }else{
        console.log('Error al cargar los datos');
      }

    }catch(error){
      console.log('Error en obtener los datos',datos)
    }

  }

  obtenerDatosAlumnos();
     
  function obtenerDiaActual(){

    const diaSemana = ['DOMINGO','LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO'];
    const fechaActual = new Date();
    const nombreDia = diaSemana[fechaActual.getDay()];

    return nombreDia;
 }

 function obtenerDiaActualNavbar(){

   var diaActual = obtenerDiaActual();
   const elementoNavHorario = document.getElementsByClassName('horario-link');

   if(elementoNavHorario){
    elementoNavHorario.texContent = diaActual;
   }

   console.log(elementoNavHorario);
 }
  obtenerDiaActualNavbar();

 const diaHoy= obtenerDiaActual();
 console.log("hoy es:", diaHoy);

 
 async function obtenerHorario(){

  var ParamHorario = {
    operacion: 'listarH',
    idseccion: idseccionDatos,
    dia: 'Jueves'
  };
    try{
      const result = fetch('../controllers/horario.controller.php',{
        method: 'POST',
        headers:{'Content-Type':'application/x-www-form-urlencoded'},
        body: new URLSearchParams(ParamHorario),
      })

    }catch(error){}


  then((result) => result.json())
  .then((data) => {

    if(data){
      console.log("horario:" , data)
      horario = document.getElementById('horario-contenido');
      horario.innerHTML = data;
    }else{
      console.log("error al cargar los datos:",error);
    }

  })

  .catch((error) => {
    console.log("este es el error fetch:", error);
  })
 }

 var diaActual= obtenerDiaActual();


 obtenerHorario();

 
});

