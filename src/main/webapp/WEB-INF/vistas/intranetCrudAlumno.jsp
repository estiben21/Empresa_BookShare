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
<div class="container" style="margin-top: 4%"><h4>CRUD Alumno</h4></div>

<div class="container" style="margin-top: 1%">
			<!------------------------------ Cabecera -->
			<div class="row" style="height: 70px">
				<div class="col-md-2" >
						<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
				</div>
				<div class="col-md-2" >
					<button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
				</div>
				<div class="col-md-2">
					<button type="button" data-toggle='modal'  data-target="#id_div_modal_registra"  class='btn btn-success' style="width: 150px">REGISTRA</button>
				</div>
			</div>
			<!------------------------------ Grilla -->
			<div class="row" > 
				<div class="col-md-12">
						<div class="content" >
							<table id="id_table" class="table table-striped table-bordered" >
								<thead>
									<tr>
										<th style="width: 5%" >ID</th>
										<th style="width: 12%">Nombres</th>
										<th style="width: 12%">Apellidos</th>
										<th style="width: 9%">Teléfono</th>
										<th style="width: 8%">Dni</th>
										<th style="width: 13%">Correo elctrónico</th>
										<th style="width: 10%">Fecha de nacimiento</th>
										<th style="width: 8%">País</th>
										<th style="width: 8%">Modalidad</th>
										<th style="width: 7%">Actualiza</th>
										<th style="width: 7%">Elimina</th>
									</tr>
								</thead>
								</table>
						</div>	
				</div>
			</div>
			
			<!--------------------------------------- MODAL de Registro ----------------------------------------------->
		  	 <div class="modal fade" id="id_div_modal_registra" >
					<div class="modal-dialog" style="width: 60%">
						<!-- Modal content-->
						<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Alumno</h4>
						</div>
						<div class="modal-body" style="padding: 20px 10px;">
								<form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal"  method="post">
				                    <div class="panel-group" id="steps">
				                        <!-- Step 1 -->
				                        <div class="panel panel-default">
				                            <div class="panel-heading">
				                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Alumno</a></h4>
				                            </div>
				                            <div id="stepOne" class="panel-collapse collapse in">
				                                <div class="panel-body">
				                                     <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_nombres">Nombres</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_reg_nombres" name="nombres" placeholder="Ingrese el nombre" type="text" maxlength="50"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_apellidos">Apellidos</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_reg_apellidos" name="apellidos" placeholder="Ingrese los apellidos" type="text" maxlength="50"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_telefono">Teléfono</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_reg_telefono" name="telefono" placeholder="Ingrese el teléfono" type="text" maxlength="9"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_reg_dni" name="dni" placeholder="Ingrese el DNI" type="text" maxlength="8"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_correo">Correo electrónico</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_reg_correo" name="correo" placeholder="Ingrese el correo electrónico" type="text" maxlength="50"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_fecha_nacimiento">Fecha de Nacimiento</label>
				                                        <div class="col-lg-3">
															<input class="form-control" id="id_reg_fecha_nacimiento" name="fechaNacimiento" type="date"/>
				                                        </div>
				                                    </div>		   
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_pais">País</label>
				                                        <div class="col-lg-6">
															 <select id="id_reg_pais" name="pais" class='form-control'>
									                            	<option value=" ">[Seleccione]</option>    
									                         </select>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_modalidad">Modalidad</label>
				                                        <div class="col-lg-6">
															 <select id="id_reg_modalidad" name="modalidad" class='form-control'>
									                            	<option value=" ">[Seleccione]</option>    
									                         </select>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <div class="col-lg-9 col-lg-offset-3">
				                                        	<button type="button" class="btn btn-primary" id="id_btn_registra">REGISTRAR</button>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>          
				                    </div>
				                </form>   
						</div>
					</div>
				</div>		
			</div>
			
			<!--------------------------------------- MODAL de Actualización ----------------------------------------------->
		  	 <div class="modal fade" id="id_div_modal_actualiza" >
					<div class="modal-dialog" style="width: 60%">
						<!-- Modal content-->
						<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza de Alumno</h4>
						</div>
						<div class="modal-body" style="padding: 20px 10px;">
								<form id="id_form_actualiza" accept-charset="UTF-8" class="form-horizontal"  method="post">
				                    <div class="panel-group" id="steps">
				                        <!-- Step 1 -->
				                        <div class="panel panel-default">
				                            <div class="panel-heading">
				                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Alumno</a></h4>
				                            </div>
				                            <div id="stepOne" class="panel-collapse collapse in">
				                                <div class="panel-body">
				                                	<div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_act_nombres">ID del alumno</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_ID"  readonly="readonly" name="idAlumno" type="text"/>
				                                        </div>
				                                     </div>
				                                     <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_act_nombres">Nombres</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_act_nombres" name="nombres" placeholder="Ingrese el nombre" type="text" maxlength="50"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_act_apellidos">Apellidos</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_act_apellidos" name="apellidos" placeholder="Ingrese los apellidos" type="text" maxlength="50"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_act_telefono">Teléfono</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_act_telefono" name="telefono" placeholder="Ingrese el teléfono" type="text" maxlength="9"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_act_dni" name="dni" placeholder="Ingrese el DNI" type="text" maxlength="8"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_act_correo">Correo electrónico</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_act_correo" name="correo" placeholder="Ingrese el correo electrónico" type="text" maxlength="50"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_act_fecha_nacimiento">Fecha de Nacimiento</label>
				                                        <div class="col-lg-3">
															<input class="form-control" id="id_act_fecha_nacimiento" name="fechaNacimiento" type="date"/>
				                                        </div>
				                                    </div>		   
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_act_pais">País</label>
				                                        <div class="col-lg-6">
															 <select id="id_act_pais" name="pais" class='form-control'>
									                            	<option value=" ">[Seleccione]</option>    
									                         </select>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_act_modalidad">Modalidad</label>
				                                        <div class="col-lg-6">
															 <select id="id_act_modalidad" name="modalidad" class='form-control'>
									                            	<option value=" ">[Seleccione]</option>    
									                         </select>
				                                        </div>
				                                    </div>
				                                    
				                                    <div class="form-group">
				                                        <div class="col-lg-9 col-lg-offset-3">
				                                        	<button type="button" class="btn btn-primary" id="id_btn_registra">ACTUALIZAR</button>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>   
				                    </div>
				                </form>   						
						</div>
					</div>
				</div>					
			</div>
