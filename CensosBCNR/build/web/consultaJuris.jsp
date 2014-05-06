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
        <link href="css/blueberry2.css" rel="stylesheet" />
        <style type="text/css">

            .scrollup{
                width:40px;
                height:40px;
                opacity:0.3;
                position:fixed;
                bottom:50px;
                right:100px;
                display:none;
                text-indent:-9999px;
                background: url('icon_top.png') no-repeat;
            }

        </style>
        <title>Consulta de Jurisdicciones</title>
    </head>
    <body>
        <div  class="container">
            <div class="row">
                <div class="col-lg-12 text-primary">
                    <h3>Consulta de Almacenes Jurisdiccionales - BAJA CALIFORNIA</h3>
                </div>    
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <a href="http://166.78.128.202:8080/CensosBCNR/indexSelec.html" class="btn btn-primary">Men&uacute;</a>
                    <a href="http://166.78.128.202:8080/CensosBCNH/consultaCensosH.jsp" class="btn btn-default">Censos Hospitales</a>
                    <a href="http://166.78.128.202:8080/CensosBCNR/consultaCensosR.jsp" class="btn btn-default">Censos 1er Nivel</a>
                    <a href="http://166.78.128.202:8080/CensosBCNR/conEntrevistaJuris.jsp" class="btn btn-default">Oficinas Jurisdiccionales</a>
                    <a href="http://166.78.128.202:8080/CensosBCNR" class="btn btn-default">Salir</a>
                </div>
            </div>
            <hr />
            <form method="post" action="consultaJuris.jsp">
                <div class="row">
                    <div class="col-lg-2">Elija una Jurisdiccion</div>
                          <div class="col-lg-4">
                                  <select class="form-control" name="juris">
                                  <option>-- SELECCIONE LA JURISDICCION --</option>
                                  <%                               try {
                                          con.conectar();
                                          ResultSet rset = con.consulta("select des_jur, no_jur from jurisdicciones where campo_15 !='' order by no_jur");
                                          while (rset.next()) {
                                              out.println("<option value = '" + rset.getString(2) + "' >" + rset.getString(1) + "</option>");
                                          }
                                          con.cierraConexion();
                                      } catch (Exception e) {

                                      }
                                  %>
                              </select>
                          </div>
                          <div class="col-lg-4">
                        <button class="btn btn-block btn-primary">Consultar</button>
                    </div>
                </div>
            </form>
            <br />
            <%
                try {
                    if (!sesion.getAttribute("juris").equals("")) {
                        con.conectar();
                        ResultSet rset = con.consulta("select * from jurisdicciones where no_jur = '" + sesion.getAttribute("juris") + "' ");
                        while (rset.next()) {
            %>
            <form class="form-horizontal" name="form_juris" action="Juris" method="post">
                <div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-2">
                                <h4>Jurisdicción:</h4>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control" readonly="true" name="juris" value="<%=rset.getString(2)%>">
                            </div>
                            <div class="col-lg-2">
                                <a class="btn btn-block btn-primary" href="#pic">PICTOGRÁFICO</a>
                            </div>
                            <div class="col-lg-2">
                                  <a class="btn btn-block btn-primary" href="#mapa">VER MAPA</a>
                              </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="form-group">
                                <div class="col-lg-2">
                                    <h4>Introducción:</h4>
                                </div>
                                <div class="col-lg-10">
                                    <textarea class="form-control" rows="7" readonly="true" name="campo_1"><%=rset.getString(3)%></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <b>INFRAESTRUCTURA</b>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <label class="col-sm-2 control-label">Horario de Atención</label>
                                                <div class="col-lg-2">
                                                    De:
                                                    <input class="form-control" value="<%=rset.getString(4)%>" name="campo_2" readonly="true" />
                                                </div>
                                                <div class="col-lg-2">
                                                    A:
                                                    <input class="form-control" value="<%=rset.getString(5)%>" name="campo_3" readonly="true" />
                                                </div>
                                                <label class="col-sm-2 control-label">Superficie</label>
                                                <div class="col-lg-3">
                                                    <input class="form-control" value="<%=rset.getString(6)%>" name="campo_4" readonly="true" />
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <label class="col-sm-2 control-label">Personal</label>
                                                    <div class="col-lg-4">
                                                        <input class="form-control" value="<%=rset.getString(7)%>" name="campo_5" readonly="true" />
                                                    </div>
                                                    <label class="col-sm-2 control-label">Vehículos</label>
                                                    <div class="col-lg-4">
                                                        <input class="form-control" value="<%=rset.getString(8)%>" name="campo_6" readonly="true" />
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <label class="col-sm-2 control-label">Eq. de Cómputo</label>
                                                    <div class="col-lg-4">
                                                        <input class="form-control" value="<%=rset.getString(9)%>" name="campo_7" readonly="true" />
                                                    </div>
                                                    <label class="col-sm-2 control-label">Sistema de Computo</label>
                                                    <div class="col-lg-4">
                                                        <input class="form-control" value="<%=rset.getString(10)%>" name="campo_8" readonly="true" />
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <label class="col-sm-2 control-label">Observaciones</label>
                                                    <div class="col-lg-10">
                                                        <textarea class="form-control" name="campo_9" rows="7" readonly="true" ><%=rset.getString(11)%></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br />
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <b>ABASTO</b>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <label class="col-sm-2 control-label">Proveedor que les abastece actualmente</label>
                                                    <div class="col-lg-4">
                                                        <input class="form-control" value="<%=rset.getString(12)%>" name="campo_10" readonly="true" />
                                                    </div>
                                                    <label class="col-sm-2 control-label">Catálogo de 1er nivel medicamento</label>
                                                    <div class="col-lg-4">
                                                        <input class="form-control" value="<%=rset.getString(13)%>" name="campo_11" readonly="true" />
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <label class="col-sm-2 control-label">Catálogo de 1er nivel mat. curación</label>
                                                    <div class="col-lg-4">
                                                        <input class="form-control" value="<%=rset.getString(14)%>" name="campo_12" readonly="true" />
                                                    </div>
                                                    <label class="col-sm-2 control-label">Último abasto del proveedor actual</label>
                                                    <div class="col-lg-4">
                                                        <input class="form-control" value="<%=rset.getString(15)%>" name="campo_13" readonly="true" />
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <label class="col-sm-2 control-label">Observaciones</label>
                                                    <div class="col-lg-10">
                                                        <textarea class="form-control" name="campo_14" rows="7" readonly="true" ><%=rset.getString(16)%></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br />
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <b>DISTRIBUCIÓN</b>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <label class="col-sm-4 control-label">Frecuencia de abasto a unidades de primer nivel</label>
                                                    <div class="col-lg-4">
                                                        <input class="form-control" value="<%=rset.getString(17)%>" name="campo_15" readonly="true" />
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <label class="col-sm-2 control-label">Observaciones</label>
                                                    <div class="col-lg-10">
                                                        <textarea class="form-control" rows="7" name="campo_16" readonly="true" ><%=rset.getString(18)%></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <b>OBSERVACIONES</b>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <label class="col-sm-2 control-label">Observaciones finales</label>
                                                    <div class="col-lg-10">
                                                        <textarea class="form-control" rows="7" name="campo_17" readonly="true" ><%=rset.getString(19)%></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a name='pic'></a>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <b>PICTOGRÁFICO</b>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="blueberry">
                                                            <a name="pic" id="pic"></a>
                                                            <ul class="slides">
                                                                <%
                                                                    try {
                                                                        con.conectar();

                                                                        //out.print(qery);
                                                                        ResultSet rsetimg = con.consulta("select imagen from tb_ima_juris where no_jur = '" + rset.getString(1) + "'");
                                                                        while (rsetimg.next()) {
                                                                            out.print("<li><img src='" + rsetimg.getString("imagen") + "' /></li>");
                                                                        }
                                                                        con.cierraConexion();
                                                                    } catch (Exception e) {
                                                                    }
                                                                %> 
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3"></div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a name='mapa'></a>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <b>UBICACIÓN</b>
                                            </div>
                                            <div class="panel-body">
                                                <iframe src="<%=rset.getString(20)%>" class="col-lg-12" height="450" frameborder="0" style="border:0"></iframe>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <br />
                            <div class="row text-center" style="padding-bottom: 30px; padding-top: 30px;">
                            <b>DERECHOS RESERVADOS GNKL/DESARROLLOS WEB ® 2009 - 2014</b>
                        </div>
                    </form>
                    <%
                            }
                            con.cierraConexion();
                        }
                    } catch (Exception e) {

                    %>

                    <%                }
                    %>
                </div>
                <a href="#" class="scrollup">Scroll</a>
            </body>
            <!-- JAVASCRIPT -->
            <script src="js/bootstrap.js"></script>
            <script src="js/jquery.js"></script>
            <script src="js/jquery.blueberry.js"></script>
            <script>
                $(window).load(function() {
                    $('.blueberry').blueberry();
                });
            </script>
            <script type="text/javascript">
                $(document).ready(function() {

                    $(window).scroll(function() {
                        if ($(this).scrollTop() > 100) {
                            $('.scrollup').fadeIn();
                        } else {
                            $('.scrollup').fadeOut();
                        }
                    });
                    $('.scrollup').click(function() {
                        $("html, body").animate({scrollTop: 0}, 600);
                        return false;
                    });
                });
            </script>
        </html>
