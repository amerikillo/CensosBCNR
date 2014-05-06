<%-- 
    Document   : salir
    Created on : 08-nov-2013, 11:54:20
    Author     : wence
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession sesionFinal = request.getSession();
    sesionFinal.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>Salida - Censos </title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sticky-footer.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        
        if (history.forward(1)){
            //alert("bye");
            location.replace(history.forward(1));
        }
</script> 
    
  </head>

  <body>

    <!-- Wrap all page content here -->
    <div id="wrap">

      <!-- Begin page content -->
      <div class="container">
        <div class="page-header">
            <img src="imagenes/GNKL_Small.JPG" ><h1>Censos Baja California 2014</h1>
        </div>
        <p class="lead">Gracias por haber utilizado el Sistema de Censos Baja California 2014<br>Su sesi&oacute;n ha sido cerrada correctamente.</p>
        <p>Si quiere volver a ingresar <a href="index.jsp">de clic aqu&iacute;</a>, se requieren credenciales v&aacute;lidas.</p>
      </div>
    </div>

    <div id="footer">
      <div class="container">
          <p class="text-muted credit">GNK Log&iacute;stica SA de CV - Desarrollo de Software WEB 2009-2013 Todos los Derechos Reservados &REG;</p>
      </div>
    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
  </body>
</html>

