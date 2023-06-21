/*!
* Start Bootstrap - Grayscale v7.0.6 (https://startbootstrap.com/theme/grayscale)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-grayscale/blob/master/LICENSE)
*/
//
// Scripts
// 
    window.addEventListener('DOMContentLoaded',event=>{
        //navbar shrink function
        var navbarShrink = function(){
            const navbarCollapsible =  document.body.querySelector('#mainNav');
            if(!navbarCollapsible){
                return;
            }
            if(window.scrollY === 0){
                navbarCollapsible.classList.remove('navbar-shrink')
            }else{
                navbarCollapsible.classList.add('navbar-shrink')
            }
        };

        //shrink the navbar
        navbarShrink();

        //shrink the navbar when page is scrolled
        document.addEventListener('scroll',navbarShrink);

        //activate bootstrap scrollspy on the main nav element
        const mainNav = document.body.querySelector('#mainNav');
        if(mainNav){
            new bootstrap.ScrollSpy(document.body,{
                target: '#mainNav',
                rootMargin: '0px 0px -40%',
            });
        };

        //collapse responsibe navbar when toggler is visible
        const navbarToggler = document.body.querySelector('.navbar-toggler');
        const responsiveNavItems = [].slice.call(
            document.querySelectorAll('#navbarResponsive .nav-link')
            );
        responsiveNavItems.map(function (responsiveNavItem){
            responsiveNavItem.addEventListener('click',()=>{
                if(window.getComputedStyle(navbarToggler).display !== 'none'){
                    navbarToggler.click();
                }
            });
        });
    });