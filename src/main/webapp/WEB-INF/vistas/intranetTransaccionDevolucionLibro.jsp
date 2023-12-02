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
		<h4>PrÃ©stamo de Libro</h4>
	</div>
	<div class="container" style="margin-top: 1%">
		<form id="id_form" accept-charset="UTF-8" action="boleta"
			class="form-horizontal" method="post">
			<div class="panel panel-default">
				<div class="panel-heading">Prestamo</div>
				<div class="panel-body">
					<div class="form-group  col-md-5">
						<label class="col-lg-2 control-label">Alumno:</label>
						<div class="col-lg-10 input-group">
							<input type="text" id="id_alumno_nombres" class="form-control"
								placeholder="Nombre" readonly="readonly" />
						</div>
					</div>
					<div class="form-group col-md-4">
						<div class="col-lg-6">
							<button type="button" id="id_btnAlumno" data-toggle='modal'
								class='btn btn-primary' style="width: 150px">BUSCAR
								ALUMNO</button>
							<input type="hidden" name="idAlumno" id="id_alumno_id"
								class="form-control" value="-1" />
						</div>
					</div>
					<div class="form-group  col-sm-3">
						<label class="control-label" for="id_fechaDevolucion">Fecha
							de devolucion:</label> <input class="form-control" type="date"
							id="id_fechaDevolucion" name="fechaDevolucion"
							placeholder="Ingrese la fecha de devolucion" maxlength="100">
					</div>
					<div class="form-group  col-md-5">
						<label class="col-lg-2 control-label">Libros</label>
						<div class="col-lg-10 input-group">
							<input type="text" id="id_libros" class="form-control"
								placeholder="Nombre" readonly="readonly" />
						</div>
					</div>
					<div class="form-group col-md-4">
						<div class="col-lg-6">
							<button type="button" id="id_btnLibro" data-toggle='modal'
								class='btn btn-primary' style="width: 160px">BUSCAR
								LIBRO</button>
							<input type="hidden" name="idLibro" id="id_libro_id"
								class="form-control" value="-1" />
						</div>
					</div>
					<div class="col-lg-4 col-lg-offset-10">
						<button type="button" id="id_btnAgregar" class="btn btn-primary"
							style="width: 170px">AGREGAR</button>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="col-lg-offset-5">Devolucion</div>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-lg-12">
							<table id="id_table_devolucion"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th style="width: 10%">Codigo</th>
										<th style="width: 35%">Alumno</th>
										<th style="width: 30%">Libro</th>
										<th style="width: 25%">F. Devolucion</th>
									</tr>
								</thead>
								<tbody id="id_table_prestamo_body">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- El formulario de busqueda de Alumno (Modal) -->
			<div class="modal fade" id="idBuscaAlumno">
				<div class="modal-dialog" style="width: 25%">
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4>
								<span class="glyphicon glyphicon-ok-sign"></span> Busqueda de
								Alumno
							</h4>
						</div>

						<div class="modal-body" style="padding: 20px 10px;">
							<div class="panel-group" id="steps">
								<div class="panel panel-default">
									<div class="form-group">
										<label class="col-lg-3 control-label"> Alumno </label>
										<div class="col-lg-5">
											<input id="id_txtAlumno" class="form-control" name="alumno"
												type="text" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-lg-12">
											<table id="id_table_alumno"
												class="table table-striped table-bordered">
												<thead>
													<tr>
														<th style="width: 5%">Id Alumno</th>
														<th style="width: 10%">Nombres</th>
														<th style="width: 10%">Apellidos</th>
														<th style="width: 5%"></th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
		
		<!-- El formulario de busqueda de Libro Pendiente (Modal) -->
			
				 <div class="modal fade" id="idBuscaLibro" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Busqueda de Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						    <div class="panel-group" id="steps">
		                        <div class="panel panel-default">
											<div class="form-group">
													<label class="col-lg-3 control-label">
														Libro 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtLibro" class="form-control" name="libro" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_Libro" class="table table-striped table-bordered" >
														<thead>
															<tr>
																<th style="width: 15%">Id</th>
																<th style="width: 45%">Titulo</th>
																<th style="width: 15%">Estado</th>
																<th style="width: 10%"></th>
															</tr>
														</thead>
														<tbody>

														</tbody>				
												</table>
												</div>
											</div>
		                        </div>
		                    </div>
				</div>
			</div>
			</div>
		</div>
		
			<!-- Modal Mensaje -->	
		  <div class="modal fade" id="idMensaje" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 20px 20px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Mensaje</h4>
				</div>
				<div  id="idMensajeTexto" class="modal-body" style="padding: 30px 30px;align-content: center;">
					
			    </div>
			</div>
			</div>
		</div>
			
		</form>
	</div>
	<script type="text/javascript">
		function muestraAlumno() {
			var var_alumno = $("#id_txtAlumno").val();

			//limpiar la tabla
			$("#id_table_alumno tbody").empty();

			//Se añade los alumno a la tabla
			$
					.getJSON(
							"listaAlumnoDevolucion",
							{
								"filtro" : var_alumno
							},
							function(data) {
								$
										.each(
												data,
												function(index, item) {
													$('#id_table_alumno')
															.append(
																	"<tr><td>"
																			+ item.idAlumno
																			+ "</td><td>"
																			+ item.nombres
																			+ "</td><td>"
																			+ item.apellidos
																			+ "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_alumno('"
																			+ item.idAlumno
																			+ "','"
																			+ item.nombres
																			+ "','"
																			+ item.apellidos
																			+ "');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
												});
							});
		}
		
		
		function muestraLibro(){
			var var_libro = $("#id_txtLibro").val();

			//limpiar la tabla
			$("#id_table_Libro tbody").empty();
			
			//Se añade los libros a la tabla
			$.getJSON("listaLibroDevolucion",{"filtro":var_libro}, function (data){
				$.each(data, function(index, item){
					$('#id_table_libro').append("<tr><td>" +item.idLibro 
														   + "</td><td>"
														   +item.titulo 
														   + "</td><td>"
														   +item.estado 
														   + "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_libro('"
														   + item.idLibro
														   +"','"
														   + item.titulo
														   +"','"
														   + item.estado
														   +"');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
				});
			});
		}

		
		
		//Al pulsar el botÃ³n cliente
		$("#id_btnAlumno").click(function() {
			muestraAlumno();
			$("#idBuscaAlumno").modal("show");
		});
		//Al escribir en la caja de texto del cliente
		$("#id_txtAlumno").keyup(function(e) {
			muestraAlumno();
		});

		//Al pulsar selecciona alumno
		function f_seleccione_alumno(idAlumno, nombres, apellidos) {
			$("#id_alumno_nombres").val(nombres + " " + apellidos);
			$("#idBuscaAlumno").modal("hide");
			}
			
		
		//Al pulsar el botón libro
		$("#id_btnLibro").click(function (){
			muestraLibro();
			$("#idBuscaLibro").modal("show");
		});
		
		//Al escribir en la caja de texto del libro
		$("#id_txtLibro").keyup( function (e){
			muestraLibro();
		});
		
		//Al pulsar selecciona libro
		function f_seleccione_libro(idLibro, titulo, estado) {
			$("#id_libros_titulo").val(titulo);
			$("#idBuscaLibro").modal("hide");
			}
			
		//Se anula el enter
		$(document).on("keypress", "form", function(event) {
			return event.keyCode != 13;
		});
		
		
		
		
		
		/* 
		
		//Al pulsar el botón agregar
		$("#id_btnAgregar").click(function (){
			var var_lib = $("#id_libros_id").val();
			var var_est = $("#id_libros_estado").val();
			
			
			//Validar duplicados
			var yaExiste = false;
			$("#id_table_devolucion_body tr").each(function() {
				if($(this).find('td:eq(0)').html() == var_pro){
					yaExiste = true;
				}
			});
			
			if ( var_pro == '-1' ){
				$("#idMensajeTexto").text("Seleccione un Libro");
				$("#idMensaje").modal("show");
			}else if (yaExiste){
				$("#idMensajeTexto").text("Existe el libro elegido");
				$("#idMensaje").modal("show");
			}else{
				
				var var_nom = $("#id_libros_titulo").val();
				var var_est = $("#id_libros_estado").val();
						
				//limpiar la tabla
				$("#id_table_boleta_body").empty();
					
				var jsonParam = {"idLibro":var_pro,"nombre":var_nom,"precio":var_est};
				
				$.ajax({
					url:  'agregarSeleccion',
					type: 'POST',
					dataType:'json',
					data: jsonParam,
					success:function(data){
						console.log(data);
						if(data != null){
							$.each(data, function(index, item){
								$('#id_table_boleta_body').append("<tr><td>" +item.idLibro + "</td><td>" +item.titulo + "</td><td>" +item.estado + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idLibro +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");
							});
							
						}else
							swal("Error al agregar la selección del libro","","error");
							return false;
						},
					error: function (jqXhr) { 
						swal("Error en la conexión","","error");
					}
			   });	
				   
		
		
				*/	
		
		
		
		
		
	</script>
</body>
</html>