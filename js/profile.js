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

    if (!isActive) {
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

    if(!isActive){
        $(this).parent().addClass('active');
        $('nav ul li ul.item-show-'+id).addClass('show');
        $(this).find('span').addClass('rotate');
    }
});

$('nav ul li').click(function(){
    $(this).addClass("active").siblings().removeClass("active");
});
