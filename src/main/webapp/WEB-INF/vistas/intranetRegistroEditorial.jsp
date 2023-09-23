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
<div class="container" style="margin-top: 4%"><h4>Registro Editorial</h4></div>

<div class="container" style="margin-top: 1%">
<!-- formulario -->

<form id="id_form" method="post" action="registraEditorial">
	 <div class="col-md-12" style="margin-top: 2%">
	 
	 
			<div class="row">
			
			<!-- RAZON SOCIAL -->
				<div class="form-group col-md-6">
					<label class="control-label" for="id_razonSocial">Razón Social</label>
					<input class="form-control" type="text" id="id_razonSocial" name="razonSocial" placeholder="Ingrese la razon social">
				</div>
			<!-- DIRECCION -->
			<div class="form-group col-md-6">
					<label class="control-label" for="id_direccionl">Dirección</label>
					<input class="form-control" type="text" id="id_direccion" name="direccion" placeholder="Ingrese la direccion">
				</div>
			<!-- RUC (NUMEROS 11 DIGITOS) -->
			<div class="form-group col-md-6">
					<label class="control-label" for="id_ruc">RUC</label>
					<input class="form-control" type="text" id="id_ruc" name="ruc" placeholder="Ingrese el RUC" maxlength="11">
				</div>
			<!-- FECHA CREACION -->
			<div class="form-group col-sm-6">
    <label class="control-label" for="id_fechaCreacion">Fecha Creación</label>
    <input class="form-control" type="date" id="id_fechaCreacion" name="fechaCreacion" placeholder="Ingrese la fecha de creación" maxlength="100">
</div>

		
			<!-- PAIS (CBO) -->
			    <div class="form-group col-md-3">
					<label class="control-label" for="id_pais">Pais</label>
					<select id="id_pais" name="pais.idPais" class='form-control'>
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
<!-- SCRIPT -->
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});

$("#id_registrar").click(function (){ 
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
    
	if (validator.isValid()){
		$.ajax({
    		type: "POST",
            url: "registraEditorial", 
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
	$("#id_razonSocial").val('');
	$("#id_direccion").val('');
	$("#id_ruc").val('');
	$("#id_fechaCreacion").val('');
	$("#id_pais").val(' ');
}

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	razonSocial:{
            selector: "#id_razonSocial",
            validators:{
                notEmpty: {
                     message: 'La razón social es obligatoria'
                },
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'La razón social es de 2 a 40 caracteres'
                },
            }
        },
        direccion:{
            selector: "#id_direccion",
            validators:{
                notEmpty: {
                     message: 'La direccion es obligatorio'
                },
                stringLength: {
                    min: 3,
                    max: 40,
                    message: 'La direccion es de 3 a 40 caracteres'
                },
            }
        },
        ruc:{
            selector: "#id_ruc",
            validators:{
                notEmpty: {
                     message: 'El RUC es obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{11}$/,
                    message: 'El RUC es 11 dígitos y en formato numérico'
                },
                remote:{
                	delay:1000,
                	url: 'buscaPorRucEditorial',
                	message: 'El RUC ya existe'
                }
            }
        },
        fechaCreacion:{
            selector: "#id_fechaCreacion",
            validators:{
                notEmpty: {
                     message: 'La fecha de creación es obligatoria'
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
    	
    }   
});

</script>   		
</body>
</html>