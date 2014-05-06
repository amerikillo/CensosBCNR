<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conn.ConectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

    DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
    simbolo.setDecimalSeparator('.');
    simbolo.setGroupingSeparator(',');
    DecimalFormat format = new DecimalFormat("###,###.##", simbolo);

    int ban_inv = 0;

    //out.println("select id_uni from inventarios where id_uni = '" + id_uni + "'");
    try {
        con.conectar();
        ResultSet rset = con.consulta("select id_uni from inventarios where id_uni = '" + id_uni + "'");
        while (rset.next()) {
            ban_inv = 1;
        }
        con.cierraConexion();
    } catch (Exception e) {

    }
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <!-- DW6 -->
    <head>
        <!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
        <title>:: CONSULTA DE CENSOS ::</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <!-- Bootstrap core CSS -->
        <link href="css/blueberry2.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!--link href="css/bootstrap-responsive.css" rel="stylesheet" /-->
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css" />
        <link rel="stylesheet" href="css/cupertino/jquery-ui-1.10.3.custom.css" />
        <!--link href="css/demo_table_jui.css" rel="stylesheet" type="text/css" /-->
        <!--link href="css/jumbotron-narrow.css" rel="stylesheet" /-->
        <style type="text/css">
            <!--
            .style1 {
                color: #000000;
                font-weight: bold;
            }
            .style33 {font-size: x-small}
            .style40 {font-size: 9px}
            .style41 {font-size: 9px}
            .style42 {font-family: Arial, Helvetica, sans-serif}
            .style32 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; }
            .style43 {
                font-size: x-small;
                color: #FFFFFF;
                font-weight: bold;
            }
            .style47 {
                font-size: x-small;
                font-weight: bold;
                text-align: center;
            }
            .style49 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; font-weight: bold; }
            .style50 {color: #000000}
            .style51 {color: #BA236A}
            .style58 {font-size: 14px;  font-weight: bold; color: #666666; }
            .style66 {font-size: x-small; font-weight: bold; color: #333333; }
            a:hover {
                color: #333333;
            }
            .style68 {color: #CCCCCC}
            .style75 {color: #333333; }
            a:link {
                color: #711321;
            }
            .style76 {color: #003366}
            .style77 {
                color: #711321;
                font-weight: bold;
            }
            .neg {font-family: Arial, Helvetica, sans-serif;
                  font-size: 14px;
                  font-weight: bold;
                  color: #666;
            }
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
            .bs-example{
                margin: 50px;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li class="active"><a href="indexMain.jsp">Men&uacute;</a></li>
                    <li class=""><a href="estadisticasA.jsp">Ver Estadísticas</a></li>
                    <li class=""><a href="consultaJuris.jsp">Jurisdicciones</a></li>
                    <li><a data-toggle="modal" href="#myModal2">Instrucciones</a></li>
                    <li><a data-toggle="modal" href="#myModal">Sistemas</a></li>
                    <li><a href="salir.jsp">Salir</a></li>
                </ul>
                <h3 class="text-primary"><a name="top" id="top"></a>Consulta de Censos Rurales</h3>
            </div>
        </div>



        <table width="900px" border="0" align="center" cellpadding="0" cellspacing="0">

            <tr>
                <td colspan="12">
                    <!-- Default panel contents -->
                    <h2>Seleccione la Unidad Rural de Consulta</h2>
                </td>
                </td>
            </tr>

            <tr>
                <form method="post" name="form_censos" id="form_censos">
                    <td colspan="7"  class="style58">
                        <!--div class="row">
                            <div class="col-md-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><label class="glyphicon glyphicon-header"></label></span>
                                    <select class="form-control"  name="jurisdiccion" id = "jurisdiccion" onchange="rellenaMunis();">
                                        <option>-- Seleccione Jurisdicción --</option>
                        <%                                            try {
                                con.conectar();
                                int no_jur = 1;
                                ResultSet rset = con.consulta("select u.juris from tb_unidades u, tb_a a where u.id_uni = a.id_uni and a.campo_31!='' group by u.juris order by u.id_uni+0");
                                while (rset.next()) {
                                    //out.println("<option value ='J"+no_jur+"'>"+rset.getString(1)+"</option>");
                                    String var[] = rset.getString(1).split(" ");
                                    out.println("<option value ='" + rset.getString(1) + "'>" + rset.getString(1) + "</option>");
                                    //no_jur++;
                                }
                                //no_jur=0;
                                con.cierraConexion();
                            } catch (Exception e) {
                            }
                        %>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="input-group">
                    <span class="input-group-addon"><label class="glyphicon glyphicon-header"></label></span>
                    <select class="form-control" name="Munis" id="Munis" onchange="rellenaUnis();">
                        <option>-- Seleccione Municipio --</option>
                    </select>
                </div>
            </div>
        </div-->
                        <div class="row">
                            <div class="col-md-8">
                                <div class="input-group">
                                    <span class="input-group-addon"><label class="glyphicon glyphicon-header"></label></span>
                                    <select name="id_uni" id="id_uni" class="form-control">
                                        <option>-- Seleccione Centro de Salud --</option>
                                        <%                                                    con.conectar();
                                            ResultSet rset2 = con.consulta("select t.id_uni, t.nombre_gnk, t.juris from tb_unidades t, tb_a ta where t.id_uni = ta.id_uni and ta.campo_31!='' order by id_uni asc");
                                            while (rset2.next()) {
                                                String pru = "";
                                                ResultSet rsetprueba = con.consulta("select * from tb_prueba where id_uni = '" + rset2.getString("id_uni") + "' ");
                                                while (rsetprueba.next()) {
                                                    pru = " - DE PRUEBA";
                                                }
                                                out.println("<option value = '" + rset2.getString("id_uni") + "'>" + rset2.getString("juris") + " - " + rset2.getString("nombre_gnk") + pru + "</option>");
                                            }
                                            con.cierraConexion();
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <button class="btn btn-primary btn-block">Ver</button>
                            </div>
                        </div>
                    </td>
                </form>
            </tr>
            <tr>
                <td colspan="7"  class="style43 style51"><hr /></td>
            </tr>
            <tr>
                <td colspan="7"  class="style43 style51"></hr></td>
            </tr>
            <tr>
                <td colspan="10"  class="style58">Seleccione Secci&oacute;n
                    <a href="#a"><input name="a" id="btn_aa" data-toggle="tooltip" title="A. DATOS GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="A" /> </a>
                    <a href="#b"><input name="b" id="btn_bb" data-toggle="tooltip" title="B. TAREAS OPERACIONALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="B" /></a>
                    <a href="#c"><input name="c" id="btn_cc" data-toggle="tooltip" title="C. FARMACIA" type="button" data-loading-text="Loading..." class="btn btn-primary" value="C" /></a>
                    <a href="#d"><input name="d" id="btn_dd" data-toggle="tooltip" title="D. ALMACÉN" type="button" data-loading-text="Loading..." class="btn btn-primary" value="D" /></a>
                    <a href="#e"><input name="e" id="btn_ee" data-toggle="tooltip" title="E. EQUIPO DE CÓMPUTO, INTERNET Y TELEFONÍA" type="button" data-loading-text="Loading..." class="btn btn-primary" value="E" /></a>
                    <a href="#f"><input name="f" id="btn_ff" data-toggle="tooltip" title="F. DESCRIBA OBSERVACIONES Y/O COMENTARIOS GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="F" /></a>
                    <a href="#pic"><button name="pic" id="btn_pic" data-toggle="tooltip" title="G. PICTOGRÁFICO" type="button" data-loading-text="Loading..." class="btn btn-primary">PICTOGRÁFICO</button></a>


                    <%
                        String uni_mapa = "";
                        try {
                            con.conectar();
                            ResultSet rset_mapa = con.consulta("select ubi_mapa_1 from tb_mapas where id_uni = '" + id_uni + "' ");
                            while (rset_mapa.next()) {
                                uni_mapa = rset_mapa.getString(1);
                    %>
                    <a href="#mapa"><button name="mapa" id="btn_mapa" data-toggle="tooltip" title="Ver el Mapa" type="button" data-loading-text="Loading..." class="btn btn-primary">VER EN EL MAPA</button></a>
                    <%
                            }
                            con.cierraConexion();
                        } catch (Exception e) {

                        }
                        if (ban_inv == 1) {
                    %>
                    <a href="#inv"><button name="inv" id="btn_inv" data-toggle="tooltip" title="INVENTARIO" type="button" data-loading-text="Loading..." class="btn btn-primary">INVENTARIO</button></a><%
                        }
                    %>
                </td>
            </tr>
            <%
                String enc = "";
                try {
                    con.conectar();
                    try {
                        ResultSet rset_enc = con.consulta("select encuestador from tb_registro_censos where seccion = 'INICIO' and id_uni = '" + id_uni + "' ");
                        while (rset_enc.next()) {
                            enc = rset_enc.getString(1);
                            if (enc.equals("Ricardo Wence")) {
                                enc = "Ricardo Hernandez - Mario García";
                            }
                            if (enc.equals("Ana Gonzlez") || enc.equals("Ana Gonzlez")) {
                                enc = "Ana González - Bernardo Gonzalez";
                            }
                            if (enc.equals("Gerardo Chvez") || enc.equals("Gerardo Chvez")) {
                                enc = "Gerardo Chávez - Edgar Zapata";
                            }
                            if (enc.equals("Roberto Sixtos")) {
                                enc = "Eulises Abad - Roberto Sixtos";
                            }
                        }
                        int banpr = 0;
                        ResultSet rsetprueba = con.consulta("select * from tb_prueba where id_uni = '" + id_uni + "' ");
                        while (rsetprueba.next()) {
                            banpr = 1;
                        }
                        if (banpr == 1) {
            %>
            <tr>
                <td colspan="7"><div class="alert alert-danger">Censo de Prueba</div></td>
            </tr>
            <%
                        }
                    } catch (Exception e) {
                    }
                    con.cierraConexion();
                } catch (Exception e) {
                }
            %>
            <tr>
                <td colspan="12"  class="style58">Elaborado Por: <input name="txtf_elab" id="txtf_elab" type="text" class="form-control neg" onkeypress="return handleEnter(this, event);" size="40" value="GNKL Logística SA de CV - Encuestador: <%=enc%>" readonly /></td>
            </tr>
            <%    con.conectar();
                ResultSet rset = con.consulta("select * from tb_a as a, tb_b as b, tb_c as c, tb_d as d, tb_e as e, tb_f as f, tb_unidades as clave where clave.id_uni=a.id_uni and clave.id_uni=b.id_uni and clave.id_uni=c.id_uni and clave.id_uni=d.id_uni and clave.id_uni=e.id_uni and clave.id_uni=f.id_uni and a.campo_31!='' and  clave.id_uni = '" + id_uni + "';");
                while (rset.next()) {
            %>
            <form  method="post" name="form_a" id="form_account_a" class="form-horizontal" action="GuardaSeccion" >
                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="a" id="a"></a>
                            <!-- Default panel contents -->
                            <div class="panel-heading">A. DATOS GENERALES</div>
                        </div>
                    </td>
                </tr>
                <%                        String nomCam = "campo_", nombreC = "";
                    int contCam = 0;
                %>
                <tr>
                    <td width="118" class="style58"><div align="center">A.1</div></td>
                    <td width="297" class="style58">Nombre de la Unidad</td>
                    <td class="style33">
                        <strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>

                        </strong>
                    </td>   
                    <td>&nbsp;</td>
                    <td width="92" bgcolor="#FFFFFF" class="style58">A.2</td>
                    <td class="style58"><div align="left">Direcci&oacute;n</div></td>
                    <td>             

                        <label>    
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="style58">
                        <div align="center">A.3</div>
                    </td>
                    <td class="style58">Referencias</td>
                    <td><label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);"  readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                    <td>&nbsp;</td>
                    <td bgcolor="#FFFFFF" class="style58">A.4</td>
                    <td class="style58"><div align="left">Colonia</div></td>
                    <td><span class="style49">

                            <label>  <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>

                        </span></td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.5</div></td>
                    <td class="style58">Población</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly ><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>  

                        </strong></td>
                    <td>&nbsp;</td>
                    <td bgcolor="#FFFFFF" class="style58">A.6</td>
                    <td width="281" class="style58"><div align="left">C&oacute;digo Postal</div></td>
                    <td width="400"><span class="style49">

                            <label>   <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>  
                        </span></td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.7</div></td>
                    <td class="style58">CLUES</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>  

                        </strong></td>
                    <td>&nbsp;</td>
                    <td class="style58">A.8</td>
                    <td class="style58"><div align="left">Tel&eacute;fono fijo</div></td>
                    <td class="style58"><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                        <%//out.print(nombreC);%></label>  
                    </td>
                </tr>
                <tr>
                    <td class="style58">
                        <div align="center">A.9</div>
                    </td>
                    <td class="style58">Fax</td>
                    <td class="style33">
                        <strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 

                        </strong>
                    </td>
                    <td>&nbsp;</td>
                    <td bgcolor="#FFFFFF" class="style58">A.10</td>
                    <td class="style58"><div align="left">Correo Electr&oacute;nico</div></td>
                    <td><span class="style49">
                            <label> <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label> 
                        </span>
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.11</div></td>
                    <td class="style58">Jurisdicci&oacute;n Perteneciente</td>
                    <td class="style33">
                        <span class="style49">
                            <label> <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label> 
                        </span>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.12</td>
                    <td class="style58">Coordinaci&oacute;n Municipal</td>
                    <td>
                        <span class="style49">
                            <label> <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label> 
                        </span>  
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.13</div></td>
                    <td class="style58">Municipio</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 

                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.14</td>
                    <td class="style58">N&ordm; de Modulos</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    

                        </p></td>
                </tr>
                <tr>
                    <td class="style58"><p align="center" class="style58">A.15</p></td>
                    <td class="style58">Categor&iacute;a</td>
                    <td class="style33">
                        <strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.16</td>
                    <td class="style58">Nombre del Responsable</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    

                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.17</div></td>
                    <td class="style58">Tel&eacute;fono del Responsable</td>
                    <td class="style33">
                        <strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </strong>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.18</td>
                    <td class="style58">Correo Elect. Responsable</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    

                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.19</div></td>
                    <td class="style58">Nombre del Odont&oacute;logo </td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.20</td>
                    <td class="style58">Poblaci&oacute;n Atendida</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.21</div></td>
                    <td class="style58">N&ordm; de Doctores (Base)</td>
                    <td class="style33">
                        <strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly  ><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </strong>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.22</td>
                    <td class="style58">No. Mapa </td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.23</div></td>
                    <td class="style58">N&ordm; de Pasantes</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>   

                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.24</td>
                    <td class="style58">N&ordm; de Enfermeras</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    

                    </td>
                </tr>
                <tr>
                    <td height="26" class="style58"><div align="center">A.25</div></td>
                    <td class="style58">Horario de Atenci&oacute;n </td>
                    <td class="style33"><strong>
                            <label>
                                <span class="style58">Desde:</span></label>
                            <label for="textfield"></label>
                            <input name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%=nombreC%>" size="7" maxlength="7" value="<%=rset.getString(nombreC)%>" readonly />
                            <%//out.print(nombreC);%></label> 
                            <br />
                            <label><span class="style58">Hasta :</span></label>
                            <input name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%=nombreC%>"   size="7" maxlength="7" value="<%=rset.getString(nombreC)%>" readonly />
                            <label><span class="style58">&nbsp;</span>
                                <%//out.print(nombreC);%></label>   

                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.27</td>
                    <td class="style58">Dias Laborales</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.28</div></td>
                    <td class="style58">¿La Unidad cuenta con Servicios?</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 

                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.29</td>
                    <td class="style58">¿Cu&aacute;ntos Servicios?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">A.30</div></td>
                    <td class="style58">Describa los Servicios</td>
                    <td class="style33"><strong>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 

                        </strong></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">A.31</td>
                    <td class="style58">Clima Predominante</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>

                    <td colspan="7" class="style58">
                        <div class="panel panel-primary">
                            <!-- Default panel contents -->
                            <!--button type="submit" name="guarda_seccion" value="A" class="btn btn-primary btn-lg btn-block" onclick="return validar_a()">Guardar datos Secci&oacute;n A</button-->
                        </div>
                    </td>
                </tr>               
                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="b" id="b"></a>
                            <!-- Default panel contents -->
                            <div class="panel-heading">B. TAREAS OPERACIONALES</div>
                        </div>
                    </td>
                    <td class="style58">&nbsp;</td>
                </tr>

                <tr> 
                    <td class="style58"><div align="center">B.1</div></td>
                    <td class="style58">¿Existe Sistema Inform&aacute;tico de Captura de Recetas?</td>
                    <td>
                        <span class="style49">
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </span>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.2</div></td>
                    <td class="style58">&iquest;Cu&aacute;ntas Recetas Promedio por d&iacute;a se expiden?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    
                    </td>
                </tr>

                <tr>
                    <td class="style58"><div align="center">B.3</div></td>
                    <td class="style58">&iquest;Cuántos medicamentos preescribe en promedio por receta?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.4</div></td>
                    <td class="style58">Describa el proceso de captura de las recetas</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>

                <tr>
                    <td class="style58"><div align="center">B.5</div></td>
                    <td class="style58">¿Cu&aacute;l es el consumo promedio mensual de piezas?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.6</div></td>
                    <td class="style58">N&uacute;mero de Claves Autorizadas para este Centro </td>
                    <td> 
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="style58">
                        <div align="center">B.7</div>
                    </td>
                    <td class="style58">N&uacute;mero de Claves de Material de Curaci&oacute;n Autorizadas para este Centro</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.8</div></td>
                    <td class="style58">&iquest;Cu&aacute;l es el Procedimiento de Reposici&oacute;n de Inventarios?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label></td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">B.9</div></td>
                    <td class="style58">¿Qui&eacute;n surte a esta Unidad de Atenci&oacute;n?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.10</div></td>
                    <td class="style58">¿Con qu&eacute; frecuencia? </td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">B.11</div></td>
                    <td class="style58">¿Cu&aacute;l es el nivel de abasto actual?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.12</div></td>
                    <td class="style58">
                        ¿Realizan inventarios en la unidad? </td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label></td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">B.13</div></td>
                    <td class="style58">¿D&oacute;nde se guarda el insumo?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">B.14</div></td>
                    <td class="style58">¿Esta unidad esta certificada? </td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">B.15</div></td>
                    <td width="297" class="style58">Fecha de &uacute;ltima visita de Abasto</td>
                    <td width="369" class="style58">
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label> 
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="7" class="style58">
                        <div class="panel panel-primary">
                            <a name="b" id="b"></a>
                            <!-- Default panel contents -->
                            <!--button type="submit" name="guarda_seccion" value="B" class="btn btn-primary btn-lg btn-block" onclick="return validar_b()">Guardar datos Secci&oacute;n B</button-->
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="c" id="c"></a>
                            <!-- Default panel contents -->

                            <div class="panel-heading">C. FARMACIA</div>
                        </div>
                    </td>
                    <td class="style58">&nbsp;</td>
                </tr>
                <tr>
                    <td height="26" class="style47"><div align="center" class="style58">C.1</div></td>
                    <td class="style58">¿Cuenta con Farmacia?</td>
                    <td><span class="style58">
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>   
                        </span>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">C.2</div></td>
                    <td class="style58">¿Maneja Controlados?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    
                    </td>
                </tr>

                <tr>
                    <td class="style47"><div align="right" class="style77"><a href="consulta_cens.jsp" class="styl e77"></a>
                            <div align="center" class="style58">C.3</div>
                        </div>
                    </td>
                    <td class="style58">Horario de atenci&oacute;n</td>
                    <td><span class="style58">De:</span>
                        <input name="<%=nombreC = nomCam + (contCam += 1)%>" type="text" class="form-control"  id="<%=nombreC%>" size="5" maxlength="5" onkeypress="return handleEnter(this, event);" value="<%=rset.getString(nombreC)%>" readonly />
                        <%//out.print(nombreC);%></label> 
                        <br />
                        <span class="style58">A:</span>
                        <input name="<%=nombreC = nomCam + (contCam += 1)%>"  type="text" class="form-control"  id="<%=nombreC%>" size="5" maxlength="5" onkeypress="return handleEnter(this, event);" value="<%=rset.getString(nombreC)%>" readonly />
                        <%//out.print(nombreC);%></label> 
                        </label></td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">C.4</div></td>
                    <td class="style58">¿Qui&eacute;n atiende la farmacia?</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    
                    </td>
                </tr>
                <tr>
                    <td class="style47"><div align="center" class="style58">C.5</div></td>
                    <td class="style58">N&ordm;  de Anaqueles</td>
                    <td>
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>  
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">C.6</div></td>
                    <td class="style58">Espacio aprox en mts2 de la Farmacia </td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>    
                    </td>
                </tr>
                <tr>
                    <td class="style47"><div align="center" class="style58">C.7</div></td>
                    <td class="style58">¿Cuenta con red fr&iacute;a?</td>
                    <td class="style58"><label>
                            <label>  <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 
                    </td>
                    <td class="hidden">&nbsp;</td>
                    <td class="hidden"><div align="center" class="style58">C.8</div></td>
                    <td class="hidden">Fecha de Ultima Visita Proveedor Actual</td>
                    <td> <label><textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control hidden" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                </tr>

                <tr>

                    <td colspan="7" class="style58">
                        <div class="panel panel-primary">
                            <a name="c" id="c"></a>
                            <!-- Default panel contents -->
                            <!--button type="submit" name="guarda_seccion" value="C" class="btn btn-primary btn-lg btn-block" onclick="return validar_c()">Guardar datos Secci&oacute;n C</button-->
                        </div>
                    </td>

                </tr>

                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="d" id="d"></a>
                            <!-- Default panel contents -->
                            <div class="panel-heading">D. ALMAC&Eacute;N</div>
                        </div>
                    </td>
                    <td class="style58">&nbsp;</td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">D.1</div></td>
                    <td class="style58">¿Cuenta con &aacute;rea de almac&eacute;n?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">D.2</div></td>
                    <td class="style58">Horario de atenci&oacute;n</td>
                    <td><p>&nbsp;</p>
                        <div align="left"><span class="style58">De:</span>
                            <input name="<%=nombreC = nomCam + (contCam += 1)%>" type="text" class="form-control"  id="<%=nombreC%>" size="7" maxlength="7" value="<%=rset.getString(nombreC)%>" readonly />
                            <%//out.print(nombreC);%>
                            <br />
                            <strong>A:
                                <input name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%=nombreC%>" size="7" maxlength="7" value="<%=rset.getString(nombreC)%>" readonly />
                                <%//out.print(nombreC);%>
                            </strong>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">D.3</div></td>
                    <td class="style58">Espacio aprox en mts2 del Almac&eacute;n</td>
                    <td><label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">D.4</div></td>
                    <td class="style58">N&uacute;mero de Anaqueles o Racks en Almacen</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>
                    <td class="style58"><div align="center">D.5</div></td>
                    <td class="style58">¿C&oacute;mo surten los Insumos M&eacute;dicos en el Almac&eacute;n?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58"><div align="center">D.6</div></td>
                    <td class="style58">¿Cuentan con &Aacute;rea para carga y descarga en el Almac&eacute;n?</td>
                    <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%></label>    
                    </td>
                </tr>
                <tr>
                    <td class="hidden"><div align="center">D.7</div></td>
                    <td width="297" class="hidden">Fecha de Ultima Visita Proveedor Actual</td>
                    <td width="369" class="hidden">
                        <label>
                            <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control hidden" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label> 
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">&nbsp;</td>
                    <td class="style58">&nbsp;</td>
                </tr>   

                <tr>

                    <td colspan="7" class="style58">
                        <div class="panel panel-primary">
                            <a name="d" id="d"></a>
                            <!-- Default panel contents -->
                            <!--button type="submit" name="guarda_seccion" value="D" class="btn btn-primary btn-lg btn-block" onclick="return validar_d()">Guardar datos Secci&oacute;n D</button-->
                        </div>
                    </td>
                </tr>   
                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="e" id="e"></a>
                            <!-- Default panel contents -->
                            <div class="panel-heading">E. EQUIPO DE C&Oacute;MPUTO, INTERNET Y TELEFON&Iacute;A</div>
                        </div>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <td>
                    </td>
                </tr>

                <tr>     
                    <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                            <div align="center">E.1</div>
                        </div>
                    </td>
                    <td bgcolor="#FFFFFF" class="style58"> <strong class="neg">¿Cuenta con equipo de C&oacute;mputo?</strong></td>
                    <td class="style58">
                        <label>  <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                            <%//out.print(nombreC);%>
                        </label> 
                    </td>
                    <td class="style58"></td>
                    <td class="style58"><div align="center" class="style58">

                        </div></td>

                    <td>
                        <tr>
                            <td class="style58" colspan="5">E.2 Equipo de Cómputo:</td>
                        </tr>
                        <tr> 
                            <td colspan="2">
                                <div align="center" class="style58">
                                    <div align="center">
                                        <p>
                                            <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" value="<%=rset.getString(nombreC)%>" id="<%=nombreC%>" size="3" maxlength="3"  class="form-control" readonly />
                                            <strong class="neg">CPU</strong></p>
                                            <%//out.print(nombreC);%>
                                    </div>
                                </div>
                            </td>
                            <td colspan="2">
                                <div align="center" class="style58">
                                    <div align="center">
                                        <p>
                                            <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" value="<%=rset.getString(nombreC)%>" id="<%=nombreC%>" size="3" maxlength="3" class="form-control" readonly />
                                            <strong class="neg">Monitor</strong>           </p>
                                            <%//out.print(nombreC);%>
                                    </div>
                                </div>
                            </td>
                            <td colspan="2">
                                <div align="center" class="style58">
                                    <div align="center">
                                        <p>
                                            <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" value="<%=rset.getString(nombreC)%>" id="<%=nombreC%>" size="3" maxlength="3"  class="form-control" readonly />
                                            <strong class="neg">Impresora</strong>                </p>
                                            <%//out.print(nombreC);%>
                                    </div>
                                </div>
                            </td>
                            <td colspan="3">
                                <div align="center" class="style58">
                                    <div align="center">
                                        <p>
                                            <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" value="<%=rset.getString(nombreC)%>" id="<%=nombreC%>" size="3" maxlength="3" class="form-control" readonly />
                                            <strong class="neg">No-Break</strong></p>
                                            <%//out.print(nombreC);%>
                                    </div>
                                </div>
                            </td>
                        </tr>


                    </td>
                    <tr>
                        <td bgcolor="#FFFFFF" class="style68"><div align="center" class="style58">
                                <div align="center">E.3</div>
                            </div>
                        </td>
                        <td bgcolor="#FFFFFF" class="style58">¿Cuenta con conexi&oacute;n a la Internet?</td>
                        <td class="style58">
                            <span class="style47">
                                <label> <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                    <%//out.print(nombreC);%>
                                </label>
                            </span>
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center" class="style58">
                                <div align="center">E.4</div>
                            </div>
                        </td>
                        <td class="style58">Se&ntilde;al de Telefon&iacute;a Celular</td>
                        <td> 
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>    
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#FFFFFF" class="style68">
                            <div align="center" class="style58">
                                <div align="center">E.5</div>
                            </div>
                        </td>
                        <td bgcolor="#FFFFFF" class="style58">&iquest;Cu&aacute;l (es)?</td>
                        <td class="style58">
                            <label> <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label> 
                        </td>
                        <td class="style58">&nbsp;</td>
                    </tr>   

                    <td colspan="7" class="style58">
                        <div class="panel panel-primary">
                            <a name="d" id="d"></a>
                            <!-- Default panel contents -->
                            <!--button type="submit" name="guarda_seccion" value="E" class="btn btn-primary btn-lg btn-block" onclick="return validar_e()">Guardar datos Secci&oacute;n E</button-->
                        </div>
                    </td>
                </tr>   
                <tr>
                    <td colspan="3" class="style58">
                        <div class="panel panel-primary">
                            <a name="f" id="f"></a>
                            <!-- Default panel contents -->
                            <div class="panel-heading">F.DESCRIBA OBSERVACIONES Y/O COMENTARIOS GENERALES</div>
                        </div>
                    </td>
                    <td class="style58">&nbsp;</td>
                    <!-- Preguntas Censos Plus Ver-->
                    <tr>
                        <td colspan="7" class="style47">
                            <div align="center">
                                <strong>
                                    <span class="style41">
                                        <strong>
                                            <span class="style58">
                                                <strong>
                                                    <label>  <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="140" rows="10" class="form-control style58" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" readonly><%=rset.getString(nombreC)%></textarea>
                                                        <%//out.print(nombreC);%>
                                                    </label>
                                                </strong>
                                            </span>
                                        </strong>
                                    </span>
                                </strong>
                            </div>
                        </td>

                    </tr>

                    <tr>
                        <td colspan="7" class="style58">
                            <div class="panel panel-primary">
                                <a name="d" id="d"></a>
                                <!-- Default panel contents -->
                                <!--button type="submit" name="guarda_seccion" value="F" class="btn btn-primary btn-lg btn-block" onclick="return validar_f()">Guardar datos Secci&oacute;n F</button-->
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10" >
                            <div class="panel panel-primary">
                                <a name="f" id="f"></a>
                                <!-- Default panel contents -->
                                <div class="panel-heading">PICTOGRÁFICO</div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="10" >

                            <div class="col-lg-12">
                                <div class="blueberry">
                                    <a name="pic" id="pic"></a>
                                    <ul class="slides">
                                        <%
                                            try {
                                                con.conectar();

                                                //out.print(qery);
                                                ResultSet rsetimg = con.consulta("select imagen from tb_imagenes where id_uni = '" + id_uni + "'");
                                                while (rsetimg.next()) {
                                                    out.print("<li><img src='imagenes/" + id_uni + "/" + rsetimg.getString("imagen") + "' /></li>");
                                                }
                                                con.cierraConexion();
                                            } catch (Exception e) {
                                            }
                                        %> 
                                    </ul>
                                </div>
                            </div>
                        </td>
                    </tr>


                    <%
                        if (!uni_mapa.equals("")) {
                    %>
                    <tr>
                        <td colspan="12">
                            <div class="panel panel-primary">

                                <a name='mapa'></a>
                                <!-- Default panel contents -->
                                <div class="panel-heading">Mapa</div>
                            </div>
                        </td>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10" >
                            <%
                                try {
                                    con.conectar();
                                    ResultSet rset_mapa = con.consulta("select ubi_mapa_1, ubi_mapa_2 from tb_mapas where id_uni = '" + request.getParameter("id_uni") + "' ");
                                    while (rset_mapa.next()) {
                            %>
                            <iframe width="900" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="<%=rset_mapa.getString(1)%>"></iframe><br /><small><a href="<%=rset_mapa.getString(2)%>" style="color:#0000FF;text-align:left" target="_blank">Ver mapa más grande</a></small>
                                <%
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {

                                    }
                                %>
                        </td>
                    </tr>
                    <%
                        }
                    %>

                    <%
                        if (ban_inv == 1) {
                    %>
                    <tr>
                        <td colspan="10" >
                            <div class="panel panel-primary">

                                <a name="inv" id="inv"></a>
                                <!-- Default panel contents -->
                                <div class="panel-heading">INVENTARIO</div>
                            </div>
                        </td>
                    </tr>
                    <%                        String canti = "", fecha = "";
                        try {
                            con.conectar();
                            ResultSet rset_inv = con.consulta("select u.nombre_gnk, i.fecha, sum(i.cant) as cant from tb_unidades u, inventarios i where i.id_uni = '" + id_uni + "' and u.id_uni = i.id_uni");
                            while (rset_inv.next()) {
                                fecha = rset_inv.getString("fecha");
                                canti = rset_inv.getString("cant");
                                canti = "" + format.format(Integer.parseInt(canti));
                            }
                            con.cierraConexion();
                        } catch (Exception e) {
                        }
                    %>
                    <tr>
                        <td colspan="10" >
                            <div class="form-group form-horizontal">

                                <div class="col-sm-3 form-horizontal">
                                    Cantidad de piezas
                                </div>
                                <div class="col-sm-2">
                                    <input class="form-control" type="text" value="<%=canti%>" />
                                </div>
                                <div class="col-sm-3 form-horizontal">
                                    Fecha de Captura
                                </div>
                                <div class="col-sm-2">
                                    <input class="form-control" type="text" value="<%=fecha%>" />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10" >
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="dataTable">
                                <thead>
                                    <th width="7%" class="FECHA" >CLAVE</th>
                                    <th width="51%" class="FECHA">DESCRIPCI&Oacute;N</th>
                                    <!--th width="16%" class="FECHA">CADUCIDAD</th-->
                                    <th width="12%" class="FECHA">EXISTENCIAS</th>
                                </thead>
                                <tbody>
                                    <!--Loop start, you could use a repeat region here-->
                                    <%                        try {
                                            con.conectar();
                                            ResultSet rset_inv = con.consulta("select i.cla_pro, i.lot_pro, i.cad_pro, sum(i.cant) as cant, c.descrip from inventarios i, clave_med c where i.cla_pro = c.clave and i.id_uni = '" + id_uni + "' group by i.cla_pro, i.lot_pro, i.cad_pro, order by i.cla_pro+0");
                                            while (rset_inv.next()) {
                                    %>
                                    <tr height="20">
                                        <td class="negritas" align="center"><%=rset_inv.getString("cla_pro")%></td>
                                        <td class="negritas" ><%=rset_inv.getString("descrip")%></td>
                                        <!--td class="negritas" align="center"><%=rset_inv.getString("cad_pro")%></td-->
                                        <td colspan="3" align="center" class="negritas"><%=format.format(Integer.parseInt(rset_inv.getString("cant")))%></td>
                                    </tr>
                                    <%
                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {

                                        }
                                    %>
                                    <!--Loop end-->
                                </tbody>
                            </table>
                        </td>
                    </tr>


                    <%
                            }

                        }
                        con.cierraConexion();
                    %>
            </form>      

            <td colspan="7" class="style47">
                <strong class="neg">DERECHOS RESERVADOS GNKL/DESARROLLOS WEB &reg; 2009 - 2014</strong></td>
            </tr>
            <!-- 
                                                           Mensaje de Acerca de...
            -->
            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">INSTRUCCIONES DE CONSULTA</h4>
                        </div>
                        <div class="modal-body">
                            <img src="imagenes/GNKL_Small.JPG" />Previamente debes de checar que haya conexi&oacute;n a Internet<br>
                                <ul>
                                    <li>Seleccione la Unidad a consultar, y a continuación de clic en el boton "Ver"</li>
                                </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            <!--button type="button" class="btn btn-primary">Guardar Info</button-->
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->


            <!-- 
             fin Mensaje de Acerca de...
            -->                            
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Ingresa tus Datos</h4>
                        </div>
                        <div class="modal-body">
                            <form name="form_com" method="post" id="form_com">
                                Nombre: <input type="text" class="form-control" autofocus placeholder="Ingrese su Nombre" name="txtf_nom" id="txtf_nom" />
                                Cuenta de Correo: <input type="text" class="form-control"  placeholder="Ingrese su Cuenta de Correo" name="txtf_cor" id="txtf_cor" onblur="validarEmail(this.form.txtf_cor.value);" />
                                Deje su Comentario: <textarea name="txta_com" cols="10" rows="5" class="form-control" id="txta_com"></textarea>
                                <div class="modal-footer">

                                    <input type="submit" class="btn btn-primary" value="Guardar" id="btn_com" onClick="return verificaCom(document.forms.form_com);" />
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                </div>

                            </form>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </table>
        <a href="#" class="scrollup">Scroll</a>
    </body>
</html>
<!-- SlidesJS Required: Initialize SlidesJS with a jQuery doc ready -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="//code.jquery.com/jquery.js"></script>
<!--script src="js/bootstrap-modal.js"></script-->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<!--script src="js/bjqs-1.3.min.js"></script-->
<script src="js/jquery-ui-1.10.3.custom.js"></script>
<!--script src="js/libs/jquery.secret-source.min.js"></script-->
<script src="js/jquery.blueberry.js"></script>
<script src="js/jquery.dataTables.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script>
                                        $(document).ready(function() {
                                            $('#dataTable').dataTable();
                                        });
</script>
<script>
    $(window).load(function() {
        $('.blueberry').blueberry();
    });
</script>
<!-- End SlidesJS Required -->
<script>
    function abrirVentana(url) {
        //alert(url);
        window.open(url, "nuevo", "directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no, width=900, height=600");
    }
    function rellenaMunis() {
        //alert('hola');
        var juris = document.getElementById('jurisdiccion').value;
        //alert('hola');
        removeAllOptions(document.getElementById('Munis'));
        addOption(document.getElementById('Munis'), '', 'Seleccione un Municipio');
    <%
        try {
            con.conectar();
            ResultSet rset_jur = con.consulta("select u.juris from tb_unidades u, tb_a a where u.id_uni = a.id_uni and a.campo_31!='' group by u.juris order by u.id_uni+0");
            while (rset_jur.next()) {
                System.out.println("if (document.getElementById('jurisdiccion').value === '" + rset_jur.getString(1) + "') {");
                out.println("if (document.getElementById('jurisdiccion').value === '" + rset_jur.getString(1) + "') {");
                ResultSet rset_mun = con.consulta("select u.muni from tb_unidades u, tb_a a where u.id_uni = a.id_uni and a.campo_31!='' and juris='" + rset_jur.getString(1) + "' group by u.muni order by u.id_uni+0");
                while (rset_mun.next()) {
                    System.out.println("addOption(document.getElementById('Munis'), '" + rset_mun.getString("muni") + "', '" + rset_mun.getString("muni") + "');");
                    out.println("addOption(document.getElementById('Munis'), '" + rset_mun.getString("muni") + "', '" + rset_mun.getString("muni") + "');");
                }
                System.out.println("}");
                out.println("}");
            }
            con.cierraConexion();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    %>
    }



    function rellenaUnis() {
        //alert('hola');
        var juris = document.getElementById('Munis').value;
        //alert(juris);
        removeAllOptions(document.getElementById('id_uni'));
        addOption(document.getElementById('id_uni'), '', 'Seleccione una Unidad');
    <%
        try {
            con.conectar();
            ResultSet rset_jur = con.consulta("select u.muni from tb_unidades u, tb_a a where u.id_uni = a.id_uni and a.campo_31!='' group by u.muni order by u.id_uni+0");
            while (rset_jur.next()) {
                System.out.println("if (document.getElementById('Munis').value === '" + rset_jur.getString(1) + "') {");
                out.println("if (document.getElementById('Munis').value === '" + rset_jur.getString(1) + "') {");
                ResultSet rset_mun = con.consulta("select u.id_uni, u.nombre_gnk from tb_unidades u, tb_a a where u.id_uni = a.id_uni and a.campo_31!='' and muni='" + rset_jur.getString(1) + "' group by u.muni order by u.id_uni+0");
                while (rset_mun.next()) {
                    System.out.println("addOption(document.getElementById('id_uni'), '" + rset_mun.getString("id_uni") + "', '" + rset_mun.getString("nombre_gnk") + "');");
                    out.println("addOption(document.getElementById('id_uni'), '" + rset_mun.getString("id_uni") + "', '" + rset_mun.getString("nombre_gnk") + "');");
                }
                System.out.println("}");
                out.println("}");
            }
            con.cierraConexion();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    %>
    }


    function removeAllOptions(selectbox)
    {
        var i;
        for (i = selectbox.options.length - 1; i >= 0; i--)
        {
            //selectbox.options.remove(i);
            selectbox.remove(i);
        }
    }


    function removeAllOptions(selectbox)
    {
        var i;
        for (i = selectbox.options.length - 1; i >= 0; i--)
        {
            //selectbox.options.remove(i);
            selectbox.remove(i);
        }
    }

    function addOption(selectbox, value, text)
    {
        var optn = document.createElement("OPTION");
        optn.text = text;
        optn.value = value;
        selectbox.options.add(optn);
        //putString(optn.valueoptions
        // var cad2= document.form1.SubCat.value;

    }
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#form').submit(function() {

            //alert("Ingresó");
            return false;
        });
        $('#form_com').submit(function() {
            //alert("huges");
            return false;
        });
        $("#btn_com").click(function() {

            var nom = $('#txtf_nom').val();
            var cor = $('#txtf_cor').val();
            var com = $('#txta_com').val();
            //alert(id+" "+id);
            if (nom == '' || cor == '' || com == '') {
                return false;
            }
            else {
                var dataString = $('#form_com').serialize();
                //alert('Datos serializados: '+dataString);
                var dir = 'servletCorreo';
                $.ajax({
                    url: dir,
                    type: "POST",
                    data: dataString,
                    success: function(data) {
                        alert("Sus datos han sido Enviados");
                        location.reload();
                        //$("#form_com").fadeOut("slow");
                        /*$('#txtf_nom').value='huge';
                         $('#txtf_cor').value='';
                         $('#txta_com').value='';*/
                    },
                });
            }
        });
    });</script>
<script>
    $(document).ready(function() {
        $('.carousel').carousel({
            interval: 3000
        });
    });</script>
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
    });</script>
<script type="text/javascript">
    $(function() {
        $(".popover-examples a").popover({
            title: 'Default title value'
        });
    });
</script>