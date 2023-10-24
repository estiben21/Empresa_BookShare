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
												<th style="width: 5%" >ID</th>
												<th style="width: 25%">#Numero</th>
												<th style="width: 20%">#Piso</th>
												<th style="width: 20%">#Alumnos</th>
												<th style="width: 10%">Recursos</th>
												<th style="width: 10%">Estado</th>
												<th style="width: 10%">Tipo</th>
												
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
											<select id="id_tipo" name="tipoSala.idDataCatalogo" class='form-control'>
												<option value=" ">[Seleccione]</option>    
											</select>
										   </div>
										 </div>
										 
										   <div class="form-group" >
											<label class="col-lg-3 control-label" for="id_sede">Sede</label>
											<div class="col-lg-6">
											<select id="id_sede" name="sede.idDataCatalogo" class='form-control'>
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
		

<script type="text/javascript">

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
				{data: "sede"},
																
			]                                     
	    });
}

$("#id_btn_registra").click(function(){
	var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraCrudEmpleado", 
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


</script>   		
</body>
</html>