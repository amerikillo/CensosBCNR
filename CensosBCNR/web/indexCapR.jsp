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

    String id_uni = "", juris = "", muni = "", nombre_gnk = "", tipo = "", hora = "", fecha = "", clues = "";
    String modi = "";
    int ban = 0;

    try {
        obj.conectar();
        //int pos2=0;
        qry = "select distinct juris from tb_unidades order by id_uni+0 asc;";
        rset = obj.consulta(qry);
        //obj.cierraConexion();
    } catch (SQLException ex) {
        Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
    }

    try {
        if (request.getParameter("consultar").equals("1")) {
            System.out.println(request.getParameter("slct_U"));
            rset2 = obj.consulta("select id_uni, juris, muni, nombre_gnk, tipo, clues from tb_unidades where nombre_gnk = '" + request.getParameter("slct_U") + "'  ");
            while (rset2.next()) {
                id_uni = rset2.getString(1);
                juris = rset2.getString(2);
                muni = rset2.getString(3);
                nombre_gnk = rset2.getString(4);
                tipo = rset2.getString(5);
                hora = df3.format(new java.util.Date());
                fecha = df2.format(new java.util.Date());
                clues = rset2.getString(6);
                ban = 1;
            }
        }
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
        <meta name="viewport" http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
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
            <div id="forma-login" class="text-center">
                <img src="imagenes/logo_1.jpg" />
            </div>
            <!--div class="row marco" >
                <div class="col-md-4">.col-md-4</div>
                <div class="col-md-4">.col-md-4</div>
                <div class="col-md-4">.col-md-4</div>
            </div-->
            <div id="forma-login" class="marco">
                <form name ="forma-login"  method="post" >
                    <!--label for="username" class="uname" data-icon="u" > Your email or username </label-->
                    <div class="row">
                        <div class="col-md-4"><img src="imagenes/GNKL_Small.JPG" ></div>
                        <div class="col-md-8"><h2>Toma de Censos</h2></div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <span class="input-group-addon"><label class=" glyphicon glyphicon-hand-right"></label></span>
                                <select name="slct_H" id="slct_H" onchange="SelectUni(this.form);" class="form-control">
                                    <option>-- Seleccione Jurisdicci&oacute;n --</option>
                                    <%                                            while (rset.next()) {
                                    %>
                                    <option value="<%=rset.getString("juris")%>"><%=rset.getString("juris")%></option>
                                    <%
                                        }
                                    %>
                                </select> 
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <span class="input-group-addon"><label class="glyphicon glyphicon-header"></label></span>
                                <select name="slct_U" id="slct_U" class="form-control">
                                    <option>-- Seleccione Hospital --</option>
                                </select>
                            </div>
                        </div>
                    </div> 

                    <br>              
                    <button name="consultar" value="1" class="btn btn-primary btn-lg btn-block" type="submit">Consultar</button>
                </form>
                <!--form method="get" action="SubeInfo"> 
                    <button name="subir" value="1" class="btn btn-default btn-lg btn-block" type="submit">Subir Información</button>
                </form-->
            </div>

            <form name ="forma-login" id="forma-login" class="marco" action="CapturaCensos" method="Post" >
                <br>

                <div class="col-lg-12"><h4>Datos de la Unidad a Censar</h4></div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-saved"></label></span>
                            <input type="text" name="id_uni" id="id_uni" class="form-control" placeholder="Clave del Hospital" value="<%=id_uni%>" readonly>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-header"></label></span>
                            <input type="text" name="nombre_gnk" id="nombre_gnk" class="form-control" placeholder="Nombre del Hospital"  value="<%=nombre_gnk%>" readonly>
                        </div>
                    </div>
                </div>



                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-info-sign"></label></span>
                            <input type="text" name="tipo" id="tipo" class="form-control" placeholder="Categor&iacute;a del Hospital" value="<%=tipo%>" readonly>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-hand-right"></label></span>
                            <input type="text" name="juris" id="juris" class="form-control" placeholder="Jurisdicci&oacute;n" value="<%=juris%>" readonly>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-home"></label></span>
                            <input type="text" name="muni" id="muni" class="form-control" placeholder="Municipio" value="<%=muni%>" readonly>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-calendar"></label></span>
                            <input type="text" name="fecha" id="fecha" class="form-control" placeholder="Fecha de Toma del Censo" value="<%=fecha%>" readonly>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-time"></label></span>
                            <input type="text" name="hora" id="hora" class="form-control" placeholder="Hora Inicio de toma del Censo" value="<%=hora%>" readonly>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-copyright-mark"></label></span>
                            <input type="text" name="clues" id="clues" class="form-control" placeholder="CLUES" value="<%=clues%>" readonly>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon"><label class=" glyphicon glyphicon-pencil"></label></span>
                            <select name="encuestador" id="encuestador" class="form-control">
                                <option value = "">Seleccione Encuestador</option>
                                <%
                                    try {
                                        obj.conectar();
                                        ResultSet rset4 = obj.consulta("select nom_com from usuarios where tipo = 'e'");
                                        while (rset4.next()) {
                                            String modi2 = "";
                                            ResultSet rset5 = obj.consulta("select e.encuestador from tb_registro_censos e, tb_unidades u where e.id_uni = u.id_uni and u.nombre_gnk = '" + request.getParameter("slct_U") + "' and seccion = 'INICIO' ");
                                            String encu = " ";
                                            while (rset5.next()) {
                                                encu = rset5.getString(1);
                                                break;
                                            }
                                            System.out.println(encu + rset4.getString(1));
                                            if (encu.equals(rset4.getString(1))) {
                                                modi = "selected";
                                                modi2 = "selected";
                                            }
                                            System.out.println(modi);
                                            out.println("<option " + modi2 + " >" + rset4.getString(1) + "</option>");
                                        }
                                        obj.cierraConexion();
                                    } catch (Exception e) {
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="checkbox">
                    <div class="col-lg-4">
                    </div>
                    <label>
                        Censo de Prueba <input type="checkbox" name="prueba" id="prueba"> 
                    </label>
                </div>

                <br> 
                <%
                    if (ban == 1) {
                        try {
                            if (modi.equals("selected")) {
                %>
                <button name="envio" value = "1" class="btn btn-primary btn-lg btn-block" type="submit" onclick="return valida();">Modificar Censo</button>
                <%
                } else {
                %>
                <button name="envio" value = "1" class="btn btn-primary btn-lg btn-block" type="submit" onclick="return valida();">Realizar Censo</button>
                <%
                    }
                %>             
                <!--button name="envio" value = "1" class="btn btn-primary btn-lg btn-block" type="submit" onclick="return valida();">Realizar Censo</button-->
                <button name="envio" value = "2" class="btn btn-primary btn-lg btn-block" type="submit">Cargar Imagenes</button>
                <%
                        } catch (Exception e) {
                        }
                    }
                %>
                <br>
            </form>
            <br>



        </div>

    </body>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="css/MD5.js"></script>
    <!--script type="text/javascript" src="js/code_js.js"></script-->
</html>
<%
    //sesion.invalidate();
%>

<script>
                                function valida() {
                                    if (document.getElementById('encuestador').value === "") {
                                        alert('Seleccione un encuestador');
                                        return false;
                                    }
                                    return true;
                                }



                                function SelectUni(form) {
    <%
        try {
            obj.conectar();
            ResultSet rset3 = obj.consulta("select DISTINCT juris from tb_unidades order by juris");
            while (rset3.next()) {
                out.println("if (form.slct_H.value == '" + rset3.getString(1) + "') {");
                out.println("var select = document.getElementById('slct_U');");
                out.println("select.options.length = 0;");
                int i = 1;
                ResultSet rset4 = obj.consulta("select nombre_gnk from tb_unidades where juris = '" + rset3.getString(1) + "' and tipo not in ('Hospital general')");
                while (rset4.next()) {
                    out.println("select.options[select.options.length] = new Option('"+i+" " + rset4.getString(1) + "', '" + rset4.getString(1) + "');");
                    i++;
                }
                out.println("}");
            }
            obj.cierraConexion();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    %>
                                    /*if (form.slct_H.value == 'JURISDICCION SANITARIA 1') {
                                     var select = document.getElementById("slct_U");
                                     select.options.length = 0;
                                     select.options[select.options.length] = new Option('CSR CRUZ CHIQUITA', 'CSR CRUZ CHIQUITA');
                                     }*/
                                }
</script>