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
<div class="container" style="margin-top: 4%"><h4>Registro Libro</h4></div>

<div class="container" style="margin-top: 1%">

	<form  id="id_form" method="post"> 
	 <div class="col-md-12" style="margin-top: 2%">
			<div class="row">
				<div class="form-group col-md-9">
					<label class="control-label" for="id_titulo">Titulo</label>
					<input class="form-control" type="text" id="id_titulo" name="titulo" placeholder="Ingrese el tìtulo del Libro">
				</div>
				<div class="form-group col-md-3">
					<label class="control-label" for="id_año">Año</label>
					<input class="form-control" type="text" id="id_año" name="año" placeholder="Ingrese el años del Libro">
				</div>
				<div class="form-group col-md-3">
					<label class="control-label" for="id_serie">Serie</label>
					<input class="form-control" type="text" id="id_serie" name="serie" placeholder="Ingrese la serie del Libro">
				</div>
				<div class="form-group col-md-3">
					<label class="control-label" for="id_categoriaLibro">Categoria</label>
					<select id="id_categoriaLibro" name="dataCatalogo.idCategoriaLibro" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
			    </div>
			    <div class="form-group col-md-3">
					<label class="control-label" for="id_tipo">Tipo</label>
					<select id="id_tipo" name="dataCatalogo.idTipoLibro" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
			    </div>
			</div>
		    <div class="row">
				<div class="form-group col-md-12" align="center">
					<button id="id_registrar" type="button" class="btn btn-primary" >Registra</button>
				</div>
			</div>
	</div>
	</form>
	
</div>

<script type="text/javascript">
$.getJSON("listaCategoriaDeLibro", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_categoriaLibro").append(
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

$("#id_registrar").click(function (){ 
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
    
	if (validator.isValid()){
		$.ajax({
    		type: "POST",
            url: "registraLibro", 
            data: $('#id_form').serialize(),
            success: function(data){
            	mostrarMensaje(data.MENSAJE);
            	validator.resetForm();
            	limpiarFormulario();
            },
            error: function(){
            	mostrarMensaje(MSG_ERROR);
            }
    	});
	}   
});

function limpiarFormulario(){
	$("#id_titulo").val('');
	$("#id_año").val(' ');
	$("#id_serie").val(' ');
	$("#id_categoria").val(' ');
	$("#id_tipo").val(' ');
}

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        titulo: {
            validators: {
                notEmpty: {
                    message: 'El título es un campo obligatorio'
                },
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'El título debe tener entre 2 y 40 caracteres'
                }
            }
        },
        año: {
            validators: {
                notEmpty: {
                    message: 'El año es un campo obligatorio'
                },
                regexp: {
                    regexp: /^\d{4}$/,
                    message: 'El año debe ser un número de 4 dígitos'
                }
            }
        },
        serie: {
            validators: {
                notEmpty: {
                    message: 'La serie es un campo obligatorio'
                },
                regexp: {
                    regexp: /^[A-Za-z]{2}\d{3}$/,
                    message: 'La serie debe tener 2 letras seguidas de 3 dígitos'
                }
            }
        },
        'dataCatalogo.idCategoriaLibro': {
            validators: {
                notEmpty: {
                    message: 'Debe seleccionar una Categoria'
                }
            }
        },
        'dataCatalogo.idTipoLibro': {
            validators: {
                notEmpty: {
                    message: 'Debe seleccionar un Tipo'
                }
            }
        }
    }
});


</script>   		
</body>
</html>