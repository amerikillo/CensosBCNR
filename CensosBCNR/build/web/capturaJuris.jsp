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
        <title>Captura de Jurisdicciones</title>
    </head>
    <body>
        <div  class="container">
            <div class="row">
                <div class="col-lg-6 text-primary">
                    <h3>Captura de Jurisdicciones</h3>
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
            <form method="post" action="capturaJuris.jsp">
                <div class="row">
                    <div class="col-lg-2">Elija una Jurisdiccion</div>
                    <div class="col-lg-4">
                        <select class="form-control" name="juris">
                            <option>-- SELECCIONE LA JURISDICCION --</option>
                            <%                               try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select des_jur, no_jur from jurisdicciones order by no_jur");
                                    while (rset.next()) {
                                        out.println("<option value = '" + rset.getString(2) + "' >" + rset.getString(1) + "</option>");
                                    }
                                    con.cierraConexion();
                                } catch (Exception e) {

                                }
                            %>
                        </select>
                    </div>
                    <div class="col-lg-2">
                        <button class="btn btn-block btn-primary">Consultar</button>
                    </div>
                    <div class="col-lg-2">
                        <a class="btn btn-block btn-primary" href="SubeJuris?accion=subir">Subir Información</a>
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
                            <div class="col-lg-10">
                                <input class="form-control" readonly="true" name="juris" value="<%=rset.getString(2)%>">
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
                                <textarea class="form-control" name="campo_1"><%=rset.getString(3)%></textarea>
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
                                            <select  name="campo_2"  class="form-control" id="">
                                                <%
                                                    for (int i = 0; i <= 24; i++) {
                                                        out.println("<option ");
                                                        if (rset.getString("campo_2").equals(i + ":00")) {
                                                            out.println("selected");
                                                        }
                                                        out.println(">" + i + ":00</option>");
                                                        out.println("<option ");
                                                        if (rset.getString("campo_2").equals(i + ":30")) {
                                                            out.println("selected");
                                                        }
                                                        out.println(">" + i + ":30</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-lg-2">
                                            A:
                                            <select  name="campo_3"  class="form-control" id="">
                                                <%
                                                    for (int i = 0; i <= 24; i++) {
                                                        out.println("<option ");
                                                        if (rset.getString("campo_3").equals(i + ":00")) {
                                                            out.println("selected");
                                                        }
                                                        out.println(">" + i + ":00</option>");
                                                        out.println("<option ");
                                                        if (rset.getString("campo_3").equals(i + ":30")) {
                                                            out.println("selected");
                                                        }
                                                        out.println(">" + i + ":30</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">Superficie</label>
                                        <div class="col-lg-3">
                                            <input class="form-control" value="<%=rset.getString(6)%>" name="campo_4" />
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <label class="col-sm-2 control-label">Personal</label>
                                        <div class="col-lg-4">
                                            <input class="form-control" value="<%=rset.getString(7)%>" name="campo_5" />
                                        </div>
                                        <label class="col-sm-2 control-label">Vehículos</label>
                                        <div class="col-lg-4">
                                            <input class="form-control" value="<%=rset.getString(8)%>" name="campo_6" />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <label class="col-sm-2 control-label">Eq. de Cómputo</label>
                                        <div class="col-lg-4">
                                            <input class="form-control" value="<%=rset.getString(9)%>" name="campo_7" />
                                        </div>
                                        <label class="col-sm-2 control-label">Sistema de Computo</label>
                                        <div class="col-lg-4">
                                            <input class="form-control" value="<%=rset.getString(10)%>" name="campo_8" />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <label class="col-sm-2 control-label">Observaciones</label>
                                        <div class="col-lg-10">
                                            <textarea class="form-control" name="campo_9"  ><%=rset.getString(11)%></textarea>
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
                                            <input class="form-control" value="<%=rset.getString(12)%>" name="campo_10"  />
                                        </div>
                                        <label class="col-sm-2 control-label">Catálogo de 1er nivel medicamento</label>
                                        <div class="col-lg-4">
                                            <input class="form-control" value="<%=rset.getString(13)%>" name="campo_11"  />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <label class="col-sm-2 control-label">Catálogo de 1er nivel mat. curación</label>
                                        <div class="col-lg-4">
                                            <input class="form-control" value="<%=rset.getString(14)%>" name="campo_12"  />
                                        </div>
                                        <label class="col-sm-2 control-label">Último abasto del proveedor actual</label>
                                        <div class="col-lg-4">
                                            <input class="form-control" value="<%=rset.getString(15)%>" name="campo_13"  />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <label class="col-sm-2 control-label">Observaciones</label>
                                        <div class="col-lg-10">
                                            <textarea class="form-control" name="campo_14" ><%=rset.getString(16)%></textarea>
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
                                            <input class="form-control" value="<%=rset.getString(17)%>" name="campo_15" />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <label class="col-sm-2 control-label">Observaciones</label>
                                        <div class="col-lg-10">
                                            <textarea class="form-control" name="campo_16" ><%=rset.getString(18)%></textarea>
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
                                            <textarea class="form-control" name="campo_17" ><%=rset.getString(19)%></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row text-center">
                    <button class="btn btn-block btn-primary" name="accion" value="guardar">Guardar</button>
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
    </body>
    <!-- JAVASCRIPT -->
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.js"></script>
    <script>

    </script>
</html>
