document.addEventListener('DOMContentLoaded', function() {
  /* SIDEBAR */

  document.querySelector('.btn-sidebar').addEventListener('click', function() {
    this.classList.toggle('click');
    document.querySelector('.sidebar').classList.toggle('show');
  });

  document.querySelectorAll('.sidebar ul li a').forEach(function(link) {
    link.addEventListener('click', function() {
      var id = this.getAttribute('id');
      var isActive = this.parentElement.classList.contains('active');

      // Ocultar todos los menús desplegables
      document.querySelectorAll('.sidebar ul li').forEach(function(item) {
        item.classList.remove('active');
      });
      document.querySelectorAll('.sidebar ul li ul').forEach(function(submenu) {
        submenu.classList.remove('show');
      });
      document.querySelectorAll('.sidebar ul li a span').forEach(function(span) {
        span.classList.remove('rotate');
      });

      if (!isActive && this.getAttribute('id') !== 'cerrar-sesion') {
        // Mostrar el menú desplegable correspondiente al elemento seleccionado
        this.parentElement.classList.add('active');

        var submenu = this. parentElement.querySelector('ul')

        if(submenu){
          submenu.classList.add('show');
        }
  
        this.querySelector('span').classList.add('rotate');
      }
    });
  });

  document.querySelectorAll('nav ul li').forEach(function(navLink) {
    navLink.addEventListener('click', function() {
      this.classList.add('active');
      var siblings = Array.from(this.parentNode.children).filter(function(sibling) {
        return sibling !== this;
      }, this);
      siblings.forEach(function(sibling) {
        sibling.classList.remove('active');
      });
    });
  });

  /* NAVBAR (RESPONSIVE) */

  document.querySelectorAll('.navbar-responsive ul li a').forEach(function(responsiveLink) {
    responsiveLink.addEventListener('click', function() {
      var id = this.getAttribute('id');
      var isActive = this.parentElement.classList.contains('active');

      // Ocultar todos los menús desplegables
      document.querySelectorAll('.navbar-responsive ul li').forEach(function(item) {
        item.classList.remove('active');
      });
      document.querySelectorAll('.navbar-responsive ul li ul').forEach(function(submenu) {
        submenu.classList.remove('show');
      });
      document.querySelectorAll('.navbar-responsive ul li a span').forEach(function(span) {
        span.classList.remove('rotate');
      });

      if (!isActive && this.getAttribute('id') !== 'cerrar-sesion') {
        this.parentElement.classList.add('active');
        document.querySelector('nav ul li ul.item-show-' + id).classList.add('show');
        this.querySelector('span').classList.add('rotate');
      }
    });
  });

  /* CONTENT RESPONSIVE */

  var sidebarButton = document.querySelector('.btn-sidebar');
  var mainContainer = document.querySelector('#mainContent');

  sidebarButton.addEventListener('click', function() {
    mainContainer.classList.toggle('sidebar-open');
  });

  document.querySelectorAll('.navbar-2 .nav-link').forEach(function(navlink) {
    navlink.addEventListener('click', function(e) {
      e.preventDefault();
      document.querySelectorAll('.navbar-2 .nav-link').forEach(function(link) {
        link.classList.remove('active');
      });
      this.classList.add('active');

      var contenidoID = this.getAttribute('href');

      document.querySelectorAll('.tab-content .tab-pane').forEach(function(pane) {
        pane.style.display = 'none';
      });

      document.querySelector(contenidoID).style.display = 'block';
    });
  });


});