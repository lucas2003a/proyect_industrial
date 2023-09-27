<?php
    session_start();
    if(!isset($_SESSION['login']) || $_SESSION['login'] == false){
        header('Location:login.php');
    }

?>

<!doctype html>
<html lang="en">

<head>
  <title>Perfil del usuario</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Gray scale - Start bootstrap Theme</title>
  <link rel="icon" type="image/x-icon" href="img/descarga-removebg-preview.png">
  <!-- Font Awesome icons (free version)-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Google fonts-->
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="../css/profile.css" rel="stylesheet"/>
  <!-- jQuery -->
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <!-- SweetAlert2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>  
  
</head>

<body>
  <header>
    <!-- place navbar here -->
  </header>

    <div class="navbar-responsive py-4">
        <nav class="navbar-iconos">
            <ul class="main_nav">
                <li><a class="active" href="#"><i class="fas fa-tachometer-alt"></i></a></li>
                <li>
                    <a href="#" id="pages"><i class="fa-solid fa-layer-group"></i><span class="fas fa-caret-down"></span></a>
                    <ul class="item-show-pages">
                        <li><a href="#"><i class="fa-solid fa-phone"></i></a></li>
                        <li><a href="#"><i class="fa-solid fa-user-plus"></i></a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" id="services"><i class="fas fa-puzzle-piece"></i><span class="fas fa-caret-down"></span></a>
                    <ul class="item-show-services">
                        <li><a href="#"><i class="fa-brands fa-app-store-ios"></i></a></li>
                        <li><a href="#"><i class="fa-brands fa-app-store"></i></a></li>
                    </ul>
                </li>              
                <li><a href="#"><i class="fa-solid fa-users"></i></a></li>
                <li><a href="#"><i class="fa-solid fa-message"></i></a></li>
                <li><a href="#"><i class="fa-solid fa-book"></i></a></li>
                <li><a href="#"><i class="fa-solid fa-file"></i></a></li>
                <li><a href="../controllers/usuario.controller.php?operacion=finalizar" id="cerrar-sesion"><i class="fas fa-power-off"></i></a></li>
            </ul>
        </nav>
    </div>


    <div class="btn-sidebar toggled" id="menu-toggle">
        <span class="fas fa-bars"></span>
    </div>
    <nav class="sidebar" id="sidebar">
        <div class="sidebar-content">
            <div class="text">
                <h1 class="text-uppercase fw-bolder mt-2">Jhon f. kennedy</h1>
                <div class="sidebar-image">
                    <img src="../views/img/zyro-image.png" alt="">
                </div>
            </div>
            <ul class="main_side">
                <li class="active"><a href="profile.php"><i class="fas fa-tachometer-alt"></i> Perfil</a></li>
                <li>
                    <a href="#" id="pages"><i class="fa-solid fa-layer-group"></i> Pages<span class="fas fa-caret-down"></span></a>
                    <ul class="item-show-pages">
                        <li><a href="#"><i class="fa-solid fa-phone"></i> Contac us</a></li>
                        <li><a href="#"><i class="fa-solid fa-user-plus"></i> our team</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" id="services"><i class="fas fa-puzzle-piece"></i> Services<span class="fas fa-caret-down"></span></a>
                    <ul class="item-show-services">
                        <li><a href="#"><i class="fa-brands fa-app-store-ios"></i> App design</a></li>
                        <li><a href="#"><i class="fa-brands fa-app-store"></i> web design</a></li>
                    </ul>
                </li>               
                <li><a href="horarios.php"><i class="fa-solid fa-users"></i> Horarios</a></li>
                <li><a href="#"><i class="fa-solid fa-message"></i> Mensajes</a></li>
                <li><a href="#"><i class="fa-solid fa-book"></i> Libros</a></li>
                <li><a href="#"><i class="fa-solid fa-file"></i> Archivos</a></li>
                <li><a href="../controllers/usuario.controller.php?operacion=finalizar" id="cerrar-sesion"><i class="fas fa-power-off"></i> Cerrar sesión</a></li>
            </ul>
        </div>
    </nav>
    <section class="profile-section">
        <div class="container-cn" id="mainContent">
            <div class="main-content" id="contenido">
                <div class="header">
                    <div class="container">
                        <div class="card p-3">
                            <div class="card-body">
                                <form action="" id="form-profile">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="profile-img">
                                                <img src="../views/img/Escudo_de_Chincha_alta.png" alt="">
                                                <div class="file btn btn-lg btn-primary">
                                                    Cambiar foto
                                                    <input type="file" name="file" id="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="profile-head">
                                                <h5 id="nomalumno"></h5>
                                                <h6>creador de la página</h6>
                                                <p class="documento_nro" id="documento_nro"></p>
                                            
                                                <ul class="nav nav-tabs navbar-2" id="myTab" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Perfil</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Datos académicos</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <button type="submit" class="profile-edit-btn" name="btnAddMore">Editar perfil</button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="profile-work">
                                                <p>Salud</p>
                                                <a href="" id="estado-salud" type="button" data-bs-toggle="modal" data-bs-target="#modal-salud" >Estado de salud</a><br/>
                                                <a href="">Bootsnipp Profile</a><br/>
                                                <a href="">Bootply Profile</a>
                                                <p>SKILLS</p>
                                                <a href="">Web Designer</a><br/>
                                                <a href="">Web Developer</a><br/>
                                                <a href="">WordPress</a><br/>
                                                <a href="">WooCommerce</a><br/>
                                                <a href="">PHP, .Net</a><br/>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="tab-content profile-tab" id="myTabContent">
                                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="usuario" class="fw-bolder">User ID :</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p id="nomusuario"></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="nombres" class="fw-bolder">Nombres :</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p id="nombres"></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="apellidos" class="fw-bolder">Apellidos</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p id="apellidos"></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="email" class="fw-bolder">Email :</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p id="correo"></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="phone" class="fw-bolder">Celular :</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p id="celular"></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="profession" class="fw-bolder">Profesión :</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p id="profesion"></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="experience" class="fw-bolder">Grado:</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p id="grado"></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="houlrate" class="fw-bolder">Sección :</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p id="seccion"></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="totalprojects" class="fw-bolder">Turno:</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p id="turno"></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="Englishlevel" class="fw-bolder">Apoderado :</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p id="nombres_apo"></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="availability" class="fw-bolder">Celular del apoderado :</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p id="celular_apo"></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <label for="">Biografía</label>
                                                            <p>Descirpción personal</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    
    <!-- Modal -->
    <div class="modal fade" id="modal-salud" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
            <div class="modal-content">
                    <div class="modal-header">
                            <h5 class="modal-title" id="modalTitleId">Estado salud</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                <div class="modal-body">
                    <div class="container d-flex justify-content-center align-items-center">
                        <div class="col-md-offset-1 col-md-10">
                            <div class="panel">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-sm-3 col-xs-12">
                                            <h4 class="title">data <span>List</span></h4>
                                        </div>
                                        <div class="col-sm-9 col-xs-12 text-end">
                                            <div class="btn_group">
                                                <div class="row"></div>
                                                <input type="text" class="form-control" placeholder="Search">
                                                <button class="btn btn-default" title="Reload"><i class="fa fa-sync-alt"></i></button>
                                                <button class="btn btn-default" title="Pdf"><i class="fa fa-file-pdf"></i></button>
                                                <button class="btn btn-default" title="Excel"><i class="fas fa-file-excel"></i></button>
                                                <button class="btn btn-default" title="add"><i class="fa-solid fa-plus"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body table-lg table-responsive-lg">
                                    <table class="table text-center" id="tabla-salud">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Código</th>
                                                <th>Matrícula</th>
                                                <th>Edad</th>
                                                <th>Enfermedad</th>
                                                <th>Alergías</th>
                                                <th>Taumas</th>
                                                <th>Vacunas</th>
                                                <th>Operaciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>                                       
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div></div>
                    <button type="button" class="btn" style="background: none; border-color: white; color: white;" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn"  style="background: none; border-color: white; color: white;" >Save</button>
                </div>
            </div>
        </div>
    </div>

  <main>

  </main>
  <footer>
    <!-- place footer here -->
    </footer>
  <!-- place footer here -->
  </footer>
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="../js/profile.js"></script>
  <script src="../js/datos.js"></script>
  <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
  <!-- * *                               SB Forms JS                               * *-->
  <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
  <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
  <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

  <script>  
    /* MODAL */
    var modalSalud = new bootstrap.Modal(document.getElementById('modal-salud'));
    modalSalud._element.addEventListener('show.bs.modal', function(event) {
      var button = event.relatedTarget;
      var recipient = button.getAttribute('data-bs-whatever');
      // Usa las variables anteriores para manipular el DOM
    });
  </script>

</body>

</html>