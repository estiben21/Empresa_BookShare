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

<title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<form id="id_form" >
<div class="container" style="margin-top: 5%">
<h3>Consultar Revista</h3>
	<div class="container">
			<div class="row" style="margin-top: 1%">
			<div class="col-md-6">
				<label class="control-label" for="id_nombre">Nombre:</label> 
				<input class="form-control" type="text" id="id_nombre"	name="paramNombre">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_frecuencia">Frecuencia:</label> 
				<input class="form-control" type="text" id="id_frecuencia"	name="paramFrecuencia">
			</div>
			</div>
			<div class="row" style="margin-top: 1%">
			<div class="col-md-6">
				<label class="control-label" for="id_fechaCreacionDesde">Fecha Creación (Desde): </label> 
				<input class="form-control" type="date" id="id_fechaCreacionDesde" name="paramFechaCreacionDesde" value="1900-01-01">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_fechaCreacionHasta">Fecha Creación (Hasta): </label> 
				<input class="form-control" type="date" id="id_fechaCreacionHasta" name="paramFechaCreacionHasta" value="2900-01-01">
			</div>
			</div>
			<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_pais">País</label> 
				<select id="id_pais" name="paramPais" class='form-control'>
					<option value="-1">(Todos)</option>
				</select>
			</div>
			<div class="col-md-4">
				<label class="control-label" for="id_tipoRevista">Tipo Revista</label> 
				<select id="id_tipoRevista" name="paramTipoRevista" class='form-control'>
					<option value="-1">(Todos)</option>
				</select>
			</div>
			<div class="col-md-2">
				<label class="control-label" for="id_estado">Estado</label> 
				<input class="form-control" type="checkbox" id="id_estado" name="paramEstado" checked="checked">
			</div>
		  </div>
		</div>
		<div class="row" style="margin-top: 3%">
			<div class="col-md-12" align="center">
				<button type="button" class="btn btn-primary" id="id_btn_filtra">FILTRA</button>
				<button type="button" class="btn btn-danger" id="id_btn_reporte">PDF</button>
			</div>
		</div>
			<div class="row" style="margin-top: 3%">
			<div class="col-md-12">
				<table id="id_table" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width: 10%">Código</th>
							<th style="width: 20%">Nombre</th>
							<th style="width: 20%">Frecuencia</th>
							<th style="width: 15%">Fecha Creación</th>
							<th style="width: 10%">Pais</th>
							<th style="width: 10%">Tipo de revista</th>
							<th style="width: 15%">Estado</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		</div>
</form>
<script type="text/javascript">
<!-- Agregar aquí -->
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});

$.getJSON("listaTipoLibroRevista", {}, function(data){
	$.each(data, function(index,item){
		$("#id_tipoRevista").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});

$("#id_btn_reporte").click(function(){
	$("#id_form").attr('action', 'reporteEmpleadoPdf');
	$("#id_form").submit();
});

///////////////////////////////////////////////////////////////////////////

$("#id_btn_filtra").click(function(){
	var varNombre = $("#id_nombre").val();
	var varFrecuencia = $("#id_frecuencia").val();
	var varFecheCreacionDesde = $("#id_fechaCreacionDesde").val() == '' ?'1900-01-01' : $("#id_fechaCreacionDesde").val();
	var varFecheCreacionHasta = $("#id_fechaCreacionHasta").val() == '' ?'9999-01-01' : $("#id_fechaCreacionHasta").val();
	var varPais = $("#id_pais").val();
	var varTipoRevista = $("#id_tipoRevista").val();
	var varEstado = $("#id_estado").is(':checked') ? 1 : 0; 
	
	console.log(">> varNombre >> " + varNombre );
	console.log(">> varFrecuencia >> " + varFrecuencia );
	console.log(">> varFecheCreacionDesde >> " + varFecheCreacionDesde );
	console.log(">> varFecheCreacionHasta >> " + varFecheCreacionHasta );
	console.log(">> varPais >> " + varPais );
	console.log(">> varTipoRevista >> " + varTipoRevista );
	console.log(">> varEstado >> " + varEstado );
	
	if (valFechaInicioMayFechaFin("#id_fechaCreacionDesde", "#id_fechaCreacionHasta")){
		mostrarMensaje("La fecha hasta es superior a la fecha desde");
		return;
	}
	
	$.getJSON("consultarRevista", {"nombre": varNombre, 
								   "frecuencia": varFrecuencia, 
								   "desde": varFecheCreacionDesde,
								   "hasta": varFecheCreacionHasta,
								   "idPais": varPais, 
								   "idDataCatalogo": varTipoRevista, 
								   "estado": varEstado }, function(data){
		agregarGrilla(data);
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
				{data: "idRevista"},
				{data: "nombre"},
				{data: "frecuencia"},
				{data: "fechaCreacion"},
				{data: "pais.nombre"},
				{data: "tipoRevista.descripcion"},
				{data: function(row, type, val, meta){
					var salida = (row.estado == 1) ? 'Activo' : "Inactivo" ;
					return salida;
				},className:'text-center'},	
			]                                     
	    });
}
</script>   		
</body>
</html>