<?php
  session_start();
  if(isset($_SESSION['login']) && $_SESSION['login']){
    header('Location:profile.php');
  }
?>

<!doctype html>
<html lang="en">

<head>
  <title>Login académico</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Gray scale - Start bootstrap Theme</title>
  <link rel="icon" type="image/x-icon" href="img/descarga-removebg-preview.png">
  <!-- Font Awesome icons (free version)-->
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
  <!-- Google fonts-->
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="../css/style.css" rel="stylesheet"/>
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <!-- SweetAlert2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>  
</head>

<body>
  <header>
    <!-- place navbar here -->
  </header>
  <section class="login-section">
    <div class="container px-4 px-lg-5">
      <div class="row gx-4 gx-lg-5 d-flex  justify-content-center">
        <div class="col-md-6 mb-3 md-mb-0">
          <div class="card px-4 py-4 h-100" style="opacity: 0.8;" >
            <div class="card-header text-center ">
              <i class="fa fa-user-circle"></i>
              <h1 class="text-black text-uppercase">Login</h1>
              <h2 class="text-black-50 text-uppercase">registrate ya</h2>
            </div>
            <div class="card-body m-3">
              <form action="" id="form-login">
                <div class="mb-2">
                  <label for="nomusuario" class="form-label fw-bolder m-2">Correo:</label>
                  <input type="text" name="nomusuario" id="nomusuario" class="form-control form-control-sm" placeholder="Ingrese su nombre de usuario">
                </div>  
                <div class="mb-2"> 
                  <label for="claveacceso" class="form-label fw-bolder m-2">Contraseña:</label>
                  <input type="password" name="claveacceso" id="claveacceso" class="form-control form-control-sm">
                </div>
              </form> 
            </div>
            <div class="card-footer">
              <div class="d-flex justify-content-center py-4">
                <button type="button" id="iniciar-sesion" class="btn btn-primary text-uppercase fw-bolder">inicar sesion</button>
              </div>
              <div class="registrarse py-4 text-center">
                <p class="text-black-50 fw-bolder">¿No tienes una cuenta?<a class="text-uppercase" href="registro.php">registrate</a></p>
              </div>
              <div class="icon-login d-flex justify-content-center">
                <a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                <a class="mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                <a class="mx-2" href="#!"><i class="fab fa-github"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <main>
  </main>
    </section>
  <footer>
    <!-- place footer here -->
  </footer>
  <!-- place footer here -->
  </footer>
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="../js/usuario.js"></script>
  <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
  <!-- * *                               SB Forms JS                               * *-->
  <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
  <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
  <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>

</html>