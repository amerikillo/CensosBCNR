<%-- 
  Document   : indexCap
  Created on : 01-oct-2013, 12:05:12
  Author     : wence
--%>

<%@page import="servlets.login"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conn.ConectionDB"%>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%java.text.DateFormat df3 = new java.text.SimpleDateFormat("HH:mm:ss"); %>
<%
    HttpSession sesion = request.getSession();
    String info = null;
    String qry = "";

    ConectionDB obj = new ConectionDB();
    ResultSet rset = null;
    ResultSet rset2 = null;

    String id_uni = "", juris = "", muni = "", nombre_gnk = "", tipo = "", hora = "", fecha = "";
    int ban = 0;
    try {
        obj.conectar();
        rset2 = obj.consulta("select id_uni, juris, muni, nombre_gnk, tipo from tb_unidades where id_uni = '" + sesion.getAttribute("id_uni") + "' ");
        while (rset2.next()) {
            id_uni = rset2.getString(1);
            juris = rset2.getString(2);
            muni = rset2.getString(3);
            nombre_gnk = rset2.getString(4);
            tipo = rset2.getString(5);
            hora = df3.format(new java.util.Date());
            fecha = df2.format(new java.util.Date());
            ban = 1;
        }
        obj.cierraConexion();
    } catch (Exception e) {
        id_uni = "";
        juris = "";
        muni = "";
        nombre_gnk = "";
        tipo = "";
        hora = "";
        fecha = "";
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>:: Toma de Censos ::</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/login.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="../../assets/js/html5shiv.js"></script>
          <script src="../../assets/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="container">
            <!--div class="row marco" >
                <div class="col-md-4">.col-md-4</div>
                <div class="col-md-4">.col-md-4</div>
                <div class="col-md-4">.col-md-4</div>
            </div-->

            <form name ="forma-login" class="marco" method="post" >
                <!--label for="username" class="uname" data-icon="u" > Your email or username </label-->
                <div class="row">
                    <div class="col-md-4"><img src="imagenes/GNKL_Small.JPG" ></div>
                    <div class="col-md-8"><h2>Subida de Imagenes de Unidades de Salud</h2></div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">

                        </div>
                    </div>
                </div> 

                <br>              
                <!--button name="consultar" value="1" class="btn btn-primary btn-lg btn-block" type="submit">Consultar</button>
                <!--button class="btn btn-primary btn-lg btn-block" type="button" onclick="window.location='modificarCensoH.jsp'">Modificar</button-->
            </form>

            <form method="post" class="marco"  action="FileUploadServlet" enctype="multipart/form-data" name="form1" id="form1"> 
                <br>
                <div class="col-lg-2"><a href="indexCapR.jsp">Regresar</a></div>
                <div class="col-lg-8"><h4>Datos de la Unidad a Cargar Imagenes</h4></div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-saved"></label></span>
                            <input type="text" name="id_uni" id="id_uni" class="form-control" placeholder="Clave del Hospital" value="<%=id_uni%>" readonly="readonlye">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-header"></label></span>
                            <input type="text" name="nombre_gnk" id="nombre_gnk" class="form-control" placeholder="Nombre del Hospital"  value="<%=nombre_gnk%>" readonly="readonlye">
                        </div>
                    </div>
                </div>



                <div class="row">
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-info-sign"></label></span>
                            <input type="text" name="tipo" id="tipo" class="form-control" placeholder="Categor&iacute;a del Hospital" value="<%=tipo%>" readonly="readonlye">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-hand-right"></label></span>
                            <input type="text" name="juris" id="juris" class="form-control" placeholder="Jurisdicci&oacute;n" value="<%=juris%>" readonly="readonlye">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-home"></label></span>
                            <input type="text" name="muni" id="muni" class="form-control" placeholder="Municipio" value="<%=muni%>" readonly="readonlye">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-calendar"></label></span>
                            <input type="text" name="fecha" id="fecha" class="form-control" placeholder="Fecha de Toma del Censo" value="<%=fecha%>" readonly="readonlye">
                        </div>
                    </div>
                </div>



                <div class="container">
                    <div class="row">
                        <table class="table table-bordered table-striped">
                            <tbody>
                                <tr>
                                    <th>1. Fotos del Camino al Hospital (Carretera o Autopista y sus condiciones, obstáculos, llegando a la unidad)</th><td><input type="file" name="file1" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file2" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file3" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file4" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>2. Foto del Nombre de la Unidad (en caso de no existir, apuntar con marcador el nombre en las cartulinas y tomar una foto)</th><td><input type="file" name="file5" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>3. Foto de la fachada de Unidad (que se vea todo el inmueble y un poco de los alrededores)</th><td><input type="file" name="file6" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>4. Fotos (varias) del interior de la Unidad: <br />

                                        - Anaqueles y/o racks <br />

                                        - Insumo <br />

                                        - Red fría <br />

                                        - Cajas de insumo <br />

                                        - Caducados  <br />

                                        - Techo interior <br />

                                        - Piso</th><td><input type="file" name="file7" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file8" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file9" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file10" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file11" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>5. Fotos de donde se encuentra ubicado el medicamento y material de curación.</th><td><input type="file" name="file13" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>6. Fotos (2) de otro sitio (si lo hubiera) adicional de Almacenaje.</th><td><input type="file" name="file14" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file15" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>7. Fotos del Consultorio</th><td><input type="file" name="file17" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file18" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>8. Fotos varias de interés para el proyecto</th><td><input type="file" name="file19" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file20" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file21" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Igual que la anterior</th><td><input type="file" name="file22" accept=".JPG"/></td>
                                </tr>
                                <tr>

                                    <td colspan="2"><a data-toggle="modal" href="#myModal" class="btn btn-block btn-primary" onclick="form1.submit();">CARGAR IMAGENES</a><!--button class="btn btn-block btn-primary" type="submit" onclick="location.href = 'cargaFotosCensos.jsp#myModal'" id="botonCarga">CARGAR IMAGENES</button--></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>




        <!-- 
             fin Mensaje de Acerca de...
        -->                            
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Carga de Imagenes</h4>
                    </div>
                    <div class="modal-body">
                        <form name="form_com" method="post" id="form_com">
                            <img src='imagenes/loading.gif' width='100px' height='100px' align='center' />
                            Se están subiendo las imágenes, por favor espere...
                        </form>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </body>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="css/MD5.js"></script>
    <script type="text/javascript" src="js/code_js.js"></script>
    <script>
                                        $(function() {
                                            $("#message").hide();

                                            function simulate_ajax_call()
                                            {
                                                $.ajax({
                                                    url: "/echo/json/",
                                                    success: function() {
                                                        alert("done");
                                                        $(".message").empty().html("done");
                                                        $(".message").delay(1000).fadeOut(500);
                                                    }
                                                });
                                            }

                                            $('#botonCarga').click(function() {
                                                $(".message").fadeIn(500);
                                                setTimeout(simulate_ajax_call(), 5000);
                                            });
                                        });
    </script>
</html>
