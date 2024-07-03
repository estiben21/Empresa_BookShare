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
<style>
	body {
        background-color: #ebe6ea;
    }
</style>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%"><h4>Mantenimiento Libro</h4></div>

<div class="container" style="margin-top: 1%">
	   <div class="row" style="height: 70px">
			<div class="col-md-3" >
					<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el Título" type="text" maxlength="30"/>
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
									<th style="width: 5%" >Código</th>
									<th style="width: 25%">Título</th>
									<th style="width: 10%">Año</th>
									<th style="width: 10%">Serie</th>
									<th style="width: 15%">Categoria</th>
									<th style="width: 15%">Tipo</th>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudLibro" class="form-horizontal" method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Libro</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_titulo" name="titulo" placeholder="Ingrese el título del Libro" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_anio">Año</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_anio" name="anio" placeholder="Ingrese el Año" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_serie">Serie</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_serie" name="serie" placeholder="Ingrese la Serie" type="text" maxlength="5"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
												<label  class="col-lg-3 control-label" for="id_reg_categoria">Categoría</label>
												<div class="col-lg-8">
													 <select id="id_reg_categoria" name="categoriaLibro" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
										    </div>
										    <div class="form-group">
												<label  class="col-lg-3 control-label" for="id_reg_tipo">Tipo</label>
												<div class="col-lg-8">
													 <select id="id_reg_tipo" name="tipoLibro" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualizar Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudLibro" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Libro</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-8">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idLibro" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_titulo">Titulo</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_titulo" name="titulo" placeholder="Ingrese el titulo del Libro" type="text" maxlength="40"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_anio">Año</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_anio" name="anio" placeholder="Ingrese el año del libro" type="text" maxlength="4"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_serie">Serie</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_serie" name="serie" placeholder="Ingrese la serie del libro" type="text"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_categoria">Categoría</label>
		                                        <div class="col-lg-8">
													 <select id="id_act_categoria" name="categoriaLibro" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_tipo">Tipo de Libro</label>
		                                        <div class="col-lg-8">
													 <select id="id_act_tipo" name="tipoLibro" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
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
//--------------------- Mostrar datos en grilla al cargar
$(document).ready(function() {
	$.getJSON("consultaCrudLibro",{"filtro":""}, function (lista){
		agregarGrilla(lista);
	});
});

$.getJSON("listaCategoriaDeLibro", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_reg_categoria").append(
				"<option value="+item.idDataCatalogo +">" + item.descripcion
						+ "</option>");
		$("#id_act_categoria").append(
				"<option value="+item.idDataCatalogo +">" + item.descripcion
						+ "</option>");
	});
});

$.getJSON("listaTipoLibroRevista", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_reg_tipo").append(
				"<option value="+item.idDataCatalogo +">" + item.descripcion
						+ "</option>");
		$("#id_act_tipo").append(
				"<option value="+item.idDataCatalogo +">" + item.descripcion
						+ "</option>");
	});
});

$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudLibro",{"filtro":fil}, function (lista){
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
				{data: "idLibro"},
				{data: "titulo"},
				{data: "anio"},
				{data: "serie"},
				{data: "categoriaLibro.descripcion"},
				{data: "tipoLibro.descripcion"},
				{data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idLibro + '\',\'' + row.titulo +'\',\'' + row.anio  +'\',\'' + row.serie +  '\',\''  + row.categoriaLibro.idDataCatalogo + '\',\'' + row.tipoLibro.idDataCatalogo + '\')">Editar</button>';
					return salida;
				},className:'text-center'},	
				{data: function(row, type, val, meta){
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idLibro + '\')">'+ (row.estado == 1? 'Activo':'Inactvo') +  '</button>';
					return salida;
				},className:'text-center'},	
			]                                     
	    });
}

function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudLibro", 
          data: {"id":id},
          success: function(data){
        	  agregarGrilla(data.lista);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
     });
}


