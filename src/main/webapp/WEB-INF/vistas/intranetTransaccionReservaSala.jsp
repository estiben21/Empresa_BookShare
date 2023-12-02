<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="intranetValida.jsp" />

<!DOCTYPE html>
<html lang="esS">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="Cache-Control" content="private" />
    <meta http-equiv="Cache-Control" content="no-store" />
    <meta http-equiv="Pragma" content="no-cache" />

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="js/global.js"></script>

    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrapValidator.css" />
    <style>
        .help-block {
            color: #a94442; /* Color rojo para los mensajes de error */
        }
    </style>
</head>

<body>
    <jsp:include page="intranetCabecera.jsp" />

    <div class="container" style="margin-top: 4%">
        <h4>Reserva Sala</h4>
    </div>

    <div class="container mt-2">
        <form id="id_form" method="post">
            <div class="row">
                <div class="col-lg-6 mb-2" >
                    <label class="control-label" for="id_alumno">Alumno:</label>
                    <select id="id_alumno" name="alumno" class='form-control'>
                        <option value=" ">[Seleccione]</option>
                    </select>
                </div>
            </div>
            <br>
            <div class="row">
            <div class="col-lg-3 mb-2">
                    <label class="control-label" for="id_fecha_reserva">Fecha de Reserva</label>
                    <input class="form-control" id="id_fecha_reserva" name="fechaReserva" type="date" />
                </div>
                <div class="col-lg-3 mb-2">
                    <label class="control-label" for="id_hora_inicio">Hora de Inicio</label>
                    <input class="form-control" id="id_hora_inicio" name="horaInicio" type="time"/>
                </div>
                <div class="col-lg-3 mb-2">
                    <label class="control-label" for="id_hora_fin">Hora de Fin</label>
                    <input class="form-control" id="id_hora_fin" name="horaFin" type="time"/>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-lg-3 mb-2">
                    <label class="control-label mr-2" for="id_sala">Sala:</label>
                    <select id="id_sala" name="sala" class='form-control'>
                        <option value=" ">[Seleccione]</option>
                    </select>
                </div>
            </div>

            <div class="row mt-2">
                <div class="form-group col-md-12" align="center">
                    <button id="id_registrar" type="button" class="btn btn-primary">Reserva Sala</button>
                </div>
            </div>
        </form>
    </div>

    <script type="text/javascript">
    $.getJSON("listaAlumno", {}, function(data) {
        $.each(data, function(i, item) {
            $("#id_alumno").append(
                    "<option value="+item.idAlumno +">" + item.nombres + " " + item.apellidos
                            + "</option>");
        });
    });
    
    $.getJSON("listaSalaDisponible", {}, function(data) {
        $.each(data, function(i, item) {
            $("#id_sala").append(
                    "<option value="+item.idSala +" >" + item.numero
                            + "</option>");
        });
    });

    
    $("#id_registrar").click(function() {
		var validator = $('#id_form').data('bootstrapValidator');
		validator.validate();

		if (validator.isValid()) {
			$.ajax({
				type : "POST",
				url : "registraReservaSala",
				data : $('#id_form').serialize(),
				success : function(data) {
					mostrarMensaje(data.MENSAJE);
					limpiarFormulario();
					validator.resetForm();
				},
				error : function() {
					mostrarMensaje(MSG_ERROR);
				}
			});
		}
	});
    
    
    function limpiarFormulario() {
		$('#id_alumno').val(' ');
		$('#id_fecha_reserva').val('');
		$('#id_hora_fin').val('');
		$('#id_hora_inicio').val(' ');
	}

    
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            alumno:{
                selector: "#id_alumno",
                validators: {
                    notEmpty: {
                           message: 'Alumno es un campo obligatorio'
                    },
                }
            },
            horaInicio: {
                selector: "#id_hora_inicio",
                validators: {
                    notEmpty: {
                        message: 'Hora de Inicio es un campo obligatorio'
                    },
                    // Puedes agregar más validaciones aquí según tus requerimientos
                }
            },
            horaFin: {
                selector: "#id_hora_fin",
                validators: {
                    notEmpty: {
                        message: 'Hora de Fin es un campo obligatorio'
                    },
                    // Puedes agregar más validaciones aquí según tus requerimientos
                }
            },
            fechaReserva: {
                selector: "#id_fecha_reserva",
                validators: {
                    notEmpty: {
                        message: 'Fecha de reserva es un campo obligatorio'
                    },
                    // Puedes agregar más validaciones aquí según tus requerimientos
                }
            },
            sala: {
                selector : '#id_sala',
                validators: {
                    notEmpty: {
                        message: 'Sala es un campo obligatorio'
                    },
                    // Puedes agregar más validaciones aquí según tus requerimientos
                }
            },
        }   
    });
    </script>
</body>
</html>
