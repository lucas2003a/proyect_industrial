
/*NAVBAR DEL USUARIO*/
$(document).ready(function(){
    /*SIDEBAR*/

    $('.btn-sidebar').click(function(){
        $(this).toggleClass("click");
        $('.sidebar').toggleClass("show");
    });

    $('.sidebar ul li a').click(function(){
        var id = $(this).attr('id');
        var isActive = $(this).parent().hasClass('active');

        // Ocultar todos los menús desplegables
        $('.sidebar ul li').removeClass('active');
        $('.sidebar ul li ul').removeClass('show');
        $('.sidebar ul li a span').removeClass('rotate');

        if (!isActive && $(this).attr('id') !== 'cerrar-sesion') {
            // Mostrar el menú desplegable correspondiente al elemento seleccionado
            $(this).parent().addClass('active');
            $('nav ul li ul.item-show-'+id).addClass('show');
            $(this).find('span').addClass('rotate');
        }
    });


    $('nav ul li').click(function(){
        $(this).addClass("active").siblings().removeClass("active");
    });

    /*NAVBAR(RESPONSIVE)*/

    $('.navbar-responsive ul li a').click(function(){
        var id = $(this).attr('id');
        var isActive = $(this).parent().hasClass('active');

        //ocultar todos los menú desplegables
        $('.navbar-responsive ul li').removeClass('active');
        $('.navbar-responsive ul li ul').removeClass('show');
        $('.navbar-responsive ul li a span').removeClass('rotate');

        if(!isActive && $(this).attr('id') !== 'cerrar-sesion'){
            $(this).parent().addClass('active');
            $('nav ul li ul.item-show-'+id).addClass('show');
            $(this).find('span').addClass('rotate');
        }
    });

    $('nav ul li').click(function(){
        $(this).addClass("active").siblings().removeClass("active");
    });


    //CONTENT RESPONSIVO
    var sidebarButton = $('.btn-sidebar');
    var mainContainer = $('#mainContent');
  
    sidebarButton.on('click', function() {
      mainContainer.toggleClass('sidebar-open');
    });

    $('.navbar-2 .nav-link').click(function(){
        $('.navbar-2 .nav-link').removeClass('active');
        $(this).addClass('active');
        
        var contenidoID = $(this).attr('href');

        $('.tab-content .tab-pane').hide();

        $(contenidoID).show();
        
    });

    //MODAL
    $('#modal-salud').on('show.bs.modal', function(event) {
        // Button that triggered the modal
        let button = event.relatedTarget;
        // Extract info from data-bs-* attributes
        let recipient = $(button).data('bs-whatever');
      
        // Use above variables to manipulate the DOM
      });
   });
// intentando hacer un contenido dinámico
   $('#horarios').click(function(){
    $.ajax({
        url: 'horarios.php',
        success: function(data){
            $('#contenido').html(data);
        }
    });
});