</div>

<script type="text/javascript">
//--------------------- Mostrar datos en grilla al cargar
$(document).ready(function() {
	$.getJSON("consultaCrudAlumno",{"filtro":""}, function (lista){
		agregarGrilla(lista);
	});
});

//----------------- LISTAR paises en el CBO ---------------------------------------------
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_pais").append("<option value="+item.pais +">"+ item.nombre +"</option>");
		$("#id_act_pais").append("<option value="+item.pais +">"+ item.nombre +"</option>");
	});
});

//----------------- LISTAR modalidades en el CBO --------------------------------------------- ***************************************++*
$.getJSON("listaModalidad", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_modalidad").append("<option value="+item.idModalidad +">"+ item.descripcion +"</option>");
		$("#id_act_modalidad").append("<option value="+item.idModalidad +">"+ item.descripcion +"</option>");
	});
});

//------------------------ btn FILTRAR ---------------------------
});$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
		$.getJSON("consultaCrudAlumno",{"filtro":fil}, function (lista){
		agregarGrilla(lista);
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
			pageLength: 5,
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
				{data: "modalidad.descripcion"}
																
			]                                     
	    });
}

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


//------------------------ botón REGISTRAR ------------------------
$("#id_btn_registra").click(function(){
	var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraCrudAlumno", 
          data: $('#id_form_registra').serialize(),
          success: function(data){
        	  agregarGrilla(data.lista);
        	  $('#id_div_modal_registra').modal("hide");
        	  mostrarMensaje(data.mensaje);
        	  limpiarFormulario();
        	  validator.resetForm();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
});

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
                            regexp: /^[a-zA-Z]+$/,
                            message: 'Ingresar nombres con caracteres alfabéticos'
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
                            regexp: /^[a-zA-Z]+$/,
                            message: 'Ingresar apellidos con caracteres alfabéticos'
                        }
                    }
                },
                telefono:{
                    selector: "#id_telefono",
                    validators:{
                        notEmpty: {
                             message: 'El teléfono es obligatorio'
                        },
                        stringLength: {
                        	min: 9,
                            max: 9,
                            message: 'El teléfono es de 9 dígitos'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: 'Ingresar teléfono con caracteres numéricos'
                        },
                        remote :{
                            delay: 100,
                            url: 'buscaPorTelefono',
                            message: 'El teléfono ya existe'
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
                            message: 'El DNI es de 8 dígitos'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: 'Ingresar DNI con caracteres numéricos'
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
                            message: 'El correo no es válido'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/,
                            message: 'Ingresar un correo válido'
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
                             message: 'El país es obligatorio'
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