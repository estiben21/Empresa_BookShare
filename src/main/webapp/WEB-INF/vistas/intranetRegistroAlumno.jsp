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
		<div class="row" style="margin-top: 5%">
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
		<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-6">
					<div class="col-sm-4">
						<label class="control-label" for="id_telefono">Teléfono</label>
					</div>
					<div class="col-sm-8">
						<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese el teléfono">
					</div>
			</div>
		</div>	
		<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-6">
					<div class="col-sm-4">
						<label class="control-label" for="id_dni">DNI</label>
					</div>
					<div class="col-sm-8">
						<input class="form-control" type="text" id="id_dni" name="dni" placeholder="Ingrese el DNI">
					</div>
			</div>
		</div>	
		<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_correo">Correo</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_correo" name="correo" placeholder="Ingrese el correo electrónico">
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
		<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-6">
				<div class="form-group col-md-3">
					<label class="control-label" for="id_pais">Pais</label>
					<select id="id_pais" name="pais.idPais" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
			    </div>
			</div>
			<div class="form-group col-sm-6">
				<div class="form-group col-md-3">
					<label class="control-label" for="id_modalidad">Modalidad</label>
					<select id="id_modalidad" name="listaModalidadAlumno.idModalidad" class='form-control'>
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
<!-- Agregar aquí -->
$.getJSON		("listaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.idPais +"</option>");
	});
});
$.getJSON		("listaModalidad", {}, function(data){
	$.each(data, function(index,item){
		$("#id_modalidad").append("<option value="+item.idModalidad +">"+ item.idModalidad +"</option>");
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
                            message: 'Los apellidos son de 2 a 40 caracteres'
                        },
                    }
                },
                telefono:{
                    selector: "#id_telefono",
                    validators:{
                        notEmpty: {
                             message: 'El teléfono es obligatorio'
                        },
                        stringLength: {
                            max: 9,
                            message: 'El teléfono es de 9 dígitos'
                        },
                    }
                },
                dni:{
                    selector: "#id_dni",
                    validators:{
                        notEmpty: {
                             message: 'El dni es obligatorio'
                        },
                        regexp: {
                        	max: 8,
                            regexp: /^[0-9]{8}$/,
                            message: 'El dni es de 8 dígitos'
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
                            message: 'El correo no es válido'
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
                             message: 'El pais es obligatorio'
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