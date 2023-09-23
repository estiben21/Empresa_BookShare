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
<div class="container" style="margin-top: 4%"><h4>Registro Sala</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->
	
	<form  id="id_form" method="post"> 
	 <div class="col-md-12" style="margin-top: 2%">
			<div class="row">
			
				<div class="form-group col-md-9">
					<label class="control-label" for="id_numero">Número</label>
					<input class="form-control" type="text" id="id_numero" name="numero" placeholder="Ingrese el número">
				</div>
				
				<div class="form-group col-md-9">
					<label class="control-label" for="id_piso">Piso</label>
					<input class="form-control" type="text" id="id_piso" name="piso" placeholder="Ingrese el piso">
				</div>
				
				<div class="form-group col-md-9">
					<label class="control-label" for="id_cantAlumnos">Cantidad de Alumnos</label>
					<input class="form-control" type="text" id="id_cantAlumnos" name="numAlumnos" placeholder="Ingrese la cantidad de alumnos">
				</div>
				
				<div class="form-group col-md-9">
					<label class="control-label" for="id_recursos">Recursos</label>
					<input class="form-control" type="text" id="id_recursos" name="recursos" placeholder="Ingrese los recursos">
				</div>
				
				
				<div class="form-group col-md-9">
					<label class="control-label" for="id_tipo">Tipo</label>
					<select id="id_tipo" name="tipoSala.idDataCatalogo" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
			    </div>
			    <div class="form-group col-md-9">
					<label class="control-label" for="id_sede">Sede</label>
					<select id="id_sede" name="sede.idDataCatalogo" class='form-control'>
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

$.getJSON("listaTipoSala", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_tipo").append(
				"<option value="+item.idDataCatalogo +">" + item.descripcion
						+ "</option>");
	});
	
	
});

$.getJSON("listaSede", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_sede").append(
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
            url: "registraSala", 
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
	$("#id_numero").val('');
	$("#id_piso").val('');
	$("#id_cantAlumnos").val('');
	$("#id_recursos").val('');
	$("#id_tipo").val(' ');
	$("#id_sede").val(' ');
}

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	numero: {
    	    selector: '#id_numero',
    	    validators: {
    	        notEmpty: {
    	            message: 'El número es un campo obligatorio'
    	        },
    	        regexp: {
    	            regexp: /^[A-Za-z]\d{3}$/,
    	            message: 'El número debe consistir en un carácter y tres dígitos.'
    	        },
    	        remote :{
                	delay   : 1000,
                	url     : 'buscaPorNumeroSala',
                	message : 'El número ya existe'
                }
    	    }
    	},
    	 piso:{
             selector: "#id_piso",
             validators:{
                 notEmpty: {
                      message: 'El piso es obligatorio'
                 },
                 regexp: {
                     regexp: /^[0-9]{2}$/,
                     message: 'El Piso debe tener dos dígitos'
                 },
                 
             }
         },
         numAlumnos:{
             selector: "#id_cantAlumnos",
             validators:{
                 notEmpty: {
                      message: 'La cantidad de alumnos es obligatorio'
                 },
                 regexp: {
                     regexp: /^[0-9]{2}$/,
                     message: 'La cantidad de alumnos debe tener dos dígitos'
                 },
                 
             }
         },
         Recursos: {
     		selector : '#id_recursos',
             validators: {
                 notEmpty: {
                     message: 'los recursos es un campo obligatorio'
                 },
                 stringLength :{
                 	message:'los recursos es de 2 a 40 caracteres',
                 	min : 2,
                 	max : 40
                 },
             }
         },
     	
     }   
 });

</script>   		
</body>
</html>