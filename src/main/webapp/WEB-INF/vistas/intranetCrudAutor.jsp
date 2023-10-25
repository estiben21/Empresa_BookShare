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
		<h4>CRUD Autor</h4>
	</div>

	<div class="container" style="margin-top: 1%">
		<div class="row" style="height: 70px">
			<div class="col-md-3">
				<input class="form-control" id="id_txt_filtro" name="filtro"
					placeholder="Ingrese el nombre o apellidos" type="text"
					maxlength="30" />
			</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-primary" id="id_btn_filtrar"
					style="width: 150px">FILTRA</button>
			</div>
			<div class="col-md-2">
				<button type="button" data-toggle='modal'
					data-target="#id_div_modal_registra" class='btn btn-success'
					style="width: 150px">REGISTRA</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="content">

					<table id="id_table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th style="width: 5%">ID</th>
								<th style="width: 10%">Nombres</th>
								<th style="width: 10%">Apellidos</th>
								<th style="width: 15%">Fecha de Nacimiento</th>
								<th style="width: 9%">Teléfono</th>
								<th style="width: 10%">Pais</th>
								<th style="width: 10%">Grado</th>
								<th style="width: 10%">Actualiza</th>
								<th style="width: 10%">Elimina</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="id_div_modal_registra">
		<div class="modal-dialog" style="width: 60%">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-ok-sign"></span> Registro de
						Autor
					</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
					<form id="id_form_registra" accept-charset="UTF-8"
						action="registraCrudRevista" class="form-horizontal" method="post">
						<div class="panel-group" id="steps">
							<!-- Step 1 -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos
											del Autor</a>
									</h4>
								</div>
								<div id="stepOne" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_reg_nombres">Nombres</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_reg_nombres"
													name="nombres" placeholder="Ingrese el nombre del autor"
													type="text" maxlength="40" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_reg_apellidos">Apellidos</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_reg_apellidos"
													name="apellidos"
													placeholder="Ingrese el apellido del autor" type="text"
													maxlength="40"  />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label"
												for="id_reg_fechaNacimiento">Fecha de Nacimiento</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_reg_fechaNacimiento"
													name="fechaNacimiento" type="date" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_reg_telefono">Teléfono</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_reg_telefono"
													name="telefono" placeholder="Ingrese el teléfono del autor"
													type="text" maxlength="40" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_reg_pais">País</label>
											<div class="col-lg-8">
												<select id="id_reg_pais" name="pais" class='form-control'>
													<option value=" ">Seleccione:</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_reg_grado">Grado</label>
											<div class="col-lg-8">
												<select id="id_reg_grado" name="grado" class='form-control'>
													<option value=" ">Seleccione:</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<div class="col-lg-9 col-lg-offset-3">
												<button type="button" class="btn btn-primary"
													id="id_btn_registra">REGISTRA</button>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="id_div_modal_actualiza">
		<div class="modal-dialog" style="width: 60%">

			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-ok-sign"></span> Actualizar
						Autor
					</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
					<form id="id_form_actualiza" accept-charset="UTF-8"
						action="registraActualizaCrudRevista" class="form-horizontal"
						method="post">
						<div class="panel-group" id="steps">
							<!-- Step 1 -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos
											del Autor</a>
									</h4>
								</div>
								<div id="stepOne" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_ID">ID</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_ID" readonly="readonly"
													name="idAutor" type="text" maxlength="8" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_nombres">Nombre</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_act_nombres" name="nombres"
													placeholder="Ingrese el nombre del autor" type="text"
													maxlength="40" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_apellidos">Apellido</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_act_apellidos" name="apellidos"
													placeholder="Ingrese el apellido del autor" type="text"
													maxlength="40" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label"
												for="id_act_fechaNacimiento">Fecha de Nacimiento</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_act_fechaNacimiento"
													name="fechaNacimiento" type="date" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_telefono">Teléfono</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_act_telefono" name="telefono"
													placeholder="Ingrese el teléfono del autor" type="text"
													maxlength="40" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_pais">País</label>
											<div class="col-lg-8">
												<select id="id_act_pais" name="pais" class='form-control'>
													<option value=" ">Seleccione:</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_grado">Grado</label>
											<div class="col-lg-8">
												<select id="id_act_grado" name="grado"
													class='form-control'>
													<option value=" ">Seleccione:</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<div class="col-lg-9 col-lg-offset-3">
												<button type="button" class="btn btn-primary"
													id="id_btn_actualiza">ACTUALIZA</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>
	


	<script type="text/javascript">
		$.getJSON("listaPais", {}, function(data) {
			$.each(data, function(i, item) {
				$("#id_reg_pais").append(
						"<option value="+item.idPais +">" + item.nombre
								+ "</option>");
				$("#id_act_pais").append(
						"<option value="+item.idPais +">" + item.nombre
								+ "</option>");
			});
		});

		$.getJSON("listaGradoAutor", {}, function(data) {
			$.each(data, function(i, item) {
				$("#id_reg_grado").append(
						"<option value="+item.idDataCatalogo +">"
								+ item.descripcion + "</option>");
				$("#id_act_grado").append(
						"<option value="+item.idDataCatalogo +">"
								+ item.descripcion + "</option>");
			});
		});

		$("#id_btn_filtrar").click(function() {
			var fil = $("#id_txt_filtro").val();
			$.getJSON("consultaCrudAutor", {
				"filtro" : fil
			}, function(lista) {
				agregarGrilla(lista);
			});
		});

		$("#id_btn_registra").click(function() {
			var validator = $('#id_form_registra').data('bootstrapValidator');
			validator.validate();

			if (validator.isValid()) {
				$.ajax({
					type : "POST",
					url : "registraCrudAutor",
					data : $('#id_form_registra').serialize(),
					success : function(data) {
						agregarGrilla(data.lista);
						$('#id_div_modal_registra').modal("hide");
						mostrarMensaje(data.mensaje);
						limpiarFormulario();
						validator.resetForm();
					},
					error : function() {
						mostrarMensaje(MSG_ERROR);
					}
				});
			}
		});
		
		$("#id_btn_actualiza").click(function(){
			var validator = $('#id_form_actualiza').data('bootstrapValidator');
		    validator.validate();
		    if (validator.isValid()) {
		        $.ajax({
		          type: "POST",
		          url: "actualizaCrudAutor", 
		          data: $('#id_form_actualiza').serialize(),
		          success: function(data){
		        	  agregarGrilla(data.lista);
		        	  $('#id_div_modal_actualiza').modal("hide");
		        	  mostrarMensaje(data.mensaje);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		        });
		    }
		});
		
		function limpiarFormulario(){	
			$('#id_reg_nombres').val('');
			$('#id_reg_apellidos').val('');
			$('#id_reg_fechaNacimiento').val(' ');
			$('#id_reg_telefono').val('');
			$('#id_reg_pais').val(' ');
			$('#id_reg_grado').val(' ');
		}

		function agregarGrilla(lista) {
			$('#id_table').DataTable().clear();
			$('#id_table').DataTable().destroy();
			$('#id_table')
					.DataTable(
							{
								data : lista,
								searching : false,
								ordering : true,
								processing : true,
								pageLength : 5,
								lengthChange : false,
								columns : [
										{
											data : "idAutor"
										},
										{
											data : "nombres"
										},
										{
											data : "apellidos"
										},
										{
											data : "fechaNacimiento"
										},
										{
											data : "telefono"
										},
										{
											data : "pais.nombre"
										},
										{
											data : "grado.descripcion"
										},
										{
											data : function(row, type, val,
													meta) {
												var salida = '<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''
														+ row.idAutor
														+ '\',\''
														+ row.nombres
														+ '\',\''
														+ row.apellidos
														+ '\',\''
														+ row.fechaNacimiento
														+ '\',\''
														+ row.telefono
														+ '\',\''
														+ row.pais.idPais
														+ '\',\''
														+ row.grado.idDataCatalogo
														+ '\')">Editar</button>';
												return salida;
											},
											className : 'text-center'
										},
										{
											data : function(row, type, val,
													meta) {
												var salida = '<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\''
														+ row.idAutor
														+ '\')">'
														+ (row.estado == 1 ? 'Activo'
																: 'Inactvo')
														+ '</button>';
												return salida;
											},
											className : 'text-center'
										},

								]
							});
		}

		$('#id_form_registra')
				.bootstrapValidator(
						{
							message : 'This value is not valid',
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								nombres : {
									selector : '#id_reg_nombres',
									validators : {
										notEmpty : {
											message : 'El nombre es un campo obligatorio'
										},
										stringLength : {
											message : 'El nombre es de 2 a 40 carácteres',
											min : 2,
											max : 40
										},
										regexp : {
											regexp : /^[a-zA-Z\s]+$/,
											message : 'El nombre solo puede contener letras y espacios'
										},
										remote : {
											delay : 100,
											url : 'buscaAutorNombreApellidoRegistro',
											message : 'El nombre ya existe'
										}
									}
								},
								apellidos : {
									selector : '#id_reg_apellidos',
									validators : {
										notEmpty : {
											message : 'El apellido es un campo obligatorio'
										},
										stringLength : {
											message : 'El apellido es de 2 a 40 carácteres',
											min : 2,
											max : 40
										},
										regexp : {
											regexp : /^[a-zA-Z\s]+$/,
											message : 'El apellido solo puede contener letras y espacios'
										},
										remote : {
											delay : 100,
											url : 'buscaAutorNombreApellidoRegistro',
											message : 'El nombre ya existe'
										}
									}
								},
								fechaNacimiento : {
									selector : "#id_reg_fechaNacimiento",
									validators : {
										notEmpty : {
											message : 'La fecha es obligatorio'
										},
										remote : {
											delay : 100,
											url : 'buscaAutorMayorEdad',
											message : 'El autor tiene que ser mayor de edad'
										}
									}
								},
								telefono : {
									selector : '#id_reg_telefono',
									validators : {
										notEmpty : {
											message : 'El teléfono es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]{9}$/,
											message : 'El teléfono es 9 dígitos y en formato numérico'
										},
										remote : {
											delay : 100,
											url : 'buscaPorTelefonoPorAutor',
											message : 'El teléfono ya existe'
										}
									}

								},
								pais : {
									selector : '#id_reg_pais',
									validators : {
										notEmpty : {
											message : 'País es un campo obligatorio'
										},
									}
								},
								grado : {
									selector : '#id_reg_grado',
									validators : {
										notEmpty : {
											message : 'Grado es un campo obligatorio'
										},
									}
								},

							}
						});
		
		function accionEliminar(id){	
		    $.ajax({
		          type: "POST",
		          url: "eliminaCrudAutor", 
		          data: {"id":id},
		          success: function(data){
		        	  agregarGrilla(data.lista);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		     });
		}
		
		function editar(idAutor,nombres,apellidos,fechaNacimiento,telefono,idPais,idDataCatalogo){	
			$('#id_ID').val(idAutor);
			$('#id_act_nombres').val(nombres);
			$('#id_act_apellidos').val(apellidos);
			$('#id_act_fechaNacimiento').val(fechaNacimiento);
			$('#id_act_telefono').val(telefono);
			$('#id_act_pais').val(idPais);
			$('#id_act_grado').val(idDataCatalogo);
			$('#id_div_modal_actualiza').modal("show");
		}
		
		$('#id_form_actualiza').bootstrapValidator({
		    message: 'This value is not valid',
		    feedbackIcons: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		    },
		    fields: {
					nombres : {
						selector : '#id_act_nombres',
						validators : {
							notEmpty : {
								message : 'El nombre es un campo obligatorio'
							},
							stringLength : {
								message : 'El nombre es de 2 a 40 carácteres',
								min : 2,
								max : 40
							},
							regexp : {
								regexp : /^[a-zA-Z\s]+$/,
								message : 'El nombre solo puede contener letras y espacios'
							},
							remote : {
								delay : 100,
								url : 'buscaAutorNombreApellidoActualiza',
								message : 'El nombre ya existe'
							}
						}
					},
					apellidos : {
						selector : '#id_act_apellidos',
						validators : {
							notEmpty : {
								message : 'El apellido es un campo obligatorio'
							},
							stringLength : {
								message : 'El apellido es de 2 a 40 carácteres',
								min : 2,
								max : 40
							},
							regexp : {
								regexp : /^[a-zA-Z\s]+$/,
								message : 'El apellido solo puede contener letras y espacios'
							},
							remote : {
								delay : 100,
								url : 'buscaAutorNombreApellidoActualiza',
								message : 'El apellido ya existe'
							}

						}
					},
					fechaNacimiento : {
						selector : "#id_act_fechaNacimiento",
						validators : {
							notEmpty : {
								message : 'La fecha es obligatorio'
							},
							remote : {
								delay : 100,
								url : 'buscaAutorMayorEdad',
								message : 'El autor tiene que ser mayor de edad'
							}
						}
					},
					telefono : {
						selector : '#id_act_telefono',
						validators : {
							notEmpty : {
								message : 'El teléfono es un campo obligatorio'
							},
							regexp : {
								regexp : /^[0-9]{9}$/,
								message : 'El teléfono es 9 dígitos y en formato numérico'
							}
						}

					},
					pais : {
						selector : '#id_act_pais',
						validators : {
							notEmpty : {
								message : 'País es un campo obligatorio'
							},
						}
					},
					grado : {
						selector : '#id_act_grado',
						validators : {
							notEmpty : {
								message : 'Grado es un campo obligatorio'
							},
						}
					},
		    }   
		}); 
		
	</script>
</body>
</html>