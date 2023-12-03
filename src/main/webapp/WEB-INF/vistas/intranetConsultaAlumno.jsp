<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Consulta de Alumnos</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<form id="id_form">
<div class="container" style="margin-top: 4%"><h4>Consulta Alumno</h4>
		<div class="row" style="margin-top: 1%">
			<div class="col-md-6">
				<label class="control-label" for="id_nombres_apellidos">Nombres y Apellidos</label> 
				<input class="form-control" type="text" id="id_nombres_apellidos"	name="paramNomApe">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_estado">Estado</label> 
				<input class="form-control" type="checkbox" id="id_estado" name="paramEstado" checked="checked">
			</div>
		</div>
		<div class="row" style="margin-top: 1%">
			<div class="col-md-6">
				<label class="control-label" for="id_telefono">Teléfono</label> 
				<input class="form-control" type="text" id="id_telefono"	name="paramTelefono">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_dni">DNI</label> 
				<input class="form-control" type="text" id="id_dni" name="paramDni">
			</div>
		</div>
		<div class="row" style="margin-top: 1%">
			<div class="col-md-6">
				<label class="control-label" for="id_correo">Correo electrónico</label> 
				<input class="form-control" type="text" id="id_correo"	name="paramCorreo">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_pais">País</label> 
				<select id="id_pais" name="paramPais" class='form-control'>
					<option value="-1">[Todos]</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin-top: 1%">	
			<div class="col-md-6">
				<label class="control-label" for="id_modalidad">Modalidad</label> 
				<select id="id_modalidad" name="paramModalidad" class='form-control'>
					<option value="-1">[Todos]</option>
				</select>
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_fechaNacimientoDesde">Fecha de nacimiento [Desde]</label> 
				<input class="form-control" type="date" id="id_fechaNacimientoDesde" name="paramFechaNacDesde" value="1900-01-01">
			</div>
		</div>
		<div class="row" style="margin-top: 1%">	
			<div class="col-md-6">
					<label class="control-label" for="id_fechaNacimientoHasta">Fecha de nacimiento [Hasta]</label> 
					<input class="form-control" type="date" id="id_fechaNacimientoHasta" name="paramFechaNacHasta" value="2900-01-01">
			</div>
		</div>
		<div class="row" style="margin-top: 3%">
			<div class="col-md-12" align="center">
				<button type="button" class="btn btn-primary" id="id_btn_filtra" style="width: 100px">FILTRA</button>
				<button type="button" class="btn btn-primary" id="id_btn_reporte" style="width: 90px">PDF</button>
			</div>
		</div>
		<div class="row" style="margin-top: 3%">
			<div class="col-md-12">
				<table id="id_table" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width: 5%" >Código</th>
							<th style="width: 12%">Nombres</th>
							<th style="width: 13%">Apellidos</th>
							<th style="width: 9%">Teléfono</th>
							<th style="width: 8%">DNI</th>
							<th style="width: 15%">Correo electrónico</th>
							<th style="width: 12%">Fecha de nacimiento</th>
							<th style="width: 10%">País</th>
							<th style="width: 8%">Modalidad</th>
							<th style="width: 7%">Estado</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	
</div>
</form>

<script type="text/javascript">
$("#id_btn_reporte").prop('disabled', true);    

//------------------------ btn FILTRA ---------------------------
$("#id_btn_filtra").click(function(){
	var varNomApe = $("#id_nombres_apellidos").val();
	var varEstado = $("#id_estado").is(':checked') ? 1 : 0; 
	var varTelefono = $("#id_telefono").val();
	var varDni = $("#id_dni").val();
	var varCorreo = $("#id_correo").val();
	var varFechaNacDesde = $("#id_fechaNacimientoDesde").val() == '' ?'1900-01-01' : $("#id_fechaNacimientoDesde").val();
	var varFechaNacHasta = $("#id_fechaNacimientoHasta").val()  == '' ?'9999-01-01' : $("#id_fechaNacimientoHasta").val();
	var varPais = $("#id_pais").val();
	var varModalidad = $("#id_modalidad").val();
	
	if (valFechaInicioMayFechaFin("#id_fechaNacimientoDesde", "#id_fechaNacimientoHasta")){
		mostrarMensaje("La fecha hasta es superior a la fecha desde");
		return;
	}
	
	$.getJSON("consultaAlumno", {"nomApellido":varNomApe,
		"estado":varEstado,
		"telefono":varTelefono,
		"dni":varDni,
		"correo":varCorreo,
		"fechaNacDesde":varFechaNacDesde,
		"fechaNacHasta":varFechaNacHasta,
		"idPais":varPais,
		"idModalidad":varModalidad},
		function (data){
			agregarGrilla(data);
			if (data.length == 0) {
				$("#id_btn_reporte").prop('disabled', true);
	        } else {
	        	$("#id_btn_reporte").prop('disabled', false);
	        }	   
	});
}); 

function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 10,
			lengthChange: false,
			columns:[
				{data: "idAlumno"},
				{data: "nombres"},
				{data: "apellidos"},
				{data: "telefono"},
				{data: "dni"},
				{data: "correo"}, 
				{data: "fechaNacimiento"}, 
				{data: "pais.nombre"},
				{data: "modalidad.descripcion"},
				{data: function(row, type, val, meta){
					var salida= (row.estado == 1)? 'Activo':"Inactivo";
					return salida;
				},className:'text-center'},												
			]                                     
	    });
}
//------------------------ btn PDF ---------------------------
$("#id_btn_reporte").click(function(){
	$("#id_form").attr('action', 'reporteAlumnosPdf');
	$("#id_form").submit();
});
 
//----------------- LISTAR paises en el CBO ---------------------------------------------
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});

//----------------- LISTAR modalidades en el CBO --------------------------------------------- ***************************************++*
$.getJSON("listaModalidadAlumno", {}, function(data){
	$.each(data, function(i,item){
		$("#id_modalidad").append("<option value="+item.idDataCatalogo  +">"+ item.descripcion +"</option>");
	});
});

</script>   		
</body>
</html>