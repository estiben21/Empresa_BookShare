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
<div class="container" style="margin-top: 4%"><h4>CRUD Editorial</h4>


<!-- LISTAR -->
<div class="container" style="margin-top: 1%">

<!-- sem6 avance -->
<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese la razon social" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal'  data-target="#id_div_modal_registra"  class='btn btn-success' style="width: 150px">REGISTRA</button>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th style="width: 5%" >ID</th>
												<th style="width: 25%">Razon Social</th>
												<th style="width: 20%">Direccion</th>
												<th style="width: 10%">RUC</th>
												<th style="width: 10%">Fecha Creacion</th>
												<th style="width: 10%">Pais</th>
											 <th style="width: 10%">Actualiza</th>
												<th style="width: 10%">Elimina</th> 
												
											</tr>
										</thead>
											<tbody>
											</tbody>
										</table>
								</div>	
						</div>
					</div>

	
</div>
<!-- LISTAR FIN-->

<!-- REGISTRAR -->
 <div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Editorial</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de la Editorial</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                
		                                <!-- RAZON SOCIAL -->
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_razonSocial">Razón Social:</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_razonSocial" name="razonSocial" placeholder="Ingrese la razón social" type="text"/>
		                                        </div>
		                                    </div>
		                    
		                                    <!-- DIRECCIÓN -->
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_direccion">Dirección:</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_direccion" name="direccion" placeholder="Ingrese la dirección" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <!-- RUC (NÚMEROS 11 DIGITOS) -->
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ruc">RUC:</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_ruc" name="ruc" type="text" placeholder="Ingrese el RUC" maxlength="11"/>
		                                        </div>
		                                    </div>
		                                    <!-- FECHA CREACIÓN -->
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_fechaCreacion">Fecha de Creación:</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_fechaCreacion" name="fechaCreacion" type="date" placeholder="Ingrese la fecha de creación" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <!-- PAIS -->		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">País</label>
		                                        <div class="col-lg-6">
													 <select id="id_reg_pais" name="pais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <!-- BOTÓN -->
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="button" class="btn btn-primary" id="id_btn_registra">REGISTRA</button>
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

<!-- REGISTRAR FIN -->
<!-- ACTUALIZAR INICIO -->

<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Editorial</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Empleado</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                            
		                                <div class="panel-body">
		                                
		                                <!-- ID EDITORIAL -->
		                               		 <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-8">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idEmpleado" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <!-- RAZON SOCIAL -->
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_razonSocial">Razón Social:</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_razonSocial" name="razonSocial" placeholder="Ingrese la razón social" type="text"/>
		                                        </div>
		                                    </div>
		                                   <!-- DIRECCIÓN -->
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_direccion">Dirección:</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_direccion" name="direccion" placeholder="Ingrese la dirección" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <!-- RUC (NÚMEROS 11 DIGITOS) -->
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ruc">RUC:</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_ruc" name="ruc" type="text" placeholder="Ingrese el RUC" maxlength="11"/>
		                                        </div>
		                                    </div>
		                                    <!-- FECHA CREACIÓN -->
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_fechaCreacion">Fecha de Creación:</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_fechaCreacion" name="fechaCreacion" type="date" placeholder="Ingrese la fecha de creación" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <!-- PAIS -->		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">País</label>
		                                        <div class="col-lg-6">
													 <select id="id_act_pais" name="pais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <!-- BOTON ACTUALIZAR -->
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="button" class="btn btn-primary" id="id_btn_actualiza">ACTUALIZA</button>
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
		
		<!-- ACTUALIZAR FIN -->
		</div>

<script type="text/javascript">
<!-- SCRIPT -->


$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){
		$("#id_pais").append("<option value="+item.idPais +">" + item.nombre+ "</option>");
		$("#id_reg_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		$("#id_act_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});
<!-- EVENTO CLICK - SEM6 --> 

$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudEditorial",{"filtro":fil}, function (lista){
		agregarGrilla(lista);
	});
}); 

//PAIS
$.getJSON("listaPais", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_pais").append(
				"<option value="+item.idPais +">" + item.nombre
						+ "</option>");
	});
});

//metodo grlla
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
				{data: "idEditorial"},
				{data: "razonSocial"},
				{data: "direccion"},
				{data: "ruc"},
				{data: "fechaCreacion"},
				{data: "pais.nombre"},
				{data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idEditorial + '\',\'' + row.razonSocial +'\',\'' + row.direccion  +'\',\'' + row.ruc + '\',\'' + row.fechaCreacion + '\',\'' + row.pais.idPais + '\')">Editar</button>';
					return salida;
				},className:'text-center'},	
				{data: function(row, type, val, meta){
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idEditorial + '\')">'+ (row.estado == 1? 'Activo':'Inactvo') +  '</button>';
					return salida;
				},className:'text-center'},	
															
			]                                     
	    });
}

<!--ACCION ELIMINAR-->

