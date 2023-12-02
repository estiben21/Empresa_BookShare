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
		<h4>Préstamo de Libro</h4>
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
					<div class="col-lg-offset-5">Prestamo</div>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-lg-12">
							<table id="id_table_boleta"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th style="width: 10%">Código</th>
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
		</form>
	</div>
	<script type="text/javascript">
		function muestraAlumno() {
			var var_alumno = $("#id_txtAlumno").val();

			//limpiar la tabla
			$("#id_table_alumno tbody").empty();

			//Se añade los clientes a la tabla
			$
					.getJSON(
							"cargaAlumno",
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
		//Al pulsar el botón cliente
		$("#id_btnAlumno").click(function() {
			muestraAlumno();
			$("#idBuscaAlumno").modal("show");
		});
		//Al escribir en la caja de texto del cliente
		$("#id_txtAlumno").keyup(function(e) {
			muestraAlumno();
		});

		//Se anula el enter
		$(document).on("keypress", "form", function(event) {
			return event.keyCode != 13;
		});

		//Al pulsar selecciona cliente
		function f_seleccione_alumno(idAlumno, nombres, apellidos) {
			$("#id_alumno_nombres").val(nombres + " " + apellidos);
			$("#idBuscaAlumno").modal("hide");
			}
			
			
	</script>
</body>
</html>