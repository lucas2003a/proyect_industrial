<!doctype html>
<html lang="en">

<head>
  <title>Title</title>
  <title>Title</title>
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
</head>

<body>
  <header>
    <!-- place navbar here -->
  </header>
  <section class="registro-section">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 d-flex justify-content-center">
            <div class="col-md-6 mb-3 md-mb-0">
                <div class="card px-4 py-4 h-100" style="opacity: 0.8;">
                    <div class="card-header text-center">
                        <i class="fa fa-user-circle"></i>
                        <h2 class="text-black-50 text-uppercase">registro de usuarios</h2>
                    </div>
                    <div class="card-body m-3">
                        <form action="" id="form-registro">
                            <div class="mb-2">
                                <label for="usuario" class="form-label fw-bolder m-2">Usuario:</label>
                                <input type="text" class="form-control form-control-sm" placeholder ="ingrese el nombre de usuario">
                            </div>
                            <div class="mb-2">
                                <label for="password" class="form-label fw-bolder m-2">Contraseña:</label>
                                <input type="passqord" class="form-control form-control-sm" placeholder="ingrese la constraseña">
                            </div>
                            <div class="mb-2">
                                <label for="doc_nro" class="form-label fw-bolder m-2">N° de documento:</label>
                                <input type="text" name="doc_nro" id="doc_nro" class="form-control form-control-sm">
                            </div>
                            <div class="mb-2">
                                <label for="t_persona" class="form-label fw-bolder m-2">Tipo de persona:</label>
                                <select name="t_persona" id="t_persona" class="form-select form-select-sm">
                                    <option value="">Seleccione</option>
                                    <option value="personal">Personal</option>
                                    <option value="alumno">Alumno</option>
                                </select>
                                <!---no creo que deba incluir la opcion personal porque como un personal se va a registrar en la web, no tendría lógica-->
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-muted">
                        Footer
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
<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="../js/scripts.js"></script>
  <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
  <!-- * *                               SB Forms JS                               * *-->
  <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
  <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
  <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>

</html>