function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudEditorial", 
          data: {"id":id},
          success: function(data){
        	  agregarGrilla(data.lista);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
     });
}
<!--BOTON REGISTRAR-->
$("#id_btn_registra").click(function(){
	var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraEditorialCrud", 
          data: $('#id_form_registra').serialize(),
          success: function(data){
        	 
        	  agregarGrilla(data.lista); //'lista' viene de la "lista" creada en el Controller
        	  $('#id_div_modal_registra').modal("hide");
        	  mostrarMensaje(data.MENSAJE);
        	  limpiarFormulario();
        	  validator.resetForm();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
});




<!--BOTON ACTUALIZAR-->
$("#id_btn_actualiza").click(function(){
	var validator = $('#id_form_actualiza').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "actualizaCrudEditorial", 
          data: $('#id_form_actualiza').serialize(),
          success: function(data){
        	  agregarGrilla(data.lista);
        	  $('#id_div_modal_actualiza').modal("hide"); 
        	  mostrarMensaje(data.mensaje);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
});
<!--ACCION LIMPIAR-->
function limpiarFormulario(){	
	$('#id_reg_razonSocial').val('');
	$('#id_reg_direccion').val('');
	$('#id_reg_ruc').val('');
	$('#id_reg_fechaCreacion').val('');
	$('#id_reg_pais').val(' ');
}
<!--ACCION EDITAR-->
function editar(idEditorial,razonSocial,direccion,ruc,fechaCreacion,idPais){	
	$('#id_ID').val(idEditorial);
	$('#id_act_razonSocial').val(razonSocial);
	$('#id_act_direccion').val(direccion);
	$('#id_act_ruc').val(ruc);
	$('#id_act_fechaCreacion').val(fechaCreacion);
	$('#id_act_pais').val(idPais);
	$('#id_div_modal_actualiza').modal("show");
}


<!--VALIDACIONES REGISTRAR-->
$(document).ready(function(){
$('#id_form_registra').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields : {
		razonSocial : {
			selector : "#id_reg_razonSocial",
			validators : {
				notEmpty : {
					message : 'La razón social es obligatoria'
				},
				stringLength : {
					min : 2,
					max : 40,
					message : 'La razón social es de 2 a 40 caracteres'
				},
				regexp : {
					regexp : /^[a-zA-Z\s]+$/,
					message : 'Ingresar razón social en carácteres alfabéticos'

				}
			}
		},
		direccion : {
			selector : "#id_reg_direccion",
			validators : {
				notEmpty : {
					message : 'La dirección es obligatoria'
				},
				stringLength : {
					min : 3,
					max : 40,
					message : 'La dirección es de 3 a 40 carácteres'
				},
			}
		},
		ruc : {
            selector : "#id_reg_ruc",
            validators : {
                notEmpty : {
                    message : 'El RUC es obligatorio'
                },
                regexp : {
                    regexp : /^[0-9]{11}$/,
                    message : 'El RUC es 11 dígitos y en formato numérico'
                },
                remote : {
                    delay : 500,
                    url : 'buscaEditorialPorRuc',
                    message : 'El RUC ya existe'
                },
                data: {
                    ruc: function() {
                        return $('#id_reg_ruc').val();
                    },
                },
            }
        },
		fechaCreacion : {
			selector : "#id_reg_fechaCreacion",
			validators : {
				notEmpty : {
					message : 'La fecha de creación es obligatoria'
				}
			}
		},
		pais : {
			selector : '#id_reg_pais',
			validators : {
				notEmpty : {
					message : 'País es un campo obligatorio'
				},
			}
		},

	}   
});
});
<!--VALIDACIONES REGISTRAR FIN-->
<!--VALIDACIONES ACTUALIZAR-->
$(document).ready(function(){
	$('#id_form_actualiza').bootstrapValidator({
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields : {
			razonSocial : {
				selector : "#id_act_razonSocial",
				validators : {
					notEmpty : {
						message : 'La razón social es obligatoria'
					},
					stringLength : {
						min : 2,
						max : 40,
						message : 'La razón social es de 2 a 40 caracteres'
					},
					regexp : {
						regexp : /^[a-zA-Z\s]+$/,
						message : 'Ingresar razón social en carácteres alfabéticos'

					}
				}
			},
			direccion : {
				selector : "#id_act_direccion",
				validators : {
					notEmpty : {
						message : 'La dirección es obligatoria'
					},
					stringLength : {
						min : 3,
						max : 40,
						message : 'La dirección es de 3 a 40 carácteres'
					},
				}
			},
			ruc : {
	            selector : "#id_act_ruc",
	            validators : {
	                notEmpty : {
	                    message : 'El RUC es obligatorio'
	                },
	                regexp : {
	                    regexp : /^[0-9]{11}$/,
	                    message : 'El RUC es 11 dígitos y en formato numérico'
	                },
	                remote : {
	                    delay : 500,
	                    url : 'buscaEditorialPorRucActualiza',
	                    message : 'El RUC ya existe'
	                },
	                data: {
	                    ruc: function() {
	                        return $('#id_act_ruc').val();
	                    },
	                    id: function() {
	                        return $('#id_ID').val();
	                    },
	                },
	            }
	        },
			fechaCreacion : {
				selector : "#id_act_fechaCreacion",
				validators : {
					notEmpty : {
						message : 'La fecha de creación es obligatoria'
					}
				}
			},
			pais : {
				selector : '#id_act_pais',
				validators : {
					notEmpty : {
						message : 'País es un campo obligatorio'
					},
				}
			},

		}   
	});
	});
<!--VALIDACIONES ACTUALIZAR FIN-->


</script>   		
</body>
</html>