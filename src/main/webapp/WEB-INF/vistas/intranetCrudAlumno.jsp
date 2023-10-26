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
										<th style="width: 13%">Correo electrónico</th>
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
				                                        <label class="col-lg-3 control-label" for="id_reg_fechaNacimiento">Fecha de Nacimiento</label>
				                                        <div class="col-lg-3">
															<input class="form-control" id="id_reg_fechaNacimiento" name="fechaNacimiento" type="date"/>
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
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Alumno</h4>
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
				                                        <label class="col-lg-3 control-label" for="id_ID">ID del alumno</label>
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
				                                        <label class="col-lg-3 control-label" for="id_act_fechaNacimiento">Fecha de Nacimiento</label>
				                                        <div class="col-lg-3">
															<input class="form-control" id="id_act_fechaNacimiento" name="fechaNacimiento" type="date"/>
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
				                                        	<button type="button" class="btn btn-primary" id="id_btn_actualiza">ACTUALIZAR</button>
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
	$.getJSON("consultaCrudAlumno",{"filtro":""}, function (listaAlumno){
		agregarGrilla(listaAlumno);
	});
});

function agregarGrilla(listaAlumno){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: listaAlumno,
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
				{data: "modalidad.descripcion"},
				{data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idAlumno + '\',\'' + row.nombres +'\',\'' + row.apellidos  +'\',\'' + row.telefono  +'\',\'' +  row.dni  +  '\',\'' + row.correo  +'\',\'' + row.fechaNacimiento + '\',\'' + row.pais.idPais  + '\',\'' + row.modalidad.idDataCatalogo + '\')">Editar</button>';
					return salida;
				},className:'text-center'},	
				{data: function(row, type, val, meta){
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idAlumno + '\')">'+ (row.estado == 1? 'Activo':'Inactivo') +  '</button>';
					return salida;
				},className:'text-center'},												
			]                                     
	    });
}

//------------------------ btn FILTRAR ---------------------------
$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudAlumno",{"filtro":fil}, function (listaAlumno){
		agregarGrilla(listaAlumno);
	});
});

//----------------- LISTAR paises en el CBO ---------------------------------------------
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		$("#id_act_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});

//----------------- LISTAR modalidades en el CBO --------------------------------------------- ***************************************++*
$.getJSON("listaModalidadAlumno", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_modalidad").append("<option value="+item.idDataCatalogo  +">"+ item.descripcion +"</option>");
		$("#id_act_modalidad").append("<option value="+item.idDataCatalogo  +">"+ item.descripcion +"</option>");
	});
});

