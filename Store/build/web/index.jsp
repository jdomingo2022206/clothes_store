<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-MnE5/OQ0HYIB3onK6lTkzV8VhIHs5I03NU6ZS6GScq6h9nK7XlSzXZtR65/BvY3G4LRKEJQKLrTrHcrgj0+bFg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Bienvenidos!!</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card col-sm-10">
                <div class="card-body">
                    <form class="form-sing" action="Validar" method="POST">
                        <div class="form-group text-center">
                            <h3>Login</h3>
                            <img src="img/ClothesStore1.png" alt="150" width="150"/><br>
                            <label>Bienvenido Clothes Store</label>
                        </div>
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" name="txtUser" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <div class="input-group">
                                <input type="password" name="txtPass" id="txtPass" class="form-control">
                                <div class="input-group-append">
                                    <button type="button" id="togglePass" class="btn btn-outline-secondary">
                                        <i id="eyeIcon" class="far fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block">
                    </form>
                </div>
            </div>
        </div>
        
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script>
            const togglePass = document.getElementById('togglePass');
            const txtPass = document.getElementById('txtPass');
            const eyeIcon = document.getElementById('eyeIcon');

            togglePass.addEventListener('click', function () {
                if (txtPass.type === 'password') {
                    txtPass.type = 'text';
                    eyeIcon.classList.remove('far', 'fa-eye');
                    eyeIcon.classList.add('far', 'fa-eye-slash');
                } else {
                    txtPass.type = 'password';
                    eyeIcon.classList.remove('far', 'fa-eye-slash');
                    eyeIcon.classList.add('far', 'fa-eye');
                }
            });
        </script>
    </body>
</html>
