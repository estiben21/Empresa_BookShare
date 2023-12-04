<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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

<!-- Incluye SweetAlert desde CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
</head>

<body>
	<jsp:include page="intranetCabecera.jsp" />

	<div class="container" style="margin-top: 4%">
		<h4>Reserva Sala</h4>
	</div>

	<div class="container mt-2">
		<form id="id_form" method="post">
			<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label" for="id_alumno">Alumno:</label> <select
						id="id_alumno" name="alumno" class='form-control'>
						<option value=" ">[Seleccione]</option>
					</select>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="form-group col-md-3">
					<label class="control-label" for="id_fecha_reserva">Fecha
						de Reserva</label> <input class="form-control" id="id_fecha_reserva"
						name="fechaReserva" type="date" />
				</div>
				<div class="form-group col-md-3">
					<label class="control-label" for="id_hora_inicio">Hora de
						Inicio</label> <input class="form-control" id="id_hora_inicio"
						name="horaInicio" type="time" />
				</div>
				<div class="form-group col-md-3">
					<label class="control-label" for="id_hora_fin">Hora de Fin</label>
					<input class="form-control" id="id_hora_fin" name="horaFin"
						type="time" />
				</div>
			</div>
			<br>
			<div class="row">
				<div class="form-group col-md-3">
					<label class="control-label" for="id_sala">Sala:</label> <select
						id="id_sala" name="sala" class='form-control'>
						<option value=" ">[Seleccione]</option>
					</select>
				</div>
			</div>

			<div class="row mt-2">
				<div class="form-group col-md-12" align="center">
					<button id="id_registrar" type="button" class="btn btn-primary">Reserva
						Sala</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		$.getJSON("listaAlumno", {}, function(data) {
			$.each(data, function(i, item) {
				$("#id_alumno").append(
						"<option value="+item.idAlumno +">" + item.nombres
								+ " " + item.apellidos + "</option>");
			});
		});

		$.getJSON("listaSalaDisponible", {}, function(data) {
			$.each(data, function(i, item) {
				$("#id_sala").append(
						"<option value="+item.idSala +" >" + item.numero
								+ "</option>");
			});
		});

		/*----------------------------------------------------------------------------------------------------------------------*/
		///inicio de la validacion de la hora 
		
		// Define la constante HORA_ERROR con el mensaje de error
		const HORA_ERROR = "La hora de fin debe ser mayor que la hora de inicio.";

		$("#id_registrar")
				.click(
						function() {
							var validator = $('#id_form').data(
									'bootstrapValidator');
							validator.validate();

							if (validator.isValid()) {
								var horaInicio = $('#id_hora_inicio').val();
								var horaFin = $('#id_hora_fin').val();

								if (compararHoras(horaInicio, horaFin)) {
									$.ajax({
										type : "POST",
										url : "registraReservaSala",
										data : $('#id_form').serialize(),
										success : function(data) {
											mostrarMensaje(data.MENSAJE);
											limpiarFormulario();
											validator.resetForm();
											actualizarComboBox();
										},
										error : function() {
											mostrarMensaje(MSG_ERROR);
										}
									});
								} else {
									mostrarMensaje(HORA_ERROR);
									// Resetear solo el campo de horaFin
									validator.resetField($('#id_hora_fin'));
									$('#id_hora_fin').val(' ');	
								}
							}
						});

		// Función para comparar dos horas (formato HH:mm)
		function compararHoras(horaInicio, horaFin) {
			var horaInicioDate = new Date("1970-01-01 " + horaInicio);
			var horaFinDate = new Date("1970-01-01 " + horaFin);
			return horaInicioDate < horaFinDate;
		}
		///fin de la validacion de la hora 
		/*----------------------------------------------------------------------------------------------------------------------*/

		function actualizarComboBox() {
			// Limpia el combo box de salas antes de actualizarlo
			$("#id_sala").empty();

			// Agrega una opción predeterminada para el combo box de salas
			$("#id_sala").append(
					"<option value='' selected>[Seleccione]</option>");

			// Realiza la solicitud para obtener la lista actualizada de salas disponibles
			$.getJSON("listaSalaDisponible", {}, function(data) {
				// Itera sobre la lista de salas y agrega las opciones al combo box de salas
				$.each(data, function(i, item) {
					$("#id_sala").append(
							"<option value=" + item.idSala + ">" + item.numero
									+ "</option>");
				});
			});
		}

		function limpiarFormulario() {
			$('#id_alumno').val(' ');
			$('#id_sala').val(' ');
			$('#id_fecha_reserva').val('');
			$('#id_hora_fin').val('');
			$('#id_hora_inicio').val(' ');
		}

		$('#id_form')
				.bootstrapValidator(
						{
							message : 'This value is not valid',
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								alumno : {
									selector : "#id_alumno",
									validators : {
										notEmpty : {
											message : 'Alumno es un campo obligatorio'
										},
									}
								},
								horaInicio : {
									selector : "#id_hora_inicio",
									validators : {
										notEmpty : {
											message : 'Hora de Inicio es un campo obligatorio'
										},
									// Puedes agregar más validaciones aquí según tus requerimientos
									}
								},
								horaFin : {
									selector : "#id_hora_fin",
									validators : {
										notEmpty : {
											message : 'Hora de Fin es un campo obligatorio'
										},
									// Puedes agregar más validaciones aquí según tus requerimientos
									}
								},
								fechaReserva : {
									selector : "#id_fecha_reserva",
									validators : {
										notEmpty : {
											message : 'Fecha de reserva es un campo obligatorio'
										},
									// Puedes agregar más validaciones aquí según tus requerimientos
									}
								},
								sala : {
									selector : '#id_sala',
									validators : {
										notEmpty : {
											message : 'Sala es un campo obligatorio'
										},
									// Puedes agregar más validaciones aquí según tus requerimientos
									}
								},
							}
						});
	</script>
</body>
</html>
