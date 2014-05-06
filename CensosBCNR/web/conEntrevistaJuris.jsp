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
        <!--Cosas de Bootstrap-->
        <link href="css/blueberry2.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/cupertino/jquery-ui-1.10.3.custom.css" />
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
        <!----->
        <title>Oficinas Jurisdiccionales</title>
    </head>
    <body>
        <div  class="container">
            <div class="row">
                <div class="col-lg-12 text-primary">
                    <h3>Consulta Oficinas Jurisdiccionales - BAJA CALIFORNIA</h3>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <a href="http://166.78.128.202:8080/CensosBCNR/indexSelec.html" class="btn btn-primary">Men&uacute;</a>
                    <a href="http://166.78.128.202:8080/CensosBCNH/consultaCensosH.jsp" class="btn btn-default">Censos Hospitales</a>
                    <a href="http://166.78.128.202:8080/CensosBCNR/consultaCensosR.jsp" class="btn btn-default">Censos 1er Nivel</a>
                    <a href="http://166.78.128.202:8080/CensosBCNR/consultaJuris.jsp" class="btn btn-default">Almacenes Jurisdiccionales</a>
                    <a href="http://166.78.128.202:8080/CensosBCNR" class="btn btn-default">Salir</a>
                </div>
            </div>
            <hr />
            <form method="post" action="conEntrevistaJuris.jsp">
                <div class="row">
                    <div class="col-lg-2">Elija una Jurisdiccion</div>
                    <div class="col-lg-4">
                        <select class="form-control" name="juris">
                            <option>-- SELECCIONE LA JURISDICCION --</option>
                            <%                               try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select des_jur, no_jur from tb_entrevista_juris where entrevista!='' order by no_jur");
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

                    <br />
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Pictográfico
                        </div>
                        <div class="panel-body">
                            <div class="blueberry">
                                <a name="pic" id="pic"></a>
                                <ul class="slides">
                                    <%
                                        try {
                                            con.conectar();

                                            ResultSet rsetimg = con.consulta("select ima_jur from tb_ima_entrevistas where no_jur = '" + rset.getString(1) + "'");
                                            while (rsetimg.next()) {
                                                out.print("<li><img src='imagenes/" + rset.getString(1) + "/" + rsetimg.getString("ima_jur") + "' /></li>");
                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {
                                        }
                                    %> 
                                </ul>
                            </div>
                        </div>
                    </div>
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
    </body>
    <!-- JAVASCRIPT -->
    <!--script src="js/funcionesBasicas.js"></script-->
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/jquery.blueberry.js"></script>
    <script src="js/jquery.dataTables.js"></script>
    <script src="js/dataTables.bootstrap.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.js"></script>
    <script>
    $(window).load(function() {
        $('.blueberry').blueberry();
    });
    </script>
</html>
