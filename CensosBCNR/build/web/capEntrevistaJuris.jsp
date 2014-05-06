<%-- 
    Document   : capturaJuris
    Created on : 09-abr-2014, 7:34:42
    Author     : Americo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conn.ConectionDB"%>
<%@ page import="clasesJava.*" %>
<%
    //----------------------------------Modulo de Sesiones
    HttpSession sesion = request.getSession();
    String val = "", user = "", id = "";
    String id_uni = "";
    session.getId();
    if (sesion.getAttribute("valida") != null) {
        val = (String) sesion.getAttribute("valida");
        user = (String) sesion.getAttribute("nombre");
        id = (String) sesion.getAttribute("id");
        id_uni = request.getParameter("id_uni");
    }
    if (!val.equals("valida")) {
        //response.sendRedirect("index.jsp");
    }
//out.print (val+user+id+session.getId());
//--------------------------------------------------------
    ConectionDB con = new ConectionDB();
    try {
        if (!request.getParameter("juris").equals("")) {
            sesion.setAttribute("juris", request.getParameter("juris"));
        }
    } catch (Exception e) {
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" />
        <title>Captura de Entrevistas a Jurisdicciones</title>
    </head>
    <body>
        <div  class="container">
            <div class="row">
                <div class="col-lg-6 text-primary">
                    <h3>Captura de Entrevistas a Jurisdicciones</h3>
                </div>
                <div class="col-lg-6" style="padding-top: 20px;">
                    <!--a class="btn btn-primary" href="indexMain.jsp">Menú</a>
                    <a class="btn btn-default" href="consultaCensosR.jsp">Censos</a>
                    <a class="btn btn-default" href="estadisticasA.jsp">Estadísticas</a>
                    <a class="btn btn-default" href="http://166.78.128.202:8080/InventariosChiapas/index.jsp">Inventarios</a>
                    <a class="btn btn-default" href="index.jsp">Salir</a-->
                </div>
            </div>
            <hr />
            <form method="post" action="capEntrevistaJuris.jsp">
                <div class="row">
                    <div class="col-lg-2">Elija una Jurisdiccion</div>
                    <div class="col-lg-4">
                        <select class="form-control" name="juris">
                            <option>-- SELECCIONE LA JURISDICCION --</option>
                            <%                               try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select des_jur, no_jur from tb_entrevista_juris order by no_jur");
                                    while (rset.next()) {
                                        out.println("<option value = '" + rset.getString(2) + "' >" + rset.getString(1) + "</option>");
                                    }
                                    con.cierraConexion();
                                } catch (Exception e) {
                                    System.out.println(e.getMessage());
                                }
                            %>
                        </select>
                    </div>
                    <div class="col-lg-2">
                        <button class="btn btn-block btn-primary">Consultar</button>
                    </div>
                </div>
            </form>
            <br />
            <%
                try {
                    if (!sesion.getAttribute("juris").equals("")) {
                        con.conectar();
                        ResultSet rset = con.consulta("select * from tb_entrevista_juris where no_jur = '" + sesion.getAttribute("juris") + "' ");
                        while (rset.next()) {
            %>
            <div>

                <form class="form-horizontal" name="form_juris" action="EntrevistaJuris" method="post"><div class="row">
                        <div class="form-group">
                            <div class="col-lg-2">
                                <h4>Jurisdicción:</h4>
                            </div>
                            <div class="col-lg-10">
                                <input class="form-control" readonly name="juris" value="<%=rset.getString(2)%>">
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">

                        <div class="form-group">
                            <div class="col-lg-2">
                                <h4>Entrevista</h4>
                            </div>
                            <div class="col-lg-10">
                                <textarea class="form-control" rows="20" name="entrevista"><%=rset.getString(3)%></textarea>
                            </div>
                        </div>
                    </div>
                    <hr />

                    <div class="row text-center">
                        <button class="btn btn-block btn-primary" name="accion" value="guardar">Guardar</button>
                    </div>
                    <br />
                </form>
                <form method="post" class="marco"  action="FotosEntrevista" enctype="multipart/form-data" name="form1" id="form1"> 
                    <input class="form-control" readonly name="id_uni" value="<%=sesion.getAttribute("juris")%>">
                    <div class="container">
                        <div class="row">
                            <table class="table table-bordered table-striped">
                                <tbody>
                                    <tr>
                                        <th width="18%" rowspan="20">1. Elija las imagenes</th><td width="82%"><input type="file" name="file1" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file2" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file3" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file4" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file5" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file6" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file7" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file8" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file9" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file10" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file11" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file13" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file14" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file15" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file17" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file18" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file19" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file20" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file21" accept=".JPG"/></td>
                                    </tr>
                                    <tr>
                                        <td><input type="file" name="file22" accept=".JPG"/></td>
                                    </tr>
                                    <tr>

                                        <td colspan="2"><a data-toggle="modal" href="#myModal" class="btn btn-block btn-primary" onclick="form1.submit();">CARGAR IMAGENES</a><!--button class="btn btn-block btn-primary" type="submit" onclick="location.href = 'cargaFotosCensos.jsp#myModal'" id="botonCarga">CARGAR IMAGENES</button--></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
                <div class="row text-center" style="padding-bottom: 30px; padding-top: 30px;">
                    <b>DERECHOS RESERVADOS GNKL/DESARROLLOS WEB ® 2009 - 2014</b>
                </div>
            </div>
            <%
                        }
                        con.cierraConexion();
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            %>
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
    <!-- JAVASCRIPT -->
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
