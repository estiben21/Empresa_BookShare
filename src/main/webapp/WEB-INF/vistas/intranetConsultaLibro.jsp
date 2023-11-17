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
<div class="container" style="margin-top: 4%"><h3>Consulta Libro</h3></div>
<form id="id_form" >
	<div class="container" style="margin-top: 1%">
		<div class="row" style="margin-top: 3%">
			<div class="col-md-6">
				<label class="control-label" for="id_titulo">Título</label> 
				<input class="form-control" type="text" id="id_titulo" name="paramTitulo">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_estado">Estado</label> 
				<input class="form-control" type="checkbox" id="id_estado" name="paramEstado" checked="checked">
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-6">
				<label class="control-label" for="id_anio">Año</label> 
				<input class="form-control" type="number" id="id_anio" name="paramAnio" value="2020">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_serie">Serie</label> 
				<input class="form-control" type="text" id="id_serie" name="paramSerie">
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-6">
				<label class="control-label" for="id_categoria">Categoría</label> 
				<select id="id_categoria" name="paramCategoria" class='form-control'>
					<option value="-1">[ Todos ]</option>
				</select>
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_tipo">Tipo</label> 
				<select id="id_tipo" name="paramTipo" class='form-control'>
					<option value="-1">[ Todos ]</option>
				</select>
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
							<th style="width: 5%" >Código</th>
							<th style="width: 25%">Título</th>
							<th style="width: 10%">Año</th>
							<th style="width: 12%">Serie</th>
							<th style="width: 17%">Categoria</th>
							<th style="width: 17%">Tipo</th>
							<th style="width: 14%">Estado</th>
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
$.getJSON("listaCategoriaDeLibro", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_categoria").append(
				"<option value="+item.idDataCatalogo +">" + item.descripcion
						+ "</option>");
	});
});

$.getJSON("listaTipoLibroRevista", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_tipo").append(
				"<option value="+item.idDataCatalogo +">" + item.descripcion
						+ "</option>");
	});
});

$("#id_btn_reporte").click(function(){
	$("#id_form").attr('action', 'reporteLibroPdf');
	$("#id_form").submit();
});

$("#id_btn_filtra").click(function(){
	var varEstado = $("#id_estado").is(':checked') ? 1 : 0;  
	var varCategoria = $("#id_categoria").val();
	var varTipo = $("#id_tipo").val();
	var varTitulo = $("#id_titulo").val();
	var varSerie = $("#id_serie").val();
	var varAnio = $("#id_anio").val();
	
	varAnio = varAnio === "" ? -1 : parseInt(varAnio);
	console.log(">> varEstado >> " + varEstado );
	console.log(">> varCategoria >> " + varCategoria );
	console.log(">> varTipo >> " + varTipo );
	console.log(">> varTitulo >> " + varTitulo );
	console.log(">> varSerie >> " + varSerie );
	console.log(">> varAnio >> " + varAnio );
	
	
	$.getJSON("consultaLibro", {"estado": varEstado, 
								"idCategoria": varCategoria,
								"idTipo": varTipo,
								"titulo": varTitulo,
								"serie": varSerie,
								"anio": varAnio }, function(data){
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
			{data: "idLibro"},
			{data: "titulo"},
			{data: "anio"},
			{data: "serie"},
			{data: "categoriaLibro.descripcion"},
			{data: "tipoLibro.descripcion"},
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