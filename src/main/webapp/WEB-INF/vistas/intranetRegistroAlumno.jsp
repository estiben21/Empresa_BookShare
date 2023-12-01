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
<div class="container" style="margin-top: 4%"><h4>Registro Alumno</h4></div>

<div class="container" style="margin-top: 1%">
<form id="id_form"> 
		<div class="row" style="margin-top: 2%">
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_nombre">Nombres</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_nombres" name="nombres" placeholder="Ingrese los nombres">
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_apellidos">Apellidos</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_apellidos" name="apellidos" placeholder="Ingrese los apellidos">
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="form-group col-sm-6">
					<div class="col-sm-4">
						<label class="control-label" for="id_telefono">Tel&eacute;fono</label>
					</div>
					<div class="col-sm-8">
						<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese el tel&eacute;fono" maxlength="9">
					</div>
			</div>
			<div class="form-group col-sm-6">
					<div class="col-sm-4">
						<label class="control-label" for="id_dni">DNI</label>
					</div>
					<div class="col-sm-8">
						<input class="form-control" type="text" id="id_dni" name="dni" placeholder="Ingrese el DNI" maxlength="8">
					</div>
		</div>
		</div>	
		<div class="row" style="margin-top: 2%">
			<div class="form-group col-sm-6"> 
				<div class="col-sm-4">
					<label class="control-label" for="id_correo">Correo</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_correo" name="correo" placeholder="Ingrese el correo electr&oacute;nico">
				</div>
			</div>
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_fechaNacimiento">Fecha de nacimiento</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="date" id="id_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese la fecha de nacimiento">
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
		<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_pais">Pa&iacute;s</label>
				</div>
				<div class="col-sm-8">
					<select id="id_pais" name="pais.idPais" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
			    </div>
		</div>
		<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_modalidad">Modalidad</label>
				</div>
				<div class="col-sm-8">
					<select id="id_modalidad" name="modalidad.idDataCatalogo" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
			    </div>
			    </div>
		</div>
		
		<div class="row" style="margin-top: 2%" align="center"	>
				<button id="id_registrar" type="button" class="btn btn-primary" >Registrar</button>
		</div>	
	</form>	
</div>

<script type="text/javascript">
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});
$.getJSON("listaModalidadAlumno", {}, function(data){
	$.each(data, function(index,item){
		$("#id_modalidad").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});
$("#id_registrar").click(function (){ 

	var validator = $('#id_form').data('bootstrapValidator');
	validator.validate();

	if (validator.isValid()){
		$.ajax({
			type: 'POST',  
			data: $("#id_form").serialize(),
			url: 'registraAlumno',
			success: function(data){
				mostrarMensaje(data.MENSAJE);
				limpiar();
				validator.resetForm();
			},
			error: function(){
				mostrarMensaje(MSG_ERROR);
			}
		});
	}
});

function limpiar(){
	$("#id_nombres").val('');
	$("#id_apellidos").val('');
	$("#id_telefono").val('');
	$("#id_dni").val('');
	$("#id_correo").val('');
	$("#id_fechaNacimiento").val('');
	$("#id_pais").val(' ');
	$("#id_modalidad").val(' ');
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
        		nombres:{
                    selector: "#id_nombres",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 2,
                            max: 40,
                            message: 'El nombre es de 2 a 40 caracteres'
                        },
                        regexp: {
                        	regexp: /^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$/,
                            message: 'Ingresar nombres con caracteres alfab&eacute;ticos'
                        }
                    }
                },
                apellidos:{
                    selector: "#id_apellidos",
                    validators:{
                        notEmpty: {
                             message: 'Los apellidos son obligatorios'
                        },
                        stringLength: {
                        	min: 2,
                            max: 40,
                            message: 'Los apellidos son de 2 a 40 caracteres '
                        },
                        regexp: {
                        	regexp: /^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$/,
                            message: 'Ingresar apellidos con caracteres alfab&eacute;ticos'
                        }
                    }
                },
                telefono:{
                    selector: "#id_telefono",
                    validators:{
                        notEmpty: {
                             message: 'El tel&eacute;fono es obligatorio'
                        },
                        stringLength: {
                        	min: 9,
                            max: 9,
                            message: 'El tel&eacute;fono es de 9 dÃ­gitos'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: 'Ingresar tel&eacute;fono con caracteres num&eacute;ricos'
                        },
                        remote :{
                            delay: 100,
                            url: 'buscaPorTelefono',
                            message: 'El tel&eacute;fono ya existe'
                        }
                    }
                },
                dni:{
                    selector: "#id_dni",
                    validators:{
                        notEmpty: {
                             message: 'El DNI es obligatorio'
                        },
                        stringLength: {
                        	max: 8,
                        	min: 8,
                            message: 'El DNI es de 8 d&iacute;gitos'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: 'Ingresar DNI con caracteres num&eacute;ricos'
                        }, remote :{
                            delay: 100,
                            url: 'buscaPorDni',
                            message: 'El DNI ya existe'
                        }
                    }
                },
                correo:{
                    selector: "#id_correo",
                    validators:{
                        notEmpty: {
                             message: 'El correo es obligatorio'
                        },
                        emailAddress: {
                            message: 'El correo no es v&aacute;lido'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/,
                            message: 'Ingresar un correo v&aacute;lido'
                        }
                    }
                },
                fechaNacimiento:{
                    selector: "#id_fechaNacimiento",
                    validators:{
                        notEmpty: {
                             message: 'La fecha de nacimiento es obligatoria'
                        }
                    }
                },
                pais:{
                    selector: "#id_pais",
                    validators:{
                        notEmpty: {
                             message: 'El pa&iacute;s es obligatorio'
                        }
                    }
                },
                modalidad:{
                    selector: "#id_modalidad",
                    validators:{
                        notEmpty: {
                             message: 'La modalidad es obligatoria'
                        }
                    }
                },
        }   
    });
});

</script>   		
</body>
</html>