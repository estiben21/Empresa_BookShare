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

<title>Intranet</title>
</head>
<body>
	<jsp:include page="intranetCabecera.jsp" />
	<div class="container" style="margin-top: 4%">
		<h4>Registro Autor</h4>
	</div>

	<div class="container" style="margin-top: 1%">
		<!-- Agregar aquí -->

		<form id="id_form" method="post">
			<div class="col-md-12" style="margin-top: 2%">
				<div class="row">
					<div class="form-group col-md-3">
						<label class="control-label" for="id_nombres">Nombres</label> <input
							class="form-control" type="text" id="id_nombres" name="nombres"
							placeholder="Ingrese nombre">
					</div>
					<div class="form-group col-md-3">
						<label class="control-label" for="id_apellidos">Apellidos</label>
						<input class="form-control" type="text" id="id_apellidos"
							name="apellidos" placeholder="Ingrese apellido ">
					</div>
					<div>
						<div class="col-sm-4">
							<label class="control-label" for="id_fecha">Fecha de
								Nacimiento</label>
						</div>
						<div class="col-sm-6">
							<input class="form-control" type="date" id="id_fecha"
								name="fechaNacimiento" placeholder="Ingrese la fecha"
								maxlength="100">
								
						</div>
					</div>
				</div>
				<div>

					<div class="form-group col-md-3">
						<label class="control-label" for="id_telefono">Telefono</label> <input
							class="form-control" type="text" id="id_telefono" name="telefono"
							placeholder="Ingrese telefono ">
					</div>
					<div class="form-group col-md-3">
						<label class="control-label" for="id_pais">País</label> <select
							id="id_pais" name="pais.idPais" class='form-control'>
							<option value=" ">[Seleccione]</option>
						</select>
					</div>
					<div class="form-group col-md-3">
						<label class="control-label" for="id_grado">Grado</label> <select
							id="id_grado" name="grado.idGrado" class='form-control'>
							<option value=" ">[Seleccione]</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12" align="center">
						<button id="id_registrar" type="button" class="btn btn-primary">Registra</button>
					</div>
				</div>
			</div>

		</form>
	</div>

	<script type="text/javascript">
		$.getJSON("listaPais", {}, function(data) {
			console.log(data);
			$.each(data, function(index, item) {
				$("#id_pais").append(
						"<option value="+item.idPais +">" + item.nombre
								+ "</option>");
			});
		});

		$.getJSON("listaGradoAutor", {}, function(data) {
			$.each(data, function(index, item) {
				$("#id_grado").append(
						"<option value="+item.idDataCatalogo +">" + item.descripcion
								+ "</option>");
			});
		});

		function limpiarFormulario() {
			$("#id_nombres").val('');
			$("#id_apellidos").val(' ');
			$("#id_telefono").val(' ');
			$("#id_fecha").val(' ');
			$("#id_pais").val(' ');
			$("#id_grado").val(' ');
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
								Nombres : {
									selector : '#id_nombres',
									validators : {
										notEmpty : {
											message : 'El nombre es un campo obligatorio'
										},
										stringLength : {
											message : 'El nombre es de 5 a 100 caracteres',
											min : 5,
											max : 100
										},
										regexp : {
											regexp : /^[a-zA-Z\s]+$/,
											message : 'El nombre solo puede contener letras y espacios'
										}
									}
								},
								Apellidos : {
									selector : '#id_apellidos',
									validators : {
										notEmpty : {
											message : 'El apellido es un campo obligatorio'
										},
										stringLength : {
											message : 'El apellido es de 5 a 100 caracteres',
											min : 5,
											max : 100
										},
										regexp : {
											regexp : /^[a-zA-Z\s]+$/,
											message : 'El apellido solo puede contener letras y espacios'
										}
									}
								},
								fechaNacimiento : {
									selector : "#id_fecha",
									validators : {
										notEmpty : {
											message : 'La fecha es obligatorio'
										}
									}
								},
								Telefono : {
									selector : '#id_telefono',
									validators : {
										notEmpty : {
											message : 'El teléfono es un campo obligatorio'
										},
										stringLength : {
											min : 9,
											max : 9,
											message : 'El teléfono debe tener exactamente 9 dígitos'
										},
										numeric : {
											message : 'El teléfono debe contener solo números'
										}
									}

								},
								pais : {
									selector : '#id_pais',
									validators : {
										notEmpty : {
											message : 'País es un campo obligatorio'
										},
									}
								},
								grado : {
									selector : '#id_grado',
									validators : {
										notEmpty : {
											message : 'Grado es un campo obligatorio'
										},
									}
								},

							}
						});
		$("#id_registrar").click(function() {
			var validator = $('#id_form').data('bootstrapValidator');
			validator.validate();

			if (validator.isValid()) {
				$.ajax({
					type : "POST",
					url : "registraAutor",
					data : $('#id_form').serialize(),
					success : function(data) {
						mostrarMensaje(data.MENSAJE);
						validator.resetForm();
						limpiarFormulario();
					},
					error : function() {
						mostrarMensaje(MSG_ERROR);
					}
				});
			}
		});
	</script>
</body>
</html>