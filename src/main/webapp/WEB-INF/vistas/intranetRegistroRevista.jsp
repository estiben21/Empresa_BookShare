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
<div class="container" style="margin-top: 4%"><h4>Registro Revista</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->
	<form  id="id_form" method="post"> 
	 <div class="col-md-12" style="margin-top: 2%">
			<div class="row">
			<div class="row" style="margin-top: 0%">
				<div class="form-group col-md-4">
					<label class="control-label" for="id_nombre">Nombre :</label>
					<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre de la revista">
				</div>
				<div class="form-group col-md-4">
					<label class="control-label" for="id_frecuencia">Frecuencia :</label>
					<input class="form-control" type="text" id="id_frecuencia" name="frecuencia" placeholder="Ingrese la frecuencia">
				</div>
				<div class="form-group  col-sm-4">
					<label class="control-label" for="id_fechaCreacion">Fecha de creación:</label>
					<input class="form-control" type="date" id="id_fechaCreacion" name="fechaCreacion" placeholder="Ingrese la fecha de creación" maxlength="100">
		 		</div>
			</div>
			</div>
			</div>
			<div class="row" style="margin-top: 0%">
				<div class="form-group col-md-4">
					<label class="control-label" for="id_pais">País :</label>
					<select id="id_pais" name="pais.idPais" class='form-control'>
						<option value=" ">Seleccione:</option>    
					</select>
			    </div>
			    <div class="form-group col-md-4">
					<label class="control-label" for="id_tipoRevista">Tipo de revista :</label>
					<select id="id_tipoRevista" name="tipoRevista.idDataCatalogo" class='form-control'>
						<option value=" ">Seleccione:</option>    
					</select>
			    </div>
			</div>
		    <div class="row">
				<div class="form-group col-md-12" align="center">
					<button id="id_registrar" type="button" class="btn btn-primary" >REGISTRAR</button>
				</div>
			</div>
	</form>
</div>

<script type="text/javascript">
<!-- Agregar aquí -->
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});

$.getJSON("listaTipoLibroRevista", {}, function(data){
	$.each(data, function(index,item){
		$("#id_tipoRevista").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});

$("#id_registrar").click(function(){ 

	//Lanza la validacion
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
  
    //Pregunta si es valido el formulario(Si no tiene errores)
	if (validator.isValid()){
		$.ajax({
    		type: "POST",
            url: "registraRevista", 
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
	$('#id_nombre').val('');
	$('#id_frecuencia').val('');
	$('#id_fechaCreacion').val('');
	$('#id_pais').val('');
	$('#id_tipoRevista').val('');
}

$(document).ready(function() {
$('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 20,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                        remote:{
                        	deplay:1000,
                        	url: 'buscaPorNombreRevista',
                        	message: "el nombre ya existe"
                        }
                    }
                },
                frecuencia:{
                    selector: "#id_frecuencia",
                    validators:{
                        notEmpty: {
                             message: 'La frecuencia es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 20,
                            message: 'La frecuencia es de 3 a 40 caracteres'
                        },
                    }
                },
                fechaCreacion:{
                    selector: "#id_fechaCreacion",
                    validators:{
                        notEmpty: {
                             message: 'La fecha de creación es obligatorio'
                        }
                    }
                },
                pais: {
            		selector : '#id_pais',
                    validators: {
                    	notEmpty: {
                            message: 'País es un campo obligatorio'
                        },
                    }
                },
                tipoRevista: {
            		selector : '#id_tipoRevista',
                    validators: {
                    	notEmpty: {
                            message: 'Tipo de revista es un campo obligatorio'
                        },
                    }
                },
        }   
    });
}); 
    
</script>   		
</body>
</html>