function limpiarFormulario(){
	$("#id_reg_nombres").val('');
	$("#id_reg_apellidos").val('');
	$("#id_reg_telefono").val('');
	$("#id_reg_dni").val('');
	$("#id_reg_correo").val('');
	$("#id_reg_fechaNacimiento").val('');
	$("#id_reg_pais").val(' ');
	$("#id_reg_modalidad").val(' ');
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
        	  agregarGrilla(data.lista); //'lista' viene de la "lista" creada en el Controller
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



//---------- Validaciones Model Registra ----------------------
$(document).ready(function() {
    $('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		nombres:{
                    selector: "#id_reg_nombres",
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
                            regexp: /^[a-zA-Z\s]+$/, 
                            message: 'Ingresar nombres con caracteres alfabéticos'
                        },
                        remote: {
                            delay: 100,
                            url: 'buscaAlumnoPorNombreApellidoId_btnRgistrar', 
                            message: 'El alumno ya existe', //Ya existe una alumno con ese nombre y apellido
                            data: {
                                nombres: function() {
                                    return $('#id_reg_nombres').val();
                                },
                                apellidos: function() {
                                    return $('#id_reg_apellidos').val();
                                },
                                id: function() {
                                    return $('#id_ID').val();
                                },
                            },
                            //
                            onSuccess: function (e, data) {
                                // Eliminar el error en el campo de nombres
                                $('#id_form_registra').bootstrapValidator('updateStatus', 'apellidos', 'VALID');
                            },
                            // Función para manejar el error remoto
                            onError: function (e, data) {
                               
                			// Establecer un error en el campo de nombres
                                $('#id_form_registra').bootstrapValidator('updateStatus', 'apellidos', 'INVALID', 'remote');
                            }
                        }
                    }
                },
                apellidos:{
                    selector: "#id_reg_apellidos",
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
                            regexp: /^[a-zA-Z\s]+$/,
                            message: 'Ingresar apellidos con caracteres alfabéticos'
                    	},
                    	remote: {
                            delay: 100,
                            url: 'buscaAlumnoPorNombreApellidoId_btnRgistrar', 
                            message: 'El alumno ya existe', //Ya existe una alumno con ese nombre y apellido
                            data: {
                                nombres: function() {
                                    return $('#id_reg_nombres').val();
                                },
                                apellidos: function() {
                                    return $('#id_reg_apellidos').val();
                                },
                                id: function() {
                                    return $('#id_ID').val();
                                },
                            },
                            //
                            onSuccess: function (e, data) {
                                // Eliminar el error en el campo de nombres
                                $('#id_form_registra').bootstrapValidator('updateStatus', 'nombres', 'VALID');
                            },
                            // Función para manejar el error remoto
                            onError: function (e, data) {
                               
                			// Establecer un error en el campo de nombres
                                $('#id_form_registra').bootstrapValidator('updateStatus', 'nombres', 'INVALID', 'remote');
                            }
                        }
                    }
                },
                telefono:{
                    selector: "#id_reg_telefono",
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
                        },remote :{
                            delay: 100,
                            url: 'buscaPorTelefono', 
                            message: 'El teléfono ya existe'
                        }
                    }
                },
                dni:{
                    selector: "#id_reg_dni",
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
                        },remote :{
                            delay: 100,
                            url: 'buscaPorDni',
                            message: 'El DNI ya existe'
                        }
                    }
                },
                correo:{
                    selector: "#id_reg_correo",
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
                    selector: "#id_reg_fechaNacimiento",
                    validators:{
                        notEmpty: {
                             message: 'La fecha de nacimiento es obligatoria'
                        },
                        remote :{
                        	delay   : 100,
                        	url     : 'buscaAlumnoEdadEstudiantil',
                        	message : 'El alumno debe tener mínimo 3 años de edad'
                        }
                    }
                },
                pais:{
                    selector: "#id_reg_pais",
                    validators:{
                        notEmpty: {
                             message: 'El país es obligatorio'
                        }
                    }
                },
                modalidad:{
                    selector: "#id_reg_modalidad",
                    validators:{
                        notEmpty: {
                             message: 'La modalidad es obligatoria'
                        }
                    }
                },
        }   
    });
});

