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
<div class="container" style="margin-top: 4%"><h4>CRUD Sala</h4></div>

<div class="container" style="margin-top: 1%">
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
												<th style="width: 10%" >ID</th>
												<th style="width: 10%">#Numero</th>
												<th style="width: 10%">#Piso</th>
												<th style="width: 10%">#Alumnos</th>
												<th style="width: 10%">Recursos</th>
												<th style="width: 10%">Estado</th>
												<th style="width: 10%">Tipo</th>
												<th style="width: 10%">Sede</th>
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
					
					
					 <div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Sala</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de la Sala</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_numero">Número</label>
		                                        <div class="col-lg-8">
													<input class="form-control"  id="id_numero" name="numero" placeholder="Ingrese el número" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_piso">Piso</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_piso" name="piso" placeholder="Ingrese el piso" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group"> 
											<label class="col-lg-3 control-label" for="id_cantAlumnos">Cantidad de Alumnos</label>
											<div class="col-lg-8">
											<input class="form-control" type="text" id="id_cantAlumnos" name="numAlumnos" placeholder="Ingrese la cantidad de alumnos">
										</div>
									</div>
									 	<div class="form-group">
											<label class="col-lg-3 control-label" for="id_recursos">Recursos</label>
											<div class="col-lg-8">
											<input class="form-control" type="text" id="id_recursos" name="recursos" placeholder="Ingrese los recursos">
										</div>
									</div>
										
											<div class="form-group" >
											<label class="col-lg-3 control-label" for="id_tipo">Tipo</label>
											<div class="col-lg-6">
											<select id="id_reg_tipo" name="tipoSala" class='form-control'>
												<option value=" ">[Seleccione]</option>    
											</select>
										   </div>
										 </div>
										 
										   <div class="form-group" >
											<label class="col-lg-3 control-label" for="id_reg_sede">Sede</label>
											<div class="col-lg-6">
											<select id="id_reg_sede" name="sede" class='form-control'>
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
</div>
<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Sala</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de la Sala</a></h4>
		                              </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                
		                                
		                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-8">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idModalidad" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                	                        
		                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_numero">Número</label>
		                                        <div class="col-lg-8">
													<input class="form-control"  id="id_act_numero" name="numero" placeholder="Ingrese el número" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_piso">Piso</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_piso" name="piso" placeholder="Ingrese el piso" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                <div class="form-group"> 
											<label class="col-lg-3 control-label" for="id_act_cantAlumnos">Cantidad de Alumnos</label>
											<div class="col-lg-8">
											<input class="form-control" type="text" id="id_act_cantAlumnos" name="numAlumnos" placeholder="Ingrese la cantidad de alumnos">
										</div>
									</div>
									
									 	<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_recursos">Recursos</label>
											<div class="col-lg-8">
											<input class="form-control" type="text" id="id_act_recursos" name="recursos" placeholder="Ingrese los recursos">
										</div>
									</div>
										
										<div class="form-group" >
											<label class="col-lg-3 control-label" for="id_act_tipo">Tipo</label>
											<div class="col-lg-6">
											<select id="id_act_tipo" name="tipoSala" class='form-control'>
												<option value=" ">[Seleccione]</option>    
											</select>
										   </div>
										 </div>
										 
										<div class="form-group" >
											<label class="col-lg-3 control-label" for="id_act_sede">Sede</label>
											<div class="col-lg-6">
											<select id="id_act_sede" name="sede" class='form-control'>
												<option value=" ">[Seleccione]</option>    
											</select>
										   </div>
										  </div>
										  
								             <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="button" class="btn btn-primary" id="id_btn_actualiza">ACTUALIZAR</button>
                                                    </div>		                                        </div>
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

$.getJSON("listaTipoSala", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_tipo").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
		$("#id_act_tipo").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");

	});
});


$.getJSON("listaSede", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_sede").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");
		$("#id_act_sede").append("<option value="+item.idDataCatalogo +">"+ item.descripcion +"</option>");

	});
});



$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudSala",{"filtro":fil}, function (lista){
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
				{data: "idSala"},
				{data: "numero"},
				{data: "piso"},
				{data: "numAlumnos"},
				{data: "recursos"},
				{data: "estado"},
				{data: "tipoSala"},
				{data: "sede"},
				{data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idSala+ '\',\'' + row.numero +'\',\'' + row.piso  +'\',\'' + row.numAlumnos + '\',\''  + row.recursos + '\',\'' + row.estado +'\',\'' + row.tipoSala.idDataCatalogo + '\',\'' + row.sede.idDataCatalogo + '\')">Editar</button>';
					return salida;
				},className:'text-center'},	
				{data: function(row, type, val, meta){
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idSala + '\')">'+ (row.estado == 1? 'Activo':'Inactvo') +  '</button>';
					return salida;
				},className:'text-center'},										
			]                                     
	    });
}

function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudSala", 
          data: {"id":id},
          success: function(data){
        	  agregarGrilla(data.lista);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
     });
}


function editar(id,numero,piso,numAlumnos,recursos, tipoSala,sede){	
	$('#id_ID').val(id);
	$('#id_act_numero').val(numero);
	$('#id_act_piso').val(piso);
	$('#id_act_numAlumnos').val(numAlumnos);
	$('#id_act_recursos').val(recursos);
	$('#id_act_tipo').val(tipoSala);
	$('#id_act_sede').val(sede);
}

function limpiarFormulario(){	
	$('#id_ID').val('');
	$('#id_numero').val('');
	$('#id_piso').val('');
	$('#id_cantAlumnos').val('');
	$('#id_recursos').val('');
	$('#id_tipo').val('');
	$('#id_sede').val('');
}


$("#id_btn_registra").click(function(){
	var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraCrudSala", 
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
          url: "actualizaCrudModalidad", 
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


    	$('#id_form_registra').bootstrapValidator({
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
    	         recursos: {
    	     		selector : '#id_recursos',
    	             validators: {
    	                 notEmpty: {
    	                     message: 'Los recursos es un campo obligatorio'
    	                 },
    	                 stringLength :{
    	                 	message:'Los recursos es de 2 a 40 caracteres',
    	                 	min : 2,
    	                 	max : 40
    	                 },
    	             }
    	         },
    	         
    	         tipoSala: {
    	     		selector : '#id_reg_tipo',
    	             validators: {
    	             	notEmpty: {
    	                     message: 'Tipo es un campo obligatorio'
    	                 },
    	             }
    	         },
    	         sede: {
    	      		selector : '#id_reg_sede',
    	              validators: {
    	              	notEmpty: {
    	                      message: 'Sede es un campo obligatorio'
    	                  },
    	              }
    	          },
    	     }   
    	 });


</script>   		
</body>
</html>