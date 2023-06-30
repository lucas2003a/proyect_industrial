document.querySelector('.btn-sidebar').addEventListener('click', function() {
    this.classList.toggle("click");
    document.querySelector('.sidebar').classList.toggle("show");
  });
  
  var sidebarLinks = document.querySelectorAll('.sidebar ul li a');
  sidebarLinks.forEach(function(link) {
    link.addEventListener('click', function(e) {
      e.preventDefault(); // Evitar que el enlace redirija
  
      var id = this.getAttribute('id');
      var isActive = this.parentElement.classList.contains('active');
  
      // Ocultar todos los menús desplegables
      var sidebarItems = document.querySelectorAll('.sidebar ul li');
      sidebarItems.forEach(function(item) {
        item.classList.remove('active');
      });
      var sidebarSubmenus = document.querySelectorAll('.sidebar ul li ul');
      sidebarSubmenus.forEach(function(submenu) {
        submenu.classList.remove('show');
      });
      var sidebarSpans = document.querySelectorAll('.sidebar ul li a span');
      sidebarSpans.forEach(function(span) {
        span.classList.remove('rotate');
      });
  
      if (!isActive) {
        // Mostrar el menú desplegable correspondiente al elemento seleccionado
        this.parentElement.classList.add('active');
        document.querySelector('.sidebar ul li ul.item-show-' + id).classList.add('show');
        this.querySelector('span').classList.add('rotate');
      }
    });
  });
  
  var navLinks = document.querySelectorAll('nav ul li');
  navLinks.forEach(function(link) {
    link.addEventListener('click', function() {
      this.classList.add('active');
      var siblings = Array.from(this.parentNode.children).filter(function(sibling) {
        return sibling !== this;
      }, this);
      siblings.forEach(function(sibling) {
        sibling.classList.remove('active');
      });
    });
  });
  
  var responsiveNavLinks = document.querySelectorAll('.navbar-responsive ul li a');
  responsiveNavLinks.forEach(function(link) {
    link.addEventListener('click', function(e) {
      e.preventDefault(); // Evitar que el enlace redirija
  
      var id = this.getAttribute('id');
      var isActive = this.parentElement.classList.contains('active');
  
      // Ocultar todos los menús desplegables
      var responsiveNavItems = document.querySelectorAll('.navbar-responsive ul li');
      responsiveNavItems.forEach(function(item) {
        item.classList.remove('active');
      });
      var responsiveNavSubmenus = document.querySelectorAll('.navbar-responsive ul li ul');
      responsiveNavSubmenus.forEach(function(submenu) {
        submenu.classList.remove('show');
      });
      var responsiveNavSpans = document.querySelectorAll('.navbar-responsive ul li a span');
      responsiveNavSpans.forEach(function(span) {
        span.classList.remove('rotate');
      });
  
      if (!isActive) {
        this.parentElement.classList.add('active');
        document.querySelector('.navbar-responsive ul li ul.item-show-' + id).classList.add('show');
        this.querySelector('span').classList.add('rotate');
      }
    });
  });
  
  navLinks.forEach(function(link) {
    link.addEventListener('click', function() {
      this.classList.add('active');
      var siblings = Array.from(this.parentNode.children).filter(function(sibling) {
        return sibling !== this;
      }, this);
      siblings.forEach(function(sibling) {
        sibling.classList.remove('active');
      });
    });
  });
  
  document.addEventListener('DOMContentLoaded', function() {
    var sidebarButton = document.querySelector('.btn-sidebar');
    var mainContainer = document.getElementById('mainContent');
  
    sidebarButton.addEventListener('click', function() {
      mainContainer.classList.toggle('sidebar-open');
    });
  
    var navbarLinks = document.querySelectorAll('.navbar-2 .nav-link');
    navbarLinks.forEach(function(link) {
      link.addEventListener('click', function(e) {
        e.preventDefault(); // Evitar que el enlace redirija
  
        navbarLinks.forEach(function(navlink) {
          navlink.classList.remove('active');
        });
        this.classList.add('active');
  
        var contenidoID = this.getAttribute('href');
  
        var tabPanes = document.querySelectorAll('.tab-content .tab-pane');
        tabPanes.forEach(function(pane) {
          pane.style.display = 'none';
        });
  
        document.querySelector(contenidoID).style.display = 'block';
      });
    });
  });