/* <---------- REGISTRAR ----------> */
$("#id_btn_registra").click(function(){
	var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: 'registraCrudLibro', 
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
        $.ajax({
		    type: "GET",  
		    url: "buscarPorSerieLibro",
		    data: $('#id_form_registra').serialize(),
		    success: function(data){
		   
		    },
		    error: function(){
		       
		    }
		});
    }
});

$('#id_form_registra').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	"titulo": {
    		selector : '#id_reg_titulo',
            validators: {
            	notEmpty: {
                    message: 'El título es un campo obligatorio'
                },
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'El título debe tener entre 2 y 40 caracteres'
                },
                	remote:{
                    	deplay:1000,
                    	url: 'buscaPorTituloCrudLibro',
                    	message: "El titulo ya existe"
                    }
                }
            },
            "anio": {
                selector: '#id_reg_anio',
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
            "serie": {
                selector: '#id_reg_serie',
                validators: {
                    notEmpty: {
                        message: 'La serie es un campo obligatorio'
                    },
                    regexp: {
                        regexp: /^[A-Za-z]{2}\d{3}$/,
                        message: 'La serie debe tener 2 letras seguidas de 3 dígitos'
                    },
                    remote :{
                        delay: 1000,
                        url: 'buscarPorSerieLibro',
                        message: 'La Serie ya existe'
                    }
                }
            },
        "categoriaLibro": {
        	selector : '#id_reg_categoria',
            validators: {
                notEmpty: {
                    message: 'Por favor, seleccione una categoría'
                }
            }
        },
        "tipoLibro": {
        	selector : '#id_reg_tipo',
            validators: {
                notEmpty: {
                    message: 'Por favor, seleccione un tipo'
                }
            }
        }
    }
});

</script> 


<script type="text/javascript">
/* <---------- ACTUALIZAR ----------> */
$("#id_btn_actualiza").click(function(){
	var validator = $('#id_form_actualiza').data('bootstrapValidator');
    validator.validate();
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "actualizaCrudLibro", 
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

function editar(idLibro,titulo,anio,serie,categoriaLibro,tipoLibro){	
	$('#id_ID').val(idLibro);
	$('#id_act_titulo').val(titulo);
	$('#id_act_anio').val(anio);
	$('#id_act_serie').val(serie);
	$('#id_act_categoria').val(categoriaLibro);
	$('#id_act_tipo').val(tipoLibro);
	$('#id_div_modal_actualiza').modal("show");
}

$('#id_form_actualiza').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	"titulo": {
    		selector : '#id_act_titulo',
            validators: {
                notEmpty: {
                    message: 'El titulo del libro es un campo obligatorio'
                },
                stringLength :{
                	message:'El titulo es de 2 a 40 caracteres',
                	min : 2,
                	max : 40
                },
            	remote:{
                	deplay:1000,
                	url: 'buscaPorTituloCrudLibro',
                	message: "el titulo ya existe"
                }
            }
        },
        "anio": {
    		selector : '#id_act_anio',
            validators: {
                notEmpty: {
                	message: 'El año es un campo obligatorio',
                    callback: function(value, validator, $field) {
                        var añoValue = $('#id_año').val();
                        if (value === '' && añoValue === '') {
                            return false;
                        }
                        return true;
                    }
                },
                regexp: {
                    regexp: /^\d{4}$/,
                    message: 'El año debe ser un número de 4 dígitos'
                }
            }
        },
        "serie": {
    		selector : '#id_act_serie',
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
        categoriaLibro: {
        	selector : '#id_act_categoria',
            validators: {
                notEmpty: {
                    message: 'Por favor, seleccione una categoría'
                }
            }
        },
        tipoLibro: {
        	selector : '#id_act_tipo',
            validators: {
                notEmpty: {
                    message: 'Por favor, seleccione un tipo'
                }
            }
        }
    }
});

function limpiarFormulario(){	
	$('#id_reg_titulo').val('');
	$('#id_reg_anio').val('');
	$('#id_reg_serie').val('');
	$('#id_reg_categoria').val(' ');
	$('#id_reg_tipo').val(' ');
}

</script>   		
</body>
</html>