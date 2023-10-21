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
<div class="container" style="margin-top: 4%"><h4>CRUD Revista</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->
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
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th style="width: 5%" >ID</th>
												<th style="width: 15%">Nombre</th>
												<th style="width: 20%">Frecuencia</th>
												<th style="width: 10%">Fecha Creacion</th>
												<th style="width: 10%">Pais</th>
												<th style="width: 10%">Tipo de revista</th>
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

<div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Revista</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudRevista" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de la Revista</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el nombre de la revista" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_frecuencia">Frecuencia</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_frecuencia" name="frecuencia" placeholder="Ingrese la frecuencia" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaCreacion">F.Creacion</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_fechaCreacion" name="fechaCreacion" type="date"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">País</label>
		                                        <div class="col-lg-8">
													 <select id="id_reg_pais" name="pais" class='form-control'>
							                            	<option value=" ">Seleccione:</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_revista">Tipo de Revista</label>
		                                        <div class="col-lg-8">
													 <select id="id_reg_revista" name="tipoRevista" class='form-control'>
							                            	<option value=" ">Seleccione:</option>    
							                         </select>
		                                        </div>
		                                    </div>
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

<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualizar Revista</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudRevista" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de la Revista</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-8">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idRevista" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombre</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el nombre de la revista" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_frecuencia">Frecuencia</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_frecuencia" name="frecuencia" placeholder="Ingrese la frecuencia" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fechaCreacion">F.Creacion</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_fechaCreacion" name="fechaCreacion" type="date"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">País</label>
		                                        <div class="col-lg-8">
													 <select id="id_act_pais" name="pais" class='form-control'>
							                            	<option value=" ">Seleccione:</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_revista">Tipo de Revista</label>
		                                        <div class="col-lg-8">
													 <select id="id_act_revista" name="tipoRevista" class='form-control'>
							                            	<option value=" ">Seleccione:</option>    
							                         </select>
		                                        </div>
		                                    </div>
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

<script type="text/javascript">
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		$("#id_act_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});

$(document).ready(function() {
	$.getJSON("consultaCrudRevista",{"filtro":""}, function (lista){
		agregarGrilla(lista);
	});
});

$.getJSON("listaTipoLibroRevista", {}, function(data){
	$.each(data, function(index,item){
		$("#id_reg_revista").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
		$("#id_act_revista").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
	});
});

$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudRevista",{"filtro":fil}, function (lista){
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
				{data: "idRevista"},
				{data: "nombre"},
				{data: "frecuencia"},
				{data: "fechaCreacion"},
				{data: "pais.nombre"},
				{data: "tipoRevista.descripcion"},
				{data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idRevista + '\',\'' + row.nombre +'\',\'' + row.frecuencia  +'\',\'' + row.fechaCreacion + '\',\''  + row.pais.idPais + '\',\'' + row.tipoRevista.idDataCatalogo + '\')">Editar</button>';
					return salida;
				},className:'text-center'},	
				{data: function(row, type, val, meta){
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idRevista + '\')">'+ (row.estado == 1? 'Activo':'Inactvo') +  '</button>';
					return salida;
				},className:'text-center'},										
			]                                     
	    });
}

function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudRevista", 
          data: {"id":id},
          success: function(data){
        	  agregarGrilla(data.lista);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
     });
}

function editar(idRevista,nombre,frecuencia,fechaCreacion,idPais,idDataCatalogo){	
	$('#id_ID').val(idRevista);
	$('#id_act_nombre').val(nombre);
	$('#id_act_frecuencia').val(frecuencia);
	$('#id_act_fechaCreacion').val(fechaCreacion);
	$('#id_act_pais').val(idPais);
	$('#id_act_revista').val(idDataCatalogo);
	$('#id_div_modal_actualiza').modal("show");
}

$("#id_btn_registra").click(function(){
	var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraCrudRevista", 
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

$("#id_btn_actualiza").click(function(){
	var validator = $('#id_form_actualiza').data('bootstrapValidator');
    validator.validate();
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "actualizaCrudRevista", 
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


function limpiarFormulario(){	
	$('#id_reg_nombre').val('');
	$('#id_reg_frecuencia').val('');
	$('#id_reg_fechaCreacion').val('');
	$('#id_reg_pais').val(' ');
	$('#id_reg_revista').val(' ');
}

$('#id_form_registra').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	"nombre": {
    		selector : '#id_reg_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 3 a 100 caracteres',
                	min : 3,
                	max : 100
                },
                	remote:{
                    	deplay:1000,
                    	url: 'buscaPorNombreCrudRevista',
                    	message: "el nombre ya existe"
                    }
                }
            },
        "frecuencia": {
    		selector : '#id_reg_frecuencia',
            validators: {
                notEmpty: {
                    message: 'La frecuencia es un campo obligatorio'
                },
                stringLength :{
                	message: 'La frecuencia es de 3 a 100 caracteres',
                	min : 3,
                	max : 100
                }
            }
        },
        "fechaCreacion": {
    		selector : '#id_reg_fechaCreacion',
            validators: {
            	notEmpty: {
                    message: 'La fecha de creacion es un campo obligatorio'
            	}
            }
        },
        "pais.idPais": {
    		selector : '#id_reg_pais',
            validators: {
            	notEmpty: {
                    message: 'El país un campo obligatorio'
                },
            }
        },
        "tipoRevista.idDataCatalogo": {
    		selector : '#id_reg_revista',
            validators: {
            	notEmpty: {
                    message: 'El tipo de revista un campo obligatorio'
                },
            }
        },
    }   
});
</script>  
<script type="text/javascript">
$('#id_form_actualiza').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	"nombre": {
    		selector : '#id_act_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 3 a 100 caracteres',
                	min : 3,
                	max : 100
                },
                	remote:{
                    	deplay:1000,
                    	url: 'buscaPorNombreCrudRevista',
                    	message: "el nombre ya existe"
                    }
                }
            },
        "frecuencia": {
    		selector : '#id_act_frecuencia',
            validators: {
                notEmpty: {
                    message: 'La frecuencia es un campo obligatorio'
                },
                stringLength :{
                	message: 'La frecuencia es de 3 a 100 caracteres',
                	min : 3,
                	max : 100
                }
            }
        },
        "fechaCreacion": {
    		selector : '#id_act_fechaCreacion',
            validators: {
            	notEmpty: {
                    message: 'La fecha de creacion es un campo obligatorio'
            	}
            }
        },
        "pais.idPais": {
    		selector : '#id_act_pais',
            validators: {
            	notEmpty: {
                    message: 'El país un campo obligatorio'
                },
            }
        },
        "tipoRevista.idDataCatalogo": {
    		selector : '#id_act_revista',
            validators: {
            	notEmpty: {
                    message: 'El tipo de revista un campo obligatorio'
                },
            }
        },
    }   
});
</script> 		
</body>
</html>