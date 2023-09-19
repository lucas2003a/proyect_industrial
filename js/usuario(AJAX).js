$(document).ready(function () {
    function iniciarSesion() {
        const usuario = $("#nomusuario").val();
        const password = $("#claveacceso").val();

        if (usuario != "" && password != "") {
            $.ajax({
                url: '../controllers/usuario.controller.php',
                type: 'POST',
                data: {
                    operacion: 'login',
                    nomusuario: usuario,
                    claveingresada: password,
                },
                dataType: 'JSON',
                success: function (result) {
                    console.log(result);
                    if (result["status"]) {
                        window.location.href = "profile.php";
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: (result["mensaje"]),
                            text: 'Has cometido un error!',
                            footer: '<a href="">¿Poqué sucedió esto?</a>'
                        })
                    }
                }
            });
        } else {
            Swal.fire({
                position: 'midle-center',
                icon: 'error',
                title: 'Llene todo los campos',
                showConfirmButton: false,
                timer: 1500
            });
        }
    }
    $("#iniciar-sesion").click(iniciarSesion);
});


