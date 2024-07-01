<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="es">
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

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Intranet</title>
<style>
	body {
        background-image: url('img/bibli.jpg');
        color: white;
    }
    .content-wrapper {
        display: flex;
        align-items: flex-start;
    }
    .content-wrapper img {
        margin-left: -50px;
        max-width: 250px;
    }
    .content-wrapper .text-content {
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .text-content h3 {
        font-size: 3em; /* Aumenta el tamaño del título principal */
    }
    .text-content h4 {
        font-size: 2em; /* Aumenta el tamaño de los subtítulos */
        text-align: center;
    }
</style>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />

<div class="container content-wrapper" style="margin-top: 5%">
    <div class="text-content">
        <h3>Bienvenido a la empresa Book Share</h3>
        <br><br>
        <h4>Bienvenido Sr(a): ${sessionScope.objUsuario.nombreCompleto}</h4><br>                
        
    </div>
    
</div>

<div class="container">
    <div class="col-md-12" align="center" style="width: 50px; height: 150px"></div>
</div>
</body>
</html>
