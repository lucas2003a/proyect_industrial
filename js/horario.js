document.addEventListener('DOMContentLoaded',function(){
    let DatosNuevos = true;

     
  function obtenerDiaActual(){

    const diaSemana = ['DOMINGO','LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO'];
    const fechaActual = new Date();
    const nombreDia = diaSemana[fechaActual.getDay()];

    return nombreDia;
 }

 function obtnerHorario(){

 }
 function obtenerDiaActualNavbar(){

   var diaActual = obtenerDiaActual;
   const elementoNavHorario = document.getElementsByClassName('horario-link');

   if(elementoNavHorario){
    elementoNavHorario.texContent = diaActual;
   }

   console.log(elementoNavHorario);
 }
  obtenerDiaActualNavbar();

 const diaHoy= obtenerDiaActual();
 console.log("hoy es:", diaHoy);

});