<!doctype html>
<html lang="en">

<head>
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
  <link href="../css/profile.css" rel="stylesheet"/>
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <!-- SweetAlert2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>  
</head>

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
                <li class="active"><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
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
                        <li><a href="#"><i class="fa-brands fa-app-store"></i> Web design</a></li>
                    </ul>
                </li>
                <li><a href="#"><i class="fa-solid fa-users"></i> Users</a></li>
                <li><a href="#"><i class="fa-solid fa-message"></i> Message</a></li>
                <li><a href="#"><i class="fa-solid fa-book"></i> Bookmark</a></li>
                <li><a href="#"><i class="fa-solid fa-file"></i> Files</a></li>
            </ul>
        </div>
    </nav>
    <div class="container-cn" id="mainContent">
        <div class="main-content">
            <div class="header">
                <div class="container">
                    <div class="card p-3">
                        <div class="card-header">
                            Header
                        </div>
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
                                            <h5>lucas atuncar valerio</h5>
                                            <h6>creador de la página</h6>
                                            <p class="proile-rating">RANKINGS : <span>8/10</span></p>
                                        
                                            <ul class="nav nav-tabs navbar-2" id="myTab" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">perfil</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">timeline</a>
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
                                            <p>WORK LINK</p>
                                            <a href="">Website Link</a><br/>
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
                                                        <label for="userID" class="fw-bolder">User ID :</label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>lucas2003</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label for="name" class="fw-bolder">Nombres :</label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>lucas atuncar</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label for="email" class="fw-bolder">Email :</label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>123@gmail.com</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label for="phone" class="fw-bolder">Phone :</label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>123456789</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label for="profession" class="fw-bolder">Profession :</label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>Alumno</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label for="experience" class="fw-bolder">Experience:</label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>Expert</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label for="houlrate" class="fw-bolder">Houl Rate :</label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>10$/hr</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label for="totalprojects" class="fw-bolder">Total projects:</label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>230</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label for="Englishlevel" class="fw-bolder">English level</label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>Expert</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label for="availability" class="fw-bolder">Availability :</label>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>6 month</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <label for="">Your bio</label>
                                                        <p>Your detail descripction</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
  <script src="../js/profile2.js"></script>
  <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
  <!-- * *                               SB Forms JS                               * *-->
  <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
  <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
  <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>

</html>