//------------------------ botón Actualiza ------------------------
$("#id_btn_actualiza").click(function(){
	var validator = $('#id_form_actualiza').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "actualizaCrudAlumno", 
          data: $('#id_form_actualiza').serialize(),
          success: function(data){
        	  agregarGrilla(data.listaAct); //'listaAct' viene de la "lista" creada en el Controller
        	  $('#id_div_modal_actualiza').modal("hide"); 
        	  mostrarMensaje(data.mensaje);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
});


//----------------------------------- botón EDITA ---------------------------
function editar(idAlumno,nombres,apellidos,telefono,dni,correo,fechaNacimiento,pais,modalidad){	
	$('#id_ID').val(idAlumno);
	$('#id_act_nombres').val(nombres);
	$('#id_act_apellidos').val(apellidos);
	$('#id_act_telefono').val(telefono);
	$('#id_act_dni').val(dni);
	$('#id_act_correo').val(correo);
	$('#id_act_fechaNacimiento').val(fechaNacimiento);
	$('#id_act_pais').val(pais);  
	$("#id_act_modalidad").val(modalidad);
	$('#id_div_modal_actualiza').modal("show");
}



//---------- Validaciones Model Actualiza ----------------------
$(document).ready(function() {
    $('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	nombres:{
                selector: "#id_act_nombres",
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
                        regexp: /^[a-zA-Z\s]+$/, 
                        message: 'Ingresar nombres con caracteres alfabéticos'
                    },
                    remote: {
                        delay: 100,
                        url: 'buscaAlumnoPorNombreApellidoId_btnRgistrar', 
                        message: 'El alumno ya existe', //Ya existe una alumno con ese nombre y apellido
                        data: {
                            nombres: function() {
                                return $('#id_reg_nombres').val();
                            },
                            apellidos: function() {
                                return $('#id_reg_apellidos').val();
                            },
                            id: function() {
                                return $('#id_ID').val();
                            },
                        },
                        //
                        onSuccess: function (e, data) {
                            // Eliminar el error en el campo de nombres
                            $('#id_form_actualiza').bootstrapValidator('updateStatus', 'apellidos', 'VALID');
                        },
                        // Función para manejar el error remoto
                        onError: function (e, data) {
                           
            			// Establecer un error en el campo de nombres
                            $('#id_form_actualiza').bootstrapValidator('updateStatus', 'apelidos', 'INVALID', 'remote');
                        }
                    }
                }
            },
            apellidos:{ 
                selector: "#id_act_apellidos",
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
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'Ingresar apellidos con caracteres alfabéticos'
                    },
                    remote: {
                        delay: 100,
                        url: 'buscaAlumnoPorNombreApellidoId_btnActualizar', 
                        message: 'El alumno ya existe', //Ya existe una alumno con ese nombre y apellido
                        data: {
                            nombres: function() {
                                return $('#id_act_nombres').val();
                            },
                            apellidos: function() {
                                return $('#id_act_apellidos').val();
                            },
                            id: function() {
                                return $('#id_ID').val();
                            },
                        },
                        //
                        onSuccess: function (e, data) {
                            // Eliminar el error en el campo de nombres
                            $('#id_form_actualiza').bootstrapValidator('updateStatus', 'nombres', 'VALID');
                        },
                        // Función para manejar el error remoto
                        onError: function (e, data) {
                           
            			// Establecer un error en el campo de nombres
                            $('#id_form_actualiza').bootstrapValidator('updateStatus', 'nombres', 'INVALID', 'remote');
                        }
                    }
                }
            },
            telefono:{
                selector: "#id_act_telefono",
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
                }
            },
            dni:{
                selector: "#id_act_dni",
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
                    }, remote: {
                        delay: 100,
                        url: 'buscaAlumnoPorDniId_Actualizar', 
                        message: 'El DNI ya existe',
                        data: {
                            dni: function() {
                                return $('#id_act_dni').val();
                            },
                            id: function() {
                                return $('#id_ID').val();
                            },
                        },
                    }
                }
            },
            correo:{
                selector: "#id_act_correo",
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
                selector: "#id_act_fechaNacimiento",
                validators:{
                    notEmpty: {
                         message: 'La fecha de nacimiento es obligatoria'
                    }, remote :{
                    	delay   : 100,
                    	url     : 'buscaAlumnoEdadEstudiantil',
                    	message : 'El alumno debe tener mínimo 3 años de edad'
                    }
                }
            },
            pais:{
                selector: "#id_act_pais",
                validators:{
                    notEmpty: {
                         message: 'El país es obligatorio'
                    }
                }
            },
            modalidad:{
                selector: "#id_act_modalidad",
                validators:{
                    notEmpty: {
                         message: 'La modalidad es obligatoria'
                    }
                }
            }
        }   
    });
});

//----------------------------------- botón ELIMINA  ---------------------------
function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudAlumno", 
          data: {"id":id},
          success: function(data){
        	  agregarGrilla(data.lista);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
     });
}

</script>   		
</body>
</html>