<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">

<title>Intranet</title>
<style>
    body {
        background-image: url('img/fondo.jpg');
    }
    .password-wrapper {
        position: relative;
    }
    .password-wrapper input {
        padding-right: 40px;
    }
    .password-wrapper .toggle-password {
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
        cursor: pointer;
        color: #aaa;
    }
    .password-wrapper .toggle-password:hover {
        color: #000;
    }
</style>
</head>   
<body>    
   <div class="top-content">
       <div class="inner-bg">
           <div class="container">
               <c:if test="${requestScope.mensaje != null}">
                   <div class="alert alert-danger fade in" id="success-alert">
                       <a href="#" class="close" data-dismiss="alert">&times;</a>
                       <strong>${requestScope.mensaje}</strong>
                   </div>
               </c:if>
               <div class="row">
                   <div class="col-sm-6 col-sm-offset-3 form-box">
                       <div class="form-top">
                           <div class="form-top-left">
                               <h3>Ingreso al Sistema de Intranet</h3>
                               <p>Ingrese su Usuario y Contrase&ntilde;a:</p>
                           </div>
                       </div>
                       <div class="form-bottom">
                           <form id="id_form" action="login" method="post" class="login-form">
                               <div class="form-group">
                                   <label class="sr-only" for="form-username">Usuario</label>
                                   <input type="text" name="login" placeholder="Ingrese Usuario" class="form-username form-control" id="form-username" maxlength="20" value="">
                               </div>
                               <div class="form-group password-wrapper">
                                   <label class="sr-only" for="form-password">Contrase&ntilde;a</label>
                                   <input type="password" name="password" placeholder="Ingrese Contrase&ntilde;a" class="form-password form-control" id="form-password" maxlength="20" value="">
                                   <span class="toggle-password" onclick="togglePassword()">
                                       <i class="glyphicon glyphicon-eye-open"></i>
                                   </span>
                               </div>
                               <button type="submit" class="btn btn-primary">Ingresar</button>
                           </form>
                       </div>
                   </div>   
               </div>
           </div>
       </div>
   </div>

<script type="text/javascript">
// Mostrar u ocultar la contraseña
function togglePassword() {
    const passwordInput = document.getElementById('form-password');
    const toggleIcon = document.querySelector('.toggle-password i');
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        toggleIcon.classList.remove('glyphicon-eye-open');
        toggleIcon.classList.add('glyphicon-eye-close');
    } else {
        passwordInput.type = 'password';
        toggleIcon.classList.remove('glyphicon-eye-close');
        toggleIcon.classList.add('glyphicon-eye-open');
    }
}

$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            dni: {
                validators: {
                    notEmpty: {
                        message: 'El usuario es obligatorio'
                    },
                    stringLength: {
                        message: 'El usuario es de 3 a 20 caracteres',
                        min: 3,
                        max: 20
                    }
                }
            },
            login: {
                validators: {
                    notEmpty: {
                        message: 'El usuario es obligatorio'
                    },
                    stringLength: {
                        message: 'El usuario es de 3 a 20 caracteres',
                        min: 3,
                        max: 20
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'La contrase&ntilde;a es obligatoria'
                    },
                    stringLength: {
                        message: 'La contrase&ntilde;a es de 3 a 20 caracteres',
                        min: 3,
                        max: 20
                    }
                }
            }
        }   
    });

    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>

</body>
</html>