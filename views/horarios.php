<?php
    session_start();
    if(!isset($_SESSION['login']) || $_SESSION['login'] == false){
        header('Location:login.php');
    }
?>

<!doctype html>
<html lang="en">

<head>
  <title>Bienvenido</title>
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
  <link href="../css/horarios.css" rel="stylesheet"/>
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
        <h1 class="text-uppercase fw-bolder mt-2">Jhon f.kennedy</h1>
        <div class="sidebar-image">
          <img src="../views/img/zyro-image.png" alt="">
        </div>
      </div>
      <ul class="main_side">
        <li class="active"><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li>
          <a href="#" id="pages"><i class="fa-solid fa-layer-group"></i> Pages<span class="fas fa-caret-down"></span></a>
          <ul class="item-show-pages">
            <li><a href="#"><i class="fa-solid fa-phone"></i> Contac us</a></a></li>
            <li><a href="#"><i class="fa-solid fa-user-plus"></i> our team</a></a></li>
          </ul>
        </li>
        <li>
          <a href="#" id="services"><i class="fas fa-puzzle-piece"></i> Services<span class="fas fa-caret-down"></span></a>
          <ul class="item-show-services">
            <li><a href="#"><i class="fa-brands fa-app-store-ios"></i> App design</a></a></li>
            <li><a href="#"><i class="fa-brands fa-app-store"></i> web design</a></a></li>
          </ul>
        </li>
        <li><a href="horarios.php"><i class="fa-solid fa-users"></i> Horarios</a></li>
        <li><a href="#"><i class="fa-solid fa-message"></i> Mensajes</a></li>
        <li><a href="#"><i class="fa-solid fa-book"></i> Libros</a></li>
        <li><a href="#"><i class="fa-solid fa-file"></i> Archivos</a></li>
      </ul>
    </div>
  </nav>
    <section class="section-horario">
      <div class="container-cn" id="mainContent">
        <div class="main-content" id="contenido">
           <div class="horarios">
            <div class="container">
                <div class="card">
                  <div class="card-body">
                    <h1 class="fw-bolder text-uppercase text-center">horario</h1>

                    <div class="horario">
                      <!---horarios top navigation-->
                      <nav class="nav nav-tabs">
                        <a href="#" class="nav-link active" name="dia" value="LUNES">Lun</a>
                        <a href="#" class="nav-link" name="dia" value="MARTES">Mar</a>
                        <a href="#" class="nav-link" name="dia" value="MIERCOLES">Mier</a>
                        <a href="#" class="nav-link" name="dia" value="JUEVES">Jue</a>
                        <a href="#" class="nav-link" name="dia" value="VIERNES">Vie</a>
                      </nav>

                      <div class="tab-content">
                        <div class="tab-pane show active">
                          <div clas="row">
                            <!---item 1-->
                            <div class="col-md-12">
                              <div class="horario-item">
                                <div class="horario-item-img">
                                <img src="../views/img/zyro-image.png" style="height: 100%; width:70%" alt="imagen">
                                </div>

                                <div class="horario-item-main">
                                  <h1 class="horario-item-nombre fw-bolder" name="curso" id="curso">Matemáticas</h1>
                                  <h2 class="horario-item-horainicio" id="horainicio" name="horaincio">08:00 am</h2>
                                  <h2 class="horario-item-horatermino" id="horatermino" name="horatermino">10:00 am</h2>
                                  <a href="#" type="button" class="btn btn-primary btn-leer">Leer mas..</a>
                                  <div class="horario-item-like">
                                    <i class="fa-regular fa-heart" id="vacio" arian-hidden="true"></i>
                                    <i class="fa fa-heart" id="lleno" aria-hidden="true"></i>
                                    <p class="horario-item-like-count">11</p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
           </div>
        </div>
      </div>
    </section>
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
<script src="../js/profile_data.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>

</html>